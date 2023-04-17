Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794B28460
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26519C433D2
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681742118;
	bh=FIWyYAJoFLNzubufyJGcuwfKe6whXu7xJUMVTacJvYY=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=o2QLl5IAr+Fnx7JqvtoaedYMDlM9vLG6C84b4PdFsndUdAJjVIw2kRN4mpPOTphlo
	 2AysVc2yqiy+XuEqWXZsjVgbdfFGYpvaRf9EB508twYnA8yY+EyowrpDzkmbUT8/ne
	 DuvqpkWkIOMapNYdBMKUk72dMtRmeLCMI1spt1iuv+DA5WKBI57Uo2p7QFMrbtRdd4
	 ZMm1tRNE8XCaZr6WEaFBiuLz9qHdTIkPB2OWx42RGGpKSLAekqtqXlDRA/D5unvpHq
	 1iOjfit6Gd9OaRAuSiFQz+joUC5QWJ5D6fFN/6cWCFNxTdshX1DXMgEqKn4kQnavbb
	 4wcnSG4HaMWSQ==
Subject: [PATCH RFC 4/5] tlshd: Fix server-side peer hostname validation
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Mon, 17 Apr 2023 10:35:17 -0400
Message-ID: 
 <168174211710.9615.15728539064593664118.stgit@91.116.238.104.host.secureserver.net>
In-Reply-To: 
 <168174201703.9615.15054227659982658294.stgit@91.116.238.104.host.secureserver.net>
References: 
 <168174201703.9615.15054227659982658294.stgit@91.116.238.104.host.secureserver.net>
User-Agent: StGit/1.5
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Chuck Lever <chuck.lever@oracle.com>

John says:
> ... you're getting the peer's name from its IP address. That's not
> going to work. What one commonly does is get the peer's name from
> the peer and check that the cert is valid for that name _and_ that
> an IP address for that name address matches the peer's IP address.

In other words, tlshd shouldn't use a DNS-acquired peername for
certificate validation. Instead, rely on SNI.

Suggested-by: John Haxby <john.haxby@oracle.com>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/server.c |   34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index 3e2cd6379b8d..3532dfc4c369 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -30,6 +30,7 @@
 #include <stdio.h>
 #include <errno.h>
 #include <keyutils.h>
+#include <netdb.h>
 
 #include <gnutls/gnutls.h>
 #include <gnutls/abstract.h>
@@ -125,21 +126,42 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
  * tlshd_server_x509_verify_function - Verify remote's x.509 certificate
  * @session: session in the midst of a handshake
  *
- * Return values:
- *   %0: Incoming certificate has been successfully verified
- *   %GNUTLS_E_CERTIFICATE_ERROR: certificate verification failed
+ * A return value of %GNUTLS_E_SUCCESS indicates that the TLS session
+ * has been allowed to continue. tlshd either sets the peerid array if
+ * the presented certificate has been successfully verified, or the
+ * peerid array is left empty if no peer information was available to
+ * perform verification. The kernel consumer can apply a security policy
+ * based on this information.
+ *
+ * A return value of %GNUTLS_E_CERTIFICATE_ERROR means that certificate
+ * verification failed.
  */
 static int tlshd_server_x509_verify_function(gnutls_session_t session)
 {
 	struct tlshd_handshake_parms *parms;
 	const gnutls_datum_t *peercerts;
 	unsigned int i, status;
+	char hostname[NI_MAXHOST];
 	gnutls_datum_t out;
 	int type, ret;
+	size_t len;
 
 	parms = gnutls_session_get_ptr(session);
 
-	ret = gnutls_certificate_verify_peers3(session, NULL, &status);
+	len = sizeof(hostname);
+	ret = gnutls_server_name_get(session, hostname, &len, &i, 0);
+	switch (ret) {
+	case GNUTLS_E_SUCCESS:
+		break;
+	case GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE:
+		tlshd_log_debug("The peer offered no SNI hostname.");
+		return GNUTLS_E_SUCCESS;
+	default:
+		tlshd_log_gnutls_error(ret);
+		return GNUTLS_E_CERTIFICATE_ERROR;
+	}
+
+	ret = gnutls_certificate_verify_peers3(session, hostname, &status);
 	switch (ret) {
 	case GNUTLS_E_SUCCESS:
 		break;
@@ -181,7 +203,7 @@ static int tlshd_server_x509_verify_function(gnutls_session_t session)
 		gnutls_x509_crt_init(&cert);
 		gnutls_x509_crt_import(cert, &peercerts[i], GNUTLS_X509_FMT_DER);
 		parms->remote_peerid[i] =
-			tlshd_keyring_create_cert(cert, parms->peername);
+			tlshd_keyring_create_cert(cert, hostname);
 		gnutls_x509_crt_deinit(cert);
 	}
 
@@ -224,8 +246,6 @@ static void tlshd_server_x509_handshake(struct tlshd_handshake_parms *parms)
 	gnutls_transport_set_int(session, parms->sockfd);
 	gnutls_session_set_ptr(session, parms);
 
-	gnutls_server_name_set(session, GNUTLS_NAME_DNS,
-			       parms->peername, strlen(parms->peername));
 	gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
 	gnutls_certificate_set_verify_function(xcred,
 					       tlshd_server_x509_verify_function);



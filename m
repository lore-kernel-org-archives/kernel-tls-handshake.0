Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287628460
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8FDC433D2
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681742111;
	bh=cpKK8kgU7c76lgflzwQcqlAufdIeJbQbFEXPI83L0QE=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=BnLbgarK23JiV0AIisrMMYjbb6wBgnp3l2g+vaWasv1fafu2B2gzeg3KGCS9oWXcL
	 UYpu9Y+XlkPMnMtp0Ur7lNh6a3p7f5vN8qht4ioUPwFkz05FROiSaIG//yvICPc/8L
	 cM93EMxvXePm0wyVTW+PepaDQSAwTVNMc085Zd1cn/YyPf9g8v2NitZr37FWN0+3TA
	 36TWQZJ0rusokIk8jlNiNELelqDOaN38ZNqQJUQVSuLyV2dKWweLee05a7B0DPHq+M
	 2tyS4po4pxhxXYlI7Aa1yvtsbb9EE2SioHxRaAaGs6g5PV5/C2HyE3hFsSdMgANE0P
	 9rUvr05KXLV/Q==
Subject: [PATCH RFC 3/5] tlshd: Pass tlshd_parameters to the verification
 functions
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Mon, 17 Apr 2023 10:35:10 -0400
Message-ID: 
 <168174211085.9615.16504385081012512858.stgit@91.116.238.104.host.secureserver.net>
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

I misunderstood the gnutls_session_get_ptr(3) API, possibly because
many code examples I've audited (ab)use it without context or
explanation.

When used it properly, the full set of handshake parameters can be
passed into the verification functions so the global variables can
be replaced.

Note that, because tlshd never called gnutls_session_set_ptr(3),
@hostname was always set to NULL. That means tlshd in ktls-utils-0.8
always skipped the hostname part of certificate verification.

The peername returned by DNS is fairly likely not to match the
SubjectName in the certificate in many circumstances. To prevent
breakage, we'll pass NULL explicitly to
gnutls_certificate_verify_peers3() for the moment until we can get a
real non-DNS-based hostname for certificate verification.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/client.c |   37 ++++++++++++++++---------------------
 src/tlshd/server.c |   40 ++++++++++++++++++++--------------------
 src/tlshd/tlshd.h  |    2 +-
 3 files changed, 37 insertions(+), 42 deletions(-)

diff --git a/src/tlshd/client.c b/src/tlshd/client.c
index 46a973f4393c..1a9916d763c5 100644
--- a/src/tlshd/client.c
+++ b/src/tlshd/client.c
@@ -43,9 +43,6 @@
 #include "tlshd.h"
 #include "netlink.h"
 
-static unsigned int tlshd_num_remote_peerids;
-static key_serial_t tlshd_remote_peerid[10];
-
 static void tlshd_client_set_sni_hostname(gnutls_session_t session)
 {
 	char buf[NI_MAXHOST];
@@ -215,15 +212,15 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
  */
 static int tlshd_client_x509_verify_function(gnutls_session_t session)
 {
+	struct tlshd_handshake_parms *parms;
 	const gnutls_datum_t *peercerts;
 	unsigned int i, status;
-	const char *hostname;
 	gnutls_datum_t out;
 	int type, ret;
 
-	hostname = gnutls_session_get_ptr(session);
+	parms = gnutls_session_get_ptr(session);
 
-	ret = gnutls_certificate_verify_peers3(session, hostname, &status);
+	ret = gnutls_certificate_verify_peers3(session, NULL, &status);
 	if (ret != GNUTLS_E_SUCCESS) {
 		tlshd_log_gnutls_error(ret);
 		return GNUTLS_E_CERTIFICATE_ERROR;
@@ -242,23 +239,24 @@ static int tlshd_client_x509_verify_function(gnutls_session_t session)
 	 * via a netlink attribute. */
 
 	peercerts = gnutls_certificate_get_peers(session,
-						 &tlshd_num_remote_peerids);
-	if (!peercerts || tlshd_num_remote_peerids == 0) {
+						 &parms->num_remote_peerids);
+	if (!peercerts || parms->num_remote_peerids == 0) {
 		tlshd_log_debug("The peer cert list is empty.\n");
                 return GNUTLS_E_CERTIFICATE_ERROR;
 	}
 
-	tlshd_log_debug("The peer offered %d certificate(s).\n",
-			tlshd_num_remote_peerids);
+	tlshd_log_debug("The peer offered %u certificate(s).\n",
+			parms->num_remote_peerids);
 
-	if (tlshd_num_remote_peerids > ARRAY_SIZE(tlshd_remote_peerid))
-		tlshd_num_remote_peerids = ARRAY_SIZE(tlshd_remote_peerid);
-	for (i = 0; i < tlshd_num_remote_peerids; i++) {
+	if (parms->num_remote_peerids > ARRAY_SIZE(parms->remote_peerid))
+		parms->num_remote_peerids = ARRAY_SIZE(parms->remote_peerid);
+	for (i = 0; i < parms->num_remote_peerids; i++) {
 		gnutls_x509_crt_t cert;
 
 		gnutls_x509_crt_init(&cert);
 		gnutls_x509_crt_import(cert, &peercerts[i], GNUTLS_X509_FMT_DER);
-		tlshd_remote_peerid[i] = tlshd_keyring_create_cert(cert, hostname);
+		parms->remote_peerid[i] =
+			tlshd_keyring_create_cert(cert, parms->peername);
 		gnutls_x509_crt_deinit(cert);
 	}
 
@@ -299,12 +297,12 @@ static void tlshd_client_x509_handshake(struct tlshd_handshake_parms *parms)
 		goto out_free_creds;
 	}
 	gnutls_transport_set_int(session, parms->sockfd);
+	gnutls_session_set_ptr(session, parms);
 
 	tlshd_client_set_sni_hostname(session);
 	gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
 	gnutls_certificate_set_verify_function(xcred,
 					       tlshd_client_x509_verify_function);
-	gnutls_session_set_verify_cert(session, parms->peername, 0);
 
 	tlshd_start_tls_handshake(session, parms);
 
@@ -356,14 +354,15 @@ static void tlshd_client_psk_handshake_one(struct tlshd_handshake_parms *parms,
 		goto out_free_creds;
 	}
 	gnutls_transport_set_int(session, parms->sockfd);
+	gnutls_session_set_ptr(session, parms);
 	gnutls_credentials_set(session, GNUTLS_CRD_PSK, psk_cred);
 
 	tlshd_log_debug("start ClientHello handshake");
 	tlshd_start_tls_handshake(session, parms);
 	if (!parms->session_status) {
 		/* PSK uses the same identity for both client and server */
-		tlshd_remote_peerid[0] = peerid;
-		tlshd_num_remote_peerids = 1;
+		parms->num_remote_peerids = 1;
+		parms->remote_peerid[0] = peerid;
 	}
 
 	gnutls_deinit(session);
@@ -429,10 +428,6 @@ void tlshd_clienthello_handshake(struct tlshd_handshake_parms *parms)
 		tlshd_log_debug("Unrecognized auth mode (%d)",
 				parms->auth_mode);
 	}
-	if (tlshd_num_remote_peerids) {
-		parms->num_remote_peerids = tlshd_num_remote_peerids;
-		parms->remote_peerid = tlshd_remote_peerid;
-	}
 
 	gnutls_global_deinit();
 }
diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index 267856f968ce..3e2cd6379b8d 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -43,8 +43,6 @@
 
 static gnutls_privkey_t tlshd_server_privkey;
 static gnutls_pcert_st tlshd_server_cert;
-static unsigned int tlshd_num_remote_peerids;
-static key_serial_t tlshd_remote_peerid[10];
 
 /*
  * XXX: After this point, tlshd_server_cert should be deinited on error.
@@ -133,15 +131,15 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
  */
 static int tlshd_server_x509_verify_function(gnutls_session_t session)
 {
+	struct tlshd_handshake_parms *parms;
 	const gnutls_datum_t *peercerts;
 	unsigned int i, status;
-	const char *hostname;
 	gnutls_datum_t out;
 	int type, ret;
 
-	hostname = gnutls_session_get_ptr(session);
+	parms = gnutls_session_get_ptr(session);
 
-	ret = gnutls_certificate_verify_peers3(session, hostname, &status);
+	ret = gnutls_certificate_verify_peers3(session, NULL, &status);
 	switch (ret) {
 	case GNUTLS_E_SUCCESS:
 		break;
@@ -166,23 +164,24 @@ static int tlshd_server_x509_verify_function(gnutls_session_t session)
 	 * via a netlink attribute. */
 
 	peercerts = gnutls_certificate_get_peers(session,
-						 &tlshd_num_remote_peerids);
-	if (!peercerts || tlshd_num_remote_peerids == 0) {
+						 &parms->num_remote_peerids);
+	if (!peercerts || parms->num_remote_peerids == 0) {
 		tlshd_log_debug("The peer cert list is empty.\n");
                 return GNUTLS_E_CERTIFICATE_ERROR;
 	}
 
-	tlshd_log_debug("The peer offered %d certificate(s).\n",
-			tlshd_num_remote_peerids);
+	tlshd_log_debug("The peer offered %u certificate(s).\n",
+			parms->num_remote_peerids);
 
-	if (tlshd_num_remote_peerids > ARRAY_SIZE(tlshd_remote_peerid))
-		tlshd_num_remote_peerids= ARRAY_SIZE(tlshd_remote_peerid);
-	for (i = 0; i < tlshd_num_remote_peerids; i++) {
+	if (parms->num_remote_peerids > ARRAY_SIZE(parms->remote_peerid))
+		parms->num_remote_peerids = ARRAY_SIZE(parms->remote_peerid);
+	for (i = 0; i < parms->num_remote_peerids; i++) {
 		gnutls_x509_crt_t cert;
 
 		gnutls_x509_crt_init(&cert);
 		gnutls_x509_crt_import(cert, &peercerts[i], GNUTLS_X509_FMT_DER);
-		tlshd_remote_peerid[i] = tlshd_keyring_create_cert(cert, hostname);
+		parms->remote_peerid[i] =
+			tlshd_keyring_create_cert(cert, parms->peername);
 		gnutls_x509_crt_deinit(cert);
 	}
 
@@ -223,6 +222,7 @@ static void tlshd_server_x509_handshake(struct tlshd_handshake_parms *parms)
 		goto out_free_creds;
 	}
 	gnutls_transport_set_int(session, parms->sockfd);
+	gnutls_session_set_ptr(session, parms);
 
 	gnutls_server_name_set(session, GNUTLS_NAME_DNS,
 			       parms->peername, strlen(parms->peername));
@@ -252,11 +252,14 @@ out_free_creds:
  *   %0: Matching key has been stored in @key
  *   %-1: Error during lookup, @key is not updated
  */
-static int tlshd_server_psk_cb(__attribute__ ((unused))gnutls_session_t session,
+static int tlshd_server_psk_cb(gnutls_session_t session,
 			       const char *username, gnutls_datum_t *key)
 {
+	struct tlshd_handshake_parms *parms;
 	key_serial_t psk;
 
+	parms = gnutls_session_get_ptr(session);
+
 	psk = keyctl_search(KEY_SPEC_SESSION_KEYRING, "psk", username, 0);
 	if (psk < 0) {
 		tlshd_log_error("failed to search key");
@@ -267,8 +270,8 @@ static int tlshd_server_psk_cb(__attribute__ ((unused))gnutls_session_t session,
 		return -1;
 	}
 	/* PSK uses the same identity for both client and server */
-	tlshd_remote_peerid[0] = psk;
-	tlshd_num_remote_peerids = 1;
+	parms->remote_peerid[0] = psk;
+	parms->num_remote_peerids = 1;
 	return 0;
 }
 
@@ -293,6 +296,7 @@ static void tlshd_server_psk_handshake(struct tlshd_handshake_parms *parms)
 		goto out_free_creds;
 	}
 	gnutls_transport_set_int(session, parms->sockfd);
+	gnutls_session_set_ptr(session, parms);
 
 	gnutls_credentials_set(session, GNUTLS_CRD_PSK, psk_cred);
 
@@ -337,10 +341,6 @@ void tlshd_serverhello_handshake(struct tlshd_handshake_parms *parms)
 		tlshd_log_debug("Unrecognized auth mode (%d)",
 				parms->auth_mode);
 	}
-	if (tlshd_num_remote_peerids) {
-		parms->num_remote_peerids = tlshd_num_remote_peerids;
-		parms->remote_peerid = tlshd_remote_peerid;
-	}
 
 	gnutls_global_deinit();
 }
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 9b7bd522bc12..1c764787c28a 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -41,7 +41,7 @@ struct tlshd_handshake_parms {
 	unsigned int	session_status;
 
 	unsigned int	num_remote_peerids;
-	key_serial_t	*remote_peerid;
+	key_serial_t	remote_peerid[10];
 };
 
 /* client.c */



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3F38460
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DDE8C433D2
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681742105;
	bh=kZQUKO3RIAjBr+dAPNqHqoICOefkU9rZh5884kUPYG0=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=ON3MIDy7zEab007dacsGKqdXB+tDQywSP7gdeLQFKY50re1uFncwaAJ7jiuk441Ug
	 TpHfnaVpNMbxRFCR/2KcT+MljIZtoMPX9NHmoqAnZEoTZk9kQZK1JWfbRMLdqRkluw
	 6mxjBE/FfTJnS3dbopfKUKHIDNHgpP5n4dRgjTB1rc7EY6NdaHVde2lozTV8lT9PAf
	 ivEQwIwgJNg+ZSVIrJmHGnliG6lbKeLJrcBXDRaj14CrQAC4gXFEAljvHcsCnv2HKe
	 wtNg+Vsxy5W2Qb1mbMThUbB5w0LZ88mzBtAKR05Ipg1m1oKkpJeK/i39sdUF5sfo8e
	 l9NMEAXsnwUZQ==
Subject: [PATCH RFC 2/5] tlshd: Fix client's use of Server Name Indication
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Mon, 17 Apr 2023 10:35:04 -0400
Message-ID: 
 <168174210447.9615.8149321939211810293.stgit@91.116.238.104.host.secureserver.net>
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

The man page says gnutls_server_name_set(3) is used to send the
local hostname to the remote peer as part of ClientHello. It appears
that tlshd is incorrectly sending the remote's hostname instead.

To ensure that an appropriate hostname is used, enable the client's
admin to set the client's hostname in /etc/tlshd.conf. If one isn't
set there, the result of gethostname(3) is used instead. The SNI
hostname needs to match one of the Subject names in the provided
client certificate.

I'll note that RFC 9289 should RECOMMEND or REQUIRE the use of SNI,
but it currently does not.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/client.c       |   32 +++++++++++++++++++++++++++-----
 src/tlshd/config.c       |   31 +++++++++++++++++++++++++++++++
 src/tlshd/tlshd.conf     |    1 +
 src/tlshd/tlshd.conf.man |   31 +++++++++++++++++++++++++++++--
 src/tlshd/tlshd.h        |    1 +
 5 files changed, 89 insertions(+), 7 deletions(-)

diff --git a/src/tlshd/client.c b/src/tlshd/client.c
index f40e19882827..46a973f4393c 100644
--- a/src/tlshd/client.c
+++ b/src/tlshd/client.c
@@ -31,6 +31,7 @@
 #include <stdio.h>
 #include <errno.h>
 #include <keyutils.h>
+#include <netdb.h>
 
 #include <gnutls/gnutls.h>
 #include <gnutls/abstract.h>
@@ -45,6 +46,30 @@
 static unsigned int tlshd_num_remote_peerids;
 static key_serial_t tlshd_remote_peerid[10];
 
+static void tlshd_client_set_sni_hostname(gnutls_session_t session)
+{
+	char buf[NI_MAXHOST];
+	size_t len = sizeof(buf);
+	int ret;
+
+	if (!tlshd_config_get_sni_hostname(buf, &len)) {
+		ret = gethostname(buf, len);
+		if (ret < 0) {
+			tlshd_log_perror("gethostname");
+			return;
+		}
+		len = strlen(buf);
+	}
+
+	ret = gnutls_server_name_set(session, GNUTLS_NAME_DNS, buf, len);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		return;
+	}
+
+	tlshd_log_debug("Using SNI hostname: %s", buf);
+}
+
 static void tlshd_client_anon_handshake(struct tlshd_handshake_parms *parms)
 {
 	gnutls_certificate_credentials_t xcred;
@@ -81,9 +106,7 @@ static void tlshd_client_anon_handshake(struct tlshd_handshake_parms *parms)
 	}
 	gnutls_transport_set_int(session, parms->sockfd);
 
-	gnutls_server_name_set(session, GNUTLS_NAME_DNS,
-			       parms->peername, strlen(parms->peername));
-
+	tlshd_client_set_sni_hostname(session);
 	gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
 
 	ret = gnutls_set_default_priority(session);
@@ -277,8 +300,7 @@ static void tlshd_client_x509_handshake(struct tlshd_handshake_parms *parms)
 	}
 	gnutls_transport_set_int(session, parms->sockfd);
 
-	gnutls_server_name_set(session, GNUTLS_NAME_DNS,
-			       parms->peername, strlen(parms->peername));
+	tlshd_client_set_sni_hostname(session);
 	gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
 	gnutls_certificate_set_verify_function(xcred,
 					       tlshd_client_x509_verify_function);
diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index 464635ed56e0..cbc522927088 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -352,3 +352,34 @@ bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey)
 	tlshd_log_debug("Retrieved private key from %s", pathname);
 	return true;
 }
+
+/**
+ * tlshd_config_get_sni_hostname - Get the SNI hostname from .conf
+ * @hostname: buffer to contain hostname string
+ * @len: OUT: length of hostname string
+ *
+ * Return values:
+ *   %true: hostname retrieved successfully
+ *   %false: hostname not retrieved
+ */
+bool tlshd_config_get_sni_hostname(char *hostname, size_t *len)
+{
+	GError *error = NULL;
+	gchar *result;
+
+	result = g_key_file_get_string(tlshd_configuration, "authenticate.client",
+					"sni-hostname", &error);
+	if (!result) {
+		tlshd_log_gerror("Missing key", error);
+		g_error_free(error);
+		return false;
+	}
+	if (strlen(result) > *len - 1) {
+		tlshd_log_error("SNI hostname too large");
+		return false;
+	}
+
+	strcpy(hostname, result);
+	*len = strlen(result);
+	return true;
+}
diff --git a/src/tlshd/tlshd.conf b/src/tlshd/tlshd.conf
index 2f301dd6a42c..a16a96206c12 100644
--- a/src/tlshd/tlshd.conf
+++ b/src/tlshd/tlshd.conf
@@ -30,6 +30,7 @@ nl_debug=0
 [authenticate.client]
 #x509.certificate= <pathname>
 #x509.private_key= <pathname>
+#sni-hostname= <client hostname>
 
 [authenticate.server]
 #x509.certificate= <pathname>
diff --git a/src/tlshd/tlshd.conf.man b/src/tlshd/tlshd.conf.man
index 2fb361845950..bae689e2a387 100644
--- a/src/tlshd/tlshd.conf.man
+++ b/src/tlshd/tlshd.conf.man
@@ -80,8 +80,35 @@ The
 section specifies default authentication material when establishing
 TLS sessions.
 There are two subsections:
-.IR [client] and [server] .
-In each of these subsections, there are two available options:
+.I [client]
+and
+.IR [server] .
+.P
+In the
+.I [client]
+subsection, there are three available options:
+.TP
+.B x509.certificate
+This option specifies the pathname of a file containing
+a PEM-encoded x.509 certificate that is to be presented during
+a ClientHello request when no other certificate is available.
+.TP
+.B x509.private_key
+This option specifies the pathname of a file containing
+a PEM-encoded private key associated with the above certificate.
+.TP
+.B sni-hostname
+This option specifies the hostname to present in the ClientHello
+Server Name Indication extension.
+If not provided, the default is to use the result of the
+.BR gethostname (3)
+library call.
+The SNI hostname should match one of the SubjectNames in the
+client's x.509 certificate.
+.P
+In the
+.I [server]
+subsection, there are two available options:
 .TP
 .B x509.certificate
 This option specifies the pathname of a file containing
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index d8cb3c4b4baa..9b7bd522bc12 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -54,6 +54,7 @@ bool tlshd_config_get_client_cert(gnutls_pcert_st *cert);
 bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey);
 bool tlshd_config_get_server_cert(gnutls_pcert_st *cert);
 bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey);
+bool tlshd_config_get_sni_hostname(char *hostname, size_t *len);
 
 /* handshake.c */
 extern void tlshd_start_tls_handshake(gnutls_session_t session,



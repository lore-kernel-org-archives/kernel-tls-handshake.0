Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B1F4435
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  7 Aug 2023 20:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D38DC433C7
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  7 Aug 2023 20:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691441680;
	bh=Yy8/NasFsi9XqqFHzvk4gwbV6C7lP4Y8FCbYNrnI0vA=;
	h=Subject:From:To:Date:From;
	b=UVzL3kVYn4VIZSGZJVZ879DZtCva5VHzVgjRRTM68zn69LdL1FWLogC+SIyYS/3iw
	 aCApJSJsWCCnTrUxw21ZOtddcoPVeaRnvj1AHqQ/veHRA4vAhUz7NteuoOmri7fCAG
	 feRUrXqEFdSHqQkOkH7S4MtOPJ9uNJ+t0NaLSKCm3QhVaskcocNeJk6ktagW41SDQ3
	 KJ4dpaCltispvBtWKk5KaUTs12byIR0ed0SF2PJ+H00jNL6cFJSYVInq1IEwXO7/Hj
	 9Z+neAhZL/iYjX2dNPagwasq6LpeB2waa2MdEblF0AYcFJ9RdSVgrJUZtcjbLA+aI2
	 SNMOG3YFX+fQg==
Subject: [PATCH v1] tlshd: Add .conf option to specify trust store
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Mon, 07 Aug 2023 16:54:38 -0400
Message-ID: 
 <169144160144.20878.14334844376236760810.stgit@91.116.238.104.host.secureserver.net>
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

Enable administrators to provide a trust store that is specifically
for certificate verification during kernel-driven handshakes. This
makes using self-signed certificates just for SunRPC more secure, for
example.

Partially addresses issue #21.

Suggested-by: Olga Kornievskaia <kolga@netapp.com>
Suggested-by: Ben Hutchings <benh@debian.org>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/client.c       |   16 +++++++++++-
 src/tlshd/config.c       |   60 ++++++++++++++++++++++++++++++++++++++++++++++
 src/tlshd/server.c       |    8 +++++-
 src/tlshd/tlshd.conf     |    2 ++
 src/tlshd/tlshd.conf.man |   10 +++++++-
 src/tlshd/tlshd.h        |    2 ++
 6 files changed, 94 insertions(+), 4 deletions(-)

Hi all-

This is untested. Interested in comments.


diff --git a/src/tlshd/client.c b/src/tlshd/client.c
index 6a16263a058f..30a408d06d19 100644
--- a/src/tlshd/client.c
+++ b/src/tlshd/client.c
@@ -47,6 +47,7 @@ static void tlshd_client_anon_handshake(struct tlshd_handshake_parms *parms)
 	gnutls_certificate_credentials_t xcred;
 	gnutls_session_t session;
 	unsigned int flags;
+	char *cafile;
 	int ret;
 
 	ret = gnutls_certificate_allocate_credentials(&xcred);
@@ -63,7 +64,12 @@ static void tlshd_client_anon_handshake(struct tlshd_handshake_parms *parms)
 	gnutls_certificate_set_flags(xcred,
 			GNUTLS_CERTIFICATE_SKIP_KEY_CERT_MATCH | GNUTLS_CERTIFICATE_SKIP_OCSP_RESPONSE_CHECK);
 
-	ret = gnutls_certificate_set_x509_system_trust(xcred);
+	if (tlshd_config_get_client_truststore(&cafile)) {
+		ret = gnutls_certificate_set_x509_trust_file(xcred, cafile,
+							     GNUTLS_X509_FMT_PEM);
+		free(cafile);
+	} else
+		ret = gnutls_certificate_set_x509_system_trust(xcred);
 	if (ret < 0) {
 		tlshd_log_gnutls_error(ret);
 		goto out_free_creds;
@@ -247,6 +253,7 @@ static void tlshd_client_x509_handshake(struct tlshd_handshake_parms *parms)
 	gnutls_certificate_credentials_t xcred;
 	gnutls_session_t session;
 	unsigned int flags;
+	char *cafile;
 	int ret;
 
 	ret = gnutls_certificate_allocate_credentials(&xcred);
@@ -255,7 +262,12 @@ static void tlshd_client_x509_handshake(struct tlshd_handshake_parms *parms)
 		return;
 	}
 
-	ret = gnutls_certificate_set_x509_system_trust(xcred);
+	if (tlshd_config_get_client_truststore(&cafile)) {
+		ret = gnutls_certificate_set_x509_trust_file(xcred, cafile,
+							     GNUTLS_X509_FMT_PEM);
+		free(cafile);
+	} else
+		ret = gnutls_certificate_set_x509_system_trust(xcred);
 	if (ret < 0) {
 		tlshd_log_gnutls_error(ret);
 		goto out_free_creds;
diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index e668e1d0c78b..727fa69f65e6 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -184,6 +184,36 @@ out:
 	return ret;
 }
 
+/**
+ * tlshd_config_get_client_truststore - Get truststore for ClientHello from .conf
+ * @bundle: OUT: pathname to truststore
+ *
+ * Return values:
+ *   %false: pathname not retrieved
+ *   %true: pathname retrieved successfully; caller must free @bundle using free(3)
+ */
+bool tlshd_config_get_client_truststore(char **bundle)
+{
+	GError *error = NULL;
+	gchar *pathname;
+
+	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.client",
+					 "x509.truststore", &error);
+	if (!pathname) {
+		tlshd_log_gerror("Client x.509 truststore not specified", error);
+		g_error_free(error);
+		return false;
+	}
+
+	*bundle = strdup(pathname);
+	g_free(pathname);
+	if (!*bundle)
+		return false;
+
+	tlshd_log_debug("Client x.509 truststore is %s", *bundle);
+	return true;
+}
+
 /**
  * tlshd_config_get_client_cert - Get cert for ClientHello from .conf
  * @cert: OUT: in-memory certificate
@@ -280,6 +310,36 @@ bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey)
 	return true;
 }
 
+/**
+ * tlshd_config_get_server_truststore - Get truststore for ServerHello from .conf
+ * @bundle: OUT: pathname to truststore
+ *
+ * Return values:
+ *   %false: pathname not retrieved
+ *   %true: pathname retrieved successfully; caller must free @bundle using free(3)
+ */
+bool tlshd_config_get_server_truststore(char **bundle)
+{
+	GError *error = NULL;
+	gchar *pathname;
+
+	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
+					 "x509.truststore", &error);
+	if (!pathname) {
+		tlshd_log_gerror("Server x.509 truststore not specified", error);
+		g_error_free(error);
+		return false;
+	}
+
+	*bundle = strdup(pathname);
+	g_free(pathname);
+	if (!*bundle)
+		return false;
+
+	tlshd_log_debug("Server x.509 truststore is %s", *bundle);
+	return true;
+}
+
 /**
  * tlshd_config_get_server_cert - Get cert for ServerHello from .conf
  * @cert: OUT: in-memory certificate
diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index b969d57014d7..b34ba5838edb 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -201,6 +201,7 @@ static void tlshd_server_x509_handshake(struct tlshd_handshake_parms *parms)
 {
 	gnutls_certificate_credentials_t xcred;
 	gnutls_session_t session;
+	char *cafile;
 	int ret;
 
 	ret = gnutls_certificate_allocate_credentials(&xcred);
@@ -209,7 +210,12 @@ static void tlshd_server_x509_handshake(struct tlshd_handshake_parms *parms)
 		return;
 	}
 
-	ret = gnutls_certificate_set_x509_system_trust(xcred);
+	if (tlshd_config_get_server_truststore(&cafile)) {
+		ret = gnutls_certificate_set_x509_trust_file(xcred, cafile,
+							     GNUTLS_X509_FMT_PEM);
+		free(cafile);
+	} else
+		ret = gnutls_certificate_set_x509_system_trust(xcred);
 	if (ret < 0) {
 		tlshd_log_gnutls_error(ret);
 		goto out_free_creds;
diff --git a/src/tlshd/tlshd.conf b/src/tlshd/tlshd.conf
index 2f301dd6a42c..5ad64d238e0f 100644
--- a/src/tlshd/tlshd.conf
+++ b/src/tlshd/tlshd.conf
@@ -28,9 +28,11 @@ nl_debug=0
 #keyrings= <keyring>;<keyring>;<keyring>
 
 [authenticate.client]
+#x509.truststore= <pathname>
 #x509.certificate= <pathname>
 #x509.private_key= <pathname>
 
 [authenticate.server]
+#x509.truststore= <pathname>
 #x509.certificate= <pathname>
 #x509.private_key= <pathname>
diff --git a/src/tlshd/tlshd.conf.man b/src/tlshd/tlshd.conf.man
index eb0cd11543bd..3d29c18fb7f5 100644
--- a/src/tlshd/tlshd.conf.man
+++ b/src/tlshd/tlshd.conf.man
@@ -81,7 +81,15 @@ section specifies default authentication material when establishing
 TLS sessions.
 There are two subsections:
 .IR [client] and [server] .
-In each of these subsections, there are two available options:
+In each of these subsections, there are three available options:
+.TP
+.B x509.truststore
+This option specifies the pathname of a file containing a
+PEM-encoded trust store that is to be used to verify a
+certificate during a handshake.
+If this option is not specified,
+.B tlshd
+uses the system's trust store.
 .TP
 .B x509.certificate
 This option specifies the pathname of a file containing
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index c4da3fd80889..ae1ea37ccb0f 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -52,8 +52,10 @@ extern void tlshd_clienthello_handshake(struct tlshd_handshake_parms *parms);
 /* config.c */
 bool tlshd_config_init(const gchar *pathname);
 void tlshd_config_shutdown(void);
+bool tlshd_config_get_client_truststore(char **bundle);
 bool tlshd_config_get_client_cert(gnutls_pcert_st *cert);
 bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey);
+bool tlshd_config_get_server_truststore(char **bundle);
 bool tlshd_config_get_server_cert(gnutls_pcert_st *cert);
 bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey);
 



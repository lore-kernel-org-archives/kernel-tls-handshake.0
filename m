Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32EB2DEA6B
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 11 Sep 2025 21:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757626172; cv=none; b=SXj5q+VPzTcQKBzqDIoD4LPBu7UpKwCl+LH8MKUn6BTKfxEYkWHW+XbzNOxxrT4aBKsknlE7dQteJ2UxxVppvNmnSf1Or+cJKI9WjWPr1NVhm3hNpJ73F8n0NkDNkTH/Otp94A0UWS/n+98YAqBakz2ZFwWYH1oDfB35+aom4eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757626172; c=relaxed/simple;
	bh=HG+rnJ3n1zIw7i2FhD5PwPGpafi/Jttzm3YMye0MUK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=jeNepQZCmIDbyR/4TsNJkvpLhavazL59QfrL4WmaGgfuZV17/LPMxwCx/ovUvtbrk++J2O3dyED8E9dQBYQEcSUof65VWTOZR8KPxbiYOdTXnzPXMlf91NJjbHx9epX/ntrn8PQVAfmJ3/chqA/k2WuBwcUzx1vmdJMdZSeBFs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PlDLE6RE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PlDLE6RE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757626169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AWRCtFUxOWj0yc7lkW/HpZxTo1OELvQvW9B/Jn4NwDk=;
	b=PlDLE6REx4JxXiKa6xLFKkj39MLBfwCxijgNEmiqBMalD26/w9MYAha7BM5RvCPo7ZvXRu
	IdnRxd2LDsAG7gluwIJNzrOdmrJ0z1RQmTZ47sGtLQRFyci4wtJGp4cKQ8FMAuZYUv2D2+
	uoxGPFF+YsrtYwToVMze40itkRSBsrQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-507-8Z9ROzRIMQ6gXSDWmV6v_Q-1; Thu,
 11 Sep 2025 17:28:18 -0400
X-MC-Unique: 8Z9ROzRIMQ6gXSDWmV6v_Q-1
X-Mimecast-MFC-AGG-ID: 8Z9ROzRIMQ6gXSDWmV6v_Q_1757626097
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 56DE71800371;
	Thu, 11 Sep 2025 21:28:17 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.88.97])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F26DB300021A;
	Thu, 11 Sep 2025 21:28:16 +0000 (UTC)
Received: from aion.redhat.com (localhost [IPv6:::1])
	by aion.redhat.com (Postfix) with ESMTP id 27897430200;
	Thu, 11 Sep 2025 17:28:15 -0400 (EDT)
From: Scott Mayhew <smayhew@redhat.com>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [PATCH v2 1/4] tlshd: deduplicate client and server config functions
Date: Thu, 11 Sep 2025 17:28:12 -0400
Message-ID: <20250911212815.1414784-2-smayhew@redhat.com>
In-Reply-To: <20250911212815.1414784-1-smayhew@redhat.com>
References: <20250911212815.1414784-1-smayhew@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AA7431PDSDB0w_KBcadBYvgl2DpZELiM4XSA7Dfmy5s_1757626097
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The client and server variants of tlshd_config_get_* are identical
except for
1) the stanza they're looking at in the config file, and
2) whether the word "client" or "server" gets written in a log message

Add new parameter 'peer_type' to each of these functions so we can use
the same function for both the client and server code.

Signed-off-by: Scott Mayhew <smayhew@redhat.com>
---
 src/tlshd/client.c |   9 +-
 src/tlshd/config.c | 213 +++++++++------------------------------------
 src/tlshd/server.c |  11 +--
 src/tlshd/tlshd.h  |  20 ++---
 4 files changed, 62 insertions(+), 191 deletions(-)

diff --git a/src/tlshd/client.c b/src/tlshd/client.c
index 8acb0aa..c07ae29 100644
--- a/src/tlshd/client.c
+++ b/src/tlshd/client.c
@@ -48,7 +48,7 @@ static int tlshd_client_get_truststore(gnutls_certificate_credentials_t cred)
 	char *pathname;
 	int ret;
 
-	if (tlshd_config_get_client_truststore(&pathname)) {
+	if (tlshd_config_get_truststore(PEER_TYPE_CLIENT, &pathname)) {
 		ret = gnutls_certificate_set_x509_trust_file(cred, pathname,
 							     GNUTLS_X509_FMT_PEM);
 		free(pathname);
@@ -60,7 +60,7 @@ static int tlshd_client_get_truststore(gnutls_certificate_credentials_t cred)
 	}
 	tlshd_log_debug("System trust: Loaded %d certificate(s).", ret);
 
-	if (tlshd_config_get_client_crl(&pathname)) {
+	if (tlshd_config_get_crl(PEER_TYPE_CLIENT, &pathname)) {
 		ret = gnutls_certificate_set_x509_crl_file(cred, pathname,
 							   GNUTLS_X509_FMT_PEM);
 		free(pathname);
@@ -143,7 +143,8 @@ static bool tlshd_x509_client_get_certs(struct tlshd_handshake_parms *parms)
 	if (parms->x509_cert != TLS_NO_CERT)
 		return tlshd_keyring_get_certs(parms->x509_cert, tlshd_certs,
 					       &tlshd_certs_len);
-	return tlshd_config_get_client_certs(tlshd_certs, &tlshd_certs_len);
+	return tlshd_config_get_certs(PEER_TYPE_CLIENT, tlshd_certs,
+				      &tlshd_certs_len);
 }
 
 static void tlshd_x509_client_put_certs(void)
@@ -159,7 +160,7 @@ static bool tlshd_x509_client_get_privkey(struct tlshd_handshake_parms *parms)
 	if (parms->x509_privkey != TLS_NO_PRIVKEY)
 		return tlshd_keyring_get_privkey(parms->x509_privkey,
 						 &tlshd_privkey);
-	return tlshd_config_get_client_privkey(&tlshd_privkey);
+	return tlshd_config_get_privkey(PEER_TYPE_CLIENT, &tlshd_privkey);
 }
 
 static void tlshd_x509_client_put_privkey(void)
diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index 029dbcc..ff1f2a5 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -187,18 +187,22 @@ out:
 }
 
 /**
- * tlshd_config_get_client_truststore - Get truststore for ClientHello from .conf
+ * tlshd_config_get_truststore - Get truststore for {Client,Server}Hello from .conf
+ * @peer_type: IN: peer type
  * @bundle: OUT: pathname to truststore
  *
  * Return values:
  *   %false: pathname not retrieved
  *   %true: pathname retrieved successfully; caller must free @bundle using free(3)
  */
-bool tlshd_config_get_client_truststore(char **bundle)
+bool tlshd_config_get_truststore(int peer_type, char **bundle)
 {
 	gchar *pathname;
 
-	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.client",
+	pathname = g_key_file_get_string(tlshd_configuration,
+					 peer_type == PEER_TYPE_CLIENT ?
+					 "authenticate.client" :
+					 "authenticate.server",
 					 "x509.truststore", NULL);
 	if (!pathname)
 		return false;
@@ -213,23 +217,29 @@ bool tlshd_config_get_client_truststore(char **bundle)
 	if (!*bundle)
 		return false;
 
-	tlshd_log_debug("Client x.509 truststore is %s", *bundle);
+	tlshd_log_debug("%s x.509 truststore is %s",
+		        peer_type == PEER_TYPE_CLIENT ? "Client" : "Server",
+			*bundle);
 	return true;
 }
 
 /**
- * tlshd_config_get_client_crl - Get CRL for ClientHello from .conf
+ * tlshd_config_get_crl - Get CRL for {Client,Server}Hello from .conf
+ * @peer_type: IN: peer type
  * @result: OUT: pathname to CRL
  *
  * Return values:
  *   %false: pathname not retrieved
  *   %true: pathname retrieved successfully; caller must free @result using free(3)
  */
-bool tlshd_config_get_client_crl(char **result)
+bool tlshd_config_get_crl(int peer_type, char **result)
 {
 	gchar *pathname;
 
-	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.client",
+	pathname = g_key_file_get_string(tlshd_configuration,
+					 peer_type == PEER_TYPE_CLIENT ?
+					 "authenticate.client" :
+					 "authenticate.server",
 					 "x509.crl", NULL);
 	if (!pathname)
 		return false;
@@ -244,12 +254,15 @@ bool tlshd_config_get_client_crl(char **result)
 	if (!*result)
 		return false;
 
-	tlshd_log_debug("Client x.509 crl is %s", *result);
+	tlshd_log_debug("%s x.509 crl is %s",
+			peer_type == PEER_TYPE_CLIENT ? "Client" : "Server",
+			*result);
 	return true;
 }
 
 /**
- * tlshd_config_get_client_certs - Get certs for ClientHello from .conf
+ * tlshd_config_get_certs - Get certs for {Client,Server} Hello from .conf
+ * @peer_type: IN: peer type
  * @certs: OUT: in-memory certificates
  * @certs_len: IN: maximum number of certs to get, OUT: number of certs found
  *
@@ -257,15 +270,18 @@ bool tlshd_config_get_client_crl(char **result)
  *   %true: certificate retrieved successfully
  *   %false: certificate not retrieved
  */
-bool tlshd_config_get_client_certs(gnutls_pcert_st *certs,
-				   unsigned int *certs_len)
+bool tlshd_config_get_certs(int peer_type, gnutls_pcert_st *certs,
+			    unsigned int *certs_len)
 {
 	gnutls_datum_t data;
 	gchar *pathname;
 	int ret;
 
-	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.client",
-					"x509.certificate", NULL);
+	pathname = g_key_file_get_string(tlshd_configuration,
+					 peer_type == PEER_TYPE_CLIENT ?
+					 "authenticate.client" :
+					 "authenticate.server",
+					 "x509.certificate", NULL);
 	if (!pathname)
 		return false;
 
@@ -285,181 +301,34 @@ bool tlshd_config_get_client_certs(gnutls_pcert_st *certs,
 		return false;
 	}
 
-	tlshd_log_debug("Retrieved %u x.509 client certificate(s) from %s",
-			*certs_len, pathname);
+	tlshd_log_debug("Retrieved %u x.509 %s certificate(s) from %s",
+			*certs_len,
+			peer_type == PEER_TYPE_CLIENT ? "client" : "server",
+			pathname);
 	g_free(pathname);
 	return true;
 }
 
 /**
- * tlshd_config_get_client_privkey - Get private key for ClientHello from .conf
+ * tlshd_config_get_privkey - Get private key for {Client,Server}Hello from .conf
+ * @peer_type: IN: peer type
  * @privkey: OUT: in-memory private key
  *
  * Return values:
  *   %true: private key retrieved successfully
  *   %false: private key not retrieved
  */
-bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey)
+bool tlshd_config_get_privkey(int peer_type, gnutls_privkey_t *privkey)
 {
 	gnutls_datum_t data;
 	gchar *pathname;
 	int ret;
 
-	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.client",
-					"x509.private_key", NULL);
-	if (!pathname)
-		return false;
-
-	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
-				     TLSHD_PRIVKEY_MODE)) {
-		g_free(pathname);
-		return false;
-	}
-
-	ret = gnutls_privkey_init(privkey);
-	if (ret != GNUTLS_E_SUCCESS) {
-		tlshd_log_gnutls_error(ret);
-		free(data.data);
-		g_free(pathname);
-		return false;
-	}
-
-	/* Config file supports only PEM-encoded keys */
-	ret = gnutls_privkey_import_x509_raw(*privkey, &data,
-					     GNUTLS_X509_FMT_PEM, NULL, 0);
-	free(data.data);
-	if (ret != GNUTLS_E_SUCCESS) {
-		tlshd_log_gnutls_error(ret);
-		g_free(pathname);
-		return false;
-	}
-
-	tlshd_log_debug("Retrieved private key from %s", pathname);
-	g_free(pathname);
-	return true;
-}
-
-/**
- * tlshd_config_get_server_truststore - Get truststore for ServerHello from .conf
- * @bundle: OUT: pathname to truststore
- *
- * Return values:
- *   %false: pathname not retrieved
- *   %true: pathname retrieved successfully; caller must free @bundle using free(3)
- */
-bool tlshd_config_get_server_truststore(char **bundle)
-{
-	gchar *pathname;
-
-	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
-					 "x509.truststore", NULL);
-	if (!pathname)
-		return false;
-	if (access(pathname, F_OK)) {
-		tlshd_log_debug("tlshd cannot access \"%s\"", pathname);
-		g_free(pathname);
-		return false;
-	}
-
-	*bundle = strdup(pathname);
-	g_free(pathname);
-	if (!*bundle)
-		return false;
-
-	tlshd_log_debug("Server x.509 truststore is %s", *bundle);
-	return true;
-}
-
-/**
- * tlshd_config_get_server_crl - Get CRL for ServerHello from .conf
- * @result: OUT: pathname to CRL
- *
- * Return values:
- *   %false: pathname not retrieved
- *   %true: pathname retrieved successfully; caller must free @result using free(3)
- */
-bool tlshd_config_get_server_crl(char **result)
-{
-	gchar *pathname;
-
-	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
-					 "x509.crl", NULL);
-	if (!pathname)
-		return false;
-	if (access(pathname, F_OK)) {
-		tlshd_log_debug("tlshd cannot access \"%s\"", pathname);
-		g_free(pathname);
-		return false;
-	}
-
-	*result = strdup(pathname);
-	g_free(pathname);
-	if (!*result)
-		return false;
-
-	tlshd_log_debug("Server x.509 crl is %s", *result);
-	return true;
-}
-
-/**
- * tlshd_config_get_server_certs - Get certs for ServerHello from .conf
- * @certs: OUT: in-memory certificates
- * @certs_len: IN: maximum number of certs to get, OUT: number of certs found
- *
- * Return values:
- *   %true: certificate retrieved successfully
- *   %false: certificate not retrieved
- */
-bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
-				   unsigned int *certs_len)
-{
-	gnutls_datum_t data;
-	gchar *pathname;
-	int ret;
-
-	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
-					"x509.certificate", NULL);
-	if (!pathname)
-		return false;
-
-	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
-				     TLSHD_CERT_MODE)) {
-		g_free(pathname);
-		return false;
-	}
-
-	/* Config file supports only PEM-encoded certificates */
-	ret = gnutls_pcert_list_import_x509_raw(certs, certs_len, &data,
-						GNUTLS_X509_FMT_PEM, 0);
-	free(data.data);
-	if (ret != GNUTLS_E_SUCCESS) {
-		tlshd_log_gnutls_error(ret);
-		g_free(pathname);
-		return false;
-	}
-
-	tlshd_log_debug("Retrieved %u x.509 server certificate(s) from %s",
-			*certs_len, pathname);
-	g_free(pathname);
-	return true;
-}
-
-/**
- * tlshd_config_get_server_privkey - Get private key for ServerHello from .conf
- * @privkey: OUT: in-memory private key
- *
- * Return values:
- *   %true: private key retrieved successfully
- *   %false: private key not retrieved
- */
-bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey)
-{
-	gnutls_datum_t data;
-	gchar *pathname;
-	int ret;
-
-	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
-					"x509.private_key", NULL);
+	pathname = g_key_file_get_string(tlshd_configuration,
+					 peer_type == PEER_TYPE_CLIENT ?
+					 "authenticate.client" :
+					 "authenticate.server",
+					 "x509.private_key", NULL);
 	if (!pathname)
 		return false;
 
diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index 44a91c4..efea387 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -52,8 +52,8 @@ static bool tlshd_x509_server_get_certs(struct tlshd_handshake_parms *parms)
 		return tlshd_keyring_get_certs(parms->x509_cert,
 					       tlshd_server_certs,
 					       &tlshd_server_certs_len);
-	return tlshd_config_get_server_certs(tlshd_server_certs,
-					     &tlshd_server_certs_len);
+	return tlshd_config_get_certs(PEER_TYPE_SERVER, tlshd_server_certs,
+				      &tlshd_server_certs_len);
 }
 
 static void tlshd_x509_server_put_certs(void)
@@ -69,7 +69,8 @@ static bool tlshd_x509_server_get_privkey(struct tlshd_handshake_parms *parms)
 	if (parms->x509_privkey != TLS_NO_PRIVKEY)
 		return tlshd_keyring_get_privkey(parms->x509_privkey,
 						 &tlshd_server_privkey);
-	return tlshd_config_get_server_privkey(&tlshd_server_privkey);
+	return tlshd_config_get_privkey(PEER_TYPE_SERVER,
+					&tlshd_server_privkey);
 }
 
 static void tlshd_x509_server_put_privkey(void)
@@ -140,7 +141,7 @@ static int tlshd_server_get_truststore(gnutls_certificate_credentials_t cred)
 	char *pathname;
 	int ret;
 
-	if (tlshd_config_get_server_truststore(&pathname)) {
+	if (tlshd_config_get_truststore(PEER_TYPE_SERVER, &pathname)) {
 		ret = gnutls_certificate_set_x509_trust_file(cred, pathname,
 							     GNUTLS_X509_FMT_PEM);
 		free(pathname);
@@ -150,7 +151,7 @@ static int tlshd_server_get_truststore(gnutls_certificate_credentials_t cred)
 		return ret;
 	tlshd_log_debug("System trust: Loaded %d certificate(s).", ret);
 
-	if (tlshd_config_get_server_crl(&pathname)) {
+	if (tlshd_config_get_crl(PEER_TYPE_SERVER, &pathname)) {
 		ret = gnutls_certificate_set_x509_crl_file(cred, pathname,
 							   GNUTLS_X509_FMT_PEM);
 		free(pathname);
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 2857804..6ba45ac 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -45,6 +45,11 @@ struct tlshd_handshake_parms {
 	unsigned int	session_status;
 };
 
+enum peer_type {
+	PEER_TYPE_CLIENT,
+	PEER_TYPE_SERVER,
+};
+
 /* client.c */
 extern void tlshd_tls13_clienthello_handshake(struct tlshd_handshake_parms *parms);
 extern void tlshd_quic_clienthello_handshake(struct tlshd_handshake_parms *parms);
@@ -52,16 +57,11 @@ extern void tlshd_quic_clienthello_handshake(struct tlshd_handshake_parms *parms
 /* config.c */
 bool tlshd_config_init(const gchar *pathname);
 void tlshd_config_shutdown(void);
-bool tlshd_config_get_client_truststore(char **bundle);
-bool tlshd_config_get_client_crl(char **result);
-bool tlshd_config_get_client_certs(gnutls_pcert_st *certs,
-				   unsigned int *certs_len);
-bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey);
-bool tlshd_config_get_server_truststore(char **bundle);
-bool tlshd_config_get_server_crl(char **result);
-bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
-				   unsigned int *certs_len);
-bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey);
+bool tlshd_config_get_truststore(int peer_type, char **bundle);
+bool tlshd_config_get_crl(int peer_type, char **result);
+bool tlshd_config_get_certs(int peer_type, gnutls_pcert_st *certs,
+			    unsigned int *certs_len);
+bool tlshd_config_get_privkey(int peer_type, gnutls_privkey_t *privkey);
 
 /* handshake.c */
 extern void tlshd_start_tls_handshake(gnutls_session_t session,
-- 
2.50.1


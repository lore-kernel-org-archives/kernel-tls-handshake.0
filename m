Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9941325DB0A
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 28 Aug 2025 22:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756419844; cv=none; b=hkGRWfQJF5oujJ24S9t1GOHNxFJExe3knZIL4cFvycKrOddbED6K59elmUipLYIgyR5yWenYeMN5K/yjzUAlH0rEWLqyJEkrmCK+VQOZ2X7hnhxexHE67QDHiyPrCGbERiVCXW5A1Yyxn5cRriiDGw62b00lWAkLtk+kvtGu55g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756419844; c=relaxed/simple;
	bh=Fojk72YEjpunso8cwPKB1Rwhrbr4hi0idqHn4lxXM1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=HHmFrQFbcPKjayx5fx9besWIeedRkpV6X5rd+onOkZqB89NY10CFJxpLQZpUnUzbOkRZcEQ1NEGB8c8KNUbKZIH7WnjHK9/+IJyt3RzmpBx98zDBUWiMdpS9O2oJ3J2112FgGAiVJsM2ru3wDB6+ki4YKoQmAZmVZ7E3RUTvn4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hdqty6c1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hdqty6c1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756419839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fNeNuYmzUc4Cz0cGSts26wHOwGRQRDS3o//RyoqOHb0=;
	b=hdqty6c1Acbq91zaJ6xOyiygV9TtHNG+ofoX0paUu1dpCJJgapU8UBaJE5zZrSBjuzbZBe
	Nff4wtlUe5VEJsrXhWkpdk4qVIEr/zvMxrEa9jne/uhpl4W93EJiszON/6+7PQelXNF7iq
	ud+05df/+lcqXaG6f+nCbPFAP530s+k=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-390-ub_-5VU6NneAgQXmnTJSng-1; Thu,
 28 Aug 2025 18:23:53 -0400
X-MC-Unique: ub_-5VU6NneAgQXmnTJSng-1
X-Mimecast-MFC-AGG-ID: ub_-5VU6NneAgQXmnTJSng_1756419832
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2D97E1800347;
	Thu, 28 Aug 2025 22:23:52 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.88.80])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C5FF91956048;
	Thu, 28 Aug 2025 22:23:51 +0000 (UTC)
Received: from aion.redhat.com (localhost [IPv6:::1])
	by aion.redhat.com (Postfix) with ESMTP id B1B6E41A7B8;
	Thu, 28 Aug 2025 18:23:48 -0400 (EDT)
From: Scott Mayhew <smayhew@redhat.com>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [PATCH 5/5] tlshd: Client-side dual certificate support
Date: Thu, 28 Aug 2025 18:23:48 -0400
Message-ID: <20250828222348.601924-6-smayhew@redhat.com>
In-Reply-To: <20250828222348.601924-1-smayhew@redhat.com>
References: <20250828222348.601924-1-smayhew@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qKCr8ZhGYT7vzPdXWUkxt8ZVOM7Hah6p8eIWxFLrxx4_1756419832
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add two new config options "x509.pq.certificate" and
"x509.pq.private_key", this time to the "[authenticate.client]" stanza
of tlshd.conf.  This is for client-side handling of the server's
certificate request when the client is mounting with "xprtsec=mtls".

This commit also makes sure the client-side x509.pq.certificate is using
a post-quantum public-key algorithm, and we make sure that the server
supports that algorithm before returning that cert in the cert callback
(unlike the server-side cert callback, the pk_algos list is populated,
so this check is more straightforward than on the server-side).

Link: https://github.com/oracle/ktls-utils/issues/113
Signed-off-by: Scott Mayhew <smayhew@redhat.com>
---
 src/tlshd/client.c   |  66 +++++++++++++++++++++++++--
 src/tlshd/config.c   | 104 ++++++++++++++++++++++++++-----------------
 src/tlshd/tlshd.conf |   2 +
 src/tlshd/tlshd.h    |   9 ++--
 4 files changed, 132 insertions(+), 49 deletions(-)

diff --git a/src/tlshd/client.c b/src/tlshd/client.c
index 72cdd60..d74ea69 100644
--- a/src/tlshd/client.c
+++ b/src/tlshd/client.c
@@ -138,12 +138,24 @@ static gnutls_privkey_t tlshd_privkey;
 static unsigned int tlshd_certs_len = TLSHD_MAX_CERTS;
 static gnutls_pcert_st tlshd_certs[TLSHD_MAX_CERTS];
 
+#ifdef HAVE_GNUTLS_MLDSA
+static gnutls_privkey_t tlshd_pq_privkey;
+static unsigned int tlshd_pq_certs_len = TLSHD_MAX_CERTS;
+static gnutls_pcert_st tlshd_pq_certs[TLSHD_MAX_CERTS];
+static gnutls_pk_algorithm_t tlshd_pq_pkalg = GNUTLS_PK_UNKNOWN;
+#endif /* HAVE_GNUTLS_MLDSA */
+
 static bool tlshd_x509_client_get_certs(struct tlshd_handshake_parms *parms)
 {
 	if (parms->x509_cert != TLS_NO_CERT)
 		return tlshd_keyring_get_certs(parms->x509_cert, tlshd_certs,
 					       &tlshd_certs_len);
-	return tlshd_config_get_client_certs(tlshd_certs, &tlshd_certs_len);
+#ifdef HAVE_GNUTLS_MLDSA
+	tlshd_config_get_client_certs("x509.pq.certificate", tlshd_pq_certs,
+				      &tlshd_pq_certs_len, &tlshd_pq_pkalg);
+#endif /* HAVE_GNUTLS_MLDSA */
+	return tlshd_config_get_client_certs("x509.certificate", tlshd_certs,
+					     &tlshd_certs_len, NULL);
 }
 
 static void tlshd_x509_client_put_certs(void)
@@ -152,6 +164,11 @@ static void tlshd_x509_client_put_certs(void)
 
 	for (i = 0; i < tlshd_certs_len; i++)
 		gnutls_pcert_deinit(&tlshd_certs[i]);
+
+#ifdef HAVE_GNUTLS_MLDSA
+	for (i = 0; i < tlshd_pq_certs_len; i++)
+		gnutls_pcert_deinit(&tlshd_pq_certs[i]);
+#endif /* HAVE_GNUTLS_MLDSA */
 }
 
 static bool tlshd_x509_client_get_privkey(struct tlshd_handshake_parms *parms)
@@ -159,12 +176,18 @@ static bool tlshd_x509_client_get_privkey(struct tlshd_handshake_parms *parms)
 	if (parms->x509_privkey != TLS_NO_PRIVKEY)
 		return tlshd_keyring_get_privkey(parms->x509_privkey,
 						 &tlshd_privkey);
-	return tlshd_config_get_client_privkey(&tlshd_privkey);
+#ifdef HAVE_GNUTLS_MLDSA
+	tlshd_config_get_client_privkey("x509.pq.private_key", &tlshd_pq_privkey);
+#endif /* HAVE_GNUTLS_MLDSA */
+	return tlshd_config_get_client_privkey("x509.private_key", &tlshd_privkey);
 }
 
 static void tlshd_x509_client_put_privkey(void)
 {
 	gnutls_privkey_deinit(tlshd_privkey);
+#ifdef HAVE_GNUTLS_MLDSA
+	gnutls_privkey_deinit(tlshd_pq_privkey);
+#endif /* HAVE_GNUTLS_MLDSA */
 }
 
 static void tlshd_x509_log_issuers(const gnutls_datum_t *req_ca_rdn, int nreqs)
@@ -203,13 +226,21 @@ static void tlshd_x509_log_issuers(const gnutls_datum_t *req_ca_rdn, int nreqs)
 static int
 tlshd_x509_retrieve_key_cb(gnutls_session_t session,
 			   const gnutls_datum_t *req_ca_rdn, int nreqs,
-			   __attribute__ ((unused)) const gnutls_pk_algorithm_t *pk_algos,
-			   __attribute__ ((unused)) int pk_algos_length,
+			   const gnutls_pk_algorithm_t *pk_algos,
+			   int pk_algos_length,
 			   gnutls_pcert_st **pcert,
 			   unsigned int *pcert_length,
 			   gnutls_privkey_t *privkey)
 {
+#ifndef HAVE_GNUTLS_MLDSA
+	(void)pk_algos;
+	(void)pk_algos_length;
+#endif /* HAVE_GNUTLS_MLDSA */
 	gnutls_certificate_type_t type;
+#ifdef HAVE_GNUTLS_MLDSA
+	bool use_pq_cert = false;
+	int i;
+#endif /* HAVE_GNUTLS_MLDSA */
 
 	tlshd_x509_log_issuers(req_ca_rdn, nreqs);
 
@@ -217,9 +248,36 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
 	if (type != GNUTLS_CRT_X509)
 		return -1;
 
+#ifdef HAVE_GNUTLS_MLDSA
+	if (tlshd_pq_pkalg != GNUTLS_PK_UNKNOWN) {
+		for (i = 0; i < pk_algos_length; i++) {
+			if (pk_algos[i] == tlshd_pq_pkalg) {
+				use_pq_cert = true;
+				break;
+			}
+		}
+		if (use_pq_cert == true) {
+			tlshd_log_debug("%s: Server supports %s", __func__,
+					gnutls_pk_algorithm_get_name(pk_algos[i]));
+		}
+	}
+
+	if (use_pq_cert == true) {
+		tlshd_log_debug("%s: Selecting x509.pq.certificate from conf file", __func__);
+		*pcert_length = tlshd_pq_certs_len;
+		*pcert = tlshd_pq_certs;
+		*privkey = tlshd_pq_privkey;
+	} else {
+		tlshd_log_debug("%s: Selecting x509.certificate from conf file", __func__);
+		*pcert_length = tlshd_certs_len;
+		*pcert = tlshd_certs;
+		*privkey = tlshd_privkey;
+	}
+#else
 	*pcert_length = tlshd_certs_len;
 	*pcert = tlshd_certs;
 	*privkey = tlshd_privkey;
+#endif /* HAVE_GNUTLS_MLDSA */
 	return 0;
 }
 
diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index 735d24a..7af345b 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -248,24 +248,68 @@ bool tlshd_config_get_client_crl(char **result)
 	return true;
 }
 
+#ifdef HAVE_GNUTLS_MLDSA
+static bool tlshd_cert_check_pk_alg(gnutls_datum_t *data,
+				    gnutls_pk_algorithm_t *pkalg)
+{
+	gnutls_x509_crt_t cert;
+	gnutls_pk_algorithm_t pk_alg;
+	int ret;
+
+	ret = gnutls_x509_crt_init(&cert);
+	if (ret < 0)
+		return false;
+
+	ret = gnutls_x509_crt_import(cert, data, GNUTLS_X509_FMT_PEM);
+	if (ret < 0) {
+		gnutls_x509_crt_deinit(cert);
+		return false;
+	}
+
+	pk_alg = gnutls_x509_crt_get_pk_algorithm(cert, NULL);
+	tlshd_log_debug("%s: certificate pk algorithm %s", __func__,
+			gnutls_pk_algorithm_get_name(pk_alg));
+	switch (pk_alg) {
+	case GNUTLS_PK_MLDSA44:
+	case GNUTLS_PK_MLDSA65:
+	case GNUTLS_PK_MLDSA87:
+		*pkalg = pk_alg;
+		break;
+	default:
+		gnutls_x509_crt_deinit(cert);
+		return false;
+	}
+
+	gnutls_x509_crt_deinit(cert);
+	return true;
+}
+#endif /* HAVE_GNUTLS_MLDSA */
+
 /**
  * tlshd_config_get_client_certs - Get certs for ClientHello from .conf
+ * @key: IN: the key field name from .conf
  * @certs: OUT: in-memory certificates
  * @certs_len: IN: maximum number of certs to get, OUT: number of certs found
+ * @pkgalg: OUT: the PQ public-key alg that was used in the cert
  *
  * Return values:
  *   %true: certificate retrieved successfully
  *   %false: certificate not retrieved
  */
-bool tlshd_config_get_client_certs(gnutls_pcert_st *certs,
-				   unsigned int *certs_len)
+bool tlshd_config_get_client_certs(const gchar *key,
+				   gnutls_pcert_st *certs,
+				   unsigned int *certs_len,
+				   gnutls_pk_algorithm_t *pkalg)
 {
+#ifndef HAVE_GNUTLS_MLSDA
+	(void)pkalg;
+#endif /* HAVE_GNUTLS_MLDSA */
 	gnutls_datum_t data;
 	gchar *pathname;
 	int ret;
 
 	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.client",
-					"x509.certificate", NULL);
+					key, NULL);
 	if (!pathname)
 		return false;
 
@@ -275,6 +319,17 @@ bool tlshd_config_get_client_certs(gnutls_pcert_st *certs,
 		return false;
 	}
 
+#ifdef HAVE_GNUTLS_MLDSA
+	if (pkalg && !tlshd_cert_check_pk_alg(&data, pkalg)) {
+		tlshd_log_debug("%s: %s certificate not using a PQ public-key algorithm",
+				__func__, key);
+		free(data.data);
+		g_free(pathname);
+		*certs_len = 0;
+		return false;
+	}
+#endif /* HAVE_GNUTLS_MLDSA */
+
 	/* Config file supports only PEM-encoded certificates */
 	ret = gnutls_pcert_list_import_x509_raw(certs, certs_len, &data,
 						GNUTLS_X509_FMT_PEM, 0);
@@ -293,20 +348,22 @@ bool tlshd_config_get_client_certs(gnutls_pcert_st *certs,
 
 /**
  * tlshd_config_get_client_privkey - Get private key for ClientHello from .conf
+ * @key: IN: the key field name from .conf
  * @privkey: OUT: in-memory private key
  *
  * Return values:
  *   %true: private key retrieved successfully
  *   %false: private key not retrieved
  */
-bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey)
+bool tlshd_config_get_client_privkey(const gchar *key,
+				     gnutls_privkey_t *privkey)
 {
 	gnutls_datum_t data;
 	gchar *pathname;
 	int ret;
 
 	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.client",
-					"x509.private_key", NULL);
+					key, NULL);
 	if (!pathname)
 		return false;
 
@@ -401,43 +458,6 @@ bool tlshd_config_get_server_crl(char **result)
 	return true;
 }
 
-#ifdef HAVE_GNUTLS_MLDSA
-static bool tlshd_cert_check_pk_alg(gnutls_datum_t *data,
-				    gnutls_pk_algorithm_t *pkalg)
-{
-	gnutls_x509_crt_t cert;
-	gnutls_pk_algorithm_t pk_alg;
-	int ret;
-
-	ret = gnutls_x509_crt_init(&cert);
-	if (ret < 0)
-		return false;
-
-	ret = gnutls_x509_crt_import(cert, data, GNUTLS_X509_FMT_PEM);
-	if (ret < 0) {
-		gnutls_x509_crt_deinit(cert);
-		return false;
-	}
-
-	pk_alg = gnutls_x509_crt_get_pk_algorithm(cert, NULL);
-	tlshd_log_debug("%s: certificate pk algorithm %s", __func__,
-			gnutls_pk_algorithm_get_name(pk_alg));
-	switch (pk_alg) {
-	case GNUTLS_PK_MLDSA44:
-	case GNUTLS_PK_MLDSA65:
-	case GNUTLS_PK_MLDSA87:
-		*pkalg = pk_alg;
-		break;
-	default:
-		gnutls_x509_crt_deinit(cert);
-		return false;
-	}
-
-	gnutls_x509_crt_deinit(cert);
-	return true;
-}
-#endif /* HAVE_GNUTLS_MLDSA */
-
 /**
  * tlshd_config_get_server_certs - Get certs for ServerHello from .conf
  * @key: IN: the key field name from .conf
diff --git a/src/tlshd/tlshd.conf b/src/tlshd/tlshd.conf
index 5419146..1d4220e 100644
--- a/src/tlshd/tlshd.conf
+++ b/src/tlshd/tlshd.conf
@@ -33,6 +33,8 @@ nl=0
 #x509.crl= <pathname>
 #x509.certificate= <pathname>
 #x509.private_key= <pathname>
+#x509.pq.certificate= <pathname>
+#x509.pq.private_key= <pathname>
 
 [authenticate.server]
 #x509.truststore= <pathname>
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index ca84d8f..a95ef70 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -54,9 +54,12 @@ bool tlshd_config_init(const gchar *pathname);
 void tlshd_config_shutdown(void);
 bool tlshd_config_get_client_truststore(char **bundle);
 bool tlshd_config_get_client_crl(char **result);
-bool tlshd_config_get_client_certs(gnutls_pcert_st *certs,
-				   unsigned int *certs_len);
-bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey);
+bool tlshd_config_get_client_certs(const gchar *key,
+				   gnutls_pcert_st *certs,
+				   unsigned int *certs_len,
+				   gnutls_pk_algorithm_t *pkalg);
+bool tlshd_config_get_client_privkey(const gchar *key,
+				     gnutls_privkey_t *privkey);
 bool tlshd_config_get_server_truststore(char **bundle);
 bool tlshd_config_get_server_crl(char **result);
 bool tlshd_config_get_server_certs(const gchar *key,
-- 
2.50.1


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E20A2D3228
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 11 Sep 2025 21:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757626105; cv=none; b=RqoQTZZWYxw5jbtbtp7Jr0UFUkfIODXpIZR+lJ0uWF30hx3K8XOzIVdtWu4+KGqVFMf787fVP19IXtWlt8j1QXLXavUrnBcSzHJYFgED7dKYVIDWZqpOI0X0/ib7TU3vYfc/61Dl/OD2HHgPdxv8QOUVUUeNqwEIh0a4FlM7TrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757626105; c=relaxed/simple;
	bh=OaqpIGeiV2VSDJ5S4uDdIqPAUlfVRWX7kU1LOeqdut4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=XDdFLW2183/npqReE+tWaXORi7HRk9wyQx9eGAMBvS4Vn447gEKvfbxp+2i1pFyomFJc+9TtcUBo7mfOBU3Ff75f2rzGPLvKq3ngVl8OJNVTHtoFe+BzWBXZfgKr/DZxRnKGx1N9FaQxvmiSoNCOeijUCt7aRB3PzfHDzu0IR1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MXj0GaQ/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MXj0GaQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757626101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jzqew9Gd0CqeIVZEomrLLV0pgpP9DtslLjqsV43/U3c=;
	b=MXj0GaQ/Frg1k7bWBYWLFdUHICwUp05h8rMCO3OQOsi9JgfO1UfPoJ/GWwDJ6BwKxOiA32
	IpC1fL/pxItF0wQeLQAfO1wweoY0FP9koFaA8Y9HWV6X/JXZDU2fIjfAQjtwXleWuFEpQi
	aW0gG4oJvHWYtebwTeGXmC/8XXJi1bo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-628-hQ3Lo7D-NtyBc4BMRf0V4g-1; Thu,
 11 Sep 2025 17:28:18 -0400
X-MC-Unique: hQ3Lo7D-NtyBc4BMRf0V4g-1
X-Mimecast-MFC-AGG-ID: hQ3Lo7D-NtyBc4BMRf0V4g_1757626097
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 695A31945102;
	Thu, 11 Sep 2025 21:28:17 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.88.97])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B41F1944CCA;
	Thu, 11 Sep 2025 21:28:16 +0000 (UTC)
Received: from aion.redhat.com (localhost [IPv6:::1])
	by aion.redhat.com (Postfix) with ESMTP id 3E7B3430202;
	Thu, 11 Sep 2025 17:28:15 -0400 (EDT)
From: Scott Mayhew <smayhew@redhat.com>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [PATCH v2 3/4] tlshd: Server-side dual certificate support
Date: Thu, 11 Sep 2025 17:28:14 -0400
Message-ID: <20250911212815.1414784-4-smayhew@redhat.com>
In-Reply-To: <20250911212815.1414784-1-smayhew@redhat.com>
References: <20250911212815.1414784-1-smayhew@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2E6uyS1gORsGtSSFjmmBXnQHTi6K2EcBO0fHBdDLaPE_1757626097
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add two new config options, "x509.pq.certificate" and
"x509.pq.private_key" to configure tlshd to use an ML-DSA certificate.
If the cert callback determines that the client supports ML-DSA, it will
select this certificate.  Otherwise, it will fall back to the
traditional certficate (i.e. the certificate configured via
"x509.certificate" and "x509.private_key").

Note that we check to ensure that the PQ certificate is using a
post-quantum public-key algorithm (ML-DSA-44, ML-DSA-65, or ML-DSA-87),
and we store the algorithm value so we can later compare it to the list
of signing algorithms supported by the client in the cert callback.

Link: https://github.com/oracle/ktls-utils/issues/113
Signed-off-by: Scott Mayhew <smayhew@redhat.com>
---
 configure.ac             |  12 ++++
 src/tlshd/client.c       |   6 +-
 src/tlshd/config.c       | 132 ++++++++++++++++++++++++++++++++++++---
 src/tlshd/server.c       |  65 ++++++++++++++++++-
 src/tlshd/tlshd.conf     |   2 +
 src/tlshd/tlshd.conf.man |  15 +++++
 src/tlshd/tlshd.h        |   7 ++-
 7 files changed, 225 insertions(+), 14 deletions(-)

diff --git a/configure.ac b/configure.ac
index a6d9d09..0dd23f2 100644
--- a/configure.ac
+++ b/configure.ac
@@ -79,6 +79,18 @@ AC_CHECK_LIB([gnutls], [gnutls_get_system_config_file],
 AC_CHECK_LIB([gnutls], [gnutls_psk_allocate_client_credentials2],
              [AC_DEFINE([HAVE_GNUTLS_PSK_ALLOCATE_CREDENTIALS2], [1],
                         [Define to 1 if you have the gnutls_psk_allocate_client_credentials2 function.])])
+
+AC_MSG_CHECKING(for ML-DSA support in gnutls)
+AC_COMPILE_IFELSE(
+	[AC_LANG_PROGRAM([[ #include <gnutls/gnutls.h> ]],
+		[[ (void) GNUTLS_SIGN_MLDSA65; ]])],
+	[ have_mldsa=yes ],
+	[ have_mldsa=no ])
+AC_MSG_RESULT([$have_mldsa])
+if test "x$have_mldsa" = xyes ; then
+	AC_DEFINE([HAVE_GNUTLS_MLDSA], [1], [Define to 1 if gnutls supports ML-DSA])
+fi
+
 AC_SUBST([AM_CPPFLAGS])
 
 AC_CONFIG_FILES([Makefile src/Makefile src/tlshd/Makefile systemd/Makefile])
diff --git a/src/tlshd/client.c b/src/tlshd/client.c
index c07ae29..257e835 100644
--- a/src/tlshd/client.c
+++ b/src/tlshd/client.c
@@ -143,8 +143,8 @@ static bool tlshd_x509_client_get_certs(struct tlshd_handshake_parms *parms)
 	if (parms->x509_cert != TLS_NO_CERT)
 		return tlshd_keyring_get_certs(parms->x509_cert, tlshd_certs,
 					       &tlshd_certs_len);
-	return tlshd_config_get_certs(PEER_TYPE_CLIENT, tlshd_certs,
-				      &tlshd_certs_len);
+	return tlshd_config_get_certs(PEER_TYPE_CLIENT, tlshd_certs, NULL,
+				      &tlshd_certs_len, NULL);
 }
 
 static void tlshd_x509_client_put_certs(void)
@@ -160,7 +160,7 @@ static bool tlshd_x509_client_get_privkey(struct tlshd_handshake_parms *parms)
 	if (parms->x509_privkey != TLS_NO_PRIVKEY)
 		return tlshd_keyring_get_privkey(parms->x509_privkey,
 						 &tlshd_privkey);
-	return tlshd_config_get_privkey(PEER_TYPE_CLIENT, &tlshd_privkey);
+	return tlshd_config_get_privkey(PEER_TYPE_CLIENT, NULL, &tlshd_privkey);
 }
 
 static void tlshd_x509_client_put_privkey(void)
diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index ff1f2a5..9a3b6b2 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -260,18 +260,66 @@ bool tlshd_config_get_crl(int peer_type, char **result)
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
+#else
+static bool tlshd_cert_check_pk_alg(__attribute__ ((unused)) gnutls_datum_t *data,
+				    __attribute__ ((unused)) gnutls_pk_algorithm_t *pkalg)
+{
+	tlshd_log_debug("%s: gnutls version does not have ML-DSA support",
+			__func__);
+	return false;
+}
+#endif /* HAVE_GNUTLS_MLDSA */
+
 /**
- * tlshd_config_get_certs - Get certs for {Client,Server} Hello from .conf
+ * __tlshd_config_get_certs - Helper for tlshd_config_get_certs()
  * @peer_type: IN: peer type
  * @certs: OUT: in-memory certificates
  * @certs_len: IN: maximum number of certs to get, OUT: number of certs found
+ * @pkgalg: IN: if non-NULL, indicates we want to retrieve the PQ cert,
+ *	 OUT: if non-NULL, store the PQ public-key alg that was used in the PQ cert
  *
  * Return values:
  *   %true: certificate retrieved successfully
  *   %false: certificate not retrieved
  */
-bool tlshd_config_get_certs(int peer_type, gnutls_pcert_st *certs,
-			    unsigned int *certs_len)
+static bool __tlshd_config_get_certs(int peer_type, gnutls_pcert_st *certs,
+				     unsigned int *certs_len,
+				     gnutls_pk_algorithm_t *pkalg)
 {
 	gnutls_datum_t data;
 	gchar *pathname;
@@ -281,7 +329,10 @@ bool tlshd_config_get_certs(int peer_type, gnutls_pcert_st *certs,
 					 peer_type == PEER_TYPE_CLIENT ?
 					 "authenticate.client" :
 					 "authenticate.server",
-					 "x509.certificate", NULL);
+					 pkalg != NULL ?
+					 "x509.pq.certificate" :
+					 "x509.certificate",
+					 NULL);
 	if (!pathname)
 		return false;
 
@@ -291,6 +342,15 @@ bool tlshd_config_get_certs(int peer_type, gnutls_pcert_st *certs,
 		return false;
 	}
 
+	if (pkalg && !tlshd_cert_check_pk_alg(&data, pkalg)) {
+		tlshd_log_debug("%s: %s not using a PQ public-key algorithm",
+				__func__, pathname);
+		free(data.data);
+		g_free(pathname);
+		*certs_len = 0;
+		return false;
+	}
+
 	/* Config file supports only PEM-encoded certificates */
 	ret = gnutls_pcert_list_import_x509_raw(certs, certs_len, &data,
 						GNUTLS_X509_FMT_PEM, 0);
@@ -310,15 +370,51 @@ bool tlshd_config_get_certs(int peer_type, gnutls_pcert_st *certs,
 }
 
 /**
- * tlshd_config_get_privkey - Get private key for {Client,Server}Hello from .conf
+ * tlshd_config_get_certs - Get certs for {Client,Server} Hello from .conf
+ * @peer_type: IN: peer type
+ * @certs: OUT: in-memory certificates
+ * @pq_certs_len: IN: maximum number of PQ certs to get, OUT: number of PQ certs found
+ * @certs_len: IN: maximum number of certs to get, OUT: number of certs found
+ * @pkgalg: OUT: the PQ public-key alg that was used in the PQ cert
+ *
+ * Retrieve the PQ cert(s) first, then the RSA cert(s).  Both are stored in the
+ * same list.  Note that @pq_certs_len is deducted from the available @certs_len
+ * and is also used to determine the offset to store the RSA cert(s) in the
+ * @certs array.
+ *
+ * Return values:
+ *   %true: certificate retrieved successfully
+ *   %false: certificate not retrieved
+ */
+bool tlshd_config_get_certs(int peer_type, gnutls_pcert_st *certs,
+			    unsigned int *pq_certs_len,
+			    unsigned int *certs_len,
+			    gnutls_pk_algorithm_t *pkalg)
+{
+	bool ret;
+
+	ret = __tlshd_config_get_certs(peer_type, certs, pq_certs_len, pkalg);
+
+	if (ret == true)
+		*certs_len -= *pq_certs_len;
+	else
+		*pq_certs_len = 0;
+
+	return __tlshd_config_get_certs(peer_type, certs + *pq_certs_len,
+					certs_len, NULL);
+}
+
+/**
+ * __tlshd_config_get_privkey - Helper for tlshd_config_get_privkey()
  * @peer_type: IN: peer type
  * @privkey: OUT: in-memory private key
+ * @pq: IN: if true, retrieve the PQ private key
  *
  * Return values:
  *   %true: private key retrieved successfully
  *   %false: private key not retrieved
  */
-bool tlshd_config_get_privkey(int peer_type, gnutls_privkey_t *privkey)
+static bool __tlshd_config_get_privkey(int peer_type, gnutls_privkey_t *privkey, bool pq)
 {
 	gnutls_datum_t data;
 	gchar *pathname;
@@ -328,7 +424,10 @@ bool tlshd_config_get_privkey(int peer_type, gnutls_privkey_t *privkey)
 					 peer_type == PEER_TYPE_CLIENT ?
 					 "authenticate.client" :
 					 "authenticate.server",
-					 "x509.private_key", NULL);
+					 pq == true ?
+					 "x509.pq.private_key" :
+					 "x509.private_key",
+					 NULL);
 	if (!pathname)
 		return false;
 
@@ -360,3 +459,22 @@ bool tlshd_config_get_privkey(int peer_type, gnutls_privkey_t *privkey)
 	g_free(pathname);
 	return true;
 }
+
+/**
+ * tlshd_config_get_privkey - Get private key for {Client,Server}Hello from .conf
+ * @peer_type: IN: peer type
+ * @pq_privkey: OUT: in-memory PQ private key
+ * @privkey: OUT: in-memory private key
+ *
+ * Retrieve the PQ private key first, then the RSA private key.
+ *
+ * Return values:
+ *   %true: private key retrieved successfully
+ *   %false: private key not retrieved
+ */
+bool tlshd_config_get_privkey(int peer_type, gnutls_privkey_t *pq_privkey,
+			      gnutls_privkey_t *privkey)
+{
+	__tlshd_config_get_privkey(peer_type, pq_privkey, true);
+	return __tlshd_config_get_privkey(peer_type, privkey, false);
+}
diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index efea387..13b805c 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -42,9 +42,12 @@
 #include "tlshd.h"
 #include "netlink.h"
 
+static gnutls_privkey_t tlshd_server_pq_privkey;
 static gnutls_privkey_t tlshd_server_privkey;
+static unsigned int tlshd_server_pq_certs_len = TLSHD_MAX_CERTS;
 static unsigned int tlshd_server_certs_len = TLSHD_MAX_CERTS;
 static gnutls_pcert_st tlshd_server_certs[TLSHD_MAX_CERTS];
+static gnutls_pk_algorithm_t tlshd_server_pq_pkalg = GNUTLS_PK_UNKNOWN;
 
 static bool tlshd_x509_server_get_certs(struct tlshd_handshake_parms *parms)
 {
@@ -53,14 +56,16 @@ static bool tlshd_x509_server_get_certs(struct tlshd_handshake_parms *parms)
 					       tlshd_server_certs,
 					       &tlshd_server_certs_len);
 	return tlshd_config_get_certs(PEER_TYPE_SERVER, tlshd_server_certs,
-				      &tlshd_server_certs_len);
+				      &tlshd_server_pq_certs_len,
+				      &tlshd_server_certs_len,
+				      &tlshd_server_pq_pkalg);
 }
 
 static void tlshd_x509_server_put_certs(void)
 {
 	unsigned int i;
 
-	for (i = 0; i < tlshd_server_certs_len; i++)
+	for (i = 0; i < TLSHD_MAX_CERTS; i++)
 		gnutls_pcert_deinit(&tlshd_server_certs[i]);
 }
 
@@ -70,11 +75,13 @@ static bool tlshd_x509_server_get_privkey(struct tlshd_handshake_parms *parms)
 		return tlshd_keyring_get_privkey(parms->x509_privkey,
 						 &tlshd_server_privkey);
 	return tlshd_config_get_privkey(PEER_TYPE_SERVER,
+					&tlshd_server_pq_privkey,
 					&tlshd_server_privkey);
 }
 
 static void tlshd_x509_server_put_privkey(void)
 {
+	gnutls_privkey_deinit(tlshd_server_pq_privkey);
 	gnutls_privkey_deinit(tlshd_server_privkey);
 }
 
@@ -123,6 +130,11 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
 			   gnutls_privkey_t *privkey)
 {
 	gnutls_certificate_type_t type;
+#ifdef HAVE_GNUTLS_MLDSA
+	gnutls_sign_algorithm_t client_alg;
+	bool use_pq_cert = false;
+	int i, ret;
+#endif /* HAVE_GNUTLS_MLDSA */
 
 	tlshd_x509_log_issuers(req_ca_rdn, nreqs);
 
@@ -130,9 +142,58 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
 	if (type != GNUTLS_CRT_X509)
 		return -1;
 
+#ifdef HAVE_GNUTLS_MLDSA
+	/*
+ 	 * NB: Unfortunately when the callback function is invoked server-side,
+ 	 * pk_algos is NULL and pk_algos_length is 0. So we check the signature
+ 	 * algorithms the client supports and try to match one of them to the
+ 	 * public-key algorithm used by the server cert.
+ 	 */
+	if (tlshd_server_pq_pkalg != GNUTLS_PK_UNKNOWN) {
+		for (i = 0; ; i++) {
+			ret = gnutls_sign_algorithm_get_requested(session, i, &client_alg);
+			if (ret != GNUTLS_E_SUCCESS)
+				break;
+			switch (client_alg) {
+			case GNUTLS_SIGN_MLDSA44:
+				if (tlshd_server_pq_pkalg == GNUTLS_PK_MLDSA44)
+					use_pq_cert = true;
+				break;
+			case GNUTLS_SIGN_MLDSA65:
+				if (tlshd_server_pq_pkalg == GNUTLS_PK_MLDSA65)
+					use_pq_cert = true;
+				break;
+			case GNUTLS_SIGN_MLDSA87:
+				if (tlshd_server_pq_pkalg == GNUTLS_PK_MLDSA87)
+					use_pq_cert = true;
+				break;
+			default:
+				break;
+			}
+			if (use_pq_cert == true) {
+				tlshd_log_debug("%s: Client supports %s", __func__,
+						gnutls_sign_get_name(client_alg));
+				break;
+			}
+		}
+	}
+
+	if (use_pq_cert == true) {
+		tlshd_log_debug("%s: Selecting x509.pq.certificate from conf file", __func__);
+		*pcert_length = tlshd_server_pq_certs_len;
+		*pcert = tlshd_server_certs;
+		*privkey = tlshd_server_pq_privkey;
+	} else {
+		tlshd_log_debug("%s: Selecting x509.certificate from conf file", __func__);
+		*pcert_length = tlshd_server_certs_len;
+		*pcert = tlshd_server_certs + tlshd_server_pq_certs_len;
+		*privkey = tlshd_server_privkey;
+	}
+#else
 	*pcert_length = tlshd_server_certs_len;
 	*pcert = tlshd_server_certs;
 	*privkey = tlshd_server_privkey;
+#endif /* HAVE_GNUTLS_MLDSA */
 	return 0;
 }
 
diff --git a/src/tlshd/tlshd.conf b/src/tlshd/tlshd.conf
index 620bd17..5419146 100644
--- a/src/tlshd/tlshd.conf
+++ b/src/tlshd/tlshd.conf
@@ -39,3 +39,5 @@ nl=0
 #x509.crl= <pathname>
 #x509.certificate= <pathname>
 #x509.private_key= <pathname>
+#x509.pq.certificate= <pathname>
+#x509.pq.private_key= <pathname>
diff --git a/src/tlshd/tlshd.conf.man b/src/tlshd/tlshd.conf.man
index 914261e..575d88b 100644
--- a/src/tlshd/tlshd.conf.man
+++ b/src/tlshd/tlshd.conf.man
@@ -125,6 +125,21 @@ a handshake request when no other certificate is available.
 .B x509.private_key
 This option specifies the pathname of a file containing
 a PEM-encoded private key associated with the above certificate.
+.TP
+.B x509.pq.certificate
+This option specifies the pathname of a file containing
+a PEM-encoded x.509 certificate that is to be presented during
+a handshake request if the peer supports post-quantum cryptography.
+This certificate must be using a post-quantum public-key algorithm
+(ML-DSA-44, ML-DSA-65, or ML-DSA-87).
+If the peer does not support post-quantum cryptography, the
+certificate configured in the
+.I x509.certificate
+option will be presented instead.
+.TP
+.B x509.pq.private_key
+This option specifies the pathname of a file containing
+a PEM-encoded private key associated with the above certificate.
 .SH SEE ALSO
 .BR tlshd (8)
 .SH AUTHOR
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 6ba45ac..664de67 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -60,8 +60,11 @@ void tlshd_config_shutdown(void);
 bool tlshd_config_get_truststore(int peer_type, char **bundle);
 bool tlshd_config_get_crl(int peer_type, char **result);
 bool tlshd_config_get_certs(int peer_type, gnutls_pcert_st *certs,
-			    unsigned int *certs_len);
-bool tlshd_config_get_privkey(int peer_type, gnutls_privkey_t *privkey);
+			    unsigned int *pq_certs_len,
+			    unsigned int *certs_len,
+			    gnutls_pk_algorithm_t *pkalg);
+bool tlshd_config_get_privkey(int peer_type, gnutls_privkey_t *pq_privkey,
+			      gnutls_privkey_t *privkey);
 
 /* handshake.c */
 extern void tlshd_start_tls_handshake(gnutls_session_t session,
-- 
2.50.1


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EAB26D4CD
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 28 Aug 2025 22:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756419839; cv=none; b=fVRv7haRkGsDCvsGFKPUkmEHFyI3FoKztvPQ5Wl8A4AMDliUXgSCbQQ9aK8HIrUiPKt8eseoKReVh+EqxwTM0wBuQHgkEpK/F95TeASJbA+G2f5jg73sBC/L9bo+QqBpRH88iO1K6GW2rp6mgn8LBB5H+v88RpLe7rMKIn+YsMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756419839; c=relaxed/simple;
	bh=ZzSGpyAiXEA7E556PI0Nc3DQ+k/BakYuoeJXcXfBo9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ibUeoG6vk0WreSaPzUikz+bRXWVkftqPKzT/0KwU0+3i1pPHeeyYqHWKz6v5wwBLeBEKbgg23oWyw/yEbxF7WViP7oq2afwIHj2AOfNU4M40ou1TMDfvkEUKQsgm4CqxPAAC93C1UWpBb06MGdaAFMF8oPLRn0Qi76/YDMmhNgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g5iFbsT1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g5iFbsT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756419836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H42faxsTWRZ9DW+shjKwYXDHnrMCjqsyRxtBznv3PzI=;
	b=g5iFbsT1RD4sqzgYCjeeBaaX7kOGHLLzaKtP76Sk1gt9optT1dsjrVuYGHNJqfUetj1GyY
	jIzciKksIfzgoSyBOTaZfqs4VGrtqA8hQmBfs+1Pl7HYoGY09uA/Uujr29V/OdIFUGS8PF
	KMUmFnmmfdVGRIU7U8D71JzBz9s8aI0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-332-GyAYcoEgNWmiut2uFLRXGQ-1; Thu,
 28 Aug 2025 18:23:51 -0400
X-MC-Unique: GyAYcoEgNWmiut2uFLRXGQ-1
X-Mimecast-MFC-AGG-ID: GyAYcoEgNWmiut2uFLRXGQ_1756419830
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 582BC195C278;
	Thu, 28 Aug 2025 22:23:50 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.88.80])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0786319560BC;
	Thu, 28 Aug 2025 22:23:50 +0000 (UTC)
Received: from aion.redhat.com (localhost [IPv6:::1])
	by aion.redhat.com (Postfix) with ESMTP id A60E941A7B7;
	Thu, 28 Aug 2025 18:23:48 -0400 (EDT)
From: Scott Mayhew <smayhew@redhat.com>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [PATCH 4/5] tlshd: Make sure the client supports the PQ pk alg used by the server cert
Date: Thu, 28 Aug 2025 18:23:47 -0400
Message-ID: <20250828222348.601924-5-smayhew@redhat.com>
In-Reply-To: <20250828222348.601924-1-smayhew@redhat.com>
References: <20250828222348.601924-1-smayhew@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2RbGwKgpRyJkw2DQKIIxqoNNPO7Qr8_ULqMhKsQ7OX0_1756419830
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Store the public-key algorithm used by the server cert so we can later
compare it to the list of signing algorithms supported by the client in
the cert callback.

Link: https://github.com/oracle/ktls-utils/issues/113
Signed-off-by: Scott Mayhew <smayhew@redhat.com>
---
 src/tlshd/config.c | 12 +++++++-----
 src/tlshd/server.c | 49 ++++++++++++++++++++++++++++++++++------------
 src/tlshd/tlshd.h  |  2 +-
 3 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index 6adacc0..735d24a 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -402,7 +402,8 @@ bool tlshd_config_get_server_crl(char **result)
 }
 
 #ifdef HAVE_GNUTLS_MLDSA
-static bool tlshd_cert_check_pk_alg(gnutls_datum_t *data)
+static bool tlshd_cert_check_pk_alg(gnutls_datum_t *data,
+				    gnutls_pk_algorithm_t *pkalg)
 {
 	gnutls_x509_crt_t cert;
 	gnutls_pk_algorithm_t pk_alg;
@@ -425,6 +426,7 @@ static bool tlshd_cert_check_pk_alg(gnutls_datum_t *data)
 	case GNUTLS_PK_MLDSA44:
 	case GNUTLS_PK_MLDSA65:
 	case GNUTLS_PK_MLDSA87:
+		*pkalg = pk_alg;
 		break;
 	default:
 		gnutls_x509_crt_deinit(cert);
@@ -441,7 +443,7 @@ static bool tlshd_cert_check_pk_alg(gnutls_datum_t *data)
  * @key: IN: the key field name from .conf
  * @certs: OUT: in-memory certificates
  * @certs_len: IN: maximum number of certs to get, OUT: number of certs found
- * @check_pq: IN: verify that the cert is using a PQ public-key alg
+ * @pkgalg: OUT: the PQ public-key alg that was used in the cert
  *
  * Return values:
  *   %true: certificate retrieved successfully
@@ -450,10 +452,10 @@ static bool tlshd_cert_check_pk_alg(gnutls_datum_t *data)
 bool tlshd_config_get_server_certs(const gchar *key,
 				   gnutls_pcert_st *certs,
 				   unsigned int *certs_len,
-				   bool check_pq)
+				   gnutls_pk_algorithm_t *pkalg)
 {
 #ifndef HAVE_GNUTLS_MLSDA
-	(void)check_pq;
+	(void)pkalg;
 #endif /* HAVE_GNUTLS_MLDSA */
 	gnutls_datum_t data;
 	gchar *pathname;
@@ -471,7 +473,7 @@ bool tlshd_config_get_server_certs(const gchar *key,
 	}
 
 #ifdef HAVE_GNUTLS_MLDSA
-	if (check_pq && !tlshd_cert_check_pk_alg(&data)) {
+	if (pkalg && !tlshd_cert_check_pk_alg(&data, pkalg)) {
 		tlshd_log_debug("%s: %s certificate not using a PQ public-key algorithm",
 				__func__, key);
 		free(data.data);
diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index 210a09e..7a0ce24 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -50,6 +50,7 @@ static gnutls_pcert_st tlshd_server_certs[TLSHD_MAX_CERTS];
 static gnutls_privkey_t tlshd_server_pq_privkey;
 static unsigned int tlshd_server_pq_certs_len = TLSHD_MAX_CERTS;
 static gnutls_pcert_st tlshd_server_pq_certs[TLSHD_MAX_CERTS];
+static gnutls_pk_algorithm_t tlshd_server_pq_pkalg = GNUTLS_PK_UNKNOWN;
 #endif /* HAVE_GNUTLS_MLDSA */
 
 static bool tlshd_x509_server_get_certs(struct tlshd_handshake_parms *parms)
@@ -62,12 +63,12 @@ static bool tlshd_x509_server_get_certs(struct tlshd_handshake_parms *parms)
 	tlshd_config_get_server_certs("x509.pq.certificate",
 				      tlshd_server_pq_certs,
 				      &tlshd_server_pq_certs_len,
-				      true);
+				      &tlshd_server_pq_pkalg);
 #endif /* HAVE_GNUTLS_MLDSA */
 	return tlshd_config_get_server_certs("x509.certificate",
 					     tlshd_server_certs,
 					     &tlshd_server_certs_len,
-					     false);
+					     NULL);
 }
 
 static void tlshd_x509_server_put_certs(void)
@@ -158,20 +159,42 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
 		return -1;
 
 #ifdef HAVE_GNUTLS_MLDSA
-	for (i = 0; ; i++) {
-		ret = gnutls_sign_algorithm_get_requested(session, i, &client_alg);
-		if (ret != GNUTLS_E_SUCCESS)
-			break;
-		if (client_alg == GNUTLS_SIGN_MLDSA44
-				|| client_alg == GNUTLS_SIGN_MLDSA65
-				|| client_alg == GNUTLS_SIGN_MLDSA87) {
-			tlshd_log_debug("%s: Client supports ML-DSA", __func__);
-			use_pq_cert = true;
-			break;
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
 		}
 	}
 
-	if (use_pq_cert == true && tlshd_server_pq_certs_len > 0) {
+	if (use_pq_cert == true) {
 		tlshd_log_debug("%s: Selecting x509.pq.certificate from conf file", __func__);
 		*pcert_length = tlshd_server_pq_certs_len;
 		*pcert = tlshd_server_pq_certs;
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 6bd55c7..ca84d8f 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -62,7 +62,7 @@ bool tlshd_config_get_server_crl(char **result);
 bool tlshd_config_get_server_certs(const gchar *key,
 				   gnutls_pcert_st *certs,
 				   unsigned int *certs_len,
-				   bool check_pq);
+				   gnutls_pk_algorithm_t *pkalg);
 bool tlshd_config_get_server_privkey(const gchar *key,
 				     gnutls_privkey_t *privkey);
 
-- 
2.50.1


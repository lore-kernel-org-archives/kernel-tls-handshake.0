Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D5D26D4CD
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 28 Aug 2025 22:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756419836; cv=none; b=LorESd43uWwbykTHRZKoS+otzXDwotybf12vealiOPhrnFcR/Gz8UwsaY1pKbdpDG3R/3nWOLKJ3wf4npfoKyJo28WnWPPs6IjX4mHgpkWRKaj+sWcoQaDS4LmbgYXeo6qFuoXfXVlqqzBCH8avh3yMoaMEMIEvOdJV7+llpSBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756419836; c=relaxed/simple;
	bh=9EOSfX+oOulYDho5xm0o93F6QEnrIzLyq2K4il96b+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=kPWA3xvS7TeKjZ18dUDkAksOblDXoxIKE28cAKRafV+8jThn6Fu8GTDtjQXW9Jfy5+mfv0KhfFRM3z5fCgo+G2AmrpgaAP0EHXOnMFbcGaxfh9xrYmuB4Xtt+xr+d+6yJyzQ1UIRUGj0lO9fqPlcqP8UWvDf80McLQppLAdtxK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D9duYpG+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D9duYpG+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756419833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqwahc67tnf1eaqhti9xiKVBNuEa1T7D5Gf4GZLOiyw=;
	b=D9duYpG+wZ7RCqXhO4XEGNIe41Ay3KEo0Zykq/O/8AGyMNsDI09VUjBoJVghZW17jHmuQa
	R5ApLfbZK6DgR/EM1NqDK47m8JKiRUVbnOCC5g5Da5uIPdKerqfrORC21QANPP15GGfPI4
	lkDt/66v+7avAr7Fr1hTLdCu2bHQ0f4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-NyW-Qiu4OAKt0rTF-kNX4Q-1; Thu,
 28 Aug 2025 18:23:51 -0400
X-MC-Unique: NyW-Qiu4OAKt0rTF-kNX4Q-1
X-Mimecast-MFC-AGG-ID: NyW-Qiu4OAKt0rTF-kNX4Q_1756419830
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8A70B195C277;
	Thu, 28 Aug 2025 22:23:50 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.88.80])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3B2FF180029B;
	Thu, 28 Aug 2025 22:23:50 +0000 (UTC)
Received: from aion.redhat.com (localhost [IPv6:::1])
	by aion.redhat.com (Postfix) with ESMTP id 9AAE841A7B6;
	Thu, 28 Aug 2025 18:23:48 -0400 (EDT)
From: Scott Mayhew <smayhew@redhat.com>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [PATCH 3/5] tlshd: Make sure x509.pq.certificate is using a PQ public-key alg
Date: Thu, 28 Aug 2025 18:23:46 -0400
Message-ID: <20250828222348.601924-4-smayhew@redhat.com>
In-Reply-To: <20250828222348.601924-1-smayhew@redhat.com>
References: <20250828222348.601924-1-smayhew@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hHptiohfgbmrUUBIZ5qnY_qP7RBYl9bR49910o7HDko_1756419830
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Ensure that the PQ certificate is using a post-quantum public-key
algorithm (ML-DSA-44, ML-DSA-65, or ML-DSA-87).

Link: https://github.com/oracle/ktls-utils/issues/113
Signed-off-by: Scott Mayhew <smayhew@redhat.com>
---
 src/tlshd/config.c       | 53 +++++++++++++++++++++++++++++++++++++++-
 src/tlshd/server.c       |  6 +++--
 src/tlshd/tlshd.conf.man |  2 ++
 src/tlshd/tlshd.h        |  3 ++-
 4 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index 20634dd..6adacc0 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -401,11 +401,47 @@ bool tlshd_config_get_server_crl(char **result)
 	return true;
 }
 
+#ifdef HAVE_GNUTLS_MLDSA
+static bool tlshd_cert_check_pk_alg(gnutls_datum_t *data)
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
  * tlshd_config_get_server_certs - Get certs for ServerHello from .conf
  * @key: IN: the key field name from .conf
  * @certs: OUT: in-memory certificates
  * @certs_len: IN: maximum number of certs to get, OUT: number of certs found
+ * @check_pq: IN: verify that the cert is using a PQ public-key alg
  *
  * Return values:
  *   %true: certificate retrieved successfully
@@ -413,8 +449,12 @@ bool tlshd_config_get_server_crl(char **result)
  */
 bool tlshd_config_get_server_certs(const gchar *key,
 				   gnutls_pcert_st *certs,
-				   unsigned int *certs_len)
+				   unsigned int *certs_len,
+				   bool check_pq)
 {
+#ifndef HAVE_GNUTLS_MLSDA
+	(void)check_pq;
+#endif /* HAVE_GNUTLS_MLDSA */
 	gnutls_datum_t data;
 	gchar *pathname;
 	int ret;
@@ -430,6 +470,17 @@ bool tlshd_config_get_server_certs(const gchar *key,
 		return false;
 	}
 
+#ifdef HAVE_GNUTLS_MLDSA
+	if (check_pq && !tlshd_cert_check_pk_alg(&data)) {
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
diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index 96b1b88..210a09e 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -61,11 +61,13 @@ static bool tlshd_x509_server_get_certs(struct tlshd_handshake_parms *parms)
 #ifdef HAVE_GNUTLS_MLDSA
 	tlshd_config_get_server_certs("x509.pq.certificate",
 				      tlshd_server_pq_certs,
-				      &tlshd_server_pq_certs_len);
+				      &tlshd_server_pq_certs_len,
+				      true);
 #endif /* HAVE_GNUTLS_MLDSA */
 	return tlshd_config_get_server_certs("x509.certificate",
 					     tlshd_server_certs,
-					     &tlshd_server_certs_len);
+					     &tlshd_server_certs_len,
+					     false);
 }
 
 static void tlshd_x509_server_put_certs(void)
diff --git a/src/tlshd/tlshd.conf.man b/src/tlshd/tlshd.conf.man
index ed545e4..575d88b 100644
--- a/src/tlshd/tlshd.conf.man
+++ b/src/tlshd/tlshd.conf.man
@@ -130,6 +130,8 @@ a PEM-encoded private key associated with the above certificate.
 This option specifies the pathname of a file containing
 a PEM-encoded x.509 certificate that is to be presented during
 a handshake request if the peer supports post-quantum cryptography.
+This certificate must be using a post-quantum public-key algorithm
+(ML-DSA-44, ML-DSA-65, or ML-DSA-87).
 If the peer does not support post-quantum cryptography, the
 certificate configured in the
 .I x509.certificate
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index d9b68ed..6bd55c7 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -61,7 +61,8 @@ bool tlshd_config_get_server_truststore(char **bundle);
 bool tlshd_config_get_server_crl(char **result);
 bool tlshd_config_get_server_certs(const gchar *key,
 				   gnutls_pcert_st *certs,
-				   unsigned int *certs_len);
+				   unsigned int *certs_len,
+				   bool check_pq);
 bool tlshd_config_get_server_privkey(const gchar *key,
 				     gnutls_privkey_t *privkey);
 
-- 
2.50.1


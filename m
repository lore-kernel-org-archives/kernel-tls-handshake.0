Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E8F2D97A9
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 11 Sep 2025 21:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757626105; cv=none; b=AZY36mzWXtWFOBXh1hRmJsKNEqr4JyKuGo98ePvF3jcK+VqwgkbfTq10Q1tAeOHp6CudkbDynSg9aQ8WmF69wWcBIjp4UyNgw+P0ZjKltqXYkYohgCS2tcahrTDgNRr8TUYlL4P8p/0q3eYxp6fmICh2lKgagE4YKDIOI0/41Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757626105; c=relaxed/simple;
	bh=459YnK+l2FCkXnNV5WqMYlmb1bbILl3ymSlUn5aknUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=i4dhyaxoYg3b6/zHh35a5cQ0dbD7KE2ILPdz4R9sddZGiQ4JBxhFXBOfZjy99iFsVSyJ7qBM+PBs77LJuKfLqMfQV9fuP8mNMea/5VQ6Iiybl/0HpXhDhUpADNh4/fjAO1pb7MJ0jSWrzuIjcd2GWHXD/Eqlh5450XWeLXJf4rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E4srbI6T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E4srbI6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757626102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLD82h1c3YvRtY4ika0XG/MmNeunjPOSGW6JTPM0jTM=;
	b=E4srbI6TYh8TdU4lOkR55s4t1JXs5JrY6xCrsU2z8SM6G+/tYlgL11bxrwaLUEcrILyOc/
	yKxne2lcDM60geJh3djguir8GaOrXSCc++XB5MdI26THjdsBY6QbrGht2KxCyeZlID4+ex
	VgqHktoEh25KUXKK2up2bYKJCyRm52o=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-357-b6nGVJMfNmKPG_qDYHCAvw-1; Thu,
 11 Sep 2025 17:28:18 -0400
X-MC-Unique: b6nGVJMfNmKPG_qDYHCAvw-1
X-Mimecast-MFC-AGG-ID: b6nGVJMfNmKPG_qDYHCAvw_1757626097
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5A6DC1800372;
	Thu, 11 Sep 2025 21:28:17 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.88.97])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0C44F19560B1;
	Thu, 11 Sep 2025 21:28:16 +0000 (UTC)
Received: from aion.redhat.com (localhost [IPv6:::1])
	by aion.redhat.com (Postfix) with ESMTP id 4A2CA430203;
	Thu, 11 Sep 2025 17:28:15 -0400 (EDT)
From: Scott Mayhew <smayhew@redhat.com>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [PATCH v2 4/4] tlshd: Client-side dual certificate support
Date: Thu, 11 Sep 2025 17:28:15 -0400
Message-ID: <20250911212815.1414784-5-smayhew@redhat.com>
In-Reply-To: <20250911212815.1414784-1-smayhew@redhat.com>
References: <20250911212815.1414784-1-smayhew@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wkBhrdQ-Wrvk2DiIgobKS6KGjTumoKcinUhpSccMsKI_1757626097
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
 src/tlshd/client.c   | 45 ++++++++++++++++++++++++++++++++++++--------
 src/tlshd/tlshd.conf |  2 ++
 2 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/src/tlshd/client.c b/src/tlshd/client.c
index 257e835..ad9a793 100644
--- a/src/tlshd/client.c
+++ b/src/tlshd/client.c
@@ -134,17 +134,21 @@ out_free_creds:
 	gnutls_certificate_free_credentials(xcred);
 }
 
+static gnutls_privkey_t tlshd_pq_privkey;
 static gnutls_privkey_t tlshd_privkey;
+static unsigned int tlshd_pq_certs_len = TLSHD_MAX_CERTS;
 static unsigned int tlshd_certs_len = TLSHD_MAX_CERTS;
 static gnutls_pcert_st tlshd_certs[TLSHD_MAX_CERTS];
+static gnutls_pk_algorithm_t tlshd_pq_pkalg = GNUTLS_PK_UNKNOWN;
 
 static bool tlshd_x509_client_get_certs(struct tlshd_handshake_parms *parms)
 {
 	if (parms->x509_cert != TLS_NO_CERT)
 		return tlshd_keyring_get_certs(parms->x509_cert, tlshd_certs,
 					       &tlshd_certs_len);
-	return tlshd_config_get_certs(PEER_TYPE_CLIENT, tlshd_certs, NULL,
-				      &tlshd_certs_len, NULL);
+	return tlshd_config_get_certs(PEER_TYPE_CLIENT, tlshd_certs,
+				      &tlshd_pq_certs_len, &tlshd_certs_len,
+				      &tlshd_pq_pkalg);
 }
 
 static void tlshd_x509_client_put_certs(void)
@@ -160,12 +164,14 @@ static bool tlshd_x509_client_get_privkey(struct tlshd_handshake_parms *parms)
 	if (parms->x509_privkey != TLS_NO_PRIVKEY)
 		return tlshd_keyring_get_privkey(parms->x509_privkey,
 						 &tlshd_privkey);
-	return tlshd_config_get_privkey(PEER_TYPE_CLIENT, NULL, &tlshd_privkey);
+	return tlshd_config_get_privkey(PEER_TYPE_CLIENT, &tlshd_pq_privkey,
+					&tlshd_privkey);
 }
 
 static void tlshd_x509_client_put_privkey(void)
 {
 	gnutls_privkey_deinit(tlshd_privkey);
+	gnutls_privkey_deinit(tlshd_pq_privkey);
 }
 
 static void tlshd_x509_log_issuers(const gnutls_datum_t *req_ca_rdn, int nreqs)
@@ -206,13 +212,15 @@ static void tlshd_x509_log_issuers(const gnutls_datum_t *req_ca_rdn, int nreqs)
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
 	gnutls_certificate_type_t type;
+	bool use_pq_cert = false;
+	int i;
 
 	tlshd_x509_log_issuers(req_ca_rdn, nreqs);
 
@@ -220,9 +228,30 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
 	if (type != GNUTLS_CRT_X509)
 		return -1;
 
-	*pcert_length = tlshd_certs_len;
-	*pcert = tlshd_certs;
-	*privkey = tlshd_privkey;
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
+		*pcert = tlshd_certs;
+		*privkey = tlshd_pq_privkey;
+	} else {
+		tlshd_log_debug("%s: Selecting x509.certificate from conf file", __func__);
+		*pcert_length = tlshd_certs_len;
+		*pcert = tlshd_certs + tlshd_pq_certs_len;
+		*privkey = tlshd_privkey;
+	}
 	return 0;
 }
 
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
-- 
2.50.1


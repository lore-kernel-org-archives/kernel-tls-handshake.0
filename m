Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD03C1FA178
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Jun 2025 09:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237305; cv=none; b=Ata299zvHk1ORVXhXMnT+HfcXReDiJl5UbCNAtJvjlgwpKrf9ES7nM/yUux2u5pG9Ko90VXXxDbftESsCUm+VfmGDM6KNQr1Lz5C1yB+mJKXSf2vprAM9DjqAz023WYyYUyQLrYq8Ejem4Y/arp/xNbGYLo/aaB9e9t8A9ebusQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237305; c=relaxed/simple;
	bh=SUf7pJiLi3k7++joXybAFdseamSXOgfckXo3taHXhMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DjDFknBFPc7w2xzQEwDGv4ewDLNjmPTHU8YzQORXc71YBybVb5ughz+5omUIassLv17hFjIPaA/Xfp19uVboqptbpOCX/Aa3u/geAXMUY2r/jMAVqKS3QYjqkcegCD2UPhQBzdyOxI+aTTXddOjVuXe1woKcnNQtBs00OmRasw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVK0NgUm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVK0NgUm"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a36748920cso7876645f8f.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Jun 2025 02:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750237302; x=1750842102; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBYOPUULpceibVbDOckAGGq+tQpcxOS8eeiCAfQALmo=;
        b=ZVK0NgUmtIMOeLjb9fXiCidyEUiXGt7nZo9xVckpgz/oVr7XC4J7/Cab/0tPrnXdDx
         IjXbi1rwzVgfoVEPyX4noe1Kvezj8J8mu9vzHbN9LqB52qYYIPMB1gDhKmso8/cqvZ1W
         dPZ6OWNK5h5WS6g2m9PYzZpA1H7NVSvrRLwtqRo83u5B3yUWZNGVpilj1Nn2OuglDh4a
         x50sH+OaxBjfOORhvOaQSpFVjGL9O46uMWpVCMZYiFDPTYty8vbsmcAWnfowIKF4juoB
         y6LFNu13pF5W1DotfZjKkr65O9lLEulTuR1cV195V72ELKHmnTJsoeMZL7P+rPgdHmMb
         JwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750237302; x=1750842102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBYOPUULpceibVbDOckAGGq+tQpcxOS8eeiCAfQALmo=;
        b=O3vsYUJKoc6hNX2wpLVPhJs/cXKEKaLi4rphHPksMSLSMg2mm4Cc1YCqG3lv97fm85
         9B2jH3Jgu3B0d9sHZjvJc9W6IkHJhTx6ycuT14aDIaUYa7tDbhlx5ZdOho38a23rrHpE
         HeHMVBZChW4BpEJj83zfLRx6TEW7WE94h4BbuCzna1KpLIPxpz1fGwyjK+VXxa0uTq2r
         uNmo6xSYIt5hUV3T8SOqIgJBi49fSaMc3rU5su7M26NDAT4NY05JdowSgH2F5NRofDoj
         6dN8VoTJdDcI/fb0/BBURbsl61EUlhisDxsYQNOmHYfMAaB2py9orGNeVvanJ5QkCX6U
         XtXg==
X-Gm-Message-State: AOJu0Ywozggz2N3Qod5J9/5+rx3EP/lrE4ykjeWRCrHUhz0xzM61TX//
	A2qDm/zGR1Y4eh/eQgW/stWi4mMFuT6iFOWuDAjJbsMbce7p7+gkdySqGAVfd1Xm
X-Gm-Gg: ASbGnctPBGc6BGdY0MaKNbj2+BLMw0kjqG4onamwu3hwRAVVP61ACQPcDkwtwBytAIs
	YjUgxggBGrzIb0EnhScnPvYosyt9gMqb5DMGM1PZcfJNN95NJ+St+lmesE59q6RGlvjMl+U1P/v
	c4w56WQ59p/japFhu5A9yYGvqhAH+645hAyhtKWibh3RNdhS/ZXsRX5OnguXDxY5I6djc0DOMFW
	qeNzw5DXEDMiRb7qfhcVHNVEhTh5SPZsWAyTK24dxRXZbG/eX0Ay3BQnnUb3aHmuveyH+yhWpjO
	6bxDVL6uXO/mYxRxKZkCr0z8eZ/AXVBpah+Lq8RUeHUYCJYrh9OJZct5VeV/sr1Gn8zHqb8G6dx
	HMN5sBrdNTnANt9ockwxsfFMjHfheQpfaxgwqc+zPzLkCPF2Q
X-Google-Smtp-Source: AGHT+IHO4y9OYXP2Rmn1gGVEMdcMFLjY74hLCrayAfWs0VacJ1Gq81HLjeT3hDbNzL59dUExoX9kzA==
X-Received: by 2002:a05:6000:2c0d:b0:3a4:bfda:1e9 with SMTP id ffacd0b85a97d-3a5723af27bmr15018786f8f.46.1750237301837;
        Wed, 18 Jun 2025 02:01:41 -0700 (PDT)
Received: from uranus.home.lan (ptr-4yvyxu9ibhltaxz47ht.18120a2.ip6.access.telenet.be. [2a02:1810:a59b:eff1::5f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5780c5004sm12774737f8f.56.2025.06.18.02.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:01:41 -0700 (PDT)
From: Rik Theys <rik.theys@gmail.com>
X-Google-Original-From: Rik Theys <Rik.Theys@gmail.com>
To: kernel-tls-handshake@lists.linux.dev
Cc: Rik Theys <Rik.Theys@gmail.com>
Subject: [PATCH 5/5] Move client-side CRL code to common function
Date: Wed, 18 Jun 2025 11:00:40 +0200
Message-ID: <20250618090040.566838-6-Rik.Theys@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618090040.566838-1-Rik.Theys@gmail.com>
References: <20250618090040.566838-1-Rik.Theys@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code that configures the CRL is needed in both the TLS and
QUIC setup functions. Move the code that configures the CA
certificates and CRL into a separate function and call it from
the anon/mtls TLS and QUIC setup functions.

Signed-off-by: Rik Theys <Rik.Theys@gmail.com>
---
 src/tlshd/client.c | 94 ++++++++++++++++++++--------------------------
 1 file changed, 40 insertions(+), 54 deletions(-)

diff --git a/src/tlshd/client.c b/src/tlshd/client.c
index 189452f..6fb507a 100644
--- a/src/tlshd/client.c
+++ b/src/tlshd/client.c
@@ -43,29 +43,13 @@
 #include "tlshd.h"
 #include "netlink.h"
 
-static void tlshd_tls13_client_anon_handshake(struct tlshd_handshake_parms *parms)
+static int tlshd_client_configure_credentials(gnutls_certificate_credentials_t
+					      xcred)
 {
-	gnutls_certificate_credentials_t xcred;
-	gnutls_session_t session;
-	unsigned int flags;
 	char *cafile;
 	char *crlfile;
 	int ret;
 
-	ret = gnutls_certificate_allocate_credentials(&xcred);
-	if (ret != GNUTLS_E_SUCCESS) {
-		tlshd_log_gnutls_error(ret);
-		return;
-	}
-
-	/*
-	 * Don't reject self-signed server certificates.
-	 */
-	gnutls_certificate_set_verify_flags(xcred,
-			GNUTLS_VERIFY_ALLOW_SIGN_RSA_MD2 | GNUTLS_VERIFY_ALLOW_SIGN_RSA_MD5);
-	gnutls_certificate_set_flags(xcred,
-			GNUTLS_CERTIFICATE_SKIP_KEY_CERT_MATCH | GNUTLS_CERTIFICATE_SKIP_OCSP_RESPONSE_CHECK);
-
 	if (tlshd_config_get_client_truststore(&cafile)) {
 		ret = gnutls_certificate_set_x509_trust_file(xcred, cafile,
 							     GNUTLS_X509_FMT_PEM);
@@ -73,8 +57,7 @@ static void tlshd_tls13_client_anon_handshake(struct tlshd_handshake_parms *parm
 	} else
 		ret = gnutls_certificate_set_x509_system_trust(xcred);
 	if (ret < 0) {
-		tlshd_log_gnutls_error(ret);
-		goto out_free_creds;
+		return ret;
 	}
 	tlshd_log_debug("System trust: Loaded %d certificate(s).", ret);
 
@@ -83,14 +66,43 @@ static void tlshd_tls13_client_anon_handshake(struct tlshd_handshake_parms *parm
 							   GNUTLS_X509_FMT_PEM);
 		free(crlfile);
 		if (ret < 0 ) {
-			tlshd_log_gnutls_error(ret);
-			goto out_free_creds;
+			return ret;
 		}
 		tlshd_log_debug("System CRL: Loaded %d CRL(s).", ret);
 	} else {
 		tlshd_log_debug("System CRL: No CRL file configured.");
 	}
 
+	return GNUTLS_E_SUCCESS;
+}
+
+static void tlshd_tls13_client_anon_handshake(struct tlshd_handshake_parms *parms)
+{
+	gnutls_certificate_credentials_t xcred;
+	gnutls_session_t session;
+	unsigned int flags;
+	int ret;
+
+	ret = gnutls_certificate_allocate_credentials(&xcred);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		return;
+	}
+
+	/*
+	 * Don't reject self-signed server certificates.
+	 */
+	gnutls_certificate_set_verify_flags(xcred,
+			GNUTLS_VERIFY_ALLOW_SIGN_RSA_MD2 | GNUTLS_VERIFY_ALLOW_SIGN_RSA_MD5);
+	gnutls_certificate_set_flags(xcred,
+			GNUTLS_CERTIFICATE_SKIP_KEY_CERT_MATCH | GNUTLS_CERTIFICATE_SKIP_OCSP_RESPONSE_CHECK);
+
+	ret = tlshd_client_configure_credentials(xcred);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		goto out_free_creds;
+	}
+
 	flags = GNUTLS_CLIENT;
 	ret = gnutls_init(&session, flags);
 	if (ret != GNUTLS_E_SUCCESS) {
@@ -288,8 +300,6 @@ static void tlshd_tls13_client_x509_handshake(struct tlshd_handshake_parms *parm
 	gnutls_certificate_credentials_t xcred;
 	gnutls_session_t session;
 	unsigned int flags;
-	char *cafile;
-	char *crlfile;
 	int ret;
 
 	ret = gnutls_certificate_allocate_credentials(&xcred);
@@ -298,30 +308,11 @@ static void tlshd_tls13_client_x509_handshake(struct tlshd_handshake_parms *parm
 		return;
 	}
 
-	if (tlshd_config_get_client_truststore(&cafile)) {
-		ret = gnutls_certificate_set_x509_trust_file(xcred, cafile,
-							     GNUTLS_X509_FMT_PEM);
-		free(cafile);
-	} else
-		ret = gnutls_certificate_set_x509_system_trust(xcred);
-	if (ret < 0) {
+	ret = tlshd_client_configure_credentials(xcred);
+	if (ret != GNUTLS_E_SUCCESS) {
 		tlshd_log_gnutls_error(ret);
 		goto out_free_creds;
 	}
-	tlshd_log_debug("System trust: Loaded %d certificate(s).", ret);
-
-	if (tlshd_config_get_client_crl(&crlfile)) {
-		ret = gnutls_certificate_set_x509_crl_file(xcred, crlfile,
-							   GNUTLS_X509_FMT_PEM);
-		free(crlfile);
-		if (ret < 0 ) {
-			tlshd_log_gnutls_error(ret);
-			goto out_free_creds;
-		}
-		tlshd_log_debug("System CRL: Loaded %d CRL(s).", ret);
-	} else {
-		tlshd_log_debug("System CRL: No CRL file configured.");
-	}
 
 	if (!tlshd_x509_client_get_certs(parms))
 		goto out_free_creds;
@@ -517,7 +508,6 @@ static int tlshd_quic_client_set_x509_session(struct tlshd_quic_conn *conn)
 	gnutls_certificate_credentials_t cred;
 	gnutls_session_t session;
 	int ret = -EINVAL;
-	char *cafile;
 
 	if (conn->cert_req != TLSHD_QUIC_NO_CERT_AUTH) {
 		if (!tlshd_x509_client_get_certs(parms) || !tlshd_x509_client_get_privkey(parms)) {
@@ -528,14 +518,10 @@ static int tlshd_quic_client_set_x509_session(struct tlshd_quic_conn *conn)
 	ret = gnutls_certificate_allocate_credentials(&cred);
 	if (ret)
 		goto err;
-	if (tlshd_config_get_client_truststore(&cafile)) {
-		ret = gnutls_certificate_set_x509_trust_file(cred, cafile, GNUTLS_X509_FMT_PEM);
-		free(cafile);
-	} else
-		ret = gnutls_certificate_set_x509_system_trust(cred);
-	if (ret < 0)
-		goto err_cred;
-	tlshd_log_debug("System trust: Loaded %d certificate(s).", ret);
+
+	ret = tlshd_client_configure_credentials(cred);
+	if (ret != GNUTLS_E_SUCCESS)
+		goto err;
 
 	if (conn->cert_req == TLSHD_QUIC_NO_CERT_AUTH) {
 		gnutls_certificate_set_verify_flags(cred, GNUTLS_VERIFY_ALLOW_SIGN_RSA_MD2 |
-- 
2.49.0


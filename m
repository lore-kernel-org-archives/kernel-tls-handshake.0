Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EA020AF9C
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Jun 2025 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237302; cv=none; b=IjqgfERiHkf+LlbCGQG0MU4ymv9j0caG2Z/S4cQjzJB8osH4nZYQpo+D8exPpAAKstRjW9yOByvuzFhp6vx7vPBZoBGeIy+p8FGSJ4k+ekTV24thVT8LfY0U5FbDscRp2/AoFZmaVjcxUm3s7gn0RNkt4G9GQoqzHx6zpwTGYuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237302; c=relaxed/simple;
	bh=DnLpbTtkGmcH8kvODSPJUYLo4de+xPiH+2uB4WpxS+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XIm97osgBd4BYiJSVjM4sqPsmzoJy4kci5aIntdVApQIZWmukuYknv2e7APkppGSsR17AUqAWqhLEnICdeyC4x86+U09XCXiMq2X97dwsNL2yZY/AmDiAq/a8Vqmc6NF6weLu8GlJH8iN3Q3mf/L/gd/5uLPVVtGuJ5MeZbyENw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIwhkit8; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIwhkit8"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a54690d369so6854749f8f.3
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Jun 2025 02:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750237298; x=1750842098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiZprLpfE0LODSNimqJTEKlEuOw5FLY1192zbvlt5FM=;
        b=lIwhkit8S5yjPXbOy6S7+dCZeBsrMKqlbv4EiWmUbfw2PkTWRFS/0/sn6p9fi08U2j
         8rt0FvMrATld8RvS0ECK/c5eDgWWnMCXhJaWBCRV07RMNK0MK0W5KLk0VHGRn34z76MB
         uZaEKzaDqef/oYVcUAfLt0Oi1lNlezbx10+ZSOtAegeMDLHqnq7EsO6RbYHT9mBHG7qj
         gRkfgT+uIXRLlhui21/RiWZZmoQ8/Z3U4rVZffvcMpL33GXPkTKFBaufo47R34ZR3Jqg
         2D/DM5+j/YnqwCXT43Ua+qguz53PyRHvvJg5xvcKsLvrs6A0MYbT/7vbTo00fd7G5dZ3
         RRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750237298; x=1750842098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiZprLpfE0LODSNimqJTEKlEuOw5FLY1192zbvlt5FM=;
        b=eQVvq4ZMI1o7hG+B/W23aYYrNAhXNpkZODUJ7wfZHDNdCQHd3U9UXPe2TX3ZApdl2E
         bznDJ1yc8lINxvSL1JVpCp333AeskyH4HGzPIscPlC2j23jaT3hpV25xOKhNSDzHEQnh
         hgug5YFTGO5S2WE5uht+DGF7EbReOPt2ldDJk/wMdd6Jt36uu9shcG0TagKT83seUpGe
         1XDXyKAC7m2YPQqFsDGexh0wqHUVFGe4pECYl8OUpjLa2kS78DHybMFWogKb3RDGvBnT
         1/fem21FwPjEsuQJO8xl4udcCrwm0hY+57yrme7C+toJfOsSyVpavky3Kq0/c0yS6knR
         telQ==
X-Gm-Message-State: AOJu0YwRDDcO1DSTTttWtSWTyTkUUPn9bzDEKA82IC5UMudAkYJ6kSpa
	HhJ79XUsw6T4r2b7DXtU3BswSTEJTFtO3RdzslGNwmUaH+y3eibg0g6f6R/yY63z
X-Gm-Gg: ASbGnctwldDHJ5IAYIfU4eH/LRJCe6uZTZ6ACMb6FSBurA6lyEJbSBliq09PZB/jMla
	6/cvChLkhReHCKn5T7jSbNeVVL90B6jsysxUFpP9xZqCTI0KguJMPEZq5uAYo6FsigVy6cTgnqd
	3XagvledUi11VqDBwYFzc3xV0p3FkKOOzGtshqRFiz91Fd4g6tzXLo3ldT0yDpzgLr8wgVyKzK+
	OrF8uzDXiob/3YVR+W6fnnpSFZUH3A/B/7JDUTFuVueT+0iCbJAPBwh5irLNV+3MTCTETosEvje
	mcM3eKLYJeoswArG7WY0K8HcHizz64EFSw0k0VQz/N+arww/cO1QLewpM4240UUu8ZDsvdtxScg
	0TFjOOb3YEw/bN4wXYwaeDwYUuKN4E3P3DZMqBQ==
X-Google-Smtp-Source: AGHT+IGGo3uLnfQBf1IPpYt+K/CdBNO7N9PM3/Gky4HbTHdQdJDR1qchfMq1hz8IlVNXMUnLeGsioA==
X-Received: by 2002:a05:6000:178b:b0:3a5:21c8:af31 with SMTP id ffacd0b85a97d-3a5723721bdmr13572116f8f.16.1750237298374;
        Wed, 18 Jun 2025 02:01:38 -0700 (PDT)
Received: from uranus.home.lan (ptr-4yvyxu9ibhltaxz47ht.18120a2.ip6.access.telenet.be. [2a02:1810:a59b:eff1::5f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5780c5004sm12774737f8f.56.2025.06.18.02.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:01:37 -0700 (PDT)
From: Rik Theys <rik.theys@gmail.com>
X-Google-Original-From: Rik Theys <Rik.Theys@gmail.com>
To: kernel-tls-handshake@lists.linux.dev
Cc: Rik Theys <Rik.Theys@gmail.com>
Subject: [PATCH 2/5] Add client-side CRL checking
Date: Wed, 18 Jun 2025 11:00:37 +0200
Message-ID: <20250618090040.566838-3-Rik.Theys@gmail.com>
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

If an x509.crl option is specifiedin the authenticate.client
section of the configuration file, use it as a certificate
revocation list.

This commit only adds the check for tcp based TLS sessions.
Support for QUIC still needs to be added.

Signed-off-by: Rik Theys <Rik.Theys@gmail.com>
---
 src/tlshd/client.c | 28 ++++++++++++++++++++++++++++
 src/tlshd/config.c | 33 +++++++++++++++++++++++++++++++++
 src/tlshd/tlshd.h  |  1 +
 3 files changed, 62 insertions(+)

diff --git a/src/tlshd/client.c b/src/tlshd/client.c
index 9c8f512..189452f 100644
--- a/src/tlshd/client.c
+++ b/src/tlshd/client.c
@@ -49,6 +49,7 @@ static void tlshd_tls13_client_anon_handshake(struct tlshd_handshake_parms *parm
 	gnutls_session_t session;
 	unsigned int flags;
 	char *cafile;
+	char *crlfile;
 	int ret;
 
 	ret = gnutls_certificate_allocate_credentials(&xcred);
@@ -77,6 +78,19 @@ static void tlshd_tls13_client_anon_handshake(struct tlshd_handshake_parms *parm
 	}
 	tlshd_log_debug("System trust: Loaded %d certificate(s).", ret);
 
+	if (tlshd_config_get_client_crl(&crlfile)) {
+		ret = gnutls_certificate_set_x509_crl_file(xcred, crlfile,
+							   GNUTLS_X509_FMT_PEM);
+		free(crlfile);
+		if (ret < 0 ) {
+			tlshd_log_gnutls_error(ret);
+			goto out_free_creds;
+		}
+		tlshd_log_debug("System CRL: Loaded %d CRL(s).", ret);
+	} else {
+		tlshd_log_debug("System CRL: No CRL file configured.");
+	}
+
 	flags = GNUTLS_CLIENT;
 	ret = gnutls_init(&session, flags);
 	if (ret != GNUTLS_E_SUCCESS) {
@@ -275,6 +289,7 @@ static void tlshd_tls13_client_x509_handshake(struct tlshd_handshake_parms *parm
 	gnutls_session_t session;
 	unsigned int flags;
 	char *cafile;
+	char *crlfile;
 	int ret;
 
 	ret = gnutls_certificate_allocate_credentials(&xcred);
@@ -295,6 +310,19 @@ static void tlshd_tls13_client_x509_handshake(struct tlshd_handshake_parms *parm
 	}
 	tlshd_log_debug("System trust: Loaded %d certificate(s).", ret);
 
+	if (tlshd_config_get_client_crl(&crlfile)) {
+		ret = gnutls_certificate_set_x509_crl_file(xcred, crlfile,
+							   GNUTLS_X509_FMT_PEM);
+		free(crlfile);
+		if (ret < 0 ) {
+			tlshd_log_gnutls_error(ret);
+			goto out_free_creds;
+		}
+		tlshd_log_debug("System CRL: Loaded %d CRL(s).", ret);
+	} else {
+		tlshd_log_debug("System CRL: No CRL file configured.");
+	}
+
 	if (!tlshd_x509_client_get_certs(parms))
 		goto out_free_creds;
 	if (!tlshd_x509_client_get_privkey(parms))
diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index 1963116..7041fe9 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -212,6 +212,39 @@ bool tlshd_config_get_client_truststore(char **bundle)
 	return true;
 }
 
+/**
+ * tlshd_config_get_client_crl - Get CRL for ClientHello from .conf
+ * @bundle: OUT: pathname to CRL
+ *
+ * Return values:
+ *   %false: pathname not retrieved
+ *   %true: pathname retrieved successfully; caller must free @bundle using free(3)
+ */
+bool tlshd_config_get_client_crl(char **bundle)
+{
+	GError *error = NULL;
+	gchar *pathname;
+
+	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.client",
+					 "x509.crl", &error);
+	if (!pathname) {
+		g_error_free(error);
+		return false;
+	} else if (access(pathname, F_OK)) {
+		tlshd_log_debug("client x509.crl pathname \"%s\" is not accessible", pathname);
+		g_free(pathname);
+		return false;
+	}
+
+	*bundle = strdup(pathname);
+	g_free(pathname);
+	if (!*bundle)
+		return false;
+
+	tlshd_log_debug("Client x.509 crl is %s", *bundle);
+	return true;
+}
+
 /**
  * tlshd_config_get_client_certs - Get certs for ClientHello from .conf
  * @certs: OUT: in-memory certificates
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 617d1c6..f674cae 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -57,6 +57,7 @@ extern void tlshd_quic_clienthello_handshake(struct tlshd_handshake_parms *parms
 bool tlshd_config_init(const gchar *pathname);
 void tlshd_config_shutdown(void);
 bool tlshd_config_get_client_truststore(char **bundle);
+bool tlshd_config_get_client_crl(char **bundle);
 bool tlshd_config_get_client_certs(gnutls_pcert_st *certs,
 				   unsigned int *certs_len);
 bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey);
-- 
2.49.0


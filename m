Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8581494A8
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 11 Jun 2025 07:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749625821; cv=none; b=LXdAplaAndnGzD2EKtVHtAxUpBSPuNrLULgcbqiBUW0U1ahf2OAmbo36J7yg2yxIZUfDyH9piNfeDQ/VioGiDXkL/EMMwcLtLaQZ0YPk+fSWEVa4EhEUxJOtmBdmwti6hXuXOnuCNzux5DlmkhafCvXNoPBj9EzpfP8Lb5OtH3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749625821; c=relaxed/simple;
	bh=zF1Im3NvQRK261iwmq/+HOHD6ss5RU6Jc87K6b+9q/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4RxHT28lQoozO4JFL/k0enYY8IgSaUkOXmZ7RtDK67FsXkMYCiOkUv/rUEB0mfZQX7NCUIEq0MhyaBSAD5wEDYBZMLeWmKfdhqAkCozF0UL1o7x5g2E6m6RLoJHaEu3ouGbBG58CpSC1lxCaqctBHJWK/N8hiODvnt0gMozA8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pg+Y4Pet; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pg+Y4Pet"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d7b50815so54741465e9.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 11 Jun 2025 00:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749625818; x=1750230618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5r19hH9t8OpwYvJGD7OUSqlPQok6CKITUcDUaBv4Zo=;
        b=Pg+Y4Pet80Bld7gumDbUn0Ln78aCVzOz31/jOvOPZM5yNIO+OcbPtiuNnnzk7SEumo
         Qc2kThIMRFnn2O8HCM049TnJcJ6Yo+LJpub389npesyZheEXOeyR6bzbk/JNLpJveIab
         0/6Oywb/oU3GxOXIJoQrTAwGsQDbXZtUx2I9+IC+VD8IZZas5ECLNlnpuuVLjACnfnPN
         sM45kHhqEUoqD9IK7xLJ4kIclcor84VvHjzupA/ehxXCL0TY5b7wNiffE/Eb7hYSsTxR
         fJLukysj1jQVhemKZKlMiLd4vEPlItsdiw6PHHYWXNTP7iayIr55I2LQh0sDYMBS94/o
         cLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749625818; x=1750230618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5r19hH9t8OpwYvJGD7OUSqlPQok6CKITUcDUaBv4Zo=;
        b=xPVixJLPmUIpOD27L6WKLsFy7NmByKEGmVOX9GRTumOQ/PCwzPmUv4E1JHZ0vHIxYI
         0044aWq3E0JGIDNqs1vED6JMeGSH0aA4pWDxspEossD56lSg7e9CfBqRc9JGm5Q9AtVG
         Vu5VXfLSaytAIgoAreOStwiBoa/yPSAl8ZNixjryXHTfEXQHzYv/vRcl4+FOa92c0/wq
         6UDA4167wpldwN07OyhO4UaK5jlAZKTAQ+mmXAahDh6sFtOlTp/A4UX2DM7eLGBjXfS6
         662utVcnLH+Is3Qr+nqkJva9wGeZLlywfWp2xJaPGcZewV9tG/SAr/V47c0fJBRtQTqW
         ndew==
X-Gm-Message-State: AOJu0YwYM1MVKhqCxfhxGZybSCgCjPt51bjecy5cjZPUZMte4jsZVOkw
	QwL9p+A5Gss5TIdbF2WxaHdKQmFnh9CTGVAxcDT80i96Ru/ojSeD+cMpKesonqSc
X-Gm-Gg: ASbGnctbYcdgxxli+1M4Vtg7Z5EVMy6BAXrTdlP9IhA1Ybj1hJN8oxyPllDS23H7Cjx
	CJSByAeOVe/30nNEOOC7Q6TU/3OrGMbReYhyvY0rW/dE9gkzETPLeKxiBaLhq4k4w11Xt1edS0+
	jaFv7AUqjp/R0ov5OumDIzPSFlMETeUMcD7F80hHdCNS+DXk7KhT6MjIGHiOKLZyBAfNnMfYgme
	yTuNXsErv23+b1z4/WYdETZ258ayjs8K2Lc/jP+7IxvvtwfCnAoZPPB9MDSa1tfw2x5iSzDiMc1
	KFdNlnr/DgK09XiTMYR9ER+zzCIkX1KR8ctYZNip72rqFbCidx1xnfZF+N/GXLtFBwKgzvrQw18
	ZY63AgdOemrtBnpzZ/LHdzh8wWbKblVeqFkWoiA==
X-Google-Smtp-Source: AGHT+IFpahefX0OwRkn93v2nizG7iRMP7SovfJ8YPwUMaam5gWOcoCo0gNva1Juj/sGRAtAniiaOoA==
X-Received: by 2002:a05:600c:37ca:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-45324ecc947mr13841715e9.7.1749625817783;
        Wed, 11 Jun 2025 00:10:17 -0700 (PDT)
Received: from uranus.home.lan (ptr-4yvyxu9ibhltaxz490o.18120a2.ip6.access.telenet.be. [2a02:1810:a59b:eff1::da8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532518bc06sm12020985e9.24.2025.06.11.00.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:10:17 -0700 (PDT)
From: Rik Theys <rik.theys@gmail.com>
X-Google-Original-From: Rik Theys <Rik.Theys@gmail.com>
To: kernel-tls-handshake@lists.linux.dev
Cc: Rik Theys <Rik.Theys@gmail.com>
Subject: [PATCH 1/3] Add server-side CRL checking
Date: Wed, 11 Jun 2025 09:09:41 +0200
Message-ID: <20250611070943.235087-2-Rik.Theys@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611070943.235087-1-Rik.Theys@gmail.com>
References: <20250611070943.235087-1-Rik.Theys@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an x509.crl option is specified in the authenticate.server
section of the configuration file, use it as a certificate
revocation list.

Signed-off-by: Rik Theys <Rik.Theys@gmail.com>
---
 src/tlshd/config.c | 33 +++++++++++++++++++++++++++++++++
 src/tlshd/server.c | 14 ++++++++++++++
 src/tlshd/tlshd.h  |  1 +
 3 files changed, 48 insertions(+)

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index be5d472..1963116 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -350,6 +350,39 @@ bool tlshd_config_get_server_truststore(char **bundle)
 	return true;
 }
 
+/**
+ * tlshd_config_get_server_crl - Get CRL for ServerHello from .conf
+ * @bundle: OUT: pathname to CRL
+ *
+ * Return values:
+ *   %false: pathname not retrieved
+ *   %true: pathname retrieved successfully; caller must free @bundle using free(3)
+ */
+bool tlshd_config_get_server_crl(char **bundle)
+{
+	GError *error = NULL;
+	gchar *pathname;
+
+	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
+					 "x509.crl", &error);
+	if (!pathname) {
+		g_error_free(error);
+		return false;
+	} else if (access(pathname, F_OK)) {
+		tlshd_log_debug("server x509.crl pathname \"%s\" is not accessible", pathname);
+		g_free(pathname);
+		return false;
+	}
+
+	*bundle = strdup(pathname);
+	g_free(pathname);
+	if (!*bundle)
+		return false;
+
+	tlshd_log_debug("Server x.509 crl is %s", *bundle);
+	return true;
+}
+
 /**
  * tlshd_config_get_server_certs - Get certs for ServerHello from .conf
  * @certs: OUT: in-memory certificates
diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index 72ff6f5..bf4b740 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -219,6 +219,7 @@ static void tlshd_tls13_server_x509_handshake(struct tlshd_handshake_parms *parm
 	gnutls_certificate_credentials_t xcred;
 	gnutls_session_t session;
 	char *cafile;
+	char *crlfile;
 	int ret;
 
 	ret = gnutls_certificate_allocate_credentials(&xcred);
@@ -239,6 +240,19 @@ static void tlshd_tls13_server_x509_handshake(struct tlshd_handshake_parms *parm
 	}
 	tlshd_log_debug("System trust: Loaded %d certificate(s).", ret);
 
+	if (tlshd_config_get_server_crl(&crlfile)) {
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
 	if (!tlshd_x509_server_get_certs(parms)) {
 		goto out_free_creds;
 	}
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 135e1e0..617d1c6 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -61,6 +61,7 @@ bool tlshd_config_get_client_certs(gnutls_pcert_st *certs,
 				   unsigned int *certs_len);
 bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey);
 bool tlshd_config_get_server_truststore(char **bundle);
+bool tlshd_config_get_server_crl(char **bundle);
 bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
 				   unsigned int *certs_len);
 bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey);
-- 
2.49.0


Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1824A1FCD1F
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Jun 2025 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237300; cv=none; b=mNSqzpO+FJ47P0wXPHtWtRHgOIIk6Jta0d0UI9OqLLJfz8oIMs7rhbCdELnV7l2VMwp4wh6U2QJ9mCGd4RUlquAG+MamwwQZl8cbijLC94/t3yWL5ngaWh1JnyMYgnECUaU2hRaCKktaIaUGSmdPeAZMMo40Ko9Hj7tyJyx2L1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237300; c=relaxed/simple;
	bh=zF1Im3NvQRK261iwmq/+HOHD6ss5RU6Jc87K6b+9q/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qehr4qAu1QZdLbk5Z17KvNfQ1tBfHK8Y/8md+tKkultZaEHzEGTHWzcAmR4ZQJnztD94UWoyC3zI8On47Db0DIUawNCeTn0noiRrdJf/BkkQlaZcPO79/ve5a421As9nRta9kqbFlconVHPpmq+Ijfq0fcPwPjDAlFZ9lCyPBB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVmPLJq+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVmPLJq+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45300c82c1cso21820955e9.3
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Jun 2025 02:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750237297; x=1750842097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5r19hH9t8OpwYvJGD7OUSqlPQok6CKITUcDUaBv4Zo=;
        b=mVmPLJq+c+zTwQ5qnRLPbjaLVjgKczkz5e4DFSpnB5NkoniSc6wiC5xWpHeR2IDnT/
         6se9w6fmks115OBKSqKekl84MLGCreW9GNEEp1mkxFRxKfl02sEA2JqF13+be8uPpAcd
         +57vv2SbqL3endHOEDCL5OY8KsyzLxB6q3PkD05EPBIyjx71RhksM9ImF5UtaXkLrNq1
         8qGcq8KgfX3r6gBTkgGW6dsXWCcSeKbRmAgrjyy0nSRyP+Pt8U8AiUdd3dAqBkw3fJxD
         RmQrIM4wventlzrKJCmg43BYZbnWDRXD8vVzOf57REbVSvtfg9pVrlik0iGGx8gWJJKx
         YV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750237297; x=1750842097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5r19hH9t8OpwYvJGD7OUSqlPQok6CKITUcDUaBv4Zo=;
        b=Rm2aojj1r3mtJ0qtjcaviJOc9cMnaVbEWzA7jXkP1m16cXlorrbAikiE4rX+4oyHYz
         F/6qkRwVVPxjBlgr6LaJYZDGWnaOC8t0BJCiXBb5gylDDGz6KrwFXm6Hije708FDIibB
         8VuSW1eM91mC9Cn5+SZEiYAkbfKAX0Ha4LgG4bGf9SzXMBCXF9AgzHStW9o5ZdPhzd/u
         dwfri4bPBBraXOWZkNstA5lKh/N9TN2WGmOTijMH5CYHttAjRaulKdejPm4K1aCNFVlT
         oLRegYq4mbOrA9rESaA9/77n1du7UQNSnWcXvk9lHBoOgPkH/euTYbY7+areEYs7eSLX
         mrBQ==
X-Gm-Message-State: AOJu0YzC1+qKHZiZvFdl/5HRp6+54yLtksiRCX99kudov6Ir3vr5Ky/P
	JVtMvJAbynsQzb+xCR5WhsMeFpE55dSX/hz8sNutarvu5z297r3ajgo/5H6DLedr
X-Gm-Gg: ASbGnct/8yIzdbeBDFgrOWnDOcuho0fB0nszdbGSlFVTAUjVn++x9ya/zseYawh42+2
	md393Ht8goMGXmENTmM4w+KKmMaYuuwJWo5WU/KPIzQ4LRGSVqiSY2WSnBDoxayzDF/4QYXBbzA
	261Mk7FN4gZQv2J/hd1S1bfXLOjrtSf5zE/0X9tg3gt5L0S/LpwSjHIUhUGijPbbK9zkP62oYn8
	rHMhEL/uoV0K8dBpXMshO8kHL5aDohPtQdS6pHPgO/81Vlr1RZlfb2kxpMS9RHEaa5BxV/CncPC
	E2IGOke58M3SVVO62elOYOnqvBnOpPOLrZmkw/FHC3MyhnDVsvFIQHKLj1G7O+bEn+E4KyUm/rK
	Djm1L2gWGdetzBG71xa+eRf48xQJ/Dx8fEwMeTw==
X-Google-Smtp-Source: AGHT+IHbdnKSuqFJilJUmZV02hbS9cF2yCdW2O3h8nkjSc8ICVRxISg1yuujXhuninmU6mvoMwYjWw==
X-Received: by 2002:a05:6000:2385:b0:3a4:c9d4:2fb2 with SMTP id ffacd0b85a97d-3a572e8e0e4mr15506797f8f.46.1750237297239;
        Wed, 18 Jun 2025 02:01:37 -0700 (PDT)
Received: from uranus.home.lan (ptr-4yvyxu9ibhltaxz47ht.18120a2.ip6.access.telenet.be. [2a02:1810:a59b:eff1::5f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5780c5004sm12774737f8f.56.2025.06.18.02.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:01:36 -0700 (PDT)
From: Rik Theys <rik.theys@gmail.com>
X-Google-Original-From: Rik Theys <Rik.Theys@gmail.com>
To: kernel-tls-handshake@lists.linux.dev
Cc: Rik Theys <Rik.Theys@gmail.com>
Subject: [PATCH 1/5] Add server-side CRL checking
Date: Wed, 18 Jun 2025 11:00:36 +0200
Message-ID: <20250618090040.566838-2-Rik.Theys@gmail.com>
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


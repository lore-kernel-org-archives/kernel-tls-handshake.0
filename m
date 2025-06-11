Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F3A14B07A
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 11 Jun 2025 07:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749625822; cv=none; b=DB9kyQlzILVWKTB/ODBBuIAs97vk9RSkvgONewitZhtHLS6pM+i+Ty5Kxv7wbxH3gWPrj0CLwkK7AnFSoiUkozTb5vmu5vBp5gUOpWL0yn8KKHjCSZNqKlQDtGIgM26/mAE+rhOZq/cGgVHwRAj+Z2sQPqJuQTjr7oB6lC7sHZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749625822; c=relaxed/simple;
	bh=DnLpbTtkGmcH8kvODSPJUYLo4de+xPiH+2uB4WpxS+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sk/rmwiXOeTZDnIfz8EZ4jNEdkJBokgLZMyffGtOoRzNkZC1n6aEmP4YGX6t/s+pGBE2FgvY/RZhmQVi9VL7VovZNscOxFLQ0QMTLWK4FlZ3vg9hoT9WV1nMj7WQ9HL/lmxcDyXQY8kyts3PAJ31mGo8hEBSrqjYj2TYzxOrtwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+T4TVSP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+T4TVSP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-441ab63a415so65654865e9.3
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 11 Jun 2025 00:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749625819; x=1750230619; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiZprLpfE0LODSNimqJTEKlEuOw5FLY1192zbvlt5FM=;
        b=N+T4TVSPTumncqPLejcy+Vhnj//PpPpf5JKbptnxqWMbXhV7SOQ7fQq9PfC8im0kLy
         KuHHYWqfR0AcLfgdFSzO56NkDEi/KPU9ZDfNCeSAr+lYM6GUo+VC+0K7iQNcrCL2Qbre
         MSktlYELwXKS1p0/OsnPCwMDDFQ75hr70YrGvMpNAyjf9XIu0cmEzwJLZIr6Rhsks1rc
         yybYqC2aL3P0EvVmjq2bY8O5pcRBKTpT95dh4fpw+oscKpDKkBntJOpyjZFUA0da4jco
         c2aaB1afGcjSpv2Wo425o7GMhrsIPQM4mQ2l80lldNZVAa2IpWDJBfwd4F6UrxeC13lq
         sUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749625819; x=1750230619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiZprLpfE0LODSNimqJTEKlEuOw5FLY1192zbvlt5FM=;
        b=NyweMMXBpDGjvUKgoC0pIppjDmcGnxVnd/p2s+bN8BpSrVyWo1ojOLlIYzVAPdVsa6
         xcQif8jP2IJEF3Ae0wu5MNM7/ktuZPfR4XBNPhuMb4jkIz4q/ahEFIPkyg75IAcft3CS
         rlLdM43e37MIIt2e9Wa2ZKsS0yJs0wAyY4XUvKEkWBn95k9iqnCdZi5qPkchEDTdg1Ze
         pJGoanSUvcsoAQ5ElvTexAtIdUIGd6q4g9XfSn4jFbMckQ2YcitfeuLmkyAFWHuNrgEU
         cIXkEKS3ZK9JZxddOvTlI/Pa5rComO4++MhFlhXng7RM80V4ERTec3kIKhtfP7ukguJA
         sm9g==
X-Gm-Message-State: AOJu0Yw2TluJkGMVBRIdXczrqUatQXuD+8sIYGJo9hOrv5J9wbcBmTrx
	9xkaW12bq3CahKPM87RE4TEwm7QqV4CqAZFDRJm0rGo0eZ4a0odtFYO8Xw4ipBZy
X-Gm-Gg: ASbGncscHyfrR9Ujx5NRq5hrszXfFccIEzbuZDIgOCZ1j7VK4dP71McOoWK1OawZ20X
	S8w0Rj1u53ZeD9hoAXqZdYr/vzn2t4wbI8f1Lg53LShj6n0InyMDi2iwngkr6qHccI2sL3FB+tB
	r169V4/PuhlW5/4s6R5dey7gHDMwgLNWmbKq33IRF76ZEBGXhg7D2j1DIrgTXCYVyvXGcfdLlTK
	ou6gJ2D9f5g4UnsxGTP+zeainfqhWyGqkjbK0wg1gx+q7B9CkbURCyX7CjBE7c9LXCz6BuCsCrS
	HkqsZtnn9uo4Vpbyjs6SqHV2aZLnRZ4+ULqwonBqUwonL1HHl6ti5liT6092/wH6CAxoL2Dz0J4
	+9rB0Qgtab8rkEHKvxGJ9Bl6+Z1hHKSYv6lAB/x6UpooyoNsw
X-Google-Smtp-Source: AGHT+IGrXxQgRRvwoUZMJi/M+SIherf9u3w5Avd7X+7bDstra91B9cnBX6uYyxyJtUKGmFPSsdvv7w==
X-Received: by 2002:a05:600c:1d09:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-453248895c2mr17928085e9.14.1749625818536;
        Wed, 11 Jun 2025 00:10:18 -0700 (PDT)
Received: from uranus.home.lan (ptr-4yvyxu9ibhltaxz490o.18120a2.ip6.access.telenet.be. [2a02:1810:a59b:eff1::da8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532518bc06sm12020985e9.24.2025.06.11.00.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:10:17 -0700 (PDT)
From: Rik Theys <rik.theys@gmail.com>
X-Google-Original-From: Rik Theys <Rik.Theys@gmail.com>
To: kernel-tls-handshake@lists.linux.dev
Cc: Rik Theys <Rik.Theys@gmail.com>
Subject: [PATCH 2/3] Add client-side CRL checking
Date: Wed, 11 Jun 2025 09:09:42 +0200
Message-ID: <20250611070943.235087-3-Rik.Theys@gmail.com>
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


Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F2F3E47B
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  1 Oct 2025 04:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759292920; cv=none; b=s6+wzDq4Ob4hME7uEReLDsrwNjvwFNRf81gXyc33HFcIiBtJ8lpC10Ir//AxYPb6P9yR7y1PimNy7r6j3cF9VoqMXBGKPTCsiNqQ7mSKZMdrNmIJozUvt8sdfWHrSbDhQLxt4sd04RsYou1TgnPAXocukGkyWEKWh/mJkfOhw/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759292920; c=relaxed/simple;
	bh=EFhj2ua7jw0bdbwQttzGia/1kpPtFt/8evnXs7Vp/TI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQQmQg3M3shaS2H1a3+NwZen4wZhG337EAQJ9dfRVcEFy0i/y1ZiPFTwuLe6nB8zSGk/u1QcU+zn5J7F1gvRiGlZjlAUlgcuK3KUnpOzcfnZlQl4y2y89uxtWO5UMj2zumvo/vewvGlo4GYrX9kccz7n4PgblzC0CU7RNVc7014=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAAAMBn6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAAAMBn6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-26983b5411aso45692835ad.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 30 Sep 2025 21:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759292917; x=1759897717; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qxL08ZEorsVdS07KOg7kvDSbMYhuWWO8+ZuvjZMNp8=;
        b=BAAAMBn6RdDWUMMnJee9uPYrf+mDuW/SzO4pJFPuv5PNJzEZJpebmmG843cLeMF1y6
         lOIhMi8JZS6x/8oBasSyHUTd1Ch7hP2G5RXWV/y9u7D2RpUq9ufGo+MggeKTVLOZtXax
         BeP9KP7RYF3Iyy67NG3zKO0bqG1oBmgSfU8pl4Yc7/dGLBrRGH1MIxxcOc7R6smWsyS8
         g0QbiC/CE1sT16m5AVN8/SccFRPx3gJNogC96ZFRwg4IZGRPgAOnSlP/s68z4joM4qXn
         M79RetKmGGXrSD5kLU6n8/Mbo3BJI5ewmyMSMnFmilRCpIJfGHY6fyKbuC4ElM1lAgU5
         PqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759292917; x=1759897717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qxL08ZEorsVdS07KOg7kvDSbMYhuWWO8+ZuvjZMNp8=;
        b=N+D6M6/QqvC9wr0jTOepeWToxB4W0XSjjoGGB72bIS4MrK4H2bqS0Kt7SC0D8jjl9V
         MXGKKIO+u4eO5XkmXnvIzjHerjpPQwSE8jrsemI5a9H2N2yhpWSjl3AJRGus7lhPbZD3
         NH3Kx2GDnmHj5xmsbj/XcXZyZtgrBN/fpbMtPBYKuvdC/wnjPZSagGOy4grr/d2YsyUL
         BAC+mY9b+ORY88soKdNx6A1YyrFHzD5La1K0jkoopfAtofcKnTOVazarShk2W8xIF8K+
         AkzHVvdBEK+ckEI8jja5fETfiwC7zLZTIult2hA0bppQKWX8S6DYo9UW+aS2oRrC07O/
         Xccw==
X-Gm-Message-State: AOJu0YzJnttU670bfmgB15Ge+TOOWMKx2o/V3Tv8YsAWNvQwmepkbO1e
	z51B1TtD4dl28Y5hnE74kGbyU3jBnSfudzGGKh0YoAj5Q+XhxN9GkRFi8Arypg==
X-Gm-Gg: ASbGncsecAQzl34gEZ2oVEga+cSuwZJlrLQchryEHa+1i6rFSV8tloXuXXkxIUjR99t
	xSahICvtMsjzJh7GMMSI10Kd4X2z4dYn6Yo9ADTiaK1P695LEdJsGndK5e88sA83F2tc+n9FqDL
	ONl+XJkAYW4UKEr97QOUblM3bRomeVBhKODZFYeICZMVYUgMAAl1eCcUIcFYWNIeHusMTrTH6Dt
	Z9oUDXN/jAv5aNkfL1na+jBKziT2TJPHXHVn5tI/x5XpN8svJZHF8cUKHQkiuLKwiMWm/Xs69tq
	JOrowrAXIVqYUpJvj+GF5AftyOTrURMOxmTcC8R08pyaetUr/LpzG2E2jdNfaLznf3FwISeHU7Z
	Ijofi2rHd91r7/T4yTdBwnaUPP2ucd0xhPM0ImQ6mT67vm6Kwxri7+VQsxThLb/GbgQsHceBMuy
	YqTZGqFrmmCduoklApaCpiLMH2S4Hr5i5TmBmSRvmj2R9aDXWa9Luy
X-Google-Smtp-Source: AGHT+IH2VWqplhhTrUIYvVwhHD4hx4v8JEmWVfdiJ63qyVY7KhVNlsf04u2oTaSpj83ktdJtDCJ70w==
X-Received: by 2002:a17:902:d48d:b0:26e:d0aa:7690 with SMTP id d9443c01a7336-28e7f3155d7mr24776325ad.41.1759292917265;
        Tue, 30 Sep 2025 21:28:37 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6aca043sm172434385ad.138.2025.09.30.21.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 21:28:36 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: kernel-tls-handshake@lists.linux.dev
Cc: hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 5/8] tlshd/ktls: Allow restoring the TLS state from the kernel
Date: Wed,  1 Oct 2025 14:27:31 +1000
Message-ID: <20251001042734.17307-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001042734.17307-1-alistair.francis@wdc.com>
References: <20251001042734.17307-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Allow restoring the keys and sequence number from the kernel in
preperation for supporting a KeyUpdate.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 src/tlshd/ktls.c  | 280 ++++++++++++++++++++++++++++++++++++++++++++++
 src/tlshd/tlshd.h |   1 +
 2 files changed, 281 insertions(+)

diff --git a/src/tlshd/ktls.c b/src/tlshd/ktls.c
index a090e27..1bad6df 100644
--- a/src/tlshd/ktls.c
+++ b/src/tlshd/ktls.c
@@ -97,6 +97,31 @@ static bool tlshd_is_ktls_enabled(__attribute__ ((unused)) gnutls_session_t sess
 }
 #endif
 
+static bool tlshd_getsockopt(int sock, unsigned read, void *info,
+			     socklen_t *infolen)
+{
+	int ret;
+
+	ret = getsockopt(sock, SOL_TLS, read ? TLS_RX : TLS_TX, info, infolen);
+	if (!ret)
+		return true;
+
+	switch (errno) {
+	case EBADF:
+	case ENOTSOCK:
+		tlshd_log_error("The kernel's socket file descriptor is no longer valid.");
+		break;
+	case EINVAL:
+	case ENOENT:
+	case ENOPROTOOPT:
+		tlshd_log_error("The kernel does not support the requested algorithm.");
+		break;
+	default:
+		tlshd_log_perror("getsockopt");
+	}
+	return false;
+}
+
 static bool tlshd_setsockopt(int sock, unsigned read, const void *info,
 			     socklen_t infolen)
 {
@@ -122,6 +147,62 @@ static bool tlshd_setsockopt(int sock, unsigned read, const void *info,
 	return false;
 }
 
+#if defined(TLS_CIPHER_AES_GCM_128)
+static bool tlshd_get_aes_gcm128_info(gnutls_session_t session, int sock,
+				      unsigned read)
+{
+	struct tls12_crypto_info_aes_gcm_128 info = {
+		.info.version		= TLS_1_3_VERSION,
+		.info.cipher_type	= TLS_CIPHER_AES_GCM_128,
+	};
+	unsigned char seq_number[8];
+	gnutls_datum_t cipher_key;
+	gnutls_datum_t iv;
+	socklen_t infolen = sizeof(info);
+	int ret;
+
+	if (tlshd_is_ktls_enabled(session, read))
+		return true;
+
+	if (!tlshd_getsockopt(sock, read, &info, &infolen))
+		return false;
+
+	/* TLSv1.2 generates iv in the kernel */
+	if (gnutls_protocol_get_version(session) == GNUTLS_TLS1_2) {
+		info.info.version = TLS_1_2_VERSION;
+		memcpy(seq_number, info.iv, TLS_CIPHER_AES_GCM_128_IV_SIZE);
+
+		memcpy(iv.data, info.salt, TLS_CIPHER_AES_GCM_128_SALT_SIZE);
+		iv.size = TLS_CIPHER_AES_GCM_128_SALT_SIZE;
+	} else {
+		iv.data = g_malloc0(TLS_CIPHER_AES_GCM_128_SALT_SIZE + TLS_CIPHER_AES_GCM_128_IV_SIZE);
+
+		memcpy(iv.data + TLS_CIPHER_AES_GCM_128_SALT_SIZE, info.iv,
+		       TLS_CIPHER_AES_GCM_128_IV_SIZE);
+
+		memcpy(iv.data, info.salt, TLS_CIPHER_AES_GCM_128_SALT_SIZE);
+		iv.size = TLS_CIPHER_AES_GCM_128_SALT_SIZE + TLS_CIPHER_AES_GCM_128_IV_SIZE;
+	}
+
+	cipher_key.data = info.key;
+	cipher_key.size = TLS_CIPHER_AES_GCM_128_KEY_SIZE;
+
+	memcpy(seq_number, info.rec_seq, TLS_CIPHER_AES_GCM_128_REC_SEQ_SIZE);
+
+	ret = gnutls_record_set_state2(session, read, NULL, &iv,
+				       &cipher_key, seq_number);
+
+	g_free(iv.data);
+
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		return false;
+	}
+
+	return true;
+}
+#endif
+
 #if defined(TLS_CIPHER_AES_GCM_128)
 static bool tlshd_set_aes_gcm128_info(gnutls_session_t session, int sock,
 				      unsigned read)
@@ -161,6 +242,62 @@ static bool tlshd_set_aes_gcm128_info(gnutls_session_t session, int sock,
 }
 #endif
 
+#if defined(TLS_CIPHER_AES_GCM_256)
+static bool tlshd_get_aes_gcm256_info(gnutls_session_t session, int sock,
+				      unsigned read)
+{
+	struct tls12_crypto_info_aes_gcm_256 info = {
+		.info.version		= TLS_1_3_VERSION,
+		.info.cipher_type	= TLS_CIPHER_AES_GCM_256,
+	};
+	unsigned char seq_number[8];
+	gnutls_datum_t cipher_key;
+	gnutls_datum_t iv;
+	socklen_t infolen = sizeof(info);
+	int ret;
+
+	if (tlshd_is_ktls_enabled(session, read))
+		return true;
+
+	if (!tlshd_getsockopt(sock, read, &info, &infolen))
+		return false;
+
+	/* TLSv1.2 generates iv in the kernel */
+	if (gnutls_protocol_get_version(session) == GNUTLS_TLS1_2) {
+		info.info.version = TLS_1_2_VERSION;
+		memcpy(seq_number, info.iv, TLS_CIPHER_AES_GCM_256_IV_SIZE);
+
+		memcpy(iv.data, info.salt, TLS_CIPHER_AES_GCM_256_SALT_SIZE);
+		iv.size = TLS_CIPHER_AES_GCM_256_SALT_SIZE;
+	} else {
+		iv.data = g_malloc0(TLS_CIPHER_AES_GCM_256_SALT_SIZE + TLS_CIPHER_AES_GCM_256_IV_SIZE);
+
+		memcpy(iv.data + TLS_CIPHER_AES_GCM_256_SALT_SIZE, info.iv,
+		       TLS_CIPHER_AES_GCM_256_IV_SIZE);
+
+		memcpy(iv.data, info.salt, TLS_CIPHER_AES_GCM_256_SALT_SIZE);
+		iv.size = TLS_CIPHER_AES_GCM_256_SALT_SIZE + TLS_CIPHER_AES_GCM_256_IV_SIZE;
+	}
+
+	cipher_key.data = info.key;
+	cipher_key.size = TLS_CIPHER_AES_GCM_256_KEY_SIZE;
+
+	memcpy(seq_number, info.rec_seq, TLS_CIPHER_AES_GCM_256_REC_SEQ_SIZE);
+
+	ret = gnutls_record_set_state2(session, read, NULL, &iv,
+				       &cipher_key, seq_number);
+
+	g_free(iv.data);
+
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		return false;
+	}
+
+	return true;
+}
+#endif
+
 #if defined(TLS_CIPHER_AES_GCM_256)
 static bool tlshd_set_aes_gcm256_info(gnutls_session_t session, int sock,
 				      unsigned read)
@@ -200,6 +337,62 @@ static bool tlshd_set_aes_gcm256_info(gnutls_session_t session, int sock,
 }
 #endif
 
+#if defined(TLS_CIPHER_AES_CCM_128)
+static bool tlshd_get_aes_ccm128_info(gnutls_session_t session, int sock,
+				      unsigned read)
+{
+	struct tls12_crypto_info_aes_ccm_128 info = {
+		.info.version		= TLS_1_3_VERSION,
+		.info.cipher_type	= TLS_CIPHER_AES_CCM_128,
+	};
+	unsigned char seq_number[8];
+	gnutls_datum_t cipher_key;
+	gnutls_datum_t iv;
+	socklen_t infolen;
+	int ret;
+
+	if (tlshd_is_ktls_enabled(session, read))
+		return true;
+
+	if (!tlshd_getsockopt(sock, read, &info, &infolen)) {
+		return false;
+	}
+
+	/* TLSv1.2 generates iv in the kernel */
+	if (gnutls_protocol_get_version(session) == GNUTLS_TLS1_2) {
+		info.info.version = TLS_1_2_VERSION;
+		memcpy(seq_number, info.iv, TLS_CIPHER_AES_CCM_128_IV_SIZE);
+
+		memcpy(iv.data, info.salt, TLS_CIPHER_AES_CCM_128_SALT_SIZE);
+		iv.size = TLS_CIPHER_AES_CCM_128_SALT_SIZE;
+	} else {
+		memcpy(iv.data + TLS_CIPHER_AES_CCM_128_SALT_SIZE, info.iv,
+		       TLS_CIPHER_AES_CCM_128_IV_SIZE);
+
+		memcpy(iv.data, info.salt, TLS_CIPHER_AES_CCM_128_SALT_SIZE);
+		iv.size = TLS_CIPHER_AES_CCM_128_SALT_SIZE + TLS_CIPHER_AES_CCM_128_IV_SIZE;
+	}
+
+	memcpy(cipher_key.data, info.key, TLS_CIPHER_AES_CCM_128_KEY_SIZE);
+	cipher_key.size = TLS_CIPHER_AES_CCM_128_KEY_SIZE;
+
+	memcpy(seq_number, info.rec_seq, TLS_CIPHER_AES_CCM_128_REC_SEQ_SIZE);
+
+	ret = gnutls_record_set_state2(session, read, NULL, &iv,
+				       &cipher_key, seq_number);
+
+	free(cipher_key.data);
+	free(iv.data);
+
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		return false;
+	}
+
+	return true;
+}
+#endif
+
 #if defined(TLS_CIPHER_AES_CCM_128)
 static bool tlshd_set_aes_ccm128_info(gnutls_session_t session, int sock,
 				      unsigned read)
@@ -239,6 +432,53 @@ static bool tlshd_set_aes_ccm128_info(gnutls_session_t session, int sock,
 }
 #endif
 
+#if defined(TLS_CIPHER_CHACHA20_POLY1305)
+static bool tlshd_get_chacha20_poly1305_info(gnutls_session_t session, int sock,
+					     unsigned read)
+{
+	struct tls12_crypto_info_chacha20_poly1305 info = {
+		.info.version		= TLS_1_3_VERSION,
+		.info.cipher_type	= TLS_CIPHER_CHACHA20_POLY1305,
+	};
+	unsigned char seq_number[8];
+	gnutls_datum_t cipher_key;
+	gnutls_datum_t iv;
+	socklen_t infolen;
+	int ret;
+
+	if (tlshd_is_ktls_enabled(session, read))
+		return true;
+
+	if (!tlshd_getsockopt(sock, read, &info, &infolen)) {
+		return false;
+	}
+
+	if (gnutls_protocol_get_version(session) == GNUTLS_TLS1_2)
+		info.info.version = TLS_1_2_VERSION;
+
+	memcpy(iv.data, info.iv, TLS_CIPHER_CHACHA20_POLY1305_IV_SIZE);
+	iv.size = TLS_CIPHER_CHACHA20_POLY1305_IV_SIZE;
+
+	memcpy(cipher_key.data, info.key, TLS_CIPHER_CHACHA20_POLY1305_KEY_SIZE);
+	cipher_key.size = TLS_CIPHER_CHACHA20_POLY1305_KEY_SIZE;
+
+	memcpy(seq_number, info.rec_seq, TLS_CIPHER_CHACHA20_POLY1305_REC_SEQ_SIZE);
+
+	ret = gnutls_record_set_state2(session, read, NULL, &iv,
+				       &cipher_key, seq_number);
+
+	free(cipher_key.data);
+	free(iv.data);
+
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		return false;
+	}
+
+	return true;
+}
+#endif
+
 #if defined(TLS_CIPHER_CHACHA20_POLY1305)
 static bool tlshd_set_chacha20_poly1305_info(gnutls_session_t session, int sock,
 					     unsigned read)
@@ -274,6 +514,46 @@ static bool tlshd_set_chacha20_poly1305_info(gnutls_session_t session, int sock,
 }
 #endif
 
+/**
+ * tlshd_initialize_ktls - Initialize socket for use by kTLS
+ * @session: TLS session descriptor
+ *
+ * Returns zero on success, or a positive errno value.
+ */
+unsigned int tlshd_restore_ktls(gnutls_session_t session)
+{
+	int sockin, sockout;
+
+	gnutls_transport_get_int2(session, &sockin, &sockout);
+
+	switch (gnutls_cipher_get(session)) {
+#if defined(TLS_CIPHER_AES_GCM_128)
+	case GNUTLS_CIPHER_AES_128_GCM:
+		return tlshd_get_aes_gcm128_info(session, sockout, 0) &&
+			tlshd_get_aes_gcm128_info(session, sockin, 1) ? 0 : EIO;
+#endif
+#if defined(TLS_CIPHER_AES_GCM_256)
+	case GNUTLS_CIPHER_AES_256_GCM:
+		return tlshd_get_aes_gcm256_info(session, sockout, 0) &&
+			tlshd_get_aes_gcm256_info(session, sockin, 1) ? 0 : EIO;
+#endif
+#if defined(TLS_CIPHER_AES_CCM_128)
+	case GNUTLS_CIPHER_AES_128_CCM:
+		return tlshd_get_aes_ccm128_info(session, sockout, 0) &&
+			tlshd_get_aes_ccm128_info(session, sockin, 1) ? 0 : EIO;
+#endif
+#if defined(TLS_CIPHER_CHACHA20_POLY1305)
+	case GNUTLS_CIPHER_CHACHA20_POLY1305:
+		return tlshd_get_chacha20_poly1305_info(session, sockout, 0) &&
+			tlshd_get_chacha20_poly1305_info(session, sockin, 1) ? 0 : EIO;
+#endif
+	default:
+		tlshd_log_error("tlshd does not support the requested cipher: %d", gnutls_cipher_get(session));
+	}
+
+	return EIO;
+}
+
 /**
  * tlshd_initialize_ktls - Initialize socket for use by kTLS
  * @session: TLS session descriptor
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 663f2c0..9c99a1f 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -97,6 +97,7 @@ extern int tlshd_server_psk_cb(gnutls_session_t session,
 
 /* ktls.c */
 extern unsigned int tlshd_initialize_ktls(gnutls_session_t session, enum sock_direction direction);
+extern unsigned int tlshd_restore_ktls(gnutls_session_t session);
 extern int tlshd_gnutls_priority_init(void);
 extern int tlshd_gnutls_priority_set(gnutls_session_t session,
 				     const struct tlshd_handshake_parms *parms,
-- 
2.51.0


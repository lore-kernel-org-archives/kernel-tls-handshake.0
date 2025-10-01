Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6503B4AEE2
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  1 Oct 2025 04:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759292911; cv=none; b=cPdE+6CF8woWxwCQOOyvjLZ1SydqALq57Casp5jaNCBsKyfPB+qvvTCP7wgkK+iGa3fHwKpMrODrDE9rLEHw8SaRY0OYEwzXl3C5WxTAQhUGydAqg61S64WQ3uBEHWQPnmXu38czVRbG3SoOLxmAKSKz5RBLCk+LC5NKIt39OSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759292911; c=relaxed/simple;
	bh=x4JfmuNJUTNa6RrYON/2gY+OjAaks3FLt6BccPPebPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUeItjhbLIZAUqHzhaf9/MBR6gExWP2Tvi5CPOGzVyo7ml2WtH7RhS2VV6ieqYqSmfr0cHpQyPiW/ea9QRYXTi7kSJYXdg+kdy9xR069UkzLMXx8qez7Gyt4ZHwkaZGqQrUGMxT6spsYVQuydWHa3daicj8go5sFd7LLRN6Qrlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwxWMwh6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwxWMwh6"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2698d47e776so58272245ad.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 30 Sep 2025 21:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759292909; x=1759897709; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vl4hVmJc2+S7+NM+wO1ck7T5fr6iETUj96m+xBhoY7s=;
        b=AwxWMwh6LcnjgPnhOVeWzhnp1jzEacU24CHTvmTy+ZcNThefNqnYrvbZYLJVqCSCbu
         MprmqIN0qfV6ckiNZBqI5qVbGQ+LqUlDWE2I+rjwI3NZ6PrIk+WMKxQgO9UNDnEvyLKm
         cXkg0x05gFVFqh0jKijALJW7NU1P65tpwqGWmplm4TC9z/OlRoSfJU5xQfR4ipUdppUY
         1scg1YJSZ0iyMgPWK5t4RSkvkXHOY++LI20fFX1Co7iHucsN2ONmI/NlBOYoKccWwNyv
         R8lNFVJgJcRZ9l7E8VAz34+xHcO3122i/dhWBF0+PcDWi+pPZQ0i2KmdvYjDlCOYVyXF
         F5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759292909; x=1759897709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vl4hVmJc2+S7+NM+wO1ck7T5fr6iETUj96m+xBhoY7s=;
        b=o8T1sYz6xGk2pSHTPn8/OMKyzpHtxTiW6FNT+bNrA0gFdArM45bP42+xp/91x+pr+x
         vucMinU7TQ4xdlV1LWtTOfhyOqSyVHfwnwFCyrQOT9CJkFpOZ+gHPeu960CsYxHfbsBS
         09p5GgKSKoN+pwfZjJC1en0Do8mGj7eoqEiGD2in35MOifWngzeQBTUDNLL3YkMYYwV9
         wpFvkHDe/+7xa68BO/TEnnj+B++Hs56uHWX3suAM/loelBZ9SeLijrij2d+yGkpYDKmS
         zhK8YL7BmLU5OfqmWNN3NdVVnVF38lRZp8LXmuLwPSPrJsT1ZQZLS778Xl9J8pQIiGmA
         jwRA==
X-Gm-Message-State: AOJu0Yx3VjJtfLgVQyVzYZjL6uDYfqldrJzPk3exeHnWOc1CwRVZ7f3L
	1Py0UNCHkbxxzrq/DnjQYPoqMr2qkWN48mycLBWSnpRfYErmh7qNwbSBj5jQcw==
X-Gm-Gg: ASbGnctwfPd+7dWaFcEqqPVDwpGvCd5dOKLRw7RCSRM8K5x2Uju6ljhRXQ8aHvroXRl
	dUoaklZ/TWAGJRyThFoS1TWPxBxX+A8smPvOAgL0IGrtrAcixVbVubPBq+Qoj3/9oZRhyoAQw4a
	697ST//wIrcSEEAlxDQ7f0DOteWITO9zgjA/q6nlBX/q7fu6ktrVP4Dyt+3TxEcuxo9VBfe+Sn4
	EKzYktEtkf+NMqc+ePafFOwztFCCHFiJtxn3qu62P2qAWT/J1G4pf1InzcSRxEgq8jB9FBfzpDi
	BE+xu/KZswoQtoVwQNjExpbRgzlte+6ie+dfjw8wZCIbx3mbokwHEMpes7aWqEtfU6TjDwY01hO
	niJ7IFDIyZeavgV9xN8I1WGEj9OAga55Wc5qmZNQX4z/mxGhsrM9iRw1cj5ClE6hkwfe52LEwm9
	La7X+32H9wnXnPW3oC0hkZ79GRyi63xESDJdY5fQp4ddgRsSS2v7Y+gfZuJLWBzBc=
X-Google-Smtp-Source: AGHT+IGmNfddfVhlJ0twAAPHuPuJbVtjRSdT0ar0evBv/m+dipt643nAgfdrTHEjdIvLaU/b/4XqsQ==
X-Received: by 2002:a17:902:f786:b0:272:f9c3:31fb with SMTP id d9443c01a7336-28e7f44088cmr28347305ad.58.1759292908916;
        Tue, 30 Sep 2025 21:28:28 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6aca043sm172434385ad.138.2025.09.30.21.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 21:28:28 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: kernel-tls-handshake@lists.linux.dev
Cc: hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 2/8] tlshd/ktls: Allow specifying the sock direction to set
Date: Wed,  1 Oct 2025 14:27:28 +1000
Message-ID: <20251001042734.17307-3-alistair.francis@wdc.com>
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

After the initial handshake we will want to call tlshd_initialize_ktls()
again on KeyUpdat events, but there is no need to update both in and out
keys. So let's add an enum to tlshd_initialize_ktls() allowing us to
specify which keys to update.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 src/tlshd/handshake.c |  2 +-
 src/tlshd/ktls.c      | 46 ++++++++++++++++++++++++++++++++++---------
 src/tlshd/tlshd.h     |  8 +++++++-
 3 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/src/tlshd/handshake.c b/src/tlshd/handshake.c
index f688932..1e5a622 100644
--- a/src/tlshd/handshake.c
+++ b/src/tlshd/handshake.c
@@ -111,7 +111,7 @@ void tlshd_start_tls_handshake(gnutls_session_t session,
 	tlshd_log_debug("Session description: %s", desc);
 	gnutls_free(desc);
 
-	parms->session_status = tlshd_initialize_ktls(session);
+	parms->session_status = tlshd_initialize_ktls(session, READ_WRITE);
 }
 
 /**
diff --git a/src/tlshd/ktls.c b/src/tlshd/ktls.c
index 49187d0..a090e27 100644
--- a/src/tlshd/ktls.c
+++ b/src/tlshd/ktls.c
@@ -280,7 +280,7 @@ static bool tlshd_set_chacha20_poly1305_info(gnutls_session_t session, int sock,
  *
  * Returns zero on success, or a positive errno value.
  */
-unsigned int tlshd_initialize_ktls(gnutls_session_t session)
+unsigned int tlshd_initialize_ktls(gnutls_session_t session, enum sock_direction direction)
 {
 	int sockin, sockout;
 
@@ -297,23 +297,51 @@ unsigned int tlshd_initialize_ktls(gnutls_session_t session)
 	switch (gnutls_cipher_get(session)) {
 #if defined(TLS_CIPHER_AES_GCM_128)
 	case GNUTLS_CIPHER_AES_128_GCM:
-		return tlshd_set_aes_gcm128_info(session, sockout, 0) &&
-			tlshd_set_aes_gcm128_info(session, sockin, 1) ? 0 : EIO;
+		if (direction == WRITE || direction == READ_WRITE) {
+			if (!tlshd_set_aes_gcm128_info(session, sockout, 0))
+				return EIO;
+		}
+		if (direction == READ || direction == READ_WRITE) {
+			if (!tlshd_set_aes_gcm128_info(session, sockin, 1))
+				return EIO;
+		}
+		return 0;
 #endif
 #if defined(TLS_CIPHER_AES_GCM_256)
 	case GNUTLS_CIPHER_AES_256_GCM:
-		return tlshd_set_aes_gcm256_info(session, sockout, 0) &&
-			tlshd_set_aes_gcm256_info(session, sockin, 1) ? 0 : EIO;
+		if (direction == WRITE || direction == READ_WRITE) {
+			if (!tlshd_set_aes_gcm256_info(session, sockout, 0))
+				return EIO;
+		}
+		if (direction == READ || direction == READ_WRITE) {
+			if (!tlshd_set_aes_gcm256_info(session, sockin, 1))
+				return EIO;
+		}
+		return 0;
 #endif
 #if defined(TLS_CIPHER_AES_CCM_128)
 	case GNUTLS_CIPHER_AES_128_CCM:
-		return tlshd_set_aes_ccm128_info(session, sockout, 0) &&
-			tlshd_set_aes_ccm128_info(session, sockin, 1) ? 0 : EIO;
+		if (direction == WRITE || direction == READ_WRITE) {
+			if (!tlshd_set_aes_ccm128_info(session, sockout, 0))
+				return EIO;
+		}
+		if (direction == READ || direction == READ_WRITE) {
+			if (!tlshd_set_aes_ccm128_info(session, sockin, 1))
+				return EIO;
+		}
+		return 0;
 #endif
 #if defined(TLS_CIPHER_CHACHA20_POLY1305)
 	case GNUTLS_CIPHER_CHACHA20_POLY1305:
-		return tlshd_set_chacha20_poly1305_info(session, sockout, 0) &&
-			tlshd_set_chacha20_poly1305_info(session, sockin, 1) ? 0 : EIO;
+		if (direction == WRITE || direction == READ_WRITE) {
+			if (!tlshd_set_chacha20_poly1305_info(session, sockout, 0))
+				return EIO;
+		}
+		if (direction == READ || direction == READ_WRITE) {
+			if (!tlshd_set_chacha20_poly1305_info(session, sockin, 1))
+				return EIO;
+		}
+		return 0;
 #endif
 	default:
 		tlshd_log_error("tlshd does not support the requested cipher.");
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 6ee950d..42900bf 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -49,6 +49,12 @@ enum peer_type {
 	PEER_TYPE_SERVER,
 };
 
+enum sock_direction {
+	READ,
+	WRITE,
+	READ_WRITE
+};
+
 /* client.c */
 extern void tlshd_tls13_clienthello_handshake(struct tlshd_handshake_parms *parms);
 extern void tlshd_quic_clienthello_handshake(struct tlshd_handshake_parms *parms);
@@ -84,7 +90,7 @@ extern key_serial_t tlshd_keyring_create_cert(gnutls_x509_crt_t cert,
 extern int tlshd_keyring_link_session(const char *keyring);
 
 /* ktls.c */
-extern unsigned int tlshd_initialize_ktls(gnutls_session_t session);
+extern unsigned int tlshd_initialize_ktls(gnutls_session_t session, enum sock_direction direction);
 extern int tlshd_gnutls_priority_init(void);
 extern int tlshd_gnutls_priority_set(gnutls_session_t session,
 				     const struct tlshd_handshake_parms *parms,
-- 
2.51.0


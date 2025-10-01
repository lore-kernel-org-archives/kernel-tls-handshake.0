Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9783E47B
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  1 Oct 2025 04:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759292917; cv=none; b=S1gXk/7lNSg4Ex5mLhwlY8Oz4uB5IO+XLutQVx90h039gZaomRnPw3Y+p0wGWfzN49tgzTHRCgL2jbPEDX2XwXpjaY5K6S8ZdyV/FZoQNhUwx6FUI7IVcqBnQoZKXPveTnV1fY4/8r+fmZ57WIli8pLF4qR9qRPuG4s+CHR501s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759292917; c=relaxed/simple;
	bh=qXEXCSZFKb14tsLfiwvXvc7ukwmo9MJdKIkKbDjz+5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Il4mqHIEhwlw8Usw58r2fPtPhO/dvnyMvFQnCbG2nuKdfrtZM3kghk6fjB+0c4CaBxJY72gxMM6x5Zc0eH2w3KMwiAlLP2ha/bhA/WjzCHcNsXznndlmTzEcAe5smkCOts+0SZOYxPwzkoSGnt1vVsuhTtGi2XOc5g+rfJPytfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaZrzg7H; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaZrzg7H"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-27c369f8986so65508455ad.3
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 30 Sep 2025 21:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759292914; x=1759897714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbMKgRDwrvma0Z+CDR5SVLFEf/NiRs1dScGoLmc0rOg=;
        b=KaZrzg7HiC5kpVjF35X+4Ex/KsvsBRvhZWRqzcfNbDLBdNdkMFhL3lEE1AiWX4/1Ol
         38xVsYnW0OizLXomcqwmBcKutVVzq2X+2avQ6a+B22bQnjtlLfcADljxeX8C42kg3Mfq
         VuY5MTFADI+hyJpwngSxPGn/HGId0fl8akv0zBFVpEicPd2Vacpv5CZP5PGBUzGNYiNM
         tTkMAMrJkyHmSr1EHXcnqVhMQs3tpoztPGjYERyLTvgLL3+Ee8t9tXzN4FPj8SdXdBEL
         cgnFBZ9cfj0rDrj7e4b8emA0LYyc3R/p8HZRJGvUorMfAAr3yECbdA7iZHoRd405sxnS
         2TVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759292914; x=1759897714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbMKgRDwrvma0Z+CDR5SVLFEf/NiRs1dScGoLmc0rOg=;
        b=AqoiAcai6syvRIcG2Xrq5K9jRPAB53ly2dkGB7MGM9M+BH+P4Mytpx+/8v0aK7E34X
         BXV6QW02jgqpUDbeJI+Fa02zli8GbhMVTEFowoievmDBL1Qc+JpgF/bNpPe1FNnERKua
         xTcgwM8fXcPJQFYfnwZDMXCLEwLUev6+D4YngQckgFTf8ocmBL+Cq0+ewKf3txauyHdM
         2eWKvDK+ijPPQ565DS1vVadlHZFAXcwDCNZUbrFrllPDAzeG496TZQ9BIRj4wRLl8e6+
         FzvzUfcsqOOcn5HLAlir7B+4Hw6nJZMvibskvMjcft08ZEJX0W7VhO5cyj+XP1xIuQSt
         u+ew==
X-Gm-Message-State: AOJu0YxxXf0SVbOd5yM97bku94w98Ej4+7L+b0Uzt73o7PWGXhlzR5BD
	zukxMV9Islj8WvWAgqy+FYapJzabAsjbNxAm0NU/lIzb04KP3KD1e2tNx7q1fg==
X-Gm-Gg: ASbGncsfXbe/accIkCGBOHi3qOPhP13+15aVDX2Nexlv1oZCDuyliVjuNybG5l4n2XW
	OkeusYZbM//BBxD+KLfCEAhgSK3zIn/51syHTjowy7Cnywa2iEekV4PYjAnvdw3bEgG/w6w32XO
	77iGA/aCtOXhf70UUyfD3gW0sq6kYuqEHRM+GU6imFq5QpaKmi2w0Yzh0GOJ+L7Zla5x4x7Z/D7
	WpFh/cG1LTf0a7sadUA/x6JBQjNmMsccCY30+3H//ZO9hOStMtaVZRi0gR3/0hHhEnQ2ShCXs/f
	3EvGgsW8/kvmPAk36d8jRP6RSAd37mPsGD2v9EN3rUmqQ0bZ+FYkzZKYtwcokTZ05x58brbJ59A
	LZ+G/hJeEb55PkmEID9VbHYuRDgS5DlMPM8526KE2A/XP8Npb/8eL6if81amYVRxinCiV6688X9
	o7DLsBBXc4wRCNLMpfdsG6Bo5KNFyJNuiw+FaLw+iQVGfUKBF1mbGJI/KVDWnTz68=
X-Google-Smtp-Source: AGHT+IGsVqy4xPj6Am9R8mHh2anV/rll3tDgUx+hk9MhiX9KqeBn3ox/ijgODQM3XHJ4bNX913afOw==
X-Received: by 2002:a17:903:3807:b0:28d:1939:f9c8 with SMTP id d9443c01a7336-28e7f2c5774mr25741675ad.26.1759292914403;
        Tue, 30 Sep 2025 21:28:34 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6aca043sm172434385ad.138.2025.09.30.21.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 21:28:33 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: kernel-tls-handshake@lists.linux.dev
Cc: hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 4/8] tlshd/keyring: Allow session save/restore to kernel keyring
Date: Wed,  1 Oct 2025 14:27:30 +1000
Message-ID: <20251001042734.17307-5-alistair.francis@wdc.com>
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

Support saving and restoring the gnutls session to the
kernel keyring. This way we can save the session after a handshake and
then restore it when a KeyUpdate occurs.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 src/tlshd/keyring.c | 74 +++++++++++++++++++++++++++++++++++++++++++++
 src/tlshd/tlshd.h   |  3 ++
 2 files changed, 77 insertions(+)

diff --git a/src/tlshd/keyring.c b/src/tlshd/keyring.c
index 32f2d27..02cc5f1 100644
--- a/src/tlshd/keyring.c
+++ b/src/tlshd/keyring.c
@@ -79,6 +79,80 @@ bool tlshd_keyring_get_psk_username(key_serial_t serial, char **username)
 	return true;
 }
 
+/**
+ * tlshd_keyring_put_session - Retrieve a previous gnutls session
+ * @serial: Key serial number to look up
+ * @session: On success, filled in with a gnutls_session_t
+ *
+ * Caller must use gnutls_deinit() to free the session when finished.
+ *
+ * Return values:
+ *   %true: Success; @session has been initialized
+ *   %false: Failure
+ */
+key_serial_t tlshd_keyring_put_session(gnutls_session_t session)
+{
+	key_serial_t serial;
+	int ret;
+	gnutls_datum_t data;
+
+	ret = gnutls_session_force_get_data(session, &data);
+
+	if (ret < 0) {
+		tlshd_log_error("Failed to get gnutls session.");
+		return -1;
+	}
+
+	GRand* rand = g_rand_new();
+	gchar* key_name = g_strdup_printf("ktls:gnutls-session-%d", g_rand_int(rand));
+	g_rand_free(rand);
+
+	serial = add_key("user", key_name, data.data, data.size,
+			 KEY_SPEC_SESSION_KEYRING);
+
+	g_free(key_name);
+
+	if (serial < 0) {
+		tlshd_log_error("Failed to save gnutls session.");
+		return -1;
+	}
+
+	return serial;
+}
+
+/**
+ * tlshd_keyring_get_session - Retrieve a previous gnutls session
+ * @serial: Key serial number to look up
+ * @session: On success, filled in with a gnutls_session_t
+ *
+ * Caller must use gnutls_deinit() to free the session when finished.
+ *
+ * Return values:
+ *   %true: Success; @session has been initialized
+ *   %false: Failure
+ */
+bool tlshd_keyring_get_session(key_serial_t serial, gnutls_session_t session)
+{
+	int ret;
+	void *data;
+
+	ret = keyctl_read_alloc(serial, &data);
+	if (ret < 0) {
+		tlshd_log_error("Failed to read gnutls session.");
+		return false;
+	}
+
+	ret = gnutls_session_set_data(session, data, ret);
+	free(data);
+
+	if (ret < 0) {
+		tlshd_log_error("Failed to restore gnutls session.");
+		return false;
+	}
+
+	return true;
+}
+
 /**
  * tlshd_keyring_get_psk_key - Retrieve pre-shared key for PSK handshake
  * @serial: Key serial number to look up
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index aad1f0e..663f2c0 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -79,6 +79,9 @@ extern void tlshd_service_socket(void);
 /* keyring.c */
 extern bool tlshd_keyring_get_psk_username(key_serial_t serial,
 					   char **username);
+extern key_serial_t tlshd_keyring_put_session(gnutls_session_t session);
+extern bool tlshd_keyring_get_session(key_serial_t serial,
+	gnutls_session_t session);
 extern bool tlshd_keyring_get_psk_key(key_serial_t serial,
 				      gnutls_datum_t *key);
 extern bool tlshd_keyring_get_privkey(key_serial_t serial,
-- 
2.51.0


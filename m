Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6A03E47B
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  1 Oct 2025 04:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759292914; cv=none; b=bhIjUvqM2YK/W9SbPXBUMFPc3IyhXbe2NEuKB7Hh08zrCcnZXbNJ6ujJhZ5a05o3mDhY7n51NxrOgiJcw8ViVdOtvg+vvS2qa7ephCqCdLP6voOMLfQb3h60ASnYd/0RhWNZs+79ckbfXVgiH/8xAaxOfuBHeUWJuisEnGW96Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759292914; c=relaxed/simple;
	bh=L1kd4BE/iUuZUlbnGiy4qkWeQ8ikb9MYJ+hM3u8YV/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZkI76J+dROclW3Ac9EGRI3lLQ62U5oSc2SMphlAisM766uZ2OGKd3ymtuHYi25W7kahfI2BZtMTwqxwfG+VjsePVq8dPIBTBehJ788jl5yLCWwiqbtqG3stxrKd6GUD3S0eENwdgBirw0/dme/FKVwcBxRsgTf/tJdsiwIpmbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9BE/itk; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9BE/itk"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-78115430134so3889755b3a.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 30 Sep 2025 21:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759292911; x=1759897711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gtopt0xlpMzy4kYI5WAEPgwUTasYafcS2VdUn25IVvs=;
        b=Z9BE/itkbo6Tu2NZU0pTTAxP9f+bNSoM+3U9+Ps/xuxAyZVckQDn5U0A9CqR+P8ouG
         lCOKPMFjVEMFf8++gJCo7YGEmpBY5OpspGsnMvTCsJuoFAaZsjEFJFFaAzpAaW61tPwy
         ebHeJbgxBl7uAx+Wrr9xQBjHQwmcS2MUz/7EzcHOr51dsadBYGr9wUzwlPR44y+SkcBi
         usVHAE5OsgJ8ezvyLPku5IL2BwZ2AXplu0Knc73fD/cfkm+K+5r+qMRBZiJRBIDjrL1o
         8IdLXfre7hLMsXyMZNnRB54mCDVGoWiZcVO9iGGvOlmwVEBwGb/6xIEH2gaDHOJuvtGP
         ddZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759292911; x=1759897711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gtopt0xlpMzy4kYI5WAEPgwUTasYafcS2VdUn25IVvs=;
        b=OeOkUV1tCR9jIAkhBidjPt9JzC01Ing4yXmrmevIisorQ4jmrFYzrcY46OuX74asDS
         y1gx/BnyIXlFFAhW1GcPevrCevQ6U5T+FQB8q8dk8NHvl6WVi98tE8NjhERxv2Hy3KL0
         rPs5oZ+I4RNa2D5uTJOcX7M8oK6rZ/4Jx9Y/QhPb8eUGH3h4yWYMXVQ4y32wONEFjCBw
         NdCRzZRJlQ21BM7EQQ1Zu7IBdRew0PY0Yp/oFvFt/pu5ErMwJAM9XeCs7RdJA4PLD6L8
         044Vc04ka7q6y9N4ntsRuq0/E2XitYROCt8Fb6B9huO7+BRxuMnhZZXKMsniZvy7BVtL
         ypuA==
X-Gm-Message-State: AOJu0YzFOCIv8XA4KDzNyZWZF59HHWE24vSSp4jRgOlgvsAeSO0Scc4m
	gwB6u20WdFNsCm9GZa1PTigKK2DFro7jtdNVQQ3EgttY+RhLpvot95gYnyacIQ==
X-Gm-Gg: ASbGncufPnskRbMbrjnx32fEl9rshB8JpjQUOFq8knaKztnVwFMfc1t2iPOx/Ghehlr
	vh6PFKIvqKPCS/HutGK0SXzNyw2iFFJBcNdtdb0glWBKYDrDgafrGmtLC9P5kLqKmffNeXSf68r
	kHHeV49ete+uaYoCqAVA3oOJ1vjuQeuTZw/MMArXpj2XusUr/HfpT4Y9sYulZnkMq/n/etTFNBv
	5UYZgu6mAw08hEfyo0GSnlb5sNCESy6PGmbjWdLnUbfGhFNOKMBTrXP4VDLUNu1EQLu2L9PmYna
	pNgGNFlE4Zlc8fkfdTJyKgVm5HaSnJzWZLmir5c70mN8Hk9bSpm9f8ZwBXVEt+Wi7AT4XKWFX5d
	DExiTw2Q0aZCD7SZiwIdd1lLUBu7JizihvGltKvj2T4jaaXuMFhwhhH8zSsbTrq7Cg8dCt0zM7d
	O+K/Wkd1X1o2t4nT/X5lwLc+lShosUhdGVudI7UkCeTBkJUD1Ar/qM
X-Google-Smtp-Source: AGHT+IFgMbMwMgtRxdZ6Qc9SLl1GwPfJEHAMfzdJ5x5z+zP9ix11TO3W0z0NLnZAtpYZdqjD4Lj5AA==
X-Received: by 2002:a17:902:f711:b0:26a:b9b4:8342 with SMTP id d9443c01a7336-28e7f332cf7mr31043355ad.25.1759292911655;
        Tue, 30 Sep 2025 21:28:31 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6aca043sm172434385ad.138.2025.09.30.21.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 21:28:31 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: kernel-tls-handshake@lists.linux.dev
Cc: hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 3/8] tlshd/server: Expose tlshd_server_psk_cb
Date: Wed,  1 Oct 2025 14:27:29 +1000
Message-ID: <20251001042734.17307-4-alistair.francis@wdc.com>
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

We will want to call tlshd_server_psk_cb() from tlshd_service_socket()
as part of the server KeyUpdate, so expose it publically.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 src/tlshd/server.c | 2 +-
 src/tlshd/tlshd.h  | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index 6531f08..7a7ece1 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -398,7 +398,7 @@ out_free_creds:
  *   %0: Matching key has been stored in @key
  *   %-1: Error during lookup, @key is not updated
  */
-static int tlshd_server_psk_cb(gnutls_session_t session,
+int tlshd_server_psk_cb(gnutls_session_t session,
 			       const char *username, gnutls_datum_t *key)
 {
 	struct tlshd_handshake_parms *parms;
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 42900bf..aad1f0e 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -89,6 +89,9 @@ extern key_serial_t tlshd_keyring_create_cert(gnutls_x509_crt_t cert,
 					      const char *peername);
 extern int tlshd_keyring_link_session(const char *keyring);
 
+extern int tlshd_server_psk_cb(gnutls_session_t session,
+			       const char *username, gnutls_datum_t *key);
+
 /* ktls.c */
 extern unsigned int tlshd_initialize_ktls(gnutls_session_t session, enum sock_direction direction);
 extern int tlshd_gnutls_priority_init(void);
-- 
2.51.0


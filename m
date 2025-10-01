Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901773E47B
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  1 Oct 2025 04:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759292909; cv=none; b=fS9sgI7moB6yzGR317UeJpmuW6UGDRgnH2TCQqhfrIeVLcGN0nT06rvy5aVLxuOWdpRVDkqVnQ06MeeE/BGRVFwpy1Y0CXRuC3+kyoqUF6u4inIRGZKNQTtco+DqQDuVVQrddIHqBpGT+hVSv+Py/KaWgPzSXwAWtqu2Hg4kRZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759292909; c=relaxed/simple;
	bh=KqRAJlJo3dWf6RGEmwOmpfYRljH/jSy8jRL4aOyRYbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A9QikmJS8roPasWAp/bX2yx8HPCXgsveMRd21wUr3H14ngGiTk80bEMMy/s9ANOJMyZrFBStDj7tWzgvKchrM1L1S8jUJsyifrOPS2PO/fSDxEAUMDA+/RQ6KpmjhiXuX3mbwEX8/DQ1/lcY3+VCBV4XPsXh6ggSAKn8DN4OVvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nb7zYqLO; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nb7zYqLO"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b593def09e3so3283518a12.2
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 30 Sep 2025 21:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759292906; x=1759897706; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCWH84ZywpxTzQODm1Zl4wy4undctailWt0clcYG9Nc=;
        b=nb7zYqLOdszFzNWkOo5Nxmj8lyepV6t0qRtrOZwR6SF66U1prj559pcya9Het66jZX
         5c8ox5isigjqLeafsgQB2qUe8pJeOY9XNOYk0sMh9s5rbmBlWJBaVTdNK0ZvDq1777xP
         ih4Vi990uGuQtUGtRgwP+4gNeJUUZNtf84lSlFNjAZWK9NGIbBBrK9PVkAurl9nt0/M6
         Q/WFJj6E/LbuEInknLyt61886iWfCLkogQfkvob82SOhP13inUE6Z7tiewwf8Ai0briR
         DJUVF6g5Ifi/pHOMv/wfX8Lb2xrYjxLPyYjJAGzBIkIcbsxg4wDYJO8nylGohbEZ/Yim
         teDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759292906; x=1759897706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCWH84ZywpxTzQODm1Zl4wy4undctailWt0clcYG9Nc=;
        b=JBDrORCJZMyMxcn23m/s82qItLOUOVmwy55GMuE8obkrkg+cSKz2o4qOt/0lz3GLFG
         TNjR3cWhAPry1lhNTVkteZjgIWIi7bzythOgd1PCNqXytq1PEFzS8c48fVitET7l6X+n
         NhAk3tZB+ebUWzJ7sllL9xpo8eWqX4CXk+9mNV/hv3CS0gUaOIIc2A9lnSuHA90Kkmuk
         2YBHkNY9vXbDjsNuKNFkgjQlOcGdzUX2gyX2uoJ5TMEugk6DUDoc6ilU4mWzv22SHRcM
         GTDqtvLgt7Kxddrex8QwIjXfPGxRMNmCYsLP3Bn3RJfQNWvaGcjnWB3yleMZJSSH3SdA
         XM3g==
X-Gm-Message-State: AOJu0Yyru6mbqcJIa9Mt526jXPbDPbGMKzZvA/+ph13Voqtch67A3G5v
	/XnehyoFD0NoXGMY5PP38tkN77eQ9bmiuwmeQMN+nxlV2dWZap1oVtZ6Wfg48Q==
X-Gm-Gg: ASbGncvaO51UP8516ExCkY6vLfnHMsws4QvvH/C1LdZPqxKccVbTKS/38qStH3kfJwa
	KVBkuw8+yG5dXjj6tbNhdCgCuTcshM1mwCk94iIqElGMSoq/5dUJkScGTiz0f69eezwmjqCxsBh
	ZLLmIGKVbwcrvEZtzWx/It78VrfD1GNsnRvoZ5L4zy0KW75qOVsGQH1VnRcr+4G6XTlZTY/MfzC
	xW5nYK6XYOxl9LqfR2jfAaYuF7oOyjYLi6wVOf47oo7lOu6tvLtJRClrlCs7HMvnyK8rkLJ6C1S
	bgeu9DaPaK2XLccsTJl63H6GOrhsNo6YdaiBI135mAiVqddaxyoJ+T/bxowCm+NtxhB5xMZkXxf
	Lw4BA6p/SQ0bBoER0PVGBVlaZKsrPoKBfheCnwkyUB0e0s3ovhU27hK4vlkzwGNr8xvU+C0UbQl
	hTuKErWpUm17tianoba5uj7nat7dKpSKBJQAVCx4aPW/92xneZ8MQm
X-Google-Smtp-Source: AGHT+IHZVxhR5M32XvQILE8QH3CWo3Hln0zw6MhzvadG9pZ12NGZoSN4BAK9r1y85WjX/4Fs9uJClw==
X-Received: by 2002:a17:903:298d:b0:269:b65a:cbb2 with SMTP id d9443c01a7336-28e7f32897dmr28413535ad.47.1759292906141;
        Tue, 30 Sep 2025 21:28:26 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6aca043sm172434385ad.138.2025.09.30.21.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 21:28:25 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: kernel-tls-handshake@lists.linux.dev
Cc: hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 1/8] tlshd/ktls: Don't abort on EEXIST TLS_ULP errors
Date: Wed,  1 Oct 2025 14:27:27 +1000
Message-ID: <20251001042734.17307-2-alistair.francis@wdc.com>
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

When performing a KeyUpdate the session socket will already exist so
let's not abort on a EEXIST error.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 src/tlshd/ktls.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/tlshd/ktls.c b/src/tlshd/ktls.c
index 50381bf..49187d0 100644
--- a/src/tlshd/ktls.c
+++ b/src/tlshd/ktls.c
@@ -286,8 +286,10 @@ unsigned int tlshd_initialize_ktls(gnutls_session_t session)
 
 	if (setsockopt(gnutls_transport_get_int(session), SOL_TCP, TCP_ULP,
 		       "tls", sizeof("tls")) == -1) {
-		tlshd_log_perror("setsockopt(TLS_ULP)");
-		return EIO;
+		if (errno != EEXIST) {
+			tlshd_log_perror("setsockopt(TLS_ULP)");
+			return EIO;
+		}
 	}
 
 	gnutls_transport_get_int2(session, &sockin, &sockout);
-- 
2.51.0


Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C523E47B
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  1 Oct 2025 04:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759292906; cv=none; b=OinOCu19xZ2LFD0XxKhqKVhq1mZO7ThY9HR9UiJ7bICzW+tSuUqSZGm9mGxrMZ1xtIUFkH2onODHHvTbDjIrSw2Lb/5G7Lc9XC2V+qPeFILVhiFXoT20L6zdudmUGCMlAPbT3NTC6VuqBEx9kJsUzjLpGZTiZFhBxMNcIAnbdxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759292906; c=relaxed/simple;
	bh=cr5H/iGtYRJTs2ohPdAkKdjvF87G7MOAmnu0bTepjvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jIYwt+WuKGYmrIMr22xNH9nhOVZtMcCEjPhA/jrw8h2N4zADdx3wWxgKHXjYtMKPfKbXnErTQbNZBYLkXsrzYYoQLGCVEWIF9WgEOiHKBEIPyuIMTQQWzHHVDf6IlhjJMr8JzPxxP5yeqFQB5uwu5G3UbeGM+t3yvzJMYp2ecvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+E4sqzk; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+E4sqzk"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77c1814ca1dso5256804b3a.2
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 30 Sep 2025 21:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759292903; x=1759897703; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ae0TsP+gQ/KcLcJFB5vABbFUYAv2LpdlsPoVXkL+m+U=;
        b=Z+E4sqzkxDc/TEv8nVPfnyj7QT3mJo3m7qasv/+/wYa/989Pnee8LoV7DXEwN2MsTH
         Buik5j2DfqCa/mI7NqrttCs48XqxfpyG/Mf4yE0bA7NwfM8Hv4uIbet/5e6LsxnYfPzx
         XRiggzgaL0Fc1nl9BXHu7oNSKYpB0FbP7AkCPpLb9DrAkpi0PhXyvy1gp9yUj9Z/QVxA
         7cG+XkRi1hFbiTa0C7FxqzfoZMYRKQjfVQwXIe/1RSPjEXCH4CM3O+vRzHWwlLO+kw7I
         8e0x8z1/rx6amL3kqwGL4AEN7SchSG6nQdpVxbeltGPQZqVOLuh8x17qTf1td0jpALLJ
         1WGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759292903; x=1759897703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ae0TsP+gQ/KcLcJFB5vABbFUYAv2LpdlsPoVXkL+m+U=;
        b=wUBB28fPIJgSxxAZ4g1ClpewVzvkOrSRa40O1X2CPEeGE4jInzgqa6mNfhxSzeb2GG
         GXhJuCRJOOlGXrb7gsaV1rnTLMEsC20bNbw4x8aYG+CDFDG29rwhCmKyQTaqVVajEe4i
         S4GGsKR3UBxgNBVOqurF17WLEZ3GrO5h1U/AIEwlXhvQeHmsXI73lrYzjbc9OPkhKnSW
         /IW3ID9Q6TheCRMnwBtfuwi62LvSBbSEEbSv6L/PvLvFWNEeWtI6JlgZPnUtviM9/c2C
         pD87oxVvemb8++Kqm3mMOy5437XJCBw0OOVIw6uzF4/3Fb3X/CWMnWik0zNbD8451LBO
         oo9g==
X-Gm-Message-State: AOJu0YxpX0d8Gs+OIY94tEk2XpnP/lo9QztToEtF6B7dnJGdC7AIlxIg
	/BaJNvPqd66nq1Ak7bwwfRIPiyG5h3hULyHBPWvA3MvKON+JUwiocrh098ghuw==
X-Gm-Gg: ASbGncueLZO0P8/Fef+viFttaMAUKlAk/y0veDCH/SyeSW84HT/PMuYxxYBegJ9iJJJ
	KWaTPxd+6U1+VeBbN4JFiB40jR4in2BCWxpsnEf86O/kZydMhSA6MQPs4546ItLo29uGGnOBkOU
	GM/IcB3Ve0EgVYpNdhaBKslqVvJEaCyH0BnsnJBXdkEQPWLpYeialiEosbnNBj41A1yqWf1t985
	pR45lemqEip1EZWLLfcs0fWzCnK7u0LxeR+YlpVOylUF1MlJquQZQsZVyyTeJhY31uW5QL2o/QH
	ZuHf5apgwkwqFZzTj3moKUO52dfIHZqfiQv6k052psVPm1PdIzAxJctqm6f3NSXxQR+bfpO/vI5
	9e3mROfw0XiqiTLzlB4U4E90StWnrPjIfkV5zvBbIqaCnhyPO2ZYFU0NS9PfXRBVnRmZW+nvkL2
	bYASiSnulBgRosLo6EtABM9TmL/BVaysyhpNMVGdqDuOa2l/KBQ6EZ
X-Google-Smtp-Source: AGHT+IE7jBsyk/otZ9VcrsD85kCSev56zo7xw8Jz9OEJN27V3sPY8LaEwn4koSK0umg+GIMT2sCfDg==
X-Received: by 2002:a17:903:2384:b0:264:befb:829c with SMTP id d9443c01a7336-28e7f2a11eamr24986025ad.9.1759292903388;
        Tue, 30 Sep 2025 21:28:23 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6aca043sm172434385ad.138.2025.09.30.21.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 21:28:22 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: kernel-tls-handshake@lists.linux.dev
Cc: hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 0/8] Support KeyUpdate
Date: Wed,  1 Oct 2025 14:27:26 +1000
Message-ID: <20251001042734.17307-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

The TLS 1.3 specification allows the TLS client or server to send a
KeyUpdate. This is generally used when the sequence is about to
overflow or after a certain amount of bytes have been encrypted.

Work is on going to add KeyUpdate support to Linux:
https://lkml.org/lkml/2025/9/5/137

This series updates ktls-utils to handle the KeyUpdate request and
update the keys.

As part of supporting KeyUpdate ktls-utils will need to save the
connection state in the kernel keyring during the initial handshake.
The kernel then provides the key serial back to userspace when handling a
KeyUpdate. ktls-utils can use this to restore the gnutls session (using
the patches mentioned below) and then update the keys.

This requires the following gnutls patches that aren't yet upstream:
 - https://gitlab.com/gnutls/gnutls/-/merge_requests/2021
 - https://gitlab.com/gnutls/gnutls/-/merge_requests/1968

and kernel support, which is added by: https://lkml.org/lkml/2025/9/5/137

Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3

Alistair Francis (8):
  tlshd/ktls: Don't abort on EEXIST TLS_ULP errors
  tlshd/ktls: Allow specifying the sock direction to set
  tlshd/server: Expose tlshd_server_psk_cb
  tlshd/keyring: Allow session save/restore to kernel keyring
  tlshd/ktls: Allow restoring the TLS session from the kernel
  tlshd/handshake: Copy in msg control code
  tlshd/netlink: Support the new kernel KeyUpdate support
  tlshd/handshake: Support KeyUpdate

 src/tlshd/handshake.c | 214 ++++++++++++++++++++++++++-
 src/tlshd/keyring.c   |  74 ++++++++++
 src/tlshd/ktls.c      | 332 ++++++++++++++++++++++++++++++++++++++++--
 src/tlshd/netlink.c   |  13 ++
 src/tlshd/netlink.h   |  14 ++
 src/tlshd/server.c    |   2 +-
 src/tlshd/tlshd.h     |  17 ++-
 7 files changed, 652 insertions(+), 14 deletions(-)

-- 
2.51.0


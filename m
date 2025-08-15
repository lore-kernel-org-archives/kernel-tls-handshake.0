Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83421E502
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 15 Aug 2025 05:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755234142; cv=none; b=o+O95Mi67JZWO/kP4WHm421fKBIcaHVGRs2v7Tt1Q10V6mgHlmO5ZgcULnhdyfilEURDqP7BiGl9AvoN9aBAlFO513UdWzemJu7qaYgubVSvMiOGVA8WOaVvMrgmINenmjrfG6wZa8ENwik1dSN23oRY1MIl3Ipn9cUSr8ebcUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755234142; c=relaxed/simple;
	bh=4aoISFqoZW3xIWfmCOYas+QHZ7GQjQ+ceAIQLkxwDZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CV+VcVIzgC/XVPEEvy3Ji+dMOB/FqUT278YRQOtgy3I6XDJw2ydKMX8R6+QHR7AIiPkn5/xvCS3XlF66TcReJZP4e2emjnD1ONYrAeUfPRt/TSKRsW6ytjHgVwFWv9o2BVARdI77Uuslf5Lr06kxBzCX+qMtHwPYg0ZAF7/egQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hw3/WDmD; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hw3/WDmD"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b47173a7e52so1051528a12.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 14 Aug 2025 22:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755234140; x=1755838940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HvJ9vjlQgWj0JGVdSmCK4V4OH1FNmLUxKe8JArbwI44=;
        b=Hw3/WDmD4NmSvAFrYv5mDRIhK5MmGPf1pIl7SDfvt9tGnUB9LRa2cohH6dzNTwlxnV
         znarO1zxH0MgPZJ7ze772lxCV1pGWvm8OvoHNBzWZdCL2R1y6hz6zgKrgWx5xS6r4quH
         XL3I8agNbBkD91//iWMiicfaHkpBc4y9otTmNA0zLlSSbB1dvTFTX0IorF+8aQQP5jN/
         LKs2QEu+ry35RVFJyvYDlfGSev1qPxnBvKgisHJ+foUonhaDtO+6kWIxDAcaiUwPbSED
         L8ApvNSxPcG4DSKgV+MLXwSclke0NNE67gtmGg8S0gDyCv1upYl4wfPDjDJSWPanxaYo
         rCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755234140; x=1755838940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvJ9vjlQgWj0JGVdSmCK4V4OH1FNmLUxKe8JArbwI44=;
        b=qhIxa3meiEk1aH2yYTfUM306dB1hZzoHAaQVcM8rRaCzuyZjzvCdV4LIh6W5ITyHEP
         zOzIOmdi6LosEhN84KIyu5VXSMgsUyXsS+0LZ7MEbdp6gf8/5wz8Fq3r8pW6NTWVK9D7
         VAZA7D8sfZ83lqw673M33dfTABeJFRbF2uFrmLctmIWpGVrkiq778/lKnZmLis1hRYzx
         TciGm8G6A/dnxWce3iIQHm/o4R+ccEDtCaDpt8E8gWq1A4ka1OSU4MOlPwQx2ugXdrTM
         lPTYUS+H3xcaYLqEAF168u++Y/2/t/X34EYYGNQU2/QOrIFV0LkhTdYOxns7EEUQPGsN
         kOtQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0biaOGQ2lGGfOieMCPbkJxh1RlTTcKLqaPo/qghI+iDeyl2ag4Exk8KJ1xTcGfSrfjUZu5WT/W3Qo2pVtvQVBjfvsaw==@lists.linux.dev
X-Gm-Message-State: AOJu0YypR6DToQFqMfeeYEqlsgiG2zSU0IqhVQnW/ZrkuM0AlU6nEmjO
	0SlNsHvJFx4JK1VT1wIbkptLIgakbfUU8R9ScagXj9aGa7VOOTprRFRG
X-Gm-Gg: ASbGnctSp/A+mRUYDn9tdXL4jV6RsniDm0rzhjDMN+vFkEwOwxRj1UGGsaT5ECoMpWy
	xUkR2B8ZNVfoSsHJa6PY1ivqY8JkJJXeA0sCt60L5mrvh5cFKumRK+aDmAQINd9+c3wM/RPwWIr
	rsHo5Ur7+xoewhhFTV4wyRQFTRiM3ZHeeH0H3mEydR1FjrDFXUYH0Zy55V4H/8kGqPKD018JTx/
	+zzNXIAPSxXhd/M8Q9RIN+USS51CTDNXtplOuV0BXRbz3wU1elJ0WldDIziJevGB/IsSkZE9H4j
	VSKXk39KNk4yUTmjhsS8zsL4a+cn2GdXuGRp5tWqCE/xMh02UG9wECeaaf8sslYlh7/tg8Z/Q8T
	wx00ZQ9aX7RBCxR68ZlbV4bh2rRghjhHQ6QPB96FnBxEqjzPJBr/hbX6RVKfJChSeDuA0uBEp7V
	4NGOxlJbOJwwE1RPsv5T3tnw46zpErXBMb3Qnhqw==
X-Google-Smtp-Source: AGHT+IFc/j6gSSFssjIPr1g+lc0GaAJwz273eKQ4JRPcXd+8ZTYMotiRajoz1cIteit3jJWFjwumvg==
X-Received: by 2002:a17:903:41c3:b0:242:e0f1:f4bf with SMTP id d9443c01a7336-2446d720275mr11691175ad.18.1755234139897;
        Thu, 14 Aug 2025 22:02:19 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53c6e1sm5128645ad.115.2025.08.14.22.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:02:19 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: chuck.lever@oracle.com,
	hare@kernel.org,
	kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-nfs@vger.kernel.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 0/8] nvme-tcp: Support receiving KeyUpdate requests
Date: Fri, 15 Aug 2025 15:02:02 +1000
Message-ID: <20250815050210.1518439-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.50.1
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

The TLS spec doesn't mandate the conditions though, so a KeyUpdate
can be sent by the TLS client or server at any time. This includes
when running NVMe-OF over a TLS 1.3 connection.

As such Linux should be able to handle a KeyUpdate event, as the
other NVMe side could initiate a KeyUpdate.

Upcoming WD NVMe-TCP hardware controllers implement TLS support
and send KeyUpdate requests.

This series builds on top of the existing TLS EKEYEXPIRED work,
which already detects a KeyUpdate request. We can now pass that
information up to the NVMe layer (target and host) and then pass
it up to userspace.

Userspace (ktls-utils) will need to save the connection state
in the keyring during the initial handshake. The kernel then
provides the key serial back to userspace when handling a
KeyUpdate. Userspace can use this to restore the connection
information and then update the keys, this final process
is similar to the initial handshake.

Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3

Alistair Francis (8):
  net/handshake: Store the key serial number on completion
  net/handshake: Make handshake_req_cancel public
  net/handshake: Expose handshake_sk_destruct_req publically
  tls: Allow callers to clear errors
  net/handshake: Support KeyUpdate message types
  nvme-tcp: Support KeyUpdate
  net/handshake: Support decoding the HandshakeType
  nvmet-tcp: Support KeyUpdate

 Documentation/netlink/specs/handshake.yaml | 19 +++++-
 Documentation/networking/tls-handshake.rst |  4 +-
 drivers/nvme/host/tcp.c                    | 78 ++++++++++++++++++++--
 drivers/nvme/target/tcp.c                  | 71 ++++++++++++++++++--
 include/net/handshake.h                    | 18 ++++-
 include/net/tls.h                          |  6 ++
 include/net/tls_prot.h                     | 17 +++++
 include/uapi/linux/handshake.h             | 14 ++++
 net/handshake/alert.c                      | 26 ++++++++
 net/handshake/genl.c                       |  5 +-
 net/handshake/handshake-test.c             |  1 +
 net/handshake/handshake.h                  |  1 -
 net/handshake/request.c                    | 17 +++++
 net/handshake/tlshd.c                      | 46 +++++++++++--
 net/sunrpc/svcsock.c                       |  3 +-
 net/sunrpc/xprtsock.c                      |  3 +-
 16 files changed, 300 insertions(+), 29 deletions(-)

-- 
2.50.1


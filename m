Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE57C19006B
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  5 Sep 2025 02:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757040443; cv=none; b=Dyi35njEDut7L5XWk/PBrUjBO/n81EiT2xBN6r2EamV+zWF0N9PKzdX8PAdymgwXuQMnwm7l2kZNBD1c+rp8Oh6DKwXggLynX26Ew0/EIiUs4+kC9WBrpm4KAdTa18ZHN95ioK1LIzA6bpOh/qolTvmI3o99n/dSkphRln568Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757040443; c=relaxed/simple;
	bh=557DYTo6ddtSvf+PUcpc9kZvkLXkNp+jXeHWroetNSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rUOlFLMTeZYhW0StJK5W8pAjNHEP7Zon9MI+QCimZeAV+ZJ29Zayi9a9UyMb2DpjKsv64Li5bgrnTrGXCYKuLOw69zzDNrDmREBDS5SH/nNvH2NdldastVFb52tIFOnrn1+/FrYC7YRtIjcLKXukGSf1XxlqTd+gkA+Z46xpJ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAs+PrHi; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAs+PrHi"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so1483916b3a.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 04 Sep 2025 19:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757040441; x=1757645241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gM3TMQ0WbfGUuMmelR/0TgQBGHBy9kRHA2KtDMurmyY=;
        b=GAs+PrHiothLmgohdfIvbgwNYaQdvADgxhmtSCrbXG9+xg/JWa/MQA0LkqJC2R2C7z
         E6+bqCxfQBP//bjR8Qly+KUYLM/vDx1D8d/V35TZ10smt3Ckkn0X0BxGj/J0NFG7hoRy
         DPG/6/Jsk2gPBYNZq02jHbie2LHyK1E1TiBzlLTspzZ+M4yppVwGJrRdXKjlfKxkCMS/
         8FNo0bmgKn8ti+Ssi2typoesv36zsYu5UPYAivbax0hUnLFk/HztIWalzyt9EDFE0IPH
         IWznveqEQxTFRV59g8HlOoFT+pdRHaJjUAFfOcdq1e+FZIVW3WRienRZenOAqEkxHZAi
         WI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757040441; x=1757645241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gM3TMQ0WbfGUuMmelR/0TgQBGHBy9kRHA2KtDMurmyY=;
        b=YnKsOTvER7cAhqGGjm1NLVp/K2U8v2gKHIfpPBWjEJtQYEdDEkGluOzLXxgrshYiQS
         ZJDwzF292a8yrisjHKocLB+XvAFUp4lA5P4oROT2ZlSdchtOiRSDgU+rQlcIDQyBm5Pz
         PwGJu+V4c6aABcIVMSvFB4Rftxvn3EisatO0w2ZAbxAhqOSv4M7UaJlNhg/81Qg9aj9B
         w3s1trgZWSTI37MdSEsi9t0nHCAA3XCKVlKHdO6aii+jOxbl1qUrNmXw1Za9ZhrHmpmw
         bJMY9+WkykR1+Q8PHvlmVQd5jNB5HgIgELhg9oKo4VeYUnl4nbC08CWsQtG8eJsYGX7M
         eL1A==
X-Forwarded-Encrypted: i=1; AJvYcCWJG+FPudz6ZJKn1IX33+DE9iD2r77L1sN5tRsfOVM7myRZhafElMAAh9DDjgkznl+ZJU9U+MHmE/TAPbdhHlWOH6P0mg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2y5UtkEcvvS9Uq/u7M4aduG2DlP/KHqdpAN+A+2KkXWbqcH0V
	vj8crgxJ915uE84w1qw3JVX6Kwaioe8NdMEcQIxaDHf7yfAdgn11UMDd
X-Gm-Gg: ASbGncsAnl13Zu/eGc3YDo+6IUjT8e+vp+XjN5TDugDWFTloBio2Wvx7iVWZXPFTpu5
	iol28YgXAZF6q0ikIokGPmsDMe1rZn57zEM//PSWXn/nO5LRpFpaxudKZLamxOQ3hSOKXi1BlwC
	e9jpcI5cwRuezNR3w4rJ/TJuhUYs42RArqzcCGaSlf4LXfTbbszW4Oxyfbptg2Id3JSfJehvTgY
	4hekvKggel5Q1VDxjl7z+y+HWOyLoTqr/IdIfzEWJHwes90aFAHtpAgV3HdiY4p3rwHmn9ts0Cv
	M5NJLe10KQKzbyzmnr/Ezf8MOrCKwMmI1L99u8VNvuwjcR8ohAZug+cqKiz8m4HWdqxrcLbxVR7
	UN5KUyKfpiuOe9UscwZzEa3Tkig8LZ9bT8kiiu9TtWWE0RtlZtQ6bPSV1zzkwRN1xtHxHiGvjRf
	QOAbNMgGR+/GFtzvpyamReL6sHAm69MWkQ/Jmezf/S5g6gtulY
X-Google-Smtp-Source: AGHT+IFnFUAgkSS6yBhBqxWiiAYRF6dBvxDDhPo+1WikDfiL7zeeqA/KVbZCbB5Nq6/UGRBPPZzeeA==
X-Received: by 2002:a05:6a21:329f:b0:248:4d59:93dd with SMTP id adf61e73a8af0-2484d59950emr12008405637.52.1757040441006;
        Thu, 04 Sep 2025 19:47:21 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772590e0519sm12991858b3a.84.2025.09.04.19.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:47:20 -0700 (PDT)
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
Subject: [PATCH v2 0/7] nvme-tcp: Support receiving KeyUpdate requests
Date: Fri,  5 Sep 2025 12:46:52 +1000
Message-ID: <20250905024659.811386-1-alistair.francis@wdc.com>
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

v2:
 - Change "key-serial" to "session-id"
 - Fix reported build failures
 - Drop tls_clear_err() function
 - Stop keep alive timer during KeyUpdate
 - Drop handshake message decoding in the NVMe layer

Alistair Francis (7):
  net/handshake: Store the key serial number on completion
  net/handshake: Make handshake_req_cancel public
  net/handshake: Expose handshake_sk_destruct_req publically
  nvmet: Expose nvmet_stop_keep_alive_timer publically
  net/handshake: Support KeyUpdate message types
  nvme-tcp: Support KeyUpdate
  nvmet-tcp: Support KeyUpdate

 Documentation/netlink/specs/handshake.yaml |  19 +++-
 Documentation/networking/tls-handshake.rst |   4 +-
 drivers/nvme/host/tcp.c                    |  88 +++++++++++++++--
 drivers/nvme/target/core.c                 |   1 +
 drivers/nvme/target/tcp.c                  | 104 +++++++++++++++++++--
 include/net/handshake.h                    |  17 +++-
 include/uapi/linux/handshake.h             |  14 +++
 net/handshake/genl.c                       |   5 +-
 net/handshake/handshake.h                  |   1 -
 net/handshake/request.c                    |  18 ++++
 net/handshake/tlshd.c                      |  46 +++++++--
 net/sunrpc/svcsock.c                       |   3 +-
 net/sunrpc/xprtsock.c                      |   3 +-
 13 files changed, 289 insertions(+), 34 deletions(-)

-- 
2.50.1


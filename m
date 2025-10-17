Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D101DFE0B
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Oct 2025 04:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760675014; cv=none; b=JcvyXFNsdVX7DfSVclnSdTcmiIZuymry139PZ8YFxi41xduoCALwak9u+5vbWvYoEvtj5CtQSZafHC4Rj+kyggIMOcxQX95WB+5B/Jr17Gt4eTUAqpOYY0Zqer4eNjoSaAGupJEM+niV00ENc9DYfS0nMpqJjWck9jDzjRVwIdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760675014; c=relaxed/simple;
	bh=xlTdYn3ctaCUjwm/bvJufu9sD/yMlLPgVKinrC/dKzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j9T6zXgwUbFGEN/lzHmiSq409Ll+7IMGvleSMsEk02i9aQDQsBlaiRkcBCG3hnUIZ7VdVq7c0y1Jp5b1UlaiPTxa+Z9R/PUheUAe7guFFRykequLdVtu7QBldcXnPueD53rIp+xMIV9NmHn0e5JpVKJuKW8YJTkIyNZQkzIA3II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=admjvrSK; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="admjvrSK"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-330469eb750so2053904a91.2
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Oct 2025 21:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760675012; x=1761279812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O1LD4bJtaXgmuHvhblZcw2cHe5FWG+R07TopH1OUOIo=;
        b=admjvrSKyUd9ikY5j2JbF2KP+fjkqFEAf3+z7ZHU7uOqM5RAkgh5y6YX0L76o9Ek2h
         LkcWXl+ZIwPuNHtPUeGy13HkZ/D11JH8kLqqSEMNqAIupDM8Yk7ITR8EWX4CiXULIulD
         h11gWII8XoIS7sawJqhAP2RrryOJf7cm7p/QHQ4+mpNkO5+IoH9YQZ22RZq5Ni0sDLuN
         8Aga9BjgEk7p1Y66XIeO/MViZhq9VHmzmP+YBA4MVHteNZaXNIyllccjdo0g2uZhuhEr
         RDLb1+8BN1SPaAA8htjLJqDuFnTyTgvIdUuFH1dCiaiRC9k8sMkeh7zDQkpx67TYWcFr
         65YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760675012; x=1761279812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1LD4bJtaXgmuHvhblZcw2cHe5FWG+R07TopH1OUOIo=;
        b=vY/HIgWYW1rTC4mmwCmX2l+3TW2LiSC/8VFtl8RS+GTpO3RAw46AS1SgroyM6Z9S/A
         s28c4SySq5fdnEeozGeX6i/+jAd/XtqZsNc8bA8uerf77dBYLNm+6D4L3MT73F9PzCnO
         RhawZLctXQ+1DaSLJiXyFIB7TjlrTBbw97ZYEIgFdUp1YlJ8MxApprcYFKkAQmcPVGN8
         8mf4U7LAHyy/3VWR9XtG661PTMDViJUPTP+ar/3+SOuVB2doGnNQoC74Ntv8hdnlO5md
         ia/y6X4lf1RZSNmitYfQE/uGuFFmq06lcI3FvAlvM41eg0qJzi6ha0Rp0ckXd2EyfBbi
         r11w==
X-Forwarded-Encrypted: i=1; AJvYcCVXW8vKHMv737AqfRkpgivSU1PdTj2oFKixVdPZnSj8hifCFxQB6zkPuptKYFtse7tSG/exxBrjG8vDdyEXnJ/QSiMwZA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6791odOEXKLa5XoKqYDqnyitps5eDJ82Zu0IbGxjazIObAZm4
	7v3Frib8Q0yAg3/WBMqVUNGNv4jvaOwWTUo9J5X4ehUgkrpaYMumKryy
X-Gm-Gg: ASbGncsWZ7Z7V2xbQifmZ7YbzPMSzScF71bYbfrnH/L3e7PBz43MQnRxVVgdBq5YV0d
	XPvQYrtj95K5Y3i2OxmbZeZ/P3eqUYaCrI2a6Ce0Y9/8egh41skdEGPhD6N/X9I2nsJejjk/BjP
	wPj9p+k0PxrGVrtEdM3ZQNF0Wj5R36dPBEXuylO3RoLNuM+upaoECqCz8AWf/VMEofCsEMTTjpd
	RVw+iDUcWio0fb9Xcz+yfcsDDNxQsuO2sRzNrtijh0RkJH4QH4NigehKrcgky90gnbzoueeaXDX
	lfaSMjEqRqK7/LfXq9P6Ollpzf7gZv9+WC6lskL8kZijF1GgamGhZSj2BO5CTJshVaaF3g7D/Ut
	JxK0Vq3pKol3nBkUrWuZiULXlsxfkCZbjyxAUqeN8yFazwEcmx5ZGsGm/4ZZ5qHYCNyfP8STlhU
	iXPPeqBD9/WTObDKeNj6qYEgaQPhsW0KSxWnJ843MP9evVzT4GljeM1B06+0msuC12WuJclk++l
	vtC4uNoyA==
X-Google-Smtp-Source: AGHT+IHf/fkMawdLEFWrxmlDZmQ5xGwA8hncSDzmuHZwevx77yhLGUBDFp3M4+pUOvAJ23AfWMIQvg==
X-Received: by 2002:a17:90b:4f:b0:335:28ee:eeaf with SMTP id 98e67ed59e1d1-33bcf8faabcmr2469604a91.29.1760675011886;
        Thu, 16 Oct 2025 21:23:31 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33be54cad3esm245557a91.12.2025.10.16.21.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 21:23:31 -0700 (PDT)
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
	hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 0/7] nvme-tcp: Support receiving KeyUpdate requests
Date: Fri, 17 Oct 2025 14:23:05 +1000
Message-ID: <20251017042312.1271322-1-alistair.francis@wdc.com>
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

This series depends on the recvmsg() kernel patch:
https://lore.kernel.org/linux-nvme/2cbe1350-0bf5-4487-be33-1d317cb73acf@suse.de/T/#mf56283228ae6c93e37dfbf1c0f6263910217cd80

ktls-utils (tlshd) userspace patches are available at:
https://lore.kernel.org/kernel-tls-handshake/CAKmqyKNpFhPtM8HAkgRMKQA8_N7AgoeqaSTe2=0spPnb+Oz2ng@mail.gmail.com/T/#mb277f5c998282666d0f41cc02f4abf516fcc4e9c

Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3

Based-on: 2cbe1350-0bf5-4487-be33-1d317cb73acf@suse.de

v4:
 - Don't stop the keep-alive timer
 - Remove any support for sending a KeyUpdate
 - Add tls_client_keyupdate_psk()' and 'tls_server_keyupdate_psk()'
 - Code cleanups
 - Change order of patches
v3:
 - Rebase on the recvmsg() workflow patch
 - Add debugfs support for the host
 - Don't cancel an ongoing request
 - Ensure a request is destructed on completion
v2:
 - Change "key-serial" to "session-id"
 - Fix reported build failures
 - Drop tls_clear_err() function
 - Stop keep alive timer during KeyUpdate
 - Drop handshake message decoding in the NVMe layer

Alistair Francis (7):
  net/handshake: Store the key serial number on completion
  net/handshake: Define handshake_sk_destruct_req
  net/handshake: Ensure the request is destructed on completion
  net/handshake: Support KeyUpdate message types
  nvme-tcp: Support KeyUpdate
  nvme-tcp: Allow userspace to trigger a KeyUpdate with debugfs
  nvmet-tcp: Support KeyUpdate

 Documentation/netlink/specs/handshake.yaml |  20 +-
 Documentation/networking/tls-handshake.rst |   2 +
 drivers/nvme/host/tcp.c                    | 150 ++++++++++++--
 drivers/nvme/target/tcp.c                  | 216 ++++++++++++++-------
 include/net/handshake.h                    |  12 +-
 include/uapi/linux/handshake.h             |  14 ++
 net/handshake/genl.c                       |   5 +-
 net/handshake/request.c                    |  18 ++
 net/handshake/tlshd.c                      |  96 ++++++++-
 net/sunrpc/svcsock.c                       |   4 +-
 net/sunrpc/xprtsock.c                      |   4 +-
 11 files changed, 455 insertions(+), 86 deletions(-)

-- 
2.51.0


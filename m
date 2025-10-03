Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818781922F5
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  3 Oct 2025 04:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759465929; cv=none; b=bOPC2zD7JJb/tcaIVsltuuL1sMgfnSO6rnij1H2Tq2j1nfT1fB8goY7YDoxMGxx9R8wP8T0ZDMzZ0BjItE2UkCM/kGUe+YViYKokpKOAa3cPDGjsiehU9WQ1YrXck78KHxC+fNUfgE4N7lIwaKLxbdTHLjKMQ8mkVvbu14tLbmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759465929; c=relaxed/simple;
	bh=30M2SYEXKiw8WZzmkL6ySmGYOxUGhfy4zZB7sDxdVWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m3cLwCl4GSsE4evAzmw/ds2+Oh10V2gpBiY1JzPIc0hxGkRYx/KCmFVgXEt/Opjr9mdIpwBukOzJuI0aws4c01aCf9I8WS255BG+7UFWlBjsJLG77B+YCMO6m7jS0EySgVLug0IOwyB+5nnRXBGvIoOGRBwLER9av13ed/U9n0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CF1SDmk7; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CF1SDmk7"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-32ee4817c43so1403289a91.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 02 Oct 2025 21:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759465926; x=1760070726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6iRWbJphARTg9SH+UGYwTi095jj0E6vFAKoyN/er2gY=;
        b=CF1SDmk7jCoGoGK8bw+9eM/L9IovgctVa7f1hNTJqFpSt6imTUNzDZA0eINr8+pNtx
         cnlRR1JG1FgGdy4Yqxvx3x2FaUHCRq4F8kia+57tD6NPQgS9YYUFzKAe9FrSwP9hjCYz
         Mpd6oQ+/B4sy/C2S1D2kMAOq3d9X6BcqZsM3TZXx18o/YrVplIshGcA2lQ7cPJJ9j3eE
         fozOWkTf3WCqolt/tvTuaZnq0O0F34bxb9SBwLJe4hNj37rcU21ZIiAiy3XuizrGjUMd
         mdDrUZOgyXEu6lu1u8/zhgVf0/N/jb03ttC+x2XBQLLMxHnuejT/tkRnxYRyBsllvYSm
         ucvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759465926; x=1760070726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6iRWbJphARTg9SH+UGYwTi095jj0E6vFAKoyN/er2gY=;
        b=Q+WgUhuYRihspKGh7b+fE9vm5vilK3w/3AT5SoI8Km2QXFkm2wcGc4SzkqI79QP2v8
         BarnS8fJPd5yhdrIINXRKZ50uE0lnXOSXcL9hpWnjemhoxBc5CCMIisCc48gINz+wgbD
         LeyBQLFGJVTcB5oSL6xopq8T2rsg8ijV7e9LW6Rv+Nqu8mAomxsZmYNWS9/jEIGFHyTt
         l7TMZuSGWDCmJKNBAXMm1hCMx8MIzhkP3s1GmiwbioGjpzdtz22TBD7CSgz6WNaHz2CM
         3RUH2l8zIoUyc1Pe0fgO9dNS/zJfEykz3zMx6Jy5je6U7KHNKyTYopFcUF5ij0asVPk7
         yTRA==
X-Forwarded-Encrypted: i=1; AJvYcCWzwuh9wMunFgntpn2OGXtJ31BamyNkHOQbNPdSe4pP8YGAU2n7DEoumzhyJ3vu6iOLYSBQi7nuwWcPaS322IlvOSxR6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUtv6jVWhUX5IxVpGZ6TRTsQc1THInitMl+GmYgXbePjr9cWeu
	DunMMMfM450Z0jfjzw1Kf16ts7kI6aNv+TerRaTUlj9yrCZj4ernke5P
X-Gm-Gg: ASbGnctotf2A+z5vNU3zE7hgD0ATOh8UoFSmeKbCAiLcL1cAX8C5sn/gTB6/pl+vTPs
	WGNlFtnTtJjLoijwmb47Tes1GVQnBi0xyBX2DR2JZmIVz6z502n0x96MAWaYWG7+0dIyocWPGa9
	mPra2R3CEch2UN5RTei/HUt2ls8jmsn+V5AuKCsox4KbTMrSsTg3FNzvWm7Phv5fuY0BlGkUIa5
	9zi4UVnjbyWH5QlqLbm+GV7KjWHj2J74hEj4gkyK8RUg09kzpiBWnW8OLSXlJTWTUJ52Wrwuati
	CwDDxQVTf2imgVLWI9LcchD+muSSuLEH+3/o5DNe6QrnMiHROm0pLR3IVnLx5+C4mW6PyZwWCS+
	oc9nE58aqsPkmsPwdT/DgmBFvuwnZhDq9FRmtV552u8nAtuDgcoN13Q0NDjGLxINge+G1IxkwEZ
	EHDAzIW82yt/lHEKyJ6YBvmBLKsFDcz6qq+S5zAF2DXT8r7PaOjY4H
X-Google-Smtp-Source: AGHT+IHzxGQNHei00u1+ginjgv2orHJOxfjQE4QOoj8gcgp7Hp+3jzZDnna3Wuw+xDdTBAA6cpxSvw==
X-Received: by 2002:a17:90b:394d:b0:32d:fd14:600b with SMTP id 98e67ed59e1d1-339b5092b52mr7933152a91.7.1759465925666;
        Thu, 02 Oct 2025 21:32:05 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701c457sm6528233a91.23.2025.10.02.21.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 21:32:05 -0700 (PDT)
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
Subject: [PATCH v3 0/8] nvme-tcp: Support receiving KeyUpdate requests
Date: Fri,  3 Oct 2025 14:31:31 +1000
Message-ID: <20251003043140.1341958-1-alistair.francis@wdc.com>
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

Alistair Francis (8):
  net/handshake: Store the key serial number on completion
  net/handshake: Define handshake_sk_destruct_req
  net/handshake: Ensure the request is destructed on completion
  nvmet: Expose nvmet_stop_keep_alive_timer publically
  net/handshake: Support KeyUpdate message types
  nvme-tcp: Support KeyUpdate
  nvmet-tcp: Support KeyUpdate
  nvme-tcp: Allow userspace to trigger a KeyUpdate with debugfs

 Documentation/netlink/specs/handshake.yaml |  20 ++-
 Documentation/networking/tls-handshake.rst |   6 +-
 drivers/nvme/host/tcp.c                    | 147 +++++++++++++++++++--
 drivers/nvme/target/core.c                 |   1 +
 drivers/nvme/target/tcp.c                  | 104 +++++++++++++--
 include/net/handshake.h                    |  14 +-
 include/uapi/linux/handshake.h             |  14 ++
 net/handshake/genl.c                       |   5 +-
 net/handshake/request.c                    |  18 +++
 net/handshake/tlshd.c                      |  47 ++++++-
 net/sunrpc/svcsock.c                       |   4 +-
 net/sunrpc/xprtsock.c                      |   4 +-
 12 files changed, 349 insertions(+), 35 deletions(-)

-- 
2.51.0


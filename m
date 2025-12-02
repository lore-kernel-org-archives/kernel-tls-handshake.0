Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3032A191F91
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  2 Dec 2025 01:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764639307; cv=none; b=blhQdzoQqRQJDYFYIGMIYnzIXnV/XdqtO2NXeTbfFZrwegZGE7xjzWOdNy108goVmVzkn6qznqiBrdY5/8c6BqiuGBJNP+9biRfrSu96GxabDTRtOOLDtebMVQtAiFHpWrEwxINIMke5rOtnaHz7N/FeoXgewjfZkSf4BsybYt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764639307; c=relaxed/simple;
	bh=QFsXnu9MdkgXAqXQJzYkeKJGZVvnPkPJKQ+sI7t/4I8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kWYE16ffG8CNpPoEMba9Cc3Ws6RRRgDy62uyPgqw4jV+MtGDqjKhLjl0OuFsV5/QbXP+b/eEWF4kjMhstfboMvlPSp5q3M72Nam9D5LfRR2x0Ugr2+GYzxtFa1Qxp8HdEFGJd6QnKoGxYozO5p6DcGofO3IeWlfvlP61O67cEcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YR4bUiX8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YR4bUiX8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29844c68068so55027555ad.2
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 01 Dec 2025 17:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764639305; x=1765244105; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cOcMvyPGMcTIjq6QNdUg0HCwNMNqed1s4YiNfKDSxyU=;
        b=YR4bUiX8VYSRDRkGMuAWWEwZxj5Yam3zMQHnJUdoooh3w+hj5IrNPrSHC2qVr7XqBW
         gQpkcRULzrMP2yZ7d+BmuB+qc9t8YR0AmjOgMXj7SeeSq+/17WJ+KnPFVoRI6dZSiIEE
         mB9989QW5tNDIfMmHuX7rAMeP5VbkGyivX3Bp5uDroMrtSEcXdfKEQjWcQ4J2ykI6A/+
         FzlDtM9l0DdVBX94f1f2I0XQwA4TaGasIpujsEFp83V4N30L68AegkHPf3gAJ5gl8lAZ
         JQYfrlQolvNmOBBK3a+rcZF6qw2A+lBHWlaogx3Tknaue2/A5kYoV38yNYzqgV2dBrdO
         T5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764639305; x=1765244105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOcMvyPGMcTIjq6QNdUg0HCwNMNqed1s4YiNfKDSxyU=;
        b=ZmbAn7k8crgKWu80a0fPJl3X1F4dujTOvXVcvTZan5YwGM5FYB1s1voCQHblGPFI9x
         l59TSKKzMOlCbenLiFaUPvELVq6c26jgs0DawTWMe2NRfo2QXj6OqVEDHhOnQVpv7AJ7
         m3EJ80207H9HztrZXoDZubvWsiJrbs0WYJL9Ddl7Zxhyi6BWkTX7/pkSHQ5g2H6LtONW
         MOIk5zmwfXBMo8Oj93fwBdDDaGOl3te0p4kgYfUrOJRcJIzaWVuHbJ5AA8Om5Iei1QUM
         ecCai8isgODaD5He8tTsL1wBpejbEhQUEPyhgsGwDbYlzOms+bVAfvoeZoz1ypoPhMvu
         8hsw==
X-Forwarded-Encrypted: i=1; AJvYcCWyFxTRao3pleNmhUkPkdTIysiRChiKbsMaTg0tl3OCkMpqrU+5jPkRUDFh0R7N0sODTDf2Ddj3iPZpe7O3l7nBrAQXZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYEFzc3MlsS5ZsqhU1KIvv/rV9EDAk7vUp+3bKcBQ7njSnPb6n
	vhPvjQY1+kBfGmxcJIvrnwDJ4+FEar1a3ar/SK3kq0cMyhSXDTSlvyxB
X-Gm-Gg: ASbGncuELIVOP8Wy3VT2OcJX5hoXcIKchl2J9/XG6VBncLeiR+L4aJYj3QzLPzjwVOt
	+Dv+AKeBsWl1p7R3BgIGZ/GqYS6pjcms8CUacbVD5sX5UBwBq5QB1Usnovtr27xDqdPz9n4FHHc
	ovixdk9TtOtetm06sD8GcOHTjUgOVDyle1MPmmfyjRqK4uvcW3z0+tv/OjQQHQsBO7zC/DQhEVH
	4N1mQwiKZrrnB8q04WUA+3Wlly51Jw1znPCvqOX6J76St5uwR0cHMh2X0vlsJcgvNPX8hIyJSob
	Hh5Pn5kBZW0b/Af1yURrPTE3uq60/C5ueDwfFK1fQ3vyHr+b6TKDjakCg5TNN5Da0TgGupbUTSY
	27wEfCV7/zAq7qu/JrjIAgUDX8yCSLxnIzS6b/+dXTDhVDr9VKr9jsbo3EWTqCBr+reB40Q5bHm
	nuSjheawodWPP/BMAbryLcgC4gPV7x3UdZNTIjUdNGMJAotqYSGnL2VDfGy1ZLw39YKwFMa1BsS
	UrdO0c2Rf8YVLH4RsI=
X-Google-Smtp-Source: AGHT+IG2js8otbv+uQSAe0fNFhmo5Bp5ciBaRf9d70pDhultX+GW+649FyeVTJlTc0iOHCrbLvVJdQ==
X-Received: by 2002:a17:903:19c6:b0:271:479d:3de2 with SMTP id d9443c01a7336-29b6beac7fbmr426147885ad.13.1764639305257;
        Mon, 01 Dec 2025 17:35:05 -0800 (PST)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb54563sm132378575ad.89.2025.12.01.17.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 17:35:04 -0800 (PST)
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
Subject: [PATCH v6 0/5] nvme-tcp: Support receiving KeyUpdate requests
Date: Tue,  2 Dec 2025 11:34:24 +1000
Message-ID: <20251202013429.1199659-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.1
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

v6:
 - Don't free handshake request on completion (handshake_sk_destruct_req())
 - Add handshake_req_keyupdate() which reuses existing handshake request
   for a KeyUpdate
 - Other small improvements and tidyups
v5:
 - Cleanup code flow for nvme-tcp
 - When using recvmsg in the host code first check for MSG_CTRUNC
   in the msg_flags returned from recvmsg() and use that to determine
   if it's a control message
 - Drop clientkeyupdaterequest and serverkeyupdaterequest
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

Alistair Francis (5):
  net/handshake: Store the key serial number on completion
  net/handshake: Define handshake_req_keyupdate
  net/handshake: Support KeyUpdate message types
  nvme-tcp: Support KeyUpdate
  nvmet-tcp: Support KeyUpdate

 Documentation/netlink/specs/handshake.yaml |  20 +-
 Documentation/networking/tls-handshake.rst |   1 +
 drivers/nvme/host/tcp.c                    | 111 ++++++++---
 drivers/nvme/target/tcp.c                  | 213 ++++++++++++++-------
 include/net/handshake.h                    |  11 +-
 include/uapi/linux/handshake.h             |  12 ++
 net/handshake/genl.c                       |   5 +-
 net/handshake/handshake.h                  |   2 +
 net/handshake/request.c                    |  95 +++++++++
 net/handshake/tlshd.c                      |  97 +++++++++-
 net/sunrpc/svcsock.c                       |   4 +-
 net/sunrpc/xprtsock.c                      |   4 +-
 12 files changed, 480 insertions(+), 95 deletions(-)

-- 
2.51.1


Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8020E3101A0
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  4 Mar 2026 05:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772602588; cv=none; b=k99nD8dwPXzTZKFK/V86HJza5+qbEGpDLSWDt58rFKU9sTwA6aY+W9bpZWaJNRjdYxfLlDGyp9j/nKssHjOt2IEXz6COqE9qwOOT5iJQf//4WRCwoOZZPqP/+BwqukkOBoktG7AZtXejsJi1vroSEK2uJT8Zyaflm/Ir8DXx74k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772602588; c=relaxed/simple;
	bh=DdGnEi2MIzcNo3q2Zph5X3WR+wOdcO1pfRapVm1aFa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QvVjfXtuUUO1YCbPxXkgnsU2dCTgQ1hWR5matraeoiTJC9kGF3pEydCNC84ikhrUzwrqvbVRc3WJ4CnwzwarYLTxmwDNiDsNFl+4vfvtEZ1gbweORuCL6WFisbDvrWgO22GsOFlAqsii2yYKtnHmAgprOWvdAuUdXeNw1sHfzFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqLSc6PK; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqLSc6PK"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3598b95ad7dso2245580a91.2
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 03 Mar 2026 21:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772602587; x=1773207387; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tBaAO3EhPpnhGGnT8RJsqBThiWnEysWAZzlV8WTFAvE=;
        b=OqLSc6PKdauDpNpQMPDt0bxPENU6LVRQBWVRVT4E4uDT+VtmawWFl8bYlBzGWT/uCY
         NwanjNiVvPUqjMW5/9+jqm+ZswPUuQInjx4wcJCj6Q5YLJk+EkOFBYvfWKqPB18SJiGZ
         GZdRORpYsbbW2TxA/H93FzBfCkD4X/6w5C0FMsKdes1U/o+1sYeHbLu+CbJwpGCp2XsT
         A36vAYli6p1BmCY8qnMCqO1GAnv9Pz9sbHqn3K6alV/gAGiPieXZr960KFtuXEIE0XdQ
         3Hkfync6K5ThrCoYeD9uDw3qjtYz6GExuWqMAdYyNVkljUYcIoVwMnIB4ps7T65RtiIc
         c+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772602587; x=1773207387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBaAO3EhPpnhGGnT8RJsqBThiWnEysWAZzlV8WTFAvE=;
        b=fuzAOtRLdfKLmJNF5UhQrfKvxFrw05cw65wM3zHzQ+YtoF9DFxRxIBW/kyDr8R1z40
         bi8N5oKYPysv+YhdDc1bwdAzllpn63cMP0BfmDbITGwfoZZCljc4OpySxwSj3/Lj7Qoa
         tD/0tFLRufjufbSOHwNE9SQw4Mfl3SCDRKMkiWKXvMXlnsTEpNturIr4S81gdHKH0mhG
         zarr6h874HgH+/tlp1C0bKuT0qNtARV/rMO8F3YkejRjzdfffGJ39jVDKnMtJVrMLSba
         CksNGzPBTjJIJ2JS6nx1TIRXaZm0UTL9DDArWOpS+ZkbOaN4dYar6YnISQLpmlFVUCzs
         9GIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5gfaFmfZHXsYHuZezqWUy62KeH1N5Ij+Kl8Iy/JLaJAm+E/4H6Zzs1eUd8sKXq0JRawT1wwGJDZQmldOdHevamm6GhA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxH7/yjaR9cQCH4fw7mv7++QQUxaw22go0WfZ/FGkKzneC+j2sM
	ROV+do+Qm2r353L+S/5Pva8IPqgxz0KH3JRbNbmtiURvv2cd6pXAJ1PW
X-Gm-Gg: ATEYQzxDMl3CHhm2UMILDULCpKM+XFAXFjZvoUlmoRyWZFfwO9r+b/doo6xwq8f01MQ
	7/83NH4ae0DfXlWrAem0ts8uS9MqUVqk/Alh9NNmKxF3usfTAYUt3IxIYMk2/VdCW6BYsgbivm2
	ncCe1DulmZJ7rJKhdDXD4O2RxRuYLFV8bu2wJ/hTv4BDuIEzrsP8UDoIbwkCCkpWX2bm264uu83
	EY9Sd6/lEjVptCQ5j04QSWYBvYtj31SpONOunQRqSPxM9y8NqKh1vj65BoWdDTLdfTpdTgVqzYo
	k7Res1bALU2u9m48izeolV8gAzC53IA8F54JOdDmf0vuf/9aEx/OACYT6UYVYzVlGBnRIOo/UOX
	d24OE7i36bfnAspz8t+CsvmrskAFlvGghxKR32r3XDdyQ0uo8VI6YrTBUhuX0X5vSk6qRut1prm
	jt6xmdVf1+tNKD4ElfupSku069hpkG/t0OUAchW22hqA==
X-Received: by 2002:a17:90b:3952:b0:339:ec9c:b275 with SMTP id 98e67ed59e1d1-359a69aec32mr1042348a91.6.1772602586933;
        Tue, 03 Mar 2026 21:36:26 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c090bfdsm4020057a91.8.2026.03.03.21.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 21:36:26 -0800 (PST)
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
Subject: [PATCH v7 0/5] nvme-tcp: Support receiving KeyUpdate requests
Date: Wed,  4 Mar 2026 15:34:55 +1000
Message-ID: <20260304053500.590630-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.53.0
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

This series depends on the read_sock_cmsg() kernel patch:
https://lore.kernel.org/kernel-tls-handshake/20260217222033.1929211-1-cel@kernel.org

ktls-utils (tlshd) userspace patches are available at:
https://lore.kernel.org/kernel-tls-handshake/CAKmqyKNpFhPtM8HAkgRMKQA8_N7AgoeqaSTe2=0spPnb+Oz2ng@mail.gmail.com/T/#mb277f5c998282666d0f41cc02f4abf516fcc4e9c

Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3

Based-on: 20260217222033.1929211-1-cel@kernel.org

v7:
 - Don't use recvmsg() (see [1]) instead use read_sock_cmsg()
 - Remove reviews from patch 4, as it changed a bit to support read_sock_cmsg()
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

1: https://lists.infradead.org/pipermail/linux-nvme/2026-February/061252.html

Alistair Francis (5):
  net/handshake: Store the key serial number on completion
  net/handshake: Define handshake_req_keyupdate
  net/handshake: Support KeyUpdate message types
  nvme-tcp: Support KeyUpdate
  nvmet-tcp: Support KeyUpdate

 Documentation/netlink/specs/handshake.yaml |  20 +-
 Documentation/networking/tls-handshake.rst |   1 +
 drivers/nvme/host/tcp.c                    |  80 +++++++-
 drivers/nvme/target/tcp.c                  | 213 ++++++++++++++-------
 include/net/handshake.h                    |  11 +-
 include/uapi/linux/handshake.h             |  12 ++
 net/handshake/genl.c                       |   5 +-
 net/handshake/handshake.h                  |   2 +
 net/handshake/request.c                    |  97 ++++++++++
 net/handshake/tlshd.c                      |  97 +++++++++-
 net/sunrpc/svcsock.c                       |   4 +-
 net/sunrpc/xprtsock.c                      |   4 +-
 12 files changed, 467 insertions(+), 79 deletions(-)

-- 
2.53.0


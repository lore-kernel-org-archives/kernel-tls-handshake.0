Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569F82C1594
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 12 Nov 2025 04:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762921689; cv=none; b=o7B16Vn3BXmEzYnp6TN8H8jpfkboyw/HUUDu/Oe7ojvjJgLv7tM6g+AOjEa3u9cbs5tjWy0F9igd8/AJEj7cniItzVoYQTwcwaQ753J5F6WET5WUdz6rfwW6nNfYpyojI+DQO2zZjH6IdWPXeslMCjm4QUF3L2cTIUf28weOzPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762921689; c=relaxed/simple;
	bh=y29hhM9bDU990mFxxu/b+W/znqX6em5uaKBZyOrkMpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HMqeraE7WCiLQKY+8LOWtBMzrMt9I2frKV8UeJ1cyuOcyAFIcgGBP2VHFxbxJmBR2B5h3Fx1wJdzPPMOFZPcKr9hVAs88WJ+bV2NiQQz2v1ZJNRoYZzQAJ7xKmja+STg8AB8byE9yK4vPC7eYEecH8scvCpc0UtB1qMbeJQziqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbcrI64H; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbcrI64H"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-340ba29d518so289924a91.3
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 11 Nov 2025 20:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762921686; x=1763526486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HWcPwvpyGHeQ7Te8LbmgWrzKDF0qH1U1PIJiFE/G1QA=;
        b=XbcrI64HehBme/FaENuZgsKV9ZGJ1O/U31T8q4XrYC18WdBKF9LjdctB+/o/iRr08F
         NrEFIiUGrW8z/T85CxuVlmgjmLuvMBW4YyaiXJkmbdkenG78t2ZglaDsWlKx/WiGONQt
         2d5vsaBSpXmRXBzlxUQVSa+RZS+byxloc7rBiGVB0n8snZbUOci72qBJSiBX8EUFbrG7
         aDjJkgvjYl9YPX5VOASU2MtaD9xT/ftCyhKhwgIsjWopSQ1uzTkRNtjj1ZxyjAmYV8tE
         M2ThD7kNbW3stSI8ENs3qCGBnvUZG/lcGTtxzBCiJ/ITKXbrUpG13iIqL0cwTdNSfP/W
         sriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762921686; x=1763526486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWcPwvpyGHeQ7Te8LbmgWrzKDF0qH1U1PIJiFE/G1QA=;
        b=CUUj3h8QR7NgkqWNE00yfM2kCvPWBlpYmWEf3x3PNrJgoonAYD7zGHZXzXja4IoRB2
         d8c1Ir6ftK10Dw7KPYTBFwtMp4o1tk4Z/qnzbLu339yID2SEq9xaO7gfIMACS1BjYCMN
         vS5WKd2FT7KneQDs3B4Ikxn7NHq3T/sIqCLx0TWRKlZJBjyc0hBm32gAyeQq93cB0tym
         CbfwafMX08+Cvd8bmyt/IDsdifUuwJ8Sa+K2Qk6wrdZGOHwfzsordiVKPp1NhpQZ06pR
         /Df+zoFzqsSrgKRnNP2/E3X8kGxl9GyyvAEDJZWEdhVtC6OvKXl9krLI4PCMYQ54xRjR
         96kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVHbvmTKBXH6uHrfWYQ2mc9TG8QKQfkyG3y5Z/T5O20Z7bQJPUTPgF0Mbjsir3OkF/YFtYFWfJhvG8yRWCC65x3de0tw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyATvyWMIiPwkNjBkvKWmaXbGRT4cLEwWCxERtD/nYdx/+AGk+n
	8ShCa/S5QYgMkxm9wOZnUSEf9biLUKFHkVxrjhZHLSyR1B+4/k30pwLk
X-Gm-Gg: ASbGncvh12S/R7tlsPA9ZZDDUfx5iJEYB0D1Rl/DB9fePkJlSKyUriZa7sQbGW5h2P4
	N9ZHbZTHE9lrZlmgpgqtt9ox8PD2yRit++8veNy77xuo1WHCetBr10oHEBmS9OfjW8+simxhRV9
	jbyZy15MU47SSs7+1fL5g35+qDTs+ViFG1evstq//BZu98lxIS7W7wGVfVN+HISK3Yl8c7sZ1VK
	zfpxuvCSIaU73HDDESLMvELxgjX5I97dQO6b5L6Gamx5M0jdn31Jemf+EUFzU6WEM/eZBfEYoLg
	psJS5FKsh4378ltCJnS4ZJY7rUaFU1tAXuVQ6XWltvbPqvvSShSyrRzsaZTjUPX1CdqCzKzSiSq
	DeXgMTKqW/cOTkpNbZF3yLEtcWv/RmE2VgoKjggtpleic8gD/vuoo+U8MAglwf1OIT9neIx9MGZ
	PnXMx8eXh3MkSz77twp3D3nwsTHj/cJf5fKMBU4ETQ4JZBx6CnB/J1TquHzdVyx5nzCf754rx1s
	QmEI1Woqw==
X-Google-Smtp-Source: AGHT+IEW77FvieM+vtVkbmhzlz0RFLk71+mgtXTKXN86kZaDWUH4yy9113DxeoOKMAxSWBEyakVQSw==
X-Received: by 2002:a17:90b:590f:b0:341:194:5e7d with SMTP id 98e67ed59e1d1-343dde8b46emr1933248a91.24.1762921686366;
        Tue, 11 Nov 2025 20:28:06 -0800 (PST)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e06fbc0dsm854681a91.2.2025.11.11.20.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 20:28:05 -0800 (PST)
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
Subject: [PATCH v5 0/6] nvme-tcp: Support receiving KeyUpdate requests
Date: Wed, 12 Nov 2025 14:27:14 +1000
Message-ID: <20251112042720.3695972-1-alistair.francis@wdc.com>
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

Alistair Francis (6):
  net/handshake: Store the key serial number on completion
  net/handshake: Define handshake_sk_destruct_req
  net/handshake: Ensure the request is destructed on completion
  net/handshake: Support KeyUpdate message types
  nvme-tcp: Support KeyUpdate
  nvmet-tcp: Support KeyUpdate

 Documentation/netlink/specs/handshake.yaml |  20 +-
 Documentation/networking/tls-handshake.rst |   1 +
 drivers/nvme/host/tcp.c                    | 103 ++++++++--
 drivers/nvme/target/tcp.c                  | 216 ++++++++++++++-------
 include/net/handshake.h                    |  10 +-
 include/uapi/linux/handshake.h             |  12 ++
 net/handshake/genl.c                       |   5 +-
 net/handshake/request.c                    |  18 ++
 net/handshake/tlshd.c                      |  96 ++++++++-
 net/sunrpc/svcsock.c                       |   4 +-
 net/sunrpc/xprtsock.c                      |   4 +-
 11 files changed, 397 insertions(+), 92 deletions(-)

-- 
2.51.1


Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDB9A29
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 29 Jul 2025 02:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753756984; cv=none; b=ForKoJjEgYcj4gGEs3+EMr6++82ORsUgS0aMf0Xj08WZVSYlkIpBpu5i5UUMCBEU4umBR1lUqtLByhrHH43RNvJlHMa0OEjaADIVIrqPLOiQHxJ5d8czIlMCbrpfxarYamEMYyTGdNXAiULssez/iLgk75BjyqnFLd5uECec9xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753756984; c=relaxed/simple;
	bh=FUBW7btLaXRKRkjIgHELqFpqMhpUxePyi5+xQPOOMu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O2pwrzTnD2VnFppT2wLKQEgm/HtqZ0+9XdfhbrxYNC9sBquO9W9pTrP9pk7TpscFIM/16ZyJgAVpZt7LuW69rEtFJLh+2OXoFzDVeWdUYaEtvLHO3SeiZv1Tkxdeqe62x0T3kFnueVFNnfupw00mVkP5Hux+gjvbYFxep2tUgJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBsosXY9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBsosXY9"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23ffdea3575so14352335ad.2
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 28 Jul 2025 19:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753756981; x=1754361781; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ltNpeYsaYiriqRttnjOxFTsDxOzsiWp+Zzreeo3S004=;
        b=MBsosXY9g0bjojkxGPz4VPjfaz/fa/ezpvPEfynJN0bKjB3ZDaUoScBjoYw9CzInwm
         zSTRjONLCE92M37LS4IiqvJsPP8YySBCHMznZDM4HsUVvFCkl/Gm2zxcVpDdzW45cWHB
         knh9u0geHzCkmigIejB1S4/nIhmtQLZfGecejmJ83aDMh10ynXmSgsuyO8C3qE/zfcY9
         wfTp/2gNMMCm8JrUy2ZsS/zGIC+ofsKHJHY0E0TigqCFrgkBvrBzlONOVA/mQVU07hc7
         bTleXBZG60+1HPKOp5hfzHgKyk2VlnHDXTqmo9usRX2KyxnKLlxh+nxufCCe6fN9HY6P
         pxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753756981; x=1754361781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltNpeYsaYiriqRttnjOxFTsDxOzsiWp+Zzreeo3S004=;
        b=kI6q4botuWxCnXng/n8l+gcAqRRrLHNpDgaid0Ij5e2DwWkM34+kwgJ0j5Bd57UBk2
         yNIqOAGryhjypWs2zq73Mf9h0QZ13ujVCBYDPxEIkkxXtZFby5u87xGu80oI5nWjbnCs
         /jE+wMgcl/dfBhw1wS4LeyFv+905St7LSmms67h1IcTmGCfjUv6LRzK8GbxawLYh63lG
         0M8y4pIQPjPmUC5o4Fs/9krqK/94Al/yJiDhYqVRh380mH17OA1IjpgaJ++VxR7Faw1i
         INqGU/JmopQr0b7Z8d+zfHfKd2dGjVVsKI7jrR40dms6ERXYj7yUfHme3905oCtN36QD
         E7LA==
X-Forwarded-Encrypted: i=1; AJvYcCWT6GabPoNadY4dgMWCOMUeTdPPyxhaDC3StfcbWx4kaZ9nAxwlz8ChsWGG8K0+ai6k+i0GivBAJm/vgrrBX8HApDqRGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlNUzM73fTFmThMyofOyd+WHAZXpfuZpsuT4PwcaYmmOC5NfP5
	sDTT4Vw9grOWyx57ludshLBr0Opbus/rNHxahLPYrJTpwQ0RFLyv+Vwn
X-Gm-Gg: ASbGncu85Vv1ladcimTZIq3A0ssKhAaJnebBS/Q+r/fo5kq7AiOAmv27aqU2iV8UDSS
	GSMwFtMIRapIEiYlGcp88J9D1vf61spcyIFD+NxMhhfNtoKVYzkj7llufzsMjySKlKhZLgMwysb
	vbmxSRdzk32YXubqAlKm4Tkj/jCyY7wlcrD3XzyEm/zs10p84mwiGXzFwtfDjeHx5jC6IRoZfo/
	a8VTH+h/inkAkhXT3YJZ3IZGJ1gEpqAq7VF8aJzpUXGkRvaayuFTqHQ99yeJaO9WUSiS9/QDPwT
	6DVTZ2t7f5MykQVHmElTvLII7PXGl6WQvwcwylI+L7mkGfDk2xMq0HEHhRZfe215nTMsbwa67GT
	rYhUyrOIMMJkRZ0t62ht/zTkk4w==
X-Google-Smtp-Source: AGHT+IFokfUWEoK1BlXtNlneBLUYXrht2yshaZ90k+I2IvTHjwBEMdVrmYfxeQvJuKnXo6G4WVr5+w==
X-Received: by 2002:a17:903:234c:b0:234:d399:f948 with SMTP id d9443c01a7336-23fb3126f99mr175232585ad.33.1753756980621;
        Mon, 28 Jul 2025 19:43:00 -0700 (PDT)
Received: from fedora ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fecd9ed12sm51327855ad.8.2025.07.28.19.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 19:43:00 -0700 (PDT)
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: alistair.francis@wdc.com,
	dlemoal@kernel.org,
	chuck.lever@oracle.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	donald.hunter@gmail.com,
	corbet@lwn.net,
	kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	borisp@nvidia.com,
	john.fastabend@gmail.com,
	jlayton@kernel.org,
	neil@brown.name,
	okorniev@redhat.com,
	Dai.Ngo@oracle.com,
	tom@talpey.com,
	trondmy@kernel.org,
	anna@kernel.org,
	kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-nfs@vger.kernel.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [RFC 0/4] net/tls: add support for the record size limit extension
Date: Tue, 29 Jul 2025 12:41:47 +1000
Message-ID: <20250729024150.222513-2-wilfred.opensource@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

During a tls handshake, an endpoint may specify a maximum record size limit. As
specified by [1]. which allows peers to negotiate a maximum plaintext record
size during the TLS handshake. If a TLS endpoint receives a record larger
than its advertised limit, it must send a fatal "record_overflow" alert [1].
Currently, this limit is not visble to the kernel, particularly in the case
where userspace handles the handshake (tlshd/gnutls).

This series in conjunction with the respective userspace changes for tlshd [2]
and gnutls [3], adds support for the kernel the receive the negotiated record
size limit through the existing netlink communication layer, and use this
value to limit outgoing records to the size specified.

[1] https://www.rfc-editor.org/rfc/rfc8449
[2] https://github.com/oracle/ktls-utils/pull/112
[3] https://gitlab.com/gnutls/gnutls/-/merge_requests/1989

Wilfred Mallawa (4):
  net/handshake: get negotiated tls record size limit
  net/tls/tls_sw: use the record size limit specified
  nvme/host/tcp: set max record size in the tls context
  nvme/target/tcp: set max record size in the tls context

 Documentation/netlink/specs/handshake.yaml |  3 +++
 Documentation/networking/tls-handshake.rst |  8 +++++++-
 drivers/nvme/host/tcp.c                    | 18 +++++++++++++++++-
 drivers/nvme/target/tcp.c                  | 16 +++++++++++++++-
 include/net/handshake.h                    |  4 +++-
 include/net/tls.h                          |  1 +
 include/uapi/linux/handshake.h             |  1 +
 net/handshake/genl.c                       |  5 +++--
 net/handshake/tlshd.c                      | 15 +++++++++++++--
 net/sunrpc/svcsock.c                       |  4 +++-
 net/sunrpc/xprtsock.c                      |  4 +++-
 net/tls/tls_sw.c                           | 10 +++++++++-
 12 files changed, 78 insertions(+), 11 deletions(-)

-- 
2.50.1


Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D87A2727EB
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  8 Aug 2025 07:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754637960; cv=none; b=WMvX1pIjGWN0K3/xUWG5QtnEstNnu6LLZRZn31+8KrhDUz0/LMSk0Gmk9/irIMpoEeQsSemxcxGQIuq8HkPoSCWL87m3S+oGLQ1N5en0E7elopHQh6adXboEsaWqmMyq4qGiiRNh6ZR0nNWr9Gw0sBiShTHgJWYUAea8+CbCkvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754637960; c=relaxed/simple;
	bh=v99kbMIWKT1gSbp4MBDwhcbuLTRICTgVOKhRkrvL90o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PRrJ5apMBvVpH8dcxXJ1QzcBR+Y3mOT0Qp0B/8yoHFr3rZHYDQNQ01rrpmL3DPyUcaNBE1jEGuIcC2E896G3h99goC/GAMvu2V10yAWBC9ixvoktLrWCCl72sZNd7ba7SfaL3xtuwHi0Y/tNkwv2MS97L9uNc0fYt+BssWYZMS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMx2D6sE; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMx2D6sE"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-24009eeb2a7so16407305ad.0
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 08 Aug 2025 00:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754637959; x=1755242759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o+w3axXai/UtW73ThtGKJHbQUS3xBpWeg88zTzqK2pw=;
        b=WMx2D6sEh9qDAu247DDS2yWEsqcM///x95txdmXh4VoAUddTodDKbRqargCG69mJuv
         882CHz4GkoXQzeoWjyid5rX/yVQLX82oYVjrKCTo8bsXYge3688JjWmy2RuoJaQ0nl8X
         /UJznkYARqugH0VqrqEeyiLtARJS8ME6Ru57eCyE6hN+1f3YgccnrcCcOisqcYwh/xk2
         6PvmJqGFiFQgSEgKq/9ptNYsYD8q3Tic028ImgMMzRnwTHBUayJA3/mnOjEM9KdSIled
         CQ/f5ALInpBy/1xLUIGxcvZ5YGv8ptiUe43kLc61vfB19427Reltug9ESl/woHy924KY
         wVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754637959; x=1755242759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+w3axXai/UtW73ThtGKJHbQUS3xBpWeg88zTzqK2pw=;
        b=ZXMK8OL3u7MbL8VpUkgTvfHP1w5uc5RhvF2ivrF9HX9x/t6fS2aRHxEZA4g2d5Tyt6
         wxozfYhVSvxbup1LIQTeEFFSctCCJK5Q49opG1c0CXGppScgqSGeCWFHjMYYPuQW6DFS
         NtNNfHkhrRE5WwB/Y7FhUOTNp5hJ+6AeKaoEtgLgY+PRoEXRdJZzAvALc/zDIJbTMIac
         IDs/r3yeyx0SS+k47TP/VLDjB+XbF7ZfuzUw4NWlwJhnRaFqdB6L9z7UTASwPfJTKToj
         oc60WYqCqlw4ttYEQEDNmVkYqgYBZTFzBug2NerSmNyJrTTT2VRob91HTv6BVXytAJ66
         ynBw==
X-Forwarded-Encrypted: i=1; AJvYcCV7lgLxsxahvOqJMesE6NM227Gcs2YjuuU2J4VE0b1eKZUbTU0hPFb/SLZ3oTEzyxqU/uY4br5Sde7GK5iDWk8gpHPH+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIKoL/PqQrdsOxIBuEPddQpk6hPLpY6yIjTs/QD9dFAzBLcVaX
	xh0kgZhkirDW1hJZQUkIvADo5OQULOs3XW+num4rIvY492ITNkFSNlzC
X-Gm-Gg: ASbGncs9I2f12BxIsTHguVGzA+rRo2fyISFDmhSN6prt0GAPSUWJrQbB/XtpFnMBS9A
	3Hy6JGTaOVrvorpWGbUAeN+pGiABbVSu82//J/MagYErwo+DkW5eNeey03HfPDAwct70OJibez+
	xJLkt6kiiVjC1cwAsLl7wPrIFxzGMd4aoSF2cZ4ABIgXqB8V0mTbJY2fUbWl3xdPxOH0J1eFmpA
	cUcl7LJQz3bzvFwXYjlFVBdzEdH4vgQVzYiQu+CuRAn9sN9zDeSKCbeQkpGSWH9DJn4yNVcJVze
	usNcbfhZyUe7vMj5/W32RRf9onEYL2LEu1brCEbgmO5TukV0ROnm9XXZVcOBZSZ3AGL4KDuzBMX
	zna3c9zP+kHn+1qs8R4jTAwXrcg==
X-Google-Smtp-Source: AGHT+IH+BOHmBGxowe2FnNX3h7QUib3N48XSR4eZZ0MEEWyLgwxzWx6m1pzQKL5wnLBbHG4viJE9Cg==
X-Received: by 2002:a17:903:40c5:b0:240:49d1:6347 with SMTP id d9443c01a7336-242c221b477mr28279985ad.35.1754637958692;
        Fri, 08 Aug 2025 00:25:58 -0700 (PDT)
Received: from fedora ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm186893565ad.63.2025.08.08.00.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 00:25:58 -0700 (PDT)
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: chuck.lever@oracle.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	donald.hunter@gmail.com,
	borisp@nvidia.com,
	john.fastabend@gmail.com
Cc: alistair.francis@wdc.com,
	dlemoal@kernel.org,
	kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [RFC v2 0/1] net/tls: add support for limiting the max record size
Date: Fri,  8 Aug 2025 17:23:59 +1000
Message-ID: <20250808072358.254478-3-wilfred.opensource@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

During a handshake, an endpoint may specify a maximum record size limit.
Currently, the kernel defaults to TLS_MAX_PAYLOAD_SIZE (16KB) for the
maximum record size. Meaning that, outgoing records from the kernel
can exceed the negotiated size during a handshake. In such a case,
the TLS endpoint must send a fatal "record_overflow" alert [1], and
thus the record is discarded.

Upcoming Western Digital NVMe-TCP hardware controllers implement TLS
support. For these devices, supporting TLS record size negotiation is
necessary because the maximum TLS record size supported by the controller
is less than the default 16KB currently used by the kernel.

This patch adds support for retrieving the negotiated record size limit
during a handshake, and enforcing it at the TLS layer such that outgoing
records are no larger than the size negotiated. This patch depends on
the respective userspace support in tlshd [2] and GnuTLS [3]. GnuTLS
patches have been merged.

[1] https://www.rfc-editor.org/rfc/rfc8449
[2] https://github.com/oracle/ktls-utils/pull/112
[3] https://gitlab.com/gnutls/gnutls/-/merge_requests/2005

Wilfred Mallawa (1):
  net/tls: allow limiting maximum record size

 Documentation/netlink/specs/handshake.yaml |  3 +++
 include/net/tls.h                          |  2 ++
 include/uapi/linux/handshake.h             |  1 +
 net/handshake/genl.c                       |  5 ++--
 net/handshake/tlshd.c                      | 29 +++++++++++++++++++++-
 net/tls/tls_sw.c                           |  6 ++++-
 6 files changed, 42 insertions(+), 4 deletions(-)

-- 
2.50.1


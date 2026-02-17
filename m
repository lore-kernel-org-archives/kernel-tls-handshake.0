Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3324D139D
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 17 Feb 2026 22:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771366838; cv=none; b=E3EukBNovyPWLPvjQgzCf+WzRCrWR2DF+Eqgujn5OpT2xASTBo9CdAEvTIaeUH5o13fCjDTsMgUXxXgb1bEyFC4p5ne49ga8G5N+AIYn21aXfzJHIf/ULQ3ViTxXinh1C2YZOpqW3LDrXLpd1y27tToAMec6Wyk8J0pBJ51TLwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771366838; c=relaxed/simple;
	bh=0DJl1+IsJAuy6zoWNIF0oygw0l387j/MGaO7klcZMxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W75HSy7iBmVFmmpTBKx7pC0J/gOBrBamxZG8Dkua0qXsfkrRD/MA5T7E6D7jJAoeXvzhKXGP3oJhZflRPC4lAS5Vi5YTUmlqSsTezTrQUvopkG/zfZFWHzWi9Y0jnhPlQgPcnhS2qXGslIXyq56Yp1mJ1bDcjd4h7sy1zkSxzYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vGWP40ii; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vGWP40ii"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BA3C4CEF7;
	Tue, 17 Feb 2026 22:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771366837;
	bh=0DJl1+IsJAuy6zoWNIF0oygw0l387j/MGaO7klcZMxA=;
	h=From:To:Cc:Subject:Date:From;
	b=vGWP40iigpFJ/PqrHiFEuEHfT0Qb9AR4K6Uh1xra32wkAs4ccIG3ZxAZzmu+hHVKC
	 NRwIdEYhSG8acCa6h2rTtdGiMVPFfmDj2+aXQEKFHX4sYPH+FO7hITW71aSunYNQXu
	 wmIjnRnik7BX0c36RVIDXalUjlbflFvEvj1EHvI8DG9fdSJSwkJCZgRslrAuHnGSJt
	 8yAGgGTmodSHMEwmlWPQMk1VeQDsqhrm+tBwbnIC8EBN/grqybpDSb7QCcbQxg1bll
	 BDvFefFzYeDlgCvrEzvv+QKIAiaNtKy0snNU+ImJjK9jLkfW8ZZiobYhUaat0T0twd
	 PZf46Pdu1nvkA==
From: Chuck Lever <cel@kernel.org>
To: Hannes Reinecke <hare@suse.de>,
	Olga Kornievskaia <okorniev@redhat.com>
Cc: kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [RFC PATCH 0/4] ->read_sock with cmsg
Date: Tue, 17 Feb 2026 17:20:29 -0500
Message-ID: <20260217222033.1929211-1-cel@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuck Lever <chuck.lever@oracle.com>

I'm thinking of proposing this series to netdev to address our
concerns about how in-kernel TLS consumers have to compromise
between efficiency and handling Alerts properly. Posting this series
to a narrow audience for early review.

Based on 26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a

---

Chuck Lever (4):
  net: Introduce read_sock_cmsg proto_ops for control message delivery
  tls: Implement read_sock_cmsg for kTLS software path
  sunrpc: Use read_sock_cmsg for svcsock TCP receives
  sunrpc: Remove sock_recvmsg path from svcsock TCP receives

 include/linux/net.h  |   8 +
 net/sunrpc/svcsock.c | 389 ++++++++++++++++++++-----------------------
 net/tls/tls.h        |   3 +
 net/tls/tls_main.c   |   2 +
 net/tls/tls_sw.c     |  33 +++-
 5 files changed, 223 insertions(+), 212 deletions(-)

-- 
2.53.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9754246BAC
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Jun 2025 13:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561954; cv=none; b=jbjh9aIIpAIvL61X3Z7tBC+QDPHuJ/2uDfdfo2DxcW2KowAJGfC2/mwDCZalGor6VKDY2jtfj32D3b2XapUkBuJzHVNRIT/r20wyHyu15m8kDWt3wO9KtQUCcAcotJ7D8n8ctYGrytUIacB4PNTMV5OMMpwOb5j3qIbM/H8tn7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561954; c=relaxed/simple;
	bh=ME1bqChF5vCUBPtO4GXeN/VVTPypzU/OJVlvqsEYXis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qm9BwGic4Wbp0xY535L9Ik3975L7NlD3X/eQUK9hnD6YNkNG2+XG9T41c9UkBuoGQ2XIWTTieR5Qnc0QVBFyScG4TXKIf4hSjl5SuRiWSQBjHbLb6PXT5N2yFtnI1aMztu/j7fEDQAfQ6Q3xAN6JJKy1Zx4lw6MAKfz7TZBoXh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUyiQn/L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUyiQn/L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA27C4CEED;
	Tue, 10 Jun 2025 13:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749561953;
	bh=ME1bqChF5vCUBPtO4GXeN/VVTPypzU/OJVlvqsEYXis=;
	h=From:To:Cc:Subject:Date:From;
	b=TUyiQn/LiuPtcDWIrEfrBEnF6NRWJrAHzhkq1R/eJ1hysdz7fJIRo6AHPFMFWHZF5
	 Hi0Emjjrh5XoYNdE54TEqH7gOL6Sb1h4ptSpFbVgUl/LAnmlXDCSdUgaqD5tX1Lag6
	 MtEWoP08TJhD+5IGIau7zsC8eEZpZOoPPDZ/6XFgzkqkkDSDAxsfupMdRSSic4WA5u
	 +1J4enLMeKA24A/kg5KT3IKa02U59LQbQM1rLd4YxLA9fEu+PFx3lS2S3/mrkWzJ+i
	 LFcbXgCfTuL8CssFtexVy3WrO81e2cP6FSBdx2wxZn6ZvtxD8T/TqU/l6K93S+5r8z
	 3Q17Mg7M8gNzg==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH 0/5] Kick off ktls-utils 1.2 development
Date: Tue, 10 Jun 2025 09:25:45 -0400
Message-ID: <20250610132550.39715-1-cel@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuck Lever <chuck.lever@oracle.com>

This is a small series collects a few recently discussed code
changes and other clean-ups. These have been pushed to
oracle/ktls-utils in a ktls-utils-1.2-dev branch.

By the way, I recently enabled CodeQL on chucklever/ktls-utils and
that's where patch 3/5 comes from. If anyone knows of sensible
static analysis that can be easily enabled via GitHub Action, let me
know and I can try to set that up.

Chuck Lever (5):
  tlshd: Fix a minor race
  tlshd: Remove unneeded variable "error"
  workflows: Limit permission of the makefile.yml action
  tlshd: Add default keyrings for NFS
  tlshd: Relocate TLSHD_ALLPERMS

 .github/workflows/makefile.yml |  1 +
 src/tlshd/config.c             | 93 +++++++++++++---------------------
 src/tlshd/tlshd.conf.man       |  8 ++-
 3 files changed, 42 insertions(+), 60 deletions(-)

-- 
2.49.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6704FC06;
	Thu,  4 May 2023 15:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412ABC43443;
	Thu,  4 May 2023 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683213863;
	bh=66DdzaAE12CS3htrFIYJYjs8zYHghTQKRVQGwZI1+Cw=;
	h=Subject:From:To:Cc:Date:From;
	b=N0t746OVXM8ka4KVXwsFCxYKI4KRxKynDwwlQqGK+bnPmLRLKzEA9mFqFHr70NOso
	 gkd9WZC/N+w2GHN+HDasY4eoCr9qgrDBWoMOMIoYmwLOVHfvThEHWtLEYh7zBRZlVy
	 PvhVMUSyOCv8bLZW2IpZBtCN2l0s0Ji/xA+U6q7RttXZUwN+TwaHn6Bk69iSe+4k0m
	 vl2Mli+YcW7LUVUefrUYi9TZZSQddBe+FinYw2ZsgGlf06ARu3LnH72CaVI26QcpNj
	 vk3zwlXGF9Rstb8z7xqOWYPmky9lABn2E7bzJUHNv2Qp3L/pIHCYwYLBhAQ+YjX+TU
	 glmnwu6/8dUAA==
Subject: [PATCH 0/5] Bug fixes for net/handshake
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Cc: netdev@vger.kernel.org, dan.carpenter@linaro.org
Date: Thu, 04 May 2023 11:24:12 -0400
Message-ID: 
 <168321371754.16695.4217960864733718685.stgit@oracle-102.nfsv4bat.org>
User-Agent: StGit/1.5
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

I plan to send these as part of a 6.4-rc PR.

---

Chuck Lever (5):
      net/handshake: Remove unneeded check from handshake_dup()
      net/handshake: Fix handshake_dup() ref counting
      net/handshake: Fix uninitialized local variable
      net/handshake: handshake_genl_notify() shouldn't ignore @flags
      net/handshake: Enable the SNI extension to work properly


 Documentation/netlink/specs/handshake.yaml |  4 ++++
 Documentation/networking/tls-handshake.rst |  5 +++++
 include/net/handshake.h                    |  1 +
 include/uapi/linux/handshake.h             |  1 +
 net/handshake/netlink.c                    | 17 +++++------------
 net/handshake/tlshd.c                      |  8 ++++++++
 6 files changed, 24 insertions(+), 12 deletions(-)

--
Chuck Lever


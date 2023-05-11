Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06900629;
	Thu, 11 May 2023 15:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931A6C433D2;
	Thu, 11 May 2023 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683820014;
	bh=jZbCBi4vXRRvyUcl8kdzoUGRBOOIBRNZweNvGWpmRCI=;
	h=Subject:From:To:Cc:Date:From;
	b=BnM3V3thKqCprmmwDGp+pF5XVfAPWVrPZFyIf0cwQuPOXYPa48cfiepADib0eroz7
	 0zCIkD6XbT9Z8ach1z5Jnfj+1RWkleWFcSkblwc7R0DxRua4eGcZv/4swOOvVaufLe
	 vO5S30EILiV105lnvLPaGIUVJkv0YywtukkjWcQL9TKqj4ciBw16jyuLOgT6EDbqbe
	 6szvxy1IpJXvUUTpJDNYTW25zJGvUzJMVJ1IvJzG5yjKQf5c9eYPn3/KOLUu39Oxzh
	 +s84ts7JXKB5HkFQ2Zevno9akAfPcAS2nKy23NfG3Ljf99/Z3epUSNp3xlngHVpbZ0
	 WtJVTTVUXeOFQ==
Subject: [PATCH v3 0/6] Bug fixes for net/handshake
From: Chuck Lever <cel@kernel.org>
To: netdev@vger.kernel.org
Cc: kernel-tls-handshake@lists.linux.dev, dan.carpenter@linaro.org,
 chuck.lever@oracle.com
Date: Thu, 11 May 2023 11:46:39 -0400
Message-ID: 
 <168381978252.84244.1933636428135211300.stgit@91.116.238.104.host.secureserver.net>
User-Agent: StGit/1.5
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Please consider these for merge via net-next.

Paolo observed that there is a possible leak of sock->file. I
haven't looked into that yet, but it seems to be separate from
the fixes in this series, so no need to hold these up.

Changes since v2:
- Address Paolo comment regarding handshake_dup()

Changes since v1:
- Rework "Fix handshake_dup() ref counting"
- Unpin sock->file when a handshake is cancelled

---

Chuck Lever (6):
      net/handshake: Remove unneeded check from handshake_dup()
      net/handshake: Fix handshake_dup() ref counting
      net/handshake: Fix uninitialized local variable
      net/handshake: handshake_genl_notify() shouldn't ignore @flags
      net/handshake: Unpin sock->file if a handshake is cancelled
      net/handshake: Enable the SNI extension to work properly


 Documentation/netlink/specs/handshake.yaml |  4 ++++
 Documentation/networking/tls-handshake.rst |  5 +++++
 include/net/handshake.h                    |  1 +
 include/uapi/linux/handshake.h             |  1 +
 net/handshake/handshake.h                  |  1 +
 net/handshake/netlink.c                    | 12 +++++-------
 net/handshake/request.c                    |  4 ++++
 net/handshake/tlshd.c                      |  8 ++++++++
 8 files changed, 29 insertions(+), 7 deletions(-)

--
Chuck Lever


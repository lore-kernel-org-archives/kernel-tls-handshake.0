Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295308460
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD674C43442
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681742092;
	bh=eaEnb+B4xImOoWfLQ5riPQ9WlXqXqBf5ODeWpXuYXek=;
	h=Subject:From:To:Date:From;
	b=uhDzOxCWakxSIBeVuVq4zpovoY1mjNOYjrohh9bmV7tRuJ2nAtoX+Njh6BTMyqkKZ
	 UA3CmIfZj/xAllcQ5pRlu+ErJ3OoiI45xLLi7gjxuDMdrKoivAa4lUlh2q70DF8HoY
	 z2sJSg2j1l8PUS11ebH0vkJT82kT6l3OMJhf4hPCShhx1SqKIs5w57s3t6FTWSd/w4
	 KJfpZzdaMc9HOpp6T3gF3DLru3yCoC2yUXTlg3GzJmL7EwUxiOApx6bmwyJG55keYZ
	 n5HMebJvZxboFYAMDfhy3w1TYxJlXInaUwl4nx/w/zW7scO52FOPSo7gcgrLPmGNXU
	 ATr5u6BsECT1g==
Subject: [PATCH RFC 0/5] Address security review comments
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Mon, 17 Apr 2023 10:34:51 -0400
Message-ID: 
 <168174201703.9615.15054227659982658294.stgit@91.116.238.104.host.secureserver.net>
User-Agent: StGit/1.5
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

I requested some internal code-practices review of ktls-utils, and
got the results last week. These patches attempt to address the
concerns that were raised by the review. We can discuss these during
tomorrow's meeting, or here on the list.

---

Chuck Lever (5):
      tlshd: Check mode bit settings on certificate material
      tlshd: Fix client's use of Server Name Indication
      tlshd: Pass tlshd_parameters to the verification functions
      tlshd: Fix server-side peer hostname validation
      tlshd: Disable Nagle during handshakes on TCP sockets


 src/tlshd/client.c       | 67 ++++++++++++++++++++++++---------------
 src/tlshd/config.c       | 67 +++++++++++++++++++++++++++++++++------
 src/tlshd/handshake.c    | 30 ++++++++++++++++++
 src/tlshd/log.c          | 14 +++++++++
 src/tlshd/server.c       | 68 ++++++++++++++++++++++++++--------------
 src/tlshd/tlshd.conf     |  1 +
 src/tlshd/tlshd.conf.man | 31 ++++++++++++++++--
 src/tlshd/tlshd.h        |  4 ++-
 8 files changed, 221 insertions(+), 61 deletions(-)

--
Chuck Lever


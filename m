Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897B9613D
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Sep 2023 14:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A86C433C7;
	Wed,  6 Sep 2023 14:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694009111;
	bh=U1jBZcoakWXSBDGsktyVNgZMAVBN8m45eQqEF0cDJWI=;
	h=Subject:From:To:Cc:Date:From;
	b=aA3U7itQ222KGKCs0fcnO+NaKM+molSE/BV7nIpOb22AIiWD7afYEV5n+Ws5r8svV
	 7oXrnfjj6ovsqjGf8fPwLrMc48LnvmUjCXkka0tOFux9Y0pMooUgSivzY83QyG/hB6
	 MQAq/2ghbdeHgB1zYwaYEee0WPvQimMx+mg35iztGA95pRrZzO6iWyh8LUlQi319Ba
	 wRyhlHIOuKYdPlwC3YMvy8x5+ffNioUToCF2V1YaPjAJlgIclQCZr9AOsWweaM9yG4
	 M44Nr4Q/jQOHfTEuFmO+8WS9xq3zyYiLGMFz6+TxiUd5KZAFpWRgpIVTor0JFWW9VX
	 1QCPv6qNO5RGA==
Subject: [PATCH v1 0/6] Fixes for ktls-utils 0.10
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Cc: Hannes Reinecke <hare@suse.de>, Olga Kornievskaia <kolga@netapp.com>,
 Chuck Lever <chuck.lever@oracle.com>
Date: Wed, 06 Sep 2023 10:04:59 -0400
Message-ID: 
 <169400879020.10079.2238873524435794665.stgit@oracle-102.nfsv4bat.org>
User-Agent: StGit/1.5
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

I've been collecting a few patches for 0.10. Here they are for
review. There are two that are controversial:

- "tlshd: Revert b586f7d97795"

  This one removes the reverse DNS query done to make SNI work for
  mounting servers by IP address. This query was noticed during
  security review as a problem. Instead of a reverse query, server
  certificates can list their IP addresses in the subjectAltName
  field.

- "tlshd: Reorganize tlshd.conf"

  This is a user-visible administrative API change that I wouldn't
  do if ktls-utils wasn't clearly marked as PROTOTYPE. Let me know
  if there's a better way to go about this.

---

Chuck Lever (5):
      tlshd: Check return values of non-void gnutls library functions
      tlshd: Ensure tlshd_peeraddr is initialized to all zeroes
      tlshd: Revert b586f7d97795
      tlshd: Reorganize tlshd.conf
      tlshd: Demote missing options

Hannes Reinecke (1):
      tlshd: add 'delay' configuration parameter


 src/tlshd/client.c       | 22 +++++++++++++++++----
 src/tlshd/config.c       | 23 ++++++++++------------
 src/tlshd/netlink.c      | 26 ++++++++++---------------
 src/tlshd/server.c       | 14 ++++++++++++--
 src/tlshd/tlshd.conf     |  9 +++++----
 src/tlshd/tlshd.conf.man | 41 ++++++++++++++++++++++++++--------------
 src/tlshd/tlshd.h        |  1 +
 7 files changed, 83 insertions(+), 53 deletions(-)

--
Chuck Lever


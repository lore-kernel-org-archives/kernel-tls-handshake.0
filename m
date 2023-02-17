Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFD85696
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 11:31:53 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 534241FE9B;
	Fri, 17 Feb 2023 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676633506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=htCpMew9SSeGMAai6Dw91BbqvkYbDGudBuCPg63dZyg=;
	b=mxKRK6Y3eFZ6rmZuwx+pfEmqzkNaHTkFnnmabpsvRUE0uMIPy+ZZgblkMmUon2bviKP6Wg
	+x4HlfrOQi663Z2JmCwAjXJc3BE0AU02rmVFh+YmYZ5VrfLFSC8BQfIlRRdnL1lKpDBa64
	IpN8I3FK3kSFoZe32ID3pFNbFh/5f/c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676633506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=htCpMew9SSeGMAai6Dw91BbqvkYbDGudBuCPg63dZyg=;
	b=Lvw6dup4zwyi5ro+HQPzizEZksycWMhp2anNpyR3ug88rC+Zqq/Bm52UjJvE9e5fxzdNDB
	YN6hEKbAA2ZWeJAA==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id 40DF02C141;
	Fri, 17 Feb 2023 11:31:46 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 2F65A51BD987; Fri, 17 Feb 2023 12:31:46 +0100 (CET)
From: Hannes Reinecke <hare@suse.de>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 0/4] tls-handshake: server-side support
Date: Fri, 17 Feb 2023 12:31:41 +0100
Message-Id: <20230217113145.18916-1-hare@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

here are my patches to get server-side for PSK up and
(well, not exactly) running.
Pretty trivial, really; just adding two more netlink
attributes (showing the power of netlink; I really like
this interface) and split server_hello() into two functions.

Based on v4 of the tls handshake netlink patches.

Hannes Reinecke (4):
  tls-handshake: add 'timeout' netlink attribute
  tls-handshake: add 'keyring' netlink attribute
  net/tls_handshake: split tls_server_hello()
  tls_handshake: add 'keyring' argument to server hello

 include/net/tls.h              | 18 +++++--
 include/uapi/linux/handshake.h |  2 +
 net/tls/tls_handshake.c        | 97 ++++++++++++++++++++++++++++++----
 3 files changed, 103 insertions(+), 14 deletions(-)

-- 
2.35.3


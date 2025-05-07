Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD4D1F91C5
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  7 May 2025 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610857; cv=none; b=p5LRbH7eH5zliufmMhY854U6wY38ORNEfI0EGSDd/9CyGWaeWyxkKxWp9NTSmDwdYHqlFl48mXrazqURHZxgL7embJFQZU2mQ6udfpCmkilxrTN2wN2uY7HY7yJilzowmtrwu2BFdF2HQqbToofKRsaO2NqfQ+cyPz3GXksSRvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610857; c=relaxed/simple;
	bh=DflWMP1YuzuQ5vH06lh0le/JMRdskS8d8TMO2J6HC2w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QP3v5Y1HBm+BdQkzEcqFznWIuqpa4JRNJgcoTAR38OhT6NXNsj/wI8NuPE38jaCZdiwdMnpFp4GPTkgtdIbm2znr8/zBYcAhRmDpzpibSAv0esGY/wXN4WFJyfDax8VmzGW9LBwirRfSWM5vN/MC/uzhjZQHoxNq5ALd1gBYvPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nO0G0+p1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nO0G0+p1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B8CC4CEF0;
	Wed,  7 May 2025 09:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746610857;
	bh=DflWMP1YuzuQ5vH06lh0le/JMRdskS8d8TMO2J6HC2w=;
	h=From:To:Cc:Subject:Date:From;
	b=nO0G0+p1yzuIVfKNUQeJFrPfTHo4qyQd0iVxKNi8CO+gEAQwDYpg9XCJBxKWdsPhW
	 sQxjCWuRqrX74RcH9zNCSS1F1m7mKoeoapjlM6t0qgYMp2lzCHw5Asb4G6XDSCNINO
	 TvUezUYwKjoy6Q5a/1GQv7zy/KtMJ3X9xQEiYaSrEEe2SAxnAU2M3wEn3pVUtCetIH
	 VmOBAkqqwHBDpO7wkPaccCi1hTwoVqJF3JO8X5dsAzpNnf8WTR2V4/HNN2yaD7fyZy
	 WjRsKGnB38w1JtF3sty1bKJ6rI61gwIO+U1Ef2lWnQs69He/xzBfj7Hw6W1r33VLGY
	 m5w2w9ZVGWFBw==
From: hare@kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chuck Lever <chuck.lever@oracle.com>,
	linux-nvme@lists.infradead.org,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@kernel.org>
Subject: [PATCH] net/handshake: Add new parameter 'HANDSHAKE_A_ACCEPT_KEYRING'
Date: Wed,  7 May 2025 11:40:49 +0200
Message-Id: <20250507094049.26181-1-hare@kernel.org>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hannes Reinecke <hare@kernel.org>

Add a new netlink parameter 'HANDSHAKE_A_ACCEPT_KEYRING' to provide
the serial number of the keyring to use.

Signed-off-by: Hannes Reinecke <hare@kernel.org>
---
 include/uapi/linux/handshake.h | 1 +
 net/handshake/tlshd.c          | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/uapi/linux/handshake.h b/include/uapi/linux/handshake.h
index 3d7ea58778c9..662e7de46c54 100644
--- a/include/uapi/linux/handshake.h
+++ b/include/uapi/linux/handshake.h
@@ -45,6 +45,7 @@ enum {
 	HANDSHAKE_A_ACCEPT_PEER_IDENTITY,
 	HANDSHAKE_A_ACCEPT_CERTIFICATE,
 	HANDSHAKE_A_ACCEPT_PEERNAME,
+	HANDSHAKE_A_ACCEPT_KEYRING,
 
 	__HANDSHAKE_A_ACCEPT_MAX,
 	HANDSHAKE_A_ACCEPT_MAX = (__HANDSHAKE_A_ACCEPT_MAX - 1)
diff --git a/net/handshake/tlshd.c b/net/handshake/tlshd.c
index d6f52839827e..081093dfd553 100644
--- a/net/handshake/tlshd.c
+++ b/net/handshake/tlshd.c
@@ -230,6 +230,12 @@ static int tls_handshake_accept(struct handshake_req *req,
 		if (ret < 0)
 			goto out_cancel;
 	}
+	if (treq->th_keyring) {
+		ret = nla_put_u32(msg, HANDSHAKE_A_ACCEPT_KEYRING,
+				  treq->th_keyring);
+		if (ret < 0)
+			goto out_cancel;
+	}
 
 	ret = nla_put_u32(msg, HANDSHAKE_A_ACCEPT_AUTH_MODE,
 			  treq->th_auth_mode);
-- 
2.35.3


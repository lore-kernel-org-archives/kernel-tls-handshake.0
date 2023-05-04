Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB9579F4;
	Thu,  4 May 2023 15:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C80EC433D2;
	Thu,  4 May 2023 15:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683213969;
	bh=7SNbUsJbwS6aBollO8XYpeLF/vFw+x6n0WQJ1DfXHV8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=eGvukNs4Ee3JYbfP4ezk9RO1183MpMBTbnXeyF1J3GQVT5GNioUUVhBx9W1luXhyt
	 1GeCqM8XW0FcxWIc3wEE1kHSgQLHheZgTwtGmntHPvzyvMZ0MLvHQTYr2UGCgY+WDJ
	 rqwm8qc7O3qkjWGEqdNg6uiCHcOqBbDHJ6tENVOdGCeSFbCmO/RSaVXvV0qOSyAX+5
	 Vt/OZ0V7Q45rOv6L/+Ckon2BbBpSjKOj8ZwYnDtC1fsV9nc2RBQYrqJCBu4Q30ULT9
	 6KzG9SwS2IFQ9y5x3qZOoaCxUxTsTZNnBT6Y0Ay4tClP58TDplVEOeH3bbAYsBkCg1
	 RGmL0nxGa6nmQ==
Subject: [PATCH 4/5] net/handshake: handshake_genl_notify() shouldn't ignore
 @flags
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Cc: netdev@vger.kernel.org, dan.carpenter@linaro.org
Date: Thu, 04 May 2023 11:25:58 -0400
Message-ID: 
 <168321394845.16695.3852024361115547230.stgit@oracle-102.nfsv4bat.org>
In-Reply-To: 
 <168321371754.16695.4217960864733718685.stgit@oracle-102.nfsv4bat.org>
References: 
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

From: Chuck Lever <chuck.lever@oracle.com>

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Fixes: 3b3009ea8abb ("net/handshake: Create a NETLINK service for handling handshake requests")
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 net/handshake/netlink.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/handshake/netlink.c b/net/handshake/netlink.c
index 8c2d13190314..ab1ba5175c03 100644
--- a/net/handshake/netlink.c
+++ b/net/handshake/netlink.c
@@ -48,7 +48,7 @@ int handshake_genl_notify(struct net *net, const struct handshake_proto *proto,
 				proto->hp_handler_class))
 		return -ESRCH;
 
-	msg = genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
+	msg = genlmsg_new(GENLMSG_DEFAULT_SIZE, flags);
 	if (!msg)
 		return -ENOMEM;
 



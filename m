Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C592564
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 19 Apr 2023 06:57:21 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 4E5AF1FD8C;
	Wed, 19 Apr 2023 06:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681887438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZXRO4qbhDvFqreQVzFlZlWMzEZZQaqd21ICS1LMOtQ=;
	b=KkgOx1ohrBcrhXsjOujyo/+1RmSkDdYX2ZcNS3MTuvg8g+9vXuuYl+Mybk9H/CvkCHveDz
	i8eZB0/HgS80ESlwScoWnK06en2eeQHxHKSSC1anp7VXDmHgWREQJ3ycyuIH1Jjn5YoPkM
	dGGIV1giR8xw/royPWqhR8gQ+l+FF2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681887438;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZXRO4qbhDvFqreQVzFlZlWMzEZZQaqd21ICS1LMOtQ=;
	b=ZYtFFKBy9N65yG/NKiWmP6hOs5GQKOH6FqQBV8vM+/qMUnaLaM/9IPQyCKcXorWqRfvGin
	5tAb8sollPDEWmDg==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id 2DBFB2C149;
	Wed, 19 Apr 2023 06:57:18 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 04F2D51C26D5; Wed, 19 Apr 2023 08:57:18 +0200 (CEST)
From: Hannes Reinecke <hare@suse.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 07/17] net/tls: handle MSG_EOR for tls_sw TX flow
Date: Wed, 19 Apr 2023 08:57:04 +0200
Message-Id: <20230419065714.52076-8-hare@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230419065714.52076-1-hare@suse.de>
References: <20230419065714.52076-1-hare@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tls_sw_sendmsg() / tls_do_sw_sendpage() already checks for an
'end of record' by evaluating the 'MSG_MORE' / 'MSG_SENDPAGE_NOTLAST'
setting. So MSG_EOR can easily be handled by treating it
as the opposite of MSG_MORE / MSG_SENDPAGE_NOTLAST.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Cc: Jakub Kicinski <kuba@kernel.org>
---
 net/tls/tls_sw.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 827292e29f99..9bee2dcd55bf 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -953,9 +953,12 @@ int tls_sw_sendmsg(struct sock *sk, struct msghdr *msg, size_t size)
 	int pending;
 
 	if (msg->msg_flags & ~(MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL |
-			       MSG_CMSG_COMPAT))
+			       MSG_EOR | MSG_CMSG_COMPAT))
 		return -EOPNOTSUPP;
 
+	if (msg->msg_flags & MSG_EOR)
+		eor = true;
+
 	ret = mutex_lock_interruptible(&tls_ctx->tx_lock);
 	if (ret)
 		return ret;
@@ -1173,6 +1176,8 @@ static int tls_sw_do_sendpage(struct sock *sk, struct page *page,
 	bool eor;
 
 	eor = !(flags & MSG_SENDPAGE_NOTLAST);
+	if (flags & MSG_EOR)
+		eor = true;
 	sk_clear_bit(SOCKWQ_ASYNC_NOSPACE, sk);
 
 	/* Call the sk_stream functions to manage the sndbuf mem. */
@@ -1274,7 +1279,7 @@ static int tls_sw_do_sendpage(struct sock *sk, struct page *page,
 int tls_sw_sendpage_locked(struct sock *sk, struct page *page,
 			   int offset, size_t size, int flags)
 {
-	if (flags & ~(MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL |
+	if (flags & ~(MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL | MSG_EOR |
 		      MSG_SENDPAGE_NOTLAST | MSG_SENDPAGE_NOPOLICY |
 		      MSG_NO_SHARED_FRAGS))
 		return -EOPNOTSUPP;
@@ -1288,7 +1293,7 @@ int tls_sw_sendpage(struct sock *sk, struct page *page,
 	struct tls_context *tls_ctx = tls_get_ctx(sk);
 	int ret;
 
-	if (flags & ~(MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL |
+	if (flags & ~(MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL | MSG_EOR |
 		      MSG_SENDPAGE_NOTLAST | MSG_SENDPAGE_NOPOLICY))
 		return -EOPNOTSUPP;
 
-- 
2.35.3


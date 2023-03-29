Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263C22F4E
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 14:00:01 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id CFD581FDF5;
	Wed, 29 Mar 2023 13:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680098389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+o+RM62iyNqNlVJHO+JsgD5ffbrDC0FW6pKNrYpcZ6A=;
	b=SxuZ4oPSiXKBcppxzkgjchnla7lY9FzDb0l1GlMOE7GoJ7zibUywjIumJZqJO0Y5hI2kMA
	BTAa/OSulLrR5RoIB33mrbBKJVxQiMzT9F/lL2Y7e+r0MdkW3bt8vBh0YSUwmdXjgHpG97
	uX/SEmv/Ln1SBarvtMyECd8/GdBH+LA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680098389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+o+RM62iyNqNlVJHO+JsgD5ffbrDC0FW6pKNrYpcZ6A=;
	b=HT4lUbmsXk3AACaYB4fxOXfqdLqhRiVimRKU4hoI4bOzodhs5UfWOPdMeDsw4JYf7ri68r
	NkauYoVlia6/T9AA==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id BE21E2C17D;
	Wed, 29 Mar 2023 13:59:49 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id BBCF651BF386; Wed, 29 Mar 2023 15:59:49 +0200 (CEST)
From: Hannes Reinecke <hare@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 10/18] nvme-tcp: fixup send workflow for kTLS
Date: Wed, 29 Mar 2023 15:59:30 +0200
Message-Id: <20230329135938.46905-11-hare@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230329135938.46905-1-hare@suse.de>
References: <20230329135938.46905-1-hare@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kTLS does not support MSG_EOR flag for sendmsg(), and in general
is really picky about invalid MSG_XXX flags.
So ensure that the MSG_EOR flags is blanked out for TLS, and that
the MSG_SENDPAGE_LAST is only set if we actually do sendpage().

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/nvme/host/tcp.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index fdb564d0b9f4..54d27873227a 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -218,6 +218,15 @@ static inline struct blk_mq_tags *nvme_tcp_tagset(struct nvme_tcp_queue *queue)
 	return queue->ctrl->tag_set.tags[queue_idx - 1];
 }
 
+static inline bool nvme_tcp_tls_enabled(struct nvme_tcp_queue *queue)
+{
+#ifdef CONFIG_NVME_TLS
+	return (queue->ctrl->ctrl.tls_key != NULL);
+#else
+	return false;
+#endif
+}
+
 static inline u8 nvme_tcp_hdgst_len(struct nvme_tcp_queue *queue)
 {
 	return queue->hdr_digest ? NVME_TCP_DIGEST_LENGTH : 0;
@@ -1021,12 +1030,14 @@ static int nvme_tcp_try_send_data(struct nvme_tcp_request *req)
 		int req_data_sent = req->data_sent;
 		int ret, flags = MSG_DONTWAIT;
 
-		if (last && !queue->data_digest && !nvme_tcp_queue_more(queue))
+		if (!last || queue->data_digest || nvme_tcp_queue_more(queue))
+			flags |= MSG_MORE;
+		else if (!nvme_tcp_tls_enabled(queue))
 			flags |= MSG_EOR;
-		else
-			flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
 
 		if (sendpage_ok(page)) {
+			if (flags & MSG_MORE)
+				flags |= MSG_SENDPAGE_NOTLAST;
 			ret = kernel_sendpage(queue->sock, page, offset, len,
 					flags);
 		} else {
@@ -1077,9 +1088,11 @@ static int nvme_tcp_try_send_cmd_pdu(struct nvme_tcp_request *req)
 	int flags = MSG_DONTWAIT;
 	int ret;
 
-	if (inline_data || nvme_tcp_queue_more(queue))
-		flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
-	else
+	if (inline_data || nvme_tcp_queue_more(queue)) {
+		flags |= MSG_MORE;
+		if (!nvme_tcp_tls_enabled(queue))
+			flags |= MSG_SENDPAGE_NOTLAST;
+	} else if (!nvme_tcp_tls_enabled(queue))
 		flags |= MSG_EOR;
 
 	if (queue->hdr_digest && !req->offset)
@@ -1154,9 +1167,8 @@ static int nvme_tcp_try_send_ddgst(struct nvme_tcp_request *req)
 
 	if (nvme_tcp_queue_more(queue))
 		msg.msg_flags |= MSG_MORE;
-	else
+	else if (!nvme_tcp_tls_enabled(queue))
 		msg.msg_flags |= MSG_EOR;
-
 	ret = kernel_sendmsg(queue->sock, &msg, &iov, 1, iov.iov_len);
 	if (unlikely(ret <= 0))
 		return ret;
-- 
2.35.3


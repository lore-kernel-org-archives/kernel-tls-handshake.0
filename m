Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8AA945C
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 12:44:10 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 25AA020009;
	Tue, 21 Mar 2023 12:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679402638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6L6csMijrgFznGx4XlkuL8oV0JQ7k57cpSw/3iA1WzQ=;
	b=LYvTZrZS6VGLec1z+fkZngohH5orXZD9JJTAE73GXLE+FF8YuK971gixNa4vvwVcBl/b/E
	DFKp39Zvv8Fg7yS0i8OCIKgd568Vf3KlCpfVQlIYeGkx/We/fYUaWWy3p9fdtoa4N3q0mH
	1PCy3LiHdvm6EF7+LfDdn8BdWtDQlGQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679402638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6L6csMijrgFznGx4XlkuL8oV0JQ7k57cpSw/3iA1WzQ=;
	b=q2OyUJjy5D8HgWsE4ZW9mqjkCLGcn+hckJ090FGtLJhydYuluBzYRWep8w1FJVvvwJ1Tbu
	FXceslkuVC9KvMBg==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id 1449B2C162;
	Tue, 21 Mar 2023 12:43:58 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 10CA751BEEB4; Tue, 21 Mar 2023 13:43:58 +0100 (CET)
From: Hannes Reinecke <hare@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <cel@kernel.org>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 16/18] nvmet-tcp: rework sendpage for kTLS
Date: Tue, 21 Mar 2023 13:43:23 +0100
Message-Id: <20230321124325.77385-17-hare@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230321124325.77385-1-hare@suse.de>
References: <20230321124325.77385-1-hare@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kTLS ->sendpage() doesn't support the MSG_EOR flag, and it's
questionable whether it makes sense for kTLS as one has to copy
data anyway.
So use sock_no_sendpage() for kTLS.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/nvme/target/tcp.c | 56 ++++++++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index 6e88e98a2c59..9b69cac84508 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -570,9 +570,14 @@ static int nvmet_try_send_data_pdu(struct nvmet_tcp_cmd *cmd)
 	int left = sizeof(*cmd->data_pdu) - cmd->offset + hdgst;
 	int ret;
 
-	ret = kernel_sendpage(cmd->queue->sock, virt_to_page(cmd->data_pdu),
-			offset_in_page(cmd->data_pdu) + cmd->offset,
-			left, MSG_DONTWAIT | MSG_MORE | MSG_SENDPAGE_NOTLAST);
+	if (cmd->queue->tls_psk)
+		ret = sock_no_sendpage(cmd->queue->sock, virt_to_page(cmd->data_pdu),
+				      offset_in_page(cmd->data_pdu) + cmd->offset,
+				      left, MSG_DONTWAIT | MSG_MORE);
+	else
+		ret = kernel_sendpage(cmd->queue->sock, virt_to_page(cmd->data_pdu),
+				      offset_in_page(cmd->data_pdu) + cmd->offset,
+				      left, MSG_DONTWAIT | MSG_MORE | MSG_SENDPAGE_NOTLAST);
 	if (ret <= 0)
 		return ret;
 
@@ -600,10 +605,17 @@ static int nvmet_try_send_data(struct nvmet_tcp_cmd *cmd, bool last_in_batch)
 		if ((!last_in_batch && cmd->queue->send_list_len) ||
 		    cmd->wbytes_done + left < cmd->req.transfer_len ||
 		    queue->data_digest || !queue->nvme_sq.sqhd_disabled)
-			flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
-
-		ret = kernel_sendpage(cmd->queue->sock, page, cmd->offset,
-					left, flags);
+			flags |= MSG_MORE;
+
+		if (queue->tls_psk)
+			ret = sock_no_sendpage(cmd->queue->sock, page, cmd->offset,
+					       left, flags);
+		else {
+			if (flags & MSG_MORE)
+				flags |= MSG_SENDPAGE_NOTLAST;
+			ret = kernel_sendpage(cmd->queue->sock, page, cmd->offset,
+					      left, flags);
+		}
 		if (ret <= 0)
 			return ret;
 
@@ -645,12 +657,19 @@ static int nvmet_try_send_response(struct nvmet_tcp_cmd *cmd,
 	int ret;
 
 	if (!last_in_batch && cmd->queue->send_list_len)
-		flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
-	else
+		flags |= MSG_MORE;
+	else if (!cmd->queue->tls_psk)
 		flags |= MSG_EOR;
 
-	ret = kernel_sendpage(cmd->queue->sock, virt_to_page(cmd->rsp_pdu),
-		offset_in_page(cmd->rsp_pdu) + cmd->offset, left, flags);
+	if (cmd->queue->tls_psk)
+		ret = sock_no_sendpage(cmd->queue->sock, virt_to_page(cmd->rsp_pdu),
+			offset_in_page(cmd->rsp_pdu) + cmd->offset, left, flags);
+	else {
+		if (flags & MSG_MORE)
+			flags |= MSG_SENDPAGE_NOTLAST;
+		ret = kernel_sendpage(cmd->queue->sock, virt_to_page(cmd->rsp_pdu),
+			offset_in_page(cmd->rsp_pdu) + cmd->offset, left, flags);
+	}
 	if (ret <= 0)
 		return ret;
 	cmd->offset += ret;
@@ -673,12 +692,19 @@ static int nvmet_try_send_r2t(struct nvmet_tcp_cmd *cmd, bool last_in_batch)
 	int ret;
 
 	if (!last_in_batch && cmd->queue->send_list_len)
-		flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
-	else
+		flags |= MSG_MORE;
+	else if (!cmd->queue->tls_psk)
 		flags |= MSG_EOR;
 
-	ret = kernel_sendpage(cmd->queue->sock, virt_to_page(cmd->r2t_pdu),
-		offset_in_page(cmd->r2t_pdu) + cmd->offset, left, flags);
+	if (cmd->queue->tls_psk)
+		ret = sock_no_sendpage(cmd->queue->sock, virt_to_page(cmd->r2t_pdu),
+			offset_in_page(cmd->r2t_pdu) + cmd->offset, left, flags);
+	else {
+		if (flags & MSG_MORE)
+			flags |= MSG_SENDPAGE_NOTLAST;
+		ret = kernel_sendpage(cmd->queue->sock, virt_to_page(cmd->r2t_pdu),
+			offset_in_page(cmd->r2t_pdu) + cmd->offset, left, flags);
+	}
 	if (ret <= 0)
 		return ret;
 	cmd->offset += ret;
-- 
2.35.3


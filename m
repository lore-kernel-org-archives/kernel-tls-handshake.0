Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79A79457
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 12:44:11 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 2BBB52000A;
	Tue, 21 Mar 2023 12:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679402638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JxjE86AZg9fGq3fHBG16Po0N5ZX/5S0GB56pN0ki1Aw=;
	b=FZl4U/j6xH0NhM1hIBl1Ni6th9kKHwvYLb9BGZw3xpiH1odIn1xckAsvEqMjrEivNZ7sPf
	3cR8eOn0blgkd8xVX33hBD+5T5IvNS4WQVaybl1882xynHOEsntc3IwDdpKcd6dLvG/isu
	BLIu/comYVZ4DALT0L3vFy5n2JWl3Zo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679402638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JxjE86AZg9fGq3fHBG16Po0N5ZX/5S0GB56pN0ki1Aw=;
	b=AnIU5p0B1Ce+Ao1ppscwDBwDjppDElHPw72pjIpnmS063TBd3S/eGFMc8pJfWal5jG5aC/
	f9fFY3UumcZuOdBA==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id 1B2C32C165;
	Tue, 21 Mar 2023 12:43:58 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 17BA451BEEB6; Tue, 21 Mar 2023 13:43:58 +0100 (CET)
From: Hannes Reinecke <hare@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <cel@kernel.org>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 17/18] nvmet-tcp: control messages for recvmsg()
Date: Tue, 21 Mar 2023 13:43:24 +0100
Message-Id: <20230321124325.77385-18-hare@suse.de>
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

kTLS requires control messages for recvmsg() to relay any out-of-band
TLS messages (eg TLS alerts) to the caller.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/nvme/target/tcp.c | 58 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index 9b69cac84508..a69647fb2c81 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -12,6 +12,7 @@
 #include <linux/nvme-keyring.h>
 #include <net/sock.h>
 #include <net/tcp.h>
+#include <net/tls.h>
 #include <net/handshake.h>
 #include <linux/inet.h>
 #include <linux/llist.h>
@@ -88,6 +89,7 @@ struct nvmet_tcp_cmd {
 	u32				pdu_len;
 	u32				pdu_recv;
 	int				sg_idx;
+	char				recv_cbuf[CMSG_LEN(sizeof(char))];
 	struct msghdr			recv_msg;
 	struct bio_vec			*iov;
 	u32				flags;
@@ -1108,7 +1110,14 @@ static int nvmet_tcp_try_recv_pdu(struct nvmet_tcp_queue *queue)
 	struct nvme_tcp_hdr *hdr = &queue->pdu.cmd.hdr;
 	int len;
 	struct kvec iov;
-	struct msghdr msg = { .msg_flags = MSG_DONTWAIT };
+	char cbuf[CMSG_LEN(sizeof(char))] = {};
+	unsigned char ctype;
+	struct cmsghdr *cmsg;
+	struct msghdr msg = {
+		.msg_control = cbuf,
+		.msg_controllen = sizeof(cbuf),
+		.msg_flags = MSG_DONTWAIT
+	};
 
 recv:
 	iov.iov_base = (void *)&queue->pdu + queue->offset;
@@ -1117,6 +1126,17 @@ static int nvmet_tcp_try_recv_pdu(struct nvmet_tcp_queue *queue)
 			iov.iov_len, msg.msg_flags);
 	if (unlikely(len < 0))
 		return len;
+	cmsg = (struct cmsghdr *)cbuf;
+	if (CMSG_OK(&msg, cmsg) &&
+	    cmsg->cmsg_level == SOL_TLS &&
+	    cmsg->cmsg_type == TLS_GET_RECORD_TYPE) {
+		ctype = *((unsigned char *)CMSG_DATA(cmsg));
+		if (ctype != TLS_RECORD_TYPE_DATA) {
+			pr_err("queue %d unhandled TLS record %d\n",
+				queue->idx, ctype);
+			return -ENOTCONN;
+		}
+	}
 
 	queue->offset += len;
 	queue->left -= len;
@@ -1172,10 +1192,24 @@ static int nvmet_tcp_try_recv_data(struct nvmet_tcp_queue *queue)
 	int ret;
 
 	while (msg_data_left(&cmd->recv_msg)) {
+		struct cmsghdr *cmsg;
+		unsigned char ctype;
+
 		ret = sock_recvmsg(cmd->queue->sock, &cmd->recv_msg,
 			cmd->recv_msg.msg_flags);
 		if (ret <= 0)
 			return ret;
+		cmsg = (struct cmsghdr *)cmd->recv_cbuf;
+		if (CMSG_OK(&cmd->recv_msg, cmsg) &&
+		    cmsg->cmsg_level == SOL_TLS &&
+		    cmsg->cmsg_type == TLS_GET_RECORD_TYPE) {
+			ctype = *((unsigned char *)CMSG_DATA(cmsg));
+			if (ctype != TLS_RECORD_TYPE_DATA) {
+				pr_err("queue %d unhandled TLS record %d\n",
+				       queue->idx, ctype);
+				return -ENOTCONN;
+			}
+		}
 
 		cmd->pdu_recv += ret;
 		cmd->rbytes_done += ret;
@@ -1197,7 +1231,14 @@ static int nvmet_tcp_try_recv_ddgst(struct nvmet_tcp_queue *queue)
 {
 	struct nvmet_tcp_cmd *cmd = queue->cmd;
 	int ret;
-	struct msghdr msg = { .msg_flags = MSG_DONTWAIT };
+	char cbuf[CMSG_LEN(sizeof(char))] = {};
+	unsigned char ctype;
+	struct cmsghdr *cmsg;
+	struct msghdr msg = {
+		.msg_control = cbuf,
+		.msg_controllen = sizeof(cbuf),
+		.msg_flags = MSG_DONTWAIT
+	};
 	struct kvec iov = {
 		.iov_base = (void *)&cmd->recv_ddgst + queue->offset,
 		.iov_len = queue->left
@@ -1207,6 +1248,17 @@ static int nvmet_tcp_try_recv_ddgst(struct nvmet_tcp_queue *queue)
 			iov.iov_len, msg.msg_flags);
 	if (unlikely(ret < 0))
 		return ret;
+	cmsg = (struct cmsghdr *)cbuf;
+	if (CMSG_OK(&msg, cmsg) &&
+	    cmsg->cmsg_level == SOL_TLS &&
+	    cmsg->cmsg_type == TLS_GET_RECORD_TYPE) {
+		ctype = *((unsigned char *)CMSG_DATA(cmsg));
+		if (ctype != TLS_RECORD_TYPE_DATA) {
+			pr_err("queue %d unhandled TLS record %d\n",
+				queue->idx, ctype);
+			return -ENOTCONN;
+		}
+	}
 
 	queue->offset += ret;
 	queue->left -= ret;
@@ -1376,6 +1428,8 @@ static int nvmet_tcp_alloc_cmd(struct nvmet_tcp_queue *queue,
 	if (!c->r2t_pdu)
 		goto out_free_data;
 
+	c->recv_msg.msg_control = c->recv_cbuf;
+	c->recv_msg.msg_controllen = sizeof(c->recv_cbuf);
 	c->recv_msg.msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
 
 	list_add_tail(&c->entry, &queue->free_list);
-- 
2.35.3


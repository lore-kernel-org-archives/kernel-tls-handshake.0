Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296AF9455
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 12:44:10 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 0A27820004;
	Tue, 21 Mar 2023 12:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679402638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4pPvfwH7+gAl9w2RDna3nY20NWr9TRmRMLRCRfo6g+8=;
	b=PQWMM1D6tXOHGsutKZj035bhFDIY5WtcrDxBNZEvflrFIZfcHi7w4ZNA/cVhp13laQs2CH
	kryhdYJXJ/hKIchc85DpM0+PkWvdsL1aRBCdxfpI8MGHkzjlZS0LYjUD3vTN12GhlxX3h8
	9q2RFeTr3PmIaGY0JgL1+JBPc7OunZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679402638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4pPvfwH7+gAl9w2RDna3nY20NWr9TRmRMLRCRfo6g+8=;
	b=CusM/nUDjxq5rs5xFMo4mFhdNB4EdE0bgdx+56ffn8V2XpDV8/4Aru/Nj/dngydV64VAF1
	8+Qmdt6jY8cQNFBg==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id EAD682C15B;
	Tue, 21 Mar 2023 12:43:57 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id E73C451BEEAA; Tue, 21 Mar 2023 13:43:57 +0100 (CET)
From: Hannes Reinecke <hare@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <cel@kernel.org>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 11/18] nvme-tcp: control message handling for recvmsg()
Date: Tue, 21 Mar 2023 13:43:18 +0100
Message-Id: <20230321124325.77385-12-hare@suse.de>
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

kTLS is sending TLS ALERT messages as control messages for recvmsg().
As we can't do anything sensible with it just abort the connection
and let the userspace agent to a re-negotiation.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/nvme/host/tcp.c | 68 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 007d457cacf9..e0fc98ac9e05 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -13,6 +13,7 @@
 #include <linux/nvme-keyring.h>
 #include <net/sock.h>
 #include <net/tcp.h>
+#include <net/tls.h>
 #include <net/handshake.h>
 #include <linux/blk-mq.h>
 #include <crypto/hash.h>
@@ -727,7 +728,12 @@ static int nvme_tcp_recv_pdu(struct nvme_tcp_queue *queue, bool pending)
 {
 	struct nvme_tcp_hdr *hdr;
 	size_t rcv_len = queue->pdu_remaining;
+	char cbuf[CMSG_LEN(sizeof(char))] = {};
+	struct cmsghdr *cmsg;
+	unsigned char ctype;
 	struct msghdr msg = {
+		.msg_control = cbuf,
+		.msg_controllen = sizeof(cbuf),
 		.msg_flags = pending ? 0 : MSG_DONTWAIT,
 	};
 	struct kvec iov = {
@@ -743,6 +749,18 @@ static int nvme_tcp_recv_pdu(struct nvme_tcp_queue *queue, bool pending)
 			     iov.iov_len, msg.msg_flags);
 	if (ret <= 0)
 		return ret;
+	cmsg = (struct cmsghdr *)cbuf;
+	if (CMSG_OK(&msg, cmsg) &&
+	    cmsg->cmsg_level == SOL_TLS &&
+	    cmsg->cmsg_type == TLS_GET_RECORD_TYPE) {
+		ctype = *((unsigned char *)CMSG_DATA(cmsg));
+		if (ctype != TLS_RECORD_TYPE_DATA) {
+			dev_err(queue->ctrl->ctrl.device,
+				"queue %d unhandled TLS record %d\n",
+				nvme_tcp_queue_id(queue), ctype);
+			return -ENOTCONN;
+		}
+	}
 
 	rcv_len = ret;
 	queue->pdu_remaining -= rcv_len;
@@ -793,6 +811,9 @@ static int nvme_tcp_recv_data(struct nvme_tcp_queue *queue)
 	struct request *rq =
 		nvme_cid_to_rq(nvme_tcp_tagset(queue), pdu->command_id);
 	struct nvme_tcp_request *req = blk_mq_rq_to_pdu(rq);
+	char cbuf[CMSG_LEN(sizeof(char))];
+	struct cmsghdr *cmsg;
+	unsigned char ctype;
 
 	if (nvme_tcp_recv_state(queue) != NVME_TCP_RECV_DATA)
 		return 0;
@@ -824,6 +845,8 @@ static int nvme_tcp_recv_data(struct nvme_tcp_queue *queue)
 		/* we can read only from what is left in this bio */
 		memset(&msg, 0, sizeof(msg));
 		msg.msg_iter = req->iter;
+		msg.msg_control = cbuf;
+		msg.msg_controllen = sizeof(cbuf);
 
 		ret = sock_recvmsg(queue->sock, &msg, 0);
 		if (ret <= 0) {
@@ -832,6 +855,18 @@ static int nvme_tcp_recv_data(struct nvme_tcp_queue *queue)
 				nvme_tcp_queue_id(queue), rq->tag);
 			return ret;
 		}
+		cmsg = (struct cmsghdr *)cbuf;
+		if (CMSG_OK(&msg, cmsg) &&
+		    cmsg->cmsg_level == SOL_TLS &&
+		    cmsg->cmsg_type == TLS_GET_RECORD_TYPE) {
+			ctype = *((unsigned char *)CMSG_DATA(cmsg));
+			if (ctype != TLS_RECORD_TYPE_DATA) {
+				dev_err(queue->ctrl->ctrl.device,
+					"queue %d unhandled TLS record %d\n",
+					nvme_tcp_queue_id(queue), ctype);
+				return -ENOTCONN;
+			}
+		}
 
 		queue->data_remaining -= ret;
 		if (queue->data_remaining)
@@ -861,7 +896,12 @@ static int nvme_tcp_recv_ddgst(struct nvme_tcp_queue *queue)
 	char *ddgst = (char *)&queue->recv_ddgst;
 	size_t recv_len = queue->ddgst_remaining;
 	off_t off = NVME_TCP_DIGEST_LENGTH - queue->ddgst_remaining;
+	char cbuf[CMSG_LEN(sizeof(char))] = {};
+	struct cmsghdr *cmsg;
+	unsigned char ctype;
 	struct msghdr msg = {
+		.msg_control = cbuf,
+		.msg_controllen = sizeof(cbuf),
 		.msg_flags = 0,
 	};
 	struct kvec iov = {
@@ -877,6 +917,18 @@ static int nvme_tcp_recv_ddgst(struct nvme_tcp_queue *queue)
 			     msg.msg_flags);
 	if (ret <= 0)
 		return ret;
+	cmsg = (struct cmsghdr *)cbuf;
+	if (CMSG_OK(&msg, cmsg) &&
+	    cmsg->cmsg_level == SOL_TLS &&
+	    cmsg->cmsg_type == TLS_GET_RECORD_TYPE) {
+		ctype = *((unsigned char *)CMSG_DATA(cmsg));
+		if (ctype != TLS_RECORD_TYPE_DATA) {
+			dev_err(queue->ctrl->ctrl.device,
+				"queue %d unhandled TLS record %d\n",
+				nvme_tcp_queue_id(queue), ctype);
+			return -ENOTCONN;
+		}
+	}
 
 	recv_len = ret;
 	queue->ddgst_remaining -= recv_len;
@@ -1372,6 +1424,9 @@ static int nvme_tcp_init_connection(struct nvme_tcp_queue *queue)
 {
 	struct nvme_tcp_icreq_pdu *icreq;
 	struct nvme_tcp_icresp_pdu *icresp;
+	char cbuf[CMSG_LEN(sizeof(char))] = {};
+	struct cmsghdr *cmsg;
+	unsigned char ctype;
 	struct msghdr msg = {};
 	struct kvec iov;
 	bool ctrl_hdgst, ctrl_ddgst;
@@ -1409,10 +1464,23 @@ static int nvme_tcp_init_connection(struct nvme_tcp_queue *queue)
 	memset(&msg, 0, sizeof(msg));
 	iov.iov_base = icresp;
 	iov.iov_len = sizeof(*icresp);
+	msg.msg_control = cbuf;
+	msg.msg_controllen = sizeof(cbuf);
 	ret = kernel_recvmsg(queue->sock, &msg, &iov, 1,
 			iov.iov_len, msg.msg_flags);
 	if (ret < 0)
 		goto free_icresp;
+	cmsg = (struct cmsghdr *)cbuf;
+	if (CMSG_OK(&msg, cmsg) &&
+	    cmsg->cmsg_level == SOL_TLS &&
+	    cmsg->cmsg_type == TLS_GET_RECORD_TYPE) {
+		ctype = *((unsigned char *)CMSG_DATA(cmsg));
+		if (ctype != TLS_RECORD_TYPE_DATA) {
+			pr_err("queue %d: unhandled TLS record %d\n",
+			       nvme_tcp_queue_id(queue), ctype);
+			return -ENOTCONN;
+		}
+	}
 
 	ret = -EINVAL;
 	if (icresp->hdr.type != nvme_tcp_icresp) {
-- 
2.35.3


Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADB8945B
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 12:44:11 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 327002000C;
	Tue, 21 Mar 2023 12:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679402638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zPkrDsJ3WC2tBejLMWGz7F0dKN3WaFfmO6AmVGL9ANw=;
	b=R4RkLewVDus0EGRzBWdcEKAfPhlIHqRgjuqrcvf9FuCVoJmQrRybJgNuiHLivjLpCqA6mz
	pWaOkQUDMJK+mxBwuFdxciFve7VAYVVg3UDbDcKHiryOyKcxYM4Lxh8jJ4+kUGyQ41GGDG
	3KcwGMrNsaMG43vTt4BouS2gOLIS+e0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679402638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zPkrDsJ3WC2tBejLMWGz7F0dKN3WaFfmO6AmVGL9ANw=;
	b=M9xlnkd1LVBhZfCzk27CBFe2mSbaQMUokDtJxJlFntroE0J2KGMztFflFx6swJlp2y5Hb4
	E3Y05GCPcWB3nGDg==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id 21E2D2C166;
	Tue, 21 Mar 2023 12:43:58 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 1E81951BEEB8; Tue, 21 Mar 2023 13:43:58 +0100 (CET)
From: Hannes Reinecke <hare@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <cel@kernel.org>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 18/18] nvmet-tcp: peek icreq before starting TLS
Date: Tue, 21 Mar 2023 13:43:25 +0100
Message-Id: <20230321124325.77385-19-hare@suse.de>
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

Incoming connection might be either 'normal' NVMe-TCP connections
starting with icreq or TLS handshakes. To ensure that 'normal'
connections can still be handled we need to peek the first packet
and only start TLS handshake if it's not an icreq.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/nvme/target/tcp.c | 60 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index a69647fb2c81..a328a303c2be 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -1105,6 +1105,61 @@ static inline bool nvmet_tcp_pdu_valid(u8 type)
 	return false;
 }
 
+static int nvmet_tcp_try_peek_pdu(struct nvmet_tcp_queue *queue)
+{
+	struct nvme_tcp_hdr *hdr = &queue->pdu.cmd.hdr;
+	int len;
+	struct kvec iov = {
+		.iov_base = (u8 *)&queue->pdu + queue->offset,
+		.iov_len = sizeof(struct nvme_tcp_hdr),
+	};
+	char cbuf[CMSG_LEN(sizeof(char))] = {};
+	unsigned char ctype;
+	struct cmsghdr *cmsg;
+	struct msghdr msg = {
+		.msg_control = cbuf,
+		.msg_controllen = sizeof(cbuf),
+		.msg_flags = MSG_PEEK,
+	};
+
+	len = kernel_recvmsg(queue->sock, &msg, &iov, 1,
+			iov.iov_len, msg.msg_flags);
+	if (unlikely(len < 0)) {
+		pr_debug("queue %d peek error %d\n",
+			 queue->idx, len);
+		return len;
+	}
+
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
+
+	if (len < sizeof(struct nvme_tcp_hdr)) {
+		pr_debug("queue %d short read, %d bytes missing\n",
+			 queue->idx, (int)iov.iov_len - len);
+		return -EAGAIN;
+	}
+	pr_debug("queue %d hdr type %d hlen %d plen %d size %d\n",
+		 queue->idx, hdr->type, hdr->hlen, hdr->plen,
+		 (int)sizeof(struct nvme_tcp_icreq_pdu));
+	if (hdr->type == nvme_tcp_icreq &&
+	    hdr->hlen == sizeof(struct nvme_tcp_icreq_pdu) &&
+	    hdr->plen == sizeof(struct nvme_tcp_icreq_pdu)) {
+		pr_debug("queue %d icreq detected\n",
+			 queue->idx);
+		return len;
+	}
+	return 0;
+}
+
 static int nvmet_tcp_try_recv_pdu(struct nvmet_tcp_queue *queue)
 {
 	struct nvme_tcp_hdr *hdr = &queue->pdu.cmd.hdr;
@@ -1879,8 +1934,9 @@ static void nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
 
 	if (queue->state == NVMET_TCP_Q_TLS_HANDSHAKE) {
 		nvmet_tcp_save_tls_callbacks(queue);
-		if (!nvmet_tcp_tls_handshake(queue))
-			return;
+		if (!nvmet_tcp_try_peek_pdu(queue))
+			if (!nvmet_tcp_tls_handshake(queue))
+				return;
 		nvmet_tcp_restore_tls_callbacks(queue);
 
 		/*
-- 
2.35.3


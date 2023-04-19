Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D236B2575
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 19 Apr 2023 06:57:25 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 5112D219B5;
	Wed, 19 Apr 2023 06:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681887438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nvvAXBJs3n+guiyCOm4/4aLPXykLvb8ZavSlM1BkaLg=;
	b=CZko+GtOmUERZ75W69A+JCh+fIGIyUoHLF0XdHhWW5MuVR1Q13aRR3dq3sHGIgZ7IamaTi
	tUr0LCxvm0RSqOiport9dZROQuOMSzjHrBarMR29O7B6Ww6kU50dP11Cb+cgbf/EF+7Bap
	VPFSSlWpzqkMm0ijfzhDHJIndo6ZFFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681887438;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nvvAXBJs3n+guiyCOm4/4aLPXykLvb8ZavSlM1BkaLg=;
	b=N1BaVTY9RsqxsQQZfqGGcylK8PSPcP50w/953XYQgDBqNypvjgt7IMk1jWYxCpOvUQ1l88
	/XnaJCAHD6/gGCCQ==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id 3E7972C15D;
	Wed, 19 Apr 2023 06:57:18 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 2E00451C26DF; Wed, 19 Apr 2023 08:57:18 +0200 (CEST)
From: Hannes Reinecke <hare@suse.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 12/17] nvme-tcp: control message handling for recvmsg()
Date: Wed, 19 Apr 2023 08:57:09 +0200
Message-Id: <20230419065714.52076-13-hare@suse.de>
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

kTLS is sending TLS ALERT messages as control messages for recvmsg().
As we can't do anything sensible with it just abort the connection
and let the userspace agent to a re-negotiation.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/host/tcp.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index d25695cf4e03..a3ac512fd1cc 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1362,6 +1362,11 @@ static int nvme_tcp_init_connection(struct nvme_tcp_queue *queue)
 {
 	struct nvme_tcp_icreq_pdu *icreq;
 	struct nvme_tcp_icresp_pdu *icresp;
+#ifdef CONFIG_NVME_TCP_TLS
+	char cbuf[CMSG_LEN(sizeof(char))] = {};
+	struct cmsghdr *cmsg;
+	unsigned char ctype;
+#endif
 	struct msghdr msg = {};
 	struct kvec iov;
 	bool ctrl_hdgst, ctrl_ddgst;
@@ -1399,11 +1404,27 @@ static int nvme_tcp_init_connection(struct nvme_tcp_queue *queue)
 	memset(&msg, 0, sizeof(msg));
 	iov.iov_base = icresp;
 	iov.iov_len = sizeof(*icresp);
+#ifdef CONFIG_NVME_TCP_TLS
+	msg.msg_control = cbuf;
+	msg.msg_controllen = sizeof(cbuf);
+#endif
 	ret = kernel_recvmsg(queue->sock, &msg, &iov, 1,
 			iov.iov_len, msg.msg_flags);
 	if (ret < 0)
 		goto free_icresp;
-
+#ifdef CONFIG_NVME_TCP_TLS
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
+#endif
 	ret = -EINVAL;
 	if (icresp->hdr.type != nvme_tcp_icresp) {
 		pr_err("queue %d: bad type returned %d\n",
-- 
2.35.3


Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E595846C
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 13:03:11 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 6837A21A87;
	Mon, 17 Apr 2023 13:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681736584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R7ZqHcDZyVE9eXz3iC9L/7kP8HAqtk3cN9u0gFCafXY=;
	b=JVlcmg1QK2ReceqwdX7YFiHB/0M6JcvVcraM3Q33YVAFFH7eVJ210aAjEiXW0T/SpYwR9B
	IOqqRFEFIf/FkjRfwqwmvt8YlWXSdQ8IdhlgbPjaKRmKQ8YFkxfLYYAajU5dGQs+amK4aB
	jhJ7LFH42STmLUlO8mvLOaTShdOEZc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681736584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R7ZqHcDZyVE9eXz3iC9L/7kP8HAqtk3cN9u0gFCafXY=;
	b=cHQk10q6Z09IHfyHr8nm8rMjZ0GA0FUbSM1LqQDLBTdKb3YYe10zgsXF4cs5FGYp3vO3LZ
	EOr1LqEezf0cNwDQ==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id 57FDC2C161;
	Mon, 17 Apr 2023 13:03:04 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 5449851C25B8; Mon, 17 Apr 2023 15:03:04 +0200 (CEST)
From: Hannes Reinecke <hare@suse.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 15/18] nvmet-tcp: allocate socket file
Date: Mon, 17 Apr 2023 15:02:59 +0200
Message-Id: <20230417130302.86274-16-hare@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230417130302.86274-1-hare@suse.de>
References: <20230417130302.86274-1-hare@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the TLS upcall we need to allocate a socket file such
that the userspace daemon is able to use the socket.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/nvme/target/tcp.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index ed98df72c76b..fc7a9fb56a83 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -122,6 +122,7 @@ struct nvmet_tcp_cmd {
 
 enum nvmet_tcp_queue_state {
 	NVMET_TCP_Q_CONNECTING,
+	NVMET_TCP_Q_TLS_HANDSHAKE,
 	NVMET_TCP_Q_LIVE,
 	NVMET_TCP_Q_DISCONNECTING,
 };
@@ -1481,12 +1482,12 @@ static void nvmet_tcp_release_queue_work(struct work_struct *w)
 	nvmet_sq_destroy(&queue->nvme_sq);
 	cancel_work_sync(&queue->io_work);
 	nvmet_tcp_free_cmd_data_in_buffers(queue);
-	sock_release(queue->sock);
+	/* ->sock will be released by fput() */
+	fput(queue->sock->file);
 	nvmet_tcp_free_cmds(queue);
 	if (queue->hdr_digest || queue->data_digest)
 		nvmet_tcp_free_crypto(queue);
 	ida_free(&nvmet_tcp_queue_ida, queue->idx);
-
 	page = virt_to_head_page(queue->pf_cache.va);
 	__page_frag_cache_drain(page, queue->pf_cache.pagecnt_bias);
 	kfree(queue);
@@ -1609,15 +1610,16 @@ static int nvmet_tcp_set_queue_sock(struct nvmet_tcp_queue *queue)
 	return ret;
 }
 
-static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
+static void nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
 		struct socket *newsock)
 {
 	struct nvmet_tcp_queue *queue;
+	struct file *sock_file;
 	int ret;
 
 	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
 	if (!queue)
-		return -ENOMEM;
+		return;
 
 	INIT_WORK(&queue->release_work, nvmet_tcp_release_queue_work);
 	INIT_WORK(&queue->io_work, nvmet_tcp_io_work);
@@ -1625,15 +1627,25 @@ static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
 	queue->port = port;
 	queue->nr_cmds = 0;
 	spin_lock_init(&queue->state_lock);
-	queue->state = NVMET_TCP_Q_CONNECTING;
+	if (queue->port->nport->disc_addr.tsas.tcp.sectype ==
+	    NVMF_TCP_SECTYPE_TLS13)
+		queue->state = NVMET_TCP_Q_TLS_HANDSHAKE;
+	else
+		queue->state = NVMET_TCP_Q_CONNECTING;
 	INIT_LIST_HEAD(&queue->free_list);
 	init_llist_head(&queue->resp_list);
 	INIT_LIST_HEAD(&queue->resp_send_list);
 
+	sock_file = sock_alloc_file(queue->sock, O_CLOEXEC, NULL);
+	if (IS_ERR(sock_file)) {
+		ret = PTR_ERR(sock_file);
+		goto out_free_queue;
+	}
+
 	queue->idx = ida_alloc(&nvmet_tcp_queue_ida, GFP_KERNEL);
 	if (queue->idx < 0) {
 		ret = queue->idx;
-		goto out_free_queue;
+		goto out_sock;
 	}
 
 	ret = nvmet_tcp_alloc_cmd(queue, &queue->connect);
@@ -1654,7 +1666,7 @@ static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
 	if (ret)
 		goto out_destroy_sq;
 
-	return 0;
+	return;
 out_destroy_sq:
 	mutex_lock(&nvmet_tcp_queue_mutex);
 	list_del_init(&queue->queue_list);
@@ -1664,9 +1676,11 @@ static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
 	nvmet_tcp_free_cmd(&queue->connect);
 out_ida_remove:
 	ida_free(&nvmet_tcp_queue_ida, queue->idx);
+out_sock:
+	fput(queue->sock->file);
 out_free_queue:
 	kfree(queue);
-	return ret;
+	pr_err("failed to allocate queue");
 }
 
 static void nvmet_tcp_accept_work(struct work_struct *w)
@@ -1683,11 +1697,7 @@ static void nvmet_tcp_accept_work(struct work_struct *w)
 				pr_warn("failed to accept err=%d\n", ret);
 			return;
 		}
-		ret = nvmet_tcp_alloc_queue(port, newsock);
-		if (ret) {
-			pr_err("failed to allocate queue\n");
-			sock_release(newsock);
-		}
+		nvmet_tcp_alloc_queue(port, newsock);
 	}
 }
 
-- 
2.35.3


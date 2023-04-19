Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B04A2568
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 19 Apr 2023 06:57:26 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 59F331FD8F;
	Wed, 19 Apr 2023 06:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681887438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4p/mdnGO4OCu0XM1mUMOCtq5Bxn0g+OIEIhYXaevD8=;
	b=LezfvrOUH4v+JQk7ezdaPsdnNck1bKeLu5q2ZteaNS3dt4JOQSeHA+uJDsnBHC6mGpAcc3
	rCwxm4NnzWs5gKs5iT4/x5kL+QlL60R13rNvQY4Nw+a8e5rcPFdiGeUraAwPNKtLkZR2HC
	jN34rNQJfS8kL5q28RhyKEhLlptqNhM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681887438;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4p/mdnGO4OCu0XM1mUMOCtq5Bxn0g+OIEIhYXaevD8=;
	b=Z0TiejH7PelLsbzLbts5ZEFse0S15wPckhfsV/M/O1w5F8UlbdhK7UNJvkCzJkh+XfPkcQ
	AKYNgppzlhUhQVCw==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id 4A5FC2C161;
	Wed, 19 Apr 2023 06:57:18 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 4717A51C26E5; Wed, 19 Apr 2023 08:57:18 +0200 (CEST)
From: Hannes Reinecke <hare@suse.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 15/17] nvmet-tcp: allocate socket file
Date: Wed, 19 Apr 2023 08:57:12 +0200
Message-Id: <20230419065714.52076-16-hare@suse.de>
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

For the TLS upcall we need to allocate a socket file such
that the userspace daemon is able to use the socket.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/nvme/target/tcp.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index ed98df72c76b..b53b1163e75b 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -1481,12 +1481,12 @@ static void nvmet_tcp_release_queue_work(struct work_struct *w)
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
@@ -1609,15 +1609,16 @@ static int nvmet_tcp_set_queue_sock(struct nvmet_tcp_queue *queue)
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
@@ -1630,10 +1631,16 @@ static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
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
@@ -1654,7 +1661,7 @@ static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
 	if (ret)
 		goto out_destroy_sq;
 
-	return 0;
+	return;
 out_destroy_sq:
 	mutex_lock(&nvmet_tcp_queue_mutex);
 	list_del_init(&queue->queue_list);
@@ -1664,9 +1671,11 @@ static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
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
@@ -1683,11 +1692,7 @@ static void nvmet_tcp_accept_work(struct work_struct *w)
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


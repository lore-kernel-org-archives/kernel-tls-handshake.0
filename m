Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11532595
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 13:59:57 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id C13D11FDE8;
	Wed, 29 Mar 2023 13:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680098389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yc73cb87to5yOKPMT4Ee0wUEWUPkoF7QiuTu0kGyZmM=;
	b=uhZNMbg4cVUO3cB6yCS1K6zqev5+Gst4TSCcQsDncZTQfMt48OSl9ExC7LWQP0L38QVOg3
	MUvitkh3jSPezitODVm6iTG7ABfYHNZGAaMQdZkavjkHQXyCU39+07lUG1aPpJl443EDpM
	16WdZlvmytdQkFqol6eYkrZUUm1jbQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680098389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yc73cb87to5yOKPMT4Ee0wUEWUPkoF7QiuTu0kGyZmM=;
	b=Y0t3ou0iGfAF2jgc86URnr2dWV1kDDjyqOkltwPXTJWsqRB8rn4GjA8qvHccCT9djNWmkk
	3y1RZaRNtCNX5sCA==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id A71312C175;
	Wed, 29 Mar 2023 13:59:49 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 9BC8751BF37E; Wed, 29 Mar 2023 15:59:49 +0200 (CEST)
From: Hannes Reinecke <hare@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 06/18] nvme/tcp: allocate socket file
Date: Wed, 29 Mar 2023 15:59:26 +0200
Message-Id: <20230329135938.46905-7-hare@suse.de>
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

When using the TLS upcall we need to allocate a socket file such
that the userspace daemon is able to use the socket.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/nvme/host/tcp.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 42c0598c31f2..fddf785aba74 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -115,6 +115,7 @@ enum nvme_tcp_recv_state {
 struct nvme_tcp_ctrl;
 struct nvme_tcp_queue {
 	struct socket		*sock;
+	struct file		*sock_file;
 	struct work_struct	io_work;
 	int			io_cpu;
 
@@ -1330,7 +1331,10 @@ static void nvme_tcp_free_queue(struct nvme_ctrl *nctrl, int qid)
 	}
 
 	noreclaim_flag = memalloc_noreclaim_save();
-	sock_release(queue->sock);
+	/* ->sock will be released by fput() */
+	fput(queue->sock_file);
+	queue->sock_file = NULL;
+	queue->sock = NULL;
 	memalloc_noreclaim_restore(noreclaim_flag);
 
 	kfree(queue->pdu);
@@ -1526,6 +1530,13 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid)
 		goto err_destroy_mutex;
 	}
 
+	queue->sock_file = sock_alloc_file(queue->sock, O_CLOEXEC, NULL);
+	if (IS_ERR(queue->sock_file)) {
+		sock_release(queue->sock);
+		ret = PTR_ERR(queue->sock_file);
+		queue->sock_file = NULL;
+		goto err_sock;
+	}
 	nvme_tcp_reclassify_socket(queue->sock);
 
 	/* Single syn retry */
@@ -1647,7 +1658,9 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid)
 	if (queue->hdr_digest || queue->data_digest)
 		nvme_tcp_free_crypto(queue);
 err_sock:
-	sock_release(queue->sock);
+	/* ->sock will be released by fput() */
+	fput(queue->sock_file);
+	queue->sock_file = NULL;
 	queue->sock = NULL;
 err_destroy_mutex:
 	mutex_destroy(&queue->send_mutex);
-- 
2.35.3


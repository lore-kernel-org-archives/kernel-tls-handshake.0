Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED739457
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 12:44:05 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id E9F0A20000;
	Tue, 21 Mar 2023 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679402637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XEMveR89p3JwC+5cnQbeIOWQT2OIO/0Es9Z5fC5uJOo=;
	b=LxEdfpHPM0PvKUTQNvfIJC0zyYy2pG6pWDEeHxc+QH23i0WRoo/8OXx7e6JfDb+skbX5L2
	6oWGcFp/jTpwY58FkhdXUJLOLaD1/IcItEanvfD4LrftkaATzpxK2/zilKgaPG21tZFVCJ
	pIIT319QyFabhiqmihiO0wi5IDXE8JY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679402637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XEMveR89p3JwC+5cnQbeIOWQT2OIO/0Es9Z5fC5uJOo=;
	b=TfX64V5NNtQ3iSKrsxistU7nYJc3uMxGtgyt73IypDtVKog7bouCs/iNT9D14MugYifUHQ
	jlptm95nGLpxl/Bg==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id D53682C149;
	Tue, 21 Mar 2023 12:43:57 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id CBEC951BEEA2; Tue, 21 Mar 2023 13:43:57 +0100 (CET)
From: Hannes Reinecke <hare@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <cel@kernel.org>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 07/18] nvme/tcp: allocate socket file
Date: Tue, 21 Mar 2023 13:43:14 +0100
Message-Id: <20230321124325.77385-8-hare@suse.de>
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

When using the TLS upcall we need to allocate a socket file such
that the userspace daemon is able to use the socket.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/nvme/host/tcp.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 0512eb289dcf..0438d42f4179 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -115,6 +115,7 @@ enum nvme_tcp_recv_state {
 struct nvme_tcp_ctrl;
 struct nvme_tcp_queue {
 	struct socket		*sock;
+	struct file		*sock_file;
 	struct work_struct	io_work;
 	int			io_cpu;
 
@@ -1330,7 +1331,12 @@ static void nvme_tcp_free_queue(struct nvme_ctrl *nctrl, int qid)
 	}
 
 	noreclaim_flag = memalloc_noreclaim_save();
-	sock_release(queue->sock);
+	if (queue->sock_file) {
+		fput(queue->sock_file);
+		queue->sock_file = NULL;
+		/* ->sock will be released by fput() */
+	} else
+		sock_release(queue->sock);
 	memalloc_noreclaim_restore(noreclaim_flag);
 
 	kfree(queue->pdu);
@@ -1526,6 +1532,12 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid)
 		goto err_destroy_mutex;
 	}
 
+	queue->sock_file = sock_alloc_file(queue->sock, O_CLOEXEC, NULL);
+	if (IS_ERR(queue->sock_file)) {
+		ret = PTR_ERR(queue->sock_file);
+		queue->sock_file = NULL;
+		goto err_sock;
+	}
 	nvme_tcp_reclassify_socket(queue->sock);
 
 	/* Single syn retry */
@@ -1647,7 +1659,12 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid)
 	if (queue->hdr_digest || queue->data_digest)
 		nvme_tcp_free_crypto(queue);
 err_sock:
-	sock_release(queue->sock);
+	if (queue->sock_file) {
+		fput(queue->sock_file);
+		queue->sock_file = NULL;
+		/* ->sock will be released by fput() */
+	} else
+		sock_release(queue->sock);
 	queue->sock = NULL;
 err_destroy_mutex:
 	mutex_destroy(&queue->send_mutex);
-- 
2.35.3


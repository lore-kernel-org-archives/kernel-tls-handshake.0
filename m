Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC75A9456
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 12:44:05 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id E865E21DB9;
	Tue, 21 Mar 2023 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679402637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EsOF8HvZ/8ryCWm8YG0FaAU0qb7VB8/kIjhTGTUCexE=;
	b=TtVhyIxJXbB6sWv8nTDCPAQNBs61Km+o6MBn6GCb3ZdceRjSLZCQV8txm+HgYD59yHseVA
	6KWQcUrC/T4s90lbtj2Xy1r8NggHyE21/fOY4iWzbGRbZbmBsjNC+01JPJQsM0WOqSRmgx
	tewySmdmF5+BJDghFIBxbtW1CFDCo/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679402637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EsOF8HvZ/8ryCWm8YG0FaAU0qb7VB8/kIjhTGTUCexE=;
	b=gghc/vrCKGLRjRGhQ+w+Wi7dW3+Ti5Kpk/iOVa1zw8xWCBeFmcBvQn467B2aexkFnRxWB/
	aX7yPg3yOR2Vg7Aw==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id D58FB2C14E;
	Tue, 21 Mar 2023 12:43:57 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id C546451BEEA0; Tue, 21 Mar 2023 13:43:57 +0100 (CET)
From: Hannes Reinecke <hare@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <cel@kernel.org>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 06/18] nvme-tcp: call 'queue->data_ready()' in nvme_tcp_data_ready()
Date: Tue, 21 Mar 2023 13:43:13 +0100
Message-Id: <20230321124325.77385-7-hare@suse.de>
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

Call the original data_ready() callback in nvme_tcp_data_ready()
to avoid a receive stall.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/nvme/host/tcp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 0e14b1b90855..0512eb289dcf 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -936,12 +936,14 @@ static void nvme_tcp_data_ready(struct sock *sk)
 
 	trace_sk_data_ready(sk);
 
-	read_lock_bh(&sk->sk_callback_lock);
-	queue = sk->sk_user_data;
+	rcu_read_lock_bh();
+	queue = rcu_dereference_sk_user_data(sk);
+	if (queue->data_ready)
+		queue->data_ready(sk);
 	if (likely(queue && queue->rd_enabled) &&
 	    !test_bit(NVME_TCP_Q_POLLING, &queue->flags))
 		queue_work_on(queue->io_cpu, nvme_tcp_wq, &queue->io_work);
-	read_unlock_bh(&sk->sk_callback_lock);
+	rcu_read_unlock_bh();
 }
 
 static void nvme_tcp_write_space(struct sock *sk)
-- 
2.35.3


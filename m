Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25F2378D7D
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  4 Mar 2026 05:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772602619; cv=none; b=rGhFO5Ispqor8MSLlJvz6G7hXD2C8wY02UPnKkUjKr4W620RP68zfceaXtMngx9FByOISciPQ30kPDG9w2mumToSPQhNvAk4lWdnF95aG+T6f1K1ZCYpWf2JuQzaOzFlKGQlTE7GUynadS7+fSzl2785zveY8NOzURNU8+zFOh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772602619; c=relaxed/simple;
	bh=VW3M4SYeAYi3H4yI1kcS4akTS2EsE5+h2XWp6OqZeYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTy4Rto5IB8oXaB50Dei9XMyVSAHkmJ861uIRtIQ5q5/VWlGKLX9Kp2pSiJ6X07U6b8Whjgcd2JCYyq6xE7VyqmAzsb8CVhzuHj6bKXs1GC+uTbmrOBy4Wqb3C3JFotcjBxNN9rE6B2mNETlNgAZ3IWjZbX2loYwWewzkd22hMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pudodkv2; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pudodkv2"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3598e7155bbso1927710a91.2
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 03 Mar 2026 21:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772602617; x=1773207417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTos+cQe/JmZkdeA5lh2ZAdOl1XgvXlmqs7be9JqOns=;
        b=Pudodkv2Zcniflx0I0vXf6kxgiVrXc4/IhC2gUd0EfgEHI5gZP/2PCsblp+KNzdY8C
         hwLxw82ILsGzRPt5vU37CqyA409RvS2Rb6VE1yc8/BIvSOsQKUciL8mBCmWT8hi8tMpN
         PvyuNMFrP2lO5e4TS3AT0DZqsOQpJZJF8lEmBE72o6ehO15EMG1SN1Of0T7WuufUD/NF
         x3FOP6KR/j/551KZhtfbgS6ztTI8VdfhZOvv0qDs+6fLnIOLFnnAgg6xcBW6YObtkges
         FBTJBOQRHjKfF5w8WgreOKzyUqY2uShY0uSvYm6JmfQ7muGR85XeBxzWTEcnrMbENlL2
         xLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772602617; x=1773207417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZTos+cQe/JmZkdeA5lh2ZAdOl1XgvXlmqs7be9JqOns=;
        b=sw5AJ+KQc4smst5/Kk1X41BN5xHzjSnYu9CS+D6JvE5nH6neA/cIiEmG1VtedzR1G0
         7m7IucK9cmssiV+s77QaXBJWBbJ3q4AP2nzFW/Sau1lkWQQCMGm42NwWcuwAvO6+mi7t
         PtLmp80a/zdg3IrtlmXbOPlL4+/hVSV11gGibjvW40w9OZkXTlCIEnQWTBNYW28KYd5M
         Ht+IzDqOQd4BNnG+3qSayNKOWG2yArt4tOewDElPhblkOunJrIKvvY0/JdJahRwiuf+g
         XRBEW0bw6EngyZixKwE7pJW3/GXe1MBFTUqbqMZcMnTGodsWeEtsdYQXc/77sqAMZX3D
         k4Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWszikQtkRGK0SruyA/SK1/uL9eLt532r6KGowgqsFElsK1jyD2rnjntBlke+lckg5UZ/+4kDqMinHARW48LmlRpak5XQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzzWsrzP3LB3LvBBS95OIGAqZu79ar+DoGhYvB0UL5z1ihNeyJG
	kV1GPyfAZOOA+yWbMZjF5ToUq0KWiehb1q2HqGehwDq5heGx60BsKXvC
X-Gm-Gg: ATEYQzzyZ6dFPjydfuzVNyB2bjd2SKAB7QWVBBlTD7Fqn31LqfRdF6fktlHjyLu2CbB
	hn2nhS1ADoez8xkfilXuT718+IU98nsMo2qGb56tYR9j7HJQAIrcl2MZI1PHuTqIUg5529FPMr9
	1MGwsKN53E2DOZhM1RsehLFhXejcM2nkjQlbOlQfee74AWW0MMHr0qO1jBGEOpV2CaunDRiSzx+
	H5O4W5UcOQ0HIxkhpFZERqECYlxHS0UsBkyIrz3/q70mAyTvJKbbx4ydE6JjWMpsRbp47DqHK2L
	VmoHYJUg4EoP3T8Xjt30GF2bIAVGxswJyJlrMwgRbKVEi1Lpu090kaEZLLSy0O+U7JBtHFYBWPR
	JT6dZcYRtiFhnYdrmil8GkGhHOwB1y+a22g3HNZvmKGxbP9fx6cB6WGqWfLOaMwVzEyUuyp87jZ
	AxwR0IIBxKtW8cIQ9LOO0XfUSoFugUzg0+ZFux9e3D3A==
X-Received: by 2002:a17:90b:3c46:b0:354:bf10:e6a5 with SMTP id 98e67ed59e1d1-359a69c2310mr979466a91.10.1772602617080;
        Tue, 03 Mar 2026 21:36:57 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c090bfdsm4020057a91.8.2026.03.03.21.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 21:36:56 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: chuck.lever@oracle.com,
	hare@kernel.org,
	kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-nfs@vger.kernel.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 5/5] nvmet-tcp: Support KeyUpdate
Date: Wed,  4 Mar 2026 15:35:00 +1000
Message-ID: <20260304053500.590630-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304053500.590630-1-alistair.francis@wdc.com>
References: <20260304053500.590630-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

If the nvmet_tcp_try_recv() function return EKEYEXPIRED or if we receive
a KeyUpdate handshake type then the underlying TLS keys need to be
updated.

If the NVMe Host (TLS client) initiates a KeyUpdate this patch will
allow the NVMe layer to process the KeyUpdate request and forward the
request to userspace. Userspace must then update the key to keep the
connection alive.

This patch allows us to handle the NVMe host sending a KeyUpdate
request without aborting the connection. At this time we don't support
initiating a KeyUpdate.

Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
v7:
 - No change
v6:
 - Simplify the nvmet_tls_key_expired() check
v5:
 - No change
v4:
 - Restructure code to avoid #ifdefs and forward declarations
 - Use a helper function for checking -EKEYEXPIRED
 - Remove all support for initiating KeyUpdate
 - Use helper function for restoring callbacks
v3:
 - Use a write lock for sk_user_data
 - Fix build with CONFIG_NVME_TARGET_TCP_TLS disabled
 - Remove unused variable
v2:
 - Use a helper function for KeyUpdates
 - Ensure keep alive timer is stopped
 - Wait for TLS KeyUpdate to complete

 drivers/nvme/target/tcp.c | 200 ++++++++++++++++++++++++++------------
 1 file changed, 139 insertions(+), 61 deletions(-)

diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index 7f1c651a52a4..d1937fe7a0d2 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -175,6 +175,7 @@ struct nvmet_tcp_queue {
 
 	/* TLS state */
 	key_serial_t		tls_pskid;
+	key_serial_t		handshake_session_id;
 	struct delayed_work	tls_handshake_tmo_work;
 
 	unsigned long           poll_end;
@@ -186,6 +187,8 @@ struct nvmet_tcp_queue {
 	struct sockaddr_storage	sockaddr_peer;
 	struct work_struct	release_work;
 
+	struct completion       tls_complete;
+
 	int			idx;
 	struct list_head	queue_list;
 
@@ -214,6 +217,10 @@ static struct workqueue_struct *nvmet_tcp_wq;
 static const struct nvmet_fabrics_ops nvmet_tcp_ops;
 static void nvmet_tcp_free_cmd(struct nvmet_tcp_cmd *c);
 static void nvmet_tcp_free_cmd_buffers(struct nvmet_tcp_cmd *cmd);
+#ifdef CONFIG_NVME_TARGET_TCP_TLS
+static int nvmet_tcp_tls_handshake(struct nvmet_tcp_queue *queue,
+				   enum handshake_key_update_type keyupdate);
+#endif
 
 static inline u16 nvmet_tcp_cmd_tag(struct nvmet_tcp_queue *queue,
 		struct nvmet_tcp_cmd *cmd)
@@ -848,6 +855,20 @@ static int nvmet_tcp_try_send_one(struct nvmet_tcp_queue *queue,
 	return 1;
 }
 
+#ifdef CONFIG_NVME_TARGET_TCP_TLS
+static bool nvmet_tls_key_expired(struct nvmet_tcp_queue *queue, int ret)
+{
+	return ret == -EKEYEXPIRED &&
+		queue->state != NVMET_TCP_Q_DISCONNECTING &&
+		queue->state != NVMET_TCP_Q_TLS_HANDSHAKE;
+}
+#else
+static bool nvmet_tls_key_expired(struct nvmet_tcp_queue *queue, int ret)
+{
+	return false;
+}
+#endif
+
 static int nvmet_tcp_try_send(struct nvmet_tcp_queue *queue,
 		int budget, int *sends)
 {
@@ -1134,6 +1155,103 @@ static inline bool nvmet_tcp_pdu_valid(u8 type)
 	return false;
 }
 
+static void nvmet_tcp_release_queue(struct kref *kref)
+{
+	struct nvmet_tcp_queue *queue =
+		container_of(kref, struct nvmet_tcp_queue, kref);
+
+	WARN_ON(queue->state != NVMET_TCP_Q_DISCONNECTING);
+	queue_work(nvmet_wq, &queue->release_work);
+}
+
+static void nvmet_tcp_schedule_release_queue(struct nvmet_tcp_queue *queue)
+{
+	spin_lock_bh(&queue->state_lock);
+	if (queue->state == NVMET_TCP_Q_TLS_HANDSHAKE) {
+		/* Socket closed during handshake */
+		tls_handshake_cancel(queue->sock->sk);
+	}
+	if (queue->state != NVMET_TCP_Q_DISCONNECTING) {
+		queue->state = NVMET_TCP_Q_DISCONNECTING;
+		kref_put(&queue->kref, nvmet_tcp_release_queue);
+	}
+	spin_unlock_bh(&queue->state_lock);
+}
+
+static void nvmet_tcp_restore_socket_callbacks(struct nvmet_tcp_queue *queue)
+{
+	struct socket *sock = queue->sock;
+
+	if (!queue->state_change)
+		return;
+
+	write_lock_bh(&sock->sk->sk_callback_lock);
+	sock->sk->sk_data_ready =  queue->data_ready;
+	sock->sk->sk_state_change = queue->state_change;
+	sock->sk->sk_write_space = queue->write_space;
+	sock->sk->sk_user_data = NULL;
+	write_unlock_bh(&sock->sk->sk_callback_lock);
+}
+
+#ifdef CONFIG_NVME_TARGET_TCP_TLS
+static void nvmet_tcp_tls_handshake_timeout(struct work_struct *w)
+{
+	struct nvmet_tcp_queue *queue = container_of(to_delayed_work(w),
+			struct nvmet_tcp_queue, tls_handshake_tmo_work);
+
+	pr_warn("queue %d: TLS handshake timeout\n", queue->idx);
+	/*
+	 * If tls_handshake_cancel() fails we've lost the race with
+	 * nvmet_tcp_tls_handshake_done() */
+	if (!tls_handshake_cancel(queue->sock->sk))
+		return;
+	spin_lock_bh(&queue->state_lock);
+	if (WARN_ON(queue->state != NVMET_TCP_Q_TLS_HANDSHAKE)) {
+		spin_unlock_bh(&queue->state_lock);
+		return;
+	}
+	queue->state = NVMET_TCP_Q_FAILED;
+	spin_unlock_bh(&queue->state_lock);
+	nvmet_tcp_schedule_release_queue(queue);
+	kref_put(&queue->kref, nvmet_tcp_release_queue);
+}
+
+static int update_tls_keys(struct nvmet_tcp_queue *queue)
+{
+	int ret;
+
+	cancel_work(&queue->io_work);
+	queue->state = NVMET_TCP_Q_TLS_HANDSHAKE;
+
+	nvmet_tcp_restore_socket_callbacks(queue);
+
+	INIT_DELAYED_WORK(&queue->tls_handshake_tmo_work,
+			  nvmet_tcp_tls_handshake_timeout);
+
+	ret = nvmet_tcp_tls_handshake(queue, HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED);
+
+	if (ret < 0)
+		return ret;
+
+	ret = wait_for_completion_interruptible_timeout(&queue->tls_complete,
+							10 * HZ);
+
+	if (ret <= 0) {
+		tls_handshake_cancel(queue->sock->sk);
+		return ret;
+	}
+
+	queue->state = NVMET_TCP_Q_LIVE;
+
+	return 0;
+}
+#else
+static int update_tls_keys(struct nvmet_tcp_queue *queue)
+{
+	return -EPFNOSUPPORT;
+}
+#endif
+
 static int nvmet_tcp_tls_record_ok(struct nvmet_tcp_queue *queue,
 		struct msghdr *msg, char *cbuf)
 {
@@ -1159,6 +1277,9 @@ static int nvmet_tcp_tls_record_ok(struct nvmet_tcp_queue *queue,
 			ret = -EAGAIN;
 		}
 		break;
+	case TLS_RECORD_TYPE_HANDSHAKE:
+		ret = -EAGAIN;
+		break;
 	default:
 		/* discard this record type */
 		pr_err("queue %d: TLS record %d unhandled\n",
@@ -1368,6 +1489,8 @@ static int nvmet_tcp_try_recv(struct nvmet_tcp_queue *queue,
 	for (i = 0; i < budget; i++) {
 		ret = nvmet_tcp_try_recv_one(queue);
 		if (unlikely(ret < 0)) {
+			if (nvmet_tls_key_expired(queue, ret))
+					goto done;
 			nvmet_tcp_socket_error(queue, ret);
 			goto done;
 		} else if (ret == 0) {
@@ -1379,29 +1502,6 @@ static int nvmet_tcp_try_recv(struct nvmet_tcp_queue *queue,
 	return ret;
 }
 
-static void nvmet_tcp_release_queue(struct kref *kref)
-{
-	struct nvmet_tcp_queue *queue =
-		container_of(kref, struct nvmet_tcp_queue, kref);
-
-	WARN_ON(queue->state != NVMET_TCP_Q_DISCONNECTING);
-	queue_work(nvmet_wq, &queue->release_work);
-}
-
-static void nvmet_tcp_schedule_release_queue(struct nvmet_tcp_queue *queue)
-{
-	spin_lock_bh(&queue->state_lock);
-	if (queue->state == NVMET_TCP_Q_TLS_HANDSHAKE) {
-		/* Socket closed during handshake */
-		tls_handshake_cancel(queue->sock->sk);
-	}
-	if (queue->state != NVMET_TCP_Q_DISCONNECTING) {
-		queue->state = NVMET_TCP_Q_DISCONNECTING;
-		kref_put(&queue->kref, nvmet_tcp_release_queue);
-	}
-	spin_unlock_bh(&queue->state_lock);
-}
-
 static inline void nvmet_tcp_arm_queue_deadline(struct nvmet_tcp_queue *queue)
 {
 	queue->poll_end = jiffies + usecs_to_jiffies(idle_poll_period_usecs);
@@ -1432,8 +1532,12 @@ static void nvmet_tcp_io_work(struct work_struct *w)
 		ret = nvmet_tcp_try_recv(queue, NVMET_TCP_RECV_BUDGET, &ops);
 		if (ret > 0)
 			pending = true;
-		else if (ret < 0)
+		else if (ret < 0) {
+			if (ret == -EKEYEXPIRED)
+				break;
+
 			return;
+		}
 
 		ret = nvmet_tcp_try_send(queue, NVMET_TCP_SEND_BUDGET, &ops);
 		if (ret > 0)
@@ -1443,6 +1547,11 @@ static void nvmet_tcp_io_work(struct work_struct *w)
 
 	} while (pending && ops < NVMET_TCP_IO_WORK_BUDGET);
 
+	if (ret == -EKEYEXPIRED) {
+		update_tls_keys(queue);
+		pending = true;
+	}
+
 	/*
 	 * Requeue the worker if idle deadline period is in progress or any
 	 * ops activity was recorded during the do-while loop above.
@@ -1545,21 +1654,6 @@ static void nvmet_tcp_free_cmds(struct nvmet_tcp_queue *queue)
 	kvfree(cmds);
 }
 
-static void nvmet_tcp_restore_socket_callbacks(struct nvmet_tcp_queue *queue)
-{
-	struct socket *sock = queue->sock;
-
-	if (!queue->state_change)
-		return;
-
-	write_lock_bh(&sock->sk->sk_callback_lock);
-	sock->sk->sk_data_ready =  queue->data_ready;
-	sock->sk->sk_state_change = queue->state_change;
-	sock->sk->sk_write_space = queue->write_space;
-	sock->sk->sk_user_data = NULL;
-	write_unlock_bh(&sock->sk->sk_callback_lock);
-}
-
 static void nvmet_tcp_uninit_data_in_cmds(struct nvmet_tcp_queue *queue)
 {
 	struct nvmet_tcp_cmd *cmd = queue->cmds;
@@ -1822,6 +1916,7 @@ static void nvmet_tcp_tls_handshake_done(void *data, int status,
 	}
 	if (!status) {
 		queue->tls_pskid = peerid;
+		queue->handshake_session_id = handshake_session_id;
 		queue->state = NVMET_TCP_Q_CONNECTING;
 	} else
 		queue->state = NVMET_TCP_Q_FAILED;
@@ -1837,28 +1932,7 @@ static void nvmet_tcp_tls_handshake_done(void *data, int status,
 	else
 		nvmet_tcp_set_queue_sock(queue);
 	kref_put(&queue->kref, nvmet_tcp_release_queue);
-}
-
-static void nvmet_tcp_tls_handshake_timeout(struct work_struct *w)
-{
-	struct nvmet_tcp_queue *queue = container_of(to_delayed_work(w),
-			struct nvmet_tcp_queue, tls_handshake_tmo_work);
-
-	pr_warn("queue %d: TLS handshake timeout\n", queue->idx);
-	/*
-	 * If tls_handshake_cancel() fails we've lost the race with
-	 * nvmet_tcp_tls_handshake_done() */
-	if (!tls_handshake_cancel(queue->sock->sk))
-		return;
-	spin_lock_bh(&queue->state_lock);
-	if (WARN_ON(queue->state != NVMET_TCP_Q_TLS_HANDSHAKE)) {
-		spin_unlock_bh(&queue->state_lock);
-		return;
-	}
-	queue->state = NVMET_TCP_Q_FAILED;
-	spin_unlock_bh(&queue->state_lock);
-	nvmet_tcp_schedule_release_queue(queue);
-	kref_put(&queue->kref, nvmet_tcp_release_queue);
+	complete(&queue->tls_complete);
 }
 
 static int nvmet_tcp_tls_handshake(struct nvmet_tcp_queue *queue,
@@ -1880,11 +1954,15 @@ static int nvmet_tcp_tls_handshake(struct nvmet_tcp_queue *queue,
 	args.ta_data = queue;
 	args.ta_keyring = key_serial(queue->port->nport->keyring);
 	args.ta_timeout_ms = tls_handshake_timeout * 1000;
+	args.ta_handshake_session_id = queue->handshake_session_id;
+
+	init_completion(&queue->tls_complete);
 
 	if (keyupdate == HANDSHAKE_KEY_UPDATE_TYPE_UNSPEC)
 		ret = tls_server_hello_psk(&args, GFP_KERNEL);
 	else
 		ret = tls_server_keyupdate_psk(&args, GFP_KERNEL, keyupdate);
+
 	if (ret) {
 		kref_put(&queue->kref, nvmet_tcp_release_queue);
 		pr_err("failed to start TLS, err=%d\n", ret);
-- 
2.53.0


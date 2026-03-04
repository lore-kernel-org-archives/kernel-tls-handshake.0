Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF23E378D86
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  4 Mar 2026 05:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772602612; cv=none; b=XSDTxdmNkyCrZLk2Ibhmoi9DJIOsZheuHApjAWD8nKNt3K6bcnTdwkcCdKccvHXURQ4WTOYeU3dq9jgCX0D4islhWnumYoRbfJda88EORX/sICCGwAzl12O2AiNk6AgbK8RSHso0FmtbtGU4d4lt5aXp6h4v9fHX4JwIrDy3nFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772602612; c=relaxed/simple;
	bh=X6tX6MsfjpCCm5XWJnWLuYwr3D2OjljkcPDWiXIpOAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fs6GtMSD2aZdHz6/5u+tBOTcrM3UiNc59ilRIZ8xBq4FRg6Fr+0UsnEUiwfzCGK9veJxkjvZNT2D/iDK6eazUbFfRvRUnLGBfexx0TzjNYKxI616SAqav4NqWm7J2C6OrIQWShClN7G0QRyWF63NMtjzgZY+F+S+SSqmjtnp0xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEpSUOii; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEpSUOii"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3598c008455so1777311a91.3
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 03 Mar 2026 21:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772602611; x=1773207411; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNcMxZGmsNob2hi70jSfSua0A2NVCjnuBqG6KRIu95c=;
        b=fEpSUOiicEGRXTDNXYg+qlMPwYViEIsQHkH4bAPRM/cu10btf5EAk3ivOZUi9lHlh4
         pbwQubirutgFs+CCMM8TR1fcBfX7yDt+wgFTJu7+k/ulhOWgjA5FN7i5EUd4yEldepWi
         Ljakf4rKp3HvP4fCG9lAQjeLgQgf9OlwmmsYHKN20Qdh/tn67KJ3o0GD7d2nXzGUQGoD
         OMLb7a+3b3z6oy3vJp+kWNRewoHKudfsQa1e0rU47+uO9B+hIZ7ttNWrO1xt+rW3nwyh
         ev04bnnQioFiX7h+9th+Uw8K8U53QCOUovGZi21Ioz0ohnPI6jaeACIueh/pcGr2QggD
         1hpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772602611; x=1773207411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rNcMxZGmsNob2hi70jSfSua0A2NVCjnuBqG6KRIu95c=;
        b=PDQaGz3IR9d/UtNwItLeQhqft4mC3gbnkd2Sa+wpylwAmZVvYHGMwFH8DeCg/bi4NA
         ScZx0G1mD+GLcUmAZjC4lKhNVJ9+9T/WTNiJeCjGin1mXFmhu/aOQKgSrabVzXhHQOf9
         U6LUvmX8PoEtt2WOxx5RkhQ/ASd1LREOI6QMjbXaLr3oDzyaCKGDgIEmyhctntgMcnpu
         ogXAJ1Foeow+/i6EQbG6Yg/GKLl2L7Xrew8W5RTis8Y5LoiVhWukDG0vfGoZ1u95Yt9H
         ILu5BCVyEhyRKiiCqutoTaul8SGYgPciMDF6f82gidalbo63UKN42fM4uwsMtpWX70KT
         xQSA==
X-Forwarded-Encrypted: i=1; AJvYcCXbQMFpw4p7N5Gd6AK+/H57iKqT6UchWuTH28PXV34ungdXJERWFuhGjkRJ9w5VM9yoaevx//uZgwuIUKDVP1TYDLs/8A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/WY2MekR7fGqnJgMYrdHXqOzhZuPpsCUekNW7Y5zosJhbUqmU
	+itY5GnRIPjOZVgvWB5qYS3Wsu9D8ClqjYuYN+w4HoAGC9GD1kvm2CcC
X-Gm-Gg: ATEYQzz69oFeQo9LozwxjI2zzWUZK2bZsS5X9bz+qZ54ElztAbApLHjF+Ywe1qAExnf
	gNAxbBTSCEjj4z4MtJBnbGTwHmj1qj6BodpYq6ii4iPSrIIe+dWfs1KEgVU/p9QhVwXnXV/tdG/
	qJgo2TMacQ2kZAQYNyopVAwklItHK6pWRjS5DP9iCux3bZoUSP8wHqmfxuEa+aD7Z/bbNMzWL+M
	DRr5mchvT8Yr0tIkF1SN+QODlSbrTRTLxI12LP4E8H5tkJ/9k82vtM7WwWVTFp2GKXCFmdjNAiF
	z1JUcM7F9LYE6YNDiFFQ1ydOXvRdKMcYpOEZNU/GYrGfroDtfRx6JO2mtWbh+RVLD/n95uz3fjB
	+h7TRlaED22fDBvuNCbxhZwWVrAd2iTHvQU9L8WHsUFbzLw5daXHWIHLvRphQ8AjBs17KPgu478
	ApNVs1ll8092rsF4LQIHtwrJzazAE2rdDWNF8bL9RxQTLy5tZUTh9Y
X-Received: by 2002:a17:90b:3d83:b0:354:c629:efb2 with SMTP id 98e67ed59e1d1-359a6a563ddmr1057766a91.24.1772602611058;
        Tue, 03 Mar 2026 21:36:51 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c090bfdsm4020057a91.8.2026.03.03.21.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 21:36:50 -0800 (PST)
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
Subject: [PATCH v7 4/5] nvme-tcp: Support KeyUpdate
Date: Wed,  4 Mar 2026 15:34:59 +1000
Message-ID: <20260304053500.590630-5-alistair.francis@wdc.com>
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

If the nvme_tcp_try_send() or nvme_tcp_try_recv() functions return
EKEYEXPIRED then the underlying TLS keys need to be updated. This occurs
on an KeyUpdate event as described in RFC8446
https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3.

If the NVMe Target (TLS server) initiates a KeyUpdate this patch will
allow the NVMe layer to process the KeyUpdate request and forward the
request to userspace. Userspace must then update the key to keep the
connection alive.

This patch allows us to handle the NVMe target sending a KeyUpdate
request without aborting the connection. At this time we don't support
initiating a KeyUpdate.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v7:
 - Use read_sock_cmsg instead of recvmsg() to handle KeyUpdate
v6:
 - Don't use `struct nvme_tcp_hdr` to determine TLS_HANDSHAKE_KEYUPDATE,
   instead look at the cmsg fields.
 - Don't flush async_event_work
v5:
 - Cleanup code flow
 - Check for MSG_CTRUNC in the msg_flags return from recvmsg
   and use that to determine if it's a control message
v4:
 - Remove all support for initiating KeyUpdate
 - Don't call cancel_work() when updating keys
v3:
 - Don't cancel existing handshake requests
v2:
 - Don't change the state
 - Use a helper function for KeyUpdates
 - Continue sending in nvme_tcp_send_all() after a KeyUpdate
 - Remove command message using recvmsg

 drivers/nvme/host/tcp.c | 59 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 8b6172dd1c0f..ade11d2ac9ef 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -171,6 +171,7 @@ struct nvme_tcp_queue {
 	bool			tls_enabled;
 	u32			rcv_crc;
 	u32			snd_crc;
+	key_serial_t		handshake_session_id;
 	__le32			exp_ddgst;
 	__le32			recv_ddgst;
 	struct completion       tls_complete;
@@ -1361,6 +1362,59 @@ static int nvme_tcp_try_send(struct nvme_tcp_queue *queue)
 	return ret;
 }
 
+static void update_tls_keys(struct nvme_tcp_queue *queue)
+{
+	int qid = nvme_tcp_queue_id(queue);
+	int ret;
+
+	dev_dbg(queue->ctrl->ctrl.device,
+		"updating key for queue %d\n", qid);
+
+	ret = nvme_tcp_start_tls(&(queue->ctrl->ctrl),
+				 queue, queue->ctrl->ctrl.tls_pskid,
+				 HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED);
+
+	if (ret < 0) {
+		dev_err(queue->ctrl->ctrl.device,
+			"failed to update the keys %d\n", ret);
+		nvme_tcp_fail_request(queue->request);
+	}
+}
+
+static int nvme_tcp_recv_cmsg(read_descriptor_t *desc,
+			      struct sk_buff *skb,
+			      unsigned int offset, size_t len,
+			      u8 content_type)
+{
+	struct nvme_tcp_queue *queue = desc->arg.data;
+	struct socket *sock = queue->sock;
+	struct sock *sk = sock->sk;
+
+	switch (content_type) {
+	case TLS_RECORD_TYPE_HANDSHAKE:
+		if (len == 5) {
+			u8 header[5];
+
+			if (!skb_copy_bits(skb, offset, header,
+					   sizeof(header))) {
+				if (header[0] == TLS_HANDSHAKE_KEYUPDATE) {
+					dev_err(queue->ctrl->ctrl.device, "KeyUpdate message\n");
+					release_sock(sk);
+					update_tls_keys(queue);
+					lock_sock(sk);
+					return 0;
+				}
+			}
+		}
+
+		break;
+	default:
+		break;
+	}
+
+	return -EAGAIN;
+}
+
 static int nvme_tcp_try_recv(struct nvme_tcp_queue *queue)
 {
 	struct socket *sock = queue->sock;
@@ -1372,7 +1426,8 @@ static int nvme_tcp_try_recv(struct nvme_tcp_queue *queue)
 	rd_desc.count = 1;
 	lock_sock(sk);
 	queue->nr_cqe = 0;
-	consumed = sock->ops->read_sock(sk, &rd_desc, nvme_tcp_recv_skb);
+	consumed = sock->ops->read_sock_cmsg(sk, &rd_desc, nvme_tcp_recv_skb,
+					     nvme_tcp_recv_cmsg);
 	release_sock(sk);
 	return consumed == -EAGAIN ? 0 : consumed;
 }
@@ -1708,6 +1763,7 @@ static void nvme_tcp_tls_done(void *data, int status, key_serial_t pskid,
 			ctrl->ctrl.tls_pskid = key_serial(tls_key);
 		key_put(tls_key);
 		queue->tls_err = 0;
+		queue->handshake_session_id = handshake_session_id;
 	}
 
 out_complete:
@@ -1737,6 +1793,7 @@ static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
 		keyring = key_serial(nctrl->opts->keyring);
 	args.ta_keyring = keyring;
 	args.ta_timeout_ms = tls_handshake_timeout * 1000;
+	args.ta_handshake_session_id = queue->handshake_session_id;
 	queue->tls_err = -EOPNOTSUPP;
 	init_completion(&queue->tls_complete);
 	if (keyupdate == HANDSHAKE_KEY_UPDATE_TYPE_UNSPEC)
-- 
2.53.0

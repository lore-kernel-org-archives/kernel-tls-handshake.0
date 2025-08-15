Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CD7287513
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 15 Aug 2025 05:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755234188; cv=none; b=QPkOw1GCFNWPM7U+aG9raMCFxh+qcPi9+z/m8a8YpHy3yZoXvmM57t3cuOEatHSNvSbECDKOgIJu8GoSPn1gL9UOyVeysW3YaNt0hD2tBsYhXdadti4FLtEkDJSmp1alz3I+XKyaOslGbk/vClnc6biKuCqBhZyzuzoMOPQ6zJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755234188; c=relaxed/simple;
	bh=dCh75Wq3hVwvqLlJBVYMaqoz++i9yIWJwQlUb56DQME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mMukP/bbCT/TFOURIo1r1iMNxE4gWaN+MDRAECvmBFrEF0p6ZeGTYUBkqXKqbvxl73v9rwEWQwdsrzaA5BV1PpKIQzaAu02CuiNcLrfXsa5UutfEZVjKA5TMy3lKqsWe3E5jsTTqAZh9SwgeJJ46FX++TDX+CFudWbUSMnalDrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQKtFr6A; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQKtFr6A"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e2e60433eso1347580b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 14 Aug 2025 22:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755234186; x=1755838986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gb3D+2Y2P+VKDJSul4hdca7kG6zpe2ME/ptwlX9aheU=;
        b=cQKtFr6Aaj6Dmm6A7P2+nR7d6avRFWlCRKfyx5vX1RDliOGn/dPELJylYtWhywFddf
         kz5IrzFOmCDQGyt7BXRIHOCgrOOGrfhq4B6XiP1LnwzXiehHr5a32SekGjy3eL+4ZwDR
         oVHe8oY+ADSUzRsM1qcnhmHy/j+4/7+osovfh0WlwPvtNbTBFrCHoRmQxzpk7fV7zFzJ
         1wdwDkvhRUNbm9wh3SaIJTqH3OxtI9Pg/TFhnlxF2kDVc8GFic0vS0Zw4h4X1LcYdtTS
         3eDhHtfboL6U5V228G1u3FvrL/V10zCVi5WoLkci1+Zfjsrmr72Omf0bN/jgGu4+Y07w
         VR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755234186; x=1755838986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gb3D+2Y2P+VKDJSul4hdca7kG6zpe2ME/ptwlX9aheU=;
        b=NXxhnyzPpxLIsVjVMfjfqkFcpiAEsU7XK3RgP0YLUsnJHJKs261cljMVpJkNoFEtGo
         xdLDsZfLzcFJ2gPy/ET8TGWY5t1wWngvTchiHOczOy3sibX1wbSk6J1wRGHFxUgAJg+l
         JRKUlHPD6BFexzKNB2gEm/UMwGrRShK9FUQj395OyKFlTjURM4m6UznRPRQL4hENu46z
         sT9miQ4qkxU059fiifW4DbcDxH0Xy9CRY1cnz3tmNfu8UuGL2EDRckvWkoBqn7cVdj2P
         U8KkR+XYCSjmpFOXj+KMyCHlOQSfdxq3k5X8UGs+GDZQRzdO0m5tLSlPcZufa9dNtJGu
         k1dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZsfDVzM5UTGSMmFz/e+hnlEf/8UInYpBVcmzWWM7OrJULtCL4Xs1Pld9/At9XO9STzZ+NYM2qy3hCmwMapj3xCyP9pQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm/J7/NmUXRCob7+gXCNWIj6MUuksnReLMX/sybEyVwuyPYsNC
	WUDUeznW7Q/jBfmugxQ16PK7pGHydVI49bxbvS4XFL+9wRM46kfsfnj7
X-Gm-Gg: ASbGncu1r+usK/g9njsnEShKWZXVwmjjSuNDAScJcugGVcT41VDY7ZQa+LhcwbKpgAG
	DZcfIxMC2VkxmFsHd8GNucg7RLJWK1ZDjlALtN8C+FiD1rmu2GqdnMZQQ+chlbXvkd/qC/WhAD8
	iM76RQ6S8lauORo7U73kb58egWbdc0VEa4eLdWmwefcRiQg9qWaxCWXaQ/xXiupPdIup6YKV3VE
	DgGiibJayrgpUBoCpGjjR5EFUQ+I1OiK5pQy1koBLSJyaE7csU/sLygb5dDd8l0Y4Fzw28Ta2qp
	gXLxCInl+ADH2xuDi+Kyd/quTA/fzGZIqJt9G9K6l0E+sL5Ww+8FDbrPvHgtDxJ9NINaq3lgLHj
	WHE3Z9NmGxCP5zeCHP5DDDyAaaBRUY5/YD4DfjpIdk/3U8a3XaGMyL5tEKARClEsLy0xYTgBjga
	RINZ0h5d/8v0A+eptCpOd74VeHf5I=
X-Google-Smtp-Source: AGHT+IFCN3/82QbT1VacGPyrRYv9/F/PPZnJ8Gac/QiInZA+wk35khY28zaLI33nJg2szq2eps4NcA==
X-Received: by 2002:a17:902:e948:b0:242:3855:c77a with SMTP id d9443c01a7336-2446d8c6388mr12741515ad.34.1755234185896;
        Thu, 14 Aug 2025 22:03:05 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53c6e1sm5128645ad.115.2025.08.14.22.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:03:05 -0700 (PDT)
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
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 8/8] nvmet-tcp: Support KeyUpdate
Date: Fri, 15 Aug 2025 15:02:10 +1000
Message-ID: <20250815050210.1518439-9-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815050210.1518439-1-alistair.francis@wdc.com>
References: <20250815050210.1518439-1-alistair.francis@wdc.com>
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
---
 drivers/nvme/target/tcp.c | 59 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index 5eaab9c858be..1dc6fa28d08c 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -175,6 +175,7 @@ struct nvmet_tcp_queue {
 
 	/* TLS state */
 	key_serial_t		tls_pskid;
+	key_serial_t		user_key_serial;
 	struct delayed_work	tls_handshake_tmo_work;
 
 	unsigned long           poll_end;
@@ -836,6 +837,11 @@ static int nvmet_tcp_try_send_one(struct nvmet_tcp_queue *queue,
 	return 1;
 }
 
+#ifdef CONFIG_NVME_TARGET_TCP_TLS
+static int nvmet_tcp_try_peek_pdu(struct nvmet_tcp_queue *queue);
+static void nvmet_tcp_tls_handshake_timeout(struct work_struct *w);
+#endif
+
 static int nvmet_tcp_try_send(struct nvmet_tcp_queue *queue,
 		int budget, int *sends)
 {
@@ -1114,7 +1120,7 @@ static int nvmet_tcp_tls_record_ok(struct nvmet_tcp_queue *queue,
 		struct msghdr *msg, char *cbuf)
 {
 	struct cmsghdr *cmsg = (struct cmsghdr *)cbuf;
-	u8 ctype, level, description;
+	u8 ctype, htype, level, description;
 	int ret = 0;
 
 	ctype = tls_get_record_type(queue->sock->sk, cmsg);
@@ -1135,6 +1141,29 @@ static int nvmet_tcp_tls_record_ok(struct nvmet_tcp_queue *queue,
 			ret = -EAGAIN;
 		}
 		break;
+	case TLS_RECORD_TYPE_HANDSHAKE:
+		htype = tls_get_handshake_type(queue->sock->sk, cmsg);
+
+#ifdef CONFIG_NVME_TARGET_TCP_TLS
+		if (htype == TLS_HANDSHAKE_TYPE_KEY_UPDATE) {
+			tls_clear_err(queue->sock->sk);
+			handshake_req_cancel(queue->sock->sk);
+			handshake_sk_destruct_req(queue->sock->sk);
+			queue->state = NVMET_TCP_Q_TLS_HANDSHAKE;
+
+			/* Restore the default callbacks before starting upcall */
+			read_lock_bh(&queue->sock->sk->sk_callback_lock);
+			queue->sock->sk->sk_user_data = NULL;
+			queue->sock->sk->sk_data_ready = queue->data_ready;
+			read_unlock_bh(&queue->sock->sk->sk_callback_lock);
+
+			return nvmet_tcp_tls_handshake(queue, HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED);
+		}
+#endif
+		pr_err("queue %d: TLS handshake %d unhandled\n",
+		       queue->idx, htype);
+		ret = -EAGAIN;
+		break;
 	default:
 		/* discard this record type */
 		pr_err("queue %d: TLS record %d unhandled\n",
@@ -1344,7 +1373,29 @@ static int nvmet_tcp_try_recv(struct nvmet_tcp_queue *queue,
 	for (i = 0; i < budget; i++) {
 		ret = nvmet_tcp_try_recv_one(queue);
 		if (unlikely(ret < 0)) {
-			nvmet_tcp_socket_error(queue, ret);
+			if (ret == -EKEYEXPIRED &&
+				queue->state != NVMET_TCP_Q_DISCONNECTING &&
+				queue->state != NVMET_TCP_Q_TLS_HANDSHAKE) {
+#ifdef CONFIG_NVME_TARGET_TCP_TLS
+				tls_clear_err(queue->sock->sk);
+				handshake_req_cancel(queue->sock->sk);
+				handshake_sk_destruct_req(queue->sock->sk);
+				queue->state = NVMET_TCP_Q_TLS_HANDSHAKE;
+
+				/* Restore the default callbacks before starting upcall */
+				read_lock_bh(&queue->sock->sk->sk_callback_lock);
+				queue->sock->sk->sk_user_data = NULL;
+				queue->sock->sk->sk_data_ready = queue->data_ready;
+				read_unlock_bh(&queue->sock->sk->sk_callback_lock);
+
+				ret = nvmet_tcp_tls_handshake(queue,
+							      HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED);
+#else
+				nvmet_tcp_socket_error(queue, ret);
+#endif
+			} else {
+				nvmet_tcp_socket_error(queue, ret);
+			}
 			goto done;
 		} else if (ret == 0) {
 			break;
@@ -1798,6 +1849,7 @@ static void nvmet_tcp_tls_handshake_done(void *data, int status,
 	}
 	if (!status) {
 		queue->tls_pskid = peerid;
+		queue->user_key_serial = user_key_serial;
 		queue->state = NVMET_TCP_Q_CONNECTING;
 	} else
 		queue->state = NVMET_TCP_Q_FAILED;
@@ -1843,7 +1895,7 @@ static int nvmet_tcp_tls_handshake(struct nvmet_tcp_queue *queue,
 	int ret = -EOPNOTSUPP;
 	struct tls_handshake_args args;
 
-	if (queue->state != NVMET_TCP_Q_TLS_HANDSHAKE) {
+	if (queue->state != NVMET_TCP_Q_TLS_HANDSHAKE && !keyupdate) {
 		pr_warn("cannot start TLS in state %d\n", queue->state);
 		return -EINVAL;
 	}
@@ -1856,6 +1908,7 @@ static int nvmet_tcp_tls_handshake(struct nvmet_tcp_queue *queue,
 	args.ta_data = queue;
 	args.ta_keyring = key_serial(queue->port->nport->keyring);
 	args.ta_timeout_ms = tls_handshake_timeout * 1000;
+	args.user_key_serial = queue->user_key_serial;
 
 	ret = tls_server_hello_psk(&args, GFP_KERNEL, keyupdate);
 	if (ret) {
-- 
2.50.1


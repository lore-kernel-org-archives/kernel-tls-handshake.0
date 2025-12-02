Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197B8212B0A
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  2 Dec 2025 01:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764639331; cv=none; b=ZLaKPAbPTJGHWZmd/PS8jjdDs2BEyRXQmE7PnEhamx4UGqAzCZpgihDVAQDmGRMuLmRM/ZAJ5cs50DTimFo4Pi9d9zu39LSzXnBihNO/2BinU0Jd1q9jeetbLzKfF/eXaKqVVgWQA/2Mm33EpBDU6tALr3H81i1tJnI/0AnHl+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764639331; c=relaxed/simple;
	bh=RUtCX8CP3W/yuDQ/ZW/ZJRJEJWXpd/A/PFm0/jER/wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OD8bcL63ubY/J28LUPsNaIFw8VsmDpaK4yxAdPLKHJu44dRc4Dx0UIRPHGhgDKqO+9pqVqCyZqktnMtrFb9l+UVJTSl3Cr6FbVFYI0FT1TuC94IJszWbZdSa2TzlqnpfPsUlEuupZAVohBJ/FKKMl5l58GmxX66s8I95wZ7mUtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKWstHYy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKWstHYy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2957850c63bso36207645ad.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 01 Dec 2025 17:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764639329; x=1765244129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alrcnF8hffQyqVii+35fGG8FiEZV1WdxKAf95IBHMhY=;
        b=DKWstHYya+i+i3LOfLz/8BopzAFswgEX/2/0KLkWIsieBQos+y/rR/jqzdSPc84kaP
         O7stL6vFA6dIbM0uXOqK0+hTf8iuDwQxGiPqH4ydk+RoLd82E7U+AnpO5U1Kzkc48C5C
         DDZxVd8cZ81vXXBYsfM+0q460WPzXnNC9HN4REimQmPiwzcQumWaZXQyYQUsWhvSBZV5
         ipLZcAvgGzUb957x8l1JxSPbu5cRomQyFXXcEk04yYVg+WuizJlQUHnoc37zlzTbrJAv
         O83LDseXqW7OhuMQEzscsu5eYSnbHkH/6V4Jf7kpY8v9FNXFQK3LWEiikN7VJMZ4Tw9X
         CVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764639329; x=1765244129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=alrcnF8hffQyqVii+35fGG8FiEZV1WdxKAf95IBHMhY=;
        b=PEMzlTTpPfMK/hGOY5rS7AMJ93N4nwONhFOAbzDwHtGE/JflLphLvHyyQWQVzs+GVH
         b5BpTeUV8P44Wj48RIfvhvJS5VSzhTn1/fkFlgruz0DQsR3dljJQVEvXuj/YIubbm2Eg
         1FNH4okINptxtLtAduXeBJVxIh4UsFNo86zYUE0GyqBaB3GfRAJl9w4C4iKNxrhQGabZ
         4Lp2x4taqF8G2GPmTmfnCkiqnkDJBtaP0vx4DNNUS6ihEbdkRPZmP35k45m7ZeTIRBR2
         ZRGQH5KfV8htTAlt93St1HNlkrruSwf7OsYtNsYz+XT6s+DXTMrGQdlPX4boaR7ZaqpC
         tITg==
X-Forwarded-Encrypted: i=1; AJvYcCVlds+AxUz17/Pt7VUCpVF2hm9VDmB1FF2i+XW0lZqUTTmYqnazikDVWUl0AL42fjTpilg/UVK+24dRSEq26NF6Ki3gJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyBlw7MoD5e5fepHGj+Zr79iUKswN2HABjntzWt5r63kroe8Uo
	JQ9jLYaDmOyaMWud303pBBB9PneOOKLOKKKPYt7tZQTd24VwcBesNc4t
X-Gm-Gg: ASbGncvjzigszDIecSFZ93324/cBMtFp/cXhCS5zSS9gBjiFLDTpSzGC55LHG/4Jtlt
	+ft5/J5lV6OXz56z/7HmDTTfZHkPdPPs/e0k+WBxUJ/b1p9tECJYJ8i8Ubsn79vlrOPV9Ouq5XT
	E8Z/4wwjA5nFLzhLylZkb8yw12FjenYQjNLekaq4Yfz9mNshKKO82OVyd7qJr9ve2r3XSXzUZMY
	xeKGDbyGeoRA6NkgdwSIrDPfo6WaFOfWAC3+atnU3r0TLjKpjwnSVGcSt/fpCM90q2KHIFwEaLd
	pyivNe0k2emJwCZ3O5HjWbgTri9qgOUkeZQA4IG+lWZYmGehtHXNZbxP6H8ZQpm5JUK+auI16/x
	Y19rZh6HlZeJMNs0glbLO4vA4gDasYWt7PFD6Ag8jmU3O/DKcBQl83acR4Sf1nVnZulb1Va7QW0
	JcHZnr68b0tsKq6+RlEHC98mGAyPSPK/iN3gI2auysD3fS+srnDCLwCgXMNIH0OJn6ISaPVThk7
	WUdX2k/Z6dZfZaALZQ=
X-Google-Smtp-Source: AGHT+IHdYVOCmmOlbphB1W7UrAZ5O3XT23PE61UI8Mwhm5s9BH8EvESHLmAwNWu7QZRIDDb2agOulw==
X-Received: by 2002:a17:902:f786:b0:298:88:c006 with SMTP id d9443c01a7336-29d5a48b3afmr8809815ad.4.1764639329398;
        Mon, 01 Dec 2025 17:35:29 -0800 (PST)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb54563sm132378575ad.89.2025.12.01.17.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 17:35:28 -0800 (PST)
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
Subject: [PATCH v6 4/5] nvme-tcp: Support KeyUpdate
Date: Tue,  2 Dec 2025 11:34:28 +1000
Message-ID: <20251202013429.1199659-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251202013429.1199659-1-alistair.francis@wdc.com>
References: <20251202013429.1199659-1-alistair.francis@wdc.com>
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

Based-on: 2cbe1350-0bf5-4487-be33-1d317cb73acf@suse.de
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
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

 drivers/nvme/host/tcp.c | 93 +++++++++++++++++++++++++++++++++--------
 1 file changed, 75 insertions(+), 18 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 4797a4532b0d..c0966929f97b 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -172,6 +172,7 @@ struct nvme_tcp_queue {
 	bool			tls_enabled;
 	u32			rcv_crc;
 	u32			snd_crc;
+	key_serial_t		handshake_session_id;
 	__le32			exp_ddgst;
 	__le32			recv_ddgst;
 	struct completion       tls_complete;
@@ -858,7 +859,10 @@ static void nvme_tcp_handle_c2h_term(struct nvme_tcp_queue *queue,
 static int nvme_tcp_recvmsg_pdu(struct nvme_tcp_queue *queue)
 {
 	char *pdu = queue->pdu;
+	char cbuf[CMSG_LEN(sizeof(char))] = {};
 	struct msghdr msg = {
+		.msg_control = cbuf,
+		.msg_controllen = sizeof(cbuf),
 		.msg_flags = MSG_DONTWAIT,
 	};
 	struct kvec iov = {
@@ -873,6 +877,12 @@ static int nvme_tcp_recvmsg_pdu(struct nvme_tcp_queue *queue)
 	if (ret <= 0)
 		return ret;
 
+	if (cbuf[CMSG_LEN(sizeof(char)) - 1] == TLS_RECORD_TYPE_HANDSHAKE &&
+	    pdu[queue->pdu_offset] == TLS_HANDSHAKE_KEYUPDATE) {
+		dev_err(queue->ctrl->ctrl.device, "KeyUpdate message\n");
+		return 1;
+	}
+
 	queue->pdu_remaining -= ret;
 	queue->pdu_offset += ret;
 	if (queue->pdu_remaining)
@@ -944,14 +954,14 @@ static int nvme_tcp_recvmsg_data(struct nvme_tcp_queue *queue)
 	struct request *rq =
 		nvme_cid_to_rq(nvme_tcp_tagset(queue), pdu->command_id);
 	struct nvme_tcp_request *req = blk_mq_rq_to_pdu(rq);
+	char cbuf[CMSG_LEN(sizeof(char))] = {};
+	struct msghdr msg;
+	int ret;
 
 	if (nvme_tcp_recv_state(queue) != NVME_TCP_RECV_DATA)
 		return 0;
 
 	while (queue->data_remaining) {
-		struct msghdr msg;
-		int ret;
-
 		if (!iov_iter_count(&req->iter)) {
 			req->curr_bio = req->curr_bio->bi_next;
 
@@ -975,11 +985,8 @@ static int nvme_tcp_recvmsg_data(struct nvme_tcp_queue *queue)
 		msg.msg_flags = MSG_DONTWAIT;
 
 		ret = sock_recvmsg(queue->sock, &msg, msg.msg_flags);
-		if (ret < 0) {
-			dev_err(queue->ctrl->ctrl.device,
-				"queue %d failed to receive request %#x data",
-				nvme_tcp_queue_id(queue), rq->tag);
-			return ret;
+		if (unlikely(ret < 0)) {
+			goto msg_control;
 		}
 		if (queue->data_digest)
 			nvme_tcp_ddgst_calc(req, &queue->rcv_crc, ret);
@@ -1002,6 +1009,29 @@ static int nvme_tcp_recvmsg_data(struct nvme_tcp_queue *queue)
 		}
 	}
 
+	return 0;
+
+msg_control:
+	/*
+	 * If MSG_CTRUNC is set, it's a control message,
+	 * so let's read the control message.
+	 */
+	if (msg.msg_flags & MSG_CTRUNC) {
+		memset(&msg, 0, sizeof(msg));
+		msg.msg_flags = MSG_DONTWAIT;
+		msg.msg_control = cbuf;
+		msg.msg_controllen = sizeof(cbuf);
+
+		ret = sock_recvmsg(queue->sock, &msg, msg.msg_flags);
+	}
+
+	if (ret < 0) {
+		dev_err(queue->ctrl->ctrl.device,
+			"queue %d failed to receive request %#x data, %d",
+			nvme_tcp_queue_id(queue), rq->tag, ret);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -1384,15 +1414,37 @@ static int nvme_tcp_try_recvmsg(struct nvme_tcp_queue *queue)
 		}
 	} while (result >= 0);
 
-	if (result < 0 && result != -EAGAIN) {
-		dev_err(queue->ctrl->ctrl.device,
-			"receive failed:  %d\n", result);
-		queue->rd_enabled = false;
-		nvme_tcp_error_recovery(&queue->ctrl->ctrl);
-	} else if (result == -EAGAIN)
-		result = 0;
+	if (result < 0) {
+		if (result != -EKEYEXPIRED && result != -EAGAIN) {
+			dev_err(queue->ctrl->ctrl.device,
+				"receive failed:  %d\n", result);
+			queue->rd_enabled = false;
+			nvme_tcp_error_recovery(&queue->ctrl->ctrl);
+		}
+		return result;
+	}
 
-	return result < 0 ? result : (queue->nr_cqe = nr_cqe);
+	queue->nr_cqe = nr_cqe;
+	return nr_cqe;
+}
+
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
 }
 
 static void nvme_tcp_io_work(struct work_struct *w)
@@ -1417,8 +1469,11 @@ static void nvme_tcp_io_work(struct work_struct *w)
 		result = nvme_tcp_try_recvmsg(queue);
 		if (result > 0)
 			pending = true;
-		else if (unlikely(result < 0))
-			return;
+		else if (unlikely(result < 0)) {
+			if (result == -EKEYEXPIRED)
+				update_tls_keys(queue);
+			break;
+		}
 
 		/* did we get some space after spending time in recv? */
 		if (nvme_tcp_queue_has_pending(queue) &&
@@ -1726,6 +1781,7 @@ static void nvme_tcp_tls_done(void *data, int status, key_serial_t pskid,
 			ctrl->ctrl.tls_pskid = key_serial(tls_key);
 		key_put(tls_key);
 		queue->tls_err = 0;
+		queue->handshake_session_id = handshake_session_id;
 	}
 
 out_complete:
@@ -1755,6 +1811,7 @@ static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
 		keyring = key_serial(nctrl->opts->keyring);
 	args.ta_keyring = keyring;
 	args.ta_timeout_ms = tls_handshake_timeout * 1000;
+	args.ta_handshake_session_id = queue->handshake_session_id;
 	queue->tls_err = -EOPNOTSUPP;
 	init_completion(&queue->tls_complete);
 	if (keyupdate == HANDSHAKE_KEY_UPDATE_TYPE_UNSPEC)
-- 
2.51.1


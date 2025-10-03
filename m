Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41041F4CBC
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  3 Oct 2025 04:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759465965; cv=none; b=HYPkKdBtmnPVWRH+bD1JptYp8YKRilTJ2DRZo0P2zfSUMyIkOTyJQUP6rHHU88FGNa3KfO8wnhGeaOW0SJe38o5Ny/Y3JnNJEZOP1V7q3q7pg9PLYh7dyV0wRU3234vOhbcnaC/j5Rn+NOEaCElXgDgBtZ1asLEZRPZI+FwQGNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759465965; c=relaxed/simple;
	bh=3UVQYHiEQ5R5MltmAyxrjBudfQCX1yI39rHghkihzo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JC0eUlPNuRCCtnsl7/m+YnAENVuueNJfIkusIgKG+OHOtlmIWv6ccNZRWWsbIAC8TDHGWq72S634jcgOszzalmRwUxx5bpB05lPRZQwvpnOfZgFIP7V8k9Q1kVtC0wAN7OW+6ot2Cc0d2lajH96pCc7tFuG9z+E2xCDeou1sTlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AW/+zCY6; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AW/+zCY6"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-32df5cae0b1so2484069a91.2
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 02 Oct 2025 21:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759465963; x=1760070763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUt0lx1wZ3OyjfIx3eBQc3LazcDXGlUQf7VsPfo32Ig=;
        b=AW/+zCY6HjLSrDHwvhvn6Vjkif3OwOxAh8X6ipcU/7JNl+1EI6CEqjc1ycSnoB0QrY
         C5Glp5Jfh6alYQQ1IYiEyGRiARMNb9FOGa5MHtb9y70vKUuZ4PCOfaReTj3/1nfRkABj
         gNTmilNCczQfGew5QDrWe3pWAofV8mgZvbdRp8Ogrn1zSeYRMVr7OhMRI2JXHZqGSKDZ
         nJV9rDzFT+uxbCq8n5J/gnPW7H5oDs02xjLOJUHiiexBxXyuXpfFAjNG2NTafJTDPEcM
         7K+4sovVMoPALJH1cchJTwdYLfqy0FwYHTpvhOYN2tIRWQ3Rqb2viFzdw7swvK7kjR2u
         S1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759465963; x=1760070763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iUt0lx1wZ3OyjfIx3eBQc3LazcDXGlUQf7VsPfo32Ig=;
        b=t9uf4vniAjouwU19+Kn4QhcNoZF1wd4l6IgrRy5gAjmtYM+31NWaTmHTYhE6uRMP9l
         vRGLy2x7UvBcZFqQlgekL9ZCWg4aZxrcQCzRCBMSNXEv3LYOuZFDDwOkd11aqTJSdjv1
         wT1HQi5k05TA0J9fYr9VDzQz3/RFiKh+hpoWQX+S/uZ6TerJ16ZfBlqS9Bsz7QFpjqh2
         JZY0UK2hSKWUUpRYjUehk75uxhMOJGsEi+PyW+5kAKxp4xL3aU/6Ci4c6fAXKSMqvSQ4
         9FlSbUDWU1TS4o32fy4TgQgFLXKF3ceA6wC/c7iAxDAFXnhvbpFngOYXLxA4rlBArM8p
         qycQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2/5I1IVasODuAZiW3bNmmNA19R5YdLPR5E82bl2aFDRJV3KlxnX8slMyqnMe8TKIUhJ8eGPoyDo+q0C9KsqnA8VficQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBXwyyRKb4WG3DhUY3T0gTYXqdvWcHm8rMzzOzRmaHdGl2RP3X
	NAByMtkEz00MrMtoAlstHXpixemMLp4IYcEm5Pj5dK2UhOz4yKE0aWcU
X-Gm-Gg: ASbGnctmmxUAjI4lwWGzB88YAzn/ckofVxQq640XLiBBpU4P2uVQgU0EJ5ZdSWDRFPU
	LtHlQ9BwHXhKWtiqgMKE/cGsuzFpf77SBStGGU6HB8UlcrjJgVwN1ba5X4XAqGMD7wqcOfl/lrr
	sfLXtUSKgjH3TwsQbWeDD5pou7jQ3bKmuHU7L56ZuWsBzng1jwsoS5vuVEWxKwRVDJXUBQf0xOx
	cg3pru6F8Q1NB7QvxqUfsf5k/Jd3F+59O01N5AzGzg9oJ7iSJ98raqLUEySTkvaMZc6JQSc4s1I
	2tb8MRH/a3AtBdZJsvohVpx2dQaYIEbCT9DKqrmdRSP5LLIriTAmnQec/hyzaPskg0xfMvPSUAb
	gCQAqBgna2tGL4O4fDg79lWMBBOhCMiGfiiPSi4loQL6wJAvGAtsPU/+kueqbqTGaPAgK80sFRW
	EcM0Z5SGly7oIga0FirZSr7Z7RXJDVBLXCowRuNapPvzrSvxwGjKUT
X-Google-Smtp-Source: AGHT+IGhaBIUtKtuD6q+A3yD/rdltrPoLDs9xzkO82sKW85fbk3aQyiXoU7SizhTuE7KWD6NguZsNA==
X-Received: by 2002:a17:90b:17cf:b0:32e:d011:ea1c with SMTP id 98e67ed59e1d1-339c274fd63mr2279693a91.15.1759465963241;
        Thu, 02 Oct 2025 21:32:43 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701c457sm6528233a91.23.2025.10.02.21.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 21:32:42 -0700 (PDT)
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
Subject: [PATCH v3 6/8] nvme-tcp: Support KeyUpdate
Date: Fri,  3 Oct 2025 14:31:37 +1000
Message-ID: <20251003043140.1341958-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003043140.1341958-1-alistair.francis@wdc.com>
References: <20251003043140.1341958-1-alistair.francis@wdc.com>
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
on an KeyUpdate event.

If the NVMe Target (TLS server) initiates a KeyUpdate this patch will
allow the NVMe layer to process the KeyUpdate request and forward the
request to userspace. Userspace must then update the key to keep the
connection alive.

This patch allows us to handle the NVMe target sending a KeyUpdate
request without aborting the connection. At this time we don't support
initiating a KeyUpdate.

Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v3:
 - Don't cancel existing handshake requests
v2:
 - Don't change the state
 - Use a helper function for KeyUpdates
 - Continue sending in nvme_tcp_send_all() after a KeyUpdate
 - Remove command message using recvmsg

 drivers/nvme/host/tcp.c | 60 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index b07401ad68eb..4f27319f0078 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -172,6 +172,7 @@ struct nvme_tcp_queue {
 	bool			tls_enabled;
 	u32			rcv_crc;
 	u32			snd_crc;
+	key_serial_t		user_session_id;
 	__le32			exp_ddgst;
 	__le32			recv_ddgst;
 	struct completion       tls_complete;
@@ -211,6 +212,7 @@ static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
 			      struct nvme_tcp_queue *queue,
 			      key_serial_t pskid,
 			      handshake_key_update_type keyupdate);
+static void update_tls_keys(struct nvme_tcp_queue *queue);
 
 static inline struct nvme_tcp_ctrl *to_tcp_ctrl(struct nvme_ctrl *ctrl)
 {
@@ -394,6 +396,14 @@ static inline void nvme_tcp_send_all(struct nvme_tcp_queue *queue)
 	do {
 		ret = nvme_tcp_try_send(queue);
 	} while (ret > 0);
+
+	if (ret == -EKEYEXPIRED) {
+		update_tls_keys(queue);
+
+		do {
+			ret = nvme_tcp_try_send(queue);
+		} while (ret > 0);
+	}
 }
 
 static inline bool nvme_tcp_queue_has_pending(struct nvme_tcp_queue *queue)
@@ -1346,6 +1356,8 @@ static int nvme_tcp_try_send(struct nvme_tcp_queue *queue)
 done:
 	if (ret == -EAGAIN) {
 		ret = 0;
+	} else if (ret == -EKEYEXPIRED) {
+		goto out;
 	} else if (ret < 0) {
 		dev_err(queue->ctrl->ctrl.device,
 			"failed to send request %d\n", ret);
@@ -1381,17 +1393,45 @@ static int nvme_tcp_try_recvmsg(struct nvme_tcp_queue *queue)
 		}
 	} while (result >= 0);
 
-	if (result < 0 && result != -EAGAIN) {
+	if (result == -EKEYEXPIRED) {
+		return -EKEYEXPIRED;
+	} else if (result == -EAGAIN) {
+		result = 0;
+	} else if (result < 0) {
 		dev_err(queue->ctrl->ctrl.device,
 			"receive failed:  %d\n", result);
 		queue->rd_enabled = false;
 		nvme_tcp_error_recovery(&queue->ctrl->ctrl);
-	} else if (result == -EAGAIN)
-		result = 0;
+	}
 
 	return result < 0 ? result : (queue->nr_cqe = nr_cqe);
 }
 
+static void update_tls_keys(struct nvme_tcp_queue *queue)
+{
+	int qid = nvme_tcp_queue_id(queue);
+	int ret;
+
+	dev_dbg(queue->ctrl->ctrl.device,
+		"updating key for queue %d\n", qid);
+
+	cancel_work(&queue->io_work);
+
+	nvme_stop_keep_alive(&(queue->ctrl->ctrl));
+	flush_work(&(queue->ctrl->ctrl).async_event_work);
+
+	ret = nvme_tcp_start_tls(&(queue->ctrl->ctrl),
+				 queue, queue->ctrl->ctrl.tls_pskid,
+				 HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED);
+
+	if (ret < 0) {
+		dev_err(queue->ctrl->ctrl.device,
+			"failed to update the keys %d\n", ret);
+		nvme_tcp_fail_request(queue->request);
+		nvme_tcp_done_send_req(queue);
+	}
+}
+
 static void nvme_tcp_io_work(struct work_struct *w)
 {
 	struct nvme_tcp_queue *queue =
@@ -1407,15 +1447,21 @@ static void nvme_tcp_io_work(struct work_struct *w)
 			mutex_unlock(&queue->send_mutex);
 			if (result > 0)
 				pending = true;
-			else if (unlikely(result < 0))
+			else if (unlikely(result < 0)) {
+				if (result == -EKEYEXPIRED)
+					update_tls_keys(queue);
 				break;
+			}
 		}
 
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
@@ -1723,6 +1769,7 @@ static void nvme_tcp_tls_done(void *data, int status, key_serial_t pskid,
 			ctrl->ctrl.tls_pskid = key_serial(tls_key);
 		key_put(tls_key);
 		queue->tls_err = 0;
+		queue->user_session_id = user_session_id;
 	}
 
 out_complete:
@@ -1752,6 +1799,7 @@ static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
 		keyring = key_serial(nctrl->opts->keyring);
 	args.ta_keyring = keyring;
 	args.ta_timeout_ms = tls_handshake_timeout * 1000;
+	args.user_session_id = queue->user_session_id;
 	queue->tls_err = -EOPNOTSUPP;
 	init_completion(&queue->tls_complete);
 	ret = tls_client_hello_psk(&args, GFP_KERNEL, keyupdate);
-- 
2.51.0


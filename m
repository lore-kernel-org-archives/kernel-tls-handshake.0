Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5014251799
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 15 Aug 2025 05:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755234148; cv=none; b=AdpeLO6Ew29ggpXTEAtcNlKGrKDZTntYD7WweQGVNNluCbNEy7wdvX9UOng0HpjlJtOb06zRXxDKugyd4idd4DLSOofRrVewBk38uIPN83YdysN383gDiUCoAe81PWMaVGEk55aVtuPlIxSMwPgVwwgIddPFBSgf1V0en4v1Uho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755234148; c=relaxed/simple;
	bh=50iyDIDaT2YO4wbsbI+xVQsVXOTiCYaZir1b+W/+UM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sRZFf2tUjLbUpNVSRLvt1/REawsMMiUxjWoBIAvhv5H/rLJPgqSefK+IMUVIESyhv4bVZ5lfOqWtmeQelADpkBu/b3aZsM5/ByMuiZIwZV6Ed0QGGcfJrxLJAZXNQkZGemvLMgTfV79xoF1kuYSEH6fS76c4eqogjuQ4qZ1sddk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldFQ+2M1; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldFQ+2M1"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4716f92a0aso1088022a12.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 14 Aug 2025 22:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755234146; x=1755838946; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlvxtVVZ+6JmXq5VcgRfeOHjy0BKkaatlQTyuC34hMk=;
        b=ldFQ+2M1n65Ouoagbis7Hx8WuHr24pgZ5PKXZZkYHmCcZrSI2bt2iETmLByNPB/dOL
         wPDgZcfIbijUn9lqXFTVudMd75Q4YRIEugo5Qx/guSumihvWsJlxSoiSGDoK4Gp+gv7H
         ymyPWE24cQLl3NcELlJkiLeboSE6eR5Mhd1XIs5ZFHqAb2FSKZUXLKKeeh7PoUIyatSH
         OyKFBoiJE96t9FwqXAtIoL3stxVcoyMqbz/+qCHDQil7ZrSzqkW/4HpsrFZf1rpig640
         4DoliQjM1KM1L/W778nhxkbjGzzJ9yOKzwCIrY4N+Yp5/BOMdMmgv87aTBLEogl11MuL
         EEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755234146; x=1755838946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YlvxtVVZ+6JmXq5VcgRfeOHjy0BKkaatlQTyuC34hMk=;
        b=TJ/PR8X1Kzra2MadYu8a9aPA2dj3+aJrzX2z4RvXgXP/MqCoeeRAm5p2PSIOINKbeh
         jXusYD0eZIRoNQjONjnh+hZoSraojKhm6J4JXWN1IRDl0Pfjss3nTh6vUdHmIV5HxHHd
         cSr1lRPWg+0XNSpM1hfI7+IBmoeIcJD7bvYquQHXzF8EQb3m9p+pZ3nLkoMVhD0rU+DH
         4xTA2daPyDHWp0H8kb9dvS9EBz//qZzMv2TI9vCjyYHxALlMmf6TAJR4+/b9ZzLav0+G
         3c10tif1wsb/K5XGTuWoTdStHDilJY2nMMYlmRDoijO+oiM9MBZ21zwC2xtrHe6qQehS
         /exw==
X-Forwarded-Encrypted: i=1; AJvYcCVTnbmo3pSk6UaWw+d0pcEvR9MD0M5Kd111p/CG2ljSEy8z3HOchsUEFTzLgLVYcHIJg2VZwa9bqDyDuv1trMHEzPidGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YytaIYBv29wCyYB5CanvXJx2U2lqQL/vV9+zuWcGcGwCAPfZrkT
	MojOycQlF4PoxWJRElhLhJ3J3oaVX5hmPlmwUIjG5OjxEfByGWssWCchRdOzYQ==
X-Gm-Gg: ASbGncsUuvgoYCmcbogtd4qDSij5TtqB6XGSuIdynD1UtXSvaoBhBv1WSrpCwb4VKS4
	YrQix3ZdQ4PvjfkB5GhtlCL6CxiLr6pItn7rl3jf0RgJfrRwNGUAy3qptPkgG78aqsFob/nNvhH
	mRDB0xQ3smpixJoxx9Zm+0b+uNc8sHA8cfR2IwCpwyN/bgezxqY4fbkZjO8YzVDGez3AYPUxmzV
	vawX8cIcJOav0UzMhQecsj1aBEVtPU7y/o9kph4mY7oUBse9yXB0h/Vlb2CeSg5c7VpmiZdoD05
	zdiuvLoGGGfABDB3n87m8pFQsSw3scJsJTgQIKzrqUrkRm8jZwotgbcMf2Q5fVpbXTEGtVMpgVf
	5QkTokZ3UkBKgDzBD7uBzpitl1RkzdWa2NUnw/c39pbH9+FCeD6F7gWhuG5UczjN6lNWBG/KQqz
	ivRXpxD32BgRaVIRshNng5tWmVxrY=
X-Google-Smtp-Source: AGHT+IE8mGbvy+6sKOh0dqJXKQL4DmlgJQqF7LsglNO7FAjrbB5jTqDzNJkN8SaS/kgbM9ijcYzpCw==
X-Received: by 2002:a17:902:d2ca:b0:243:a50:14bc with SMTP id d9443c01a7336-2446d980ee7mr12066745ad.55.1755234145832;
        Thu, 14 Aug 2025 22:02:25 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53c6e1sm5128645ad.115.2025.08.14.22.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:02:25 -0700 (PDT)
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
Subject: [PATCH 1/8] net/handshake: Store the key serial number on completion
Date: Fri, 15 Aug 2025 15:02:03 +1000
Message-ID: <20250815050210.1518439-2-alistair.francis@wdc.com>
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

Allow userspace to include a key serial number when completing a
handshake with the HANDSHAKE_CMD_DONE command.

We then store this serial number and will provide it back to userspace
in the future. This allows userspace to save data to the keyring and
then restore that data later.

This will be used to support the TLS KeyUpdate operation, as now
userspace can resume information about a established session.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 Documentation/netlink/specs/handshake.yaml |  4 ++++
 drivers/nvme/host/tcp.c                    |  3 ++-
 drivers/nvme/target/tcp.c                  |  3 ++-
 include/net/handshake.h                    |  3 ++-
 include/uapi/linux/handshake.h             |  1 +
 net/handshake/genl.c                       |  5 +++--
 net/handshake/tlshd.c                      | 15 +++++++++++++--
 net/sunrpc/svcsock.c                       |  3 ++-
 net/sunrpc/xprtsock.c                      |  3 ++-
 9 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/Documentation/netlink/specs/handshake.yaml b/Documentation/netlink/specs/handshake.yaml
index 95c3fade7a8d..e76b10ef62f2 100644
--- a/Documentation/netlink/specs/handshake.yaml
+++ b/Documentation/netlink/specs/handshake.yaml
@@ -87,6 +87,9 @@ attribute-sets:
         name: remote-auth
         type: u32
         multi-attr: true
+      -
+        name: key-serial
+        type: u32
 
 operations:
   list:
@@ -123,6 +126,7 @@ operations:
             - status
             - sockfd
             - remote-auth
+            - key-serial
 
 mcast-groups:
   list:
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index c0fe8cfb7229..bb7317a3f1a9 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1673,7 +1673,8 @@ static void nvme_tcp_set_queue_io_cpu(struct nvme_tcp_queue *queue)
 		qid, queue->io_cpu);
 }
 
-static void nvme_tcp_tls_done(void *data, int status, key_serial_t pskid)
+static void nvme_tcp_tls_done(void *data, int status, key_serial_t pskid,
+	key_serial_t user_key_serial)
 {
 	struct nvme_tcp_queue *queue = data;
 	struct nvme_tcp_ctrl *ctrl = queue->ctrl;
diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index 470bf37e5a63..93fce316267d 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -1780,7 +1780,8 @@ static int nvmet_tcp_tls_key_lookup(struct nvmet_tcp_queue *queue,
 }
 
 static void nvmet_tcp_tls_handshake_done(void *data, int status,
-					 key_serial_t peerid)
+					 key_serial_t peerid,
+					 key_serial_t user_key_serial)
 {
 	struct nvmet_tcp_queue *queue = data;
 
diff --git a/include/net/handshake.h b/include/net/handshake.h
index 8ebd4f9ed26e..449bed8c2557 100644
--- a/include/net/handshake.h
+++ b/include/net/handshake.h
@@ -18,7 +18,8 @@ enum {
 };
 
 typedef void	(*tls_done_func_t)(void *data, int status,
-				   key_serial_t peerid);
+				   key_serial_t peerid,
+				   key_serial_t user_key_serial);
 
 struct tls_handshake_args {
 	struct socket		*ta_sock;
diff --git a/include/uapi/linux/handshake.h b/include/uapi/linux/handshake.h
index 662e7de46c54..46753116ba43 100644
--- a/include/uapi/linux/handshake.h
+++ b/include/uapi/linux/handshake.h
@@ -55,6 +55,7 @@ enum {
 	HANDSHAKE_A_DONE_STATUS = 1,
 	HANDSHAKE_A_DONE_SOCKFD,
 	HANDSHAKE_A_DONE_REMOTE_AUTH,
+	HANDSHAKE_A_DONE_KEY_SERIAL,
 
 	__HANDSHAKE_A_DONE_MAX,
 	HANDSHAKE_A_DONE_MAX = (__HANDSHAKE_A_DONE_MAX - 1)
diff --git a/net/handshake/genl.c b/net/handshake/genl.c
index f55d14d7b726..bf64323bb5e1 100644
--- a/net/handshake/genl.c
+++ b/net/handshake/genl.c
@@ -16,10 +16,11 @@ static const struct nla_policy handshake_accept_nl_policy[HANDSHAKE_A_ACCEPT_HAN
 };
 
 /* HANDSHAKE_CMD_DONE - do */
-static const struct nla_policy handshake_done_nl_policy[HANDSHAKE_A_DONE_REMOTE_AUTH + 1] = {
+static const struct nla_policy handshake_done_nl_policy[HANDSHAKE_A_DONE_KEY_SERIAL + 1] = {
 	[HANDSHAKE_A_DONE_STATUS] = { .type = NLA_U32, },
 	[HANDSHAKE_A_DONE_SOCKFD] = { .type = NLA_S32, },
 	[HANDSHAKE_A_DONE_REMOTE_AUTH] = { .type = NLA_U32, },
+	[HANDSHAKE_A_DONE_KEY_SERIAL] = { .type = NLA_U32, },
 };
 
 /* Ops table for handshake */
@@ -35,7 +36,7 @@ static const struct genl_split_ops handshake_nl_ops[] = {
 		.cmd		= HANDSHAKE_CMD_DONE,
 		.doit		= handshake_nl_done_doit,
 		.policy		= handshake_done_nl_policy,
-		.maxattr	= HANDSHAKE_A_DONE_REMOTE_AUTH,
+		.maxattr	= HANDSHAKE_A_DONE_KEY_SERIAL,
 		.flags		= GENL_CMD_CAP_DO,
 	},
 };
diff --git a/net/handshake/tlshd.c b/net/handshake/tlshd.c
index 081093dfd553..cb1ee8ebf2ea 100644
--- a/net/handshake/tlshd.c
+++ b/net/handshake/tlshd.c
@@ -26,7 +26,8 @@
 
 struct tls_handshake_req {
 	void			(*th_consumer_done)(void *data, int status,
-						    key_serial_t peerid);
+						    key_serial_t peerid,
+						    key_serial_t user_key_serial);
 	void			*th_consumer_data;
 
 	int			th_type;
@@ -39,6 +40,8 @@ struct tls_handshake_req {
 
 	unsigned int		th_num_peerids;
 	key_serial_t		th_peerid[5];
+
+	key_serial_t		user_key_serial;
 };
 
 static struct tls_handshake_req *
@@ -55,6 +58,7 @@ tls_handshake_req_init(struct handshake_req *req,
 	treq->th_num_peerids = 0;
 	treq->th_certificate = TLS_NO_CERT;
 	treq->th_privkey = TLS_NO_PRIVKEY;
+	treq->user_key_serial = TLS_NO_PRIVKEY;
 	return treq;
 }
 
@@ -83,6 +87,13 @@ static void tls_handshake_remote_peerids(struct tls_handshake_req *treq,
 		if (i >= treq->th_num_peerids)
 			break;
 	}
+
+	nla_for_each_attr(nla, head, len, rem) {
+		if (nla_type(nla) == HANDSHAKE_A_DONE_KEY_SERIAL) {
+			treq->user_key_serial = nla_get_u32(nla);
+			break;
+		}
+	}
 }
 
 /**
@@ -105,7 +116,7 @@ static void tls_handshake_done(struct handshake_req *req,
 		set_bit(HANDSHAKE_F_REQ_SESSION, &req->hr_flags);
 
 	treq->th_consumer_done(treq->th_consumer_data, -status,
-			       treq->th_peerid[0]);
+			       treq->th_peerid[0], treq->user_key_serial);
 }
 
 #if IS_ENABLED(CONFIG_KEYS)
diff --git a/net/sunrpc/svcsock.c b/net/sunrpc/svcsock.c
index 46c156b121db..3a325d7f2049 100644
--- a/net/sunrpc/svcsock.c
+++ b/net/sunrpc/svcsock.c
@@ -423,7 +423,8 @@ static void svc_tcp_kill_temp_xprt(struct svc_xprt *xprt)
  * is present" flag on the xprt and let an upper layer enforce local
  * security policy.
  */
-static void svc_tcp_handshake_done(void *data, int status, key_serial_t peerid)
+static void svc_tcp_handshake_done(void *data, int status, key_serial_t peerid,
+				   key_serial_t user_key_serial)
 {
 	struct svc_xprt *xprt = data;
 	struct svc_sock *svsk = container_of(xprt, struct svc_sock, sk_xprt);
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index c5f7bbf5775f..8edd095b3a40 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2591,7 +2591,8 @@ static int xs_tcp_tls_finish_connecting(struct rpc_xprt *lower_xprt,
  * @peerid: serial number of key containing the remote's identity
  *
  */
-static void xs_tls_handshake_done(void *data, int status, key_serial_t peerid)
+static void xs_tls_handshake_done(void *data, int status, key_serial_t peerid,
+				  key_serial_t user_key_serial)
 {
 	struct rpc_xprt *lower_xprt = data;
 	struct sock_xprt *lower_transport =
-- 
2.50.1


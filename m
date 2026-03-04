Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9807B364943
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  4 Mar 2026 05:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772602595; cv=none; b=CbRb5s2BLTGiOXxNS3ixoDOYhGvBPtodBX97ZbHK2z6Jz+RfFMdVYGyXj6x8ptqGnSUJ4ZGei7rLZ6po6cDaCu5O1DpN+vG7dUMo2EsAn+1Qdg3uv6Q8rLc0cxLkjagdAws+bGmKZyfr792jtxwd6bDpVYkz5a/0wfKSKaBhiVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772602595; c=relaxed/simple;
	bh=7qA9Q6Pz/ZThLLziRlzsP+Ns3IK5HTYVcg1/SCKOubM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tp7zCsQy6TkDnzIq5yeyxI6lKTLgjUl/BnKPDvGHnXRGd8BbWWzg5Bv6tBTjTPbmbLu/zfuBJCo1ccQP8uO5mV3kmr8MrvE10tEIgVtXWX2Kqo4EESFdRN8Y+V6AL/glIWXicyYZ5OeV7D+oM+Al+I1fMLqyYHRdZYPU3u1jZTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSek5c8P; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSek5c8P"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35983877dc5so1570991a91.2
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 03 Mar 2026 21:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772602593; x=1773207393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNCDZkyqVlGeQwFgjROGPRwx2fLC/OmgR/7kGK793I8=;
        b=gSek5c8PFxP9nnmv92WsZK84gruTXh1fhxdg5IEKbUb3NPCoMQwzZqsXejFq5OmtqB
         c4FPRAnEmiw86lHcfihCD/fInzeQ9CG3O0Mw/YmQVpD3RF4tbxcFsyKT72gzAtRQAt1u
         1fRLfVpPcBXbSLXoFmOV3GAuV2ArTliDuMyfj9Cvw7xEXL5aNiCy4pArwMaPfaytdntI
         1wqOFMHUisYuUa26Xsqw1om9o0jez3r0AlSPLkT42GWdxu2mBoTUGsc7CdD8rfykFpE7
         aWdGsprASfP6x/7o/bemDFbOpqIyuZkBptpCoQwDoCEZnsHlj7LD2Ao6vT8g9k4+/g2r
         o1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772602593; x=1773207393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xNCDZkyqVlGeQwFgjROGPRwx2fLC/OmgR/7kGK793I8=;
        b=j1Lx+HuThQJnEPzdRVUP4CY82ue4gyYZ6zw8KY+N7FzqPsif76ZqGKYvqdQpK7f1Gs
         ZqczR0F2L/tIP3W8fkqVfGYoKCuwg2DXhPpNJtHFKD1WlXbQzszY31jOinoZ/X7nYa92
         J5SxzhjpP5BLx64mjRLloJ525YkDBPJ7MZZSMDrwTdACTFTRK+lgMiOd/AHO/VTyT1t/
         T18y9wLSaSqd+h0458Uu9gaAS7YCRuG+W8tWNnL3cVRL1F5TuBF3Y96DtA+pX20OwE9N
         zUNpDTso+xPrMzjyBKmx0CnZr3LfMMPif9YnRlyEzsWqrxXKnYgwZ96m0yca0aCtc8Oi
         E/1g==
X-Forwarded-Encrypted: i=1; AJvYcCX8xBTbMOJHDyEl7/2BUC+C9n80ETfDQ8wYcvU114I2DC5hiavkahgzGycBxqSxmBW6Cr8rZfE4tDS9sGtOKOwKbiDyQA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7uu/yTELPZNwbEHelSwanG/kMyEon/dOFLth9PAsudWl3wcbN
	L9w/NYDwYxyYXxihLSYmc5N/c2g+yjw0WWsn85E05wtjZ5Y4cA6U4N5n
X-Gm-Gg: ATEYQzzuIDMC4AdDCEppW6DBTX7zgnt1nrlEYnYSuhmO+agYHAOcIEhjM1V9FITyphS
	VWse/QXUIexB908s0Sw4kJt8Olky801afiHdSu2tKexmI/QUKbqxkVYNIgZu6Xj4TlyFdHydCMW
	R1McpUDrpq0vFLBfls6m+sgmuBZXnmI/GtATRJYnmftgVljMVLEynK0GOb12mfPNZgJJ2LbLsBm
	Rmm82N2U5oJH5lSyPI5ItHIdhfBec3e3rEkW5JarEJOEa9VSC/pxN3KSQSBjhfVJrXltWcz6XKZ
	dCQhW3Q0Sxx+z3L8M3nl8W0U2TTZUCZdho1b1VOCqT2vsouO96i8rtmjXsmgDFYGlkfKiSmzk/T
	6bZIF0huDWlkUW/q5zlyW/3ZLW4axvnIWz5FYdBS5CRdoAAamMNKRGIFWNYFfuCw1GH2WZD2AR4
	tXa68fd2S2rVZSkDkBysziGAwQpgZqmBtabPWeW6Y15g==
X-Received: by 2002:a17:90b:538c:b0:356:2db3:1206 with SMTP id 98e67ed59e1d1-359a69dae4emr997051a91.13.1772602592975;
        Tue, 03 Mar 2026 21:36:32 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c090bfdsm4020057a91.8.2026.03.03.21.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 21:36:32 -0800 (PST)
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
Subject: [PATCH v7 1/5] net/handshake: Store the key serial number on completion
Date: Wed,  4 Mar 2026 15:34:56 +1000
Message-ID: <20260304053500.590630-2-alistair.francis@wdc.com>
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

Allow userspace to include a key serial number when completing a
handshake with the HANDSHAKE_CMD_DONE command.

We then store this serial number and will provide it back to userspace
in the future. This allows userspace to save data to the keyring and
then restore that data later.

This will be used to support the TLS KeyUpdate operation, as now
userspace can resume information about a established session.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Hannes Reincke <hare@suse.de>
Reviewed-by: Chuck Lever <chuck.lever@oracle.com>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
v7:
 - No change
v6:
 - Add the "ta_" and "th_" prefixs
v5:
 - Change name to "handshake session ID"
v4:
 - No change
v3:
 - No change
v2:
 - Change "key-serial" to "session-id"

 Documentation/netlink/specs/handshake.yaml |  4 ++++
 Documentation/networking/tls-handshake.rst |  1 +
 drivers/nvme/host/tcp.c                    |  3 ++-
 drivers/nvme/target/tcp.c                  |  3 ++-
 include/net/handshake.h                    |  5 ++++-
 include/uapi/linux/handshake.h             |  1 +
 net/handshake/genl.c                       |  5 +++--
 net/handshake/tlshd.c                      | 15 +++++++++++++--
 net/sunrpc/svcsock.c                       |  4 +++-
 net/sunrpc/xprtsock.c                      |  4 +++-
 10 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/Documentation/netlink/specs/handshake.yaml b/Documentation/netlink/specs/handshake.yaml
index 95c3fade7a8d..a273bc74d26f 100644
--- a/Documentation/netlink/specs/handshake.yaml
+++ b/Documentation/netlink/specs/handshake.yaml
@@ -87,6 +87,9 @@ attribute-sets:
         name: remote-auth
         type: u32
         multi-attr: true
+      -
+        name: session-id
+        type: u32
 
 operations:
   list:
@@ -123,6 +126,7 @@ operations:
             - status
             - sockfd
             - remote-auth
+            - session-id
 
 mcast-groups:
   list:
diff --git a/Documentation/networking/tls-handshake.rst b/Documentation/networking/tls-handshake.rst
index 6f5ea1646a47..c58b3c8b16c1 100644
--- a/Documentation/networking/tls-handshake.rst
+++ b/Documentation/networking/tls-handshake.rst
@@ -60,6 +60,7 @@ fills in a structure that contains the parameters of the request:
         key_serial_t    ta_my_privkey;
         unsigned int    ta_num_peerids;
         key_serial_t    ta_my_peerids[5];
+        key_serial_t    ta_handshake_session_id;
   };
 
 The @ta_sock field references an open and connected socket. The consumer
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 9ab3f61196a3..204f45f791a3 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1676,7 +1676,8 @@ static void nvme_tcp_set_queue_io_cpu(struct nvme_tcp_queue *queue)
 		qid, queue->io_cpu);
 }
 
-static void nvme_tcp_tls_done(void *data, int status, key_serial_t pskid)
+static void nvme_tcp_tls_done(void *data, int status, key_serial_t pskid,
+			      key_serial_t handshake_session_id)
 {
 	struct nvme_tcp_queue *queue = data;
 	struct nvme_tcp_ctrl *ctrl = queue->ctrl;
diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index acc71a26733f..63613e60f566 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -1808,7 +1808,8 @@ static int nvmet_tcp_tls_key_lookup(struct nvmet_tcp_queue *queue,
 }
 
 static void nvmet_tcp_tls_handshake_done(void *data, int status,
-					 key_serial_t peerid)
+					 key_serial_t peerid,
+					 key_serial_t handshake_session_id)
 {
 	struct nvmet_tcp_queue *queue = data;
 
diff --git a/include/net/handshake.h b/include/net/handshake.h
index 8ebd4f9ed26e..d9b2411d5523 100644
--- a/include/net/handshake.h
+++ b/include/net/handshake.h
@@ -15,10 +15,12 @@ enum {
 	TLS_NO_PEERID = 0,
 	TLS_NO_CERT = 0,
 	TLS_NO_PRIVKEY = 0,
+	TLS_NO_SESSION_ID = 0,
 };
 
 typedef void	(*tls_done_func_t)(void *data, int status,
-				   key_serial_t peerid);
+				   key_serial_t peerid,
+				   key_serial_t handshake_session_id);
 
 struct tls_handshake_args {
 	struct socket		*ta_sock;
@@ -31,6 +33,7 @@ struct tls_handshake_args {
 	key_serial_t		ta_my_privkey;
 	unsigned int		ta_num_peerids;
 	key_serial_t		ta_my_peerids[5];
+	key_serial_t		ta_handshake_session_id;
 };
 
 int tls_client_hello_anon(const struct tls_handshake_args *args, gfp_t flags);
diff --git a/include/uapi/linux/handshake.h b/include/uapi/linux/handshake.h
index d7e40f594888..7fb3ef7f64df 100644
--- a/include/uapi/linux/handshake.h
+++ b/include/uapi/linux/handshake.h
@@ -56,6 +56,7 @@ enum {
 	HANDSHAKE_A_DONE_STATUS = 1,
 	HANDSHAKE_A_DONE_SOCKFD,
 	HANDSHAKE_A_DONE_REMOTE_AUTH,
+	HANDSHAKE_A_DONE_SESSION_ID,
 
 	__HANDSHAKE_A_DONE_MAX,
 	HANDSHAKE_A_DONE_MAX = (__HANDSHAKE_A_DONE_MAX - 1)
diff --git a/net/handshake/genl.c b/net/handshake/genl.c
index 870612609491..2542c13bb562 100644
--- a/net/handshake/genl.c
+++ b/net/handshake/genl.c
@@ -17,10 +17,11 @@ static const struct nla_policy handshake_accept_nl_policy[HANDSHAKE_A_ACCEPT_HAN
 };
 
 /* HANDSHAKE_CMD_DONE - do */
-static const struct nla_policy handshake_done_nl_policy[HANDSHAKE_A_DONE_REMOTE_AUTH + 1] = {
+static const struct nla_policy handshake_done_nl_policy[HANDSHAKE_A_DONE_SESSION_ID + 1] = {
 	[HANDSHAKE_A_DONE_STATUS] = { .type = NLA_U32, },
 	[HANDSHAKE_A_DONE_SOCKFD] = { .type = NLA_S32, },
 	[HANDSHAKE_A_DONE_REMOTE_AUTH] = { .type = NLA_U32, },
+	[HANDSHAKE_A_DONE_SESSION_ID] = { .type = NLA_U32, },
 };
 
 /* Ops table for handshake */
@@ -36,7 +37,7 @@ static const struct genl_split_ops handshake_nl_ops[] = {
 		.cmd		= HANDSHAKE_CMD_DONE,
 		.doit		= handshake_nl_done_doit,
 		.policy		= handshake_done_nl_policy,
-		.maxattr	= HANDSHAKE_A_DONE_REMOTE_AUTH,
+		.maxattr	= HANDSHAKE_A_DONE_SESSION_ID,
 		.flags		= GENL_CMD_CAP_DO,
 	},
 };
diff --git a/net/handshake/tlshd.c b/net/handshake/tlshd.c
index 8f9532a15f43..e72f45bdc226 100644
--- a/net/handshake/tlshd.c
+++ b/net/handshake/tlshd.c
@@ -26,7 +26,8 @@
 
 struct tls_handshake_req {
 	void			(*th_consumer_done)(void *data, int status,
-						    key_serial_t peerid);
+						    key_serial_t peerid,
+						    key_serial_t handshake_session_id);
 	void			*th_consumer_data;
 
 	int			th_type;
@@ -39,6 +40,8 @@ struct tls_handshake_req {
 
 	unsigned int		th_num_peerids;
 	key_serial_t		th_peerid[5];
+
+	key_serial_t		th_handshake_session_id;
 };
 
 static struct tls_handshake_req *
@@ -55,6 +58,7 @@ tls_handshake_req_init(struct handshake_req *req,
 	treq->th_num_peerids = 0;
 	treq->th_certificate = TLS_NO_CERT;
 	treq->th_privkey = TLS_NO_PRIVKEY;
+	treq->th_handshake_session_id = TLS_NO_SESSION_ID;
 	return treq;
 }
 
@@ -83,6 +87,13 @@ static void tls_handshake_remote_peerids(struct tls_handshake_req *treq,
 		if (i >= treq->th_num_peerids)
 			break;
 	}
+
+	nla_for_each_attr(nla, head, len, rem) {
+		if (nla_type(nla) == HANDSHAKE_A_DONE_SESSION_ID) {
+			treq->th_handshake_session_id = nla_get_u32(nla);
+			break;
+		}
+	}
 }
 
 /**
@@ -105,7 +116,7 @@ static void tls_handshake_done(struct handshake_req *req,
 		set_bit(HANDSHAKE_F_REQ_SESSION, &req->hr_flags);
 
 	treq->th_consumer_done(treq->th_consumer_data, -status,
-			       treq->th_peerid[0]);
+			       treq->th_peerid[0], treq->th_handshake_session_id);
 }
 
 #if IS_ENABLED(CONFIG_KEYS)
diff --git a/net/sunrpc/svcsock.c b/net/sunrpc/svcsock.c
index f28c6076f7e8..5b003ac66a54 100644
--- a/net/sunrpc/svcsock.c
+++ b/net/sunrpc/svcsock.c
@@ -455,13 +455,15 @@ static void svc_tcp_kill_temp_xprt(struct svc_xprt *xprt)
  * @data: address of xprt to wake
  * @status: status of handshake
  * @peerid: serial number of key containing the remote peer's identity
+ * @handshake_session_id: serial number of the userspace session ID
  *
  * If a security policy is specified as an export option, we don't
  * have a specific export here to check. So we set a "TLS session
  * is present" flag on the xprt and let an upper layer enforce local
  * security policy.
  */
-static void svc_tcp_handshake_done(void *data, int status, key_serial_t peerid)
+static void svc_tcp_handshake_done(void *data, int status, key_serial_t peerid,
+				   key_serial_t handshake_session_id)
 {
 	struct svc_xprt *xprt = data;
 	struct svc_sock *svsk = container_of(xprt, struct svc_sock, sk_xprt);
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 2e1fe6013361..86eb51a9b224 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2590,9 +2590,11 @@ static int xs_tcp_tls_finish_connecting(struct rpc_xprt *lower_xprt,
  * @data: address of xprt to wake
  * @status: status of handshake
  * @peerid: serial number of key containing the remote's identity
+ * @handshake_session_id: serial number of the userspace session ID
  *
  */
-static void xs_tls_handshake_done(void *data, int status, key_serial_t peerid)
+static void xs_tls_handshake_done(void *data, int status, key_serial_t peerid,
+				  key_serial_t handshake_session_id)
 {
 	struct rpc_xprt *lower_xprt = data;
 	struct sock_xprt *lower_transport =
-- 
2.53.0


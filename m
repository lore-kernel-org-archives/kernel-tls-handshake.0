Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D2D1F462D
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  3 Oct 2025 04:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759465960; cv=none; b=Nz2L5TaxM1gem/3JR3U8zWc3E3PPF6tBqP+E2O2jhxtZdzY8Y8uMlFTdIKSXkeNWmm9JKpgeEcPG3LfqYWrefF8Nt/qE7hA+2Mnsct30DDRv6UtN2KGjAowhi6QKWFShqoJfi1346HBq2nQ/gw3S85OulFlV9wmOa6OEv9/S2bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759465960; c=relaxed/simple;
	bh=Uq3Z8RSrHwXrnNT1paL1AoU785TlGI3mneVec9VRjM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOXeVkbetvjT1+B6lgutPWO1VsKf2VJIjlF9YHlAR0iQ95IA2wB9BR/rODOGN2lSZNxzxVKMsX8pUFDO5F6PFJWT5OIuqd0WN9/vsK4vginhyHyy8T6RfZf1Bb7Fb/tCIJtMHgZ7E8IfdqgZxPzkoV61AGRwJBiiAlJ7MhFDVgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alduNMGR; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alduNMGR"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77f605f22easo1798742b3a.2
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 02 Oct 2025 21:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759465957; x=1760070757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDr+pGK9qXDhiZdQ2JtpI7GsJ+lt00Yrfq6Cg4/eIfw=;
        b=alduNMGRncTkdljbx+vH6uiqGJzL4lkK1UL2UxO/+FRxLwr+Fa2fb3AbtyHyYT79vS
         hQeinuYes9XEH/IN1ogPtecDZcbB2Xcy4K3t9ZYExlhBTquQ/KS845ZQr0xsS59HWKDP
         T75OfGT/V/2UkPooWG20QSVcPGU+zg8IM0aT6IE+zudPDs/B1Qc3MIiVCrDPXShoOd/C
         RYTi/Y7eqwE0MNOXDlZ+jVvdzYmErgal5K4SpX8fToohpHmdEmY8+hIREGEohKcDH8Am
         qiASOkTlqlXCAXz3yvukbu4LwH1TJU0WwzegQjyNFspE8PCvIdMCdSzNGj57u1v59jCW
         xkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759465957; x=1760070757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDr+pGK9qXDhiZdQ2JtpI7GsJ+lt00Yrfq6Cg4/eIfw=;
        b=PhVEJtfeZYw9JPCpJYOQHuoFZqsb+D5ArDp4noA7I0o0Bg7MTR/pNnRhQENDTA9J8g
         yrLVQJbnV9+EbbijLrEXsE2gi461BbTuArqnKK20GWACceevdomSXLZBOuO5lb1cuTGm
         G5g95v8TdTE/e+Hgt+GcQyypJzA1Mml/VUIWFSglMtnWdX3LY4bZXySnnjP9v3h1/P9T
         46QV2fPjHKS34l3MM0A+33AhN8zAlEccxQ8zHbjZVeQj2n6l4yhjvhA8rhuEjrGWpHKm
         UxXvhYz68keR35dKh3CWCuHppZXUpjMwtFE43zjUebnF/nAzUSEvCru2n0t4PQHc4MUx
         /BAA==
X-Forwarded-Encrypted: i=1; AJvYcCUCKmUWyCqUA4bRi9XM/LHZTzkNPdj11aK3mw2rXn0kV02ldLQ2xfHZJTk0tMCqWQtqmA8qNNY38dn94YedElrZHUXgNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoozxXKlfb7WOSwXcchXNtX+HyvPNqsUHeiOdNhVQs6S8Jf9XL
	ju2wrTl3jhhN5uiMn/5d3ox1YTY0ItELAvZM/Gk0yDgIvUNX2mQskkV1
X-Gm-Gg: ASbGncvGh25hZh2MT2IUQwQU+IaSjdvzKuBTrB7SU+hI7CA3/0PCYeDDRIWnTsc8tXu
	i7mrInh7IUe4Bk5+bkiAx9Nptf0ivxdO3BHeSVYe2EDMVBL/HaiUs0+rNEdf7HILyqo1UwAYcKz
	88H3UQZwvFXyhAZQHWI9ivsrF0GThxIKeDDOYGefOnmKZp9mW9ETqS9yOKh17IaYqawJpFckSXX
	JJWKTf/ggbPCjivDWDVSlO+N/ff7A1q9cSQ2FbfAZL6tJn014kJG/8gmxHfwRZXGOJrVE42aBHc
	Z4jOjCq1yC1vczrslAhlfUjf9ZpchoqQgVTECOQDfXZGhXrN2NAZmS4QK6SpFVkH0PU3NodjcAH
	LlrBjQ7hZOwr7GydM9wkkVO3thHcJGGSu7xNa6Pb1LHn0pjTM8B4jYcEwVV6TFASgv0tDjexp4g
	7BgYiWbkKn1LzlKsZ+yb5Xk0R+16XzWE+dD+jpvCG8IYCIqAJD/DOD
X-Google-Smtp-Source: AGHT+IHKBOsUY7IpU/J35nifIpXWMGavj61RcjI2MjowdpODALHppCvI2FcArSJWrhbcaKQdWgadxw==
X-Received: by 2002:a17:90b:3b44:b0:32b:9bec:158f with SMTP id 98e67ed59e1d1-339c27d2f96mr2078376a91.29.1759465957036;
        Thu, 02 Oct 2025 21:32:37 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701c457sm6528233a91.23.2025.10.02.21.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 21:32:36 -0700 (PDT)
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
Subject: [PATCH v3 5/8] net/handshake: Support KeyUpdate message types
Date: Fri,  3 Oct 2025 14:31:36 +1000
Message-ID: <20251003043140.1341958-6-alistair.francis@wdc.com>
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

When reporting the msg-type to userspace let's also support reporting
KeyUpdate events. This supports reporting a client/server event and if
the other side requested a KeyUpdateRequest.

Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v3:
 - Fixup yamllint and kernel-doc failures

 Documentation/netlink/specs/handshake.yaml | 16 +++++++++-
 Documentation/networking/tls-handshake.rst |  4 +--
 drivers/nvme/host/tcp.c                    | 12 ++++++--
 drivers/nvme/target/tcp.c                  | 11 +++++--
 include/net/handshake.h                    | 10 +++++--
 include/uapi/linux/handshake.h             | 13 +++++++++
 net/handshake/tlshd.c                      | 34 ++++++++++++++++++----
 7 files changed, 84 insertions(+), 16 deletions(-)

diff --git a/Documentation/netlink/specs/handshake.yaml b/Documentation/netlink/specs/handshake.yaml
index a273bc74d26f..c72ec8fa7d7a 100644
--- a/Documentation/netlink/specs/handshake.yaml
+++ b/Documentation/netlink/specs/handshake.yaml
@@ -21,12 +21,18 @@ definitions:
     type: enum
     name: msg-type
     value-start: 0
-    entries: [unspec, clienthello, serverhello]
+    entries: [unspec, clienthello, serverhello, clientkeyupdate,
+              clientkeyupdaterequest, serverkeyupdate, serverkeyupdaterequest]
   -
     type: enum
     name: auth
     value-start: 0
     entries: [unspec, unauth, psk, x509]
+  -
+    type: enum
+    name: key-update-type
+    value-start: 0
+    entries: [unspec, send, received, received_request_update]
 
 attribute-sets:
   -
@@ -74,6 +80,13 @@ attribute-sets:
       -
         name: keyring
         type: u32
+      -
+        name: key-update-request
+        type: u32
+        enum: key-update-type
+      -
+        name: key-serial
+        type: u32
   -
     name: done
     attributes:
@@ -116,6 +129,7 @@ operations:
             - certificate
             - peername
             - keyring
+            - key-serial
     -
       name: done
       doc: Handler reports handshake completion
diff --git a/Documentation/networking/tls-handshake.rst b/Documentation/networking/tls-handshake.rst
index d7287890056a..f858011e5bfb 100644
--- a/Documentation/networking/tls-handshake.rst
+++ b/Documentation/networking/tls-handshake.rst
@@ -110,7 +110,7 @@ To initiate a client-side TLS handshake with a pre-shared key, use:
 
 .. code-block:: c
 
-  ret = tls_client_hello_psk(args, gfp_flags);
+  ret = tls_client_hello_psk(args, gfp_flags, handshake_key_update_type);
 
 However, in this case, the consumer fills in the @ta_my_peerids array
 with serial numbers of keys containing the peer identities it wishes
@@ -140,7 +140,7 @@ or
 
 .. code-block:: c
 
-  ret = tls_server_hello_psk(args, gfp_flags);
+  ret = tls_server_hello_psk(args, gfp_flags, handshake_key_update_type);
 
 The argument structure is filled in as above.
 
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 700c37af52ba..b07401ad68eb 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -20,6 +20,7 @@
 #include <linux/iov_iter.h>
 #include <net/busy_poll.h>
 #include <trace/events/sock.h>
+#include <uapi/linux/handshake.h>
 
 #include "nvme.h"
 #include "fabrics.h"
@@ -206,6 +207,10 @@ static struct workqueue_struct *nvme_tcp_wq;
 static const struct blk_mq_ops nvme_tcp_mq_ops;
 static const struct blk_mq_ops nvme_tcp_admin_mq_ops;
 static int nvme_tcp_try_send(struct nvme_tcp_queue *queue);
+static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
+			      struct nvme_tcp_queue *queue,
+			      key_serial_t pskid,
+			      handshake_key_update_type keyupdate);
 
 static inline struct nvme_tcp_ctrl *to_tcp_ctrl(struct nvme_ctrl *ctrl)
 {
@@ -1726,7 +1731,8 @@ static void nvme_tcp_tls_done(void *data, int status, key_serial_t pskid,
 
 static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
 			      struct nvme_tcp_queue *queue,
-			      key_serial_t pskid)
+			      key_serial_t pskid,
+			      handshake_key_update_type keyupdate)
 {
 	int qid = nvme_tcp_queue_id(queue);
 	int ret;
@@ -1748,7 +1754,7 @@ static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
 	args.ta_timeout_ms = tls_handshake_timeout * 1000;
 	queue->tls_err = -EOPNOTSUPP;
 	init_completion(&queue->tls_complete);
-	ret = tls_client_hello_psk(&args, GFP_KERNEL);
+	ret = tls_client_hello_psk(&args, GFP_KERNEL, keyupdate);
 	if (ret) {
 		dev_err(nctrl->device, "queue %d: failed to start TLS: %d\n",
 			qid, ret);
@@ -1898,7 +1904,7 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 
 	/* If PSKs are configured try to start TLS */
 	if (nvme_tcp_tls_configured(nctrl) && pskid) {
-		ret = nvme_tcp_start_tls(nctrl, queue, pskid);
+		ret = nvme_tcp_start_tls(nctrl, queue, pskid, HANDSHAKE_KEY_UPDATE_TYPE_UNSPEC);
 		if (ret)
 			goto err_init_connect;
 	}
diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index 4ef4dd140ada..bee0355195f5 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -214,6 +214,10 @@ static struct workqueue_struct *nvmet_tcp_wq;
 static const struct nvmet_fabrics_ops nvmet_tcp_ops;
 static void nvmet_tcp_free_cmd(struct nvmet_tcp_cmd *c);
 static void nvmet_tcp_free_cmd_buffers(struct nvmet_tcp_cmd *cmd);
+#ifdef CONFIG_NVME_TARGET_TCP_TLS
+static int nvmet_tcp_tls_handshake(struct nvmet_tcp_queue *queue,
+				   handshake_key_update_type keyupdate);
+#endif
 
 static inline u16 nvmet_tcp_cmd_tag(struct nvmet_tcp_queue *queue,
 		struct nvmet_tcp_cmd *cmd)
@@ -1833,7 +1837,8 @@ static void nvmet_tcp_tls_handshake_timeout(struct work_struct *w)
 	kref_put(&queue->kref, nvmet_tcp_release_queue);
 }
 
-static int nvmet_tcp_tls_handshake(struct nvmet_tcp_queue *queue)
+static int nvmet_tcp_tls_handshake(struct nvmet_tcp_queue *queue,
+	handshake_key_update_type keyupdate)
 {
 	int ret = -EOPNOTSUPP;
 	struct tls_handshake_args args;
@@ -1852,7 +1857,7 @@ static int nvmet_tcp_tls_handshake(struct nvmet_tcp_queue *queue)
 	args.ta_keyring = key_serial(queue->port->nport->keyring);
 	args.ta_timeout_ms = tls_handshake_timeout * 1000;
 
-	ret = tls_server_hello_psk(&args, GFP_KERNEL);
+	ret = tls_server_hello_psk(&args, GFP_KERNEL, keyupdate);
 	if (ret) {
 		kref_put(&queue->kref, nvmet_tcp_release_queue);
 		pr_err("failed to start TLS, err=%d\n", ret);
@@ -1934,7 +1939,7 @@ static void nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
 		sk->sk_data_ready = port->data_ready;
 		write_unlock_bh(&sk->sk_callback_lock);
 		if (!nvmet_tcp_try_peek_pdu(queue)) {
-			if (!nvmet_tcp_tls_handshake(queue))
+			if (!nvmet_tcp_tls_handshake(queue, HANDSHAKE_KEY_UPDATE_TYPE_UNSPEC))
 				return;
 			/* TLS handshake failed, terminate the connection */
 			goto out_destroy_sq;
diff --git a/include/net/handshake.h b/include/net/handshake.h
index dc2222fd6d99..7da5d09b9bad 100644
--- a/include/net/handshake.h
+++ b/include/net/handshake.h
@@ -10,6 +10,10 @@
 #ifndef _NET_HANDSHAKE_H
 #define _NET_HANDSHAKE_H
 
+#include <uapi/linux/handshake.h>
+
+#define handshake_key_update_type u32
+
 enum {
 	TLS_NO_KEYRING = 0,
 	TLS_NO_PEERID = 0,
@@ -37,9 +41,11 @@ struct tls_handshake_args {
 
 int tls_client_hello_anon(const struct tls_handshake_args *args, gfp_t flags);
 int tls_client_hello_x509(const struct tls_handshake_args *args, gfp_t flags);
-int tls_client_hello_psk(const struct tls_handshake_args *args, gfp_t flags);
+int tls_client_hello_psk(const struct tls_handshake_args *args, gfp_t flags,
+			 handshake_key_update_type keyupdate);
 int tls_server_hello_x509(const struct tls_handshake_args *args, gfp_t flags);
-int tls_server_hello_psk(const struct tls_handshake_args *args, gfp_t flags);
+int tls_server_hello_psk(const struct tls_handshake_args *args, gfp_t flags,
+			 handshake_key_update_type keyupdate);
 
 bool tls_handshake_cancel(struct sock *sk);
 void tls_handshake_close(struct socket *sock);
diff --git a/include/uapi/linux/handshake.h b/include/uapi/linux/handshake.h
index b68ffbaa5f31..b691530073c6 100644
--- a/include/uapi/linux/handshake.h
+++ b/include/uapi/linux/handshake.h
@@ -19,6 +19,10 @@ enum handshake_msg_type {
 	HANDSHAKE_MSG_TYPE_UNSPEC,
 	HANDSHAKE_MSG_TYPE_CLIENTHELLO,
 	HANDSHAKE_MSG_TYPE_SERVERHELLO,
+	HANDSHAKE_MSG_TYPE_CLIENTKEYUPDATE,
+	HANDSHAKE_MSG_TYPE_CLIENTKEYUPDATEREQUEST,
+	HANDSHAKE_MSG_TYPE_SERVERKEYUPDATE,
+	HANDSHAKE_MSG_TYPE_SERVERKEYUPDATEREQUEST,
 };
 
 enum handshake_auth {
@@ -28,6 +32,13 @@ enum handshake_auth {
 	HANDSHAKE_AUTH_X509,
 };
 
+enum handshake_key_update_type {
+	HANDSHAKE_KEY_UPDATE_TYPE_UNSPEC,
+	HANDSHAKE_KEY_UPDATE_TYPE_SEND,
+	HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED,
+	HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED_REQUEST_UPDATE,
+};
+
 enum {
 	HANDSHAKE_A_X509_CERT = 1,
 	HANDSHAKE_A_X509_PRIVKEY,
@@ -46,6 +57,8 @@ enum {
 	HANDSHAKE_A_ACCEPT_CERTIFICATE,
 	HANDSHAKE_A_ACCEPT_PEERNAME,
 	HANDSHAKE_A_ACCEPT_KEYRING,
+	HANDSHAKE_A_ACCEPT_KEY_UPDATE_REQUEST,
+	HANDSHAKE_A_ACCEPT_KEY_SERIAL,
 
 	__HANDSHAKE_A_ACCEPT_MAX,
 	HANDSHAKE_A_ACCEPT_MAX = (__HANDSHAKE_A_ACCEPT_MAX - 1)
diff --git a/net/handshake/tlshd.c b/net/handshake/tlshd.c
index 2549c5dbccd8..05126f8943f1 100644
--- a/net/handshake/tlshd.c
+++ b/net/handshake/tlshd.c
@@ -41,6 +41,7 @@ struct tls_handshake_req {
 	unsigned int		th_num_peerids;
 	key_serial_t		th_peerid[5];
 
+	int			th_key_update_request;
 	key_serial_t		user_session_id;
 };
 
@@ -58,7 +59,8 @@ tls_handshake_req_init(struct handshake_req *req,
 	treq->th_num_peerids = 0;
 	treq->th_certificate = TLS_NO_CERT;
 	treq->th_privkey = TLS_NO_PRIVKEY;
-	treq->user_session_id = TLS_NO_PRIVKEY;
+	treq->user_session_id = args->user_session_id;
+
 	return treq;
 }
 
@@ -265,6 +267,16 @@ static int tls_handshake_accept(struct handshake_req *req,
 		break;
 	}
 
+	ret = nla_put_u32(msg, HANDSHAKE_A_ACCEPT_KEY_SERIAL,
+			  treq->user_session_id);
+	if (ret < 0)
+		goto out_cancel;
+
+	ret = nla_put_u32(msg, HANDSHAKE_A_ACCEPT_KEY_UPDATE_REQUEST,
+			  treq->th_key_update_request);
+	if (ret < 0)
+		goto out_cancel;
+
 	genlmsg_end(msg, hdr);
 	return genlmsg_reply(msg, info);
 
@@ -341,6 +353,7 @@ EXPORT_SYMBOL(tls_client_hello_x509);
  * tls_client_hello_psk - request a PSK-based TLS handshake on a socket
  * @args: socket and handshake parameters for this request
  * @flags: memory allocation control flags
+ * @keyupdate: specifies if and what type of KeyUpdate operation
  *
  * Return values:
  *   %0: Handshake request enqueue; ->done will be called when complete
@@ -348,7 +361,8 @@ EXPORT_SYMBOL(tls_client_hello_x509);
  *   %-ESRCH: No user agent is available
  *   %-ENOMEM: Memory allocation failed
  */
-int tls_client_hello_psk(const struct tls_handshake_args *args, gfp_t flags)
+int tls_client_hello_psk(const struct tls_handshake_args *args, gfp_t flags,
+			 handshake_key_update_type keyupdate)
 {
 	struct tls_handshake_req *treq;
 	struct handshake_req *req;
@@ -362,7 +376,11 @@ int tls_client_hello_psk(const struct tls_handshake_args *args, gfp_t flags)
 	if (!req)
 		return -ENOMEM;
 	treq = tls_handshake_req_init(req, args);
-	treq->th_type = HANDSHAKE_MSG_TYPE_CLIENTHELLO;
+	if (keyupdate != HANDSHAKE_KEY_UPDATE_TYPE_UNSPEC)
+		treq->th_type = HANDSHAKE_MSG_TYPE_CLIENTKEYUPDATE;
+	else
+		treq->th_type = HANDSHAKE_MSG_TYPE_CLIENTHELLO;
+	treq->th_key_update_request = keyupdate;
 	treq->th_auth_mode = HANDSHAKE_AUTH_PSK;
 	treq->th_num_peerids = args->ta_num_peerids;
 	for (i = 0; i < args->ta_num_peerids; i++)
@@ -404,13 +422,15 @@ EXPORT_SYMBOL(tls_server_hello_x509);
  * tls_server_hello_psk - request a server TLS handshake on a socket
  * @args: socket and handshake parameters for this request
  * @flags: memory allocation control flags
+ * @keyupdate: specifies if and what type of KeyUpdate operation
  *
  * Return values:
  *   %0: Handshake request enqueue; ->done will be called when complete
  *   %-ESRCH: No user agent is available
  *   %-ENOMEM: Memory allocation failed
  */
-int tls_server_hello_psk(const struct tls_handshake_args *args, gfp_t flags)
+int tls_server_hello_psk(const struct tls_handshake_args *args, gfp_t flags,
+			 handshake_key_update_type keyupdate)
 {
 	struct tls_handshake_req *treq;
 	struct handshake_req *req;
@@ -419,7 +439,11 @@ int tls_server_hello_psk(const struct tls_handshake_args *args, gfp_t flags)
 	if (!req)
 		return -ENOMEM;
 	treq = tls_handshake_req_init(req, args);
-	treq->th_type = HANDSHAKE_MSG_TYPE_SERVERHELLO;
+	if (keyupdate != HANDSHAKE_KEY_UPDATE_TYPE_UNSPEC)
+		treq->th_type = HANDSHAKE_MSG_TYPE_SERVERKEYUPDATE;
+	else
+		treq->th_type = HANDSHAKE_MSG_TYPE_SERVERHELLO;
+	treq->th_key_update_request = keyupdate;
 	treq->th_auth_mode = HANDSHAKE_AUTH_PSK;
 	treq->th_num_peerids = 1;
 	treq->th_peerid[0] = args->ta_my_peerids[0];
-- 
2.51.0


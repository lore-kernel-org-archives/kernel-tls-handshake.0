Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFE524169A
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  8 Aug 2025 07:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754637983; cv=none; b=h++sEeiA+uYxL2DGCw9nTY9yDIGHBj/64Dq/61FIec/EXdiyOSpdGzo8N5sBufiD2H1hZaYczp7rPBiuzaPemnizQ0ZLC38pceECZea7Z95BARK7rQ+DYGm77f9qF+YW59rVWaR53NLtVqJqs4M1Pgzr+w6HmbhAPHB2geyWAiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754637983; c=relaxed/simple;
	bh=bTW6AmC5c7gOdIhkD5QyPjS5NYHKojLOvV6+qOVYeOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ejQNXSiNUMmR5ixBmHHTpLdBw+W4xyVScShfGGwCOu2YBPXFT4NDqSOgbh7hfWiVLOwHB2I7/Fwo+W+3gOzlwuR+0VmaDAQOladm8PGn46JN+2wIM+VcH2j6C91b7hDwqKOAxMwILZy9eltlv5RcptRMMYIxQslzaXvN17cTBWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxXf7OI2; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxXf7OI2"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b421b70f986so1358963a12.1
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 08 Aug 2025 00:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754637981; x=1755242781; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Y4ayNTu6yezCxVLa6u9JCyNf94KaDdFdQJuTS0HgYw=;
        b=RxXf7OI2Y/4V9EiQOpO6ObdUPpyEdtrQAlxFNV57FJee+atbI44RmmmBgIhGKfR0oe
         CTfauuuoeuv1p9tctpuFng1J+TSHVaSD+LZYP19xmNQkRwhYhw5MoLBvYfXkMoYdImin
         7UbBLxh895vZoOCqgVHdM9iIGdvFdLif9lKqX5S23MbZJsEnlHGRlFO2fz4bW8NYSTHq
         ljifh+RL2MPdI6H8V5bPt3hadpjE5xDVUHFERenP5YFMBIYjlvPu4scFWIPvgNBra8v+
         hZk+hqqZ1mtDnakatDt6jQcZjpDekBwlWqZzgJvrXm9LPiyeKltD6R1aIkg7jDOR2Pf2
         9lJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754637981; x=1755242781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Y4ayNTu6yezCxVLa6u9JCyNf94KaDdFdQJuTS0HgYw=;
        b=Hm21oBB670Bk4g99dpnJpEfJKc9FttugEJL4+JAqVMxpyJ8tEf8EsvHgGQ2CnaJhYa
         VemEyo7dWI38RlaQTH3qx3BWrTjerqCKwDWOz/giWaLwBrkR1fm6sRWI5XD5LoWojYUC
         4XngTzbcJ6P6L3R+fA1gaJGxAGQPzJxjzQyfT/iNqbp5Xudn98DxFcw0Z7F8eTzi3c4W
         CBc0KLGNeFntLam8GM7b8SOJPPwi4InZ+GoaDX2Ii8FynG8R+RqwGVxY8/jbrG5iC2zM
         m++J8kERgRizC1g6PJsuQ+FuIZY7c6PFzC9ArhynP2iQQr4yVuWVXwiRjNG38jQ7+LXn
         SxNA==
X-Forwarded-Encrypted: i=1; AJvYcCWIhpRHbaz4FE0xbvo5gY1XkICF4t0g9+cBKyeXhsWVkSQymgx3XQE/Moxz4nRQPzJL9Tl4u1ZmKGUBO+UpqLCYQZ6HXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YytFcdVVmsDZXh0jg82lBbFmBQGP4MF6jxlG07SaIG8NYWI0IX1
	TQrX7lrqRo8p+hJTKvygxR0NTZ1F5an/ZtD+Fk3TRx1XDvKzestYeIRc8MUnUQ==
X-Gm-Gg: ASbGnct9g+0agYvi+Yowclm2QOYPi99+bYUWNsC20LH8/iYXAp5yj9bg/XZF+3rpo35
	hQIHkC9EMij2rx6R7GPRJuygPAtN6yvfUKpXzvqAQB8feMJ6t3VqbHMvskXcDu8vIMsi94mJlND
	GMh6VpNCF12I2lezAQ84RZrVrk7Keh8H60Q3a2j7nAF39ob9Lsc4HuF4pscs39PoGn3mp2w3tkc
	8haJ4gL6NTqFDD6NqeLfSF9X1kEt0T2cc8xcG+6xSqK1ucMlm6YbfhepVZnZGQVIozkgg/KIljL
	X5sC0CesuYVM4fdQkSmLAF7cWZd6xebaxH06VnOneaaMMKNzc1Nx+Gsx3YgR9TEfmO7mCnrGGSA
	xewncwaIKUeRyfo451vK3Zh4plg==
X-Google-Smtp-Source: AGHT+IGflRqKZEJeTlZ+3G18yZXjIctHwjF5xth0gKvqXF8D+64xqjeuX6ZXwpFG7i6RdN2TJ8I7Dg==
X-Received: by 2002:a17:902:c94b:b0:240:b28:22a3 with SMTP id d9443c01a7336-242c21e088bmr30761125ad.29.1754637981186;
        Fri, 08 Aug 2025 00:26:21 -0700 (PDT)
Received: from fedora ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm186893565ad.63.2025.08.08.00.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 00:26:20 -0700 (PDT)
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: chuck.lever@oracle.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	donald.hunter@gmail.com,
	borisp@nvidia.com,
	john.fastabend@gmail.com
Cc: alistair.francis@wdc.com,
	dlemoal@kernel.org,
	kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [RFC v2 1/1] net/tls: allow limiting maximum record size
Date: Fri,  8 Aug 2025 17:24:01 +1000
Message-ID: <20250808072358.254478-5-wilfred.opensource@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808072358.254478-3-wilfred.opensource@gmail.com>
References: <20250808072358.254478-3-wilfred.opensource@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

During a handshake, an endpoint may specify a maximum record size limit.
Currently, the kernel defaults to TLS_MAX_PAYLOAD_SIZE (16KB) for the
maximum record size. Meaning that, the outgoing records from the kernel
can exceed a lower size negotiated during the handshake. In such a case,
the TLS endpoint must send a fatal "record_overflow" alert [1], and
thus the record is discarded.

This patch adds support for retrieving the negotiated record size limit
during a handshake, and enforcing it at the TLS layer such that outgoing
records are no larger than the size negotiated. This patch depends on
the respective userspace support in tlshd [2] and GnuTLS [3].

[1] https://www.rfc-editor.org/rfc/rfc8449
[2] https://github.com/oracle/ktls-utils/pull/112
[3] https://gitlab.com/gnutls/gnutls/-/merge_requests/2005

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 Documentation/netlink/specs/handshake.yaml |  3 +++
 include/net/tls.h                          |  2 ++
 include/uapi/linux/handshake.h             |  1 +
 net/handshake/genl.c                       |  5 ++--
 net/handshake/tlshd.c                      | 29 +++++++++++++++++++++-
 net/tls/tls_sw.c                           |  6 ++++-
 6 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/Documentation/netlink/specs/handshake.yaml b/Documentation/netlink/specs/handshake.yaml
index b934cc513e3d..4e6bc348f1fd 100644
--- a/Documentation/netlink/specs/handshake.yaml
+++ b/Documentation/netlink/specs/handshake.yaml
@@ -84,6 +84,9 @@ attribute-sets:
         name: remote-auth
         type: u32
         multi-attr: true
+      -
+          name: record-size-limit
+          type: u32
 
 operations:
   list:
diff --git a/include/net/tls.h b/include/net/tls.h
index 857340338b69..02e7b59fcc30 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -250,6 +250,8 @@ struct tls_context {
 			       */
 	unsigned long flags;
 
+	u32 tls_record_size_limit;
+
 	/* cache cold stuff */
 	struct proto *sk_proto;
 	struct sock *sk;
diff --git a/include/uapi/linux/handshake.h b/include/uapi/linux/handshake.h
index 3d7ea58778c9..0768eb8eb415 100644
--- a/include/uapi/linux/handshake.h
+++ b/include/uapi/linux/handshake.h
@@ -54,6 +54,7 @@ enum {
 	HANDSHAKE_A_DONE_STATUS = 1,
 	HANDSHAKE_A_DONE_SOCKFD,
 	HANDSHAKE_A_DONE_REMOTE_AUTH,
+	HANDSHAKE_A_DONE_RECORD_SIZE_LIMIT,
 
 	__HANDSHAKE_A_DONE_MAX,
 	HANDSHAKE_A_DONE_MAX = (__HANDSHAKE_A_DONE_MAX - 1)
diff --git a/net/handshake/genl.c b/net/handshake/genl.c
index f55d14d7b726..44c43ce18361 100644
--- a/net/handshake/genl.c
+++ b/net/handshake/genl.c
@@ -16,10 +16,11 @@ static const struct nla_policy handshake_accept_nl_policy[HANDSHAKE_A_ACCEPT_HAN
 };
 
 /* HANDSHAKE_CMD_DONE - do */
-static const struct nla_policy handshake_done_nl_policy[HANDSHAKE_A_DONE_REMOTE_AUTH + 1] = {
+static const struct nla_policy handshake_done_nl_policy[HANDSHAKE_A_DONE_RECORD_SIZE_LIMIT + 1] = {
 	[HANDSHAKE_A_DONE_STATUS] = { .type = NLA_U32, },
 	[HANDSHAKE_A_DONE_SOCKFD] = { .type = NLA_S32, },
 	[HANDSHAKE_A_DONE_REMOTE_AUTH] = { .type = NLA_U32, },
+	[HANDSHAKE_A_DONE_RECORD_SIZE_LIMIT] = { .type = NLA_U32, },
 };
 
 /* Ops table for handshake */
@@ -35,7 +36,7 @@ static const struct genl_split_ops handshake_nl_ops[] = {
 		.cmd		= HANDSHAKE_CMD_DONE,
 		.doit		= handshake_nl_done_doit,
 		.policy		= handshake_done_nl_policy,
-		.maxattr	= HANDSHAKE_A_DONE_REMOTE_AUTH,
+		.maxattr	= HANDSHAKE_A_DONE_RECORD_SIZE_LIMIT,
 		.flags		= GENL_CMD_CAP_DO,
 	},
 };
diff --git a/net/handshake/tlshd.c b/net/handshake/tlshd.c
index d6f52839827e..f4e793f6288d 100644
--- a/net/handshake/tlshd.c
+++ b/net/handshake/tlshd.c
@@ -19,6 +19,7 @@
 #include <net/handshake.h>
 #include <net/genetlink.h>
 #include <net/tls_prot.h>
+#include <net/tls.h>
 
 #include <uapi/linux/keyctl.h>
 #include <uapi/linux/handshake.h>
@@ -37,6 +38,8 @@ struct tls_handshake_req {
 	key_serial_t		th_certificate;
 	key_serial_t		th_privkey;
 
+	struct socket		*th_sock;
+
 	unsigned int		th_num_peerids;
 	key_serial_t		th_peerid[5];
 };
@@ -52,6 +55,7 @@ tls_handshake_req_init(struct handshake_req *req,
 	treq->th_consumer_data = args->ta_data;
 	treq->th_peername = args->ta_peername;
 	treq->th_keyring = args->ta_keyring;
+	treq->th_sock = args->ta_sock;
 	treq->th_num_peerids = 0;
 	treq->th_certificate = TLS_NO_CERT;
 	treq->th_privkey = TLS_NO_PRIVKEY;
@@ -85,6 +89,27 @@ static void tls_handshake_remote_peerids(struct tls_handshake_req *treq,
 	}
 }
 
+static void tls_handshake_record_size(struct tls_handshake_req *treq,
+				      struct genl_info *info)
+{
+	struct tls_context *tls_ctx;
+	struct nlattr *head = nlmsg_attrdata(info->nlhdr, GENL_HDRLEN);
+	struct nlattr *nla;
+	u32 record_size_limit;
+	int rem, len = nlmsg_attrlen(info->nlhdr, GENL_HDRLEN);
+
+	nla_for_each_attr(nla, head, len, rem) {
+		if (nla_type(nla) == HANDSHAKE_A_DONE_RECORD_SIZE_LIMIT) {
+			record_size_limit = nla_get_u32(nla);
+			if (treq->th_sock) {
+				tls_ctx = tls_get_ctx(treq->th_sock->sk);
+				tls_ctx->tls_record_size_limit = record_size_limit;
+			}
+			break;
+		}
+	}
+}
+
 /**
  * tls_handshake_done - callback to handle a CMD_DONE request
  * @req: socket on which the handshake was performed
@@ -98,8 +123,10 @@ static void tls_handshake_done(struct handshake_req *req,
 	struct tls_handshake_req *treq = handshake_req_private(req);
 
 	treq->th_peerid[0] = TLS_NO_PEERID;
-	if (info)
+	if (info) {
 		tls_handshake_remote_peerids(treq, info);
+		tls_handshake_record_size(treq, info);
+	}
 
 	if (!status)
 		set_bit(HANDSHAKE_F_REQ_SESSION, &req->hr_flags);
diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index fc88e34b7f33..70ffc4f5e382 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1024,6 +1024,7 @@ static int tls_sw_sendmsg_locked(struct sock *sk, struct msghdr *msg,
 	ssize_t copied = 0;
 	struct sk_msg *msg_pl, *msg_en;
 	struct tls_rec *rec;
+	u32 tls_record_size_limit;
 	int required_size;
 	int num_async = 0;
 	bool full_record;
@@ -1045,6 +1046,9 @@ static int tls_sw_sendmsg_locked(struct sock *sk, struct msghdr *msg,
 		}
 	}
 
+	tls_record_size_limit = min_not_zero(tls_ctx->tls_record_size_limit,
+					     TLS_MAX_PAYLOAD_SIZE);
+
 	while (msg_data_left(msg)) {
 		if (sk->sk_err) {
 			ret = -sk->sk_err;
@@ -1066,7 +1070,7 @@ static int tls_sw_sendmsg_locked(struct sock *sk, struct msghdr *msg,
 		orig_size = msg_pl->sg.size;
 		full_record = false;
 		try_to_copy = msg_data_left(msg);
-		record_room = TLS_MAX_PAYLOAD_SIZE - msg_pl->sg.size;
+		record_room = tls_record_size_limit - msg_pl->sg.size;
 		if (try_to_copy >= record_room) {
 			try_to_copy = record_room;
 			full_record = true;
-- 
2.50.1


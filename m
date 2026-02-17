Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333DE139D
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 17 Feb 2026 22:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771366839; cv=none; b=lP/0BDTzvyWwYYAspv1eU9mp1Q6Ix8v3RCEdYk9bVZ4tcgmp7kTrGqTcWYX09mz9gZ7WlxhItOxksstBX9bXlImgMDD54Gc3pgRUquS4gZoOjRBcqdleH6e+oRIHc9ViWBJexA5hImUMtYUSRAkgCsGg7VGMf1dappjqqNsHVu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771366839; c=relaxed/simple;
	bh=YyxfI6O14aUeoHfRyFZKy/06AfTkHX2rUpZZ7Bjb3qg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMkw4axHBxqIyarhs8xOuG4Aif+w2ZsclVSb3aXj5Z/jGH4g2/+qlxXdyEA3+695cIrpib6y/3K4Jnw6wR6889UO686WCSfgesGGzZmRCY0ID0ksveyf3IIRG5GeM3fye0Js8k2j7uNggrYkZEsBxEqh94ne4TvC09SDAa+zy8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=swhkr4//; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="swhkr4//"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E7DC4CEF7;
	Tue, 17 Feb 2026 22:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771366839;
	bh=YyxfI6O14aUeoHfRyFZKy/06AfTkHX2rUpZZ7Bjb3qg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=swhkr4//9/dxk8IEVNW2vU+acKc3xbv3zOrWSYVN7XN6zSI8ATquo2bzCQf7wM836
	 h72NbDLnob2ZWggoeIeCjQWzEHhjQl/bO4h7nl+Yc89V0L1aCuPx+9GlA/wWRWVvaY
	 8MHrzqyL/P254/A7a8qwqMLlbzf5LC7W3YENkhfA1MS4vqta3hR5SCfA5UtLisiYYA
	 521JMdmDmb2Al0NdyBhooOWVq8AOAhjtcvxv059GG6oFOynm7E9wX5nTDPtnFaGo/q
	 IJNcPilhMYNgSw87yWTJDeSmGGpPiR/rXQWofenItT+yr0woxeVhzo6wp5YqwZnPbv
	 yCcLcUIO+zp8Q==
From: Chuck Lever <cel@kernel.org>
To: Hannes Reinecke <hare@suse.de>,
	Olga Kornievskaia <okorniev@redhat.com>
Cc: kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [RFC PATCH 2/4] tls: Implement read_sock_cmsg for kTLS software path
Date: Tue, 17 Feb 2026 17:20:31 -0500
Message-ID: <20260217222033.1929211-3-cel@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217222033.1929211-1-cel@kernel.org>
References: <20260217222033.1929211-1-cel@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuck Lever <chuck.lever@oracle.com>

tls_sw_read_sock() rejects non-data records (alerts, handshake
messages) with -EINVAL. Kernel consumers that need TLS alert
delivery -- such as NFSD, NFS client, and NVMe target -- must fall
back to the slower sock_recvmsg() API to receive control messages
via CMSG.

Implement a more efficient API based on the new read_sock_cmsg()
method for these consumers.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 net/tls/tls.h      |  3 +++
 net/tls/tls_main.c |  2 ++
 net/tls/tls_sw.c   | 33 ++++++++++++++++++++++++++++-----
 3 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/net/tls/tls.h b/net/tls/tls.h
index 2f86baeb71fc..2e1581b6ca25 100644
--- a/net/tls/tls.h
+++ b/net/tls/tls.h
@@ -168,6 +168,9 @@ ssize_t tls_sw_splice_read(struct socket *sock, loff_t *ppos,
 			   size_t len, unsigned int flags);
 int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 		     sk_read_actor_t read_actor);
+int tls_sw_read_sock_cmsg(struct sock *sk, read_descriptor_t *desc,
+			   sk_read_actor_t read_actor,
+			   sk_read_cmsg_actor_t cmsg_actor);
 
 int tls_device_sendmsg(struct sock *sk, struct msghdr *msg, size_t size);
 void tls_device_splice_eof(struct socket *sock);
diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
index 56ce0bc8317b..40163d7baab4 100644
--- a/net/tls/tls_main.c
+++ b/net/tls/tls_main.c
@@ -946,11 +946,13 @@ static void build_proto_ops(struct proto_ops ops[TLS_NUM_CONFIG][TLS_NUM_CONFIG]
 	ops[TLS_BASE][TLS_SW  ].splice_read	= tls_sw_splice_read;
 	ops[TLS_BASE][TLS_SW  ].poll		= tls_sk_poll;
 	ops[TLS_BASE][TLS_SW  ].read_sock	= tls_sw_read_sock;
+	ops[TLS_BASE][TLS_SW  ].read_sock_cmsg	= tls_sw_read_sock_cmsg;
 
 	ops[TLS_SW  ][TLS_SW  ] = ops[TLS_SW  ][TLS_BASE];
 	ops[TLS_SW  ][TLS_SW  ].splice_read	= tls_sw_splice_read;
 	ops[TLS_SW  ][TLS_SW  ].poll		= tls_sk_poll;
 	ops[TLS_SW  ][TLS_SW  ].read_sock	= tls_sw_read_sock;
+	ops[TLS_SW  ][TLS_SW  ].read_sock_cmsg	= tls_sw_read_sock_cmsg;
 
 #ifdef CONFIG_TLS_DEVICE
 	ops[TLS_HW  ][TLS_BASE] = ops[TLS_BASE][TLS_BASE];
diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 9937d4c810f2..e45352b167c4 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2325,8 +2325,9 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	goto splice_read_end;
 }
 
-int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
-		     sk_read_actor_t read_actor)
+static int __tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
+			      sk_read_actor_t read_actor,
+			      sk_read_cmsg_actor_t cmsg_actor)
 {
 	struct tls_context *tls_ctx = tls_get_ctx(sk);
 	struct tls_sw_context_rx *ctx = tls_sw_ctx_rx(tls_ctx);
@@ -2387,10 +2388,19 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 			tls_rx_rec_done(ctx);
 		}
 
-		/* read_sock does not support reading control messages */
 		if (tlm->control != TLS_RECORD_TYPE_DATA) {
-			err = -EINVAL;
-			goto read_sock_requeue;
+			if (!cmsg_actor) {
+				err = -EINVAL;
+				goto read_sock_requeue;
+			}
+			err = cmsg_actor(desc, skb, rxm->offset,
+					 rxm->full_len, tlm->control);
+			if (err < 0)
+				goto read_sock_requeue;
+			consume_skb(skb);
+			if (!desc->count)
+				skb = NULL;
+			continue;
 		}
 
 		used = read_actor(desc, skb, rxm->offset, rxm->full_len);
@@ -2421,6 +2431,19 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 	goto read_sock_end;
 }
 
+int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
+		     sk_read_actor_t read_actor)
+{
+	return __tls_sw_read_sock(sk, desc, read_actor, NULL);
+}
+
+int tls_sw_read_sock_cmsg(struct sock *sk, read_descriptor_t *desc,
+			   sk_read_actor_t read_actor,
+			   sk_read_cmsg_actor_t cmsg_actor)
+{
+	return __tls_sw_read_sock(sk, desc, read_actor, cmsg_actor);
+}
+
 bool tls_sw_sock_is_readable(struct sock *sk)
 {
 	struct tls_context *tls_ctx = tls_get_ctx(sk);
-- 
2.53.0


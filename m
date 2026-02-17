Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2C4139D
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 17 Feb 2026 22:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771366840; cv=none; b=t5xQ9whphhDZ7pG8ZbTvawiNmD+UTDDUlVlAKUG2FigVK6jz7KTB66h3d3M0pJ0i5vJtyLt8Zd74RHWvtTQnlHI0K6CkJ0kW7+A4gLh0IZTUvEsp/uKTivSB0D2ReA6ts6OmGvNwUuYZga1E+HHqCw5+/13Dgp/Ka1+9xtMNL2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771366840; c=relaxed/simple;
	bh=UaeJsXoc5UQVsos5+NgSdXLVf3eTndm3sEwT4VD2nM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3ycNOO+nxaiVKkky1N8/OQS5kLWhz7PMXPmmEnfawo6KByfwdYgxfYKVBqiUWCWoDBt2OXqK9wO59voLdjadb1/xwcCiQ6BIfysyJH5GvGNqzMFDkVP9jaomuYKYewHAkYLUW5dG8vcTnN6tGBXNVvEAJegTlfyrySfi/13NBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m3KMxs7v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m3KMxs7v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C46C19423;
	Tue, 17 Feb 2026 22:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771366840;
	bh=UaeJsXoc5UQVsos5+NgSdXLVf3eTndm3sEwT4VD2nM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m3KMxs7vRIZOiMej7GXkpBoxjxGS1f8MH4yGr8icpwd7cWXV8oHtV0PIc5wWYwETE
	 WFsjBU8TTEF+G04sUYIkCWVE2b3G/sY+QHHpnK68QlmpE+37CaZt1O7ArOBi8dIggO
	 5zUY+t6UlXoJ3B/OoRsLHx8BsFZI1o5Wp6wMYPP0Sv1eNeAjvdGfvOZj2MtG7/qQBJ
	 ohSy1hAd+i9ls7Bc6XhpnDB36MQZzRT2G/gYV6/phmFJdgNMGROVuB8zt054cnObfr
	 e4w9YrNxgQza2y38Meu9mLMWOPu5KUtRaoCSwsfIAUum7CkcqEEHiy5Gn+Ri2hRRO2
	 rzn/vscsfMhXA==
From: Chuck Lever <cel@kernel.org>
To: Hannes Reinecke <hare@suse.de>,
	Olga Kornievskaia <okorniev@redhat.com>
Cc: kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [RFC PATCH 4/4] sunrpc: Remove sock_recvmsg path from svcsock TCP receives
Date: Tue, 17 Feb 2026 17:20:33 -0500
Message-ID: <20260217222033.1929211-5-cel@kernel.org>
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

The svcsock TCP receive path maintains two code paths: one
using read_sock/read_sock_cmsg and a legacy path using
sock_recvmsg. Plain TCP sockets already provide read_sock
(tcp_read_sock) in their proto_ops, so the read_sock_cmsg
path can handle all cases relevant to NFSD by falling back
to read_sock when kTLS is not active.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 net/sunrpc/svcsock.c | 314 +++----------------------------------------
 1 file changed, 22 insertions(+), 292 deletions(-)

diff --git a/net/sunrpc/svcsock.c b/net/sunrpc/svcsock.c
index 9600d15287e7..7d614dc44a05 100644
--- a/net/sunrpc/svcsock.c
+++ b/net/sunrpc/svcsock.c
@@ -238,140 +238,6 @@ static int svc_one_sock_name(struct svc_sock *svsk, char *buf, int remaining)
 	return len;
 }
 
-static int
-svc_tcp_sock_process_cmsg(struct socket *sock, struct msghdr *msg,
-			  struct cmsghdr *cmsg, int ret)
-{
-	u8 content_type = tls_get_record_type(sock->sk, cmsg);
-	u8 level, description;
-
-	switch (content_type) {
-	case 0:
-		break;
-	case TLS_RECORD_TYPE_DATA:
-		/* TLS sets EOR at the end of each application data
-		 * record, even though there might be more frames
-		 * waiting to be decrypted.
-		 */
-		msg->msg_flags &= ~MSG_EOR;
-		break;
-	case TLS_RECORD_TYPE_ALERT:
-		tls_alert_recv(sock->sk, msg, &level, &description);
-		ret = (level == TLS_ALERT_LEVEL_FATAL) ?
-			-ENOTCONN : -EAGAIN;
-		break;
-	default:
-		/* discard this record type */
-		ret = -EAGAIN;
-	}
-	return ret;
-}
-
-static int
-svc_tcp_sock_recv_cmsg(struct socket *sock, unsigned int *msg_flags)
-{
-	union {
-		struct cmsghdr	cmsg;
-		u8		buf[CMSG_SPACE(sizeof(u8))];
-	} u;
-	u8 alert[2];
-	struct kvec alert_kvec = {
-		.iov_base = alert,
-		.iov_len = sizeof(alert),
-	};
-	struct msghdr msg = {
-		.msg_flags = *msg_flags,
-		.msg_control = &u,
-		.msg_controllen = sizeof(u),
-	};
-	int ret;
-
-	iov_iter_kvec(&msg.msg_iter, ITER_DEST, &alert_kvec, 1,
-		      alert_kvec.iov_len);
-	ret = sock_recvmsg(sock, &msg, MSG_DONTWAIT);
-	if (ret > 0 &&
-	    tls_get_record_type(sock->sk, &u.cmsg) == TLS_RECORD_TYPE_ALERT) {
-		iov_iter_revert(&msg.msg_iter, ret);
-		ret = svc_tcp_sock_process_cmsg(sock, &msg, &u.cmsg, -EAGAIN);
-	}
-	return ret;
-}
-
-static int
-svc_tcp_sock_recvmsg(struct svc_sock *svsk, struct msghdr *msg)
-{
-	int ret;
-	struct socket *sock = svsk->sk_sock;
-
-	ret = sock_recvmsg(sock, msg, MSG_DONTWAIT);
-	if (msg->msg_flags & MSG_CTRUNC) {
-		msg->msg_flags &= ~(MSG_CTRUNC | MSG_EOR);
-		if (ret == 0 || ret == -EIO)
-			ret = svc_tcp_sock_recv_cmsg(sock, &msg->msg_flags);
-	}
-	return ret;
-}
-
-#if ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE
-static void svc_flush_bvec(const struct bio_vec *bvec, size_t size, size_t seek)
-{
-	struct bvec_iter bi = {
-		.bi_size	= size + seek,
-	};
-	struct bio_vec bv;
-
-	bvec_iter_advance(bvec, &bi, seek & PAGE_MASK);
-	for_each_bvec(bv, bvec, bi, bi)
-		flush_dcache_page(bv.bv_page);
-}
-#else
-static inline void svc_flush_bvec(const struct bio_vec *bvec, size_t size,
-				  size_t seek)
-{
-}
-#endif
-
-/*
- * Read from @rqstp's transport socket. The incoming message fills whole
- * pages in @rqstp's rq_pages array until the last page of the message
- * has been received into a partial page.
- */
-static ssize_t svc_tcp_read_msg(struct svc_rqst *rqstp, size_t buflen,
-				size_t seek)
-{
-	struct svc_sock *svsk =
-		container_of(rqstp->rq_xprt, struct svc_sock, sk_xprt);
-	struct bio_vec *bvec = rqstp->rq_bvec;
-	struct msghdr msg = { NULL };
-	unsigned int i;
-	ssize_t len;
-	size_t t;
-
-	clear_bit(XPT_DATA, &svsk->sk_xprt.xpt_flags);
-
-	for (i = 0, t = 0; t < buflen; i++, t += PAGE_SIZE)
-		bvec_set_page(&bvec[i], rqstp->rq_pages[i], PAGE_SIZE, 0);
-	rqstp->rq_respages = &rqstp->rq_pages[i];
-	rqstp->rq_next_page = rqstp->rq_respages + 1;
-
-	iov_iter_bvec(&msg.msg_iter, ITER_DEST, bvec, i, buflen);
-	if (seek) {
-		iov_iter_advance(&msg.msg_iter, seek);
-		buflen -= seek;
-	}
-	len = svc_tcp_sock_recvmsg(svsk, &msg);
-	if (len > 0)
-		svc_flush_bvec(bvec, len, seek);
-
-	/* If we read a full record, then assume there may be more
-	 * data to read (stream based sockets only!)
-	 */
-	if (len == buflen)
-		set_bit(XPT_DATA, &svsk->sk_xprt.xpt_flags);
-
-	return len;
-}
-
 /*
  * Set socket snd and rcv buffer lengths
  */
@@ -1038,50 +904,6 @@ static void svc_tcp_clear_pages(struct svc_sock *svsk)
 	svsk->sk_datalen = 0;
 }
 
-/*
- * Receive fragment record header into sk_marker.
- */
-static ssize_t svc_tcp_read_marker(struct svc_sock *svsk,
-				   struct svc_rqst *rqstp)
-{
-	ssize_t want, len;
-
-	/* If we haven't gotten the record length yet,
-	 * get the next four bytes.
-	 */
-	if (svsk->sk_tcplen < sizeof(rpc_fraghdr)) {
-		struct msghdr	msg = { NULL };
-		struct kvec	iov;
-
-		want = sizeof(rpc_fraghdr) - svsk->sk_tcplen;
-		iov.iov_base = ((char *)&svsk->sk_marker) + svsk->sk_tcplen;
-		iov.iov_len  = want;
-		iov_iter_kvec(&msg.msg_iter, ITER_DEST, &iov, 1, want);
-		len = svc_tcp_sock_recvmsg(svsk, &msg);
-		if (len < 0)
-			return len;
-		svsk->sk_tcplen += len;
-		if (len < want) {
-			/* call again to read the remaining bytes */
-			goto err_short;
-		}
-		trace_svcsock_marker(&svsk->sk_xprt, svsk->sk_marker);
-		if (svc_sock_reclen(svsk) + svsk->sk_datalen >
-		    svsk->sk_xprt.xpt_server->sv_max_mesg)
-			goto err_too_large;
-	}
-	return svc_sock_reclen(svsk);
-
-err_too_large:
-	net_notice_ratelimited("svc: %s oversized RPC fragment (%u octets) from %pISpc\n",
-			       svsk->sk_xprt.xpt_server->sv_name,
-			       svc_sock_reclen(svsk),
-			       (struct sockaddr *)&svsk->sk_xprt.xpt_remote);
-	svc_xprt_deferred_close(&svsk->sk_xprt);
-err_short:
-	return -EAGAIN;
-}
-
 static int receive_cb_reply(struct svc_sock *svsk, struct svc_rqst *rqstp)
 {
 	struct rpc_xprt *bc_xprt = svsk->sk_xprt.xpt_bc_xprt;
@@ -1252,7 +1074,21 @@ static int svc_tcp_cmsg_actor(read_descriptor_t *desc,
 	return -EAGAIN;
 }
 
-static int svc_tcp_recvfrom_readsock(struct svc_rqst *rqstp)
+/**
+ * svc_tcp_recvfrom - Receive data from a TCP socket
+ * @rqstp: request structure into which to receive an RPC Call
+ *
+ * Called in a loop when XPT_DATA has been set.
+ *
+ * Returns:
+ *   On success, the number of bytes in a received RPC Call, or
+ *   %0 if a complete RPC Call message was not ready to return
+ *
+ * The zero return case handles partial receives and callback Replies.
+ * The state of a partial receive is preserved in the svc_sock for
+ * the next call to svc_tcp_recvfrom.
+ */
+static int svc_tcp_recvfrom(struct svc_rqst *rqstp)
 {
 	struct svc_sock *svsk =
 		container_of(rqstp->rq_xprt, struct svc_sock, sk_xprt);
@@ -1278,9 +1114,13 @@ static int svc_tcp_recvfrom_readsock(struct svc_rqst *rqstp)
 
 	desc.count = serv->sv_max_mesg;
 	lock_sock(sk);
-	len = svsk->sk_sock->ops->read_sock_cmsg(sk, &desc,
-						  svc_tcp_recv_actor,
-						  svc_tcp_cmsg_actor);
+	if (svsk->sk_sock->ops->read_sock_cmsg)
+		len = svsk->sk_sock->ops->read_sock_cmsg(sk, &desc,
+							  svc_tcp_recv_actor,
+							  svc_tcp_cmsg_actor);
+	else
+		len = svsk->sk_sock->ops->read_sock(sk, &desc,
+						     svc_tcp_recv_actor);
 	release_sock(sk);
 
 	if (desc.error == -EMSGSIZE)
@@ -1366,116 +1206,6 @@ static int svc_tcp_recvfrom_readsock(struct svc_rqst *rqstp)
 	return 0;
 }
 
-/**
- * svc_tcp_recvfrom - Receive data from a TCP socket
- * @rqstp: request structure into which to receive an RPC Call
- *
- * Called in a loop when XPT_DATA has been set.
- *
- * Read the 4-byte stream record marker, then use the record length
- * in that marker to set up exactly the resources needed to receive
- * the next RPC message into @rqstp.
- *
- * Returns:
- *   On success, the number of bytes in a received RPC Call, or
- *   %0 if a complete RPC Call message was not ready to return
- *
- * The zero return case handles partial receives and callback Replies.
- * The state of a partial receive is preserved in the svc_sock for
- * the next call to svc_tcp_recvfrom.
- */
-static int svc_tcp_recvfrom(struct svc_rqst *rqstp)
-{
-	struct svc_sock	*svsk =
-		container_of(rqstp->rq_xprt, struct svc_sock, sk_xprt);
-	struct svc_serv	*serv = svsk->sk_xprt.xpt_server;
-	size_t want, base;
-	ssize_t len;
-	__be32 *p;
-	__be32 calldir;
-
-	if (svsk->sk_sock->ops->read_sock_cmsg)
-		return svc_tcp_recvfrom_readsock(rqstp);
-
-	clear_bit(XPT_DATA, &svsk->sk_xprt.xpt_flags);
-	len = svc_tcp_read_marker(svsk, rqstp);
-	if (len < 0)
-		goto error;
-
-	base = svc_tcp_restore_pages(svsk, rqstp);
-	want = len - (svsk->sk_tcplen - sizeof(rpc_fraghdr));
-	len = svc_tcp_read_msg(rqstp, base + want, base);
-	if (len >= 0) {
-		trace_svcsock_tcp_recv(&svsk->sk_xprt, len);
-		svsk->sk_tcplen += len;
-		svsk->sk_datalen += len;
-	}
-	if (len != want || !svc_sock_final_rec(svsk))
-		goto err_incomplete;
-	if (svsk->sk_datalen < 8)
-		goto err_nuts;
-
-	rqstp->rq_arg.len = svsk->sk_datalen;
-	rqstp->rq_arg.page_base = 0;
-	if (rqstp->rq_arg.len <= rqstp->rq_arg.head[0].iov_len) {
-		rqstp->rq_arg.head[0].iov_len = rqstp->rq_arg.len;
-		rqstp->rq_arg.page_len = 0;
-	} else
-		rqstp->rq_arg.page_len = rqstp->rq_arg.len - rqstp->rq_arg.head[0].iov_len;
-
-	rqstp->rq_xprt_ctxt   = NULL;
-	rqstp->rq_prot	      = IPPROTO_TCP;
-	if (test_bit(XPT_LOCAL, &svsk->sk_xprt.xpt_flags))
-		set_bit(RQ_LOCAL, &rqstp->rq_flags);
-	else
-		clear_bit(RQ_LOCAL, &rqstp->rq_flags);
-
-	p = (__be32 *)rqstp->rq_arg.head[0].iov_base;
-	calldir = p[1];
-	if (calldir)
-		len = receive_cb_reply(svsk, rqstp);
-
-	/* Reset TCP read info */
-	svsk->sk_datalen = 0;
-	svc_tcp_fragment_received(svsk);
-
-	if (len < 0)
-		goto error;
-
-	svc_xprt_copy_addrs(rqstp, &svsk->sk_xprt);
-	if (serv->sv_stats)
-		serv->sv_stats->nettcpcnt++;
-
-	svc_sock_secure_port(rqstp);
-	svc_xprt_received(rqstp->rq_xprt);
-	return rqstp->rq_arg.len;
-
-err_incomplete:
-	svc_tcp_save_pages(svsk, rqstp);
-	if (len < 0 && len != -EAGAIN)
-		goto err_delete;
-	if (len == want)
-		svc_tcp_fragment_received(svsk);
-	else
-		trace_svcsock_tcp_recv_short(&svsk->sk_xprt,
-				svc_sock_reclen(svsk),
-				svsk->sk_tcplen - sizeof(rpc_fraghdr));
-	goto err_noclose;
-error:
-	if (len != -EAGAIN)
-		goto err_delete;
-	trace_svcsock_tcp_recv_eagain(&svsk->sk_xprt, 0);
-	goto err_noclose;
-err_nuts:
-	svsk->sk_datalen = 0;
-err_delete:
-	trace_svcsock_tcp_recv_err(&svsk->sk_xprt, len);
-	svc_xprt_deferred_close(&svsk->sk_xprt);
-err_noclose:
-	svc_xprt_received(rqstp->rq_xprt);
-	return 0;	/* record not complete */
-}
-
 /*
  * MSG_SPLICE_PAGES is used exclusively to reduce the number of
  * copy operations in this path. Therefore the caller must ensure
-- 
2.53.0


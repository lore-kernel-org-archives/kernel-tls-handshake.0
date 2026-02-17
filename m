Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3E2139D
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 17 Feb 2026 22:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771366839; cv=none; b=I+LM9fGLXd/JypCUfNAjVUi4IWaOpNR0vf57F2GBjiN4L1eQHU+9p6TIsSl1SjxHMpGfAUuJ38gUwt34Q+y3ekCmDdk7PzmcwKSvXip0FN9+wPz6eUMmqpkc0xvfgnUA1GuyxSYPTk+GIIDXeKGKTsQWEkWfSL2NC0d5nVceSpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771366839; c=relaxed/simple;
	bh=BgHbxxN59ot/Lr4qkheVm3bjkxU6JYB1qe7wFMFRGW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dncWeh1O5YHE46hzwkjW34gmaE5yXDW02TLaI1BDzJtCiLWezweVTDyg8OukbEdFbBfxeR8DCS1CKIn5iAmTSFj5eDMXTnqnn/tx+u6yETAoowWYtdEAA9qEQuTuQivv0j49QMUYi8CqPTDAx1MxY/hzDYvMSPxaF4Tz2owKMFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyAO34AD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyAO34AD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403A0C19421;
	Tue, 17 Feb 2026 22:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771366839;
	bh=BgHbxxN59ot/Lr4qkheVm3bjkxU6JYB1qe7wFMFRGW0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FyAO34ADmQq7glQ0hWiu3pP/PBCOHH++ATEbWnWBJOK8k7XCH/42fak7DKtiCk1cN
	 aYYHXekVF0lis7ySv0rz+3yco4dnaLQwxQY6X0T1yN9qny56sC2Ht+5R+LuNwNA/CI
	 Y2W9RzqqUqNRfb+dePTkXGYuaKV8dZLGSDpCy6N4pmG0StE1AxjpwUFNCAbqTbRIPP
	 VfPwmuSc8OBrkCsP22BpqIfDWiqmKjNUHDGrLXy46vuJlUq7HlOdE+DOYAu4uecse3
	 g9Jfhu2y6rDJcwfS8e8486ZaFmeLdUkD88EMT2FYJiOJY5IZmILCHTcrmXbyjIuOS7
	 J6qwyYPEVz2Lg==
From: Chuck Lever <cel@kernel.org>
To: Hannes Reinecke <hare@suse.de>,
	Olga Kornievskaia <okorniev@redhat.com>
Cc: kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [RFC PATCH 3/4] sunrpc: Use read_sock_cmsg for svcsock TCP receives
Date: Tue, 17 Feb 2026 17:20:32 -0500
Message-ID: <20260217222033.1929211-4-cel@kernel.org>
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

The svcsock TCP receive path uses sock_recvmsg() with ancillary data
buffers to detect TLS alerts when kTLS is active. This CMSG-based
approach has two drawbacks: the MSG_CTRUNC recovery dance adds
overhead to every receive, and sock_recvmsg() cannot take advantage
of zero-copy optimizations available through read_sock.

When the socket provides a read_sock_cmsg method (now set by kTLS),
svc_tcp_recvfrom() now dispatches to a new
svc_tcp_recvfrom_readsock() path. Two actor callbacks handle the
data:

svc_tcp_recv_actor() parses the RPC record byte stream directly from
skbs. Fragment header bytes fill sk_marker first; subsequent body
bytes are copied into rq_pages at the position tracked by
sk_datalen. When the last fragment of a complete RPC message
arrives, the actor sets desc->count to zero, stopping the read loop.

svc_tcp_cmsg_actor() handles non-data TLS records. For fatal alerts,
the transport is marked for deferred close. All non-data records
stop the read loop so callers can inspect the error before
continuing.

The existing sock_recvmsg() path remains as a fallback for sockets
without read_sock_cmsg (plain TCP, non-kTLS configurations).

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 net/sunrpc/svcsock.c | 245 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 245 insertions(+)

diff --git a/net/sunrpc/svcsock.c b/net/sunrpc/svcsock.c
index d61cd9b40491..9600d15287e7 100644
--- a/net/sunrpc/svcsock.c
+++ b/net/sunrpc/svcsock.c
@@ -1124,6 +1124,248 @@ static void svc_tcp_fragment_received(struct svc_sock *svsk)
 	svsk->sk_marker = xdr_zero;
 }
 
+/*
+ * read_sock_cmsg data actor: receives decrypted application data
+ * from the TLS layer, parsing the RPC record stream (fragment
+ * headers and message bodies) and assembling complete RPC messages
+ * into @rqstp->rq_pages.
+ */
+static int svc_tcp_recv_actor(read_descriptor_t *desc,
+			      struct sk_buff *skb,
+			      unsigned int offset, size_t len)
+{
+	struct svc_rqst *rqstp = desc->arg.data;
+	struct svc_sock *svsk =
+		container_of(rqstp->rq_xprt, struct svc_sock, sk_xprt);
+	size_t consumed = 0;
+
+	/* Phase 1: consume fragment header bytes */
+	while (svsk->sk_tcplen < sizeof(rpc_fraghdr) && len > 0) {
+		size_t want = sizeof(rpc_fraghdr) - svsk->sk_tcplen;
+		size_t n = min(want, len);
+
+		if (skb_copy_bits(skb, offset,
+				  (char *)&svsk->sk_marker +
+					svsk->sk_tcplen, n))
+			goto fault;
+		svsk->sk_tcplen += n;
+		offset += n;
+		len -= n;
+		consumed += n;
+
+		if (svsk->sk_tcplen < sizeof(rpc_fraghdr))
+			return consumed;
+
+		trace_svcsock_marker(&svsk->sk_xprt, svsk->sk_marker);
+		if (svc_sock_reclen(svsk) + svsk->sk_datalen >
+		    svsk->sk_xprt.xpt_server->sv_max_mesg) {
+			net_notice_ratelimited("svc: %s oversized RPC fragment (%u octets)\n",
+					       svsk->sk_xprt.xpt_server->sv_name,
+					       svc_sock_reclen(svsk));
+			desc->error = -EMSGSIZE;
+			desc->count = 0;
+			return consumed;
+		}
+	}
+
+	if (len == 0)
+		return consumed;
+
+	/* Phase 2: copy body data into rq_pages */
+	{
+		size_t reclen = svc_sock_reclen(svsk);
+		size_t received = svsk->sk_tcplen - sizeof(rpc_fraghdr);
+		size_t want = reclen - received;
+		size_t take = min(want, len);
+		size_t done = 0;
+
+		while (done < take) {
+			unsigned int pg = svsk->sk_datalen >> PAGE_SHIFT;
+			unsigned int pg_off = svsk->sk_datalen &
+						(PAGE_SIZE - 1);
+			size_t chunk = min(take - done,
+					   PAGE_SIZE - (size_t)pg_off);
+
+			if (skb_copy_bits(skb, offset,
+					  page_address(rqstp->rq_pages[pg])
+						+ pg_off,
+					  chunk))
+				goto fault;
+			offset += chunk;
+			done += chunk;
+			svsk->sk_datalen += chunk;
+		}
+		svsk->sk_tcplen += take;
+		consumed += take;
+
+		/* Fragment complete? */
+		if (svsk->sk_tcplen - sizeof(rpc_fraghdr) >= reclen) {
+			if (svc_sock_final_rec(svsk)) {
+				desc->count = 0;
+			} else {
+				svc_tcp_fragment_received(svsk);
+			}
+		}
+	}
+
+	return consumed;
+
+fault:
+	desc->error = -EFAULT;
+	desc->count = 0;
+	return consumed;
+}
+
+/*
+ * read_sock_cmsg control message actor: receives non-data TLS
+ * records (alerts, handshake messages) and translates them into
+ * transport-level actions.
+ */
+static int svc_tcp_cmsg_actor(read_descriptor_t *desc,
+			      struct sk_buff *skb,
+			      unsigned int offset, size_t len,
+			      u8 content_type)
+{
+	struct svc_rqst *rqstp = desc->arg.data;
+	struct svc_sock *svsk =
+		container_of(rqstp->rq_xprt, struct svc_sock, sk_xprt);
+
+	switch (content_type) {
+	case TLS_RECORD_TYPE_ALERT:
+		if (len >= 2) {
+			u8 alert[2];
+
+			if (!skb_copy_bits(skb, offset, alert,
+					   sizeof(alert))) {
+				if (alert[0] == TLS_ALERT_LEVEL_FATAL) {
+					svc_xprt_deferred_close(
+							&svsk->sk_xprt);
+					desc->error = -ENOTCONN;
+					desc->count = 0;
+				}
+			}
+		}
+		break;
+	default:
+		break;
+	}
+	return -EAGAIN;
+}
+
+static int svc_tcp_recvfrom_readsock(struct svc_rqst *rqstp)
+{
+	struct svc_sock *svsk =
+		container_of(rqstp->rq_xprt, struct svc_sock, sk_xprt);
+	struct svc_serv *serv = svsk->sk_xprt.xpt_server;
+	struct sock *sk = svsk->sk_sk;
+	read_descriptor_t desc = {
+		.arg.data = rqstp,
+	};
+	ssize_t len;
+	__be32 *p;
+	__be32 calldir;
+
+	clear_bit(XPT_DATA, &svsk->sk_xprt.xpt_flags);
+
+	svc_tcp_restore_pages(svsk, rqstp);
+	rqstp->rq_arg.head[0].iov_base = page_address(rqstp->rq_pages[0]);
+
+	/* Ensure no stale response pages are released if the
+	 * receive returns without completing a full message.
+	 */
+	rqstp->rq_respages = rqstp->rq_page_end;
+	rqstp->rq_next_page = rqstp->rq_page_end;
+
+	desc.count = serv->sv_max_mesg;
+	lock_sock(sk);
+	len = svsk->sk_sock->ops->read_sock_cmsg(sk, &desc,
+						  svc_tcp_recv_actor,
+						  svc_tcp_cmsg_actor);
+	release_sock(sk);
+
+	if (desc.error == -EMSGSIZE)
+		goto err_delete;
+	if (desc.error < 0) {
+		len = desc.error;
+		goto error;
+	}
+	if (desc.count != 0) {
+		/* Incomplete message */
+		if (len > 0)
+			set_bit(XPT_DATA, &svsk->sk_xprt.xpt_flags);
+		goto err_incomplete;
+	}
+
+	/* Complete RPC message received */
+	if (svsk->sk_datalen < 8)
+		goto err_nuts;
+
+	rqstp->rq_arg.len = svsk->sk_datalen;
+	rqstp->rq_arg.page_base = 0;
+	if (rqstp->rq_arg.len <= rqstp->rq_arg.head[0].iov_len) {
+		rqstp->rq_arg.head[0].iov_len = rqstp->rq_arg.len;
+		rqstp->rq_arg.page_len = 0;
+	} else {
+		rqstp->rq_arg.page_len = rqstp->rq_arg.len -
+			rqstp->rq_arg.head[0].iov_len;
+	}
+
+	{
+		unsigned int pg_count =
+			(svsk->sk_datalen + PAGE_SIZE - 1) >> PAGE_SHIFT;
+		rqstp->rq_respages = &rqstp->rq_pages[pg_count];
+		rqstp->rq_next_page = rqstp->rq_respages + 1;
+	}
+
+	rqstp->rq_xprt_ctxt = NULL;
+	rqstp->rq_prot = IPPROTO_TCP;
+	if (test_bit(XPT_LOCAL, &svsk->sk_xprt.xpt_flags))
+		set_bit(RQ_LOCAL, &rqstp->rq_flags);
+	else
+		clear_bit(RQ_LOCAL, &rqstp->rq_flags);
+
+	p = (__be32 *)rqstp->rq_arg.head[0].iov_base;
+	calldir = p[1];
+	if (calldir)
+		len = receive_cb_reply(svsk, rqstp);
+
+	/* Reset TCP read info */
+	svsk->sk_datalen = 0;
+	svc_tcp_fragment_received(svsk);
+
+	if (len < 0)
+		goto error;
+
+	trace_svcsock_tcp_recv(&svsk->sk_xprt, rqstp->rq_arg.len);
+	svc_xprt_copy_addrs(rqstp, &svsk->sk_xprt);
+	if (serv->sv_stats)
+		serv->sv_stats->nettcpcnt++;
+
+	svc_sock_secure_port(rqstp);
+	set_bit(XPT_DATA, &svsk->sk_xprt.xpt_flags);
+	svc_xprt_received(rqstp->rq_xprt);
+	return rqstp->rq_arg.len;
+
+err_incomplete:
+	svc_tcp_save_pages(svsk, rqstp);
+	if (len < 0 && len != -EAGAIN)
+		goto err_delete;
+	goto err_noclose;
+error:
+	if (len != -EAGAIN)
+		goto err_delete;
+	trace_svcsock_tcp_recv_eagain(&svsk->sk_xprt, 0);
+	goto err_noclose;
+err_nuts:
+	svsk->sk_datalen = 0;
+err_delete:
+	trace_svcsock_tcp_recv_err(&svsk->sk_xprt, len);
+	svc_xprt_deferred_close(&svsk->sk_xprt);
+err_noclose:
+	svc_xprt_received(rqstp->rq_xprt);
+	return 0;
+}
+
 /**
  * svc_tcp_recvfrom - Receive data from a TCP socket
  * @rqstp: request structure into which to receive an RPC Call
@@ -1152,6 +1394,9 @@ static int svc_tcp_recvfrom(struct svc_rqst *rqstp)
 	__be32 *p;
 	__be32 calldir;
 
+	if (svsk->sk_sock->ops->read_sock_cmsg)
+		return svc_tcp_recvfrom_readsock(rqstp);
+
 	clear_bit(XPT_DATA, &svsk->sk_xprt.xpt_flags);
 	len = svc_tcp_read_marker(svsk, rqstp);
 	if (len < 0)
-- 
2.53.0


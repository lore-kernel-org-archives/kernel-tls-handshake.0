Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A104139D
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 17 Feb 2026 22:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771366838; cv=none; b=m8xd1tTsQo6LNxHlcHLcJrR+rHng3MBG7588/LQYfUJWL9CbxInvOv08eZMh9feqU4LQS1pUlO4Lg/tNhCyM/ER3oYo/EoKrR586Qj1fpt6FkhpC0ZbwUganK3+1f8xKy6cMv7wWLssIkKsg7v2WaHw3dWbAgHldyb9ZqSr3N9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771366838; c=relaxed/simple;
	bh=GeWHfZfVnQYBXPJI4RhEHiwW5xeggoFS24GbgcF4qPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M46dq3SIJKV3bzn+nit9NgTmXo7DTgIKGxour8W5oc5MAH8aYdp/zGDMHANcL+84Om/zUvqViTrwL7JOFOc3cPsC1lRUCxBVb3SvFJeOcaBv/uNpX82o1+93g0yqlG2TUXtwePr12LML0TTuKgPXtS9FJ4jd9MTdHOVdP+PX9iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqochXDl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqochXDl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E96BC19421;
	Tue, 17 Feb 2026 22:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771366838;
	bh=GeWHfZfVnQYBXPJI4RhEHiwW5xeggoFS24GbgcF4qPM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SqochXDlzIRFm1jWsU3Txh8Pxw9mGsi/p1pH+tpD8iVfbO8O+YNmaF27XK1e2/vMB
	 9+XKHxmRxClSCDOqbDJWSq1+HPaZVbMEz+df6qojYFXZ6JMHaRnU9xPwpb1aIWrpMG
	 bRlTDAsoSIJG7W6cMCQwmS5zbXVWBbyGMGBBP4ZgnOQXJW0RU2iCmabWt6LzG/J+xl
	 06XUo6mneKcF2ewdCa9RJmjNh0ECMgwXvuJvwmcNhf34L10YheNmfzV6/yH/Nj3QQB
	 MztdWMW2H8akeKuK0sPJguEFr/daGRM4pynq3UGgfHjcyZofPT2cf0oaJMnml1Z9Ss
	 sv557tMwI9FKA==
From: Chuck Lever <cel@kernel.org>
To: Hannes Reinecke <hare@suse.de>,
	Olga Kornievskaia <okorniev@redhat.com>
Cc: kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [RFC PATCH 1/4] net: Introduce read_sock_cmsg proto_ops for control message delivery
Date: Tue, 17 Feb 2026 17:20:30 -0500
Message-ID: <20260217222033.1929211-2-cel@kernel.org>
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

Kernel TCP consumers that use the read_sock interface
(proto_ops.read_sock) cannot receive TLS control messages (Alerts,
Handshake records) when kTLS is active. The current
tls_sw_read_sock() method rejects non-data records with -EINVAL, and
the sk_read_actor_t callback has no channel for delivering record-
type metadata.

Four kernel subsystems are affected: NFSD (sunrpc svcsock), NFS
client (sunrpc xprtsock), NVMe target (nvmet-tcp), and NVMe host
(nvme-tcp). Each of these either falls back to the slower
sock_recvmsg() API or lacks TLS alert handling entirely.

A new read_sock_cmsg method in struct proto_ops provides a separate
code path that delivers non-data TLS records to a callback, without
changing the existing read_sock behavior used by consumers of the
existing read_sock method.

The new sk_read_cmsg_actor_t callback type extends the
sk_read_actor_t signature with a content_type parameter carrying the
protocol-layer record type (for example, TLS_RECORD_TYPE_ALERT).

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 include/linux/net.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/net.h b/include/linux/net.h
index f58b38ab37f8..94eb1c3c1cb6 100644
--- a/include/linux/net.h
+++ b/include/linux/net.h
@@ -154,6 +154,10 @@ struct sk_buff;
 struct proto_accept_arg;
 typedef int (*sk_read_actor_t)(read_descriptor_t *, struct sk_buff *,
 			       unsigned int, size_t);
+typedef int (*sk_read_cmsg_actor_t)(read_descriptor_t *,
+				    struct sk_buff *,
+				    unsigned int, size_t,
+				    u8 content_type);
 typedef int (*skb_read_actor_t)(struct sock *, struct sk_buff *);
 
 
@@ -218,6 +222,10 @@ struct proto_ops {
 	 */
 	int		(*read_sock)(struct sock *sk, read_descriptor_t *desc,
 				     sk_read_actor_t recv_actor);
+	int		(*read_sock_cmsg)(struct sock *sk,
+					  read_descriptor_t *desc,
+					  sk_read_actor_t recv_actor,
+					  sk_read_cmsg_actor_t cmsg_actor);
 	/* This is different from read_sock(), it reads an entire skb at a time. */
 	int		(*read_skb)(struct sock *sk, skb_read_actor_t recv_actor);
 	int		(*sendmsg_locked)(struct sock *sk, struct msghdr *msg,
-- 
2.53.0


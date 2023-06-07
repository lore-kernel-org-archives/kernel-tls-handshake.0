Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED216139F
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  7 Jun 2023 13:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5899FC433EF;
	Wed,  7 Jun 2023 13:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686146313;
	bh=Kyed/UbvWRho6vpmPpr7ylX/Da6hV2+VkFDzdFRluTc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=d2YYlP4bGg0EIT+e/WhLbIdm1/SPKR0HByk82D1pi//3n09xqxZxki3FIIFHLE6VO
	 KwKknIIasXkbp09eIcdt2BWjr683ONZ/i1BiFEIUTxkRkX5xpKERcpslgNKG1EyD7j
	 32okWuL8kdnWecCzi8Ad2xc2dbYUw3Wh+8BnaldWLxIk1naVzXfEPvQYMNmAlAkzH2
	 1FD1iZ738No+7/JbNMzRDuPtsyw2T3pNUw1xjLjRJac6zXI7MGiv9r8EywNdRfuTLP
	 WwHyN69skYrQ64uIyMqsNIh/FAXaQJuGjU96vINhPPHKOsCDyQ2FnlINwFrvCBedh6
	 F9BaJDjSiZN7Q==
Subject: [PATCH v4 5/9] SUNRPC: Ignore data_ready callbacks during TLS
 handshakes
From: Chuck Lever <cel@kernel.org>
To: anna.schumaker@netapp.com, trondmy@hammerspace.com
Cc: Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 linux-nfs@vger.kernel.org, kernel-tls-handshake@lists.linux.dev
Date: Wed, 07 Jun 2023 09:58:22 -0400
Message-ID: 
 <168614630078.2082.10542565529959605024.stgit@oracle-102.nfsv4bat.org>
In-Reply-To: 
 <168614594328.2082.13408337606138447754.stgit@oracle-102.nfsv4bat.org>
References: 
 <168614594328.2082.13408337606138447754.stgit@oracle-102.nfsv4bat.org>
User-Agent: StGit/1.5
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Chuck Lever <chuck.lever@oracle.com>

The RPC header parser doesn't recognize TLS handshake traffic, so it
will close the connection prematurely with an error. To avoid that,
shunt the transport's data_ready callback when there is a TLS
handshake in progress.

The XPRT_SOCK_IGNORE_RECV flag will be toggled by code added in a
subsequent patch.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 include/linux/sunrpc/xprtsock.h |    1 +
 net/sunrpc/xprtsock.c           |    6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/linux/sunrpc/xprtsock.h b/include/linux/sunrpc/xprtsock.h
index 38284f25eddf..daef030f4848 100644
--- a/include/linux/sunrpc/xprtsock.h
+++ b/include/linux/sunrpc/xprtsock.h
@@ -90,5 +90,6 @@ struct sock_xprt {
 #define XPRT_SOCK_WAKE_DISCONNECT	(7)
 #define XPRT_SOCK_CONNECT_SENT	(8)
 #define XPRT_SOCK_NOSPACE	(9)
+#define XPRT_SOCK_IGNORE_RECV	(10)
 
 #endif /* _LINUX_SUNRPC_XPRTSOCK_H */
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 5f9030b81c9e..37f608c2c0a0 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -695,6 +695,8 @@ static void xs_poll_check_readable(struct sock_xprt *transport)
 {
 
 	clear_bit(XPRT_SOCK_DATA_READY, &transport->sock_state);
+	if (test_bit(XPRT_SOCK_IGNORE_RECV, &transport->sock_state))
+		return;
 	if (!xs_poll_socket_readable(transport))
 		return;
 	if (!test_and_set_bit(XPRT_SOCK_DATA_READY, &transport->sock_state))
@@ -1380,6 +1382,10 @@ static void xs_data_ready(struct sock *sk)
 		trace_xs_data_ready(xprt);
 
 		transport->old_data_ready(sk);
+
+		if (test_bit(XPRT_SOCK_IGNORE_RECV, &transport->sock_state))
+			return;
+
 		/* Any data means we had a useful conversation, so
 		 * then we don't need to delay the next reconnect
 		 */



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E89C1C03
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 20 Mar 2023 14:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF8AC43321;
	Mon, 20 Mar 2023 14:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679322268;
	bh=U3y1XZP97v3mpiJsoeXYz/zNPCQ6cgMsirKDIOqrf3s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=fF0cmYZe8CgbFWDbWt3Sz07t0ZU2NQa/5cnhdC/p7gXSDE42vQke4U4zUTTDPvKVq
	 5Bd4M0RPEZxLaniXC5SBsmYhiB/V6AASux0ojgCgRuUIsoZLitNvQnz7bsVeBpehDb
	 fl+fTPSm0LKgVYp5ZqV4wbMb2tLUxLaeA+MgcZ6SVNgFuJ5inNxUnqpCw2dsIh3AH2
	 0OnTpvYjwYePSnsgrJGibf76CnvpC+jVxLcYyMs/0AAScZNDaPagjMzUeFVIzQdoNG
	 B4YMqcDkTx5stJZVcV3LGn8an04IEVZ/lL1S0fgkeLaaLXFn2OnKA/WH73Jc/DpygT
	 YmFmLY84wtGDA==
Subject: [PATCH RFC 1/5] SUNRPC: Revert 987c7b1d094d
From: Chuck Lever <cel@kernel.org>
To: linux-nfs@vger.kernel.org
Cc: kernel-tls-handshake@lists.linux.dev
Date: Mon, 20 Mar 2023 10:24:27 -0400
Message-ID: 
 <167932226768.3131.11453687398743948295.stgit@manet.1015granger.net>
In-Reply-To: 
 <167932094748.3131.11264549266195745851.stgit@manet.1015granger.net>
References: 
 <167932094748.3131.11264549266195745851.stgit@manet.1015granger.net>
User-Agent: StGit/1.5
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Chuck Lever <chuck.lever@oracle.com>

I noticed that server-side TLS always sends the RPC record marker as
a separate 4-byte TLS record. This is très inefficace.

It seems to be due to commit 987c7b1d094d ("SUNRPC: Remove redundant
socket flags from svc_tcp_sendmsg()"), which removed the MSG_* flags
from svc_tcp_sendmsg() in favor of using tcp_sock_set_cork. TLS,
which rides on top of TCP, ignores the socket's cork setting.

Client-side RPC also uses tcp_sock_set_cork, but it still sets
MSG_MORE. I don't see similar uncoalesced TLS record traffic there.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 net/sunrpc/svcsock.c |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/net/sunrpc/svcsock.c b/net/sunrpc/svcsock.c
index 03a4f5615086..28deb4acc392 100644
--- a/net/sunrpc/svcsock.c
+++ b/net/sunrpc/svcsock.c
@@ -1086,9 +1086,9 @@ static int svc_tcp_sendmsg(struct socket *sock, struct xdr_buf *xdr,
 		.iov_len	= sizeof(marker),
 	};
 	struct msghdr msg = {
-		.msg_flags	= 0,
+		.msg_flags	= MSG_MORE,
 	};
-	int ret;
+	int flags, ret;
 
 	*sentp = 0;
 	ret = xdr_alloc_bvec(xdr, GFP_KERNEL);
@@ -1101,8 +1101,8 @@ static int svc_tcp_sendmsg(struct socket *sock, struct xdr_buf *xdr,
 	*sentp += ret;
 	if (ret != rm.iov_len)
 		return -EAGAIN;
-
-	ret = svc_tcp_send_kvec(sock, head, 0);
+	flags = head->iov_len < xdr->len ? MSG_MORE | MSG_SENDPAGE_NOTLAST : 0;
+	ret = svc_tcp_send_kvec(sock, head, flags);
 	if (ret < 0)
 		return ret;
 	*sentp += ret;
@@ -1117,10 +1117,12 @@ static int svc_tcp_sendmsg(struct socket *sock, struct xdr_buf *xdr,
 		offset = offset_in_page(xdr->page_base);
 		remaining = xdr->page_len;
 		while (remaining > 0) {
+			if (remaining <= PAGE_SIZE && tail->iov_len == 0)
+				flags = 0;
 			len = min(remaining, bvec->bv_len - offset);
 			ret = kernel_sendpage(sock, bvec->bv_page,
 					      bvec->bv_offset + offset,
-					      len, 0);
+					      len, flags);
 			if (ret < 0)
 				return ret;
 			*sentp += ret;



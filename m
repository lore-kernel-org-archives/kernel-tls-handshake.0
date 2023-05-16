Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F7979E0
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 16 May 2023 19:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC113C433EF;
	Tue, 16 May 2023 19:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684266097;
	bh=/FXcUiPBY4h/nqWV5kg4eNGidzreiacldZxEXTwAoSY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Pa+ESqZsI52h7K7HgFQX/TtAtmskF2LD3Tp4TifqwO6QSug5Z8OlNrCXIaqIdCcA6
	 2hWB4DdLut/YlW8M1Asu9s8mIzVWoogPpXUQJ+miU13diPC2/EfoVkOkvrARBq+3Vn
	 z33qADbZ0yBBvZZS9hD03VDyT/cOeW30UctZDV8krbv52GuhSB755Fc8p3OZErVQid
	 0XijfT7vKW2rvgbKvUsz1UJu0Cvp+fiZ8tRDnfMp/2jK5gvL/9JB+8BeYTcVwo64Iu
	 5zaUvt6MKpnkSXvLbVoG/M+s3KezhTSilVtXmX4MiJmeBEga0sSAdLmglIm7+XKErI
	 sUS9NtjXtbB/w==
Subject: [PATCH RFC 07/12] SUNRPC: Capture CMSG metadata on client-side
 receive
From: Chuck Lever <cel@kernel.org>
To: anna.schumaker@netapp.com, trondmy@hammerspace.com
Cc: Chuck Lever <chuck.lever@oracle.com>, linux-nfs@vger.kernel.org,
 kernel-tls-handshake@lists.linux.dev
Date: Tue, 16 May 2023 15:41:25 -0400
Message-ID: 
 <168426607555.74246.6449523526966543678.stgit@oracle-102.nfsv4bat.org>
In-Reply-To: 
 <168426587118.74246.214357450560967997.stgit@oracle-102.nfsv4bat.org>
References: 
 <168426587118.74246.214357450560967997.stgit@oracle-102.nfsv4bat.org>
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

kTLS sockets use CMSG to report decryption errors and the need
for session re-keying.

For RPC-with-TLS, an "application data" message contains a ULP
payload, and that is passed along to the RPC client. An "alert"
message triggers connection reset. Everything else is discarded.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 net/sunrpc/xprtsock.c |   49 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 37f608c2c0a0..6f2fc863b47e 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -47,6 +47,8 @@
 #include <net/checksum.h>
 #include <net/udp.h>
 #include <net/tcp.h>
+#include <net/tls.h>
+
 #include <linux/bvec.h>
 #include <linux/highmem.h>
 #include <linux/uio.h>
@@ -342,13 +344,56 @@ xs_alloc_sparse_pages(struct xdr_buf *buf, size_t want, gfp_t gfp)
 	return want;
 }
 
+static int
+xs_sock_process_cmsg(struct socket *sock, struct msghdr *msg,
+		     struct cmsghdr *cmsg, int ret)
+{
+	if (cmsg->cmsg_level == SOL_TLS &&
+	    cmsg->cmsg_type == TLS_GET_RECORD_TYPE) {
+		u8 content_type = *((u8 *)CMSG_DATA(cmsg));
+
+		switch (content_type) {
+		case TLS_RECORD_TYPE_DATA:
+			/* TLS sets EOR at the end of each application data
+			 * record, even though there might be more frames
+			 * waiting to be decrypted.
+			 */
+			msg->msg_flags &= ~MSG_EOR;
+			break;
+		case TLS_RECORD_TYPE_ALERT:
+			ret = -ENOTCONN;
+			break;
+		default:
+			ret = -EAGAIN;
+		}
+	}
+	return ret;
+}
+
+static int
+xs_sock_recv_cmsg(struct socket *sock, struct msghdr *msg, int flags)
+{
+	union {
+		struct cmsghdr	cmsg;
+		u8		buf[CMSG_SPACE(sizeof(u8))];
+	} u;
+	int ret;
+
+	msg->msg_control = &u;
+	msg->msg_controllen = sizeof(u);
+	ret = sock_recvmsg(sock, msg, flags);
+	if (msg->msg_controllen != sizeof(u))
+		ret = xs_sock_process_cmsg(sock, msg, &u.cmsg, ret);
+	return ret;
+}
+
 static ssize_t
 xs_sock_recvmsg(struct socket *sock, struct msghdr *msg, int flags, size_t seek)
 {
 	ssize_t ret;
 	if (seek != 0)
 		iov_iter_advance(&msg->msg_iter, seek);
-	ret = sock_recvmsg(sock, msg, flags);
+	ret = xs_sock_recv_cmsg(sock, msg, flags);
 	return ret > 0 ? ret + seek : ret;
 }
 
@@ -374,7 +419,7 @@ xs_read_discard(struct socket *sock, struct msghdr *msg, int flags,
 		size_t count)
 {
 	iov_iter_discard(&msg->msg_iter, ITER_DEST, count);
-	return sock_recvmsg(sock, msg, flags);
+	return xs_sock_recv_cmsg(sock, msg, flags);
 }
 
 #if ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE



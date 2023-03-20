Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9211C03
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 20 Mar 2023 14:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF0EC43324;
	Mon, 20 Mar 2023 14:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679322281;
	bh=1dMJjs205rPD2DbxEjjMh9fteSy15W4p/t73aPbsyNg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=dXAvSx/Iwl3jUWmC+75Un0BFT+KFrtOSb5A5auonjF2ZKnlOGNNdGBXmZ4+LBI/q1
	 HfLficvCyXZWlgpLEbXOOpS9ylLbB5KCz6TXIVemSH6+PXv2BmntyTTFObSQU4u4qw
	 s9v25llLNf+YXxbijPQJBch+tPHAc7fGnRXzKHLvHsJbghprte+0flBaT3vBS8DXuu
	 QwH1F/HkgM48XyXq5YNaYUlNJ49qdEZLrhch8M+vaR5YFLDBHSa4G/9U7qKf8ANUf1
	 WqTYHmmbYqK9vomPsp863ZUKL1R7ytr49aqirFtLeUiQS/iy2Dq8g+FRiMBaA9WLOM
	 hgC9o9vw9gM7Q==
Subject: [PATCH RFC 3/5] SUNRPC: Ensure server-side sockets have a sock->file
From: Chuck Lever <cel@kernel.org>
To: linux-nfs@vger.kernel.org
Cc: kernel-tls-handshake@lists.linux.dev
Date: Mon, 20 Mar 2023 10:24:40 -0400
Message-ID: 
 <167932228041.3131.16156633568630561580.stgit@manet.1015granger.net>
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
Content-Transfer-Encoding: 7bit

From: Chuck Lever <chuck.lever@oracle.com>

The TLS handshake upcall mechanism requires a non-NULL sock->file on
the socket it hands to user space. svc_sock_free() already releases
sock->file properly if one exists.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 net/sunrpc/svcsock.c |   25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/net/sunrpc/svcsock.c b/net/sunrpc/svcsock.c
index 91a62bea6999..b6df73cb706a 100644
--- a/net/sunrpc/svcsock.c
+++ b/net/sunrpc/svcsock.c
@@ -1340,26 +1340,37 @@ static struct svc_sock *svc_setup_socket(struct svc_serv *serv,
 						struct socket *sock,
 						int flags)
 {
+	struct file	*filp = NULL;
 	struct svc_sock	*svsk;
 	struct sock	*inet;
 	int		pmap_register = !(flags & SVC_SOCK_ANONYMOUS);
-	int		err = 0;
 
 	svsk = kzalloc(sizeof(*svsk), GFP_KERNEL);
 	if (!svsk)
 		return ERR_PTR(-ENOMEM);
 
+	if (!sock->file) {
+		filp = sock_alloc_file(sock, O_NONBLOCK, NULL);
+		if (IS_ERR(filp)) {
+			kfree(svsk);
+			return ERR_CAST(filp);
+		}
+	}
+
 	inet = sock->sk;
 
-	/* Register socket with portmapper */
-	if (pmap_register)
+	if (pmap_register) {
+		int err;
+
 		err = svc_register(serv, sock_net(sock->sk), inet->sk_family,
 				     inet->sk_protocol,
 				     ntohs(inet_sk(inet)->inet_sport));
-
-	if (err < 0) {
-		kfree(svsk);
-		return ERR_PTR(err);
+		if (err < 0) {
+			if (filp)
+				fput(filp);
+			kfree(svsk);
+			return ERR_PTR(err);
+		}
 	}
 
 	svsk->sk_sock = sock;



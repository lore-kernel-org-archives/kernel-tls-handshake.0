Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0945879D0;
	Thu,  4 May 2023 15:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4BDC433EF;
	Thu,  4 May 2023 15:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683213916;
	bh=UzrYB/+xFPPdTbyfTZH5iQH1u2R5hCE2c71kqPRwk7k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=szlbBvb07cWeKVUYW9obTnlMbJ7t+ZslNxLYD8QgO4KLI+kj/1ahdYTJVPKitP4Xy
	 2sjyVBhBvq+83FELLpjWKCNrVYlJHdzBmJcjRaU49IqGc2YnriLsFYYWmfoXomB3w5
	 MjXOh1J7Kol45iUhRuATbJDExWtKS1VTf0E5mJ3639TRiv5DFXkgm/crmQgUGDshVl
	 VWJiYdqq6BU+AhVwXVotOD3y3nwWfn9ac7djKrnT4wEdfvJNybm+uR7hdwzx3SkmXv
	 JRa83bHWpTQ129V78/XScmZAg399h6qMwMGOM+zdwCqpTAFMxg6HUnFdDydKDUEwFD
	 gn1f2N6L/owdA==
Subject: [PATCH 2/5] net/handshake: Fix handshake_dup() ref counting
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Cc: netdev@vger.kernel.org, dan.carpenter@linaro.org
Date: Thu, 04 May 2023 11:25:05 -0400
Message-ID: 
 <168321389545.16695.14828237648251844351.stgit@oracle-102.nfsv4bat.org>
In-Reply-To: 
 <168321371754.16695.4217960864733718685.stgit@oracle-102.nfsv4bat.org>
References: 
 <168321371754.16695.4217960864733718685.stgit@oracle-102.nfsv4bat.org>
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

If get_unused_fd_flags() fails, we ended up calling fput(sock->file)
twice.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Fixes: 3b3009ea8abb ("net/handshake: Create a NETLINK service for handling handshake requests")
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 net/handshake/netlink.c |   10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/net/handshake/netlink.c b/net/handshake/netlink.c
index 7ec8a76c3c8a..3508bc3e661d 100644
--- a/net/handshake/netlink.c
+++ b/net/handshake/netlink.c
@@ -96,17 +96,13 @@ EXPORT_SYMBOL(handshake_genl_put);
  */
 static int handshake_dup(struct socket *sock)
 {
-	struct file *file;
 	int newfd;
 
-	file = get_file(sock->file);
 	newfd = get_unused_fd_flags(O_CLOEXEC);
-	if (newfd < 0) {
-		fput(file);
+	if (newfd < 0)
 		return newfd;
-	}
 
-	fd_install(newfd, file);
+	fd_install(newfd, sock->file);
 	return newfd;
 }
 
@@ -143,11 +139,11 @@ int handshake_nl_accept_doit(struct sk_buff *skb, struct genl_info *info)
 		goto out_complete;
 
 	trace_handshake_cmd_accept(net, req, req->hr_sk, fd);
+	get_file(sock->file);	/* released by DONE */
 	return 0;
 
 out_complete:
 	handshake_complete(req, -EIO, NULL);
-	fput(sock->file);
 out_status:
 	trace_handshake_cmd_accept_err(net, req, NULL, err);
 	return err;



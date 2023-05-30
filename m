Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB98E21073
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 30 May 2023 14:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11438C433D2;
	Tue, 30 May 2023 14:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685455700;
	bh=ofC3CZ4r/P3uLrWkpv9u764Q+NkU35iRcZ8sEshiWA0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Vz3FmnxEC6O60Rm82UvOG87SVF/2avgwD913z3f6ikj0MFCgI8sGVgTFv1z2tWluP
	 NCbc544k/Nrp0f7WeEJxcoW7QMOc7ibBwgRYvzrKysLc4mrIwMDqIJnSGQudWfLuXa
	 YeqB4AXi90YO+RsYNvowXiGKsJ7xCWwg9yzzPdDiR1XBjR0BYvbaJ3euExEJ0a4nRP
	 ShLlCyO1IO4NT/TjJfsDPqH6EBweKnofymWrXIpAFRKHi5bkL1abPeQNkqphIEt0QN
	 297aQg+xi/MqLS/+uqltx0I4hpNuER6M5QMFXJsxk4HviE7qiGZbPgWk2OdPqjLAHw
	 R8Kl+oI8aR1+g==
Subject: [PATCH v3 07/11] SUNRPC: Add a connect worker function for TLS
From: Chuck Lever <cel@kernel.org>
To: anna.schumaker@netapp.com, trondmy@hammerspace.com
Cc: Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 jlayton@redhat.com, linux-nfs@vger.kernel.org,
 kernel-tls-handshake@lists.linux.dev
Date: Tue, 30 May 2023 10:08:09 -0400
Message-ID: 
 <168545567896.1917.14080628021266912546.stgit@oracle-102.nfsv4bat.org>
In-Reply-To: 
 <168545533442.1917.10040716812361925735.stgit@oracle-102.nfsv4bat.org>
References: 
 <168545533442.1917.10040716812361925735.stgit@oracle-102.nfsv4bat.org>
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

Introduce a connect worker function that will handle the AUTH_TLS
probe and TLS handshake, once a TCP connection is established.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 include/linux/sunrpc/xprtsock.h |    1 +
 net/sunrpc/xprtsock.c           |   70 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/include/linux/sunrpc/xprtsock.h b/include/linux/sunrpc/xprtsock.h
index daef030f4848..574a6a5391ba 100644
--- a/include/linux/sunrpc/xprtsock.h
+++ b/include/linux/sunrpc/xprtsock.h
@@ -60,6 +60,7 @@ struct sock_xprt {
 	struct sockaddr_storage	srcaddr;
 	unsigned short		srcport;
 	int			xprt_err;
+	struct rpc_clnt		*clnt;
 
 	/*
 	 * UDP socket buffer size parameters
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 6f2fc863b47e..7ea5984a52a3 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2411,6 +2411,62 @@ static void xs_tcp_setup_socket(struct work_struct *work)
 	current_restore_flags(pflags, PF_MEMALLOC);
 }
 
+/**
+ * xs_tls_connect - establish a TLS session on a socket
+ * @work: queued work item
+ *
+ */
+static void xs_tls_connect(struct work_struct *work)
+{
+	struct sock_xprt *transport =
+		container_of(work, struct sock_xprt, connect_worker.work);
+	struct rpc_clnt *clnt;
+
+	clnt = transport->clnt;
+	transport->clnt = NULL;
+	if (IS_ERR(clnt))
+		goto out_unlock;
+
+	xs_tcp_setup_socket(work);
+
+	rpc_shutdown_client(clnt);
+
+out_unlock:
+	return;
+}
+
+static void xs_set_transport_clnt(struct rpc_clnt *clnt, struct rpc_xprt *xprt)
+{
+	struct sock_xprt *transport = container_of(xprt, struct sock_xprt, xprt);
+	struct rpc_create_args args = {
+		.net		= xprt->xprt_net,
+		.protocol	= xprt->prot,
+		.address	= (struct sockaddr *)&xprt->addr,
+		.addrsize	= xprt->addrlen,
+		.timeout	= clnt->cl_timeout,
+		.servername	= xprt->servername,
+		.nodename	= clnt->cl_nodename,
+		.program	= clnt->cl_program,
+		.prognumber	= clnt->cl_prog,
+		.version	= clnt->cl_vers,
+		.authflavor	= RPC_AUTH_TLS,
+		.cred		= clnt->cl_cred,
+		.xprtsec	= {
+			.policy		= RPC_XPRTSEC_NONE,
+		},
+		.flags		= RPC_CLNT_CREATE_NOPING,
+	};
+
+	switch (xprt->xprtsec.policy) {
+	case RPC_XPRTSEC_TLS_ANON:
+	case RPC_XPRTSEC_TLS_X509:
+		transport->clnt = rpc_create(&args);
+		break;
+	default:
+		transport->clnt = ERR_PTR(-ENOTCONN);
+	}
+}
+
 /**
  * xs_connect - connect a socket to a remote endpoint
  * @xprt: pointer to transport structure
@@ -2442,6 +2498,8 @@ static void xs_connect(struct rpc_xprt *xprt, struct rpc_task *task)
 	} else
 		dprintk("RPC:       xs_connect scheduled xprt %p\n", xprt);
 
+	xs_set_transport_clnt(task->tk_client, xprt);
+
 	queue_delayed_work(xprtiod_workqueue,
 			&transport->connect_worker,
 			delay);
@@ -3057,7 +3115,17 @@ static struct rpc_xprt *xs_setup_tcp(struct xprt_create *args)
 
 	INIT_WORK(&transport->recv_worker, xs_stream_data_receive_workfn);
 	INIT_WORK(&transport->error_worker, xs_error_handle);
-	INIT_DELAYED_WORK(&transport->connect_worker, xs_tcp_setup_socket);
+
+	xprt->xprtsec = args->xprtsec;
+	switch (args->xprtsec.policy) {
+	case RPC_XPRTSEC_NONE:
+		INIT_DELAYED_WORK(&transport->connect_worker, xs_tcp_setup_socket);
+		break;
+	case RPC_XPRTSEC_TLS_ANON:
+	case RPC_XPRTSEC_TLS_X509:
+		INIT_DELAYED_WORK(&transport->connect_worker, xs_tls_connect);
+		break;
+	}
 
 	switch (addr->sa_family) {
 	case AF_INET:



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98154449DF
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 May 2023 14:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D93C433D2;
	Tue, 23 May 2023 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684852242;
	bh=QLJijva0Skh8Lw8HTuYurfuKSrgOa808Jcdr6DWqDVE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=r9kvZQWFieLf4kxMlAvZghwfukqOWeUy4agYG/HUnF/DNbj0IYg4SZKx2xnMIP4Xt
	 5fgWD9oBrECub4R2b55oXOSIHr7X4L9aHVO97Wt84duqsfIhMlNw01v/Amy1ymhqu4
	 Co6acsldvW83lolPBFoxBsRPeqkyuUUB8r4VV1jjY4ObZi4jWGY7WNKxrDGPP/1hQ9
	 1LS5KR0Mt/JsgDZpQR5IG2L4IOA1G7GT5lmYDtuyOt9L3KlZCW274W1IGv+9AaYTy3
	 VDmhUqXi7tQ3th4cDZxxaTS0o4fIVDkiY1lnL9gwBa4q3PzvHnJKZn+4djyPfn8Pq8
	 ANOanXBWQHxJw==
Subject: [PATCH v2 02/11] SUNRPC: Plumb an API for setting transport layer
 security
From: Chuck Lever <cel@kernel.org>
To: anna.schumaker@netapp.com, trondmy@hammerspace.com
Cc: Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 jlayton@redhat.com, linux-nfs@vger.kernel.org,
 kernel-tls-handshake@lists.linux.dev
Date: Tue, 23 May 2023 10:30:30 -0400
Message-ID: 
 <168485222061.6613.10736477127034272000.stgit@oracle-102.nfsv4bat.org>
In-Reply-To: 
 <168485183242.6613.7025123558596119858.stgit@oracle-102.nfsv4bat.org>
References: 
 <168485183242.6613.7025123558596119858.stgit@oracle-102.nfsv4bat.org>
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

Add an initial set of policies along with fields for upper layers to
pass the requested policy down to the transport layer.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 include/linux/sunrpc/clnt.h |    2 ++
 include/linux/sunrpc/xprt.h |   17 +++++++++++++++++
 net/sunrpc/clnt.c           |    4 ++++
 3 files changed, 23 insertions(+)

diff --git a/include/linux/sunrpc/clnt.h b/include/linux/sunrpc/clnt.h
index 770ef2cb5775..063692cd2a60 100644
--- a/include/linux/sunrpc/clnt.h
+++ b/include/linux/sunrpc/clnt.h
@@ -58,6 +58,7 @@ struct rpc_clnt {
 				cl_noretranstimeo: 1,/* No retransmit timeouts */
 				cl_autobind : 1,/* use getport() */
 				cl_chatty   : 1;/* be verbose */
+	struct xprtsec_parms	cl_xprtsec;	/* transport security policy */
 
 	struct rpc_rtt *	cl_rtt;		/* RTO estimator data */
 	const struct rpc_timeout *cl_timeout;	/* Timeout strategy */
@@ -139,6 +140,7 @@ struct rpc_create_args {
 	struct svc_xprt		*bc_xprt;	/* NFSv4.1 backchannel */
 	const struct cred	*cred;
 	unsigned int		max_connect;
+	struct xprtsec_parms	xprtsec;
 };
 
 struct rpc_add_xprt_test {
diff --git a/include/linux/sunrpc/xprt.h b/include/linux/sunrpc/xprt.h
index b9f59aabee53..9e7f12c240c5 100644
--- a/include/linux/sunrpc/xprt.h
+++ b/include/linux/sunrpc/xprt.h
@@ -129,6 +129,21 @@ struct rpc_rqst {
 #define rq_svec			rq_snd_buf.head
 #define rq_slen			rq_snd_buf.len
 
+/* RPC transport layer security policies */
+enum xprtsec_policies {
+	RPC_XPRTSEC_NONE = 0,
+	RPC_XPRTSEC_TLS_ANON,
+	RPC_XPRTSEC_TLS_X509,
+};
+
+struct xprtsec_parms {
+	enum xprtsec_policies	policy;
+
+	/* authentication material */
+	key_serial_t		cert_serial;
+	key_serial_t		privkey_serial;
+};
+
 struct rpc_xprt_ops {
 	void		(*set_buffer_size)(struct rpc_xprt *xprt, size_t sndsize, size_t rcvsize);
 	int		(*reserve_xprt)(struct rpc_xprt *xprt, struct rpc_task *task);
@@ -229,6 +244,7 @@ struct rpc_xprt {
 	 */
 	unsigned long		bind_timeout,
 				reestablish_timeout;
+	struct xprtsec_parms	xprtsec;
 	unsigned int		connect_cookie;	/* A cookie that gets bumped
 						   every time the transport
 						   is reconnected */
@@ -333,6 +349,7 @@ struct xprt_create {
 	struct svc_xprt		*bc_xprt;	/* NFSv4.1 backchannel */
 	struct rpc_xprt_switch	*bc_xps;
 	unsigned int		flags;
+	struct xprtsec_parms	xprtsec;
 };
 
 struct xprt_class {
diff --git a/net/sunrpc/clnt.c b/net/sunrpc/clnt.c
index d2ee56634308..a18074f8edf2 100644
--- a/net/sunrpc/clnt.c
+++ b/net/sunrpc/clnt.c
@@ -385,6 +385,7 @@ static struct rpc_clnt * rpc_new_client(const struct rpc_create_args *args,
 	if (!clnt)
 		goto out_err;
 	clnt->cl_parent = parent ? : clnt;
+	clnt->cl_xprtsec = args->xprtsec;
 
 	err = rpc_alloc_clid(clnt);
 	if (err)
@@ -532,6 +533,7 @@ struct rpc_clnt *rpc_create(struct rpc_create_args *args)
 		.addrlen = args->addrsize,
 		.servername = args->servername,
 		.bc_xprt = args->bc_xprt,
+		.xprtsec = args->xprtsec,
 	};
 	char servername[48];
 	struct rpc_clnt *clnt;
@@ -727,6 +729,7 @@ int rpc_switch_client_transport(struct rpc_clnt *clnt,
 	struct rpc_clnt *parent;
 	int err;
 
+	args->xprtsec = clnt->cl_xprtsec;
 	xprt = xprt_create_transport(args);
 	if (IS_ERR(xprt))
 		return PTR_ERR(xprt);
@@ -3046,6 +3049,7 @@ int rpc_clnt_add_xprt(struct rpc_clnt *clnt,
 
 	if (!xprtargs->ident)
 		xprtargs->ident = ident;
+	xprtargs->xprtsec = clnt->cl_xprtsec;
 	xprt = xprt_create_transport(xprtargs);
 	if (IS_ERR(xprt)) {
 		ret = PTR_ERR(xprt);



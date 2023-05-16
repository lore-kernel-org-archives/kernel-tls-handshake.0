Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FEC79E0
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 16 May 2023 19:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E898DC433EF;
	Tue, 16 May 2023 19:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265971;
	bh=B/Oq6OxoYmxJJoUMpGRpgo5DE9Ta7n9iN3gKqzNAyQ4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WUJqqkny62ScuR4b6BecnatWQ/yX1SEju0GkIaV77Rc5jEogyY4lbbaEqvyPA+325
	 cBusSivWGs1NZEAzp04lu50LXQO2NHX/Ducn9DXfqfKt22bGIoUEiRHUO7Qs6xp9+b
	 3XtyX7v4vNIiSP519tRz4rpa2nz2cqQxklopgfIBlKGi/SKGaDAOeAiqMzvCseE1yS
	 m2poL//xRKM0dECHddF/T+uHx8CriM1hLBgkYZbzbjP8MLkQNKQbAC1Gi25/6yWgZU
	 LV5eUdbgexpirmZyvGhHc9OFqEaxKCagGmFxVs1W2qB1g0tenjhDMbfcXKkAGLTTY7
	 SnbBaa5BMUcmg==
Subject: [PATCH RFC 02/12] SUNRPC: Plumb an API for setting transport layer
 security
From: Chuck Lever <cel@kernel.org>
To: anna.schumaker@netapp.com, trondmy@hammerspace.com
Cc: Chuck Lever <chuck.lever@oracle.com>, linux-nfs@vger.kernel.org,
 kernel-tls-handshake@lists.linux.dev
Date: Tue, 16 May 2023 15:39:19 -0400
Message-ID: 
 <168426594983.74246.14942869392163679761.stgit@oracle-102.nfsv4bat.org>
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

Add an initial set of policies along with fields for upper layers to
pass the requested policy down to the transport layer.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
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



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067B6139F
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  7 Jun 2023 13:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65786C4339B;
	Wed,  7 Jun 2023 13:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686146268;
	bh=KwzLoOUAz/qQMUuX22LqTi45EsrZFW5E9YpM7VTUPDM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=PNUwb9/sIwzN/DBxfk/DgneJ9lyFtaTXFBwiBnxkHP5c1qjQbijdJe4pKqx4oWS3s
	 WxIPHXMmX/xR/+amlRx6ogzFjbo0HuaRvPkms3DFErmKEBM93+wtaveucz1hZFN4p2
	 KVI/Hx3Yr6b8n21ZF8P2/SmpboYyFVagVJHafun0lgUBAsvl8GMp8OQRzEtiMq0o7x
	 RwES+GBhta6rsOBipIkKFbGruJWWkxFi5uxN4baBGNozabmOUKRx60Q6uWvcNIVHSs
	 Z9iMp0UjqSv//c1V+g87lPsWfFasWuw8gOXFpnHVicLLHriXczwBRjXz0XBP0whKoJ
	 emlgPgjl94RbQ==
Subject: [PATCH v4 3/9] SUNRPC: Trace the rpc_create_args
From: Chuck Lever <cel@kernel.org>
To: anna.schumaker@netapp.com, trondmy@hammerspace.com
Cc: Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 linux-nfs@vger.kernel.org, kernel-tls-handshake@lists.linux.dev
Date: Wed, 07 Jun 2023 09:57:37 -0400
Message-ID: 
 <168614624713.2082.16713758030211194717.stgit@oracle-102.nfsv4bat.org>
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

Pass the upper layer's rpc_create_args to the rpc_clnt_new()
tracepoint so additional parts of the upper layer's request can be
recorded.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 include/trace/events/sunrpc.h |   52 +++++++++++++++++++++++++++++++++--------
 net/sunrpc/clnt.c             |    2 +-
 2 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/include/trace/events/sunrpc.h b/include/trace/events/sunrpc.h
index 31bc7025cb44..34784f29a63d 100644
--- a/include/trace/events/sunrpc.h
+++ b/include/trace/events/sunrpc.h
@@ -139,36 +139,68 @@ DEFINE_RPC_CLNT_EVENT(release);
 DEFINE_RPC_CLNT_EVENT(replace_xprt);
 DEFINE_RPC_CLNT_EVENT(replace_xprt_err);
 
+TRACE_DEFINE_ENUM(RPC_XPRTSEC_NONE);
+TRACE_DEFINE_ENUM(RPC_XPRTSEC_TLS_X509);
+
+#define rpc_show_xprtsec_policy(policy)					\
+	__print_symbolic(policy,					\
+		{ RPC_XPRTSEC_NONE,		"none" },		\
+		{ RPC_XPRTSEC_TLS_ANON,		"tls-anon" },		\
+		{ RPC_XPRTSEC_TLS_X509,		"tls-x509" })
+
+#define rpc_show_create_flags(flags)					\
+	__print_flags(flags, "|",					\
+		{ RPC_CLNT_CREATE_HARDRTRY,	"HARDRTRY" },		\
+		{ RPC_CLNT_CREATE_AUTOBIND,	"AUTOBIND" },		\
+		{ RPC_CLNT_CREATE_NONPRIVPORT,	"NONPRIVPORT" },	\
+		{ RPC_CLNT_CREATE_NOPING,	"NOPING" },		\
+		{ RPC_CLNT_CREATE_DISCRTRY,	"DISCRTRY" },		\
+		{ RPC_CLNT_CREATE_QUIET,	"QUIET" },		\
+		{ RPC_CLNT_CREATE_INFINITE_SLOTS,			\
+						"INFINITE_SLOTS" },	\
+		{ RPC_CLNT_CREATE_NO_IDLE_TIMEOUT,			\
+						"NO_IDLE_TIMEOUT" },	\
+		{ RPC_CLNT_CREATE_NO_RETRANS_TIMEOUT,			\
+						"NO_RETRANS_TIMEOUT" },	\
+		{ RPC_CLNT_CREATE_SOFTERR,	"SOFTERR" },		\
+		{ RPC_CLNT_CREATE_REUSEPORT,	"REUSEPORT" })
+
 TRACE_EVENT(rpc_clnt_new,
 	TP_PROTO(
 		const struct rpc_clnt *clnt,
 		const struct rpc_xprt *xprt,
-		const char *program,
-		const char *server
+		const struct rpc_create_args *args
 	),
 
-	TP_ARGS(clnt, xprt, program, server),
+	TP_ARGS(clnt, xprt, args),
 
 	TP_STRUCT__entry(
 		__field(unsigned int, client_id)
+		__field(unsigned long, xprtsec)
+		__field(unsigned long, flags)
+		__string(program, clnt->cl_program->name)
+		__string(server, xprt->servername)
 		__string(addr, xprt->address_strings[RPC_DISPLAY_ADDR])
 		__string(port, xprt->address_strings[RPC_DISPLAY_PORT])
-		__string(program, program)
-		__string(server, server)
 	),
 
 	TP_fast_assign(
 		__entry->client_id = clnt->cl_clid;
+		__entry->xprtsec = args->xprtsec.policy;
+		__entry->flags = args->flags;
+		__assign_str(program, clnt->cl_program->name);
+		__assign_str(server, xprt->servername);
 		__assign_str(addr, xprt->address_strings[RPC_DISPLAY_ADDR]);
 		__assign_str(port, xprt->address_strings[RPC_DISPLAY_PORT]);
-		__assign_str(program, program);
-		__assign_str(server, server);
 	),
 
-	TP_printk("client=" SUNRPC_TRACE_CLID_SPECIFIER
-		  " peer=[%s]:%s program=%s server=%s",
+	TP_printk("client=" SUNRPC_TRACE_CLID_SPECIFIER " peer=[%s]:%s"
+		" program=%s server=%s xprtsec=%s flags=%s",
 		__entry->client_id, __get_str(addr), __get_str(port),
-		__get_str(program), __get_str(server))
+		__get_str(program), __get_str(server),
+		rpc_show_xprtsec_policy(__entry->xprtsec),
+		rpc_show_create_flags(__entry->flags)
+	)
 );
 
 TRACE_EVENT(rpc_clnt_new_err,
diff --git a/net/sunrpc/clnt.c b/net/sunrpc/clnt.c
index a18074f8edf2..4cdb539b5854 100644
--- a/net/sunrpc/clnt.c
+++ b/net/sunrpc/clnt.c
@@ -435,7 +435,7 @@ static struct rpc_clnt * rpc_new_client(const struct rpc_create_args *args,
 	if (parent)
 		refcount_inc(&parent->cl_count);
 
-	trace_rpc_clnt_new(clnt, xprt, program->name, args->servername);
+	trace_rpc_clnt_new(clnt, xprt, args);
 	return clnt;
 
 out_no_path:



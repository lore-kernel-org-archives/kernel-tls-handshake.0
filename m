Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1B1174DB
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 May 2023 21:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54B5C433EF;
	Mon, 22 May 2023 21:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684790494;
	bh=cU/cZNMsFMyqfwDbHQg8m0wbz+Ft1Vg0I4KIdWqH9pk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=eP/teyeLGi+relO33sVhKW2VK7L6slcNKkDx5GSbedKu1GozdUqA0S7+YO+XKTdw1
	 RwJ+Fqk05og6SexKwW08b/yKDN5epRh0ZmQ/e/sM9marMeO/joPwOwEPkV0FlFS4Lh
	 1F7V3k0Tey3SrKsdwQ8EdGAhWZwdPQp2KQQSaeoobYF6OtQU90G01ot1HVTSt3Q6uv
	 kA1XVLSmedXB+QtK7dwcF09yek4EvFH1xuHhNsw8+ghf4qgRMFoainIvJn4JAw5YqH
	 bPLjCZVtGSmkS9WoUCY3Tyh6sV+wWR+vK8a79tpSvUF2XjLMncNLGwaZRHruiDXV+J
	 7qYz4Sqvi+9ww==
Subject: [PATCH] SUNRPC: @clnt specifies auth flavor of RPC ping
From: Chuck Lever <cel@kernel.org>
To: anna.schumaker@netapp.com
Cc: Chuck Lever <chuck.lever@oracle.com>, jlayton@redhat.com,
 linux-nfs@vger.kernel.org, kernel-tls-handshake@lists.linux.dev
Date: Mon, 22 May 2023 17:21:22 -0400
Message-ID: 
 <168479039188.9346.7280595186663128472.stgit@oracle-102.nfsv4bat.org>
In-Reply-To: 
 <CAFX2Jfk9up-eyLhe7s65E6+vBTjXrATREFoYJVkCBLAT_56o2g@mail.gmail.com>
References: 
 <CAFX2Jfk9up-eyLhe7s65E6+vBTjXrATREFoYJVkCBLAT_56o2g@mail.gmail.com>
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

When connecting, we don't want to send both a NULL ping and an
RPC_AUTH_TLS probe, because, except for the detection of RPC-with-
TLS support, both serve effectively the same purpose.

Modify rpc_ping() so it can send a TLS probe when @clnt's flavor
is RPC_AUTH_TLS. All other callers continue to use AUTH_NONE.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 net/sunrpc/clnt.c |   14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

Does it help to replace 4/12 with this?  Compile-tested only.


diff --git a/net/sunrpc/clnt.c b/net/sunrpc/clnt.c
index 4cdb539b5854..274ad74cb2bd 100644
--- a/net/sunrpc/clnt.c
+++ b/net/sunrpc/clnt.c
@@ -2826,10 +2826,22 @@ EXPORT_SYMBOL_GPL(rpc_call_null);
 
 static int rpc_ping(struct rpc_clnt *clnt)
 {
+	struct rpc_message msg = {
+		.rpc_proc = &rpcproc_null,
+	};
+	struct rpc_task_setup task_setup_data = {
+		.rpc_client = clnt,
+		.rpc_message = &msg,
+		.callback_ops = &rpc_null_ops,
+		.flags = RPC_TASK_SOFT | RPC_TASK_SOFTCONN,
+	};
 	struct rpc_task	*task;
 	int status;
 
-	task = rpc_call_null_helper(clnt, NULL, NULL, 0, NULL, NULL);
+	if (clnt->cl_auth->au_flavor != RPC_AUTH_TLS)
+		flags |= RPC_TASK_NULLCREDS;
+
+	task = rpc_run_task(&task_setup_data);
 	if (IS_ERR(task))
 		return PTR_ERR(task);
 	status = task->tk_status;



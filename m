Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EEB29109
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 16 May 2023 19:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4164AC433D2;
	Tue, 16 May 2023 19:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265944;
	bh=W6pSRWidm3oORHNWnG4hOuGSoBOGNLTm6kBJ3ologDM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VahPMldDVO2IHWU19qelZjX+RsW72GApwUURhhqtgTPvroNEvK+xBzqY6NGGII/Dl
	 QCwYCWyFKGJ7Tp7SjqncIvYrmNiftV+IvFtASYD9XxgA2Dzhg2ZeeIkPSKZ6YeX40b
	 DRVF9StGbqUj4bUjH2AatUY8NXIKUrJb7ZjrkrBy5mj/Q0SOOmGsNJa+22+YUylwlN
	 lRomEjf49jSXIJDgKbssaIWe8cYUNHhATd+RAqVtVsy1tFXnJcnRz1N7eMOu4iP2GK
	 NKa7NzdLSZA8+6o6rJCDbXHyILrBS+Dr3vWvQ344nih+K1kB/b/MQnXKATIkCNtRmT
	 fmHNW2mvBTFcQ==
Subject: [PATCH RFC 01/12] NFS: Improvements for fs_context-related
 tracepoints
From: Chuck Lever <cel@kernel.org>
To: anna.schumaker@netapp.com, trondmy@hammerspace.com
Cc: Chuck Lever <chuck.lever@oracle.com>, linux-nfs@vger.kernel.org,
 kernel-tls-handshake@lists.linux.dev
Date: Tue, 16 May 2023 15:38:53 -0400
Message-ID: 
 <168426592925.74246.2101276313805361150.stgit@oracle-102.nfsv4bat.org>
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

Add some missing observability to the fs_context tracepoints
added by commit 33ce83ef0bb0 ("NFS: Replace fs_context-related
dprintk() call sites with tracepoints").

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/nfs/fs_context.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/nfs/fs_context.c b/fs/nfs/fs_context.c
index 9bcd53d5c7d4..5626d358ee2e 100644
--- a/fs/nfs/fs_context.c
+++ b/fs/nfs/fs_context.c
@@ -791,16 +791,19 @@ static int nfs_fs_context_parse_param(struct fs_context *fc,
 		ctx->mount_server.addrlen = len;
 		break;
 	case Opt_nconnect:
+		trace_nfs_mount_assign(param->key, param->string);
 		if (result.uint_32 < 1 || result.uint_32 > NFS_MAX_CONNECTIONS)
 			goto out_of_bounds;
 		ctx->nfs_server.nconnect = result.uint_32;
 		break;
 	case Opt_max_connect:
+		trace_nfs_mount_assign(param->key, param->string);
 		if (result.uint_32 < 1 || result.uint_32 > NFS_MAX_TRANSPORTS)
 			goto out_of_bounds;
 		ctx->nfs_server.max_connect = result.uint_32;
 		break;
 	case Opt_lookupcache:
+		trace_nfs_mount_assign(param->key, param->string);
 		switch (result.uint_32) {
 		case Opt_lookupcache_all:
 			ctx->flags &= ~(NFS_MOUNT_LOOKUP_CACHE_NONEG|NFS_MOUNT_LOOKUP_CACHE_NONE);
@@ -817,6 +820,7 @@ static int nfs_fs_context_parse_param(struct fs_context *fc,
 		}
 		break;
 	case Opt_local_lock:
+		trace_nfs_mount_assign(param->key, param->string);
 		switch (result.uint_32) {
 		case Opt_local_lock_all:
 			ctx->flags |= (NFS_MOUNT_LOCAL_FLOCK |
@@ -837,6 +841,7 @@ static int nfs_fs_context_parse_param(struct fs_context *fc,
 		}
 		break;
 	case Opt_write:
+		trace_nfs_mount_assign(param->key, param->string);
 		switch (result.uint_32) {
 		case Opt_write_lazy:
 			ctx->flags &=



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46926187E
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 16 May 2023 19:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C22C4339B;
	Tue, 16 May 2023 19:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265924;
	bh=cWWo9z23dqLPjO2/AhluWFXVaJ07wULo/SC+11GjfXM=;
	h=Subject:From:To:Cc:Date:From;
	b=Tx5w+kIM8ePwHDUxW2dW4F1Pp2gpgyjo5Od0ErADIDSEH3SGr3qhMB56d0TecWF7v
	 uPQoAC7gjflPcL2O2fLiGfDd2XGMX3z5+DdVi8oVI0az2bA3rniYCzWUnwxJWpMeJB
	 WHzN8V0H7khBHCPYkLJRnoYn2vvvq4U0TP2cvCK8QAEL/NbNMqYh6YdVNbajcMgY/g
	 2cOIr/yH18/muuQHxRBZ6ptNCzM7dCT8lX1QarhVg4cLZUkH2TKeADPbb7VntyJJAw
	 YfSF4md6MEe5VsagUhsu/+K3vDN3eLdX8eXoP8ZWjf/0yOMfAq0hsy0EG0YGN3vd4L
	 uZGzKfEm5oouw==
Subject: [PATCH RFC 00/12] client-side RPC-with-TLS
From: Chuck Lever <cel@kernel.org>
To: anna.schumaker@netapp.com, trondmy@hammerspace.com
Cc: Jeff Layton <jlayton@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 linux-nfs@vger.kernel.org, kernel-tls-handshake@lists.linux.dev
Date: Tue, 16 May 2023 15:38:32 -0400
Message-ID: 
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

Now that TLS handshake support is available in the kernel, let's
have a look at what is needed to support NFS in-transit confiden-
tiality in the Linux NFS client.

These apply to v6.4-rc2 (actually, net-next to be precise), but
previously they've been tested at multiple NFS bake-a-thon events.

---

Chuck Lever (12):
      NFS: Improvements for fs_context-related tracepoints
      SUNRPC: Plumb an API for setting transport layer security
      SUNRPC: Trace the rpc_create_args
      SUNRPC: Refactor rpc_call_null_helper()
      SUNRPC: Add RPC client support for the RPC_AUTH_TLS auth flavor
      SUNRPC: Ignore data_ready callbacks during TLS handshakes
      SUNRPC: Capture CMSG metadata on client-side receive
      SUNRPC: Add a connect worker function for TLS
      SUNRPC: Add RPC-with-TLS support to xprtsock.c
      SUNRPC: Add RPC-with-TLS tracepoints
      NFS: Have struct nfs_client carry a TLS policy field
      NFS: Add an "xprtsec=" NFS mount option


 fs/nfs/client.c                 |   7 +
 fs/nfs/fs_context.c             |  55 +++++
 fs/nfs/internal.h               |   2 +
 fs/nfs/nfs3client.c             |   1 +
 fs/nfs/nfs4client.c             |  18 +-
 fs/nfs/super.c                  |  12 ++
 include/linux/nfs_fs_sb.h       |   3 +-
 include/linux/sunrpc/auth.h     |   1 +
 include/linux/sunrpc/clnt.h     |   2 +
 include/linux/sunrpc/xprt.h     |  17 ++
 include/linux/sunrpc/xprtsock.h |   3 +
 include/trace/events/sunrpc.h   |  96 ++++++++-
 net/sunrpc/Makefile             |   2 +-
 net/sunrpc/auth.c               |   2 +-
 net/sunrpc/auth_tls.c           | 120 +++++++++++
 net/sunrpc/clnt.c               |  22 +-
 net/sunrpc/xprtsock.c           | 343 +++++++++++++++++++++++++++++++-
 17 files changed, 677 insertions(+), 29 deletions(-)
 create mode 100644 net/sunrpc/auth_tls.c

--
Chuck Lever


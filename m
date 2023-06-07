Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15D5139F
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  7 Jun 2023 13:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E32C433EF;
	Wed,  7 Jun 2023 13:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686146188;
	bh=/uafnXoMV4XbBG4iGHc0NfWDWY/Jz4itJ4WjtWx2hsc=;
	h=Subject:From:To:Cc:Date:From;
	b=ehhsMivul1PvtCYUL90YCmqfjNlcPihbq1kSSASLh2VufmXfvg0dIrGssLgJiULIw
	 dCZD5S1IbHPYsX+uChCxM+jy/F0ZC7i20KUcQCt1UJR4cG6Zp3aur/QNAsZPJq0V7T
	 ivpLk1ZW/RX45AAOOmeufHjszvwtBO3gV0gOQulNYbkO2XmE9t85Z9KbA75DuiHdOf
	 eD+J2LL5PYCH4TriQS0tDwppjdx6xpSZl2USzZLzE/2MvcLuj4MIL/r/p+IXMNtdlt
	 OArKDoMlEP/dMG0LgNGAi/1YyVj2bziuA8tb8uJLIOSYww9s7Gs901Ce7T7Km01Fq4
	 XG432Zh8TPxTQ==
Subject: [PATCH v4 0/9] client-side RPC-with-TLS
From: Chuck Lever <cel@kernel.org>
To: anna.schumaker@netapp.com, trondmy@hammerspace.com
Cc: Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 linux-nfs@vger.kernel.org, kernel-tls-handshake@lists.linux.dev
Date: Wed, 07 Jun 2023 09:56:16 -0400
Message-ID: 
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

Implement basic client-side support for RFC 9289 in Linux.

This series applies to 6.4-rc5 and is also available in the
topic-rpc-with-tls-upcall branch at:

https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git

Changes since v3:
- Converted connect logic to use an xprt_class
- Using TLS with proto={udp,rdma} is now properly prevented

Changes since v2:
- Rebased on v6.4-rc4

Changes since RFC:
- Add an rpc_authops method to send TLS probes

---

Chuck Lever (9):
      NFS: Improvements for fs_context-related tracepoints
      SUNRPC: Plumb an API for setting transport layer security
      SUNRPC: Trace the rpc_create_args
      SUNRPC: Add RPC client support for the RPC_AUTH_TLS auth flavor
      SUNRPC: Ignore data_ready callbacks during TLS handshakes
      SUNRPC: Capture CMSG metadata on client-side receive
      SUNRPC: Add a TCP-with-TLS RPC transport class
      NFS: Have struct nfs_client carry a TLS policy field
      NFS: Add an "xprtsec=" NFS mount option


 fs/nfs/client.c                 |   8 +
 fs/nfs/fs_context.c             |  67 +++++
 fs/nfs/internal.h               |   2 +
 fs/nfs/nfs3client.c             |   9 +-
 fs/nfs/nfs4client.c             |  40 ++-
 fs/nfs/super.c                  |  12 +
 include/linux/nfs_fs_sb.h       |   3 +-
 include/linux/sunrpc/auth.h     |   2 +
 include/linux/sunrpc/clnt.h     |   2 +
 include/linux/sunrpc/xprt.h     |  18 ++
 include/linux/sunrpc/xprtsock.h |   3 +
 include/trace/events/sunrpc.h   |  96 +++++++-
 net/sunrpc/Makefile             |   2 +-
 net/sunrpc/auth.c               |   2 +-
 net/sunrpc/auth_tls.c           | 175 +++++++++++++
 net/sunrpc/clnt.c               |   9 +-
 net/sunrpc/sysfs.c              |   1 +
 net/sunrpc/xprtsock.c           | 425 +++++++++++++++++++++++++++++++-
 18 files changed, 847 insertions(+), 29 deletions(-)
 create mode 100644 net/sunrpc/auth_tls.c

--
Chuck Lever


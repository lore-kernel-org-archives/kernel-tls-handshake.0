Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76C32F33
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5B3C433D2;
	Mon, 17 Apr 2023 14:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681741934;
	bh=pU8ZUMrif5wpkKKZrsM3VKZe+HUPK58DWLH2POwz2y0=;
	h=Subject:From:To:Cc:Date:From;
	b=eD51zvUJYy9b+Rr495zB8MelnM0fVQBTu7uA1OddDjbjMsC2yYJDgOSL3+KCDE1RG
	 z2HGyJr18fdZqQVKjHtOusECKPeOP3vc/67nmETfM7J24Zf9oAkQykxUr5R/Cq/81R
	 +q5YlmZfd3AGUfXIMfdztKg055cVmZ9Iej2xZcsylCvOuC1++axywLIllCzyclF0uy
	 ACxeRH+4ZnKRkOaLDW6bwxkluLPKDNdQbms1UJFACTsjaMQ2pnZpvXbxSFq4YQg0Zq
	 A+iTrKMFQGjL5BSQkG3+YSFn9TpoDpQfB3ii7KpXcqnxVzNdUwkpx8ieceJnRJvsWs
	 6AF55q+w2k53A==
Subject: [PATCH v10 0/4] Another crack at a handshake upcall mechanism
From: Chuck Lever <cel@kernel.org>
To: kuba@kernel.org, pabeni@redhat.com, edumazet@google.com
Cc: netdev@vger.kernel.org, kernel-tls-handshake@lists.linux.dev
Date: Mon, 17 Apr 2023 10:32:12 -0400
Message-ID: 
 <168174169259.9520.1911007910797225963.stgit@91.116.238.104.host.secureserver.net>
User-Agent: StGit/1.5
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi-

Here is v10 of a series to add generic support for transport layer
security handshake on behalf of kernel socket consumers (user space
consumers use a security library directly, of course). A summary of
the purpose of these patches is archived here:

https://lore.kernel.org/netdev/1DE06BB1-6BA9-4DB4-B2AA-07DE532963D6@oracle.com/

The first patch in the series applies to the top-level .gitignore
file to address the build warnings reported a few days ago. I intend
to submit that separately. I'd like you to consider taking the rest
of this series for v6.4.

The full patch set to support SunRPC with TLSv1.3 is available in
the topic-rpc-with-tls-upcall branch here, based on net-next/main:

https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git

This patch set includes support for in-transit confidentiality and
peer authentication for both the Linux NFS client and server.

A user space handshake agent for TLSv1.3 to go along with the kernel
patches is available in the "main" branch here:

https://github.com/oracle/ktls-utils

---

Changes since v9:
- Address build problems with Kunit tests

Changes since v8:
- Addressed Jakub's v8 review comments
- Fixed build problems with the new unit tests
- Addressed crashes in some corner case

Major changes since v7:
- Addressed Paolo's v7 review comments
- Added initial set of Kunit tests for the handshake API
- Included an NFS server patch to add new TLS_RECORD_TYPE values

Major changes since v6:
- YAML spec and generated artifacts are now under dual license
- Addressed Jakub's v6 review comments
- Implemented a memory-sensitive limit on the number of pending
handshake requests
- Implemented upcall support for multiple peer identities

Major changes since v5:
- Added a "timeout" attribute to the handshake netlink protocol
- Removed the GnuTLS-specific "priorities" attribute
- Added support for keyrings to restrict access to keys
- Simplified the kernel consumer TLS handshake API
- The handshake netlink protocol can handle multiple peer IDs or
certificates in the ACCEPT and DONE operations, though the
implementation does not yet support it.

Major changes since v4:
- Rebased onto net-next/main
- Replaced req reference counting with ->sk_destruct
- CMD_ACCEPT now does the equivalent of a dup(2) rather than an
accept(2)
- CMD_DONE no longer closes the user space socket endpoint
- handshake_req_cancel is now tested and working
- Added a YAML specification for the netlink upcall protocol, and
simplified the protocol to fit the YAML schema
- Added an initial set of tracepoints

Changes since v3:
- Converted all netlink code to use Generic Netlink
- Reworked handshake request lifetime logic throughout
- Global pending list is now per-net
- On completion, return the remote's identity to the consumer

Changes since v2:
- PF_HANDSHAKE replaced with NETLINK_HANDSHAKE
- Replaced listen(2) / poll(2) with a multicast notification service
- Replaced accept(2) with a netlink operation that can return an
open fd and handshake parameters
- Replaced close(2) with a netlink operation that can take arguments

Changes since RFC:
- Generic upcall support split away from kTLS
- Added support for TLS ServerHello
- Documentation has been temporarily removed while API churns

---

Chuck Lever (4):
      .gitignore: Do not ignore .kunitconfig files
      net/handshake: Create a NETLINK service for handling handshake requests
      net/handshake: Add a kernel API for requesting a TLSv1.3 handshake
      net/handshake: Add Kunit tests for the handshake consumer API


 .gitignore                                 |   1 +
 Documentation/netlink/specs/handshake.yaml | 124 +++++
 Documentation/networking/index.rst         |   1 +
 Documentation/networking/tls-handshake.rst | 217 +++++++++
 MAINTAINERS                                |  11 +
 include/net/handshake.h                    |  43 ++
 include/trace/events/handshake.h           | 159 +++++++
 include/uapi/linux/handshake.h             |  73 +++
 net/Kconfig                                |  20 +
 net/Makefile                               |   1 +
 net/handshake/.kunitconfig                 |  11 +
 net/handshake/Makefile                     |  13 +
 net/handshake/genl.c                       |  58 +++
 net/handshake/genl.h                       |  24 +
 net/handshake/handshake-test.c             | 523 +++++++++++++++++++++
 net/handshake/handshake.h                  |  87 ++++
 net/handshake/netlink.c                    | 319 +++++++++++++
 net/handshake/request.c                    | 344 ++++++++++++++
 net/handshake/tlshd.c                      | 418 ++++++++++++++++
 net/handshake/trace.c                      |  20 +
 20 files changed, 2467 insertions(+)
 create mode 100644 Documentation/netlink/specs/handshake.yaml
 create mode 100644 Documentation/networking/tls-handshake.rst
 create mode 100644 include/net/handshake.h
 create mode 100644 include/trace/events/handshake.h
 create mode 100644 include/uapi/linux/handshake.h
 create mode 100644 net/handshake/.kunitconfig
 create mode 100644 net/handshake/Makefile
 create mode 100644 net/handshake/genl.c
 create mode 100644 net/handshake/genl.h
 create mode 100644 net/handshake/handshake-test.c
 create mode 100644 net/handshake/handshake.h
 create mode 100644 net/handshake/netlink.c
 create mode 100644 net/handshake/request.c
 create mode 100644 net/handshake/tlshd.c
 create mode 100644 net/handshake/trace.c

--
Chuck Lever


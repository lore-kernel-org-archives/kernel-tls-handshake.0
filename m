Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FA479C1
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 13:03:05 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 1E6661FE0A;
	Mon, 17 Apr 2023 13:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681736584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=B9aVYjmRoZhBOquHaPiyXwIxJhvtNvA3HvXK8M2otb4=;
	b=YIhGnFLhmnOkYuflZWsu4oRZA39b6poE/ss1lB1Cygg6FsdAg1rg8RBs97G05K1SVKGXPt
	vk1hPHwFnvK4KFn9L0IT2MtIDDpKvn61dzi8nL0cHAhW8rxes/VaXo8W/EGFHgf8POi6m2
	GOzzOwQa2wgUQMugOhTbETHHSayVSP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681736584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=B9aVYjmRoZhBOquHaPiyXwIxJhvtNvA3HvXK8M2otb4=;
	b=Guck+jZY8gXzxldFKBkX4FjMkXyhyL+CHiOgav39GIA/5jCgz8IdyIGCFudbI7E01WCJSs
	eR4ga6jKlIIlY7AQ==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id F25542C142;
	Mon, 17 Apr 2023 13:03:03 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id DAAC551C259A; Mon, 17 Apr 2023 15:03:03 +0200 (CEST)
From: Hannes Reinecke <hare@suse.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCHv3 00/18] nvme: In-kernel TLS support for TCP
Date: Mon, 17 Apr 2023 15:02:44 +0200
Message-Id: <20230417130302.86274-1-hare@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

finally I've managed to put all things together and enable in-kernel
TLS support for NVMe-over-TCP.

The patchset is based on the TLS upcall mechanism from Chuck Lever
(cf '[PATCH v7 0/2] Another crack at a handshake upcall mechanism'
posted to the linux netdev list), and requires the 'tlshd' userspace
daemon (https://github.com/oracle/ktls-utils) for the actual TLS handshake.
Changes for nvme-cli are already included in the upstream repository.

Theory of operation:
A dedicated '.nvme' keyring is created to hold the pre-shared keys (PSKs)
for the TLS handshake. Keys will have to be provisioned before TLS handshake
is attempted; that can be done with the 'nvme gen-tls-key' command for nvme-cli
(patches are already merged upstream).
After connection to the remote TCP port the client side will use the
'best' PSK (as inferred from the NVMe TCP spec) or the PSK specified
by the '--tls_key' option to nvme-cli and call the TLS userspace daemon
to initiate a TLS handshake.
The server side will then invoke the TLS userspace daemon to run the TLS
handshake.
If the TLS handshake succeeds the userspace daemon will be activating
kTLS on the socket, and control is passed back to the kernel.

To make this work I had to implement the 'read_sock()' functionality
for TLS; it seems to be holding up well enough (for me), but it really
could do with reviews from persons with more network stack knowledge.

As usual, comments and reviews are welcome.

Changes to v2:
- Included reviews from Sagi
- Removed MSG_SENDPAGE_NOTLAST
- Improved MSG_EOR handling for TLS
- Add config options NVME_TCP_TLS
  and NVME_TARGET_TCP_TLS

Changes to the original RFC:
- Add a CONFIG_NVME_TLS config option
- Use a single PSK for the TLS handshake
- Make TLS connections mandatory
- Do not peek messages for the server
- Simplify data_ready callback
- Implement read_sock() for TLS

Hannes Reinecke (18):
  nvme-keyring: register '.nvme' keyring
  nvme-keyring: define a 'psk' keytype
  nvme: add TCP TSAS definitions
  nvme-tcp: add definitions for TLS cipher suites
  nvme-keyring: implement nvme_tls_psk_default()
  net/tls: implement ->read_sock()
  net/tls: sanitize MSG_EOR handling
  nvme-tcp: do not set MSG_SENDPAGE_NOTLAST
  security/keys: export key_lookup()
  nvme/tcp: allocate socket file
  nvme-tcp: enable TLS handshake upcall
  nvme-tcp: control message handling for recvmsg()
  nvme-fabrics: parse options 'keyring' and 'tls_key'
  nvmet: make TCP sectype settable via configfs
  nvmet-tcp: allocate socket file
  nvmet-tcp: enable TLS handshake upcall
  nvmet-tcp: control messages for recvmsg()
  nvmet-tcp: add configfs attribute 'param_keyring'

 drivers/nvme/common/Kconfig    |   4 +
 drivers/nvme/common/Makefile   |   3 +-
 drivers/nvme/common/keyring.c  | 182 ++++++++++++++++++++++++++++
 drivers/nvme/host/Kconfig      |  14 +++
 drivers/nvme/host/core.c       |  33 ++++-
 drivers/nvme/host/fabrics.c    |  77 +++++++++++-
 drivers/nvme/host/fabrics.h    |   9 ++
 drivers/nvme/host/nvme.h       |   1 +
 drivers/nvme/host/tcp.c        | 175 +++++++++++++++++++++++++--
 drivers/nvme/target/Kconfig    |  14 +++
 drivers/nvme/target/configfs.c | 173 +++++++++++++++++++++++++-
 drivers/nvme/target/nvmet.h    |   1 +
 drivers/nvme/target/tcp.c      | 213 ++++++++++++++++++++++++++++++---
 include/linux/nvme-keyring.h   |  36 ++++++
 include/linux/nvme-tcp.h       |   6 +
 include/linux/nvme.h           |  10 ++
 net/tls/tls.h                  |   2 +
 net/tls/tls_device.c           |  10 ++
 net/tls/tls_main.c             |   2 +
 net/tls/tls_sw.c               |  92 ++++++++++++++
 security/keys/key.c            |   1 +
 21 files changed, 1020 insertions(+), 38 deletions(-)
 create mode 100644 drivers/nvme/common/keyring.c
 create mode 100644 include/linux/nvme-keyring.h

-- 
2.35.3


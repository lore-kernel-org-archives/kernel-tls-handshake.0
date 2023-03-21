Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B210C9459
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 12:44:05 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id D42B121DB2;
	Tue, 21 Mar 2023 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679402637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jUCnlKLDyTj97t5QT8ls0N2tt/LQJuho6YajTUIpHmM=;
	b=GkWdu9llBnz4x4Wp2LtcrbBts3ATTzTb2vcFUJgmjoZgWX/xe50DeVacREDDh9jgriPbs+
	TfuP9y+LmGH4RNSmPcZDgBsi3k0+uhY8lJvixT5GOCTMUF8S8NK+0ixFl8A0OkDnYJOYtU
	Suz8MMPSdQygtfLV+WKweITb4CoPaU0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679402637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jUCnlKLDyTj97t5QT8ls0N2tt/LQJuho6YajTUIpHmM=;
	b=wTNDvEKrTIR/3bBPFvJlmi6uEYiRWbdeePZ+++VHsDuz7wx2/Gimgff2dcvuB/sQDzFZoJ
	vrG4kqlyBfgxPMAw==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id BE1772C143;
	Tue, 21 Mar 2023 12:43:57 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 9FF6951BEE94; Tue, 21 Mar 2023 13:43:57 +0100 (CET)
From: Hannes Reinecke <hare@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <cel@kernel.org>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [RFC PATCH 00/18] nvme: In-kernel TLS support for TCP
Date: Tue, 21 Mar 2023 13:43:07 +0100
Message-Id: <20230321124325.77385-1-hare@suse.de>
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

Theory of operation:
A dedicated '.nvme' keyring is created to hold the pre-shared keys (PSKs)
for the TLS handshake. Keys will have to be provisioned before TLS handshake
is attempted; I'll be sending a patch for nvme-cli separately.
After connection to the remote TCP port the client side will check if there are
matching PSKs, and call the TLS userspace daemon to initiate a TLS handshake.
The server side will be doing a MSG_PEEK on the first incoming PDU after
accept(), and check if it's an TCP ICREQ packet. If not it's assumed to be
a TLS ClientHello and the TLS userspace daemon is invoked for the TLS
handshake.
If the TLS handshake succeeds the userspace daemon will be activating
kTLS on the socket, and control is passed back to the kernel.

The one issue of note is the multiple identity handling.
The NVMe TCP spec defines up to 4 PSK identities, and
TLS 1.3 allows for several identities to be sent with the
ClientHello. So in theory we could sent the all in one go.
Sadly none of the userspace libraries implement this feature,
so we have to test each possible identity and terminate the
connection on failure.
With this patchset all possible identities need to be part of
the keyring, and the client side will be trying to establish
a TLS connection with each matching PSK from the keyring.
The beauty is that this method works without modification
to the existing nvme-cli; one only needs to provision PSKs
in the .nvme keyring and TLS handshake will be attempted.
As I'm not sure if that approach meets with general approval
I'm sending out this patchset as an RFC for now.

As usual, comments and reviews are welcome.

Hannes Reinecke (18):
  nvme-keyring: register '.nvme' keyring
  nvme-keyring: define a 'psk' keytype
  nvme: add TCP TSAS definitions
  nvme-tcp: add definitions for TLS cipher suites
  nvme-tcp: implement recvmsg rx flow for TLS
  nvme-tcp: call 'queue->data_ready()' in nvme_tcp_data_ready()
  nvme/tcp: allocate socket file
  nvme-tcp: enable TLS handshake upcall
  nvme-tcp: add connect option 'tls'
  nvme-tcp: fixup send workflow for kTLS
  nvme-tcp: control message handling for recvmsg()
  nvmet: make TCP sectype settable via configfs
  nvmet-tcp: allocate socket file
  security/keys: export key_lookup()
  nvmet-tcp: enable TLS handshake upcall
  nvmet-tcp: rework sendpage for kTLS
  nvmet-tcp: control messages for recvmsg()
  nvmet-tcp: peek icreq before starting TLS

 drivers/nvme/common/Makefile   |   2 +-
 drivers/nvme/common/keyring.c  | 132 ++++++++++
 drivers/nvme/host/core.c       |  10 +-
 drivers/nvme/host/fabrics.c    |   5 +
 drivers/nvme/host/fabrics.h    |   2 +
 drivers/nvme/host/tcp.c        | 450 +++++++++++++++++++++++++--------
 drivers/nvme/target/configfs.c |  65 +++++
 drivers/nvme/target/tcp.c      | 407 ++++++++++++++++++++++++++---
 include/linux/nvme-keyring.h   |  20 ++
 include/linux/nvme-tcp.h       |   6 +
 include/linux/nvme.h           |  10 +
 security/keys/key.c            |   1 +
 12 files changed, 965 insertions(+), 145 deletions(-)
 create mode 100644 drivers/nvme/common/keyring.c
 create mode 100644 include/linux/nvme-keyring.h

-- 
2.35.3


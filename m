Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A9821CA07
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 30 Jul 2025 20:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753906150; cv=none; b=VNFpg7slmWZOiXAQz9Y24LmwFMPISP5GTpu48KpxR4zdT2OqYnlH93h6OwRlr44PdD7dpqX0UhUJqL5e5Zq2hC1FyDyD9Q9ey9f/d15CF6R6TdcJEONCxGx6c9qIurMbuszXZdEr4VIFnxzrOWvr0Xd2/CD3Dj7L+DanF31Z+Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753906150; c=relaxed/simple;
	bh=TBk4rk+oaMiMIUM/BilQHT0wLcsFLD+oXHWdtsLRjhU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RsuUeHkxtrIEg0egPrG+aEA+PLPo0WVYVqIMMLIiHMZBA2vhHgMtbsY6HGAPnbUwisnAwwEJNro66BqbIWk6tR8tFAHJo+octOCq4kJfp1VpqM9XVhgJ4aFNf12wdWjljysCMDFMCeok1oP3s4IY76+0oY4iL5TmQJVwNIoTs80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NnWDFKhw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NnWDFKhw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753906147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lv7yxZjsANwZuExWF5D6Tu2dwm9bHE1TUeSlxyjQERU=;
	b=NnWDFKhwenk1XxvNlbCA+VMQW5F0bR+JLFEiHOWLwMRtdgUhq8j+xUzZCmXrnagnNVcjmL
	PfwmwRkbJf/71me7PIdreu3bQOaj4Qh+R15UbSX3WNaKTxAiYHhVFA6f6+AvUl94JTQ8zB
	UrHsymBjU5aeEpUPLPhQbL7OzO/EL2E=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-28-thRp1xOjMHu1rmh0xqeHkA-1; Wed,
 30 Jul 2025 16:08:45 -0400
X-MC-Unique: thRp1xOjMHu1rmh0xqeHkA-1
X-Mimecast-MFC-AGG-ID: thRp1xOjMHu1rmh0xqeHkA_1753906123
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 89DF019560A3;
	Wed, 30 Jul 2025 20:08:42 +0000 (UTC)
Received: from okorniev-mac.redhat.com (unknown [10.22.90.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2D1F119560A2;
	Wed, 30 Jul 2025 20:08:37 +0000 (UTC)
From: Olga Kornievskaia <okorniev@redhat.com>
To: chuck.lever@oracle.com,
	jlayton@kernel.org,
	trondmy@hammerspace.com,
	anna.schumaker@oracle.com,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-nfs@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel-tls-handshake@lists.linux.dev,
	neil@brown.name,
	Dai.Ngo@oracle.com,
	tom@talpey.com,
	hare@suse.de,
	horms@kernel.org,
	kbusch@kernel.org
Subject: [PATCH 0/4] address tls_alert_recv usage by NFS and NvME
Date: Wed, 30 Jul 2025 16:08:31 -0400
Message-Id: <20250730200835.80605-1-okorniev@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

This is a multi-component patch series: NFS client, NFS server,
NvME (target), net. 

tls_alert_recv() has been originally written to retrieve TLS alert
payload out of the msg iterator's kvec buffer. Yet, the callers of
tls_alert_recv() have not been careful enough to make sure that
msg has always been initialized with a kvec-backed iterator (ie.,
some times bvec was used). Furthermore, callers didn't account
for the fact that the msg iterator's kvec is advanced by sock_recvmsg
upon filling up the provided space by the copy. All that lead to
the ability to construct a malicious payload that would trigger
badness in tls_alert_recv().

This patch series attempts to address it in a couple of steps.
First, there are patches for each of the current consumers (NFS
server, NFS client, NvME target) of tls_alert_recv to address
an immediate problem which I think should be backported.

Note, patch#3 is NvME patch that had no testing. Compile only patch.

Second, the last patch builds on top of the fixes but changes
tls_alert_recv to force the callers to provide the kvec directly
in hopes that any future users of tls_alert_recv would be more
congnizant of providing location to the actual TLS alert payload.

Again note that nvme changes in patch#4 are compile only.

Olga Kornievskaia (4):
  sunrpc: fix handling of server side tls alerts
  sunrpc: fix client side handling of tls alerts
  nvmet-tcp: fix handling of tls alerts
  net/handshake: change tls_alert_recv to receive a kvec

 drivers/nvme/target/tcp.c | 37 +++++++++++++++-----------
 include/net/handshake.h   |  2 +-
 net/handshake/alert.c     |  6 ++---
 net/sunrpc/svcsock.c      | 56 ++++++++++++++++++++++++++++-----------
 net/sunrpc/xprtsock.c     | 51 ++++++++++++++++++++++++-----------
 5 files changed, 101 insertions(+), 51 deletions(-)

-- 
2.47.1


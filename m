Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E564979E0
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 13:03:05 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 3A2DB21A46;
	Mon, 17 Apr 2023 13:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681736584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fbkzGP66w2eIP0ijsrJNPutbfmYDdmvVd4+ex576gDA=;
	b=GYAYoAI1qaVrRByB1PdflvjYA8doBOMMPa74gzZ6cTz8Fe2LWToLpG+j5GU4Y8+8HiSmj4
	viq+dFFlxqAtEo5kgnxb11yevtTXPWg0wwR89Q2lttBpvcNtoBS0ouvm4wqmPTH4PZaVa/
	Kcq+2cBku+r5DJmnLJAETUjwvw4UYEU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681736584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fbkzGP66w2eIP0ijsrJNPutbfmYDdmvVd4+ex576gDA=;
	b=YMA8fi60OVIcJbKShpL/EvypZFUEFSkrURqLQEDHAuYcjaAAguMrsj8HgGt9DoFUd2pJ0V
	Z7noGuBeHXfyLcAg==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id 295652C152;
	Mon, 17 Apr 2023 13:03:04 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 2224051C25AA; Mon, 17 Apr 2023 15:03:04 +0200 (CEST)
From: Hannes Reinecke <hare@suse.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 08/18] nvme-tcp: do not set MSG_SENDPAGE_NOTLAST
Date: Mon, 17 Apr 2023 15:02:52 +0200
Message-Id: <20230417130302.86274-9-hare@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230417130302.86274-1-hare@suse.de>
References: <20230417130302.86274-1-hare@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MSG_SENDPAGE_NOTLAST was introduced with commit 35f9c09fe9c7
("tcp: tcp_sendpages() should call tcp_push() once") to fix issues
with the ->sendfile() call, and the implication seems to be that
the flag should be strictly internal to sendfile.
Hence we shouldn't be setting it on nvme-tcp, and anyway doing
so will cause TLS sending invalid data.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/nvme/host/tcp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 273c1f2760a4..732aa2296560 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -995,7 +995,7 @@ static int nvme_tcp_try_send_data(struct nvme_tcp_request *req)
 		if (last && !queue->data_digest && !nvme_tcp_queue_more(queue))
 			flags |= MSG_EOR;
 		else
-			flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
+			flags |= MSG_MORE;
 
 		if (sendpage_ok(page)) {
 			ret = kernel_sendpage(queue->sock, page, offset, len,
@@ -1049,7 +1049,7 @@ static int nvme_tcp_try_send_cmd_pdu(struct nvme_tcp_request *req)
 	int ret;
 
 	if (inline_data || nvme_tcp_queue_more(queue))
-		flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
+		flags |= MSG_MORE;
 	else
 		flags |= MSG_EOR;
 
@@ -1091,7 +1091,7 @@ static int nvme_tcp_try_send_data_pdu(struct nvme_tcp_request *req)
 	if (!req->h2cdata_left)
 		ret = kernel_sendpage(queue->sock, virt_to_page(pdu),
 				offset_in_page(pdu) + req->offset, len,
-				MSG_DONTWAIT | MSG_MORE | MSG_SENDPAGE_NOTLAST);
+				MSG_DONTWAIT | MSG_MORE);
 	else
 		ret = sock_no_sendpage(queue->sock, virt_to_page(pdu),
 				offset_in_page(pdu) + req->offset, len,
-- 
2.35.3


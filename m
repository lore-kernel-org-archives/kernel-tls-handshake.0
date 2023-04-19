Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BCC23CB
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 19 Apr 2023 06:57:21 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 445821FD84;
	Wed, 19 Apr 2023 06:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681887438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D2jMKOmNF2qw/bBBdcdrFg+yGA0M8qQfBwrpoxTsBm4=;
	b=OKeFqdSvAsKIfs+eM8gq1o648XHDFZyy72ZiFMUic/cyyjLAltlJjIK2ZOLOTTKgi49gLn
	X13BDNb7r41FCzcxco69SoEtQuFx1+GyM6II5zoEhN64ucRTUggfAT+2+it4cnSR1P7T+Y
	ez5f4u94L3G1wkkWB45SqdU0JfIkfc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681887438;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D2jMKOmNF2qw/bBBdcdrFg+yGA0M8qQfBwrpoxTsBm4=;
	b=0GA+aPRixgPNnc7QE1WQGa3YAltTVa5GZj9Ye/loAdZO5mPNys5RBZyAQ4GAkLONb9iDr+
	A5uhAY0k3IEIGwBA==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id 2DC9F2C14E;
	Wed, 19 Apr 2023 06:57:18 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 0D4D851C26D7; Wed, 19 Apr 2023 08:57:18 +0200 (CEST)
From: Hannes Reinecke <hare@suse.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 08/17] nvme-tcp: fixup MSG_SENDPAGE_NOTLAST
Date: Wed, 19 Apr 2023 08:57:05 +0200
Message-Id: <20230419065714.52076-9-hare@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230419065714.52076-1-hare@suse.de>
References: <20230419065714.52076-1-hare@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can only set MSG_SENDPAGE_NOTLAST when sending the command PDU if the
actual data is transferred via sendpage(), too.
If we use sendmsg() to transfer the data we end up with a TX stall on TLS
as it implements different code paths for sendmsg() and sendpage().
So check in nvme_tcp_try_send_pdu() if inline data is present and revert
to sendmsg if the inline data cannot be sent via sendpage().

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/nvme/host/tcp.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 273c1f2760a4..9ecd7db2cd98 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -995,9 +995,11 @@ static int nvme_tcp_try_send_data(struct nvme_tcp_request *req)
 		if (last && !queue->data_digest && !nvme_tcp_queue_more(queue))
 			flags |= MSG_EOR;
 		else
-			flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
+			flags |= MSG_MORE;
 
 		if (sendpage_ok(page)) {
+			if (flags & MSG_MORE)
+				flags |= MSG_SENDPAGE_NOTLAST;
 			ret = kernel_sendpage(queue->sock, page, offset, len,
 					flags);
 		} else {
@@ -1049,15 +1051,23 @@ static int nvme_tcp_try_send_cmd_pdu(struct nvme_tcp_request *req)
 	int ret;
 
 	if (inline_data || nvme_tcp_queue_more(queue))
-		flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
+		flags |= MSG_MORE;
 	else
 		flags |= MSG_EOR;
 
 	if (queue->hdr_digest && !req->offset)
 		nvme_tcp_hdgst(queue->snd_hash, pdu, sizeof(*pdu));
 
-	ret = kernel_sendpage(queue->sock, virt_to_page(pdu),
-			offset_in_page(pdu) + req->offset, len,  flags);
+	if (!inline_data || sendpage_ok(nvme_tcp_req_cur_page(req))) {
+		if (flags & MSG_MORE)
+			flags |= MSG_SENDPAGE_NOTLAST;
+		ret = kernel_sendpage(queue->sock, virt_to_page(pdu),
+				offset_in_page(pdu) + req->offset, len,  flags);
+	} else {
+		ret = sock_no_sendpage(queue->sock, virt_to_page(pdu),
+				offset_in_page(pdu) + req->offset,
+				len, flags);
+	}
 	if (unlikely(ret <= 0))
 		return ret;
 
-- 
2.35.3


Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BF42144C7
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 29 Jul 2025 02:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753757042; cv=none; b=AVCP8YbVKe5DYb+rdkRZdV6xOR2PFSWEUSxkDajRVXv3knDdd8E5aq3yVR4AQ7rmy7iH+lhs4Quvws2RXTqZ+L8yRD9nKjgp4LWP+Z434g4BxSLgj2vG+cVq6pAe8652B6S9Dz/8SZ47N4qLWRSmZwg9T1/dp93EITAqbXxR0dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753757042; c=relaxed/simple;
	bh=EvYmYWtgKd8mjhgilzaDMPo8Q/bubDoA5KPliFrUEW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GTxZv/w+mP7fqIQj8ut0D08b8/xNn/0ySyAeJJFjRoqqX/lL2UFn0sWPvqClILVifKFtMbkZOK9xCk6yKHnSiLZp06wBLu1cxDSL2TqiYxV9Txs/dRQAJ+8a/3iCLoMu9FevcNEiGcNc38kz12Xt/Fl1bvcHdO72MTYd3Dw5E1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKXGWGzI; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKXGWGzI"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23fe9a5e5e8so18090315ad.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 28 Jul 2025 19:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753757040; x=1754361840; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgt0RW1ytIxlMXzvFaCd3u+wuWOkXNFg3PALHarFCkw=;
        b=jKXGWGzIWC4GLxZs058HBv6nO7DKW6utQ6vBWdNbjXGo1xMow9x4quUcCJ4AtHpD9Y
         5lcZKBIvb8KGzISg6HCTYClIkiMRwGLdRgWumD7Fe8K5/1rsTG1TMYp5vhhyeVUxhd66
         1Av1qg0ucQD9GiQzuYEbw8An80L/jNhvm/06WXivPYXd1GOplx/r+k5fMu4rx8fVmyd/
         MCpa4K3I4b1MVpiu+raYolYTQwpgoVK0nSN//uPZHoGt8E/h69HII7q711lEWT76HETq
         cCGuRO8oXK1x8KHlGHvCgqFVMniRMQeRXRLYGrpEt4ZZLbxAIjrfcSaOGsC/u+Sy8nI8
         Bcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753757040; x=1754361840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgt0RW1ytIxlMXzvFaCd3u+wuWOkXNFg3PALHarFCkw=;
        b=YQ7dgUjzIIRRG0dtCAWMw8RyflQHff+BrxzLfzkMfEb20Vfhqh6OK4dF1UWZS3tv1s
         YXlyd3aZk3YZZeSoBZLHBtUYzph6CzOLjv6cTVczVflsgBHKFgjgMsyGXBINIOQFGDZv
         48tdNIg9O4U27eVh4PA6yga/eYKznRIFw116uMXEzvDalFDJon5gAsOPVj9ZjsFGPDh3
         zDO+E60H19dW3Xoich6aYt6xieuAPZBR5t1amliRzGOJ1uyRBgaDdu+vAnFnkj7gb5do
         6k1qmUTySUt1RjtDe3ZvAOUZ79h2pJLSF+DzpbMWBG/OpngrsOG3S7UA3ZYpRgQml++O
         2dkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeCkd+8VH772gUKln+wVLxOQpzdfya82G6aOqvv5K10RvBM4OghtaxztBQqGjwkLphrKPJ5qvHfhuaH645ZUBbJf+o2w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4wdkFRdxkz3qUFuso49akhPxsXD5t36dyvblv2rMUlfdMPe0B
	XfkeCGQrEfZwR0fNv3PPzWGfXh8Ay1WkWkLwKmB7lSTx9ubtTUvZGcV7
X-Gm-Gg: ASbGnctck9p6TcZBZzPBbiebX0uZh61PoC7kVt1mRXgyjTLnzWi2dDkFNQVieMfy4jb
	I59ceq5SxCltXwg57OZGNJkLlHSnbMuoB+xTWF6siJ4jLjchpc6ILjhiBeZADjdpwrSp6buNWoo
	aicQlhrXxKuIRi8UqDTEWSCaj2rtG5T08uCso2p74p5qrVDfwI9Zpm9MIHTtFft7abWwnQFdv7j
	Cekbmp9aUECSBNsM5W5fCKvb/qpa57pBYvWhohWkkXEy2jxnRDmbW5KEtBkxoBSAXR1Mo3HYz1l
	96Zqd09CCPDdthYZrVYavz85gSIWMEPlVg/Zpx360vR+xDRoZmxYYs9e6kFWZPGp7lGeJSRsyfS
	Srk26iCoacVOOmCg/9WAkFdAf9g==
X-Google-Smtp-Source: AGHT+IHoH2RqRBEpNTQOrmGzch5WJntLLn2XCTRa7EVmeo/2jrFb47DkbxUEJrAbw3CNGKSshrbO6A==
X-Received: by 2002:a17:903:98d:b0:240:44aa:7f3a with SMTP id d9443c01a7336-24044aa8419mr55052065ad.31.1753757040472;
        Mon, 28 Jul 2025 19:44:00 -0700 (PDT)
Received: from fedora ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fecd9ed12sm51327855ad.8.2025.07.28.19.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 19:43:59 -0700 (PDT)
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: alistair.francis@wdc.com,
	dlemoal@kernel.org,
	chuck.lever@oracle.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	donald.hunter@gmail.com,
	corbet@lwn.net,
	kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	borisp@nvidia.com,
	john.fastabend@gmail.com,
	jlayton@kernel.org,
	neil@brown.name,
	okorniev@redhat.com,
	Dai.Ngo@oracle.com,
	tom@talpey.com,
	trondmy@kernel.org,
	anna@kernel.org,
	kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-nfs@vger.kernel.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [RFC 4/4] nvme/target/tcp: set max record size in the tls context
Date: Tue, 29 Jul 2025 12:41:52 +1000
Message-ID: <20250729024150.222513-7-wilfred.opensource@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729024150.222513-2-wilfred.opensource@gmail.com>
References: <20250729024150.222513-2-wilfred.opensource@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

During a tls handshake, a host may specify the tls record size limit
using the tls "record_size_limit" extension. Currently, the NVMe target
driver does not specify this value to the tls layer.

This patch adds support for setting the tls record size limit into the
tls context, such that outgoing records may not exceed this limit
specified by the endpoint.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 drivers/nvme/target/tcp.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index 60e308401a54..f2ab473ea5de 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -1784,6 +1784,7 @@ static void nvmet_tcp_tls_handshake_done(void *data, int status,
 					size_t tls_record_size_limit)
 {
 	struct nvmet_tcp_queue *queue = data;
+	struct tls_context *tls_ctx = tls_get_ctx(queue->sock->sk);
 
 	pr_debug("queue %d: TLS handshake done, key %x, status %d\n",
 		 queue->idx, peerid, status);
@@ -1795,6 +1796,17 @@ static void nvmet_tcp_tls_handshake_done(void *data, int status,
 	if (!status) {
 		queue->tls_pskid = peerid;
 		queue->state = NVMET_TCP_Q_CONNECTING;
+
+		/* Endpoint has specified a maximum tls record size limit */
+		if (tls_record_size_limit > TLS_MAX_PAYLOAD_SIZE) {
+			pr_err("queue %d: invalid tls max record size limit: %zu\n",
+			       queue->idx, tls_record_size_limit);
+			queue->state = NVMET_TCP_Q_FAILED;
+		} else if (tls_record_size_limit > 0) {
+			tls_ctx->tls_record_size_limit = (u32)tls_record_size_limit;
+			pr_debug("queue %d: host specified tls max record size %u\n",
+				 queue->idx, tls_ctx->tls_record_size_limit);
+		}
 	} else
 		queue->state = NVMET_TCP_Q_FAILED;
 	spin_unlock_bh(&queue->state_lock);
@@ -1808,6 +1820,7 @@ static void nvmet_tcp_tls_handshake_done(void *data, int status,
 		nvmet_tcp_schedule_release_queue(queue);
 	else
 		nvmet_tcp_set_queue_sock(queue);
+
 	kref_put(&queue->kref, nvmet_tcp_release_queue);
 }
 
-- 
2.50.1


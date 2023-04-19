Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220DE23D0
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 19 Apr 2023 06:57:21 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 3F0FC219A4;
	Wed, 19 Apr 2023 06:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681887438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fbXGJqT4hT2InAf85ntthypdfFi3dfVDKCVJVFGzsYo=;
	b=OmIDWJJft+HQH132rhpJP5GBY0QcIGeHkNQ1DJDUgv1ja6fQW2bQYP1Nti9Zltsbvt3o5r
	v0cFy9/0/YvEcTMxb8sEUsYq7A0zg/hGOWELexcl33icDBysQJhomvoiMe0z8oloGUmA2q
	4ewC1Y9dxLNT+Kk10p7NLUjsbIuX5Do=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681887438;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fbXGJqT4hT2InAf85ntthypdfFi3dfVDKCVJVFGzsYo=;
	b=ap35PDCW3NcLlkIw5SHhZX9qnCYi1N/Xw05vnODZkB3FcxKq59zEiclW5URVRzUssCfmzB
	DF/iAXlmYdj4cfCQ==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id E4D462C145;
	Wed, 19 Apr 2023 06:57:17 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id D76D951C26CD; Wed, 19 Apr 2023 08:57:17 +0200 (CEST)
From: Hannes Reinecke <hare@suse.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 03/17] nvme: add TCP TSAS definitions
Date: Wed, 19 Apr 2023 08:57:00 +0200
Message-Id: <20230419065714.52076-4-hare@suse.de>
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

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 include/linux/nvme.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/nvme.h b/include/linux/nvme.h
index 4fad4aa245fb..6e55a7a701e6 100644
--- a/include/linux/nvme.h
+++ b/include/linux/nvme.h
@@ -108,6 +108,13 @@ enum {
 	NVMF_RDMA_CMS_RDMA_CM	= 1, /* Sockets based endpoint addressing */
 };
 
+/* TSAS SECTYPE for TCP transport */
+enum {
+	NVMF_TCP_SECTYPE_NONE = 0, /* No Security */
+	NVMF_TCP_SECTYPE_TLS12 = 1, /* TLSv1.2, NVMe-oF 1.1 and NVMe-TCP 3.6.1.1 */
+	NVMF_TCP_SECTYPE_TLS13 = 2, /* TLSv1.3, NVMe-oF 1.1 and NVMe-TCP 3.6.1.1 */
+};
+
 #define NVME_AQ_DEPTH		32
 #define NVME_NR_AEN_COMMANDS	1
 #define NVME_AQ_BLK_MQ_DEPTH	(NVME_AQ_DEPTH - NVME_NR_AEN_COMMANDS)
@@ -1453,6 +1460,9 @@ struct nvmf_disc_rsp_page_entry {
 			__u16	pkey;
 			__u8	resv10[246];
 		} rdma;
+		struct tcp {
+			__u8	sectype;
+		} tcp;
 	} tsas;
 };
 
-- 
2.35.3


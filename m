Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4660F207E1D
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 29 Jul 2025 02:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753757032; cv=none; b=PZHqBIPPmTpNVNZ4wbY3P9O4PCrXX/GV2oTm1YdIh4IZPJ2+sflZcYE0kM/1XrVnsscBZ8FbGj23ISnmHexrIBPwbDFe2HUeOYvQeCntC5uyPJlg72LRdllb6u7ATrTE6QaQCB60GAd88HW73mAhC3wTrMPpuHtBtIYWdjQRLIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753757032; c=relaxed/simple;
	bh=l1v2UzDTGF6SZCH5BGbDUHWH2BX0eFO3PYu1YlOwF5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZ3ERYwU03mSfbHMgV9AdS9eqbfmT9K1Wb1q0TXash2tY7Lu9G9w5Mcc6YJm/K891PEqVDRpw/grFAiX1HJpDtcBSN3yZg/TEA4JXh0VovIb6YILntOp+fxyCltvtk5YNl55x2Yx10VUtvpEALebUcF8n7D/xOaSUdMx17zT6tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhzR9fff; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhzR9fff"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23aeac7d77aso47046935ad.3
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 28 Jul 2025 19:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753757030; x=1754361830; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKApX5AD9aIEi6uewJIQf4uaw0UGX/OqxGUTe4X6NvU=;
        b=KhzR9fffJUHBHnICeNZiFOH3Dfatq/59x1sjpcdDBkQ0tilS2vth/Bgenb1vhMd1AO
         rQKBq9HCRPlvuhE8osp6rsYaSTu71bC/nFbJXRtANEvlqVhjpGPnCumNpG4aSCC1eaI+
         ylJKjLLNCAX//gtmIaDqmg5PVw41yHNgwuATxbvjDACk48v2qZqFRigBOgYYwPNPebrH
         MXribQUR74ILzkHwHAiy9dI674m9Wxqe7FzXxfA5nzl1otAZCy9DhXXhukY2aLPl++bG
         nDfmSgsjyLMY6tilIk3G2a5bEh83iVLME5wZpr/XAoXpsL2ll79mfDyHpI4PBI+sSMI8
         jT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753757030; x=1754361830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKApX5AD9aIEi6uewJIQf4uaw0UGX/OqxGUTe4X6NvU=;
        b=epODJG9cBGJHFbatt7nhceo2KA2jduf07jrBcYVsrCXVAZzJ09crhVFl69ZvruaJV7
         Tm9lbkPrvFcEo/UQDwxwJbzJLHSip3wAcEbpbrWJO680ZnSo7n3nHnOib7wxetX8L4/a
         c8iaPshpxXvasr2hcjOKm3V6zjUsY7rEmthtHXnKG/pVwHCNXALeZWqW1/PsNsvjEZpC
         qB+ZIu6ooBVss/Aw1ham+P9srH5ry/nazssI26H+teH6JqsHCNreonIF3/H2Jm4hwEEp
         a6QxvsN/6YC3K8NKctN0RBN/vkOkweIQPjvM0qk508ppqZg9WY++CEXb00EiV+8WnywA
         9B4A==
X-Forwarded-Encrypted: i=1; AJvYcCVybeAInZ9jEQdTFpRxcvByDLoDv2698Ia0w3AKzc0vZ0s4NsnmOvA2Wt82nst5vAzvH+1lEEKOn3koV8McgElHnmhHNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzToI7c7HRr/RQXrxcSE8HCEGISn68XN0uAfg+oJefJgQ671TCH
	yJFB+UwPIcnCTv722vIvcNuYdBEVQYapVhNmKo7Y0Lk17rTXcBxw7BPu
X-Gm-Gg: ASbGncvqxTc4+MlJR7K6v7N6LuhG+pyDplwpTjYRcI2j3PgdNHfTjGCXw2mn7PLDFC0
	JZStZVdU70l44XQaIs3lPwjOsSQVe9nBmPV91n4OnFnF3qvIUNIdBiP1rPOdYvJYamqL7I7Au3q
	qSRpKbyG+byVW282IPK21ntyDKM9DiN4XZxdgs/gf2v/FTxlIjt1/QAcny7jwtr1wAETC1q/II6
	rofeTv97xYy3CPz5fgSx1gr2ZK0UuTNlU+SiSZZGE/CjcqTLDMiboQZm4xnsWW5VpvSfZrioOND
	j63yD+3NQtzMDBxanyahyF3J/1Ljn1RM5UTa0XC1NSXZXv3YCVwg7kRIzWSZojeYdvjmc94AGgJ
	+eWydJquTs+2b6Ix/NEFuNzWgyA==
X-Google-Smtp-Source: AGHT+IHdjXTtHTwMGQwZ9/tvr6W/g4hhHNiDFkExB3KA8O1wMz4OUmUJOvFvEzI8mjgHYmK3eABYWQ==
X-Received: by 2002:a17:902:ef4e:b0:240:b28:22a3 with SMTP id d9443c01a7336-2400b282b9amr114633395ad.29.1753757030520;
        Mon, 28 Jul 2025 19:43:50 -0700 (PDT)
Received: from fedora ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fecd9ed12sm51327855ad.8.2025.07.28.19.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 19:43:50 -0700 (PDT)
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
Subject: [RFC 3/4] nvme/host/tcp: set max record size in the tls context
Date: Tue, 29 Jul 2025 12:41:51 +1000
Message-ID: <20250729024150.222513-6-wilfred.opensource@gmail.com>
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
using the tls "record_size_limit" extension. Currently, the NVMe TCP
host driver does not specify this value to the tls layer.

This patch adds support for setting the tls record size limit into the
tls context, such that outgoing records may not exceed this limit
specified by the endpoint.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 drivers/nvme/host/tcp.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 65ceadb4ffed..84a55736f269 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1677,6 +1677,7 @@ static void nvme_tcp_tls_done(void *data, int status, key_serial_t pskid,
 			      size_t tls_record_size_limit)
 {
 	struct nvme_tcp_queue *queue = data;
+	struct tls_context *tls_ctx = tls_get_ctx(queue->sock->sk);
 	struct nvme_tcp_ctrl *ctrl = queue->ctrl;
 	int qid = nvme_tcp_queue_id(queue);
 	struct key *tls_key;
@@ -1700,6 +1701,20 @@ static void nvme_tcp_tls_done(void *data, int status, key_serial_t pskid,
 			ctrl->ctrl.tls_pskid = key_serial(tls_key);
 		key_put(tls_key);
 		queue->tls_err = 0;
+
+		/* Endpoint has specified a maximum tls record size limit */
+		if (tls_record_size_limit > TLS_MAX_PAYLOAD_SIZE) {
+			dev_err(ctrl->ctrl.device,
+				"queue %d: invalid tls max record size limit: %zd\n",
+				nvme_tcp_queue_id(queue), tls_record_size_limit);
+			queue->tls_err = -EINVAL;
+			goto out_complete;
+		} else if (tls_record_size_limit > 0) {
+			tls_ctx->tls_record_size_limit = (u32)tls_record_size_limit;
+			dev_dbg(ctrl->ctrl.device,
+				"queue %d: target specified tls_record_size_limit %u\n",
+				nvme_tcp_queue_id(queue), tls_ctx->tls_record_size_limit);
+		}
 	}
 
 out_complete:
-- 
2.50.1


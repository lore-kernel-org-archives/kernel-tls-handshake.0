Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6161231845
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  5 Sep 2025 02:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757040466; cv=none; b=lAOTFPq/bQwtaT4AOLGmtvL84C45IPewSu/syuVARQ4/1Y6gfOyrtssJokOFsLIDMAGUyzlR6zG0oTOsveXyVSQdmXBP4XV5L3sf5Th3bElPsWyAwZNhNa5B8uHmja7Q5eTmANhjlvTYqKvZZ7TPv9/0NW23S2WYi4+OhTnqZag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757040466; c=relaxed/simple;
	bh=J+sdQWSQrZpWZwQ9yjccb0lgc1cwDBZzL9qHXmDzZuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZersRzxDsAOr+he5qkE71vbA56iFCmQYx1pA18VAvRz0gpVOGHvWM2LqjOCUVGb08XJlk9SbS3/t6ewI/4xyPjStlPO4lzwI2SoGuBWb09XDTcssAqCqMjXs9CJDOV7aBEsoEf3dBdiatNI+jjxsVa+IDdlltEQbYN1Hm7kdOLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJ7vBBWe; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJ7vBBWe"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1566640b3a.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 04 Sep 2025 19:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757040464; x=1757645264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCaQeEoiIyJ+X9I+BeUdEKTAO8qJHTIamDyt5AdyHmg=;
        b=IJ7vBBWehIcJJ73sewTiXYRX5/EGgUkTMEYsO+w2R/G78hvuvuNWcKZ6qyOFo2gLA/
         nhXlobID5dxRVPztuxYc0D168k9jm1xJF+rX1rtT9Gx4Ttu8VGBKBvfxECvDCqlXgHDR
         XjZhfZ0o8Emjz/S4qqb+8N1dZLhVsQGwiuD9UbDi/yjYggD2FyFSvoqm4tY/ewcnC8BN
         irkevHwkhFVBSfR4S7+Gyt2DTsOxhVsAw4ZyyoOlCr7vjRW8oBmgvo4YxeUBIETTZ/ig
         IcYpVPlDJxSI6k5uNitW/PLk6gJWnTn4Pvy+exjLnY2uII5wB4IpgsffFbyPRuWSmsAK
         kBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757040464; x=1757645264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCaQeEoiIyJ+X9I+BeUdEKTAO8qJHTIamDyt5AdyHmg=;
        b=KNJMoOjy22rHMkTtT6lwfSTUVA+rm8RRc51Kg2nGtTr83idzClhzKB/EIq5PpuwETn
         YPT5xaCoSGJ4mkvznE2gV2T2RfQdrOqZ6yEmiKMY1tbKJsVCpZGpk0wJtvRypgX08Vlw
         3JfBOZ9EI5l9cIKfBt00c2O23WTLYW1YeY3mNmrUwIiT8blvlFkKkLASbRhG3PYJIAI4
         pkj3isH3YxSWdjU/yufmApkTyfExR1eqBexcmJCMMkGv7OgzWtIK9O6G9vCVNqRPTYI5
         NgmtQezolc49Bvb2Bo3wSBb3FDlUUg+PFTPdnbRM5Zc7oQQzs5xv99VQUIJMSsgYT2TQ
         RTEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq7IeLm8KsuYAEVQUd9kpfLMy8zK5jR7bJXWNhSlwuZzlT/BNJWDxbtrWCaE0G1bOA+2p8+sJZ+hZsCJLJI4Hyf6RBPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpxWGqqU+joUm4eYPGIsTcbPTwSNx/XTF9S2v8KMsmCAOsmV72
	91P8TI/6VbNqPQVarzHDxlmApiXSEyrU2Z5tZftDEhX0Ufnvh+2r3q73
X-Gm-Gg: ASbGncs4RpL7oTBLn+1jzj89PFGDbCsRKlHXlWvxY+ag+ZwIUw4iWLrTDt8rS7rEE+x
	bsNusJO/gK9Aojou6E1y0XjJ4bFLeZ26q0KBUMAPyMrjumWlhU7ZtjI1vZRZDA3I7SlIXvOFC6D
	cj7TKwUFO2+Vn1HL5narLOGL/Vgz0XuJ5knYpegDRvByGOLUQOPYa5SLD6+Ij8g8ThYtxY22qK9
	2mZP8DzEZUYym2Y7YOAPFyJWjmj7ruzgp2CFTLknykcVy9BfRi6o7frTJJvEl+j6sQ6liaolEyS
	NM7TewWzDr1iEIuN0+Ift6J0jwVypVfT2qt9RvyT/ZF3H9vzTdxQ8PuGAsziMfUR4QbIckRXjyi
	3xw85w5/UCQu0iRZ391Ywgl8s459O9PEBpAC1Qj7dFsC0mVz7Acl6/4Y9gVD3mQ+iOF6/wxf5eD
	iRpNW6W0W8Nw0zCFGRxMkpat9Osn4HhLLszfVMiw==
X-Google-Smtp-Source: AGHT+IGyxjGucAcq4/CU7sDyIrxh2LLf/2cgmkqvjOqu7ZTDbk8ByUwUxM4eRmIFb4t/3oQsNifJkA==
X-Received: by 2002:a05:6a00:db:b0:772:6bee:9ff4 with SMTP id d2e1a72fcca58-7741bede44cmr1504866b3a.5.1757040464162;
        Thu, 04 Sep 2025 19:47:44 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772590e0519sm12991858b3a.84.2025.09.04.19.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:47:43 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: chuck.lever@oracle.com,
	hare@kernel.org,
	kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-nfs@vger.kernel.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 4/7] nvmet: Expose nvmet_stop_keep_alive_timer publically
Date: Fri,  5 Sep 2025 12:46:56 +1000
Message-ID: <20250905024659.811386-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905024659.811386-1-alistair.francis@wdc.com>
References: <20250905024659.811386-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 drivers/nvme/target/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 0dd7bd99afa3..bed1c6ebe83a 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -430,6 +430,7 @@ void nvmet_stop_keep_alive_timer(struct nvmet_ctrl *ctrl)
 
 	cancel_delayed_work_sync(&ctrl->ka_work);
 }
+EXPORT_SYMBOL_GPL(nvmet_stop_keep_alive_timer);
 
 u16 nvmet_req_find_ns(struct nvmet_req *req)
 {
-- 
2.50.1


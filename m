Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A031F1311
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  3 Oct 2025 04:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759465953; cv=none; b=DTy3nQg4lPUkcnXQ1j0ObJwxRrPUkvSE6/QS4wdwpdJcnJcri0nkBC63PQ3u3z6G+m9j6jyzPa6jZexY3FQtxWii+V4Ozt/kUQvmFrzYAr2Vr1H8sIrzd7nXywDsfShY1Jr7180HMxr9O3+GUIZNaSXjmQSRnRI9dB/1jrPi7aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759465953; c=relaxed/simple;
	bh=7VMPKWz5uYNRKWr5qHgYxgxuacRdmA+VUVAZxwMcJxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TupkcGVVPw9TzdSTgps5Q21kwni8TKRNbD2hDIu6V50SYNMtSIO1+TpkBGFiiJKqB8wJV6xgbfO+d+c9yypSk/Sq8ljeMhN8wM1VSgFWqSmCdtRIO9bggTI8cRrkZC9zYHiNEE014Bzj20lSeEFae0SJ9RK7GyyKsatA3K9X6QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eA/+R2zx; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eA/+R2zx"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3381f041d7fso3174908a91.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 02 Oct 2025 21:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759465951; x=1760070751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z24lKsLPaefpARjOZTyt8urU57ilAGB24wkoWzevBy8=;
        b=eA/+R2zxyy7vFwQglUDcLCotRQtOJ0HI8OB5Eu80wqfFqQ4WepRy5RUkFnlkc++big
         RtaCJ6niUJCSjPPowqKyk8kWDBwJTds8Lq2sMIz9//noVpVXtapJOyr4aHasDkgunFM0
         3Do+XzuHqhNyFTGWBiKNYbm7GxDdDtkE5CXekDjM1vHqsZSNy15rKCxTtlZ6j6LzBm6g
         GGE5Pmf1Joi+yH/R6WzXG8V3TXmrMfFLKGvBbsoYMT2GJJ7hnMW1t6RWdCYFrGy+4gio
         GnvK01558O/RtCO1zTMaqOOqSkK/DXgSkYUF5LtIBQyf4SijnjIQ6hT3/NHmUz+hg8WB
         8cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759465951; x=1760070751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z24lKsLPaefpARjOZTyt8urU57ilAGB24wkoWzevBy8=;
        b=sZJwgWXlcycYlehyVFidE5g+8C5jho/k2Aew6FbaLCwR9WCQ8w/6xN2x+Xvi4NiI7R
         DmPNR/0OV3lRtjB3nNnWL1cMA54Am8r40vZqLemjzDMb6tUkdmy9klosOPK9NXmzs+NQ
         IjMnG7eXRW4U+P4o1LY84niJ5bstaOoUJQQAmWiBvS5yHRzNJSdq0r+gwXuK5TB/w0Qj
         SnyGnuMtqM+hkb/uz1EK1/Iz/4U6qvTJJNWVoRDIEAixCNWV0qw/m4WR4+5cfL+OFbzV
         CuFuUoDW/5KowzBR/46DcUW+IFDr+rBtKgbHh55JadbGTC5WDaEtbaMhcf57ZjiGgkzR
         /Yog==
X-Forwarded-Encrypted: i=1; AJvYcCXXSiPLXauqQ3RWYmJpPJQhVsHHgQP9xcmnLp3tZIhyDpMZjTL4hfxxTbjfwKDjwktq8ql8C04wMJ4A/cemPy+MgbD79w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj57k3Kwal0O7UAdcxvA8n7puyOAO6upKurXFYMeWzR5HLYLPP
	wasOKaU2M0Kp3Oci/XQtrAH+0KFiCjLD2k2M576GP9y828PwubAzSzvt
X-Gm-Gg: ASbGncuP4HREYkYxfzMvBpJjrk0QNnyjeVTFaHz0TI/+CjDKNbujBAJKyEIE8l21Wvc
	N8XMvK+QH7AHsEPbslsJTmXwF4ikq4lB0n3pTeK+Ph7l7GQgkKn+3Fc7Nbr73qSKuxQjbEl2lMq
	wfL/dX0gWHwtqYjKsewznN+KNn2SKMdu1MdgNtgsl1yniEBL6BjsDxFtGs+om8TWlDo/n2wcPEC
	AFMqGHlECssMEqbb3b8NV3UBfCEjlXyFtGYoaihbrHjuAOHH8LUspbI9VrreXuolsGCatvCKMyH
	2vE6OZhWmTh+TPCVjSYIrsjeN9H98ATlWZdhWY3Yv98ALxe/Vm8MPgrazJgZD+QYsMphxpgUbX4
	J+TR244zIa4Qc3+RrOylUQh/dFoDCENQpnDNSyjz9S9+PnpO9y+i+N7mEyxdQlHSclIxIdcNdjd
	aJtEPNX0IUmhHdr30gOy2mgZ4W49bbBvWkqmqLx04w2sQ4TlZEr1Tr
X-Google-Smtp-Source: AGHT+IGILMEf9Tw/o2u8qdi5b+EnvPskNraurbyacR0IziRkBvpz30elIe0oEPrEq1mEn5hgoKypZw==
X-Received: by 2002:a17:90b:1b12:b0:314:2cd2:595d with SMTP id 98e67ed59e1d1-339c20c099cmr2180806a91.8.1759465950687;
        Thu, 02 Oct 2025 21:32:30 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701c457sm6528233a91.23.2025.10.02.21.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 21:32:30 -0700 (PDT)
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
	hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 4/8] nvmet: Expose nvmet_stop_keep_alive_timer publically
Date: Fri,  3 Oct 2025 14:31:35 +1000
Message-ID: <20251003043140.1341958-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003043140.1341958-1-alistair.francis@wdc.com>
References: <20251003043140.1341958-1-alistair.francis@wdc.com>
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
2.51.0


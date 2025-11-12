Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0A02DCF44
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 12 Nov 2025 04:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762921706; cv=none; b=Kw1uqlETvpNCKq5tpj6Z36hfU2KpoVLMP++2qUzjRYo1zHaixipqIMMQ9tT5OAPf7XI3GOs1tmx3dl/bf46rvM8AE3ZkCmK9Wli+p3eciMjDDaPY2A8xLRI0KNE1eBRJtthWdR1Ugv9kj3f3i1NZitzYW9bUhjCzzC4EtdkMO7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762921706; c=relaxed/simple;
	bh=zP/NG7w1+KArs879n8cQJzWDunWwyIPS5O4paM2aWv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBplq8p6Utj/LleCXt58VQEjNYPMdD+1jzosXZE/qvDpj4G1cWgfC1tUvcf1PT/ksWV9slrPrP+qPJqyGNnndB74b2OvN70kKXxMUUHSS7KDBZmuf1xJCTANJasB7PQDIT6k+DebxdANqLpW3FMQgAjUi4GaXlSL50Kui3/9ATg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g47hrJoG; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g47hrJoG"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3437af8444cso375141a91.2
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 11 Nov 2025 20:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762921704; x=1763526504; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkGiIciWDidvQkbZlkaOibwVplEAw58SDT70kiDe31U=;
        b=g47hrJoGK/cd3QDLhmuruDo9ZKOwBkJGI3AEseHY4lUa18t8c/W3KDCfYGP2TpICjH
         Bz6DU073Df9EPufhgjsSHp/zJg1oEmBscUqzeXxjbXRXlUmSHtnSQjVgtarwkaQiyK2b
         1sRB/YLj6kE0lp6tmseLEY+0UsM16RhIMZ0Kdw/mlBirpA2plSNKZ9s4Rir2Vq+vcotB
         cm49bq74cG7Xg0fboLRAYbXrNr7EveRbte1Ok0LNDDsLfDtAl7Or6vj8G1TaNcG335iN
         tIG6/R4LCjFBppcARxTyjCB++iBBkejWmkSdavAnJ+UvKJJJQyTeVB42YZyJv7YNyiyP
         SgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762921704; x=1763526504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zkGiIciWDidvQkbZlkaOibwVplEAw58SDT70kiDe31U=;
        b=EarPDQOVCWENObPUaQ5wk0nxH882eHvEB8l32bp4a0sv3lqBczrN+ts4kqg62RtQg6
         WshJB3cH/uvTf1xJuea2FYITj7WM3j8w+Ot9swocKa4xb+w7Xkwk+tZW9YCd5NCueN65
         uZ48gKjcY4qu1nSDVW074PZBMUbAtfChoaQrbSVvs/h2syiJ3CF74jM7RoEyfHdQbl+6
         Qegs+Fw3dWR/JYnmVan1NSlNoKWcKy8oycnicm4HAjmQhq7MUlenaWsNIqVBJ5IuBjB1
         Hd6/Z1hkthaBbZXhgvNxt0id8ixHIFadU+W19YSQq2RUbYg3gr/cwiDsfGLSLf6H7xX+
         6xdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFfAXPUBtbOIwqPYLbRxKs2bBdAIA6EV/EODkCr6RuEgZSUTGwDEegRw0prYIx5+yUDOR8bFOvAI/Mi9Tp2Q7VQl4SkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+Ht7xcTNCFoVQSDujRSyg2wiS/menXaCB0CR5N//n5K72wCxA
	BLrMYhwqLLlUoYBC/1/F6ln9A5yUMAeVrUhVRoi46nN2XiBdCldW5NHL
X-Gm-Gg: ASbGncvG7aqYsQfRCzohSj2Db+CbfmOEPZuuFt1tHUsTt57APVDydzE/pFYWa59j0Qw
	JR24NJqs1MKFiLOfquKvh/KGaQHRIlGxD8u/fzXf29lPVa2nfHVflm93htFFErcU8B6gVjH/8eI
	eWptzUioPxvPem0sJGBopesDpS3A857FAqw+bYW0CVjSxIDZIs7YhWtyXU1Cf0Yq2Hqj2Af14j5
	ZTF/l8slw9ULxHfy1LBmuFFlkmquiWL8LE3NmRe8upaTDI+x4p+GJax6y/5VUIkkLeHBkRMxEyt
	jDKALpNoKi60UGTqIlmUCuQwvfvmENk8TVVfIoleGwt3O9dEBp2DXXIalbYVVHoML3UAC37CfCF
	fOhBaefhU4B2XGOxFmMU3vDcZOIT2+AeQPjQl/7BzqBFtQy9AMpdel9F54himuunjShWqTrPiRR
	M9y1kDkLq442nlirEVRDjAoh+bMeVEQh/RLB+9PcnteXiBPiXJWHd5aeEi3i3FkJ9jspZcCuNek
	GryezNC8Q==
X-Google-Smtp-Source: AGHT+IFz599JMY+HbLZlN+Y4HCQji4lI/mnZmgyLfcZAZDfwLpsK/Yd65k0yw0c8AJv/WsCEFQFd3Q==
X-Received: by 2002:a17:90b:4b89:b0:341:8b2b:43c with SMTP id 98e67ed59e1d1-343dde81845mr1915818a91.18.1762921704526;
        Tue, 11 Nov 2025 20:28:24 -0800 (PST)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e06fbc0dsm854681a91.2.2025.11.11.20.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 20:28:24 -0800 (PST)
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
Subject: [PATCH v5 3/6] net/handshake: Ensure the request is destructed on completion
Date: Wed, 12 Nov 2025 14:27:17 +1000
Message-ID: <20251112042720.3695972-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251112042720.3695972-1-alistair.francis@wdc.com>
References: <20251112042720.3695972-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

To avoid future handshake_req_hash_add() calls failing with EEXIST when
performing a KeyUpdate let's make sure the old request is destructed
as part of the completion.

Until now a handshake would only be destroyed on a failure or when a
sock is freed (via the sk_destruct function pointer).
handshake_complete() is only called on errors, not a successful
handshake so it doesn't remove the request.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
v5:
 - No change
v4:
 - Improve description in commit message
v3:
 - New patch

 net/handshake/request.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/handshake/request.c b/net/handshake/request.c
index 0d1c91c80478..194725a8aaca 100644
--- a/net/handshake/request.c
+++ b/net/handshake/request.c
@@ -311,6 +311,8 @@ void handshake_complete(struct handshake_req *req, unsigned int status,
 		/* Handshake request is no longer pending */
 		sock_put(sk);
 	}
+
+	handshake_sk_destruct_req(sk);
 }
 EXPORT_SYMBOL_IF_KUNIT(handshake_complete);
 
-- 
2.51.1


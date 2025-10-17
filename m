Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DE730C37C
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Oct 2025 04:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760675032; cv=none; b=RCnVtylsnYQcQujsUs1FqlWYQon88pZ4GZuj4653Jmq++Gw7Df+y50atTlaeAfDWplCAcmZLetbbnOaBTJMv0+fz0Ete/c4oosAC7I5+mOgNbGeHg8ZgincVzOnUS+quk4vwh1yU/d1r0D8wYV9pRfyngC91eH3J8znh1t7hk7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760675032; c=relaxed/simple;
	bh=qJIYSnU+HoRbvlx3ywhGBF4rw4sM63dPw5pKUX1ZIk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXx1yqbXzB7J9Y41VW9gfckLOqsN9xgcXcwaZKoylrNsWvmD9PAcJeugShpkg/Q+t6SNsgbi9GGyK/4zfjt2ND7NZRhoTYQnLsoCAWx42fLugiY1YKDBPpvmf9tE/prs5Ssgmhol8P5QWqg0JgQkRPWS8E50/+lZL5vVUYAUYWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/m1j8qn; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/m1j8qn"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-33bb0472889so1603557a91.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Oct 2025 21:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760675030; x=1761279830; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAkZgFdLzvs8Exsdja0IC6onWedwrzXxt2HCf6MfZEs=;
        b=Z/m1j8qntR1o2a5tCLXKVrek1vz1tlmkh1TKHviqVflsfKD5xRs0S7n0pc9Jx/emzt
         UXkFmdfHcOV8r0wAnR45yQ5PUb68ABBEGrW1pD0tfgBjADPiftmY7kJT3ivo/3ERXEar
         sqx9fJdlvMBbz7dVny6qtIudkBmM3JnarKoUqaTGJyMqwM8YWXN/R5UkUm3k97/IInBL
         fueqmfcB58pP1AAyHqxvisWN/NSSIuI7hQ+eMEPvRmY93b1XJfOpRUwiEteNjV7u4VQa
         I/NhenGjf9c5a8EyxyRv/vwhw+0bCn9F/jEVKTMg3/MARId2t92LOmzpyezprtNSLYQ/
         GTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760675030; x=1761279830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAkZgFdLzvs8Exsdja0IC6onWedwrzXxt2HCf6MfZEs=;
        b=qs49vKRl8owAIMbCeGrBbzc4MWs3TfLAploqCUx/YzeL5wzGROUYwCftVCk82j7nqr
         JNy3u1B0AAHM81lu+SJahbFd9FApEfJjKCvy3tZpy3AQVdxFB/Hj9fSYyaSZ7+Jl255C
         XUwmhzIYizrg288mF8grR4rTcAVQjNlvHDL1nIfj9xH6Yfv7mlH1VVT5mS2ODqL0zsc1
         mpNkUKylIfCdMG6Vms6knP/Uwen2aahrASU/HDTRQfL+mqIySeRMVaVOGttXz3PLa5cH
         hW5jJUnVO8tJ4wYRxcmcHVg3vTSDm2czSLYw9+FJrgTzDQ5KF3vzN7dEKYQzz1q8yEez
         T1YA==
X-Forwarded-Encrypted: i=1; AJvYcCVQukfxar9W8UJ/a5KnOhtWJV5KtRjd4mc5IEXM8JgBeLTkGUTUjkDKe74bwMdi0PFoPkL6BzTJWNejLfwGQ3KinvX8SA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp6OCmZiYAd2YKT2OxQHw19F6+G+iqPBXx4Ojp+nHUtObJQqeg
	2dg+4CZ6auAyAtfr4pNZD1QDVpDLhVxVIsiLtrt+4+4lP6GQr1tVI2k5aOsDXw==
X-Gm-Gg: ASbGnct7wS7XVkRIlGjjlvkAS1/aznN6+pI76/aqojc6hsqGPoU54Jqt5VuPhzIFzbH
	qNNN4izNygAEou0sMVfRJWh9d8hSfvHxROOn/JC/+mbpBrOi7wGRSKfWml/QzJFRG6tLITU/l9p
	JuA6TxpqUPf6+slXUe7haS2zG0LrbkVN91dzNa67IEYV7+aDY19Rvjz3OtzRh9OZFqmyyZPsqwA
	Oja/wxHxMY47uoDjF23FSfyinTVIzIJvrfVOcikPeYgqiG0atDY18IXL7xKyKhe/yM2pTGseWER
	DTdgcopD45ImUv4Y+ZAOgTNhdylRI4g/BapVd/qnWoozjrd1C1DBCJrlYp2WEYGPmV0bTRA0vsk
	bGNi7RtWgK8ZVm1cevOSBlsblgr5PKngxpBk5cAIcgy9hSrGIuJcB4tNyt8fX8GViAyK6YX3oBF
	v96IuGrHKaYKrJ8wwrVuITP6tlX/7U4plaVg6/72TlTGEgNMkm/utVFKgNxr3H537z9shnfXkME
	hdsI8DLNAogOA4pwLLC
X-Google-Smtp-Source: AGHT+IFfbNX2mTod+6zKsy5GzuQyZpJ35ah75bJLjAVf3giPURvKPzSrUXNdaNKl89D52wOXFUj7ww==
X-Received: by 2002:a17:90b:2ccc:b0:33b:c9b6:1cd with SMTP id 98e67ed59e1d1-33bcf8fa1fcmr2615932a91.19.1760675030324;
        Thu, 16 Oct 2025 21:23:50 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33be54cad3esm245557a91.12.2025.10.16.21.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 21:23:49 -0700 (PDT)
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
Subject: [PATCH v4 3/7] net/handshake: Ensure the request is destructed on completion
Date: Fri, 17 Oct 2025 14:23:08 +1000
Message-ID: <20251017042312.1271322-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017042312.1271322-1-alistair.francis@wdc.com>
References: <20251017042312.1271322-1-alistair.francis@wdc.com>
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
2.51.0


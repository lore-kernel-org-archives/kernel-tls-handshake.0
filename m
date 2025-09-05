Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F03F246BB2
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  5 Sep 2025 02:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757040454; cv=none; b=dEjYgypemT5fAAaxxo3t75QBRfYrir2RmXUclH1HIDhKjHVnwqj1Ltcqb0POxvFH2HuaTxLF4VB9M89PCdhLMPmhJfvIFwsFEq1HwPyGIX5U31EU2n0904b8o9Q8dyx+M/3uWbrauRrL2dLEiGkFQSDZME+Ah2QMpaFyzPPmyw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757040454; c=relaxed/simple;
	bh=UtEHgCYNC8YStao7ct/JqrQBLdDxGf+yLN+qigPPYgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JATSJSqx/8KzB8cJb612ZIOEdda+8hnljNyRBQISk8KUQeNjV0H1tR3DI8XVA3Tbr7UXKivMIAjfOOhm01ia+5kb97M84g9nb84VEz3Qfks2O1VDAZnF0FdHtr0KXGv9m2VVxOPr7H2p/1yatjkw4zFXOnFLtxrgnItzobOfgCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibZId9LT; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibZId9LT"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7728815e639so1068560b3a.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 04 Sep 2025 19:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757040452; x=1757645252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tr7ELGOkxuEFTNKTRlSXZHzuS005z5Na+L9CuZ7aiI=;
        b=ibZId9LT1omEi3vr34sgWSNg/NK/vb5hNKNaKJBmaAGWLNvpzaCdmoPxOa9rFfdUp2
         7F2F30leeWiHapK06FrNHcWPfYzSBPuLK/9thJ3g5Xy/lW6pGjIVNLcjvpJofO0uGAKL
         PaBB5PbeNSBHLhQhSsc4wj9weZvlW6vSVhr5k1GeKUcb8xsNADVORsKt96MoWltIDVPK
         YC7oCnIfBEChQE6+4JbNzNPa+bfWOKqNIZ5kuqclOWi1i2UFQthUa6DgK+6zBm/85cbO
         k4Z/+vcr3xxsacNatM/X41j9bWtAlkxMgFDhZt6XUGaT1eGSNp/puD9nlZr+ENIh8MHO
         VcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757040452; x=1757645252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8tr7ELGOkxuEFTNKTRlSXZHzuS005z5Na+L9CuZ7aiI=;
        b=fnLkXRCcYZKnVhyiGxh/AbGYmeUHeOUXRhfAgyHL7ezUT9nDaFlnYvOtzyrga95kpA
         MQwRTH29hPL0bUd7I7+e90vXtD2xGvnR+4awKZlbDv4TKz1wt18VAAVWD/pjVYhowee2
         n5SkUHZIm4qgWH7qJbhhj1XcdNuuRyk7axRSZ2sFLlcoHcEZHCtAnyD0Qk4q3ORntoUa
         D5J/t9P/MQ7O07j2UuUoSVm1gxITMhl2p7E/p0+fVfzAsQK57ShyAH33hyKldSgbIrLg
         KJnzJOuBZK3LcslIRy1uB6wf8MTlySUDR3KzHpnlT/KjJWVkYovyvyRUOwyisgMDMLLc
         PqxQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/DuMt3K75GOxlLbtsqsO/AEVLBleCT/J/HwryzSAE4p3/8XrNTNSxPAwu0kjYSOxnQxQLDsGPJlwOEys5vInah7Q9KA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvAyXhqf5Wi64zY3R03+ST8Hm2bk6zLsxiX+Y4zE0KYzExnCH9
	G/LocwutuM89M3yOp0aMoVNrOHgUlyj/dO+ujWRFLGqFs6oKM0URMXV2
X-Gm-Gg: ASbGncvNenLCmJE92n0ko+7Vgto27oRdft9GrxTuIqJzlK1YJk2dItUlpORqEPqgqph
	yHBDHFsmMj+hAN/iLOWDIsZUMOr3MRvXKI/jn7UGaHN+qYJ3XflkmJqZBqv6Xyxb7GyueFCK0ui
	vuW8geHNlfGwmynFuakDhE6+tPIAoeeDjBdAtbrFfk37z17RVlNjU9ioE0ZXa4yeQsQRt/KDbrg
	PtpkUycoDIj4SlFOPtYcZWL72uEDIwXgMG1lpbVTTPybS5MKoiJyAtwasMpgr/9hfIZgKy1WuJk
	pTYWVT8Xyl3JtfFbDwNPuwF2HtKMsWrnsipWF8TyxC3t/nBE922+lEEbQWJZE1otb3mxsySsHvz
	MQd1ENiNp1cRajDoUTo2iEghADFoRUaYnFLcRh2nR/fsdYmpSNVNc9Q7wU+yOVXRVe+s5bOndVJ
	IkX3YbB9sr2LujnSfl/npm5Gos8BM=
X-Google-Smtp-Source: AGHT+IEpxJLcudozMK0RlH08J4zC+7BkrtPegzKfFrmhuSA37TLE3wdFwvGA3QhoSWRGB7n6xUFADg==
X-Received: by 2002:a05:6a20:3c8e:b0:243:b656:dcc9 with SMTP id adf61e73a8af0-243d6f8ddcemr29359920637.55.1757040452539;
        Thu, 04 Sep 2025 19:47:32 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772590e0519sm12991858b3a.84.2025.09.04.19.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:47:32 -0700 (PDT)
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
Subject: [PATCH v2 2/7] net/handshake: Make handshake_req_cancel public
Date: Fri,  5 Sep 2025 12:46:54 +1000
Message-ID: <20250905024659.811386-3-alistair.francis@wdc.com>
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

As part of supporting KeyUpdate we are going to want to call
handshake_req_cancel() to cancel an existing handshake in order to
instead start a KeyUpdate request.

This is required to avoid hash conflicts when handshake_req_hash_add()
is called as part of submitting the KeyUpdate request.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v2:
 - Fix build failures

 include/net/handshake.h   | 2 ++
 net/handshake/handshake.h | 1 -
 net/handshake/request.c   | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/net/handshake.h b/include/net/handshake.h
index a07fecea87eb..10f301f3c660 100644
--- a/include/net/handshake.h
+++ b/include/net/handshake.h
@@ -43,6 +43,8 @@ int tls_server_hello_psk(const struct tls_handshake_args *args, gfp_t flags);
 bool tls_handshake_cancel(struct sock *sk);
 void tls_handshake_close(struct socket *sock);
 
+bool handshake_req_cancel(struct sock *sk);
+
 u8 tls_get_record_type(const struct sock *sk, const struct cmsghdr *msg);
 void tls_alert_recv(const struct sock *sk, const struct msghdr *msg,
 		    u8 *level, u8 *description);
diff --git a/net/handshake/handshake.h b/net/handshake/handshake.h
index a48163765a7a..55c25eaba0f4 100644
--- a/net/handshake/handshake.h
+++ b/net/handshake/handshake.h
@@ -88,6 +88,5 @@ int handshake_req_submit(struct socket *sock, struct handshake_req *req,
 			 gfp_t flags);
 void handshake_complete(struct handshake_req *req, unsigned int status,
 			struct genl_info *info);
-bool handshake_req_cancel(struct sock *sk);
 
 #endif /* _INTERNAL_HANDSHAKE_H */
diff --git a/net/handshake/request.c b/net/handshake/request.c
index 274d2c89b6b2..02269f212c70 100644
--- a/net/handshake/request.c
+++ b/net/handshake/request.c
@@ -17,6 +17,7 @@
 
 #include <net/sock.h>
 #include <net/genetlink.h>
+#include <net/handshake.h>
 #include <net/netns/generic.h>
 
 #include <kunit/visibility.h>
-- 
2.50.1


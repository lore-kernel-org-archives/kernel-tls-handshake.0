Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266C4244664
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 15 Aug 2025 05:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755234161; cv=none; b=te2225NeMhkMBTKO6JtV9A55T0Ou98ABoB02/SDIa6dHahf9tAQ43T9E4jAbaJzmTKmM14dxnnOTeFeh7KufOQ1CAiHuVZyaT5//XZ2nO2+Rn8D5DbTmIAZWjkBJthjTPCcHZ8B94YWSADgFS0IIQ2eHYMyuSkrGemIld/wzujs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755234161; c=relaxed/simple;
	bh=p67jO3RmrFN46SRVNjcEkPQJCdnJd8+gbJzoHF2fRPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUA3sr4kuDn2VaxWV9w16CP+PFR6an34WCO8lrH4Np6PrC7qSzFTeqD9CAQu8hSNN7JkSUXQhrUytPd7RDlkv/yh6IRs1TJOa5FsOSGV9S+ZeUXOBGLSdZpkYMHVSnw6ibLWx8qizFKCnd848ZKXj0GrQa4FVzO0INTCDaue7v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXdLgZ8E; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXdLgZ8E"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-24458195495so11075635ad.2
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 14 Aug 2025 22:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755234157; x=1755838957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KvInbCUt8tTGLRjQNfEmbBCvEDs8pNQ8LImh9T5E8A=;
        b=SXdLgZ8EVV3/WpRS33J63/6+KWbmtfQtrGpYxf2WK2wQx5H+KJTr4SAqIWLuWyfaFG
         ZVcNaQv753PdXaRI4QqdDYFsS74DgdDaoA4NhDJgKtHQ3R6iqZF/r0l6SCK6VIGavETZ
         MEGubdXuOp7375ph2UM+Rw6yeswk16wFy0MhwoGY518n+0p8St5hpkMCFTUbRhK38Avi
         Go57aURaJtyhFd36w2ILm8FFZ45J/s85KZ/ojDkYsYPaEefY2LFQLhhwDi6MZ1VJOFTz
         Yrjbqqf7CMfY8qYMxyaFS5xu5+kRXjGdco4+Nn66/V86sovQ+e9Sg3mGhMzaDGajrq0+
         631Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755234157; x=1755838957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KvInbCUt8tTGLRjQNfEmbBCvEDs8pNQ8LImh9T5E8A=;
        b=Tkx3BIEOjk+rAlWStrJW3ckuswHNHwSPFWYFnrSFB3euOAemtgRrDaYjjt6c/trf1U
         zZNWaxZDQnedR6RqZQpW0At3Ee8vqd/KXscns0j7P6rqsdTvBJBLm+L1EL0OjTARqN0Q
         /u6+uj5MuRfK+R5A9kJ111A2JZloJbqRtrnqULaLO68LS1ryWMVhAYYMmfE/3EBRPfgq
         /lL0axub4lEIdSgaPGn9RWRuNGNQSBCsG2VQH0vaYuTpr0mc0GV2H/BHUkWEG5RoB+jd
         cF+PBrPNYbivL4GNHczBzfk71cd2mQozpuv8UucCOVwvVmzwFI5ZRRJdCu5o22Ut1qR2
         IY+A==
X-Forwarded-Encrypted: i=1; AJvYcCUOKueEL709+WBWfqQHx7VP15a7of3FF/sZb+pM2z7iO40NTFvunxJxFNu0gxrldAXGzmCfLBTz4Kl31t6Rwe9laZZIWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYdw5QKTL2Y2+fnBFZjGX86iTbmtb96V5BNvibWPlo1lK0941f
	JfKVOWVHix8wwVtkd+QcOWDFKoe+CtIzq0hMDHOnE18mpLq6JFG9xwij
X-Gm-Gg: ASbGnct+1oRDPazfHWmXpTg5l7IsHw9qcOYFVwOZ/0PwJyLZj0dZFEgvxLaOQ1seS5H
	OMTxoiSUsCEzd+NSDDd59xq+7idPwj0/YgiN+UsD50slZ0Yf2o+xOBKjNHuVhDiCufkN5GSVYB2
	62rrpAIUxYWZl0fZU4dQ+wZwwNo4k2gBdxjBkewccy7MlkIP9SJh3xjxOp9orNKFD8QvMGF3cjt
	ZEj84c+MG8om5sK23WOp8i6s+57x1QDCPYhyOqr/bZHpW7nJYjKaauvJ7jOPRVJif2aQMTXjUeu
	V+DF5iRa3uZR/NckZnpYRYQOgYqwTTmR1HoVNtjNLBKbtWnNB52m6dEdT+BWHWPduwnmIlkwmVp
	PsG8YozWUctIAf1iY66EqB2P5hYX61KkfhS7eL3eUQhCWyVDH0DZH1TK3nhP0JHBIXFCbSbv3Gd
	bq9Q5UScSdkaUX35Y/Dze0TwS/8Xo=
X-Google-Smtp-Source: AGHT+IFH+OSkE7l+lj2EnSVnkTcqL9+YMNtK2tre9BkCjoc5zJE0Ky8LTNiG//ckenUsfyTJOUv3vA==
X-Received: by 2002:a17:903:2f10:b0:23f:f074:415e with SMTP id d9443c01a7336-2446d6f108fmr10850335ad.14.1755234157302;
        Thu, 14 Aug 2025 22:02:37 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53c6e1sm5128645ad.115.2025.08.14.22.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:02:36 -0700 (PDT)
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
Subject: [PATCH 3/8] net/handshake: Expose handshake_sk_destruct_req publically
Date: Fri, 15 Aug 2025 15:02:05 +1000
Message-ID: <20250815050210.1518439-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815050210.1518439-1-alistair.francis@wdc.com>
References: <20250815050210.1518439-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Define a `handshake_sk_destruct_req()` function and expose it publically
so that other subsystems can destruct the handshake req.

This will be used as part of the KeyUpdate to ensure any existing
requests anre cancelled and destructed if required.

This is required to avoid hash conflicts when handshake_req_hash_add()
is called as part of submitting the KeyUpdate request.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/net/handshake.h |  1 +
 net/handshake/request.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/net/handshake.h b/include/net/handshake.h
index 8a64729614e1..fab4760049c6 100644
--- a/include/net/handshake.h
+++ b/include/net/handshake.h
@@ -43,6 +43,7 @@ int tls_server_hello_psk(const struct tls_handshake_args *args, gfp_t flags);
 bool tls_handshake_cancel(struct sock *sk);
 void tls_handshake_close(struct socket *sock);
 
+void handshake_sk_destruct_req(struct sock *sk);
 bool handshake_req_cancel(struct sock *sk);
 
 u8 tls_get_record_type(const struct sock *sk, const struct cmsghdr *msg);
diff --git a/net/handshake/request.c b/net/handshake/request.c
index 274d2c89b6b2..bb727a9ad042 100644
--- a/net/handshake/request.c
+++ b/net/handshake/request.c
@@ -341,3 +341,20 @@ bool handshake_req_cancel(struct sock *sk)
 	return true;
 }
 EXPORT_SYMBOL(handshake_req_cancel);
+
+/**
+ * handshake_sk_destruct_req - destroy an existing request
+ * @sk: socket on which there is an existing request
+ */
+void handshake_sk_destruct_req(struct sock *sk)
+{
+	struct handshake_req *req;
+
+	req = handshake_req_hash_lookup(sk);
+	if (!req)
+		return;
+
+	trace_handshake_destruct(sock_net(sk), req, sk);
+	handshake_req_destroy(req);
+}
+EXPORT_SYMBOL(handshake_sk_destruct_req);
-- 
2.50.1


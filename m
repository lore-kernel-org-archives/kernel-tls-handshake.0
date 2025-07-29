Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7408E77111
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 29 Jul 2025 02:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753757016; cv=none; b=F6QkfXyv0XWWCguuzkeli1OAP1H7+AcuBhWysIzIdMkYxwt4AJubGm/A9xNhDLOT0pnB5B9SY760Qo9vRsV3Y9DKXV/EqYXgmfZ5WW6/4xHBRcmSiaoa/cWCANkRAjCwES9WXdqEwvjvubHmzBtj0dBEXwxZuWTDkqBGb7ojyx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753757016; c=relaxed/simple;
	bh=MRfUaealSRtdSmAeJu0e/IqHYX9b2MdOPG/HupVSKUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V6X4/ugbrwmcaNOj8cPQaL/sW8JCRl7EUqWwehsUMvioKY5MNmnVOfuZNVQKI12mn0E0zroX6qQQWNwfp0iK7tnRyqyCSJeHdnQQZfbL/Pxat0TbMMCfCXV/Og5jD24UslnllqXHCWP/zJzwZEOJKSNBTCi+Q455QpogyLeCOrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijwbu9Nz; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijwbu9Nz"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-24041a39005so8735175ad.2
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 28 Jul 2025 19:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753757015; x=1754361815; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUc8kFhAV7hypvAgEkTcPRzYg5s34VrqAAtY84jsOyQ=;
        b=ijwbu9NzehI/1e5CKjNuh75C3cYfQf68xRWdBzUrj9aTqtf88G40GviGVjd42RkZIw
         dYPByTfsaz9ljRqQM2x7Q3JEo4KRWEnsC/gvViXRlpkwyZeJel3IGetkqXaj5hWDRzX7
         Q9+hLkiyViPc/An2v+yXb7HcYZp23zgwdzPEvXReTvpdchi2QF6a6ICxjvBq3xW5l+pP
         l9hrnK9jJYkQwdC7HV3DSJMxSXHmWSJ/R01wRj+IaMadcA7793gTpeulMBLgCIlRF4qw
         jOoWGv/Tu73mSJNAtjiGr1TKQyp36aTDPMc7fBk4eMvkZN5rZMwz0wIInckHgRVbDzYO
         0G4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753757015; x=1754361815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUc8kFhAV7hypvAgEkTcPRzYg5s34VrqAAtY84jsOyQ=;
        b=bZ/fz9x62e8n5e6DkOcnOCWOKDvpGtB1LWA5Am6rhJQvcl48Bk7VI3xCBoX/fQv9Cj
         USi3ZDzlENw5E28h9mylXCEC3PBapUClJc3d+tGk0SDELJpk08G3yGn+jLTOu1+6CC6i
         aN5cC7LSM9I+fAHuXdtj8ONDf4AQUg2BU9UcZTQTNWOIT15fgI1lT022rlF9fG9ZN0L6
         m0Rnsvv0rQwe9KfE2L3bnEui3KFOTKNP5PnbvCo64b+ggMqgMeB0a+Hz0ix6MYqBc+cT
         +j7WlClOEkPpDzarRrcxZrPKXy2M/BlZ1JZrKZllk0AQKGCFUfd3WeWbRoZ9UDRrHrvy
         OQCg==
X-Forwarded-Encrypted: i=1; AJvYcCW70lo/X7ft9fAGwOvxsNaq1n0olm56kpTHT6T5elkWxkcrJ0qNb0E2o3fvz5yDNSfdKc0QiLOucONK0B/Nd5NqqW+F8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyV83/S4TMKSHsQA1hKhExsTfujxcB4/qpBrI4EDUQDqtntqDER
	EClR4vnlCOxWFLKT54uzP0t/3L1z9ib/M4zfUz1E3Gbd3olU6HIvabtd
X-Gm-Gg: ASbGncuLw7jhcxtweeFmjWoxyIgWj5O7ykQJ5pYXplOZZOPThOjcRZOjwbqNBpC3P1f
	vUTRrzIEswvaRdidcFitroQ75aIZ4OvYSzTKdDbMUiRZcwPXxpY1NfkOqxtEfJlS55vgFYADMKS
	cSyxJ7oXNchlKOXAhPBHFjts1bsoNxjwI53fBQaWTSW/FzrfG4+69rnl/EAdR4L1/+BREYVcMAk
	OXlUMD7osPpqMCb2BbldjN9cNcuGND5n0pfO8VBqO4vwG472wv1c8NnXYto0gW4WFZJNDDTtToq
	wg6Lm15T37yHzwKdWmnu4llBEmyitQtFlafm5jf5WsknXpgexM/G9N4ce7YfcHqENWa+eT3+I+7
	6H1v/OyqN4XqOGJBzbhhBTU2PGA==
X-Google-Smtp-Source: AGHT+IGvnSnLVLEqZTFD+PzBwy1Cdk7P5Du3q9Qu7UOjqUQgKKgrycbGzQke7Edy0NFQh/gyLC2l1w==
X-Received: by 2002:a17:903:3b8b:b0:234:ba37:879e with SMTP id d9443c01a7336-23fb3178fdamr231355165ad.38.1753757014631;
        Mon, 28 Jul 2025 19:43:34 -0700 (PDT)
Received: from fedora ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fecd9ed12sm51327855ad.8.2025.07.28.19.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 19:43:34 -0700 (PDT)
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
Subject: [RFC 2/4] net/tls/tls_sw: use the record size limit specified
Date: Tue, 29 Jul 2025 12:41:50 +1000
Message-ID: <20250729024150.222513-5-wilfred.opensource@gmail.com>
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

Currently, for tls_sw, the kernel uses the default 16K
TLS_MAX_PAYLOAD_SIZE for records. However, if an endpoint has specified
a record size much lower than that, it is currently not respected.

This patch adds support to using the record size limit specified by an
endpoint if it has been set.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 include/net/tls.h |  1 +
 net/tls/tls_sw.c  | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/net/tls.h b/include/net/tls.h
index 857340338b69..6248beb4a6c1 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -241,6 +241,7 @@ struct tls_context {
 
 	struct scatterlist *partially_sent_record;
 	u16 partially_sent_offset;
+	u32 tls_record_size_limit;
 
 	bool splicing_pages;
 	bool pending_open_record_frags;
diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index fc88e34b7f33..4c64f1436832 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1024,6 +1024,7 @@ static int tls_sw_sendmsg_locked(struct sock *sk, struct msghdr *msg,
 	ssize_t copied = 0;
 	struct sk_msg *msg_pl, *msg_en;
 	struct tls_rec *rec;
+	u32 tls_record_size_limit;
 	int required_size;
 	int num_async = 0;
 	bool full_record;
@@ -1045,6 +1046,13 @@ static int tls_sw_sendmsg_locked(struct sock *sk, struct msghdr *msg,
 		}
 	}
 
+	if (tls_ctx->tls_record_size_limit > 0) {
+		tls_record_size_limit = min(tls_ctx->tls_record_size_limit,
+					    TLS_MAX_PAYLOAD_SIZE);
+	} else {
+		tls_record_size_limit = TLS_MAX_PAYLOAD_SIZE;
+	}
+
 	while (msg_data_left(msg)) {
 		if (sk->sk_err) {
 			ret = -sk->sk_err;
@@ -1066,7 +1074,7 @@ static int tls_sw_sendmsg_locked(struct sock *sk, struct msghdr *msg,
 		orig_size = msg_pl->sg.size;
 		full_record = false;
 		try_to_copy = msg_data_left(msg);
-		record_room = TLS_MAX_PAYLOAD_SIZE - msg_pl->sg.size;
+		record_room = tls_record_size_limit - msg_pl->sg.size;
 		if (try_to_copy >= record_room) {
 			try_to_copy = record_room;
 			full_record = true;
-- 
2.50.1


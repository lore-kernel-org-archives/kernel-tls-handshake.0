Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110421F4CBC
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  3 Oct 2025 04:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759465940; cv=none; b=B/z9pxHt0R0awpuLv4eNDH06/j8PUNluZr6SBBBeQRg0myNwV1uhhEpqdV0LKP0SojsAFGPBH9nngoFUMxaOuEmEdpATDkzSuCa+WxrIlOMNJxOrXLLM96sNpHcYXbSUnLKIMZFFaDD1o/7g9eT4Z1D3p7KS2FHjGAA0R7M61UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759465940; c=relaxed/simple;
	bh=Z6w0x3oPOM6C3EiKqL/1mOmpceuMWimWzPhFuNGO/7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rnr4xq1Lu6kTjw4At2PCRTfn8bHBTZ6qlAYJEsWJbrvh51/ZZiS2HhFPkW5gob+uVpB3HD6WnKgQ/8CJ+9p1Y6lztin6LUsLbAVGKd+pevH7/oE8HRnokateZt20WB/G9zkYWHfkaZb/8dDG1Prh5bcteFbf8EjwMcFTuoTfEf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqBnU6YM; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqBnU6YM"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3327f8ed081so2159216a91.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 02 Oct 2025 21:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759465938; x=1760070738; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9morpPQKu8lXMrpuy/uDVQLBubkYtfu9D8D3JxjNjjM=;
        b=hqBnU6YM5t4nm4xMDvUoJ06Are5WI/17r9EPFHL33XTroBCpw0jq52C2Bsl4SsKXiw
         evT5MmwMQStpG27Ar0MhhbVJnJzCu2PywXE3fmvAsEDDl84Bg95RzcOzjx0QVyWm2TjN
         HFZZ71vk+xcb1kKvSXMfefTP6pd0GEUafqP90qGTRb3gSwMIOQy5tajynM0CcDlyzMf+
         3+7yKdb/JB7o0GSGblYoRM8Bn49uVn5MrecmWUZ2ZKA0cuoB46czYzJT4LumRBGP/iVL
         6srhrnWt4FNWC7IF3eJB01Zn+IkKfKUOpmrmgV1CxIVS/fFFplgPDTLmoZCBYRLdYuuJ
         TX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759465938; x=1760070738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9morpPQKu8lXMrpuy/uDVQLBubkYtfu9D8D3JxjNjjM=;
        b=gGFnuV0apR9s9mONA9IhgUqPF1P9xI5PQZcIQ11fhHEjwGn9EtwcSb2wOBCwjdZxK9
         iVfFwVHKO1niIek8hHPkGFq/DSfZlf5aWso1Td3ay0MQG786Myfqj58H4eCtm+0P5pyC
         4UqOEZsA5wGPRq1+6SJu/kl9XWN+GbzfxnE9YjAx1jFozOFng8JsnhMuC0SPWswPAyoo
         G/DltKAj6/WW7J6DnBRtiTXZRTHh/HDmllEQfUG2mTOyj1dWp0ESvGH361j1WFBTVbOX
         HNF53zYfa/kjkfnRqKzTqFpvziH48brF8bmwEr6leAR2og3j68h45Xaz8hoJzwLd9imu
         K20A==
X-Forwarded-Encrypted: i=1; AJvYcCWz+D+7lwGt/Dny0vomoY+pJkTCsB8jk42GDD0IZHfFoPwRS1Iz6a8vMItn18K1ka9gjBTSH0frWcgnc4lqvef5Wwlutg==@lists.linux.dev
X-Gm-Message-State: AOJu0YytZlM5TbR5on8TzO3SaIWHpkrxBIiYVwRMUAjuRDp7/O+McNPi
	/F9dYu1jqh4GIxZP23alhSIcumg9zBM25dHuriTSXM3xeyVOakC4Fhdd
X-Gm-Gg: ASbGnctrVqYadwKL6Tv2K78Y0ikdDhSWcfpFKr8WlaNfgc1JSea4P2Lm9JNDPvvIpoq
	4itD3r7fjZ00Inqtg67ByLecHOQG41b515vDtFKJHhtpnG0DWYuqASGOKN4fxr33ZYYu3zqu+Z1
	Jd5dwgtW/jFkHn1jAetBlSCH82mdSDPzHb/bVR2zFJFA3stb8ZmP0iwKKx65lv55HA3NZiCyXPW
	TXIQQ3Ho6mLCEtA92jRU3MnJDb5izr0uYowd/hFBjRITUuTu76qRWRlDfLBkSTwLMz8i3VmKBfn
	N9Y6IoSZgml0vbJ+mQvAVbnIBy6cRiXH0Ldk6QEjQj1iyESPs0tBTAsSZ+yA/WkcXUa3dfyAUti
	FGKmpjiW/ZnNLmmS8C6RAeXb2mMeb2lzXLgObmtGhjk8AShm3aDoCV2qAQ/Rb1pnee9+POM3M2Z
	su6j7sbWeU+mSd99WLO6KYjF4LSyNBeasTWz8mV6LdIXv4uUwA6sAL
X-Google-Smtp-Source: AGHT+IHs89hKTsl9/f/m+plS3Ev8/2NixvjRvxCPx92Pgo3FWsBpoEKCKAbX01MgtOEvv1xzIjE2Cw==
X-Received: by 2002:a17:90b:4b8b:b0:335:28ee:eebe with SMTP id 98e67ed59e1d1-339c279e977mr2022144a91.30.1759465938258;
        Thu, 02 Oct 2025 21:32:18 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701c457sm6528233a91.23.2025.10.02.21.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 21:32:17 -0700 (PDT)
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
Subject: [PATCH v3 2/8] net/handshake: Define handshake_sk_destruct_req
Date: Fri,  3 Oct 2025 14:31:33 +1000
Message-ID: <20251003043140.1341958-3-alistair.francis@wdc.com>
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

Define a `handshake_sk_destruct_req()` function to allow the destruction
of the handshake req.

This is required to avoid hash conflicts when handshake_req_hash_add()
is called as part of submitting the KeyUpdate request.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v3:
 - New patch

 net/handshake/request.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/net/handshake/request.c b/net/handshake/request.c
index 274d2c89b6b2..0d1c91c80478 100644
--- a/net/handshake/request.c
+++ b/net/handshake/request.c
@@ -98,6 +98,22 @@ static void handshake_sk_destruct(struct sock *sk)
 		sk_destruct(sk);
 }
 
+/**
+ * handshake_sk_destruct_req - destroy an existing request
+ * @sk: socket on which there is an existing request
+ */
+static void handshake_sk_destruct_req(struct sock *sk)
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
+
 /**
  * handshake_req_alloc - Allocate a handshake request
  * @proto: security protocol
-- 
2.51.0


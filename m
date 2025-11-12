Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1613C2D6407
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 12 Nov 2025 04:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762921700; cv=none; b=O5i/rsc7+ugOmBpozzYT9QC26iA0g9FBS8q/RwR5TTwDQCvWzeqiJwZheKTGFKlAD7nYAi8jGLCEOVO0fmeZ5TrE8kT50GwrF7pyW+9yQudDLjC4D7AgwEeHY1UAYTsaDmRP479hiEI4vWyGHc+/L9ykCuPHcZHwG5ChOU5E920=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762921700; c=relaxed/simple;
	bh=jaHChIsFwQccM67eVRPs/t3TxiMgA+k62NpjHrap2Rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BF7zl94VsOzAFM/q82LMxlYdpTYhiRHumBRiL6xzw7CFOdEo+qwpT1LybgstRiAGoHGENr7Ji6+/Oi5/44xGIqwNaGQgzAd5GwwhVmViZWVadG3WdvcqV47HpE2qM1aip63OFVl7cpgphzBLPrWlikx5meguksWpzsettmg0vhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPB/Bh4Y; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPB/Bh4Y"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3437ea05540so412347a91.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 11 Nov 2025 20:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762921698; x=1763526498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfXE4RQsTo13oDtpS18/YqY50MP5ENyfIi78Z5opJm4=;
        b=hPB/Bh4Y7u6TmKt6+u2wbmMN24ims1P6RlfSWzg7btD+3NHkNQzW4lbsvzLkMGo0C+
         UMYbrKDCuj4wpx+Yx92NmYTRxfIREiq2diSdV32FUOHUMR1Z3qPXVAQwXofY3o+IWOjf
         K00/J9glnqoRAovsTjCqQJow0/cQPjO5IZKTf0O3Q/tQHpk2ULNo+gJYWUAdnHhMcOWY
         EsIwAqNXk2o0dYHh0supAzJTyIeEjIQoSIY96j7nMEsTMN6qYQuCEQufxk/rTiNhlAz9
         cq21LIiZk2YhoQ63blTBWJO7h2NhEwdx2kfnXbk16vp8ewkXGcn/lKT04PY2cG+Hirh5
         hTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762921698; x=1763526498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TfXE4RQsTo13oDtpS18/YqY50MP5ENyfIi78Z5opJm4=;
        b=rqJHxg5gttKAtkcq3u7gyDKtxe86jPuSx1OXPAHs+oB6CNMPQqBpN41X1Oh1Zmj0LW
         QzxYWn3puwyhqCLrOH3R9MdrOseWICY0EUhdZvauHgh6hmQFkxVn5a3jzm6qpR/z70rp
         Kg6LpZbV04f8pJ99SxkkfE3iCULTRceK0wC1cqSrND/jz6HJ0MLkMiF2BoK/UYusPHHA
         y/y98VOWbqO5y2Pm3iHdVFT7vkdvDKYbeooonzQAnM/BSGQFc9E8DnjnNu2FoYvxrqeo
         yyPP0IYuBC0SDo1xZBafRb5yh1f8tSxOXbC28pUCWudoIk7a+GetIfzEldScrRLXrX3q
         oSgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZq8KpNfrOgBkqZC8CgKsbPXYgxFHuBVZ+OIh/GJHm03nuii/atrfpTk7opiE6iDvyVNn3IAzqOGcbiKGv4xeL96gs+g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4LHKH0JaUIwOauX7ORp53McY+SN6dgq7gXKdG+ZjmkPTaHteT
	ZZemG7la9XA074d5WWzyZRpJot+gRf1b3Kax99jwHl0IrHXvrpYUxum7
X-Gm-Gg: ASbGncuTPcAsPf4tU1h0S2zIhAkuvGXeHw5hZS8Bs8GxMSN+RLxA5kCRRLHWRUNFpxx
	Q7Sqaxh3+Dy3tUH7AjjW5e+YXXKHVRAYLuzCtqpqUGUjrMIaXR879G7p4NZeTx7veXoEIUNRDQ3
	PMy2rzieua1mINvlGBACuivaSwhN/3AKNV89FTnyV8212sbCkq8RtsdFBo3fv+iWt2p0xys5Ryd
	nDmJnf9dB0Fo96zDX3RuTECsVmnbAYGe4sF2pDvPZBbtc2vnsyXhBPCDA76cedeYrNEYrg3uVAE
	PPNT9Ivd8hNOeqrnDR2F0i5eJfozSYRhp6XTtuUZ1wuGJlp2koJxeCxrsf8Fs1QMy/yC35pLbtN
	RJoZYT8xqUvHuoPZP/gm1tkwoM1RUVgqqExjgqQrScYQotWGTUG8cMh6eW2yA/WlL5qqSjGly2T
	V159fsB6OfkfJrDUe9pDmXTXQMtUs9fcpuZP9hJSAZuCDFIthwuypOhG/8ORqaLnUogSkOJ+ExK
	g0Utd26yA==
X-Google-Smtp-Source: AGHT+IGasMEo2f3YSuRreEs/8zog7GQY45X0or6PmRJCkVtaVHjxXqWGnHYHC3SejrjGvw9vVcyiWQ==
X-Received: by 2002:a17:90a:fc50:b0:343:a631:28a8 with SMTP id 98e67ed59e1d1-343dded5123mr2073086a91.37.1762921698484;
        Tue, 11 Nov 2025 20:28:18 -0800 (PST)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e06fbc0dsm854681a91.2.2025.11.11.20.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 20:28:18 -0800 (PST)
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
Subject: [PATCH v5 2/6] net/handshake: Define handshake_sk_destruct_req
Date: Wed, 12 Nov 2025 14:27:16 +1000
Message-ID: <20251112042720.3695972-3-alistair.francis@wdc.com>
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

Define a `handshake_sk_destruct_req()` function to allow the destruction
of the handshake req.

This is required to avoid hash conflicts when handshake_req_hash_add()
is called as part of submitting the KeyUpdate request.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
v5:
 - No change
v4:
 - No change
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
2.51.1


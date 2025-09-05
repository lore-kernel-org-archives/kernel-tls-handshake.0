Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219572641FC
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  5 Sep 2025 02:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757040460; cv=none; b=NoAqkuQWXVnzQp9+PA6TME5TgBbmlucndeqJQeu+nRWc6EUZVEJh0Ffdf4m8s+ivt0wqph7Mq18ezap0OdIlb0EaBKaX5ySEiLXhgAoulLCIdze+maSD7pCbRC5LROV3smjITUlOVU9U+SIqvF4cZ9/jaO1T5be2mrcmty2MpmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757040460; c=relaxed/simple;
	bh=w/oYAbmeU1N4zxqgBVYWveh1msm4OYF6Q5nBahuQfVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPD1tbWbRSnaVDyRQG0/piVY78E6XQ1ooQ1gWaIJ69RdKITgHfkRE/uwuKM+g5c01m3B9vArWTH0xEJv9sjAtav2yyyG0bEd34wR+hcF1z3bDr876L8xCHpBH9qSypXVq6uIQyFri3+bJh7jDC/FTl6ToGPjxtVJgxNeDNl0AxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tu66cucl; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tu66cucl"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77250e45d36so1487686b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 04 Sep 2025 19:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757040458; x=1757645258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1EWHajpMqKqyxA8GWEtrMVXQwoVeft66qRlv9TDlNE=;
        b=Tu66cuclRgbqtps8wG+dPlm2l7LUmG5gZJAiWnjPMvOcqoMVxvqDVSgcM4AiYRDvs9
         CpkcobDxmd0F12ZHM2w16b97wKEv7/Yybm6CEiX6LNkDW4i0ZyUSHbkg7xFxiWq5haUl
         AGGp50XjWdZGRAd954lOtKcLVOMKMRQembjqotiz2IMZQi4b4/W0xjOpFtC8KenK9Jv0
         AipVlLKzbtUmoiECrwzjoehQ1xV9vCARQ/Vt3YN1B+Cb9u6v4gEd38sAekTx3lExHKU4
         ChDSetTrml5KASmOXkO090p4RN2KA88ApBaL0ZQiWuMUpAAawaTqlLfnZtOM0wPTgcpa
         ScjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757040458; x=1757645258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1EWHajpMqKqyxA8GWEtrMVXQwoVeft66qRlv9TDlNE=;
        b=OqDSh8hgCWYSKzijhz8Zm018kZen2DwLXD7MbVSmRswRXtCYSfd4LLTzKDWcSvlTQw
         0SlVWRPVD4SRXJJ9FFTn1UXa5NSt/o03KH9mM0XxAQE5V1I1GuwZLhrP1XaxXrMuT0iL
         ZwC3NYM+iUfMAnTuNYNYvmA0MZK81SYtVdVTy1qRA4hmpXJ8F/w2pVwjMNznmrdNXJjt
         bpJZYUfUSnrrhj9WqF9wXCLXaZvuM+2lWja3ZrKNWa7caMVmxqwOxW4rfE9fjUPWmvEd
         Syrb6ZqstymSZrm1HQYXQNCUG+rHjVTmJrD5zOxdXKuPDhsgWPCzK/Hig9VYjZZQBSM7
         HI6g==
X-Forwarded-Encrypted: i=1; AJvYcCXJMz+44KdoIj4MGQyiUzRrs88APIdck9DYrcgdINkbgtUpQLxknIaB3myyLu6QZCyIefzXHadvZ9QVAWlSSp4C5zO4bA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzodgW49x0Cf/FHI44vczzFY543hduFg+2RgqZJeI3DXV3BlcOd
	UQwltjv7sCz67rF4W8z8YNokcwAuOXHI4QJ3hJX7gMzrsfHYHvxk/mwv
X-Gm-Gg: ASbGncu1nzVviF9GRgV8QRK6QVnuugXNCEirH7Hk9N6HuN08NPw+oINv79v/i1HwSS3
	w9oDIigvUi1I+NyxFmpM4r9Oqef785T3BZnUuGiKsvZpUqJDqXF4Y9+7U2n5eflz7JCW8wJGtP2
	kqAEJJxe6UZk4Yz9H1i7VkM8/cNY+w1x5Q8ish89IHwEie4Tu8pusHeLaquJzCp6k6mGQTxtssh
	Tsk0qfXwPlVvl16QLIQWh7KtRilOSCRM6rFQiGMQYUjt0Ymrk/JB5uCyhgg4gjjaxwU7mX2YrI+
	e6EdLQBGht73zCGvyJ5MSp16htMRMBA6fQUVr8LOCkdeVoFkkBMPTei1teE8hAByDAazVZIGULd
	oYqwhZGApXv49JOCk+SdYWnkPvlrmXJPoRBt2Aj2fMPILNtfHa6K/WCU0cBJ7sXW3so69qqxztl
	ChfjXuPzniTB5h/S/GYqWfTAwMmoo=
X-Google-Smtp-Source: AGHT+IEX64nfMru9GugujC6DsIEIeho+MjIw85M5xAJP6i7Xx1NoXALA29BzByuoUSArpy/50s7n8w==
X-Received: by 2002:a05:6a00:1a94:b0:772:4fc6:84b3 with SMTP id d2e1a72fcca58-7724fc689a8mr23059661b3a.31.1757040458343;
        Thu, 04 Sep 2025 19:47:38 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772590e0519sm12991858b3a.84.2025.09.04.19.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:47:37 -0700 (PDT)
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
Subject: [PATCH v2 3/7] net/handshake: Expose handshake_sk_destruct_req publically
Date: Fri,  5 Sep 2025 12:46:55 +1000
Message-ID: <20250905024659.811386-4-alistair.francis@wdc.com>
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

Define a `handshake_sk_destruct_req()` function and expose it publically
so that other subsystems can destruct the handshake req.

This will be used as part of the KeyUpdate to ensure any existing
requests anre cancelled and destructed if required.

This is required to avoid hash conflicts when handshake_req_hash_add()
is called as part of submitting the KeyUpdate request.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v2:
 - Fix build failures

 include/net/handshake.h |  1 +
 net/handshake/request.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/net/handshake.h b/include/net/handshake.h
index 10f301f3c660..89dc169eae89 100644
--- a/include/net/handshake.h
+++ b/include/net/handshake.h
@@ -44,6 +44,7 @@ bool tls_handshake_cancel(struct sock *sk);
 void tls_handshake_close(struct socket *sock);
 
 bool handshake_req_cancel(struct sock *sk);
+void handshake_sk_destruct_req(struct sock *sk);
 
 u8 tls_get_record_type(const struct sock *sk, const struct cmsghdr *msg);
 void tls_alert_recv(const struct sock *sk, const struct msghdr *msg,
diff --git a/net/handshake/request.c b/net/handshake/request.c
index 02269f212c70..bb61c9a1a03d 100644
--- a/net/handshake/request.c
+++ b/net/handshake/request.c
@@ -342,3 +342,20 @@ bool handshake_req_cancel(struct sock *sk)
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


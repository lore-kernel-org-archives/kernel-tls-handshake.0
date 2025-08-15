Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F1A2BDC3B
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 15 Aug 2025 05:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755234165; cv=none; b=flB+fhYmXcjmuDX5+jCRXhW09Wa70N/VtBQ7zenfLrqnnLmdTOthJGBxeT9zROk6PrOuDuzaQ27uK26d0GDOtwIc/yqQaQunerfHRVx7a0n3GBwVR7WZhW2Dm7Lm7QKF0fYEUzgFwqL6ibP6LURkQk/YYiU0gUsE2+Y3fYtpK7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755234165; c=relaxed/simple;
	bh=ZYoIAvI8JvjAy7tsXH+fX8odbelCU/L+yqvG24kV89M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S/YQu0x47aDrDEyQYP6ninT9DWOlkTWlF8NLdXoNxW6S/jqZPMYoCwhul07clRXTOPWJhdFgQyp1+W6ijxIrxselOZZJO/F+J1LeXwQyaTYqrZhlCa8s6BandBMAHDwzmWpdms8FulrtauID1jJxAAOTC61UlP2E7ajWusjb/PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edGYh86a; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edGYh86a"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-244582738b5so15896365ad.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 14 Aug 2025 22:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755234163; x=1755838963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZqqyoHZZ7YsUEio5GgDxrA+je+1nNyUxeRlVhWKQvs=;
        b=edGYh86a2+t6f2a98qABZb7YVePQis0IEKw+iJ1G7WaDVMmeTSkVzIRLuk+TOoWw06
         8sk3LAZR61P8Baod6K6V9dq2MyU54//BvvR5ZuZs51oNuqP7qIhBHQMwkfJIzTSmxiDY
         VxqhVYDo54/+vSasiEeAtwvDBdD4JyBtF6trGPb6TNtjymxDq6OQxFFApcYTredO3wcT
         zg+2wkrTDtwsQyydM7Sb/JDKcQFK5w8AxjU7hOudVciuG67OxSyFBUvHKeNpvS7W2tgP
         tQ018PopBCdRd7N/hyxzS5XL8R6VCNao4uAJYsg1gylawmBnwTpWFeNdXADq1mWk0Bp9
         jcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755234163; x=1755838963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZqqyoHZZ7YsUEio5GgDxrA+je+1nNyUxeRlVhWKQvs=;
        b=QDxkP6e0jMECKpVPm5ZiwwvKb0RPp2wED5oKlEzsy2N4CLghEDKiXPXrg1t08VkJ0s
         wCLxlDwQCX4RN5pw6Kfu583mSHJGkVz/Y4GT2bO3EgASaIURR93QwRd6L6JcKFiFqyKn
         oDRTi/xjgZ9xDp/ePoqOwHtgWsbgfzER06Y4HbzWqp+hvc8NSd4m5jae+FtsXr7O4JYu
         EH0OH7xh7wuWxvC9bG1zDyAp8QDhg0dzuFbsBWFepb8l2XOBiAh5I7G6Puz/0cNJCA34
         j2AfBago4Lq4OnSG9morEAn69tPbWh2NlWvLs8s9HR91IER9pGYpFxyljmsWNgtPPVUO
         q/2w==
X-Forwarded-Encrypted: i=1; AJvYcCX3gMu57BHO9b4X9at95DiZI+QNYExWOZoSxLzBXoPeOo/nZe8EQCq6s8DM2dNDyy0QxVjmokLI8kM6GQ5bNC5I2HrF7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzL+uDyDxnzj+vNVGJl3TMPNM8OmhdWnlgWIPDNK2iy/JcVxXvE
	OqhG61D7iiDTZnEKjWOxpkxMtJ2xS8YKPWcJdzH1W3R+9OeRD5GHoPF1
X-Gm-Gg: ASbGncsU2z+QX4LFevlvR9LtNevEZ1kAVmtY4dJIqhw60TSgHSAZyI/AyJXg/wyJAID
	E1+Kw5KJpPBJW8e9MFWpGxAas5h+MrDuRfa015AARMPmoxY7GjW2oQ5t7UOPqY46HWjJB0L8wg1
	/6Ztpy4n72baNOiQkcE8b9gVxNdfz5TE7aFgenKZToS/P6bMsZbJPMkQuiC8MslaejKixw5wpKW
	pr0bGbNv0V18tNJwIuNS6Yox5irhCc8MsM2zPrd+2v0VFCU0gxMmBrFAfLUj1c+QhjBTUJn5hlN
	dfu1yW5gE0T/mmIoKl41UuLU8UcFPXzFmdo8LUHnMpyoSQtCQA/PPOr7peKjbA2lYCnyfXU65D4
	EsWWMc47Ja0lHetNLRPIrmu77xMdm3UnusL0hsZrpimLxmJh+PtrqH2frbUQR0Qfiuqu7qAfFzd
	ZHWe6QEx50TmG2ectL6GxxuSkMqFc=
X-Google-Smtp-Source: AGHT+IG4eNpFbbY6CONpalTmgGqMktH1B9il2WlkRC8J04INCl901SG/4g+axvWD8CC3sg/+QQBV8g==
X-Received: by 2002:a17:903:1c7:b0:242:9bbc:3647 with SMTP id d9443c01a7336-2446d9e45ebmr10879945ad.57.1755234163041;
        Thu, 14 Aug 2025 22:02:43 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53c6e1sm5128645ad.115.2025.08.14.22.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:02:42 -0700 (PDT)
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
Subject: [PATCH 4/8] tls: Allow callers to clear errors
Date: Fri, 15 Aug 2025 15:02:06 +1000
Message-ID: <20250815050210.1518439-5-alistair.francis@wdc.com>
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

As part of supporting KeyUpdate we are going to pass errors up to the
callers of TLS to indaicate a KeyUpdate. Those layers will need to handle
the KeyUpdate and as part of that clear the error.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/net/tls.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/net/tls.h b/include/net/tls.h
index 857340338b69..7de960225da2 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -493,6 +493,13 @@ static inline bool tls_offload_tx_resync_pending(struct sock *sk)
 
 struct sk_buff *tls_encrypt_skb(struct sk_buff *skb);
 
+static inline void tls_clear_err(struct sock *sk)
+{
+	WRITE_ONCE(sk->sk_err, 0);
+	/* Paired with smp_rmb() in tcp_poll() */
+	smp_wmb();
+}
+
 #ifdef CONFIG_TLS_DEVICE
 void tls_device_sk_destruct(struct sock *sk);
 void tls_offload_tx_resync_request(struct sock *sk, u32 got_seq, u32 exp_seq);
-- 
2.50.1


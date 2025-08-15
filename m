Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA99274B59
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 15 Aug 2025 05:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755234153; cv=none; b=b/i3zyVJCa4Qfc5aL6Yr1G9ApGoeWnxKS+5Z3dR5MnbxfOAPIa2vTVMiWNEnuhRwSFVpqS0LTIxjldbfkicFeurYohYodJX/BfjJetlJux+UNzhR8bRhRBA1NMr6UfV80QM0eog6bsQRKOnGywe+dqH08PJjmAfPeG14z2gUwRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755234153; c=relaxed/simple;
	bh=ta+733zRJHmJJTLpgqTURHJaDH15kMNwSBSlgc7Iz8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlyQmh8dNARryMgSnAB3Uz5NDkd71mLMhNFsaVmovH2sSgx71m3m1pYAHU0zVN37vg3a8b3VvZAakC0b1pivg1HgKO3Smeomjr2f4p77XevsapxTyFRT0jA8xj7x6SNBue1G7mWtCInpWIzIfigw0DdeQT5f1yVUdrfAfMjxWCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5wqp/ds; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5wqp/ds"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b47174beccfso1287215a12.2
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 14 Aug 2025 22:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755234151; x=1755838951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bYaR0txeJQ15MO4CAHzNGe+lgnMf7tAMLNjm+q8B+g=;
        b=d5wqp/dseURu9RHChlligvYY7MeofS4w9ZtN1ZEgTxykGgJd+BFNgAwaQwUp9ftfmk
         +798yxCCdA8HYhbIsndaWVYhVjcsZWYMjgBp6B+BLPy/rQHDazRKfVA4Y9GA463fe4/N
         CHrUMnzPsh3bm1g4EFvf2JOrstJPYoP+CAn6hTEBa2M3bX2UTtSJjwN2m2/k1XZeaAoe
         QKfUYDcqAlGZJoqQm0PboT+tp1XwbmCQI0e6HwRq5xgTDKNhRgqhkVRYnix+SZpqXe7C
         IoJoTyD7p6w8SSeEbYq6xXzYf2xb41BQaF7ETJr4V8boLyrhqGAJ/pVXSDSN5p/ZgHrD
         W18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755234151; x=1755838951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bYaR0txeJQ15MO4CAHzNGe+lgnMf7tAMLNjm+q8B+g=;
        b=rKPP0fzIclOpv8fFKFFY4BkP3kagmZMB4vhF+misqdpMPEYpVaQvv3rmZuqFKL0dnH
         pAJkr6gA1L7gp3arJh/x11rQ3mw95JOxmyHPuWhqbb/5ScO9S5pT+5fyn2qPX526LLP2
         0O2sQnSuFv50qwIOO/r1d8ITbDwGvkjLuqILmaqk+Rl9MsVL4BsdDrLAAWgtyiqiYH4F
         uz8uSsmh1hbJati59dUt4Ih/j3mj9x4JLHixDTMKq0TpNhhOpAwY3akDcOZhzHFgw7at
         1HceiUOuJb4Q5kedUeHyegG7M75cBfL5RrXnr/oKVvKWTmxsJGgsvLs3AsbGINGBCkOj
         SB4w==
X-Forwarded-Encrypted: i=1; AJvYcCWmc2pHnWNEZIYa6x3LpeGPWg+9aO477pkSKtUjEnX+EPUqzJ1jCdvGX1YDVcuBD8MqHbxCXuUP7GZKEWa4K/dlxwxQNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNGXGfQmiU7WyrbACmhomvnFyl4+mCKdOjZY7WK02Lg9dbR7+3
	dDZ5h/OGjnnpczLJ9Ynnke0V5e3PqaXVANttjlkQ6TnpwxIa+lYjuH4m
X-Gm-Gg: ASbGncvI+XsUly902Mi91Ut3fBTaiZA5zH9gyheKbfdRm2MLD7gxf4rIY1QclJYPSq2
	t6kYepcLSKTl24nPkmQ3uOxQhKqxl1N23BUsKGoXaoRqLok3gkSiWrmZy0owkPaQQE6xaHvx80D
	Rm9RZsyk42IHi/YN7pjnCmLHblYlGre6SPG/c2fhpbSyieYE0jN3KGltFImPtgYKTd9z+wxT/L3
	0sb2k44I6MzZIdGeGcjMI+h+S7BEdpaG28Dl6UbS2/elWC4ukl6vWNdn8cvB2PCTDwGNFCbFNoH
	psqtPI3GPjQbn14ObfzEHqIQlT1GRiCNFs4RyPkhhcGDOFg6gtpHNU6AATx9c8Vo9EmoB1m+sVP
	vVVgDPnBL7V8lZ8z3YKsWfB2r+SldzCPszarwLO2BTpHhCWTSHjkZ+kh6rIszzqJKXCvmf1h26b
	88195DBIr+MXdT4S1/WDxJUI4/Q95/3JYboFV+Vg==
X-Google-Smtp-Source: AGHT+IHbFa9wi3nz5/xQeXOUNqL7qBn+//4+UspNBNAPh8R+al2x4L9A89Rhs1lRGLSwUr5VjjqL+A==
X-Received: by 2002:a17:902:f647:b0:240:a504:cb84 with SMTP id d9443c01a7336-2446d865e0dmr13064545ad.30.1755234151526;
        Thu, 14 Aug 2025 22:02:31 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53c6e1sm5128645ad.115.2025.08.14.22.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:02:31 -0700 (PDT)
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
Subject: [PATCH 2/8] net/handshake: Make handshake_req_cancel public
Date: Fri, 15 Aug 2025 15:02:04 +1000
Message-ID: <20250815050210.1518439-3-alistair.francis@wdc.com>
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

As part of supporting KeyUpdate we are going to want to call
handshake_req_cancel() to cancel an existing handshake in order to
instead start a KeyUpdate request.

This is required to avoid hash conflicts when handshake_req_hash_add()
is called as part of submitting the KeyUpdate request.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/net/handshake.h        | 2 ++
 net/handshake/handshake-test.c | 1 +
 net/handshake/handshake.h      | 1 -
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/net/handshake.h b/include/net/handshake.h
index 449bed8c2557..8a64729614e1 100644
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
diff --git a/net/handshake/handshake-test.c b/net/handshake/handshake-test.c
index 55442b2f518a..c338b9977a71 100644
--- a/net/handshake/handshake-test.c
+++ b/net/handshake/handshake-test.c
@@ -13,6 +13,7 @@
 #include <net/sock.h>
 #include <net/genetlink.h>
 #include <net/netns/generic.h>
+#include <net/handshake.h>
 
 #include <uapi/linux/handshake.h>
 #include "handshake.h"
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
-- 
2.50.1


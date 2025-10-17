Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC3430E0E1
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Oct 2025 04:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760675026; cv=none; b=PCtUo4F88FJrDolNvK9z9RrRngQ63UD6lJwP/lMIaspL3QgZZLWAnuao5dg6kKTPOE9e647TosijvnIIPKWxzqnhKHWZ+MP8f8voA67l1sx+KIitjjYTUwKn9mCZCv/gQV0l7/rC4YsDgrmnpK2RRz7k0vig0+0NP329k2D2mjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760675026; c=relaxed/simple;
	bh=37YeEv3sX+mmDjcIQ5fmoI0jB8MoKSf0MBI8d/gZIrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsWuZ/LJ7JJQrpncDWer6oQbS97AF5hC13Vt403QXXlUE/oEgy0+UYPxdniQpVIxmJ3mcdaZ4qKldNEOE34JdvEwV0P0JEUaQ+59LHFc/n53o6LKXdaJNgyBL4QS8bTo9hQVyCz/S+Oy5DfHzlizm02nVdpjDnNwMeMptRoeeAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M52q+1Vp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M52q+1Vp"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-269639879c3so14089055ad.2
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Oct 2025 21:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760675024; x=1761279824; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhR6OqlULE14euOr7SOeJPbIcbHzF9rdhJ80nFJJwb0=;
        b=M52q+1VpR+ZsQ91/jKmWdbLJCzOxevVxDq6lb+CzzUgtpzhYJlx/I1yQQtArxpRxTX
         CXYOUf7ywBgW9IOlsIb5aa/jNgahx0lP/C21EscqOPv63GhDDMFMVnUMOK01hgSaCg4F
         GXeUgx73w079PtE/BxGRFqMSwWDZVCJqQdFfbW5ialeS5IbJ/nU+v3S9PeGXhPnSQKEG
         NUR3gXfnQs7X1vqU4Ym1wEZlQz/+CQ0uDdRODBX20JQwIbhLYhZfDTawIvyxaKfAlaKf
         EfYtfRvBsZK25PecXD+UBgZmURrPWsFDpLBy25M/NI/5JfCJ2y7uSizG2O+XYrlVow/X
         wWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760675024; x=1761279824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhR6OqlULE14euOr7SOeJPbIcbHzF9rdhJ80nFJJwb0=;
        b=BJXOo1V05EDRrDYNQ5nEc6xFjU7P2bc9G0jweSo2nlhIV1n+gkxL5SD10sXsIJZZcF
         Co6hLWal0B9OUmqjJZdDRHDF36n13I/8C4kmlLCflB4J0YPFWNY5TOpeaqjix4tOqqbD
         LOnmLbbdt73OOJPiO1xQSQN4nAyeIWcKD5UBxab/jVHQbmx05USLCfHUZg0euNkAx19Y
         gVF7U9jO7XLVIvBhv1STRHx/v7hW2rDBH3Hsi3S57U/KfH9CCh0UiMEvYBoBqeEw5xK4
         epHIqO27QqpjY4NAEK3wn5oqGkeEB+/fzEruhTgryqfuu0aYnCLoxsBiS3okSFn1h/q7
         5AxA==
X-Forwarded-Encrypted: i=1; AJvYcCXWiA0yIeGcKJWFOaqZhchSglidxBBOz2ykbym0LlKH9rbUT9BGW+VZx6RCVYVHIAa+N9k/Aqw0fygIx9HudfXwiW7zrw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzODMBo4tpDsvfWOrXQkY48yJMk/LYBMkDZYSpBL85Xs0AnaYrP
	YzE9cfhM4fBukoWVwuGlY99oCTNlrJ5HxUqnYEu0okI3fOg9sFrv5s3N
X-Gm-Gg: ASbGncv6X1PuayhZOm5j69DqBhSSx7UX2CL/klS7CMWHVGKcsB74140EUcBPTLoI6gJ
	rL95VYHIts2DHPp7e84nFLPcVvmsAR4mtZMIwMZwUQtaDR4uofUTGVuz2+j706pOQBrQBuxbSu/
	br5XDTlKZSeOhbxi9ExqU2sPcVGb5Ob9GvSCowz4RVw4QNM3XTgDylu8VnD188ofsXcUJ6QetZI
	h9mRm+cxanbQaIIdm0h3NE43SlniUVicNN6Fv0b4ui62hXga6zSavPa1TsvkxPd5eImL3UXn6lZ
	KyL2ewCeP6xWaezyHdkk2HSbu1UJW2EU0KED6A+qbaourfpBX6KU6DHvHjn3wXpnst6mRUol+QE
	bGshf0dpZwGB/3SFpgDi8HMFBSuyUL1bz5kVVH77KO7D5HZ9Z7fOP0VVh4fAragn3NHOgE3Q0AS
	tX75q7PZegSjIkQzO4vq+6Ipow5AY1jB2VMJlf1Z7WZSQIBZzicw7yPrrroHgAiL1wcsqbh5Z74
	mGXKyODTSQvZBu4a4AB
X-Google-Smtp-Source: AGHT+IFs1j5KeQPUYHknhxmr73Cz8lIn7tiQ+fRQndA5W23hoDMgcJ9Yk8+rVDxwb74P5c6XfgnCZQ==
X-Received: by 2002:a17:903:b90:b0:269:9a7a:9a43 with SMTP id d9443c01a7336-290c9c89fdfmr20658745ad.10.1760675024212;
        Thu, 16 Oct 2025 21:23:44 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33be54cad3esm245557a91.12.2025.10.16.21.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 21:23:43 -0700 (PDT)
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
Subject: [PATCH v4 2/7] net/handshake: Define handshake_sk_destruct_req
Date: Fri, 17 Oct 2025 14:23:07 +1000
Message-ID: <20251017042312.1271322-3-alistair.francis@wdc.com>
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

Define a `handshake_sk_destruct_req()` function to allow the destruction
of the handshake req.

This is required to avoid hash conflicts when handshake_req_hash_add()
is called as part of submitting the KeyUpdate request.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
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
2.51.0


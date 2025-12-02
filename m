Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E913221F1F
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  2 Dec 2025 01:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764639319; cv=none; b=NEFVO4yaDRH4JOTHLmYCcOTK+GBfNAa1m84ZPQpTbKVo2qRXkUoSxk4Sqnq+fHxANAbGOACV5oohgeIUP2NoHZut7m0rqwYUnVSYXqNCVTZZzNwHrbG3pd33sDs6Ck13HvpYFC8gLk3swT6Adjqm+3uZyvzmvPkHCMPsPJQEnVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764639319; c=relaxed/simple;
	bh=vxpkGccNVOzZnxnGt+XxGTh2tk/X17iKXQnOD/cPnrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JyUE9Ulb33hDqIRqLmqzIcGoXl/LD/SeDeWqQH3Bw2VDJX+u4ok9khDYCUMQnVrjPEap7QU1Qg5y3ZDVSOVX/Wz+nlkqoectW5yFW+VIr4Q31rLmx0GzsW2mrC2v8uLqWFk6lNNziui497oMDPLvzERCeFWEfrqsh4/nT9PsulQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rfw15Zew; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rfw15Zew"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-bcfd82f55ebso2289772a12.1
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 01 Dec 2025 17:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764639317; x=1765244117; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czIyAwG2XcUYBMND32our9jihcE3M72DjVQfcH7wVb4=;
        b=Rfw15ZewNR7bgm82euGgkDAb4WAnl2HSVMRhKliAPhA7B3Nd1Mai0uYHouPtJ4yeOJ
         gx4d0wdoY5i3UZTC7J+PTAVSkyWZByV3LQhadir8b7WoRQWIAyfHmxB0+OtFEIIlhwwk
         vr387MMwYuKFvCHvN1uEweY689zzHIFttHsLfUym6SRWv37fMyUK9WJwgSEzm1CrI2eg
         UPCsDicc1eGeY/zbmXGurtqsKImB+P/5y4vIISU2jgYUELT0CPA9kENkTdMtxV1bArSA
         XcMrVZJBQE2m0q6ag9r7PTrIhp4IdBwprPljGM9hc14XfwhBLwuY6R1up66JDmgyapA8
         GtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764639317; x=1765244117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=czIyAwG2XcUYBMND32our9jihcE3M72DjVQfcH7wVb4=;
        b=soHgP25rghTgYMIw+qQ3+Ukrmf7Gnh0G+JoJ2DyHB/EqBxue+AdrK5hdjeQTRBQIhJ
         Z3uk1062RPSqHT3fc/z06+HlKSLrSkfmWzu7WjL5DsUZh3qpS8NgVRHOoGAdhAVGI2+r
         blEKWVLCno4VdrilIW/QxooP6JqLtG0joqyvIOS/I8nvSy9LJ0CG6ETZxMVa88qV5bB9
         WePiZbjBGbPghk+N9aWOIF06lbcXcFJWT+JyG0kpDK02wWyWU2G6437euYjmmJKCynxM
         2o8OHDHBVDHSdLQXCq3ABlX5RxKyAQMBaj4GV/7J6mRFL0XyGKYErtf65y78kZerFXkq
         rwGg==
X-Forwarded-Encrypted: i=1; AJvYcCX8Dh4HoZqoO2R+VMaNAEgzfX7vaMb+B18KgRkLaREPWZLPSP0RJqU7fAWjsURvfB30cEKJX5TF/VZN18bdI+Rkk6B4gA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxicwhOiqP6JlKCNSbSDJ+JihN+DukwY5Zw+jQB7X7GTCFQw4wl
	zY+ood3vpxsC/bwMjPTihAT9N0+o8bhtlSQqVLWrNu5yw9TJw22e426U
X-Gm-Gg: ASbGncvKl1wYlf9XrOZu0SbDMKGMEWXkqYkwdvtirczWcXv9vSmV35IUjnFAbIHAYIB
	IxE9J8bOimPS3ld4as78SHJZY88/4J11pvQIChRW80iLlUfGronz3hSkH8qbGZHHCoir9AYSc90
	3BnfIrKXLVMvG/P7vib4yFIe2Jp5BFbVEb4i5ppNuboQOoLjNIEwse8UKBcWQ3QxwenF2stTerC
	kbXvHfXGaKTSY0yvDSnDwVG2TkePVjdnEYtVG4II3elqQWO3mN3KpYhKa67rhShndc+TysY7q2H
	CWQqq33vIXPZL9+hJF/6rI7I6byi8paVmjj817J5gMuYYvJua2mnQaJ+uZzYojn05+lYiIChlFm
	kP/VaHCiNY5jGHJFdgIMjZveDqG4eAPSseKJJzIJoE71Vf0koOer1pHXNodJPnXzBHAW6K71Ln6
	yWzydGk5Ix15daVs9JbAthB7MKFaYkhtEUwDjzECSgleRcGd17bLsxERMx+6Y8Obfhp+khyE7BH
	MvQ2xVeakXHq09XuIA=
X-Google-Smtp-Source: AGHT+IEg+/N743oXcIq0ciRB44SxAmj3ck5rf7L8gATspDeLcAoYxScp44MI8ISyD4Zq0PaY2ptvmA==
X-Received: by 2002:a17:903:1b03:b0:295:5da6:5ff7 with SMTP id d9443c01a7336-29d5a5379f5mr8003195ad.15.1764639317177;
        Mon, 01 Dec 2025 17:35:17 -0800 (PST)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb54563sm132378575ad.89.2025.12.01.17.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 17:35:16 -0800 (PST)
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
Subject: [PATCH v6 2/5] net/handshake: Define handshake_req_keyupdate
Date: Tue,  2 Dec 2025 11:34:26 +1000
Message-ID: <20251202013429.1199659-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251202013429.1199659-1-alistair.francis@wdc.com>
References: <20251202013429.1199659-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Add a new handshake_req_keyupdate() function which is similar to the
existing handshake_req_submit().

The new handshake_req_keyupdate() does not add the request to the hash
table (unlike handshake_req_submit()) but instead uses the existing
request from the initial handshake.

During the initial handshake handshake_req_submit() will add the request
to the hash table. The request will not be removed from the hash table
unless the socket is closed (reference count hits zero).

After the initial handshake handshake_req_keyupdate() can be used to re-use
the existing request in the hash table to trigger a KeyUpdate with
userspace.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v6:
 - New patch

 net/handshake/handshake.h |  2 +
 net/handshake/request.c   | 95 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/net/handshake/handshake.h b/net/handshake/handshake.h
index a48163765a7a..04feacd1e21d 100644
--- a/net/handshake/handshake.h
+++ b/net/handshake/handshake.h
@@ -84,6 +84,8 @@ void handshake_req_hash_destroy(void);
 void *handshake_req_private(struct handshake_req *req);
 struct handshake_req *handshake_req_hash_lookup(struct sock *sk);
 struct handshake_req *handshake_req_next(struct handshake_net *hn, int class);
+int handshake_req_keyupdate(struct socket *sock, struct handshake_req *req,
+			 gfp_t flags);
 int handshake_req_submit(struct socket *sock, struct handshake_req *req,
 			 gfp_t flags);
 void handshake_complete(struct handshake_req *req, unsigned int status,
diff --git a/net/handshake/request.c b/net/handshake/request.c
index 274d2c89b6b2..916caab88fe0 100644
--- a/net/handshake/request.c
+++ b/net/handshake/request.c
@@ -196,6 +196,101 @@ struct handshake_req *handshake_req_next(struct handshake_net *hn, int class)
 }
 EXPORT_SYMBOL_IF_KUNIT(handshake_req_next);
 
+/**
+ * handshake_req_keyupdate - Submit a KeyUpdate request
+ * @sock: open socket on which to perform the handshake
+ * @req: handshake arguments, this must already be allocated and exist
+ * in the hash table, which happens as part of handshake_req_submit()
+ * @flags: memory allocation flags
+ *
+ * Return values:
+ *   %0: Request queued
+ *   %-EINVAL: Invalid argument
+ *   %-EBUSY: A handshake is already under way for this socket
+ *   %-ESRCH: No handshake agent is available
+ *   %-EAGAIN: Too many pending handshake requests
+ *   %-ENOMEM: Failed to allocate memory
+ *   %-EMSGSIZE: Failed to construct notification message
+ *   %-EOPNOTSUPP: Handshake module not initialized
+ *
+ * A zero return value from handshake_req_submit() means that
+ * exactly one subsequent completion callback is guaranteed.
+ *
+ * A negative return value from handshake_req_submit() means that
+ * no completion callback will be done and that @req has been
+ * destroyed.
+ */
+int handshake_req_keyupdate(struct socket *sock, struct handshake_req *req,
+			    gfp_t flags)
+{
+	struct handshake_net *hn;
+	struct net *net;
+	struct handshake_req *req_lookup;
+	int ret;
+
+	if (!sock || !req || !sock->file) {
+		kfree(req);
+		return -EINVAL;
+	}
+
+	req->hr_sk = sock->sk;
+	if (!req->hr_sk) {
+		kfree(req);
+		return -EINVAL;
+	}
+	req->hr_odestruct = req->hr_sk->sk_destruct;
+	req->hr_sk->sk_destruct = handshake_sk_destruct;
+
+	ret = -EOPNOTSUPP;
+	net = sock_net(req->hr_sk);
+	hn = handshake_pernet(net);
+	if (!hn)
+		goto out_err;
+
+	ret = -EAGAIN;
+	if (READ_ONCE(hn->hn_pending) >= hn->hn_pending_max)
+		goto out_err;
+
+	spin_lock(&hn->hn_lock);
+	ret = -EOPNOTSUPP;
+	if (test_bit(HANDSHAKE_F_NET_DRAINING, &hn->hn_flags))
+		goto out_unlock;
+	ret = -EBUSY;
+
+	req_lookup = handshake_req_hash_lookup(sock->sk);
+	if (!req_lookup)
+		goto out_unlock;
+
+	if (req_lookup != req)
+		goto out_unlock;
+	if (!__add_pending_locked(hn, req))
+		goto out_unlock;
+	spin_unlock(&hn->hn_lock);
+
+	test_and_clear_bit(HANDSHAKE_F_REQ_COMPLETED, &req->hr_flags);
+
+	ret = handshake_genl_notify(net, req->hr_proto, flags);
+	if (ret) {
+		trace_handshake_notify_err(net, req, req->hr_sk, ret);
+		if (remove_pending(hn, req))
+			goto out_err;
+	}
+
+	/* Prevent socket release while a handshake request is pending */
+	sock_hold(req->hr_sk);
+
+	trace_handshake_submit(net, req, req->hr_sk);
+	return 0;
+
+out_unlock:
+	spin_unlock(&hn->hn_lock);
+out_err:
+	trace_handshake_submit_err(net, req, req->hr_sk, ret);
+	handshake_req_destroy(req);
+	return ret;
+}
+EXPORT_SYMBOL(handshake_req_keyupdate);
+
 /**
  * handshake_req_submit - Submit a handshake request
  * @sock: open socket on which to perform the handshake
-- 
2.51.1


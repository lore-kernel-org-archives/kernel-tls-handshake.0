Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C138364943
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  4 Mar 2026 05:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772602600; cv=none; b=LsPRyFf9eUOpzir3dgTYSUT1sv+0K3QhL9c3C4yrZBLVBhBuKnrf3L5e3i/x2CecYP3jNZ5edrwOnbgLAuZQtRFbeIntB9gG2WPLv7KjgFWzekwXfEHwvG+llu6a05kXYyralnWu5at+V+nIQE736aX6TAAT6Rpk8H7rjXyokMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772602600; c=relaxed/simple;
	bh=Fh2w9GegkIjBGfvJYSj0dj5p+FWtLjoeXIvuAgbxRcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=REp+Fh1/zrvNSS4QKwHCidQUPwRbXcOP1HIKOqflp+3Fa3X7wxST2gSYsZSyO2yLYq0ar11A1GzXvUG9yNQ0TM7vHNyuGUySsFlmyMLUmWaPIBdpEl7iK1tKm/H5PcHHM19BHLH5/HCbx34AtNmMHmo+JeN4eqrKYN3h9dBHABI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZUUcGPZ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZUUcGPZ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35984cd0335so1421506a91.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 03 Mar 2026 21:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772602599; x=1773207399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXXONp/ELYPAk8Ra1lPAUCJk3t+/mDBCyOGivtl5sfY=;
        b=hZUUcGPZGMg1THtLombtaFOZEvdPK2Qpj5/VoonNuAY+WoRb32tM3hw6quIWHizsBg
         9RUrB+67s2wf0OwfzkaFR6NN+bVI59YJ134R9DZHdLsbep+Uv2A6yw0wZ6XLAd5xHlZG
         jCb786fueuzu+nBRlEF+WU0jJ/qSAGyP9+iiNOE1rsv4gLZAb5qTfpthBnFHkvRbm9O5
         Vuc/UFv2v5AK/tOpNzXfMbfpvayr2DLivZdqJyrNcz+3XjZfyw4rzIWJUTI8du9SLUH2
         jZ7Mi1faiDyLXv5pgIKySd3rS9/mPaNCQjRQkYVEjKy4yI3sP8sRO5DX2mHSiOdgVVqE
         9LqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772602599; x=1773207399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zXXONp/ELYPAk8Ra1lPAUCJk3t+/mDBCyOGivtl5sfY=;
        b=n50ZFHf23mxTcJ6wINtf6RP0+Sk6kHx5OiCZGPlo3kHIZXB24w0jscCjKx/wUHz5Qd
         ZHn5ds9zqHNpfaT3CIUFDR1JvQDJRUWT9wDXFLG2hrifr1f7lAQNpye4Vm4T51xa8bep
         hiWZ0FSvH2gMvMa7aGwRBEtFQlji4SS6iAW5+R4nBKkEzQ+rWE/8IBNCSyB7JzPXz7Px
         /3uWzUqpem+RLtZlzrq0qMyciaUZGKfsUY1XNEWt9yUbRQy7sFJ3oIkHJYwqQwmLxPI+
         TeaHA/s6SUZHz/H2BK1xge4yX4IhqwzmRlV7mYno1qjgZfwnbulDu2AcsnEnWSSKWfP+
         ZULg==
X-Forwarded-Encrypted: i=1; AJvYcCVJUvoyNIr83gTsRiYCHKLDMXvEWc2hCz+tbRCjW9BQYvcjgrNckyn1l9DmltcgT4l6qq/08RQjRMlC03bsl+Oni3QScg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy0g+/wiYbseK8foHxxyHTfOjKnxZCjLCR95d4bQ41B5h1WPa7
	FqrAgoxjHVrUz38nQstzwtiSf1rJm+G++XrBKlmW2QVzFb/tbEq4iY4V
X-Gm-Gg: ATEYQzwZNtCx9LNjadWE6Hmglr9yF6KNjy+g3gVRyObdOVqqqfDRqNoxBG+tlJOyOEW
	LBhjpZWrCiBBSCmQcft/e6Oj3wWVnTjJz5GpxO8kPTQEsdZdOao3wTcSCJvi6Gi+7gvM5kwaYz2
	+dMz3DwumRn1N8iidZxIP5uMk3u1lwv+b917x7FdfBNQ80ii91n36pzZY4NJokejqfKR/tfT89H
	BbqA78LdvGsDdVwQNqW69Es3c9yJEdQXyNDM8qt2fPb8K+AKAsf1Xs0+MQYF2o/w7w1Nc3NUjoz
	AiZEhVt3Y6ol7y/rMEc983V16sY65o7JRiYA/gUlKfcH7/R4NTWQIrfoNqbMeI936OI0lrYdm5k
	KxyG0W3z/Nq7UyqnsKaJtGHQkMD2erDKPufM31+bRFMoDXhHeLVh7+NRq096GVrUeMiKpfLoW2a
	u8+6/7K9/8qYrdjIJpFx4EIJHouTBu8pfp3w44cOGLVA==
X-Received: by 2002:a17:90a:ec87:b0:359:8a78:5696 with SMTP id 98e67ed59e1d1-359a6ce6a46mr960709a91.1.1772602599018;
        Tue, 03 Mar 2026 21:36:39 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c090bfdsm4020057a91.8.2026.03.03.21.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 21:36:38 -0800 (PST)
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
Subject: [PATCH v7 2/5] net/handshake: Define handshake_req_keyupdate
Date: Wed,  4 Mar 2026 15:34:57 +1000
Message-ID: <20260304053500.590630-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304053500.590630-1-alistair.francis@wdc.com>
References: <20260304053500.590630-1-alistair.francis@wdc.com>
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
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
v7:
 - No change
v6:
 - New patch

 net/handshake/handshake.h |  2 +
 net/handshake/request.c   | 97 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+)

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
index 2829adbeb149..5653c8f69dce 100644
--- a/net/handshake/request.c
+++ b/net/handshake/request.c
@@ -196,6 +196,103 @@ struct handshake_req *handshake_req_next(struct handshake_net *hn, int class)
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
+ *   %-EFAULT: An initial handshake hasn't happened yet
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
+
+	ret = -EFAULT;
+	req_lookup = handshake_req_hash_lookup(sock->sk);
+	if (!req_lookup)
+		goto out_unlock;
+
+	ret = -EBUSY;
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
2.53.0


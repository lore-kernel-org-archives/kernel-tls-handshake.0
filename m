Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7005143ABC
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  3 Dec 2025 04:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764735402; cv=none; b=I4Y2MI3jcL4I/8ignGvBEjbzQ/dy6uSWtYiwrrS0wcC87lFkDzudyJA1yMm0uwp6wfaDuC2o7dBGk1BEwLIATV9m+FSTdNxd1jSN3X1qLIFKGEWB4qVq/dP5MZa8HmaO8p6zXpVDbnlKh8KEPHtNR+9ukno0E8qewrvtv5nT4qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764735402; c=relaxed/simple;
	bh=vlILOzbZNY3COdT0kEPHK07pGdodIaGsMkBzzQC1QLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PamkkIit+ARhAvUlkMfimpGmcKhdJ5cnEsgVZtFQ7WBpcXdJKlkzBZxw5BVS0k2svllmf6Jfu+hiP1EkxKBVP8mPZHfHr7QEB7HUCJGmIuCTQU08tSx7fl9E4W8RWh76iC4rUwR1ghLejgFO3XFX44ArHziDc1LwGfQ7Oyog5T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee7692fb8e8595-9c678;
	Wed, 03 Dec 2025 12:13:29 +0800 (CST)
X-RM-TRANSID:2ee7692fb8e8595-9c678
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee4692fb8e7e6e-98573;
	Wed, 03 Dec 2025 12:13:29 +0800 (CST)
X-RM-TRANSID:2ee4692fb8e7e6e-98573
From: caoping <caoping@cmss.chinamobile.com>
To: chuck.lever@oracle.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org,
	caoping <caoping@cmss.chinamobile.com>
Subject: [PATCH] net/handshake: restore destructor on submit failure
Date: Tue,  2 Dec 2025 20:12:49 -0800
Message-ID: <20251203041250.967606-1-caoping@cmss.chinamobile.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

handshake_req_submit() replaces sk->sk_destruct but never restores it when
submission fails before the request is hashed. handshake_sk_destruct() then
returns early and the original destructor never runs, leaking the socket.
Restore sk_destruct on the error path.

Fixes: 3b3009ea8abb ("net/handshake: Create a NETLINK service for handling handshake requests")

Signed-off-by: caoping <caoping@cmss.chinamobile.com>
---
 net/handshake/request.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/handshake/request.c b/net/handshake/request.c
index 274d2c89b6b2..89435ed755cd 100644
--- a/net/handshake/request.c
+++ b/net/handshake/request.c
@@ -276,6 +276,8 @@ int handshake_req_submit(struct socket *sock, struct handshake_req *req,
 out_unlock:
 	spin_unlock(&hn->hn_lock);
 out_err:
+	/* Restore original destructor so socket teardown still runs on failure */
+	req->hr_sk->sk_destruct = req->hr_odestruct;
 	trace_handshake_submit_err(net, req, req->hr_sk, ret);
 	handshake_req_destroy(req);
 	return ret;

base-commit: 4a26e7032d7d57c998598c08a034872d6f0d3945
-- 
2.47.3




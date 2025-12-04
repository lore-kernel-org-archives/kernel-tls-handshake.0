Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F1A155C82
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  4 Dec 2025 08:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764838129; cv=none; b=YhQ956PTYt25mD8ylqfByXFqCXPDrqNvjLO3LUOjGE5blfrAof2XNkRbN2sYHjzEHrWU7mmnbZypv/lR6I9+I5DSJV+TjiTLZWhkDJFhwo14dCcAyiHxnz+xAnvEN5R0LPHKmiZy+h5cQpZGb8qAHadceP4sLBv9zh0TTUjqu20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764838129; c=relaxed/simple;
	bh=vlILOzbZNY3COdT0kEPHK07pGdodIaGsMkBzzQC1QLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IFg75mjsALn/m0u+3Sx7yBY5S0T4ynuGI6jirR/Izu/fZ+1UUH9OtcFzaRtWfswG6UEK0J/EAwP9YmyvvndLzCwvMp/RIWKRNZdaktSeWUvJJb0q120i2oFlMXbh+Z0ofcXqiiRajTOHZCGTziwJQipfSxV6uQGzAapJ1Amweww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee769314ae371a-aa800;
	Thu, 04 Dec 2025 16:48:37 +0800 (CST)
X-RM-TRANSID:2ee769314ae371a-aa800
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea69314ae33bb-d0125;
	Thu, 04 Dec 2025 16:48:37 +0800 (CST)
X-RM-TRANSID:2eea69314ae33bb-d0125
From: caoping <caoping@cmss.chinamobile.com>
To: chuck.lever@oracle.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	caoping <caoping@cmss.chinamobile.com>
Subject: [PATCH v2] net/handshake: restore destructor on submit failure
Date: Thu,  4 Dec 2025 00:47:56 -0800
Message-ID: <20251204084757.1536523-1-caoping@cmss.chinamobile.com>
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




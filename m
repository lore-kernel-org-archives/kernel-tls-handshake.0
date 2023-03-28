Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3918AD30
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 18:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DB3C4339B;
	Tue, 28 Mar 2023 18:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680027042;
	bh=isISI4cZpt2+B4WGf6MgVOVru6Jlx1NR/qUE4RXwoqA=;
	h=From:To:Cc:Subject:Date:From;
	b=dS8rRBZzxyNomS1C0dWQlUpMfR916KSOrKBnva+PQABB64rTMFLawon+Lyr14uP8Q
	 zdjW4hTHLNPCufMuzsVdSGt+xrex94i+jFJhwC1jUFsrxGECnTj0z7U2KdGh2FYdXB
	 008wvFyOAkr4qoR0DI2KRtayESX+thzmOSR4O1XoW0NFWKHntFWw5dVAkvh11sCdG+
	 RpqMXOFstuS246PXHbzagJOtfTNN5f97kRKs7fSB8tp7W62VF/cBuBpsesQLUkQz2z
	 3fC0PrnZ3RqGy9JIb5lpLhEezEo+WQvk+PCrfvetXbb2cT4dwhARFrsCzx7MLqE0MW
	 u6YSNUNwrDL6Q==
From: Jeff Layton <jlayton@kernel.org>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [PATCH] handshake: set hr_sk field earlier in handshake_req_submit
Date: Tue, 28 Mar 2023 14:10:40 -0400
Message-Id: <20230328181040.292486-1-jlayton@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Otherwise, the request is always hashed with the socket set to a NULL
pointer.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 net/handshake/request.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

I think this is the problem I was hitting earlier. Chuck, feel free to
fold this into the original patch that adds this code.

diff --git a/net/handshake/request.c b/net/handshake/request.c
index 54ba304b5bef..44a097210e59 100644
--- a/net/handshake/request.c
+++ b/net/handshake/request.c
@@ -207,6 +207,7 @@ int handshake_req_submit(struct socket *sock, struct handshake_req *req,
 	if (READ_ONCE(hn->hn_pending) >= hn->hn_pending_max)
 		goto out_err;
 
+	req->hr_sk = sk;
 	req->hr_odestruct = sk->sk_destruct;
 	sk->sk_destruct = handshake_sk_destruct;
 	spin_lock(&hn->hn_lock);
@@ -230,7 +231,6 @@ int handshake_req_submit(struct socket *sock, struct handshake_req *req,
 
 	/* Prevent socket release while a handshake request is pending */
 	sock_hold(sk);
-	req->hr_sk = sk;
 
 	trace_handshake_submit(net, req, sk);
 	return 0;
-- 
2.39.2


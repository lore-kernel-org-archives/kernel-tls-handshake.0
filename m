Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3BD10942;
	Fri, 19 May 2023 17:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4C1C433EF;
	Fri, 19 May 2023 17:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684516382;
	bh=1Mf4ACWWUmkyCLfti2njxwSzPcnra3C5lMzF4YljwzQ=;
	h=Subject:From:To:Cc:Date:From;
	b=I6WdRhE7iBpJs7QKc4OP+shYlCx7dw4II5wyu8GXFai2JgyZo26AWYQawOt756U76
	 /krnVWd02YERouiAEWW9wzxczkbGKz9Aeq+N7rtoaJrwVAEhgw/mKZqhzSYWl+KIiS
	 t1ulGWOBeS8NVASksTMIw7sdLPybRp63RgX1N40eOAwEWO/gZ0ePTduTMqIMaTds4u
	 S7nw3RS7S28TF3owKsRv5RCwIePz/OLZiScw8B637rGGUeL6CMyNVnF6fnpnSJz3R/
	 13hQX9c8nLIPJ7Hjzw8NAXppNA+iPxW8ZBMzKhYKjKIp8uxTmDGPrOUDd/20wK9AzE
	 F/jB7owYYxLbg==
Subject: [PATCH v2] net/handshake: Squelch allocation warning during Kunit
 test
From: Chuck Lever <cel@kernel.org>
To: netdev@vger.kernel.org, kernel-tls-handshake@lists.linux.dev
Cc: Linux Kernel Functional Testing <lkft@linaro.org>,
 Chuck Lever <chuck.lever@oracle.com>, lkft@linaro.org
Date: Fri, 19 May 2023 13:12:50 -0400
Message-ID: 
 <168451636052.47152.9600443326570457947.stgit@oracle-102.nfsv4bat.org>
User-Agent: StGit/1.5
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Chuck Lever <chuck.lever@oracle.com>

The "handshake_req_alloc excessive privsize" kunit test is intended
to check what happens when the maximum privsize is exceeded. The
WARN_ON_ONCE_GFP at mm/page_alloc.c:4744 can be disabled safely for
this test.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Fixes: 88232ec1ec5e ("net/handshake: Add Kunit tests for the handshake consumer API")
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 net/handshake/handshake-test.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/handshake/handshake-test.c b/net/handshake/handshake-test.c
index e6adc5dec11a..6193e46ee6d9 100644
--- a/net/handshake/handshake-test.c
+++ b/net/handshake/handshake-test.c
@@ -102,7 +102,7 @@ struct handshake_req_alloc_test_param handshake_req_alloc_params[] = {
 	{
 		.desc			= "handshake_req_alloc excessive privsize",
 		.proto			= &handshake_req_alloc_proto_6,
-		.gfp			= GFP_KERNEL,
+		.gfp			= GFP_KERNEL | __GFP_NOWARN,
 		.expect_success		= false,
 	},
 	{



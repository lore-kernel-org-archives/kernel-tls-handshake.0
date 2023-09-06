Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7E7613D
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Sep 2023 14:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF5EC433C8;
	Wed,  6 Sep 2023 14:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694009164;
	bh=p+QRozeqJgBuABjY7UvUgjhHeyTahxj3KKQZ7GNfwtE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=nloJuIUazROtHLlD1CQiAtPpWXgC2Ig+q87yXTfxHLn9qGH6y3l9y7ZUqCt3Q0sAn
	 PhQ6IxSUrMXDdt7SfSiqD1ikGL1RB+uKHVGzP3X4K3PS/99AaigAOpmw4JiBWYDZFp
	 3Zy9H1Mcyg4l2b+uLI4EB13KOyUo8ixgcH9K3OTNzQvyRhuu3DowjAR+bCZ0IEUmrz
	 wq/DhWga5eDaOcslMqScl4DKPPOzpuEI3q9wQZ3ywa7FXYbJL3XDc/wqQr08Xns6nN
	 SGob3lVsoaceavGDslIlrQSn7RRgRkRWxPjk0e9eoLF7sPOiPA7k6PivhVQSt3opJY
	 K6K3ZDHmrgTsg==
Subject: [PATCH v1 2/6] tlshd: Ensure tlshd_peeraddr is initialized to all
 zeroes
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Cc: Chuck Lever <chuck.lever@oracle.com>
Date: Wed, 06 Sep 2023 10:05:53 -0400
Message-ID: 
 <169400914311.10079.9657296944287295342.stgit@oracle-102.nfsv4bat.org>
In-Reply-To: 
 <169400879020.10079.2238873524435794665.stgit@oracle-102.nfsv4bat.org>
References: 
 <169400879020.10079.2238873524435794665.stgit@oracle-102.nfsv4bat.org>
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

Avoid error and log messages with garbage where IP addresses ought
to be. In user space, static variables are not initialized.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/netlink.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tlshd/netlink.c b/src/tlshd/netlink.c
index 22d929dd00a4..436b523d6993 100644
--- a/src/tlshd/netlink.c
+++ b/src/tlshd/netlink.c
@@ -228,7 +228,7 @@ static void tlshd_parse_certificate(struct tlshd_handshake_parms *parms,
 }
 
 static char tlshd_peername[NI_MAXHOST] = "unknown";
-static struct sockaddr_storage tlshd_peeraddr;
+static struct sockaddr_storage tlshd_peeraddr = { 0 };
 
 static int tlshd_genl_valid_handler(struct nl_msg *msg, void *arg)
 {



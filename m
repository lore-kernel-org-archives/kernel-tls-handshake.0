Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BED210796
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Sep 2023 14:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40F9C433C7;
	Wed,  6 Sep 2023 14:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694009217;
	bh=Pn56INKTMojgDRxiuBjIKs9IwZU7ACDyOezhTs7qpe8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=tw3qqpPGPvD5tBqOqNCzD+AgHO/6yjC069pKl1ibdg02kYJIrMulm6JE6wGy2CHNa
	 TAUKuLxS+Sf2NWt4AclY9ROcQh191tVm3C6hjlNlIe7CqYN8Y1VBguI54h4OsNejZV
	 tbU9G1A+5ZF+AC7jzItHTvotkGlg9nRSBm3UrtJYGj73IpaUobMwyue6PH56znFH78
	 rvqYD1pVk1rsBEKy/TbvTQ7TyN7MYHf+BQdHPlLNh+lwWk6aBJSoYLOr5T4KsUhUCQ
	 FMTZCdDYUEFt3K1ftOmO4AAYNQ1tYHQCgaRen7sxChbteljIgCJUW7dVWM4s9jq6GU
	 Jj/EOVuhzm78g==
Subject: [PATCH v1 4/6] tlshd: Revert b586f7d97795
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Cc: Chuck Lever <chuck.lever@oracle.com>
Date: Wed, 06 Sep 2023 10:06:46 -0400
Message-ID: 
 <169400919643.10079.6489118486985282749.stgit@oracle-102.nfsv4bat.org>
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

Ben Hutchings observed that when tlshd handles the client side of a
handshake, it may get either an IP address or domain name from the
kernel, depending on how the target server was specified in the
mount attempt. The result of a reverse DNS lookup is used for
verifying the server's certificate, but that result is not
necessarily a secure piece of information.

The reason this reverse query was added was to enable mounting
servers by IP address. This is needed, in particular, for pNFS and
fs_locations results that contain only IP addresses. Reverting this
commit temporarily breaks that.

However, adding a SubjectAltName that contains an IP address to the
server's certificate should make client certificate validation happy
again for that use case.

Addresses Issue #22.

Fixes: b586f7d97795 ("tlshd: Reverse DNS lookup of peername")
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/netlink.c |   15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/src/tlshd/netlink.c b/src/tlshd/netlink.c
index cb7da213d94e..eb6c20fcad98 100644
--- a/src/tlshd/netlink.c
+++ b/src/tlshd/netlink.c
@@ -268,21 +268,6 @@ static int tlshd_genl_valid_handler(struct nl_msg *msg, void *arg)
 	tlshd_parse_peer_identity(parms, tb[HANDSHAKE_A_ACCEPT_PEER_IDENTITY]);
 	tlshd_parse_certificate(parms, tb[HANDSHAKE_A_ACCEPT_CERTIFICATE]);
 
-	/* SNI needs a domain name. If the kernel provided an IP
-	 * address, just use the reverse lookup results below. */
-	if (peername) {
-		static const struct addrinfo hints = {
-			.ai_family	= AF_UNSPEC,
-			.ai_flags	= AI_NUMERICHOST,
-		};
-		struct addrinfo *res;
-
-		err = getaddrinfo(peername, NULL, &hints, &res);
-		if (!err) {
-			freeaddrinfo(res);
-			peername = NULL;
-		}
-	}
 	if (peername)
 		strcpy(tlshd_peername, peername);
 	else {



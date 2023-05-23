Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC78A4C92;
	Tue, 23 May 2023 02:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66729C4339C;
	Tue, 23 May 2023 02:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684809619;
	bh=PTl2C/2ba5X7WpTpI2Y37u1/3yRsiLKpRhOUclzMl48=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=n1WNUb0MUuHy0GFvNXdr/2GB5Fniu2nGhcEAG/VPraDYst/CteyyyyUdM6GeH57uX
	 9DERgwVe/O71c2ybfCJ5sB6GBj7rxmWKswrCXBw0Auvy/Z5CI7Y8kXykpRtvLfvLqh
	 pukwZzSQzC9EkU/2mzXimaskmUkL5nVwxdXE6+IOnCe5e79GDBzRtlZPyt+YJLUGlm
	 1qAZmlaTtN8/74uJDVELFjes5Y6Rsl++lhHNZKh2ewyjHsrG/SzAEbEBMq9fOjCMKA
	 5aq43OynbLLekCRWXTnJap6IZgdVWSjOIMly1XRsRNL6Q4XTQvW//57/r2Z3amAHPW
	 NW671WsJJOl5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3927DE22B07;
	Tue, 23 May 2023 02:40:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net/handshake: Fix sock->file allocation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <168480961922.27018.4100039188919022306.git-patchwork-notify@kernel.org>
Date: Tue, 23 May 2023 02:40:19 +0000
References: <168451609436.45209.15407022385441542980.stgit@oracle-102.nfsv4bat.org>
In-Reply-To: <168451609436.45209.15407022385441542980.stgit@oracle-102.nfsv4bat.org>
To: Chuck Lever <cel@kernel.org>
Cc: dan.carpenter@linaro.org, chuck.lever@oracle.com, netdev@vger.kernel.org,
 kernel-tls-handshake@lists.linux.dev

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 19 May 2023 13:08:24 -0400 you wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
> 
> 	sock->file = sock_alloc_file(sock, O_NONBLOCK, NULL);
> 	^^^^                         ^^^^
> 
> sock_alloc_file() calls release_sock() on error but the left hand
> side of the assignment dereferences "sock".  This isn't the bug and
> I didn't report this earlier because there is an assert that it
> doesn't fail.
> 
> [...]

Here is the summary with links:
  - net/handshake: Fix sock->file allocation
    https://git.kernel.org/netdev/net/c/18c40a1cc1d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123BE7F
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 22 Apr 2023 03:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B40A0C433EF;
	Sat, 22 Apr 2023 03:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682134218;
	bh=qXQkVg3s1Pgn6+y0rxUr3E2JnkSisA+o9MAANIf7Cqo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TtBo2xsuARA7nxwLfkkWPU0HkPVRaaRGqwjbzqZYQY+mYLPWu8ROPqQ5JCkshbGs9
	 7vvHxWSsz5D0zps1ul8BbNAG7o4ilqCpH5t6AVLWUBB5cf2w6+YkruHOqI26omRvO/
	 wfFuxvTOzcQVUPnxOJToykk5kQUZ/UHVI/++gMwOFhwH+khco2Fi14cpmO8tj9oGo2
	 +Ea0jEs92NLfh1dopBMgUvXIbsmgvADO8XgBBMnczghrRQmbLDsiOje7bDalXbWXB1
	 8oZxw+9UZfFf+I5+CLCKRh06+wWFZUcSVHQUQSV3u1gafTJsJV/8K1bgt6d/Wk3srN
	 2DLz70VSiR4Uw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 98573E270DA;
	Sat, 22 Apr 2023 03:30:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net/handshake: Fix section mismatch in handshake_exit
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <168213421862.22496.15254337472403818932.git-patchwork-notify@kernel.org>
Date: Sat, 22 Apr 2023 03:30:18 +0000
References: <20230420173723.3773434-1-geert@linux-m68k.org>
In-Reply-To: <20230420173723.3773434-1-geert@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: chuck.lever@oracle.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, kernel-tls-handshake@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 20 Apr 2023 19:37:23 +0200 you wrote:
> If CONFIG_NET_NS=n (e.g. m68k/defconfig):
> 
>     WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_exit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
>     ERROR: modpost: Section mismatches detected.
> 
> Fix this by dropping the __net_initdata tag from handshake_genl_net_ops.
> 
> [...]

Here is the summary with links:
  - net/handshake: Fix section mismatch in handshake_exit
    https://git.kernel.org/netdev/net-next/c/6aa445e39693

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



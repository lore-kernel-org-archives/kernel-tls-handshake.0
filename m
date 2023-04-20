Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B5E17C9
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 20 Apr 2023 02:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7499C433EF;
	Thu, 20 Apr 2023 02:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681956021;
	bh=9WbromZ7mg8mCUPJ9kLnfc6Cz2r1KJRy7y+/bTCJmgM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WhCTdfzmuHxkI6zRqEuKVplHVVWHCKOceiseOlqCJclgfP2pOBq8VJuzmPY2j+dmf
	 2dB8RNPdpvnef73iXy1AAiTOe0C9dzCrKBALvnisX6vhTG5QuSWZ03Qb7jiEtoKft4
	 gXKF+XXRw040GvE/8Ap5oxi7WMEhw6eJiNiWB3GwM4wdvauWvYBJSBnQYEQkzxb68c
	 iyJOp6Ti9ul1CeRN9PW6NDyvzbq/rMyrjSumpvaggF2yAmt2ezqx2RvnfBPLh0d2Ki
	 qU6RW2nExFZWtq/yWlFc/+HkCYjeAKs46uAUIaXcBv/NOo2O8k95BaFbQb3t79chlm
	 Onp2YrCNQUccQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C35C1C561EE;
	Thu, 20 Apr 2023 02:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v10 0/4] Another crack at a handshake upcall mechanism
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <168195602179.17998.18228073558514714292.git-patchwork-notify@kernel.org>
Date: Thu, 20 Apr 2023 02:00:21 +0000
References: <168174169259.9520.1911007910797225963.stgit@91.116.238.104.host.secureserver.net>
In-Reply-To: <168174169259.9520.1911007910797225963.stgit@91.116.238.104.host.secureserver.net>
To: Chuck Lever <cel@kernel.org>
Cc: kuba@kernel.org, pabeni@redhat.com, edumazet@google.com,
 netdev@vger.kernel.org, kernel-tls-handshake@lists.linux.dev

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 17 Apr 2023 10:32:12 -0400 you wrote:
> Hi-
> 
> Here is v10 of a series to add generic support for transport layer
> security handshake on behalf of kernel socket consumers (user space
> consumers use a security library directly, of course). A summary of
> the purpose of these patches is archived here:
> 
> [...]

Here is the summary with links:
  - [v10,1/4] .gitignore: Do not ignore .kunitconfig files
    https://git.kernel.org/netdev/net-next/c/2bc42f482bed
  - [v10,2/4] net/handshake: Create a NETLINK service for handling handshake requests
    https://git.kernel.org/netdev/net-next/c/3b3009ea8abb
  - [v10,3/4] net/handshake: Add a kernel API for requesting a TLSv1.3 handshake
    https://git.kernel.org/netdev/net-next/c/2fd5532044a8
  - [v10,4/4] net/handshake: Add Kunit tests for the handshake consumer API
    https://git.kernel.org/netdev/net-next/c/88232ec1ec5e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



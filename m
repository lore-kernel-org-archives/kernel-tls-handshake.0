Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4B17EA
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 15 Apr 2023 02:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F421C433D2;
	Sat, 15 Apr 2023 02:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681524421;
	bh=DkfNw8WLrcKXv/xxb67fcoCm7DZ9a3zFfkaBPpIpkMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZN63nGV129Zw4NABtfmZcBxG+NBe3QTd8gMzbeBVNyuiaelGT1r4TRvzRgTZAypqZ
	 RxNFEBTGYE/O4lLEUIrKPIcbQydnt5Chw4zgHKDLn+IARvZVWWKBLSeJWUmtee5Zhv
	 ObRQs9Z++bNEQKr1bKqZn2HCb22XIFaTamJAweG6pgUeef++jWCN7aoPy7X0Gitbx1
	 WX/km0xCbyrlz9vZ28yGEc7tuCut72NvTOKBG3LNZZJ69YqCtGQFm8X4peNM5xTiji
	 a0K20u6Iz7JvKf0gJm9M24fHKrSh1RQh/AlrOiIFfC153nLuroXTL6RfD9BvZYXBGk
	 nqRktYVof+i6w==
Date: Fri, 14 Apr 2023 22:06:59 -0400
From: Chuck Lever <cel@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: pabeni@redhat.com, edumazet@google.com, netdev@vger.kernel.org,
	kernel-tls-handshake@lists.linux.dev
Subject: Re: [PATCH v9 3/3] net/handshake: Add Kunit tests for the handshake
 consumer API
Message-ID: <ZDoGw3nVG+jNWrwV@manet.1015granger.net>
References: <168141287044.157208.15120359741792569671.stgit@manet.1015granger.net>
 <168141324822.157208.14911977368369619191.stgit@manet.1015granger.net>
 <20230414183113.318ee353@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414183113.318ee353@kernel.org>

On Fri, Apr 14, 2023 at 06:31:13PM -0700, Jakub Kicinski wrote:
> On Thu, 13 Apr 2023 15:14:08 -0400 Chuck Lever wrote:
> >  net/Kconfig                    |   15 +
> >  net/handshake/.kunitconfig     |   11 +
> >  net/handshake/Makefile         |    2 
> >  net/handshake/handshake-test.c |  523 ++++++++++++++++++++++++++++++++++++++++
> >  net/handshake/netlink.c        |   22 ++
> >  net/handshake/request.c        |    5 
> >  6 files changed, 578 insertions(+)
> >  create mode 100644 net/handshake/.kunitconfig
> >  create mode 100644 net/handshake/handshake-test.c
> 
> We're getting:
> 
> net/handshake/.kunitconfig: warning: ignored by one of the .gitignore files
> 
> during allmodconfig build, any idea where that's coming from?

As far as I know, all of the .kunitconfig files in the kernel tree
are marked "ignored". I'm not sure why, nor if it's a significant
problem.

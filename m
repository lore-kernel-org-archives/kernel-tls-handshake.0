Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD748C2D2;
	Fri,  5 May 2023 23:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CE4C433D2;
	Fri,  5 May 2023 23:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683328603;
	bh=MjrcaV8NKMjjMk5QK1Jq414XZDQN6qQIQKeGSYFsT1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fm/WY/DLUUmlnk/SmxjACPZ1n4lAF6aZ8kNKwMhElz+bVSSkRlnlJyzVqTvWRVamT
	 fG89Lc2QTRY3PKXTtJ8/Y6t57yK4yrD9vZd4ib77bvFklGKJZq1tsCqGHbozZbvI6K
	 Mi1uZzjcnlJxefbikTLcPac/2GpFwJwSSHShfzGUT3IUvs4MRGRvLKqcRVhA2VWscW
	 7GIo8t4E6kOYsDyvvJKdsBND6HWOT+GGGX71tt4jrIFuXLXqEuCocqzqFxTiLcupsz
	 UBsjFHKyzCIroEk9peCr3LKCA4qpG/k9kmpW9Po1rj8cb1C9djkD197x8RzMADYFrF
	 V1sNfF4FlC2CQ==
Date: Fri, 5 May 2023 19:16:40 -0400
From: Chuck Lever <cel@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org,
	dan.carpenter@linaro.org
Subject: Re: [PATCH 0/5] Bug fixes for net/handshake
Message-ID: <ZFWOWErJ6eR/RX/X@manet.1015granger.net>
References: <168321371754.16695.4217960864733718685.stgit@oracle-102.nfsv4bat.org>
 <20230505133918.3c7257e8@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505133918.3c7257e8@kernel.org>

On Fri, May 05, 2023 at 01:39:18PM -0700, Jakub Kicinski wrote:
> On Thu, 04 May 2023 11:24:12 -0400 Chuck Lever wrote:
> > I plan to send these as part of a 6.4-rc PR.
> 
> Can you elaborate?  You'll send us the same code as PR?
> I'm about to send the first batch of fixes to Linus,
> I was going to apply this series.

Since I am listed as a maintainer/supporter of net/handshake, I
assumed I can and should be sending changes through nfsd or some
other repo I can commit to.

netdev@ is also listed in MAINTAINERS, so I Cc'd you all on this
series. I did not intend for you to be responsible for merging the
series. We'll need to agree on a workflow going forward.

Since you had some review questions about one of the patches,
maybe that patch should not be merged at this time by either of us.

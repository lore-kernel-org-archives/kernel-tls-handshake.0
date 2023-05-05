Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3472C8C1;
	Fri,  5 May 2023 20:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0DAC433EF;
	Fri,  5 May 2023 20:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683319159;
	bh=QCgHIV9cUsAYmmyn/Q+wyckZ9lSSruVVhVTEy5DPYw8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j4tzoMo40lm2wNnOf05zxGdM+qkCJQbTeG7d2vmxEDsSO0xOwPGNTy9Zb+nlIjfWd
	 siyIsXkcs9FSJsv272414vfcKrgTZIp0vouVgE4zsbrlyfHFteI5FXURMnplA+7ynP
	 BwcV9urqTEwKzp1FpsVXcXQgjjaqYEeDYGP9b2QjQXGa+hs8BcYPWBjEP1X5rxE1gQ
	 FXLX4lzZf8LsEzAFB0dzeqZZ3lrkMPwly93dzCeu7xQn2JxyKeFDIGLQKtLut8El7q
	 3wXuVuos3j4a+OsNt5gjKw3m7Z5HDHATcKDNaQveCorvFIH7epNC+6qwFyWZ77+0Ur
	 EaalnrWbebJMg==
Date: Fri, 5 May 2023 13:39:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chuck Lever <cel@kernel.org>
Cc: kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org,
 dan.carpenter@linaro.org
Subject: Re: [PATCH 0/5] Bug fixes for net/handshake
Message-ID: <20230505133918.3c7257e8@kernel.org>
In-Reply-To: <168321371754.16695.4217960864733718685.stgit@oracle-102.nfsv4bat.org>
References: <168321371754.16695.4217960864733718685.stgit@oracle-102.nfsv4bat.org>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 04 May 2023 11:24:12 -0400 Chuck Lever wrote:
> I plan to send these as part of a 6.4-rc PR.

Can you elaborate?  You'll send us the same code as PR?
I'm about to send the first batch of fixes to Linus,
I was going to apply this series.

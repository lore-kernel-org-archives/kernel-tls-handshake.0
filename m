Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5FDA21
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 15 Apr 2023 03:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB40C433D2;
	Sat, 15 Apr 2023 03:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681529945;
	bh=yQ41IUdzpOd31WyfPlb4BhA0oIiZWSiP0yfEfOVKkdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o9iPjlKNbRdAC3sK03NdGroXxhg2625U+EuhlLnYq2q3eqBbBjOt4WrppbqPen8Qk
	 0gSd58/Uz26R9aPK5jZtsMS5EU2Q45qi01zTDIfebN+mv7+6PM0J7X0lsrTDRr6Z/M
	 5b2lq+KI1theFPi31dR2LecYvYqPsljMaL0aD6Ivhy7bQRFivybqbdxP+Bu5a9s8HW
	 Ttn9b4301tM8M893OpRD4WQM6t2raWaIatc47FZYVkEjgEKYroot+3KGa3lgLCaV+6
	 0awEA/08aaTsvmymzIgrV0RQOM+cUS+YB9hvi/2EPvScIWjhch2174z4x85iGxGGQ3
	 gSVz/hcDifH2g==
Date: Fri, 14 Apr 2023 23:39:02 -0400
From: Chuck Lever <cel@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: pabeni@redhat.com, edumazet@google.com, netdev@vger.kernel.org,
	kernel-tls-handshake@lists.linux.dev
Subject: Re: [PATCH v9 3/3] net/handshake: Add Kunit tests for the handshake
 consumer API
Message-ID: <ZDocVvsqKJ57c1Tk@manet.1015granger.net>
References: <168141287044.157208.15120359741792569671.stgit@manet.1015granger.net>
 <168141324822.157208.14911977368369619191.stgit@manet.1015granger.net>
 <20230414183113.318ee353@kernel.org>
 <ZDoGw3nVG+jNWrwV@manet.1015granger.net>
 <20230414191542.16a98637@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414191542.16a98637@kernel.org>

On Fri, Apr 14, 2023 at 07:15:42PM -0700, Jakub Kicinski wrote:
> On Fri, 14 Apr 2023 22:06:59 -0400 Chuck Lever wrote:
> > On Fri, Apr 14, 2023 at 06:31:13PM -0700, Jakub Kicinski wrote:
> > > We're getting:
> > > 
> > > net/handshake/.kunitconfig: warning: ignored by one of the .gitignore files
> > > 
> > > during allmodconfig build, any idea where that's coming from?  
> > 
> > As far as I know, all of the .kunitconfig files in the kernel tree
> > are marked "ignored". I'm not sure why, nor if it's a significant
> > problem.
> 
> To be clear - no idea what the problem is but I don't think all
> of them are:
> 
> $ echo a > fs/fat/.kunitconfig
> $ echo b > mm/kfence/.kunitconfig
> $ echo c > net/sunrpc/.kunitconfig
> $ git status
> Changes not staged for commit:
>   (use "git add <file>..." to update what will be committed)
>   (use "git restore <file>..." to discard changes in working directory)
> 	modified:   fs/fat/.kunitconfig
> 	modified:   mm/kfence/.kunitconfig
> 	modified:   net/sunrpc/.kunitconfig

The "ignored" list I got from the bot yesterday indeed included
net/sunrpc/.kunitconfig as well as net/handshake/.kunitconfig, but
git doesn't actually seem to ignore changes to these files, as you
demonstrate here.

I don't see a specific pattern in the kernel's .gitconfig that
would exclude .kunitconfig files from change tracking.

I can see where this warning might introduce false negative build
results, but so far I haven't heard that particular complaint about
net/sunrpc/.kunitconfig.

Again, I wasn't sure if this was a significant problem or simply
noise, so I haven't chased it. If someone on-list has insight,
please speak up. I can try to have a look at it tomorrow.

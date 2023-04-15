Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1127EA
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 15 Apr 2023 02:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9B5C433D2;
	Sat, 15 Apr 2023 02:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681524944;
	bh=I97hVf/6becCUJITM1Fo37A/cdhDH3Jul7cz2WQ+KwE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D2ke2x5aqFdK0MWmnV2FU9d+ENN7Q98M+pEHFK9S9cbkTFexq0NlHbPFNMNORYz7W
	 7aGM3tg1PR9wP5sbrC9e+T6QEdxpZ8CaNUc8Ya2TMPiZEVymmNg8zYmA2hLft1RdND
	 9h1VuYy9UJ2KbRS8oCLMYDHfKrLNwW2o8Sx17KM0W1CWpGALof+ZnXW4ApGItYcVd9
	 ba8S/4qIwOXbRaqfOR5BPstOpgXFRmXPBIMA+Q5WUmxQmZKpdm8fDtx3uF59zC/uBK
	 mNNqHGAnBV7iHobBe+HjGc2+s4XdxppVnlsut75okIth6dYjjrD2fhYZPc6dXxIIoe
	 Ht6d3AohMlqFQ==
Date: Fri, 14 Apr 2023 19:15:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chuck Lever <cel@kernel.org>
Cc: pabeni@redhat.com, edumazet@google.com, netdev@vger.kernel.org,
 kernel-tls-handshake@lists.linux.dev
Subject: Re: [PATCH v9 3/3] net/handshake: Add Kunit tests for the handshake
 consumer API
Message-ID: <20230414191542.16a98637@kernel.org>
In-Reply-To: <ZDoGw3nVG+jNWrwV@manet.1015granger.net>
References: <168141287044.157208.15120359741792569671.stgit@manet.1015granger.net>
	<168141324822.157208.14911977368369619191.stgit@manet.1015granger.net>
	<20230414183113.318ee353@kernel.org>
	<ZDoGw3nVG+jNWrwV@manet.1015granger.net>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Apr 2023 22:06:59 -0400 Chuck Lever wrote:
> On Fri, Apr 14, 2023 at 06:31:13PM -0700, Jakub Kicinski wrote:
> > We're getting:
> > 
> > net/handshake/.kunitconfig: warning: ignored by one of the .gitignore files
> > 
> > during allmodconfig build, any idea where that's coming from?  
> 
> As far as I know, all of the .kunitconfig files in the kernel tree
> are marked "ignored". I'm not sure why, nor if it's a significant
> problem.

To be clear - no idea what the problem is but I don't think all
of them are:

$ echo a > fs/fat/.kunitconfig
$ echo b > mm/kfence/.kunitconfig
$ echo c > net/sunrpc/.kunitconfig
$ git status
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   fs/fat/.kunitconfig
	modified:   mm/kfence/.kunitconfig
	modified:   net/sunrpc/.kunitconfig


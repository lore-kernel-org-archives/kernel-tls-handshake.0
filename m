Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2503AFE1
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 18:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D81CC433D2;
	Tue, 18 Apr 2023 18:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681842100;
	bh=9dvoyZb0MWqatGlzMrz+nMM+VV4b7Xxa7SB0wWjMDWE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Geea2t25czw64u+Gbxdb/RPfuxKHZ/W8yTnK4zawCkLCOzUpX25c3WVL1m36yv62O
	 ZBwC74PzBORY4AQzsP84JsI1udvQb/f3q6lHeZSOdVQPEVOs75+wHnJuvjnk9p3/rX
	 5v+EBGxJUO8hEj8NEoCYatO9tseaQg6ZPT9ZYpPRL3186S8D9wICG1VxIXjbZMjKqK
	 dG4q3I86OODZREQ5jUbxj8FXuoxLDlgvj+whEPf1HwlTMr3iwu0nNduzvYRUE2Cdjx
	 QTqymNutq+7gSEXogmaadoztgBG9G2PApbzkUTkIbe7Ae8cQgjwxvjKwSQuSbw6hhB
	 YHdGQBwjPDkig==
Date: Tue, 18 Apr 2023 11:21:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hannes Reinecke <hare@suse.de>
Cc: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>, Keith
 Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, Chuck Lever
 <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev, Vadim
 Fedorenko <vadim.fedorenko@linux.dev>
Subject: Re: [PATCH 08/18] nvme-tcp: do not set MSG_SENDPAGE_NOTLAST
Message-ID: <20230418112139.546aff79@kernel.org>
In-Reply-To: <f02fb607-1339-2c68-4bd5-ced65d71b822@suse.de>
References: <20230417130302.86274-1-hare@suse.de>
	<20230417130302.86274-9-hare@suse.de>
	<36976756-b4c5-f2a5-34b8-e9731a49c477@grimberg.me>
	<654702da-246a-934c-14e4-7b179c46ed98@suse.de>
	<5df08f86-2599-6e47-2fdc-bda8d70edaf2@grimberg.me>
	<20230417131654.427ebd6a@kernel.org>
	<f02fb607-1339-2c68-4bd5-ced65d71b822@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 18 Apr 2023 12:33:03 +0200 Hannes Reinecke wrote:
> Ah-ha. Found it.
> 
> Turns out to be an arguably invalid control flow on our side.
> 
> The initial 'connect' command is a command PDU with inline data.
> So in our (current) flow we do a 'sendpage()' with the 
> MORE/SENDPAGE_NOTLAST flag set as we have to transfer more data.
> Ok so far.
> But for transmitting the actual data we evaluate 'sendpage_ok()', which 
> returns _false_. And then we continue to call 'sendmsg()' for the inline 
> data.
> This confuses the TLS software stack as sendpage() and sendmsg() are two 
> distinct code paths, and we end up with a TX stall.
> 
> Solution: check 'sendpage_ok()' when we have inline data and use 
> 'sendmsg' for the command pdu if required.
> 
> It always pays to dig deeper if one's not exactly sure what's happening ...
> 
> Will be updating the patchset.

Hm, yeah, sendpage(NOT_LAST)+sendmsg() could indeed be buggy/untested.
It wasn't something we could have tested from user space, we'd need
kunit or some such :(

Adding it the backlog. And adding Vadim to CC in case he has cycles 
to take a look.

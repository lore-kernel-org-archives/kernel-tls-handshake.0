Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4D58BEB
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 20:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E572FC433D2;
	Mon, 17 Apr 2023 20:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681762616;
	bh=s0ENJSbqd0VO5HWeTuoTR97eEANi+iV3zsBdnSFglT4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HK9eSq/rwqHruAKjXNBMFfnHcCy8VywdD896bb5D0wRYKf2GtkPM2zndiBUNMnApI
	 TUqP+JB3wzWelqzCKTpM5rdZRbVCPNlj8wNzMjEpGzNK9oB/Y9JwXdBetsBy6jVa2p
	 l1KZkobzHrjQQ2RXQiadDij2IAVuQkEppm9zuYzH7nNr/1OMpxxEPQbbMXyUBYWGEn
	 IDPyPTDknKkDIkwB3kSHQ7/vOTQqsCSsL827HTbzYGMPBWhRKDpG12/t/1l7yENuzM
	 rSGLK/mgC/BTuOkjMN96IiNBIBUCJOHq2tCccu6lppYxhXRjkly/VMyAIYKJKFNsMu
	 PaVCSjIjcmoHQ==
Date: Mon, 17 Apr 2023 13:16:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>, Keith
 Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, Chuck Lever
 <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
Subject: Re: [PATCH 08/18] nvme-tcp: do not set MSG_SENDPAGE_NOTLAST
Message-ID: <20230417131654.427ebd6a@kernel.org>
In-Reply-To: <5df08f86-2599-6e47-2fdc-bda8d70edaf2@grimberg.me>
References: <20230417130302.86274-1-hare@suse.de>
	<20230417130302.86274-9-hare@suse.de>
	<36976756-b4c5-f2a5-34b8-e9731a49c477@grimberg.me>
	<654702da-246a-934c-14e4-7b179c46ed98@suse.de>
	<5df08f86-2599-6e47-2fdc-bda8d70edaf2@grimberg.me>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Apr 2023 18:28:12 +0300 Sagi Grimberg wrote:
> > But then we're running afoul with tls_sw_do_sendpage(), which uses 
> > MSG_SENDPAGE_NOTLAST as a record indicator. Forwarding 
> > MSG_SENDPAGE_NOTLAST to tls results in incorrect TLS records on the wire 
> > and a transmission stall.
> > 
> > Took me days to figure that out.
> > 
> > If you have a better idea, I'm all ears.  
> 
> So sendfile is unsupported over kTLS? Or is there some special
> case for it in the upper layer?
> 
> Jakub?

First I hear of it. 10 sec look at the code doesn't indicate that 
the author missed this case completely either.

Hannes, any more details on what's going wrong?

What incorrect TLS record have you seen? What's the sequence of sends?
Offload or no offload? Easy to repro or stars need to (mis)align?

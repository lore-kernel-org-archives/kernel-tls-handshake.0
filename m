Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690038BEB
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 20:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDBBC433EF;
	Mon, 17 Apr 2023 20:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681762249;
	bh=hIoqtNRBOGqTpc2RXSotxVJwjNrNbGDsm8P+77+YGjs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s6n+OO6M2Buc2XhqNeHM9gtugguD0WMhzMR779U2rIiUJX+CLJfs1kAsCMJYqORdz
	 pFC3FlpRfJBoAtYKyzu/Lc5MSdWT+tfxOonv6LB5366/+yDQrS7rAfk8i3OhYpXzQJ
	 U7pMLWRLSDNQkqq1ETPfNYrkMLh32jwuU/A5/0er0pWrH5eD5vLUi14RoNSX1VuSOP
	 oLVB4bvRpJMiDwqQEOF+YTJhUR0jJIibq30vJV0Zr0JmZKEIyp3m+NYXvvOsxfuSET
	 M2BezGuy7txhuosl/X89Go2OeFa4228IDD5jbt8jiSDygnHgYcwWfOUBjrnrMzolmX
	 aqh7glmhUt4Kg==
Date: Mon, 17 Apr 2023 13:10:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>, Keith
 Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, Chuck Lever
 <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
Subject: Re: [PATCH 07/18] net/tls: sanitize MSG_EOR handling
Message-ID: <20230417131048.66b6b3a0@kernel.org>
In-Reply-To: <20af9713-8d64-77de-dfbe-e9e732776d3c@grimberg.me>
References: <20230417130302.86274-1-hare@suse.de>
	<20230417130302.86274-8-hare@suse.de>
	<20af9713-8d64-77de-dfbe-e9e732776d3c@grimberg.me>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Apr 2023 18:19:12 +0300 Sagi Grimberg wrote:
> > The TLS stack is using MSG_EOR internally, so the flag cannot be
> > set for sendmsg()/sendpage(). But to avoid having the caller to
> > check whether TLS is active modify the code to clear the MSG_EOR
> > flag. And blank out MSG_MORE / MSG_SENDPAGE_NOTLAST, too, as they
> > conflict with MSG_EOR anyway.  
> 
> This looks like a temporary workaround to me.
> 
> The networking folks really need to be CC'd on this (same for patch 6).

Thanks, when I said "we can support EOR" I obviously meant support 
not ignore it :(  No ack.

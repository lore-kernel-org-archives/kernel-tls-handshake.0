Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7737487
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  3 Apr 2023 18:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA00C433D2;
	Mon,  3 Apr 2023 18:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680547717;
	bh=PpCYrfjppgEV5YEB2dlQRfdZa+PKUS28JIF5DobHOLw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZabZRczKlv4pL00Y46/qY6Aw82RRk0nVVidIJ/0rIwEa4JUe/nJapNkHt4d/7Rb5y
	 HxVP74YPGUzbNS1Em2Sf/XPQdCZS94gwrD6e0wcp9Ze5BLxZBhZsfWRkFpqzPy9AsU
	 6CjauRzPX1SJju8htEiJgL/Y3vSQIRjXNFiLpDX+TDZb4bgMn9AEBYD02xgVs8tXfZ
	 Jh0qm7uoN+0UhAYTmIcCd91bQ96tlUq6OoQtMntzh9nlSMyMB8ek7qRzd79C2UfR6O
	 Ij9M+OfiEdxHkrJPaCwbHkP4qpOemmibtmoR0T0gH8AdNtINqf3c+VFcuDleoUXdOX
	 BmltBi96AaNNQ==
Date: Mon, 3 Apr 2023 11:48:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>, Boris
 Pismenny <borisp@nvidia.com>, john.fastabend@gmail.com, Paolo Abeni
 <pabeni@redhat.com>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>
Subject: Re: [PATCH 10/18] nvme-tcp: fixup send workflow for kTLS
Message-ID: <20230403114835.61946198@kernel.org>
In-Reply-To: <c7a07e1d-b300-dd1d-1be6-311666387820@grimberg.me>
References: <20230329135938.46905-1-hare@suse.de>
	<20230329135938.46905-11-hare@suse.de>
	<634385cc-35af-eca0-edcb-1196a95d1dfa@grimberg.me>
	<20230330224920.3a47fec9@kernel.org>
	<7f057726-8777-2fd3-a207-b3cd96076cb9@suse.de>
	<44fe87ba-e873-fa05-d294-d29d5e6dd4b5@grimberg.me>
	<20230403075946.26ad71ee@kernel.org>
	<c7a07e1d-b300-dd1d-1be6-311666387820@grimberg.me>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Apr 2023 18:51:09 +0300 Sagi Grimberg wrote:
> What I'm assuming that Hannes is tripping on is that tls does
> not accept when this flag is sent to sock_no_sendpage, which
> is simply calling sendmsg. TLS will not accept this flag when
> passed to sendmsg IIUC.
> 
> Today the rough logic in nvme send path is:
> 
> 	if (more_coming(queue)) {
> 		flags = MSG_MORE | MSG_SENDPAGE_NOTLAST;
> 	} else {
> 		flags = MSG_EOR;
> 	}
> 
> 	if (!sendpage_ok(page)) {
> 		kernel_sendpage();
> 	} else {
> 		sock_no_sendpage();
> 	}
> 
> This pattern (note that sock_no_sednpage was added later following bug
> reports where nvme attempted to sendpage a slab allocated page), is
> perfectly acceptable with normal sockets, but not with TLS.
> 
> So there are two options:
> 1. have tls accept MSG_SENDPAGE_NOTLAST in sendmsg (called from
>     sock_no_sendpage)
> 2. Make nvme set MSG_SENDPAGE_NOTLAST only when calling
>     kernel_sendpage and clear it when calling sock_no_sendpage
> 
> If you say that MSG_SENDPAGE_NOTLAST must be cleared when calling
> sock_no_sendpage and it is a bug that it isn't enforced for normal tcp
> sockets, then we need to change nvme, but I did not find
> any documentation that indicates it, and right now, normal sockets
> behave differently than tls sockets (wrt this flag in particular).
> 
> Hope this clarifies.

Oh right, it does, the context evaporated from my head over the weekend.

IMHO it's best if the caller passes the right flags. The semantics of
MSG_MORE vs NOTLAST are quite murky and had already caused bugs in the
past :(

See commit d452d48b9f8b ("tls: prevent oversized sendfile() hangs by
ignoring MSG_MORE")

Alternatively we could have sock_no_sendpage drop NOTLAST to help
all protos. But if we consider sendfile behavior as the standard
simply clearing it isn't right, it should be a:

	more = (flags & (MORE | NOTLAST)) == MORE | NOTLAST
	flags &= ~(MORE | NOTLAST)
	if (more)
		flags |= MORE

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949CAAFC3
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 18:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06463C433EF;
	Tue, 18 Apr 2023 18:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681842507;
	bh=eam+mtDADCEwI1H0MVDXucCJcW7vmK8XfMM2urrvNd4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WGA7V90k1HX+YLYrkLXa0E9GhEdhsNbPSllZ8gwhp7yt7HxuzStwS7tupU+NSZa+F
	 GF0/o+pZMDK4ZRGBxBd5FIPpGIDiee83v9brKx09VUnJ7a3wbUMaB7o48ARGWZaYUM
	 5vI7x7vii3qir9F/BV6HwuxOw1jabrrNQqKUn2JUSjWHgEDkDC7/hPLEQa/l9nfaHn
	 jzJclgjqG2BZkHlBl5DroNrqR31I63qlQM1POQskIPr8k4yGuTCyJ1aHBtCLEhtddW
	 rVZzFZI/e0JomgtbEVvUilSaYuPcQuDRnMt5jE7BrTpnAqlMM6Qca9k3MDKgAa4+/j
	 lu+php+B2NuKw==
Date: Tue, 18 Apr 2023 11:28:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hannes Reinecke <hare@suse.de>
Cc: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>, Keith
 Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, Chuck Lever
 <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
Subject: Re: [PATCH 07/18] net/tls: sanitize MSG_EOR handling
Message-ID: <20230418112825.789eadba@kernel.org>
In-Reply-To: <ab73a25d-8b2c-17de-d4ea-edd844c600af@suse.de>
References: <20230417130302.86274-1-hare@suse.de>
	<20230417130302.86274-8-hare@suse.de>
	<20af9713-8d64-77de-dfbe-e9e732776d3c@grimberg.me>
	<20230417131048.66b6b3a0@kernel.org>
	<beb7b0e8-2cb5-0c0e-63f9-6a13b9dfb787@grimberg.me>
	<db39fd2d-6da2-852e-70aa-7499fedf8b48@suse.de>
	<b313144b-f510-f3d5-6066-6123c27039ed@suse.de>
	<392cfcc6-c4c7-da94-4e00-f6961c548867@grimberg.me>
	<ab73a25d-8b2c-17de-d4ea-edd844c600af@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Apr 2023 13:02:34 +0200 Hannes Reinecke wrote:
> >> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> >> index 827292e29f99..7b28b11ff611 100644
> >> --- a/net/tls/tls_sw.c
> >> +++ b/net/tls/tls_sw.c
> >> @@ -953,9 +953,12 @@ int tls_sw_sendmsg(struct sock *sk, struct msghdr=
=20
> >> *msg, size_t size)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int pending;
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (msg->msg_flags & =
~(MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL |
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MSG_CMSG_COMPAT))
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MSG_EOR | MSG_CMSG_COMPAT))
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
> >>
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (MSG_EOR) =20
> >=20
> > You probably meant if (msg->msg_flags & MSG_EOR)...
> >  =20
> Of course.

Neat. And similarly for sendpage() and in tls_device.c, it should be
fairly small changes in all 3 places. You don't need to worry about
tls_device itself using EOR, FWIW, it's just to try to make the offload
start on a skb boundary. Adding more EORs should not confuse anything.

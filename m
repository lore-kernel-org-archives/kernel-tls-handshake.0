Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA7D329375
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 26 Nov 2025 13:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764165225; cv=none; b=m5rp/ZO/T6cmVVzfzK4U1tfKVkEB2GfGJbdlMlLWM+8DFrmsK4/c4h+9ZveSifG5OwvwHwjJpodvHtxKNONQbMZGVFNGcMOash71I9K76KwgYmLyKZOuOYE2us/1p9ebxdYHis1t9uHgDyMtt8w+WeBY5OpLksjEqSVROwYGHWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764165225; c=relaxed/simple;
	bh=c0DgwlbVSTP3zHIBRSRfKUQZpFA9iWvV/kTmuLI7gog=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mbWkfwye9zwlWIyHXloFYlI+nVtWjDk5zYUmWULJI9SnJAvfzz0CYvnLagfXnrFIv5QuC5nCvdDSzotZxPO5qk7e4JxRlK/5WcB5LO5uhu+gAvYA+VCRgvvlpabe6y6MLhVKpYGY/De1bi3Xs0p61kdWVwaofzbPUPyaAYwGdF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6F6//x/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6F6//x/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42719C4CEF7;
	Wed, 26 Nov 2025 13:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764165224;
	bh=c0DgwlbVSTP3zHIBRSRfKUQZpFA9iWvV/kTmuLI7gog=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=d6F6//x/yI2WR5Zr5pppysvZqlZyU/dyRljrYiLdxBEUYKSb/NIc7MNU11wpaO4Vc
	 FwJEeTf0LGCedhhHxpDLvdGrdceucw++yPXefaZfSjmJNbxeU3E9SCbOo7ncKhdDX+
	 owslTjCHx+SHaPTHIR46TDsgxMFGqCXzyDJXA303rWDRXUMzWLngw5iLxTjAX2Wb9w
	 kLgtkopIEjT0pmUW2vbdXOVB05FSRN7hkBQZhExUlYt6n0afo2r7BnTDjPug/kJdrV
	 +wiCtyA8xmoBLFzroiqpdTjtzf6DcDJEPhlsFicoZHSOIL9fH0hyvQ1Y1nE/DX8hEH
	 Pjph/h8bnzznA==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 65669F40068;
	Wed, 26 Nov 2025 08:53:43 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Wed, 26 Nov 2025 08:53:43 -0500
X-ME-Sender: <xms:ZwYnae9_DooamkKwmEHtdBKzK5cEPR4AqmGLTKDTweLGtfT2f7QZcg>
    <xme:ZwYnaZgGAN1xacl30N52vTGRqu0ykK8a4QQQEgKwmUSAHiJVpb6b8BBaqBBngr5GB
    nqeiuimVvhrn05YOYuqOMWv7Jdih4DXkoh2adMqe2WQJyUbXQ9H6i0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeegheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfvehhuhgt
    khcunfgvvhgvrhdfuceotggvlheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpeejvefhudehleetvdejhfejvefghfelgeejvedvgfduuefffeegtdejuefhiedukeen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheptghhuhgtkhhlvghvvghrodhmvghsmhhtphgruhht
    hhhpvghrshhonhgrlhhithihqdduieefgeelleelheelqdefvdelkeeggedvfedqtggvlh
    eppehkvghrnhgvlhdrohhrghesfhgrshhtmhgrihhlrdgtohhmpdhnsggprhgtphhtthho
    peefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsrhgruhhnvghrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegurghnrdgtrghrphgvnhhtvghrsehlihhnrghrohdr
    ohhrghdprhgtphhtthhopehkvghrnhgvlhdqthhlshdqhhgrnhgushhhrghkvgeslhhish
    htshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:ZwYnaY7RTSsMRAr-s1vwjJb13YD_Ko7WSDvpL9ptKVEHgh3fGNpxGA>
    <xmx:ZwYnaRpRGpbnNg7IMhXPUiNwcnir1r2SwbqsOdrGYl4xqGtFaHA69A>
    <xmx:ZwYnaahfa0gajXHUv7Y6JypNG4XbK6RU3Qn_xz5X-td_r_Oi63kX_A>
    <xmx:ZwYnabIrGjeyZJ5s1xJK6EQBx1XIHpUUe5DvI3IPLdr_4yYlnRrPvw>
    <xmx:ZwYnaaCQUQvM6O7r5H74U8v4zMTmCmzjSDW5MKVRenxjyLOMyW5TeunX>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 24C4B780054; Wed, 26 Nov 2025 08:53:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AElR_IUDdpBc
Date: Wed, 26 Nov 2025 08:53:22 -0500
From: "Chuck Lever" <cel@kernel.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Christian Brauner" <brauner@kernel.org>
Cc: kernel-tls-handshake@lists.linux.dev
Message-Id: <4fbc4f88-2040-4c7d-b018-7cf69d371105@app.fastmail.com>
In-Reply-To: <aSa65GzoGY-E6OYt@stanley.mountain>
References: <aSa65GzoGY-E6OYt@stanley.mountain>
Subject: Re: [bug report] net/handshake: convert handshake_nl_accept_doit() to
 FD_PREPARE()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, Nov 26, 2025, at 3:31 AM, Dan Carpenter wrote:
> Hello Christian Brauner,
>
> Commit 214ab7edf554 ("net/handshake: convert
> handshake_nl_accept_doit() to FD_PREPARE()") from Nov 23, 2025
> (linux-next), leads to the following Smatch static checker warning:
>
> 	net/handshake/netlink.c:128 handshake_nl_accept_doit()
> 	error: we previously assumed 'req' could be null (see line 109)
>
> net/handshake/netlink.c
>     90 int handshake_nl_accept_doit(struct sk_buff *skb, struct 
> genl_info *info)
>     91 {
>     92         struct net *net = sock_net(skb->sk);
>     93         struct handshake_net *hn = handshake_pernet(net);
>     94         struct handshake_req *req = NULL;
>     95         struct socket *sock;
>     96         int class, err;
>     97 
>     98         err = -EOPNOTSUPP;
>     99         if (!hn)
>     100                 goto out_status;
>     101 
>     102         err = -EINVAL;
>     103         if (GENL_REQ_ATTR_CHECK(info, 
> HANDSHAKE_A_ACCEPT_HANDLER_CLASS))
>     104                 goto out_status;
>     105         class = 
> nla_get_u32(info->attrs[HANDSHAKE_A_ACCEPT_HANDLER_CLASS]);
>     106 
>     107         err = -EAGAIN;
>     108         req = handshake_req_next(hn, class);
>     109         if (req) {
>
> If handshake_req_next() returns NULL
>
>     110                 sock = req->hr_sk->sk_socket;
>     111 
>     112                 FD_PREPARE(fdf, O_CLOEXEC, sock->file);
>     113                 if (fdf.err) {
>     114                         err = fdf.err;
>     115                         goto out_complete;
>     116                 }
>     117 
>     118                 get_file(sock->file); /* FD_PREPARE() consumes 
> a reference. */
>     119                 err = req->hr_proto->hp_accept(req, info, 
> fd_prepare_fd(fdf));
>     120                 if (err)
>     121                         goto out_complete; /* Automatic cleanup 
> handles fput */
>     122 
>     123                 trace_handshake_cmd_accept(net, req, 
> req->hr_sk, fd_prepare_fd(fdf));
>     124                 return fd_publish(fdf);
>     125         }
>     126 
>     127 out_complete:
> --> 128         handshake_complete(req, -EIO, NULL);
>                                    ^^^
> then this will crash.
>
>     129 out_status:
>     130         trace_handshake_cmd_accept_err(net, req, NULL, err);
>     131         return err;
>     132 }
>
> regards,
> dan carpenter

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/net/handshake/netlink.c?id=0f3d7fa5007a11d8a0eab88c970086363afb1564

I've searched the netdev@ archive on lore, and don't see this
commit. Neither is it in netdev-next.

I'm a little concerned that a change to net/handshake/netlink.c
was never sent to any of its listed maintainers for review or
Acked-by.


-- 
Chuck Lever

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FAE217648
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 26 Nov 2025 15:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171414; cv=none; b=lzO67bobF/MYwjDKqQ3//9JF2QiFdMUZmXmMi7zj7IoNPcRelYNtQuUeelqKZANZrtpHPauyaEaYmUwQNd9kVyHCMmjA3Cy1SwsUIslHs1HCSdsN7eOv2LWM49avus8b3Pvm/kscs0l1H50ikSja59Go8qlNlNEiPnZtv9TfFPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171414; c=relaxed/simple;
	bh=gdIE+W7373qxEdaFb+oGuYsohRkWV6yVF7uo8K2icEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHlBr1XZyGaG91/TBXmeHtUPA722nm+0MIKk/mu3qZiIOymMfqCmOEMR2f0ohlX755af7GkG4l21ZmobqeyAhKvAvuYKF74RgWXSaeFiPUYMU1hGp78jt7D/CcWRNvHRF1WDUh7Ub1nEUYiDcSXUr+S8sZSR56H93Wt80SgJ7HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4UykHXq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4UykHXq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7C6C116B1;
	Wed, 26 Nov 2025 15:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764171413;
	bh=gdIE+W7373qxEdaFb+oGuYsohRkWV6yVF7uo8K2icEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d4UykHXq/6BIcndVPrJzkqkcabPD3UKehRg+0I2gM7D7Nsq5GrmO/bLwZ69Y+qbeP
	 ktP+iLWOLRyvE1LYnonF1eatXUIHObptXNqKclcFqsFv3loL6fsRZjdppToXujDkJm
	 xTetT7YefuFVzcl3T5FnP0/QkHz+3taOfY6+cONqrif/ID3Nk+Q0IGkBWjQC8I3bCk
	 mxahnCT17dfyyErfQPy/xUV7nmC4vdvLXxS7ghutGA4O+JIoWWhKKZs7sGQAkW3Dsx
	 RHdLqg24IKdMWowwGiG20Sfu31XXVu44FBq9hJc1dB3XnVyWwL3M6HH/NRdkQ0YxSX
	 2W3Xlyeods5hA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8D71FF4006B;
	Wed, 26 Nov 2025 10:36:52 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 26 Nov 2025 10:36:52 -0500
X-ME-Sender: <xms:lB4naf2F2onIyJGu_-aeAYiAyGyrmdybClGuRLwqUnqGKNxb2S9dKQ>
    <xme:lB4naVhSeqNYN5q9FRNkUxld7bcsuYawh81mpQmD1bIGSYYblo-kWzGNXsnf_pO29
    r71v5u_PGmJR3J2WBis6kpmdZHqVZzYZCdGgxk1HVuaMPXkXKMnOPY>
X-ME-Received: <xmr:lB4nadQnru4ohwWB1A79QBYl9nc2ZzAzZmVU-T52I20irF-xc4TNvxsmxuw9Lug-VoUnVtbhm6VQbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeegjedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvehhuhgtkhcu
    nfgvvhgvrhcuoegtvghlsehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepve
    eivddugfeuuddugffgfeehveeltdehiefghedvieeukeeujeetjedtffehtdelnecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegthhhutghklhgvvhgvrhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeifeegleelleehledqfedvleekgeegvdefqdgtvghlpeepkh
    gvrhhnvghlrdhorhhgsehfrghsthhmrghilhdrtghomhdpnhgspghrtghpthhtohepfedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghrrghunhgvrheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepkhgvrhhnvghlqdhtlhhsqdhhrghnughshhgrkhgvsehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepuggrnhdrtggrrhhpvghnthgvrheslh
    hinhgrrhhordhorhhg
X-ME-Proxy: <xmx:lB4naejwKZAkXkKuLXKroLy9YUhKRIamGH8ewRoTRzebQIStG6-tiA>
    <xmx:lB4naV5-jcBWisfynsvWLhStwstcTtSvf_PvcMkpkcqVKWO3T5Iw5A>
    <xmx:lB4naTDDACniMh34VWkoBohZKOEGrU53tWp-J3BTcxxI3nT5A5iafw>
    <xmx:lB4naUZFwyLYD7cQwUDCHMmB5Kzi2eLETeluE22f6xlpQMvBSzD3Xg>
    <xmx:lB4naWYjGDFFsSL6_sj0Ch4QQELbD8jWeDSvTbVMAnQ8s2DAjwZBnJWY>
Feedback-ID: ifa6e4810:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Nov 2025 10:36:52 -0500 (EST)
Date: Wed, 26 Nov 2025 10:36:50 -0500
From: Chuck Lever <cel@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: kernel-tls-handshake@lists.linux.dev,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [bug report] net/handshake: convert handshake_nl_accept_doit()
 to FD_PREPARE()
Message-ID: <aScekpuOYHRM9uOd@morisot.1015granger.net>
References: <aSa65GzoGY-E6OYt@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSa65GzoGY-E6OYt@stanley.mountain>

On Wed, Nov 26, 2025 at 11:31:32AM +0300, Dan Carpenter wrote:
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
>     90 int handshake_nl_accept_doit(struct sk_buff *skb, struct genl_info *info)
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
>     103         if (GENL_REQ_ATTR_CHECK(info, HANDSHAKE_A_ACCEPT_HANDLER_CLASS))
>     104                 goto out_status;
>     105         class = nla_get_u32(info->attrs[HANDSHAKE_A_ACCEPT_HANDLER_CLASS]);
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
>     118                 get_file(sock->file); /* FD_PREPARE() consumes a reference. */
>     119                 err = req->hr_proto->hp_accept(req, info, fd_prepare_fd(fdf));
>     120                 if (err)
>     121                         goto out_complete; /* Automatic cleanup handles fput */
>     122 
>     123                 trace_handshake_cmd_accept(net, req, req->hr_sk, fd_prepare_fd(fdf));
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
> 

Following up with a review comment or two, based on:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/net/handshake/netlink.c?id=0f3d7fa5007a11d8a0eab88c970086363afb1564

The original code followed the preferred early exit / early return
kernel style. The new version inverts this by wrapping the success
path inside:

  if (req) { ... }

instead of checking

  if (!req)
    goto out;

and then continuing the main execution flow at the base indentation
level. Is there a reason the original style needs to be abandoned?

-- 
Chuck Lever

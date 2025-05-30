Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602F54685
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 30 May 2025 04:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748580285; cv=none; b=lZLpMFEwZm5MqLFeaTMhMovxImy6ioT8qUPvNDOGJuqXKQYu5ABWYGP39mwfnGlZN6NVrrUiNO5399cRDDcZVtdLuQMxQC6gXSXT3Z9QeHsZBQs0mHbqypMSZYAJITOZh9EoPyBgLBexh1cSFrZA7NWZ7HGuJ/zCZDgHwZMUh5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748580285; c=relaxed/simple;
	bh=NYvnbs9GFHImegUzUD0yhSooD3hTf6cv/7apO+Yyf/o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bAaI4WfeNsaMiIxjKYTQz9eX3sLxGwxz3wALa2beBqdZLBM7LKIq+ZO4iSrRQlVHklBBDBwoh3g/1Vj3L5xh6Yj36s/KlWvP5jMZQnBy7HocIfRrxV31iF0P/FhSdz91KgKP+HznAKtcQN3OlQQcU3OEEWvgQzDnv0+9vTYTbeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alistair23.me; spf=pass smtp.mailfrom=alistair23.me; dkim=pass (2048-bit key) header.d=alistair23.me header.i=@alistair23.me header.b=BsSFHoR+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HB3qVhAG; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alistair23.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alistair23.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alistair23.me header.i=@alistair23.me header.b="BsSFHoR+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HB3qVhAG"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 27A671140138;
	Fri, 30 May 2025 00:44:41 -0400 (EDT)
Received: from phl-imap-06 ([10.202.2.83])
  by phl-compute-04.internal (MEProxy); Fri, 30 May 2025 00:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1748580281; x=1748666681; bh=KxdkiUI0LhS24j/uRpF//zrPS6i2Uahc
	KjZCii39qb8=; b=BsSFHoR+1qYQmw59z5kYoVaL9EMp7J+57X0w/uzCWckZoxjo
	7NQQZS8zTARzsAm+hgNzGDTsUSkk6yQe8b/CfF/yQ5M7nEdm9dHVpFkNlzGMTPNr
	qh1v3X3p9h6W4rxHYrJEMV3ni5PVt9quOKUCITT0ZTZNdWE0Ua8z6kffP7/issqV
	+VhGEJ8A/muIDulAw72PG4N0uTBwmy1SeYQcH2OkvmGb4iHzkUHchPLy1mcvAauL
	pNDxNv2OnhxaBNDGZRftiRqWHZ1N/Bzk/pto/wGvsaBKtMLNQhcs8aIshJYC3oOH
	+1yPcRXBJoL5X+JRAipFy1UrDfNIj502zbTuYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748580281; x=
	1748666681; bh=KxdkiUI0LhS24j/uRpF//zrPS6i2UahcKjZCii39qb8=; b=H
	B3qVhAGynyMFN9zAHe6usTRuiCrQvqIfLc7NTRaCdqUaoORy7daIYHyiZwEiTe6v
	EbI1wSZIC+ll1HN52CXOrA/glVvlWOYGmNalRch03tITH5O3s7ekjhu3ap277oYS
	sTjioqY7qJcBrhZZinh40TE48VSVWOMvELLoIEVpl3s5HxrxtrF92MlJRa3sXa3W
	1kw48JMtdLg+OEDWPgZF62c7OyltI9xl3z15C5ZQX2cnxMFl45ziUbG0bsRNhJ+A
	uxkAtkJ8v0VY4sigjjWxHRepgu6qkYaqpKbuxozwcMX5ss/SQiTmgXnsNDFGygaB
	pSzKac/jg2l+WavmH2v/g==
X-ME-Sender: <xms:uDc5aJLvha-8aOQpASY6rpDORMEAskBqQq-PKacnuOBVgmkQ1lUDxw>
    <xme:uDc5aFJJ0s_WMMAfHBNeqCWuO8Uy0YwrJEDot28_mxXh65K3V-UolGdA1ok8xuEJh
    j3tWZ3tExWWVsMiEeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvkedtleculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    jghfufgtgfesthejredtredttdenucfhrhhomheptehlihhsthgrihhruceorghlihhsth
    grihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeghfdvveeg
    feehvedvtedtheefkeekkeehteeivdeigffhjeeujefhiefhgfegkeenucffohhmrghinh
    epghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdhnsggprh
    gtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkvghrnhgvlhdq
    thhlshdqhhgrnhgushhhrghkvgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtth
    hopegthhhutghkrdhlvghvvghrsehorhgrtghlvgdrtghomhdprhgtphhtthhopegstgho
    ugguihhnghesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhgrrhgvsehsuhhsvgdrug
    gv
X-ME-Proxy: <xmx:uDc5aBs8YRXg9jkv2ecFNjjk4BwBf8CP4OU8YZBPyy1yRBs8J8jZ7g>
    <xmx:uDc5aKZFLo4rTpiNf0syrprgv4tSfVN9UCCrJCeGX51_QGCnDunxWA>
    <xmx:uDc5aAaQkoEbYre4EEjhygEULkntjT-V_ookT9iLy1KZ9AUXcBPaNA>
    <xmx:uDc5aOBSO1MOS7TTOA7FizZ5G1HurzCE8SSzcTTF2RaGXWU01ChKaQ>
    <xmx:uDc5aGEQEVIGTnz0aXugm_s9N9S-8CfZoO-5b3cllmxPLaIBzUgzd5vG>
Feedback-ID: ifd214418:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 650852400077; Fri, 30 May 2025 00:44:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: T9af1c06d238a315d
Date: Fri, 30 May 2025 14:44:20 +1000
From: Alistair <alistair@alistair23.me>
To: "Chuck Lever" <chuck.lever@oracle.com>,
 "Benjamin Coddington" <bcodding@redhat.com>
Cc: "Hannes Reinecke" <hare@suse.de>, kernel-tls-handshake@lists.linux.dev
Message-Id: <0d34408a-b6fa-4425-9cf3-879d0eeb3825@app.fastmail.com>
In-Reply-To: <a1c5c804-c92d-406f-844a-328c1ed0ac5f@alistair23.me>
References: <ba83aadd-8a2e-4080-a6b5-bef272fea606@app.fastmail.com>
 <a6488280-54af-4127-adbc-65d0cfaad954@suse.de>
 <f18611d8-08cb-4233-948f-ea9fd50c28de@oracle.com>
 <67CAB54F-B40E-4B9A-A769-B3F298ED86A5@redhat.com>
 <2df731e0-f18d-498b-a343-a96e5d47868c@oracle.com>
 <a1c5c804-c92d-406f-844a-328c1ed0ac5f@alistair23.me>
Subject: Re: KeyUpdate Support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 22 May 2025, at 2:50 PM, Alistair wrote:
> On 22/5/25 00:53, Chuck Lever wrote:
> > On 5/21/25 10:50 AM, Benjamin Coddington wrote:
> >> On 21 May 2025, at 8:53, Chuck Lever wrote:
> >>
> >>> On 5/21/25 2:43 AM, Hannes Reinecke wrote:
> >>>> On 5/21/25 03:00, Alistair wrote:
> >>>>> Currently tlshd uses `fork()` to fork the entire process after the kernel
> >>>>> sends a netlink message. tlshd then calls the `tlshd_service_socket()`
> >>>>> function from the child process and exits.
> >>>>>
> >>>>> This provides a high barrier between different handshake requests and
> >>>>> ensures everything is freed when a handshake is complete.
> >>>>>
> >>>>> The problem with the current setup is that it makes it very difficult to
> >>>>> share information between `tlshd_service_socket()` and the parent
> >>>>> process.
> >>>>> For security and system resources that's great, but it has the large down
> >>>>> side of not supporting the TLS KeyUpdate.
> >>>>>
> >>>>> In the future we would like to support the TLS KeyUpdate mechanism, which
> >>>>> means we need to maintain the `gnutls_session_t session` information
> >>>>> for a
> >>>>> connection to allow us to issue a KeyUpdate later on.
> >>>>>
> >>>>> AFAIK there is no way to re-create the `gnutls_session_t session` so
> >>>>> we need
> >>>>> to store it somewhere. We could pass it to the kernel and have the kernel
> >>>>> pass it back. But `gnutls_session_t session` is gnutls internal state, so
> >>>>> it's not fixed size making that tricky to do. Plus it will break if
> >>>>> gnutls
> >>>>> updates between a handshake and KeyUpdate.
> >>>>>
> >>>>> The other option is to pass the session data from the child process back
> >>>>> to the tlshd parent process. The parent can then store the session data
> >>>>> (maybe in a database?) and use it as required.
> >>>>>
> >>>>> I submitted the first step towards supporting that as a PR [1]. The PR
> >>>>> changes the current `fork()` multi-process mechanism to a
> >>>>> `g_thread_new()`
> >>>>> threading mechanism.
> >>>>>
> >>>>> In the future this will allow us to maintain the gnutls_session_t session
> >>>>> in the parent process, allowing KeyUpdate support. This could also be
> >>>>> supported with `fork()` and IPC as well, but that is clunky-ier.
> >>>>>
> >>>>> My approach [1] hasn't been accepted, so now I'm trying to see what
> >>>>> ideas other people have for supporting KeyUpdate?
> >>>>>
> >>>>> 1: https://github.com/oracle/ktls-utils/pull/95
> >>>>>
> >>>> Hehe. I knew it would come up.
> >>>> The reason we didn't implement it for now is that there's an overlap
> >>>> with session reset. In NVMe any error will be causing a session reset,
> >>>> which then will trigger a TLS handshake. And, what's more, with secure
> >>>> concatenation we even generate a new set of TLS PSKs on every reset.
> >>>> All of this is transparent to the upper layers, so they will only see
> >>>> a (hopefully short) delay.
> >>>> Additionally, with the current in-kernel TLS the connection will be
> >>>> reset when the IV values are being changed, which again would trigger
> >>>> a reconnect on the NVMe side.
> >>>>
> >>>> So not that easy.
> >>>>
> >>>> But if you insist on doing that, why don't you use the keyring to
> >>>> store the temporary session key? That is persistent, and required
> >>>> to be present for tlshd to work ...
> >>> I was about to suggest something similar. Depending on what APIs are
> >>> available in (or might be added to) gnuTLS, preserve the session's
> >>> metadata in a key ring, and return the key's serial number to the
> >>> kernel as part of the handshake result. When requesting a KeyUpdate,
> >>> pass that serial number back to tlshd.
> 
> 
> Ok, that seems pretty do-able
> 
> 
> I'm working on some kernel patches now that start to implement the 
> basics of this
> 
> 
> >>>
> >>> It would help if someone could review gnuTLS to see what is available
> >>> now, and start a discussion with that community if we need a capability
> >>> or API that doesn't already exist. (Eg: translate a gnutls_session_t
> >>> object into a JSON string; translate a JSON string into a
> >>> gnutls_session_t object)
> >> I believe gnutls_session_{get,set}_data will serialize the session object.
> >> It would be trivial to store in a key.
> > Oh, very cool.
> 
> 
> I didn't see that previously. That does seem to do exactly what we need

A follow up on this, gnutls_session_{get,set}_data doesn't seem to store enough
data to easily resume a session to handle a KeyUpdate. So we probably
need to modify gnutls to get this working.

Alistair

> 
> 
> >
> >
> >>> The other aspect of this is that tlshd will have to prevent saved
> >>> session state from growing without bound. Probably the kernel will have
> >>> to notify tlshd when a session is terminated so that associated saved
> >>> session state can be discarded.
> > It occurs to me that tlshd doesn't need to be involved in this aspect.
> > The kernel can delete a key by serial number when it notices that a
> > session has been permanently terminated.
> 
> 
> Oh good point. That will help with freeing memory.
> 
> 
> Alistair
> 
> 
> >
> >
> 
> 

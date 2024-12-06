Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02851B6D04
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  6 Dec 2024 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733484392; cv=none; b=dnirbnFHd3fWVAelzi+iBLZqX9A/GdGg7R823ITltT1GQabY04z4oMYWrvucLWTPsXgbISbGyGh0C5djnkRchA9jfuM9JzDHMz4HqTxggDeaUFcWQpv7mcFKS55acxgc0rgDijwoZroJg6XDr250QeBQT6/hClL8xpcYL2CSe2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733484392; c=relaxed/simple;
	bh=kzZ4gRnbt9XZXfkzj69zdci4E3Rz2+bV9hfVLOmyd3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swBjpCg0VpEjQD7s5awA5KU3eU3/VIN7GgRAbTt3XdYcM3qxgi3HoA4ldtVaCgCOCO+Rvv7nw5phhFzVkx8nqCVFisj/RqGr0XpnTg045sPWSO+hwUFTpxhOlAETbGUQ2W2iyeEWZHGi2uQbMpxEo76ma3FreoeujQxQM6mxCRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=acKf8X/9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eX/SGYjP; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="acKf8X/9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eX/SGYjP"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 914861382991;
	Fri,  6 Dec 2024 06:26:26 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 06 Dec 2024 06:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1733484386; x=1733570786; bh=KvYZMGZu6HHf1Gr/oiLzIsmYemg3VB+F
	m7nhJBNJlZA=; b=acKf8X/9KUjTtrax9UgEaJ6ug5i3cVij/BGlAGjMULVtLnWa
	q+hzqM0Gv7GfH2LAaIMnY4BoB4DA2POIgFJOAxmoKuiGvuV0Xz8BQqDJptPNt9uz
	AKLinOPsXTW6UdtyPKBK6L9LoiIDtfZXLOqguoLKWrJat/SKfc6kSXWRzEhsnKdv
	1bdvDtne99qnVTJPS9Nyep0yX9oSHpdtU8eukRUE+iPWTi2Z2QlA9irH2sjnYbni
	0rOp1lWvsd65gVw8dPtzdxezC5Txdm2aYKrsZKP1C8kf7xG9j2nXyfz8ZN3exeuF
	UMb+/x3llqmNVokUq4/YpEqoccvb17jgLMXZJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733484386; x=
	1733570786; bh=KvYZMGZu6HHf1Gr/oiLzIsmYemg3VB+Fm7nhJBNJlZA=; b=e
	X/SGYjPCe0DYBRtPnawGIXVXvq6dOkN1pn+N6onM7vuwmKby8+oOzxk3mcYpBkZ4
	CJbgf5cOwqyjo3fOAWUbcmZa73D8nkZJs1FZz9gq6q0LuoqF9jyswpWr0eEjyqZd
	A5hvPY2zH7vj1IhSsAwDPCFM8zClimnk+ygQxaUXA7raF49aSXU7t6AX+sEKw+4v
	UMetnwhlQ3wSWrvrdgGFExCePihbuDzf7OJSnrNokV0C9QdBhH9gUIgn1QEPf5Dg
	DoIDMKE9uXuqevnmTts/n5OsKol5X1Mil5SPEiiiqhtVeWsDNHDvQJUOKGWIH+0t
	XFzvIPDZttCkWUngWoiYw==
X-ME-Sender: <xms:Yt9SZ4xxPmZ_kitUSjJCO-wfk5R3hKn2S7KcH1sY8UwVI-Kq1loK8g>
    <xme:Yt9SZ8Q8oP8pGF1CQMFzNHA2t4RnY_tSVoUfOzrwwnQdvS4CJ13ymCGrE0VgPBUPB
    X0EzN_fAls7M-MxVPA>
X-ME-Received: <xmr:Yt9SZ6VP4sESTFMXq2E2jBCe_2GR7CISRuvYaNbmgFImqKfp55eKULm5hPnk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrieelgddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeen
    ucfhrhhomhepufgrsghrihhnrgcuffhusghrohgtrgcuoehsugesqhhuvggrshihshhnrg
    hilhdrnhgvtheqnecuggftrfgrthhtvghrnhepveduvddtveehteekvdeiueegheeiveej
    keetfefgfeeffeejgfdvfedtleeufeegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsuges
    qhhuvggrshihshhnrghilhdrnhgvthdpnhgspghrtghpthhtohephedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohephhgrrhgvsehsuhhsvgdruggvpdhrtghpthhtoheptghh
    uhgtkhdrlhgvvhgvrhesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepnhgrrhgrhigrnh
    drrgihrghlrghsohhmrgihrghjuhhlrgesfigutgdrtghomhdprhgtphhtthhopehfkhhr
    vghniigvlhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepkhgvrhhnvghlqdhtlhhsqd
    hhrghnughshhgrkhgvsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:Yt9SZ2iT6afpO-cSqZoDompoRUYUadXZRlyrn5o1iGRLLeD-sI-VNA>
    <xmx:Yt9SZ6D3Bql1zonweMnRLk93NHC5h32cattNawYNn_zoOZsFTmEqZA>
    <xmx:Yt9SZ3LL18IPykckGUHfSTqy4SdxNltU8GF0cmpVMUxd_kvhjdmXaQ>
    <xmx:Yt9SZxCdX7KOvBRkYVNGi0OUOkpeirxomn3jdZyclHJXKPUgsX_RPw>
    <xmx:Yt9SZx4o0eOqo9_WZ3PbWELrg752hOGkJbGGLxoyeYFCkmk6wBM2I_eT>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Dec 2024 06:26:25 -0500 (EST)
Date: Fri, 6 Dec 2024 12:26:23 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: Hannes Reinecke <hare@suse.de>
Cc: Chuck Lever III <chuck.lever@oracle.com>,
	Narayan Ayalasomayajula <Narayan.Ayalasomayajula@wdc.com>,
	"fkrenzel@redhat.com" <fkrenzel@redhat.com>,
	kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Subject: Re: Question regarding TLS Key update for NVMe-TCP protocol
Message-ID: <Z1LfX4S71BRvBKOW@hog>
References: <BYAPR04MB53982DF8F2777C6D28A23067EF282@BYAPR04MB5398.namprd04.prod.outlook.com>
 <BYAPR04MB6102F3173201AF0983DB6166FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <BYAPR04MB5398745DD2E7E66981384342EF292@BYAPR04MB5398.namprd04.prod.outlook.com>
 <BYAPR04MB61020B390B594196C8726D85FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <SN6PR04MB5406D4D68F82EBFFC1C580F3EF352@SN6PR04MB5406.namprd04.prod.outlook.com>
 <3EA96B2E-D195-4F81-A8D2-A2CD87A902C8@oracle.com>
 <335756f7-c0d7-4f4f-8329-d67e2740570f@suse.de>
 <6ED4312D-FA09-4BC2-82CE-A87C5DD7571C@oracle.com>
 <4c2b8312-a0a9-48f7-b5b3-acc73bcc538d@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c2b8312-a0a9-48f7-b5b3-acc73bcc538d@suse.de>

2024-12-03, 16:20:12 +0100, Hannes Reinecke wrote:
> On 12/3/24 15:33, Chuck Lever III wrote:
> > > On Dec 3, 2024, at 2:17 AM, Hannes Reinecke <hare@suse.de> wrote:
> > > But the current in-kernel TLS implementation doesn't allow to change
> > > the cipher ( cf net/tls/tls_main.c: do_tls_setsockopt_conf() ), so
> > > the only chance here is to close the connection and start from scratch.
> > 
> > Have we asked Boris and friends if it would be possible to
> > implement KeyUpdate via ktls? Just curious.
> > 
> The immediate problem with KeyUpdate is here:
> 
> net/tls/tls_main.c:tls_setsockopt_conf()
> 
>         /* Currently we don't support set crypto info more than one time */
>         if (TLS_CRYPTO_INFO_READY(crypto_info))
>                 return -EBUSY;

And my patches (mentioned in the first email of this thread, but
there's another version that I sent for review more recently [1])
address that.

[1] https://lore.kernel.org/netdev/cover.1731597571.git.sd@queasysnail.net/

> so we need to close the socket whenever we want to change the TLS key.
> And that results in a call to the socket callbacks, which informs the
> NVMe-TCP driver, and the connect is reset.
> 
> KeyUpdate is a single message in the packet stream, transferring
> the new key values encrypted with the original key.

nit: the KeyUpdate message doesn't contain the new key, it just says
that the new key will be used from that point on (otherwise we
wouldn't have to worry about keeping secrets around?).

> But: The new key is derived from the application secret, which is _not_ the
> currently used Key/IV values used by the in-kernel TLS implementation (cf
> section 7.3 'Traffic Key Calculation' in RFC 8446).
> So we cannot compute the next set of application traffic secrets; the only
> one who might have had this is the tlshd session, but that is destroyed once
> the handshake is done (or, rather, I hope it is ...).
> 
> So the original handshake traffic secrets are gone, and we cannot
> derive the next set of traffic secrets from there. Plus I'm not sure
> if we should keep that around in tlshd; that definitely would be prone
> to leak secret material, inviting $RANDOM_HACKER to attack tlshd ...
> 
> And that's before even checking whether we need to modify gnutls
> for deriving updated traffic secrets ...

I would expect all TLS libraries keep those secrets around to be able
to implement KeyUpdate regardless of ktls (but I only work on the
kernel, not gnutls/openssl).

-- 
Sabrina

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32352DC352
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Feb 2026 16:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771431165; cv=none; b=eOvbDxvnvsjSP0KXtWxV0caPb1wSd0AkyU1fP34cm+rW3pS72z1eHDRgMqLOm0vKrZGvLiiPIA9vWKEunsOk3z/4xX7/rZef6MQ8oGpV/81jOnnx07kLUIEsnJxsRsT//cBAdrNyc1IGTidixBufCpd4Bci8z17UKf0DuEwV6Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771431165; c=relaxed/simple;
	bh=iN8SsleU89C8bP3tlDBsZ8cSG+sMiypnZGipWwEwaPo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZDi0FDRaYFe4tWXxLvfZ7nqC3tjq3F2bwmleN2rNNbqxspUzlXGPhCjk5ypBhT4z28c/xWOoXIuEhve3M33qQTyyGaPDuCzb6xztvhiAoGTQ4dIfzhEi7pLYbJQ4PlYb6ClKAZXVk+NYI97E4up7GN8mTROLkXmpR+KSOCcnTKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrQjwzgD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrQjwzgD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346A7C116D0;
	Wed, 18 Feb 2026 16:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771431165;
	bh=iN8SsleU89C8bP3tlDBsZ8cSG+sMiypnZGipWwEwaPo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=nrQjwzgDPJhXTcBOUgYkfc5mk4MWLqL9Zs0lkgOQBFAa+ZaoPjxV6pjdr30o/iKpV
	 Ev1Z3JvXR91L2hkC1zn6TfEY8l2tsePqcKmBNkC4PiT7pkGvtynCqVlK2cYp+9B+cL
	 Rmt6uXKyxEFavxRmB6sVC/vfwrYVrzck4NHo+Yjum0Uu7BpZ4V0dqMMzBC6UMjzDvz
	 OzHvP9vUt8e+NIyQvYOxnYLlJwEyOfWsZIgTIqVr5vEu21oZFs+GOFQ7hd+UqY20fx
	 Ndy7R0smmI9Vjc54ZLCW9bNcDbrrqgRb++KfZu/pREjjoJYy4HcgcsBwBqBzG9zOsy
	 +wU3liemSth6A==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 13964F4006C;
	Wed, 18 Feb 2026 11:12:44 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Wed, 18 Feb 2026 11:12:44 -0500
X-ME-Sender: <xms:--SVaauCInW2A5nOMuW5oLB_hByuyTyFdtnTFygJw3peE3lHzIkqwA>
    <xme:--SVaaQYSnwp-K58xHaCPsXsgCj_h6KDdBRCqhnbcE2UAXO-Y_Yxt6bzFHHmxJsum
    6D5UWDB21_eVtboS9h81ju_eaLs0iVi-e5TlQY4O5VgsqnNF235brE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdeftdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfvehhuhgt
    khcunfgvvhgvrhdfuceotggvlheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpefhffekffeftdfgheeiveekudeuhfdvjedvfedvueduvdegleekgeetgfduhfefleen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegthhhutg
    hklhgvvhgvrhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeifeegleel
    leehledqfedvleekgeegvdefqdgtvghlpeepkhgvrhhnvghlrdhorhhgsehfrghsthhmrg
    hilhdrtghomhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepkhgvrhhnvghlqdhtlhhsqdhhrghnughshhgrkhgvsehlihhsthhsrdhlihhnuh
    igrdguvghvpdhrtghpthhtoheptghhuhgtkhdrlhgvvhgvrhesohhrrggtlhgvrdgtohhm
    pdhrtghpthhtohepohhkohhrnhhivghvsehrvgguhhgrthdrtghomhdprhgtphhtthhope
    hhrghrvgesshhushgvrdguvg
X-ME-Proxy: <xmx:--SVaSXtT6z7d4kMd9ZzoYkTBaO0BNJLmsg_rynT_KmY44fgVAseCw>
    <xmx:_OSVacZEU7psPIhUXA19J_My9Yb3kOssLlGzL6nIgaqHXJuonZ4tZQ>
    <xmx:_OSVaQ1iB-33uFYEWGSxpJvGh-c28z6wQsYqr6e4qDDukpdmPns46Q>
    <xmx:_OSVaWi7zob_1t0HCC6PPaPiL_ngSJx5-dz3W0QsZdbfZAMwk-yGpQ>
    <xmx:_OSVacZOMJ7c4zCzWqjLH2-ZeHTIbnRSMSR9xp8_luMh6qy2NotFlp-h>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E0DF1780075; Wed, 18 Feb 2026 11:12:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AAEVwnKxNJwc
Date: Wed, 18 Feb 2026 11:12:04 -0500
From: "Chuck Lever" <cel@kernel.org>
To: "Hannes Reinecke" <hare@suse.de>,
 "Olga Kornievskaia" <okorniev@redhat.com>
Cc: kernel-tls-handshake@lists.linux.dev,
 "Chuck Lever" <chuck.lever@oracle.com>
Message-Id: <2646cf04-c972-4c1b-a782-00b0d94c603c@app.fastmail.com>
In-Reply-To: <1330bf39-196c-4ef5-8f36-fd407e7e6605@suse.de>
References: <20260217222033.1929211-1-cel@kernel.org>
 <20260217222033.1929211-2-cel@kernel.org>
 <29c55055-a7e9-485a-8290-4f0bc1543a59@suse.de>
 <c4c6ac9f-10d0-45ae-a35d-b1266f7a06d9@kernel.org>
 <1330bf39-196c-4ef5-8f36-fd407e7e6605@suse.de>
Subject: Re: [RFC PATCH 1/4] net: Introduce read_sock_cmsg proto_ops for control
 message delivery
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, Feb 18, 2026, at 10:52 AM, Hannes Reinecke wrote:
> On 2/18/26 15:33, Chuck Lever wrote:
>> On 2/18/26 2:29 AM, Hannes Reinecke wrote:

>>> The way I see it, ->read_sock() has an advantage when you can work
>>> with skbuffs (ie network packets) directly. Then it has the benefit
>>> of being paced with the packets arriving as they do on the network.
>>>
>>> But for TLS this is no longer true; the TLS skbuffs are synthesized
>>> on top of the TCP stream, and the boundary of a TLS skbuff is completely
>>> decoupled from the TCP skbuff (in theory, at least).
>>>
>>> This can result in TLS skbuff stalls when waiting for the remainder
>>> of the TCP data stream to arrive.
>> 
>> An entire TLS Record has to be present before it can be decrypted and
>> passed to the socket consumer. Is that what you mean?
>> 
> Yes. And that makes ->read_sock() a bit pointless (from my POV); looking
> at the network stack the skbuffs are assembled/decoded by the TLS layer,
> only to be converted into skbuffs again for ->read_sock().
> Which seems a bit pointless.

Is this true only of the software kTLS implementation? For
offload, I'd think the decrypted records are placed directly
in the skbs that are handed to consumers.


> But the main point with ->read_sock() is that we can only process
> skbuffs, ie we have to wait for the TLS layer to assemble the entire
> record.
> With recvmsg() we at least have a theoretical choice of returning
> a short read, allowing the code to do something clever in the meantime.

Do you mean that read_sock is always synchronous? Perhaps
judicious construction of the consumer can help there; but
I expect that plain TCP has similar pathologies during, for
instance, a network partition.


> Mind you, that is all conjecture. Might well be that ->read_sock()
> is beneficial for TLS, too. Or, at least, doesn't do any harm.
> It's just that I don't trust the author of the TLS read_sock()
> implementation; his network stack knowledge isn't _that_ great.

Time to get out our measuring sticks, I suppose.


> (Problem is that my performance measurements always ran into
> some obnoxious occasional stall, rendering the entire measurement
> pretty worthless. So I couldn't tell whether the recvmsg()
> implementation delivers a benefit or not)

Generally speaking (ie, hand-wave mode) that kind of stall arises
because the consumer expects it will get another data_ready and the
network layer does not conform with the implementer's expectations.

So I like the read_sock_cmsg design here because with recvmsg,
the CMSG payload can appear in the consumer's data buffer. For
direct I/O, that's bad. We also really don't want to place the
TLS Alerts in page cache pages. With read_sock_cmsg, the CMSG
payload can be efficiently directed to an independent buffer
that is never visible to user space.

And I prefer having a single receive path for both non-TLS and
TLS processing. That's so much less code to deal with.

This approach seems to me to be more architecturally sound.
We just have to get over the implementation bumps IMO. I think
we can certainly examine ->read_sock with software kTLS to see
if there's room for improvement.

-- 
Chuck Lever

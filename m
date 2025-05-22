Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B354270825
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 22 May 2025 04:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747889443; cv=none; b=tfZaNpeKDtjE4fY5O2qjzO2aMlgyEWEf3RDz5PFkUxHBkFhggAfMaXWq9bZD+aarWlp09y7/S8Tcz+v5UiilYeTZ1psVBIFdyrirfr25ZRNjKySzWhskDm7f+dzD7Rkp9fRNN7/ztHW2SPjdA6phf/OdeCYREfB9QOo/O+g6Zyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747889443; c=relaxed/simple;
	bh=JgwDAYEdFKsEg/t6PdiaKKXqbEBoaSeQXuVdu8yxZio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePi1xssAJjqfSsgKakwKuEbrd83i6ROGxHLbAoBkll0GtU3IS7bgELF5VcDAfWJSNYXtUxXFWriXBKZ6v1NpJO0QhkKNF1/dy9egkyXj01RodQcUTF907q7wPFuf4250MNXXNOxcATTmqv8THGV6LXUdpu4lfInSpMOexu6L+zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alistair23.me; spf=pass smtp.mailfrom=alistair23.me; dkim=pass (2048-bit key) header.d=alistair23.me header.i=@alistair23.me header.b=VTzrOh1x; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CiFs8LRP; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alistair23.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alistair23.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alistair23.me header.i=@alistair23.me header.b="VTzrOh1x";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CiFs8LRP"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 6495B1380460;
	Thu, 22 May 2025 00:50:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 22 May 2025 00:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1747889439; x=1747975839; bh=eI3IdKpLwriNQfjzwfvyhbmtZZT6qcu8
	E0PT4sK8ozo=; b=VTzrOh1xYyElIp94X2gtCHpxgA899+tRxhw4xUCaJuD3lVLN
	CkCFkySEuAzN09kUjQ3qCpNsDlqKYoO3BKStNYIfdGad/4cOtTyys3JYf7V1AGWl
	RQjgqjCKQL8k90WREBEjch2L2i4wvAnRglJmGLC1JYNUAE7lIFJk1HFL8Ns3Tnig
	52zTN9cLSIW0poyK8zqRwSpuW0P6b9gV5ZJWAQbyya8CfqKWHSuIqEDlAjKaVJae
	10sinyVOQI+LQXaNcKDKd4AmT1MMLNXgYykDCf15Cg5VvcbcRExU499YFg58TZAd
	dCq1MK2Kd1qZ5/VhNwcNQxG1DM9Apq5xMzKVJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747889439; x=
	1747975839; bh=eI3IdKpLwriNQfjzwfvyhbmtZZT6qcu8E0PT4sK8ozo=; b=C
	iFs8LRPoXY0mOjUBE9WKtBI5CiHZTGqf6r4RVig6hy39kPqGPaViJXmIgTWdLhMZ
	Ntf9P/ziw8qHa2XKEncgmZREYF48yYd5o3CVP6y7CZwFmH6pOuVgsAdofqqXHxD4
	y0hBcBs+qBW1xTtJozC058MM3SxUKMa8cGTgO91Ttw5c46i3HMqDVm7S3D7eqOV3
	ISuN2hAF1L5K5lplizcLgC79XTIK4RL2SbGXPF3cU3keAe6VIaMah+QITfWyBEye
	XO3skh/SgBbVL4FuuYswJEs7saQQuDurU0LHabJy47jHRR+k46VyqN39mD26C2jh
	hbA5d8u1NLT+8twm8LeZA==
X-ME-Sender: <xms:Hq0uaAjyCrlyPx_umaVXcyyAkKRNFUAFWFwD-YNjH-h5siQZjiqFXA>
    <xme:Hq0uaJBZcvZpgyLG1AZbyf9VatlPl5sts9I2bKzBtEAduVtyxwvHuvQ3vzHP2gAf4
    Tr7D1721vqK68cez70>
X-ME-Received: <xmr:Hq0uaIHaRxO5ikmcMmQreO8rJBy39q7zyoa-h3Oj2wLQOclVdRYLSvqEn4-Osq02CQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehtdegucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehf
    hfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhhishhtrghirhcuoegrlhhishhtrg
    hirhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepfffhgeduhedt
    gfejudehveeitdeikefhteejheffheegvddtudevgfdujeeifedvnecuffhomhgrihhnpe
    hgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdpnhgspghrtg
    hpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhuhgtkhdrlhgv
    vhgvrhesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepsggtohguughinhhgsehrvgguhh
    grthdrtghomhdprhgtphhtthhopehhrghrvgesshhushgvrdguvgdprhgtphhtthhopehk
    vghrnhgvlhdqthhlshdqhhgrnhgushhhrghkvgeslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:Hq0uaBRbt1UXysOriduaElKaPiXjY6JJkGACzKzvazGzyBqrMytlxw>
    <xmx:Hq0uaNyDmcXLjNJAinqzxWzI0qI8_daPEBY5b82UfIRUOuNnjxSJlg>
    <xmx:Hq0uaP5oi-a5V8YygsbXpzoB3vuGf24BUFRhTIHdvGdImdXxlobnEg>
    <xmx:Hq0uaKx5der1MNjg9h_VeI0jhcz3l3Jmx_gfjlR7k2hLyr4pu5k9nA>
    <xmx:H60uaESgi44t1LiUKa4I-Li42WqeLFYrHiccWxldSuXS0KBk8r2Ggqi9>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 May 2025 00:50:36 -0400 (EDT)
Message-ID: <a1c5c804-c92d-406f-844a-328c1ed0ac5f@alistair23.me>
Date: Thu, 22 May 2025 14:50:34 +1000
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KeyUpdate Support
To: Chuck Lever <chuck.lever@oracle.com>,
 Benjamin Coddington <bcodding@redhat.com>
Cc: Hannes Reinecke <hare@suse.de>, kernel-tls-handshake@lists.linux.dev
References: <ba83aadd-8a2e-4080-a6b5-bef272fea606@app.fastmail.com>
 <a6488280-54af-4127-adbc-65d0cfaad954@suse.de>
 <f18611d8-08cb-4233-948f-ea9fd50c28de@oracle.com>
 <67CAB54F-B40E-4B9A-A769-B3F298ED86A5@redhat.com>
 <2df731e0-f18d-498b-a343-a96e5d47868c@oracle.com>
Content-Language: en-US
From: Alistair <alistair@alistair23.me>
In-Reply-To: <2df731e0-f18d-498b-a343-a96e5d47868c@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/5/25 00:53, Chuck Lever wrote:
> On 5/21/25 10:50 AM, Benjamin Coddington wrote:
>> On 21 May 2025, at 8:53, Chuck Lever wrote:
>>
>>> On 5/21/25 2:43 AM, Hannes Reinecke wrote:
>>>> On 5/21/25 03:00, Alistair wrote:
>>>>> Currently tlshd uses `fork()` to fork the entire process after the kernel
>>>>> sends a netlink message. tlshd then calls the `tlshd_service_socket()`
>>>>> function from the child process and exits.
>>>>>
>>>>> This provides a high barrier between different handshake requests and
>>>>> ensures everything is freed when a handshake is complete.
>>>>>
>>>>> The problem with the current setup is that it makes it very difficult to
>>>>> share information between `tlshd_service_socket()` and the parent
>>>>> process.
>>>>> For security and system resources that's great, but it has the large down
>>>>> side of not supporting the TLS KeyUpdate.
>>>>>
>>>>> In the future we would like to support the TLS KeyUpdate mechanism, which
>>>>> means we need to maintain the `gnutls_session_t session` information
>>>>> for a
>>>>> connection to allow us to issue a KeyUpdate later on.
>>>>>
>>>>> AFAIK there is no way to re-create the `gnutls_session_t session` so
>>>>> we need
>>>>> to store it somewhere. We could pass it to the kernel and have the kernel
>>>>> pass it back. But `gnutls_session_t session` is gnutls internal state, so
>>>>> it's not fixed size making that tricky to do. Plus it will break if
>>>>> gnutls
>>>>> updates between a handshake and KeyUpdate.
>>>>>
>>>>> The other option is to pass the session data from the child process back
>>>>> to the tlshd parent process. The parent can then store the session data
>>>>> (maybe in a database?) and use it as required.
>>>>>
>>>>> I submitted the first step towards supporting that as a PR [1]. The PR
>>>>> changes the current `fork()` multi-process mechanism to a
>>>>> `g_thread_new()`
>>>>> threading mechanism.
>>>>>
>>>>> In the future this will allow us to maintain the gnutls_session_t session
>>>>> in the parent process, allowing KeyUpdate support. This could also be
>>>>> supported with `fork()` and IPC as well, but that is clunky-ier.
>>>>>
>>>>> My approach [1] hasn't been accepted, so now I'm trying to see what
>>>>> ideas other people have for supporting KeyUpdate?
>>>>>
>>>>> 1: https://github.com/oracle/ktls-utils/pull/95
>>>>>
>>>> Hehe. I knew it would come up.
>>>> The reason we didn't implement it for now is that there's an overlap
>>>> with session reset. In NVMe any error will be causing a session reset,
>>>> which then will trigger a TLS handshake. And, what's more, with secure
>>>> concatenation we even generate a new set of TLS PSKs on every reset.
>>>> All of this is transparent to the upper layers, so they will only see
>>>> a (hopefully short) delay.
>>>> Additionally, with the current in-kernel TLS the connection will be
>>>> reset when the IV values are being changed, which again would trigger
>>>> a reconnect on the NVMe side.
>>>>
>>>> So not that easy.
>>>>
>>>> But if you insist on doing that, why don't you use the keyring to
>>>> store the temporary session key? That is persistent, and required
>>>> to be present for tlshd to work ...
>>> I was about to suggest something similar. Depending on what APIs are
>>> available in (or might be added to) gnuTLS, preserve the session's
>>> metadata in a key ring, and return the key's serial number to the
>>> kernel as part of the handshake result. When requesting a KeyUpdate,
>>> pass that serial number back to tlshd.


Ok, that seems pretty do-able


I'm working on some kernel patches now that start to implement the 
basics of this


>>>
>>> It would help if someone could review gnuTLS to see what is available
>>> now, and start a discussion with that community if we need a capability
>>> or API that doesn't already exist. (Eg: translate a gnutls_session_t
>>> object into a JSON string; translate a JSON string into a
>>> gnutls_session_t object)
>> I believe gnutls_session_{get,set}_data will serialize the session object.
>> It would be trivial to store in a key.
> Oh, very cool.


I didn't see that previously. That does seem to do exactly what we need


>
>
>>> The other aspect of this is that tlshd will have to prevent saved
>>> session state from growing without bound. Probably the kernel will have
>>> to notify tlshd when a session is terminated so that associated saved
>>> session state can be discarded.
> It occurs to me that tlshd doesn't need to be involved in this aspect.
> The kernel can delete a key by serial number when it notices that a
> session has been permanently terminated.


Oh good point. That will help with freeing memory.


Alistair


>
>

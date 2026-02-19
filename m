Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E994031AA96
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 19 Feb 2026 13:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771509563; cv=none; b=QpxsTCbd8uPoXaohVn0ZnoAGwQof1QiLUWqQffD/gnGEWaAJJQQJsBQ9eepRdpl6P56N98IgWiLtY+CHwDaFSoAm9vB7o8FRVVjx+HswqxdtGuIGvK+O1nvmWGMlXOqvrIMaJb0nb9DkBFb7aTQDhMFM4mKmr3aX8mxx2ypWE3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771509563; c=relaxed/simple;
	bh=/Zh/7duqLQtJU9k7Ki6Wite9RkGXoWQXt7rBKvsXCnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rTFknC1SWlTwph1NZdAFIbrqjSPOihzZ9i+Hvm/DwKA16JpI49HsbDVxDUskNGUak4EtMDz9vdpnN0Vp4BLLZcn6WYYWvvqccP4GMM342i12mPSpjw9/9Mbq6Uimys67gn0jYd0hE+c0KhT6EiEHVSS4gadBsvSn8JfF5U7Jn2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikNRWMER; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikNRWMER"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305B6C4CEF7;
	Thu, 19 Feb 2026 13:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771509562;
	bh=/Zh/7duqLQtJU9k7Ki6Wite9RkGXoWQXt7rBKvsXCnw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ikNRWMERZL+gzv1tvgiKkSRbFoRVTvGILLpRR1NDiVHiAxHukU59TqzoZ7acW8VhL
	 rSIEdZ3WUcqHDSKpb/V+fhnb/YIl066XeDc0j86dyCZAFzChIEABLecJh5HrrbB1cD
	 auDPi3vHcdiohnO8I7Dg85+mi0Y7jLYIwOU0ILONH+VcyLS7F/anrEb608wSAMZDAD
	 ++SlRLhtigKYoyP0Oy/Zb3RaJzthpXZT9Oe3GnQbD25pLSRrsRm5Mpys3oC8jDXwaH
	 /LqiaPOTDtu1HfF+4NQSGM83ANEWcoTb+T/2QFBh0OiiLjC6oxvh8a490K5POhXSHz
	 N/+oThFahjoPg==
Message-ID: <764ae08e-2e7f-4c25-a78b-824b024f6f81@kernel.org>
Date: Thu, 19 Feb 2026 08:59:20 -0500
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] net: Introduce read_sock_cmsg proto_ops for
 control message delivery
To: Hannes Reinecke <hare@suse.de>, Olga Kornievskaia <okorniev@redhat.com>
Cc: kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
References: <20260217222033.1929211-1-cel@kernel.org>
 <20260217222033.1929211-2-cel@kernel.org>
 <29c55055-a7e9-485a-8290-4f0bc1543a59@suse.de>
 <c4c6ac9f-10d0-45ae-a35d-b1266f7a06d9@kernel.org>
 <1330bf39-196c-4ef5-8f36-fd407e7e6605@suse.de>
 <2646cf04-c972-4c1b-a782-00b0d94c603c@app.fastmail.com>
 <bf17b852-06db-4b2e-82a9-c6173adf761c@suse.de>
Content-Language: en-US
From: Chuck Lever <cel@kernel.org>
Organization: kernel.org
In-Reply-To: <bf17b852-06db-4b2e-82a9-c6173adf761c@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/19/26 3:10 AM, Hannes Reinecke wrote:
> On 2/18/26 17:12, Chuck Lever wrote:
>>
>>
>> On Wed, Feb 18, 2026, at 10:52 AM, Hannes Reinecke wrote:
>>> On 2/18/26 15:33, Chuck Lever wrote:
>>>> On 2/18/26 2:29 AM, Hannes Reinecke wrote:
>>
>>>>> The way I see it, ->read_sock() has an advantage when you can work
>>>>> with skbuffs (ie network packets) directly. Then it has the benefit
>>>>> of being paced with the packets arriving as they do on the network.
>>>>>
>>>>> But for TLS this is no longer true; the TLS skbuffs are synthesized
>>>>> on top of the TCP stream, and the boundary of a TLS skbuff is
>>>>> completely
>>>>> decoupled from the TCP skbuff (in theory, at least).
>>>>>
>>>>> This can result in TLS skbuff stalls when waiting for the remainder
>>>>> of the TCP data stream to arrive.
>>>>
>>>> An entire TLS Record has to be present before it can be decrypted and
>>>> passed to the socket consumer. Is that what you mean?
>>>>
>>> Yes. And that makes ->read_sock() a bit pointless (from my POV); looking
>>> at the network stack the skbuffs are assembled/decoded by the TLS layer,
>>> only to be converted into skbuffs again for ->read_sock().
>>> Which seems a bit pointless.
>>
>> Is this true only of the software kTLS implementation? For
>> offload, I'd think the decrypted records are placed directly
>> in the skbs that are handed to consumers.
>>
>>
>>> But the main point with ->read_sock() is that we can only process
>>> skbuffs, ie we have to wait for the TLS layer to assemble the entire
>>> record.
>>> With recvmsg() we at least have a theoretical choice of returning
>>> a short read, allowing the code to do something clever in the meantime.
>>
>> Do you mean that read_sock is always synchronous? Perhaps
>> judicious construction of the consumer can help there; but
>> I expect that plain TCP has similar pathologies during, for
>> instance, a network partition.
>>
>>
>>> Mind you, that is all conjecture. Might well be that ->read_sock()
>>> is beneficial for TLS, too. Or, at least, doesn't do any harm.
>>> It's just that I don't trust the author of the TLS read_sock()
>>> implementation; his network stack knowledge isn't _that_ great.
>>
>> Time to get out our measuring sticks, I suppose.
>>
>>
>>> (Problem is that my performance measurements always ran into
>>> some obnoxious occasional stall, rendering the entire measurement
>>> pretty worthless. So I couldn't tell whether the recvmsg()
>>> implementation delivers a benefit or not)
>>
>> Generally speaking (ie, hand-wave mode) that kind of stall arises
>> because the consumer expects it will get another data_ready and the
>> network layer does not conform with the implementer's expectations.
>>
> Naa. Tested that one. I've seen stalls affecting _all_ queues at
> the same time, in regular intervals spaced with the power of 2.
> Current reasoning is HW-based LLDP frames handling.
> 
>> So I like the read_sock_cmsg design here because with recvmsg,
>> the CMSG payload can appear in the consumer's data buffer. For
>> direct I/O, that's bad. We also really don't want to place the
>> TLS Alerts in page cache pages. With read_sock_cmsg, the CMSG
>> payload can be efficiently directed to an independent buffer
>> that is never visible to user space.
>>
>> And I prefer having a single receive path for both non-TLS and
>> TLS processing. That's so much less code to deal with.
>>
>> This approach seems to me to be more architecturally sound.
>> We just have to get over the implementation bumps IMO. I think
>> we can certainly examine ->read_sock with software kTLS to see
>> if there's room for improvement.
>>
> And that, I guess, is the real argument. We've seen with the
> recent TLS alert CVE that posting TLS messages in the recvmsg
> payload is a _bad_ idea, as this puts far too many restrictions
> on the format of the message.
> 
> So you see me convinced. I'll give it a go to convert nvme-tcp.

Some exploration of the code base has shown me the realities of
the concerns you raised above. I'm going to try to address those
before pushing forward with read_sock_cmsg. Stand by ...


-- 
Chuck Lever

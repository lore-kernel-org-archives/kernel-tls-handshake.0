Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9011427C866
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Feb 2026 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771425213; cv=none; b=Zyq5xlPtJjge6CkrF3IwGZ5fjg5zGsTY+/zxzRnynnQqQDY6Vxi3pq9T9Rsq6zj4/HaCXBLHet9ptqpNFSZA4f8Zl/ZcfCqu1cf6uC1lQMuWkvJ686cVXwkDQTMCurGTJkIumE3Myc0tn6O40c0zGG3Cx8/8A8W6bKwPrW0SuYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771425213; c=relaxed/simple;
	bh=7T7JqSjVNrQl5rddlzc6OY5P5e9uT7RQxz/fo8LlrNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKAK8YIUnPiSXbFJGIrWYN1i0RFGFjnv6Q3jmBxMUuanJdUIgZy0mlVcLR6Tf0FJawIDJ0rIRThczPFiTGAMIbUboLoxjBxwtr2mMTAEhyDl52rsOBb89H5aBojAlwwCKT9SevpxDcTICILv5GR76mxuPCUK//hymP45or4X494=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjaIZpcc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjaIZpcc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D96C116D0;
	Wed, 18 Feb 2026 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771425213;
	bh=7T7JqSjVNrQl5rddlzc6OY5P5e9uT7RQxz/fo8LlrNg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tjaIZpccbYkhaLqHG+3f+8SyYJ21EL/CAo2d9F+WI1VtQt0/8YjP0bS6mzGFXBbyI
	 +WHEBliOntR1KNgQtKQ9AKm1urDtNiTcyGWoBAQS+XKedFwDYF8nl466jQdYN51dYY
	 WCiR9mFmTp2J83Ubd3C1NGnSfK0W44aqs1QCmzBY1m2h9rJGg2TKuvGFRhmafdII4/
	 ncNqzKiETvhXOyh9g3hLAkAg0GBkL4hjZThNyKEiWv+t2cOYSSjRbfrcXWtGpVLnd1
	 uCdyEX66pexxGM6pGY8/3Jss2A1J3bDSkQhuchSyLhW+mHkGev/2ZDdSYn0eZlsVem
	 1LWu+cRL5bo4A==
Message-ID: <c4c6ac9f-10d0-45ae-a35d-b1266f7a06d9@kernel.org>
Date: Wed, 18 Feb 2026 09:33:31 -0500
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
Content-Language: en-US
From: Chuck Lever <cel@kernel.org>
Organization: kernel.org
In-Reply-To: <29c55055-a7e9-485a-8290-4f0bc1543a59@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/18/26 2:29 AM, Hannes Reinecke wrote:
> On 2/17/26 23:20, Chuck Lever wrote:
>> From: Chuck Lever <chuck.lever@oracle.com>
>>
>> Kernel TCP consumers that use the read_sock interface
>> (proto_ops.read_sock) cannot receive TLS control messages (Alerts,
>> Handshake records) when kTLS is active. The current
>> tls_sw_read_sock() method rejects non-data records with -EINVAL, and
>> the sk_read_actor_t callback has no channel for delivering record-
>> type metadata.
>>
>> Four kernel subsystems are affected: NFSD (sunrpc svcsock), NFS
>> client (sunrpc xprtsock), NVMe target (nvmet-tcp), and NVMe host
>> (nvme-tcp). Each of these either falls back to the slower
>> sock_recvmsg() API or lacks TLS alert handling entirely.
>>
> And that is the contentious topic.
> Is it really slower?

I measured 5-10% throughput increases and latency drops with NFSD,
/without/ TLS. The primary benefit of this series is that it handles
CMSG (TLS Alerts) much more cleanly.


> The way I see it, ->read_sock() has an advantage when you can work
> with skbuffs (ie network packets) directly. Then it has the benefit
> of being paced with the packets arriving as they do on the network.
> 
> But for TLS this is no longer true; the TLS skbuffs are synthesized
> on top of the TCP stream, and the boundary of a TLS skbuff is completely
> decoupled from the TCP skbuff (in theory, at least).
> 
> This can result in TLS skbuff stalls when waiting for the remainder
> of the TCP data stream to arrive.

An entire TLS Record has to be present before it can be decrypted and
passed to the socket consumer. Is that what you mean?


> So for TLS I _think_ it's beneficial to use recvmsg, as there you have
> the full set of options available.
> 
> And actually I have a patch switching nvme over to recvmsg(), but that
> has stalled due to precisely this question: read_sock() inherently
> faster than recvmsg? Or is that just the perception (we are closer
> to the hardware, so it _must_ be faster)?
> 
> (Speaking as the author of the ->read_sock() callback for TLS.
> I never really liked it ;-)
> 
> Cheers,
> 
> Hannes


-- 
Chuck Lever

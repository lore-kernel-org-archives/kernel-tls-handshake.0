Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD06B54654
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 19 Feb 2026 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771488616; cv=none; b=u+K08xBwizldqZM9AML++7qw1V0bFVSXhX3FLJGpnsEzjuvsCoVYqmd/WDbqNQWcdr7k0UZZt97WOXbBH6macv64gwigqagwL7qKKpO5WMUOi+xPPRv3AJQkl5VMdXh9uJvpggazTg1O+COQC10UcNUDxQrXzT9q7OjrAlOR7Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771488616; c=relaxed/simple;
	bh=5EY1gRC1nyVcoQ19GyentFYFnqANG4lVYOPwzvQxskw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBzkx7ItlP8M+I07yfc5fEHTIM7eTxhxLLZvzGW/L/iUaqBBg6vy3U3NCrby4IaL/m99L4NT8skdnaUlqZCV/Skx5Axz+Jfb9T+MUBxWefZYNgLQMdpaexYUBZIcR5T+0Bv0+29K+TP4l2QSfuK0dpIexwQFQULXSxLbIQOh+ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yt3BpUtb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eNOiE/mk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yt3BpUtb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eNOiE/mk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yt3BpUtb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eNOiE/mk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yt3BpUtb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eNOiE/mk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1CAB35BCC3;
	Thu, 19 Feb 2026 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771488613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWg2Whs0RAEd4ooO1BOrxGcUDhdb5Rl59vAGMArXRJE=;
	b=yt3BpUtb0ehTGuKdM6BwgId5ee/OtH4d449bERas/WxRLIDlub0cmIFwpTgoFgPY2qIPR5
	5RQh61CJo90HgYimEpr2ApySz9qB/8iQaA7o4rItZ4FQIwrufPEt21hSGj8IpU1Eif/BK3
	BLMDW8WWxPGzljgpO4TgObGibk4hrbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771488613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWg2Whs0RAEd4ooO1BOrxGcUDhdb5Rl59vAGMArXRJE=;
	b=eNOiE/mk2u2tUoOFzKW+iCNFsNzzoKAHenOPDtBeW8mzA1GIC511oT+yNKbYnZp8iRdvyc
	VlEyH2MFXttbVlBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771488613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWg2Whs0RAEd4ooO1BOrxGcUDhdb5Rl59vAGMArXRJE=;
	b=yt3BpUtb0ehTGuKdM6BwgId5ee/OtH4d449bERas/WxRLIDlub0cmIFwpTgoFgPY2qIPR5
	5RQh61CJo90HgYimEpr2ApySz9qB/8iQaA7o4rItZ4FQIwrufPEt21hSGj8IpU1Eif/BK3
	BLMDW8WWxPGzljgpO4TgObGibk4hrbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771488613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWg2Whs0RAEd4ooO1BOrxGcUDhdb5Rl59vAGMArXRJE=;
	b=eNOiE/mk2u2tUoOFzKW+iCNFsNzzoKAHenOPDtBeW8mzA1GIC511oT+yNKbYnZp8iRdvyc
	VlEyH2MFXttbVlBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE0DD3EA65;
	Thu, 19 Feb 2026 08:10:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P/xfNGTFlmlUWAAAD6G6ig
	(envelope-from <hare@suse.de>); Thu, 19 Feb 2026 08:10:12 +0000
Message-ID: <bf17b852-06db-4b2e-82a9-c6173adf761c@suse.de>
Date: Thu, 19 Feb 2026 09:10:12 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] net: Introduce read_sock_cmsg proto_ops for
 control message delivery
To: Chuck Lever <cel@kernel.org>, Olga Kornievskaia <okorniev@redhat.com>
Cc: kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
References: <20260217222033.1929211-1-cel@kernel.org>
 <20260217222033.1929211-2-cel@kernel.org>
 <29c55055-a7e9-485a-8290-4f0bc1543a59@suse.de>
 <c4c6ac9f-10d0-45ae-a35d-b1266f7a06d9@kernel.org>
 <1330bf39-196c-4ef5-8f36-fd407e7e6605@suse.de>
 <2646cf04-c972-4c1b-a782-00b0d94c603c@app.fastmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <2646cf04-c972-4c1b-a782-00b0d94c603c@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 

On 2/18/26 17:12, Chuck Lever wrote:
> 
> 
> On Wed, Feb 18, 2026, at 10:52 AM, Hannes Reinecke wrote:
>> On 2/18/26 15:33, Chuck Lever wrote:
>>> On 2/18/26 2:29 AM, Hannes Reinecke wrote:
> 
>>>> The way I see it, ->read_sock() has an advantage when you can work
>>>> with skbuffs (ie network packets) directly. Then it has the benefit
>>>> of being paced with the packets arriving as they do on the network.
>>>>
>>>> But for TLS this is no longer true; the TLS skbuffs are synthesized
>>>> on top of the TCP stream, and the boundary of a TLS skbuff is completely
>>>> decoupled from the TCP skbuff (in theory, at least).
>>>>
>>>> This can result in TLS skbuff stalls when waiting for the remainder
>>>> of the TCP data stream to arrive.
>>>
>>> An entire TLS Record has to be present before it can be decrypted and
>>> passed to the socket consumer. Is that what you mean?
>>>
>> Yes. And that makes ->read_sock() a bit pointless (from my POV); looking
>> at the network stack the skbuffs are assembled/decoded by the TLS layer,
>> only to be converted into skbuffs again for ->read_sock().
>> Which seems a bit pointless.
> 
> Is this true only of the software kTLS implementation? For
> offload, I'd think the decrypted records are placed directly
> in the skbs that are handed to consumers.
> 
> 
>> But the main point with ->read_sock() is that we can only process
>> skbuffs, ie we have to wait for the TLS layer to assemble the entire
>> record.
>> With recvmsg() we at least have a theoretical choice of returning
>> a short read, allowing the code to do something clever in the meantime.
> 
> Do you mean that read_sock is always synchronous? Perhaps
> judicious construction of the consumer can help there; but
> I expect that plain TCP has similar pathologies during, for
> instance, a network partition.
> 
> 
>> Mind you, that is all conjecture. Might well be that ->read_sock()
>> is beneficial for TLS, too. Or, at least, doesn't do any harm.
>> It's just that I don't trust the author of the TLS read_sock()
>> implementation; his network stack knowledge isn't _that_ great.
> 
> Time to get out our measuring sticks, I suppose.
> 
> 
>> (Problem is that my performance measurements always ran into
>> some obnoxious occasional stall, rendering the entire measurement
>> pretty worthless. So I couldn't tell whether the recvmsg()
>> implementation delivers a benefit or not)
> 
> Generally speaking (ie, hand-wave mode) that kind of stall arises
> because the consumer expects it will get another data_ready and the
> network layer does not conform with the implementer's expectations.
> 
Naa. Tested that one. I've seen stalls affecting _all_ queues at
the same time, in regular intervals spaced with the power of 2.
Current reasoning is HW-based LLDP frames handling.

> So I like the read_sock_cmsg design here because with recvmsg,
> the CMSG payload can appear in the consumer's data buffer. For
> direct I/O, that's bad. We also really don't want to place the
> TLS Alerts in page cache pages. With read_sock_cmsg, the CMSG
> payload can be efficiently directed to an independent buffer
> that is never visible to user space.
> 
> And I prefer having a single receive path for both non-TLS and
> TLS processing. That's so much less code to deal with.
> 
> This approach seems to me to be more architecturally sound.
> We just have to get over the implementation bumps IMO. I think
> we can certainly examine ->read_sock with software kTLS to see
> if there's room for improvement.
> 
And that, I guess, is the real argument. We've seen with the
recent TLS alert CVE that posting TLS messages in the recvmsg
payload is a _bad_ idea, as this puts far too many restrictions
on the format of the message.

So you see me convinced. I'll give it a go to convert nvme-tcp.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441466FDC
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 27 Feb 2023 15:01:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 61E831FD65;
	Mon, 27 Feb 2023 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677510077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2RCBqtAC4Kl9Be90LdqYxngHdQxL+pkaXQ9dfi1z7uk=;
	b=HyvFBV0LKQ1mXfwJ6kXvHbnPX54h2eG71e2RFtQ/e/ZxrPiqW7p1ZA9kYQfs6MmsMkpWyS
	ZY1ODSNhRcjix0xvVB9L5/Mu7w4TVAU193wTVb/0Rg4ZDrbYCsYuQqPEKTkIbmuBillxha
	DRUg77aWs58dX7MEWADMMtvUBBDNNE4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677510077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2RCBqtAC4Kl9Be90LdqYxngHdQxL+pkaXQ9dfi1z7uk=;
	b=WPGaC3DTbjVBsNC/FE011++ux5727XhmTOelaVFE/cADM/VV2OFvYnnVnCk3+PyaPg0B1E
	kJPfIol5iuBWYXBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5756D13A43;
	Mon, 27 Feb 2023 15:01:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id urIWFb3F/GPXGgAAMHmgww
	(envelope-from <hare@suse.de>); Mon, 27 Feb 2023 15:01:17 +0000
Message-ID: <9e5fbf9a-f3e9-6067-821d-b343c3170851@suse.de>
Date: Mon, 27 Feb 2023 16:01:17 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: new netlink attributes - thoughts
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>
References: <6B769C89-B427-48ED-A20A-E96D13B8FA8E@oracle.com>
 <06d4da85-3802-781f-c886-21ae6141e6a7@suse.de>
 <4B4C7760-3634-44FD-BEDD-23A21C421AB7@oracle.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <4B4C7760-3634-44FD-BEDD-23A21C421AB7@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/23 15:44, Chuck Lever III wrote:
> 
> 
>> On Feb 27, 2023, at 2:35 AM, Hannes Reinecke <hare@suse.de> wrote:
>>
>> On 2/21/23 23:32, Chuck Lever III wrote:
>>> Thanks for the broad conversation during this morning's call.
>>> We're now using netlink to handle the interactions between the kernel
>>> and handshake agents (eg, tlshd), replacing the old listen/poll/
>>> accept/close mechanism.
>>> Before asking netdev to merge the handshake upcall mechanism, I'd like
>>> the netlink protocol to be stable. The protocol is extensible, but
>>> because it comprises an API contract between the kernel and user space,
>>> we should strive to minimize any significant changes once it has been
>>> merged into the kernel.
>>> For those who are not familiar with netlink:
>>> - A netlink operation is simply a remote procedure call.
>>> - An attribute is simply an argument or result data item within a
>>>    netlink operation.
>>> Aside from the attributes that contain the socket file descriptor and
>>> the status of the session, there are three more recent additions that
>>> we need to close on.
>>> 1. remote-peerid
>>> The DONE netlink operation now carries the key serial number of a key
>>> that contains the remote peer's identity. The content of that key can
>>> be an x.509 certificate or another form of peer identity.
>>> I'd like to make this into an attribute that can appear more than once
>>> in the DONE reply, since more than one identity can be passed during a
>>> handshake negotiation.
>>> This information would then be passed back to the kernel consumer who
>>> requested the handshake so that it can make security policy decisions
>>> based on the remote's identity.
>> I'm all for the attribute method; we should keep the number of static (ie non-attribute) content as small as possible to allow for easier protocol updates in future versions.
>>
>> The multi-identity issue seems to be less pressing, as every implementation I've looked at only supports a single identity.
>>
>> But having only a single identity means that we need to distinguish (at least) three status cases in the DONE call:
>> - OK
>> - Identity rejected
>> - Failure
>> As the caller might wish to retry with another identification.
> 
> The DONE call now returns an errno status. We can define as many
> particular failure modes as we like.
> 
Sure. But we need to specify which error type is returned under which 
circumstance.
Also cf my comments to the patchset; might be an idea to return the 
positive errno number, not the negative one (seeing that the attribute 
is u32 ...)

> 
>>> 3. keyring
>>> The idea is to have a private keyring that the handshake agent and the
>>> user requesting the session would use to share certificates, PSKs, and
>>> bundles.
>>> Hannes suggested passing that keyring's serial to the handshake agent,
>>> to have it link that keyring into its own session keyring.
>>> It might be a bit more secure if the kernel links that keyring into the
>>> handshake agent's session keyring as part of the ACCEPT operation.
>> Good point.
>> Question, though:
>> Session, thread, or process keyring?
>> I would opt for the process keyring, as that would match the internal
>> design of tlshd and would (in theory) allow to have different keyrings for each ACCEPT
>>
>>> We might also specify the name of a keyring containing other additional
>>> shared items, via /etc/tlshd.conf. That's outside the realm of netlink
>>> attributes, though.
>> Not quite. We could keep the 'keyring' attribute for the netlink interface, and allow
>> it to be specified by the REQUEST call.
>> The kernel part would then link/use that keyring for their internal lookup.
> 
> If tlshd links in any keyrings that might be mentioned in /etc/tlshd.conf,
> I'm not sure the kernel needs to take any action?
> 
True.

We could clarify that the kernel should always use the process keyring 
to lookup keys, thereby requiring that any other keyrings will need to 
be linked into the process keyring prior to lookup.

> 
>> Another issue when dealing with keyrings and keys in general:
>> Should we aim for specific types, or should we stay with the generic 'user' type?
> 
> I played with using an asymmetric key type for the x509 certificates. The
> problem is that the kernel's asymmetric key support wants to parse the
> key into a data structure; it doesn't actually save the certificate itself.
> 
> We need to preserve the certificate because that is then handed back to
> user space to do the handshake. So we are forced to use a key type that
> does not adulterate its content.
> 
Thought so. But as that's the case: shouldn't we add an attribute for 
the keytype, too?

Cheers,

Hannes


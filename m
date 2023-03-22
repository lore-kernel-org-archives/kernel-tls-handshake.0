Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70E72566
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 12:17:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 30B4920D64;
	Wed, 22 Mar 2023 12:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679487473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P4rDeTivCil3tq7Ntmi0KqDoXC5pOw4dkb/DqL98rEg=;
	b=TpG98vwRN/Qp3oAMf9/wDeKcgzlU89eklw2fUZk+NTkODfWd6p19I+u0hZS5YAWa4avAf1
	1wt900JAwqR5qOwCgVzBNDfK5FgPNTxQFJCxlNtzAMYKs2lUjvroQmgo/9UTFwdzEXYukT
	jdip6jbsUYOr2MyVKjFKWwvmMP9xUvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679487473;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P4rDeTivCil3tq7Ntmi0KqDoXC5pOw4dkb/DqL98rEg=;
	b=pWwaCewHBf182yAFq0FxtLyMOupEvUyut5nEZb0EVzqKmajn0rYhA/cSkQDPZflAyJ0MWT
	qY0VDl6kGdjEpLCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1DEE6138E9;
	Wed, 22 Mar 2023 12:17:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OWNiBvHxGmR9VAAAMHmgww
	(envelope-from <hare@suse.de>); Wed, 22 Mar 2023 12:17:53 +0000
Message-ID: <0a8061ca-9c44-cae5-aab4-fd3222f372bd@suse.de>
Date: Wed, 22 Mar 2023 13:17:52 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 11/18] nvme-tcp: control message handling for recvmsg()
Content-Language: en-US
To: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>,
 "boris.pismenny@gmail.com" <boris.pismenny@gmail.com>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-12-hare@suse.de>
 <0be88516-8e29-a1a5-f0ff-204830c0fba5@grimberg.me>
 <cd37b4a7-41e7-b142-e87d-908a2e7bcfc7@suse.de>
 <0cfcab69-c4a1-2072-a85b-12c5a087db58@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <0cfcab69-c4a1-2072-a85b-12c5a087db58@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/22/23 12:50, Sagi Grimberg wrote:
> 
>>>> kTLS is sending TLS ALERT messages as control messages for recvmsg().
>>>> As we can't do anything sensible with it just abort the connection
>>>> and let the userspace agent to a re-negotiation.
>>>
>>> Is this a problem if we do end up adding read_sock to tls?
>>> Although I do see that the tls code does manage this in the
>>> sk_buff control buffer, so I assume there is access to this info.
>>>
>>> CC'ing Boris here as well.
>>>
>> Yeah, that was the other reason; cmsg aka TLS alerts are only 
>> available for recvmsg().
>>
>> However, for TLS 1.3 the only TLS alert which does not trigger a 
>> connection reset would the the ominous 'new session ticket' alert.
>> But during TLS handshake development we already decided to _disable_
>> session tickets as they are pretty meaningless for our us.
>> Consequently all TLS alerts will trigger a connection reset, and 
>> realistically we don't _need_ to know which alert type has triggered
>> the reset.
>>
>> So 'read_sock()' could be implemented by closing the connection on
>> any TLS alert, and not giving us access to any of the alerts via
>> control messages. If that makes life easier ...
> 
> Most likely read_sock() is the wrong place to ignore alerts. Probably
> the better way is to do this in nvme, although its a bit harder.

But that's just the point; you don't have OOB information for 
read_sock(). So I wouldn't know how you could pass the TLS alert 
messages. Hence my idea of converting them into a connection reset for 
read_sock().
As the whole idea of using ktls is that you do _not_ have to handle TLS 
details, it's questionable what exactly one could do here except from 
resetting the connection...

Cheers,

Hannes


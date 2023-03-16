Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB92133CC
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Mar 2023 13:40:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DE08921A3B;
	Thu, 16 Mar 2023 13:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678974020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hrYlUMQCbpans00Sd5RWfbQDvemxxjZaMDVaQI/+/9o=;
	b=vshTU757aPNH67YTO+j/w2hdfg+Tgi1E+bPp8g6c+g254B98ZFu8E75RRm6X/1At2kxGLA
	fLUj06lZFWPGksgCgqbFXL0Z33o1UQhmfowjpXjosXOL+Foimo7/vjVslkWmxnrhdW43Pf
	YBnEuK4kLJnO0ObJ29lVCMhi11tBg/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678974020;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hrYlUMQCbpans00Sd5RWfbQDvemxxjZaMDVaQI/+/9o=;
	b=xQNRnGNt2gGk7GA4mq51IT5ui4zfoCD3pvCSgUzMiU32iDTQC+dRiwgRp2KvdwV4B4JwTh
	wqce+zuD3/ja8RAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C4A29133E0;
	Thu, 16 Mar 2023 13:40:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id RJFVLkQcE2S8TgAAMHmgww
	(envelope-from <hare@suse.de>); Thu, 16 Mar 2023 13:40:20 +0000
Message-ID: <df87dd51-4e21-9447-d064-eba4f67ad35f@suse.de>
Date: Thu, 16 Mar 2023 14:40:20 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: sk_data_ready callback restore
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>
References: <7464fd83-7cfa-d075-71a4-6ff6ed73529d@suse.de>
 <21D9A8DF-9A7D-4DC9-98A8-D50A06A548EF@oracle.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <21D9A8DF-9A7D-4DC9-98A8-D50A06A548EF@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/23 14:35, Chuck Lever III wrote:
> 
> 
>> On Mar 16, 2023, at 7:26 AM, Hannes Reinecke <hare@suse.de> wrote:
>>
>> Hi Chuck,
>>
>> some good news; my prototype is up and running and seems to be happy with the infrastructure:
>>
>> nvme nvme0: connecting queue 0
>> nvme nvme0: queue 0: start TLS with key 389e6cd5 keyring 23836d8b
>> nvmet_tcp: queue 0 hdr type 22 hlen 1 plen 33554719 size 128
>> nvmet_tcp: queue 0: TLS ServerHello
>> nvmet_tcp: queue 0 wakeup userspace
>> nvme nvme0: queue 0: TLS handshake done, key 389e6cd5, status 0
>> nvmet_tcp: queue 0: TLS handshake done, key 389e6cd5, status 0
>>
>> but there's one question: in order to get this to work I had to
>> set the sk_data_ready() callback before starting the TLS handshake.
>>
>> queue->data_ready = sk->sk_data_ready;
>> sk->sk_data_ready = nvmet_tcp_tls_data_ready;
>>
>> That works, but it's getting tricky once the TLS handshake is done.
>> Naively I would have thought that I need to reset the sk_data_ready()
>> callback
>>
>> sk->sk_data_ready = queue->data_ready;
>> queue->data_ready = NULL;
>>
>> But as I'm paranoid I've check whether I'll be resetting the correct
>> sk_data_ready() callback:
>>
>> WARN_ON(sk->sk_data_ready != nvmet_tcp_tls_data_ready);
>>
>> before resetting.
>> And, surprise, surprise, that WARN_ON triggers.
>> Probably understandable, as kTLS is changing the callbacks, too.
> 
> Socket callbacks form a chain. Each module wanting a callback
> saves the callback function value, then updates the socket's
> callback function pointer to point to its callback.
> 
> Then, when it's data_ready callback function is invoked, it
> calls the saved callback function first, then does whatever
> it needs to do, and returns.
> 
Yes, understood; that's what my prototype does.

> 
>> Leaving the question: how do I _disable_ my sk_data_ready() callback?
>> Just blindly reassigning the original callback clearly is not a good idea, but doing nothing would mean that my callback will be left in place during the entire connection, which also is not a good idea.
>> So what is the correct way of disabling the callback?
> 
> The way I've done it is to add an atomic flag that is set
> only during handshakes. When RPC's sk_data_ready callback
> function is called, if that flag is set, just call the
> saved callback and then return immediately without
> doing any RPC receive processing.
> 
Which is what I ended up doing; it felt slightly odd as 'normal' 
programming rules would imply that any action you do should be reverted 
once you're done.
Which doesn't work here, as essentially it's impossible to restore
the callback.

But if that's the way it should be I'm fine.
Just wanted to clarify.

Cheers,

Hannes


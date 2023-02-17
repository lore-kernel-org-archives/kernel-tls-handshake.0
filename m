Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AAD6AA0
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 12:36:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 58ACD1FF48;
	Fri, 17 Feb 2023 12:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676637401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3RBKoPxN00qfgDmO433IuVFiMbk8dROoJEC2ulAfCXQ=;
	b=wtjstZdniFbFa/4cHobpgx4AzVj8ebax+lmma/NpSBRd2zRTBOY4X/ws5cslYjizRlNb4G
	hw1WzBxucJY7GZLa+NiWdSo+qT+L3CXfQSH7VqZczowgyYclCtL46mp/RZS/acBHfYxalN
	Y+25lXcJrN+EDew19IuwGYkscnxGgrA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676637401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3RBKoPxN00qfgDmO433IuVFiMbk8dROoJEC2ulAfCXQ=;
	b=KirnrWUd4FEfh12W02ZG+GZwbuZk5d1B6OXPlWszV68HZyJ91yeZ4mfqFBDEEgd9lcjK03
	eEmqwI4D0twKlmBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E44F13274;
	Fri, 17 Feb 2023 12:36:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id /NrNEtl072MqagAAMHmgww
	(envelope-from <hare@suse.de>); Fri, 17 Feb 2023 12:36:41 +0000
Message-ID: <9e7b5dad-0afe-f839-eb13-ce8b4fc1dce8@suse.de>
Date: Fri, 17 Feb 2023 13:36:41 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/4] tls-handshake: add 'timeout' netlink attribute
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>
References: <20230217113145.18916-1-hare@suse.de>
 <20230217113145.18916-2-hare@suse.de>
 <DAF4B451-D056-4309-BDA5-5C20D38A3121@oracle.com>
 <c206b986-0989-6b09-e7a3-24147803ee37@suse.de>
 <5FB819A0-65F0-4DA0-A748-3380D88F97F5@oracle.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <5FB819A0-65F0-4DA0-A748-3380D88F97F5@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/17/23 13:26, Chuck Lever III wrote:
> 
> 
>> On Feb 17, 2023, at 7:17 AM, Hannes Reinecke <hare@suse.de> wrote:
>>
>> On 2/17/23 12:58, Chuck Lever III wrote:
>>>> On Feb 17, 2023, at 6:31 AM, Hannes Reinecke <hare@suse.de> wrote:
>>>>
>>>> Add a 'timeout' netlink attribute to the 'request' netlink
>>>> message to allow the kernel to communicate an internal timeout
>>>> to userspace.
>>> Can you describe the use caae?
>>> I'm not clear on why we need to parametrize the handshake
>>> timeout. Why would it need to be changed? Why would, say,
>>> a PSK handshake need a different timeout than x.509? And,
>>> why doesn't a timeout wait in the API consumer work just
>>> as well?
>>> Last we left this, you were using the timeout to work
>>> around some socket reference counting issues. I think we
>>> need to address those first.
>> The problem is that we have have a timeout on the kernel side, and another timeout on the userland side.
>> This is primarily an issue for the client, as the kernel code
>> needs to continue _eventually_, otherwise the connection will
>> stall.
>> So we do need a timeout for the client to ensure forward progress.
>> Hence the kernel client needs a timeout to eventually declare the handshake
>> non-functional and either abort or retry without TLS.
>>
>> But as the kernel now has a timeout, that would need to be transported
>> to userland to tell the application to stop trying after a certain time.
>> Which is what this parameter does.
>>
>> The alternative would be to kill the application directly from the kernel
>> (or send some other signal), but that's really nasty and then we would need
>> to worry about cleanup effects. Hence I'd rather not.
> 
> Actually IMO this is a cleaner overall approach. The cleanup
> here would be the same as if the handshake agent crashed, and
> that needs to work properly. It also needs to work if the
> user driving the application handshake request is signaled
> (system shutting down, user hit ^C, etc).
> 

True.

>> This approach has the benefit that the kernel can wait slightly longer
>> than the timeout sent to userspace (in my code I've added two seconds),
>> giving userspace enough time to send a completion message to the kernel.
>> With that we can be sure that userspace has given up control of the socket,
>> and we remain the sole owner.
>> Without such a message it's always tricky to figure out _who_ has control
>> over the socket, leading to all sorts of reference counting issues.
> 
> It's not difficult. Kill the handshake agent, and that closes
> the user space fd. The kernel now has control of the socket.
> 
Hmm. Okay, if you say so ... let's see what happens if I do that.
Timeouts are easy to trigger with my setup :-)

Cheers,

Hannes


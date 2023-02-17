Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECFD6AA0
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 12:48:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8F0741FF6D;
	Fri, 17 Feb 2023 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676638127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=No7TvWj7iN8sl7R2HCm28XTJEVVRufdD9yTobGA5B1E=;
	b=zRgTsD3I/BkVo2u4EKREhCRfmXX053yhD89ar3Dl/WSfrKB0C/RQmoe87fOSPV1AQ/WARy
	Zb9XbzBQL5YjqYrE+BdFsG73aLW8hRY2XYYly59Zt+VADUZZTH2rhWG94hiByF4JNK/CS6
	Vj4kleuarqpadmahKJ+ZptmltKYwQr8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676638127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=No7TvWj7iN8sl7R2HCm28XTJEVVRufdD9yTobGA5B1E=;
	b=GwBKDMEXGEvS8k7yWvSZBQHkNTmO6P5d59wBlUu2jzrCLykmat6gpWsq2KAt+B+k+11/TY
	Zp7VXaZGav9BDyDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 840E3138E3;
	Fri, 17 Feb 2023 12:48:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id jVvfH69372PnbwAAMHmgww
	(envelope-from <hare@suse.de>); Fri, 17 Feb 2023 12:48:47 +0000
Message-ID: <dd737d0d-0bef-db60-b49b-b21b75812bea@suse.de>
Date: Fri, 17 Feb 2023 13:48:47 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] tls-handshake: add 'keyring' netlink attribute
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>
References: <20230217113145.18916-1-hare@suse.de>
 <20230217113145.18916-3-hare@suse.de>
 <53831F87-46AC-457C-BF87-83A7EFF04120@oracle.com>
 <89b2e4b6-3f9e-51f4-1a6c-ec9a94208c84@suse.de>
 <2A306B7C-583D-4746-AD31-F7E9DD895209@oracle.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <2A306B7C-583D-4746-AD31-F7E9DD895209@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/17/23 13:32, Chuck Lever III wrote:
> 
> 
>> On Feb 17, 2023, at 7:24 AM, Hannes Reinecke <hare@suse.de> wrote:
>>
>> On 2/17/23 13:00, Chuck Lever III wrote:
>>>> On Feb 17, 2023, at 6:31 AM, Hannes Reinecke <hare@suse.de> wrote:
>>>>
>>>> Add a 'keyring' netlink attribute to the 'request' netlink
>>>> message to allow the kernel to communicate the keyring to use
>>>> to userspace.
>>> Can you add some detail about the use case? I'm not
>>> clear about how the keyring is to be used.
>>> Is this keyring going to be the same for all operations
>>> with this particular tlshd? If that's the case, why not
>>> have tlshd do a GET_KEYRING downcall once when it starts
>>> up?
>> And that's the key (sic!) here:
>> with this attribute each tlshd instance can have a _different_
>> keyring.
> 
> What do you mean by "tlshd instance"? Do you mean each tlshd
> child process needs its own keyring?
> 
It doesn't 'need' it. It already has (well, actually there are three 
keyring, one session-wide, one process-wide, and one per thread)
And all this 'keyring' attribute does (or should be doing) is allowing 
userspace to link that keyring into the process keyring.

> 
>> Idea is to prep the server side with the keyring to use, and then
>> reflect that choice to the userspace application such that it can
>> lookup the key in that keyring, too.
>>
>> (Note to self: need to change the initial keyring to be the process
>> keyring, not the session keyring for that to work)
>>
>> With that we can be sure that both sides (kernel and userspace) will
>> have access to the same set of keys.
>> Idea is to have only _one_ place which need to be configured; in this
>> case you would need to update the kernel side to allow for individual
>> keyrings.
>> Without this you would need to configure tlshd to use the correct keys,
>> and it'll be rather tricky to configure different keys for individual connections.
> 
> I thought the issue was keeping the keys private by setting up
> a keyring that is accessible only to the kernel and that tlshd
> instance? Did I miss something?
> 
No, that's precisely it.
By having a keyring attribute we allow for configuration of a keyring 
per connection.

> Seems like the tlshd child's process keyring is already set up
> this way? I'd like to understand if there's already something
> available to fill this role.
> 
The issue is to make the keys _available_ to that keyring.
As it stands, tlshd is using fork() for each handshake.
So we have one master process, and one process per handshake.
The session keyring will be identical for the of these instances.
The process keyring will be different for each of these.
And the per-handshake process needs to be able to lookup keys; these 
keys either must be in one of the default keyrings, linked to one of the 
default keyrings, or have correct permissions.
The last case we've dismissed as we want to restrict the permissions.
The first case (per-session keyrings) is essentially the config option
(which necessarily is identical for all handshake processed).
And this patch now covers the second option, of having _different_ 
keyrings for each handshake process.

Idea is that you configure the in-kernel callers of the handshake to 
provide the correct keyring.

EG for nvme-tcp plan is to pass the keyring with the 'nvme connect' 
call, and configure the keyring via the 'configfs' interface for the 
server side.
If different keyrings should be used. If not stick with the default 
'.tls' keyring.
For which, incidentally, I've got another patch, which I probably should 
send out, too.

Cheers,

Hannes


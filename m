Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4475692
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 12:24:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C87951FEEA;
	Fri, 17 Feb 2023 12:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676636663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rEKwamSlHdd5HaLGYOx0kGgUubKxtNWOExykljlO/Pk=;
	b=NbpdAwisPm35VtPJ5XZ0NhZDk2dPKpp9MV6ARQDj+Rte5LKXRGRO4SDuueQu3QK+SqS8x7
	ilNRP+RFT4+pYD7DZUJrJTmlDo0dxMiExuMSeSI3grwGxmrd1N6PtghllOgyOJEhNgAmC2
	BR5vupkCqpynuKPBktBv4k409JC0ils=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676636663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rEKwamSlHdd5HaLGYOx0kGgUubKxtNWOExykljlO/Pk=;
	b=zdfjO/Vi5PlplqoZKEYomqXJBf9rlpupAcAD+j5L14boG/TlUCz9s61nVL4iWuAdUioSi6
	SF9OoHigfpN346DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BEB8B13274;
	Fri, 17 Feb 2023 12:24:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2xQlLvdx72NfZAAAMHmgww
	(envelope-from <hare@suse.de>); Fri, 17 Feb 2023 12:24:23 +0000
Message-ID: <89b2e4b6-3f9e-51f4-1a6c-ec9a94208c84@suse.de>
Date: Fri, 17 Feb 2023 13:24:23 +0100
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
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <53831F87-46AC-457C-BF87-83A7EFF04120@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/17/23 13:00, Chuck Lever III wrote:
> 
> 
>> On Feb 17, 2023, at 6:31 AM, Hannes Reinecke <hare@suse.de> wrote:
>>
>> Add a 'keyring' netlink attribute to the 'request' netlink
>> message to allow the kernel to communicate the keyring to use
>> to userspace.
> 
> Can you add some detail about the use case? I'm not
> clear about how the keyring is to be used.
> 
> Is this keyring going to be the same for all operations
> with this particular tlshd? If that's the case, why not
> have tlshd do a GET_KEYRING downcall once when it starts
> up?
> 
And that's the key (sic!) here:
with this attribute each tlshd instance can have a _different_
keyring.
Idea is to prep the server side with the keyring to use, and then
reflect that choice to the userspace application such that it can
lookup the key in that keyring, too.

(Note to self: need to change the initial keyring to be the process 
keyring, not the session keyring for that to work)

With that we can be sure that both sides (kernel and userspace) will 
have access to the same set of keys.
Idea is to have only _one_ place which need to be configured; in this
case you would need to update the kernel side to allow for individual
keyrings.
Without this you would need to configure tlshd to use the correct keys, 
and it'll be rather tricky to configure different keys for individual 
connections.

Cheers,

Hannes


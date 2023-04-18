Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0D015B8
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 10:33:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2CE4F1FDCC;
	Tue, 18 Apr 2023 10:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681813984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2gh0NhIplaV1aYerfPIbgLDCrha8oUR5f3jyHVaDzLU=;
	b=x/i7D+8vQqUarJmnlhkrpmb5uK819e8U7fHVbU8/uebWH7S27HxNhEjzeOau4z4oE5udR+
	BUeJ5DjLnVtnIlSupjBinoYNe45xkZU6HzpgefVfAXMcwj24jgYsPG/Gv6+x1IJgD7As34
	+NXMC/z6y38XovIH4vdt1xmR5VWEc68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681813984;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2gh0NhIplaV1aYerfPIbgLDCrha8oUR5f3jyHVaDzLU=;
	b=r4bscKj7M1YQXNq5+jyzS6fmD51aqkWbJ+d6vuk72FL8DqzV2KW9KTDPV00h6E8Uhpgu1Q
	WAX6vn8nOOrxwiDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 16E42139CC;
	Tue, 18 Apr 2023 10:33:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CxspBeBxPmRMTgAAMHmgww
	(envelope-from <hare@suse.de>); Tue, 18 Apr 2023 10:33:04 +0000
Message-ID: <f02fb607-1339-2c68-4bd5-ced65d71b822@suse.de>
Date: Tue, 18 Apr 2023 12:33:03 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 08/18] nvme-tcp: do not set MSG_SENDPAGE_NOTLAST
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev
References: <20230417130302.86274-1-hare@suse.de>
 <20230417130302.86274-9-hare@suse.de>
 <36976756-b4c5-f2a5-34b8-e9731a49c477@grimberg.me>
 <654702da-246a-934c-14e4-7b179c46ed98@suse.de>
 <5df08f86-2599-6e47-2fdc-bda8d70edaf2@grimberg.me>
 <20230417131654.427ebd6a@kernel.org>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230417131654.427ebd6a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/17/23 22:16, Jakub Kicinski wrote:
> On Mon, 17 Apr 2023 18:28:12 +0300 Sagi Grimberg wrote:
>>> But then we're running afoul with tls_sw_do_sendpage(), which uses
>>> MSG_SENDPAGE_NOTLAST as a record indicator. Forwarding
>>> MSG_SENDPAGE_NOTLAST to tls results in incorrect TLS records on the wire
>>> and a transmission stall.
>>>
>>> Took me days to figure that out.
>>>
>>> If you have a better idea, I'm all ears.
>>
>> So sendfile is unsupported over kTLS? Or is there some special
>> case for it in the upper layer?
>>
>> Jakub?
> 
> First I hear of it. 10 sec look at the code doesn't indicate that
> the author missed this case completely either.
> 
> Hannes, any more details on what's going wrong?
> 
> What incorrect TLS record have you seen? What's the sequence of sends?
> Offload or no offload? Easy to repro or stars need to (mis)align?
> 
Ah-ha. Found it.

Turns out to be an arguably invalid control flow on our side.

The initial 'connect' command is a command PDU with inline data.
So in our (current) flow we do a 'sendpage()' with the 
MORE/SENDPAGE_NOTLAST flag set as we have to transfer more data.
Ok so far.
But for transmitting the actual data we evaluate 'sendpage_ok()', which 
returns _false_. And then we continue to call 'sendmsg()' for the inline 
data.
This confuses the TLS software stack as sendpage() and sendmsg() are two 
distinct code paths, and we end up with a TX stall.

Solution: check 'sendpage_ok()' when we have inline data and use 
'sendmsg' for the command pdu if required.

It always pays to dig deeper if one's not exactly sure what's happening ...

Will be updating the patchset.

Cheers,

Hannes


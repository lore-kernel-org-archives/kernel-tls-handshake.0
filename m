Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802E46FD6
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Feb 2023 16:57:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C219A22767;
	Thu, 16 Feb 2023 16:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676566657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k1OxwFJHAvfnLNPMETGQrAr3x/5vYLMhZ7pQUlmGYow=;
	b=IoSpWQVscArzONT7/6qrbFdD3iDXc2vIa52RtMYvgvD7FOX4yKVI+8Nvuld9AO4BiOxq2n
	+eF05NdYmY4vRD5Q6Wa6KS0G7eNG03sXxeIfpfuKzEQbTHSWiAhzRpwcu7q1wve87WOA08
	s+n+Y91y2+dgj4eUztTP9x7emd90v/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676566657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k1OxwFJHAvfnLNPMETGQrAr3x/5vYLMhZ7pQUlmGYow=;
	b=TtkaClbIpYLY2IgE3Zf6VGS3Ih4QlQY8Ro0/yg70/5yBSbFBWh0ngDCZTl70XQl9NJjNC9
	W4LctVwNSK9yWwCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC3CA13438;
	Thu, 16 Feb 2023 16:57:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ey6iKIFg7mNhOQAAMHmgww
	(envelope-from <hare@suse.de>); Thu, 16 Feb 2023 16:57:37 +0000
Message-ID: <ce49fa28-f0ab-dc01-c7d2-dd80e46c5796@suse.de>
Date: Thu, 16 Feb 2023 17:57:37 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Test results from v4
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>
References: <5ba0cee9-3a24-5d00-67e8-79204214f56b@suse.de>
 <6FC992A4-C4FC-4AD9-9BD4-5F57FF9C74DD@oracle.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <6FC992A4-C4FC-4AD9-9BD4-5F57FF9C74DD@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/16/23 17:03, Chuck Lever III wrote:
> 
> 
>> On Feb 16, 2023, at 10:58 AM, Hannes Reinecke <hare@suse.de> wrote:
>>
>> Hi Chuck,
>>
[ .. ]
>> unreferenced object 0xffff9989c22a0018 (size 24):
>>   comm "tlshd", pid 2332, jiffies 4294964098 (age 1513.848s)
>>   hex dump (first 24 bytes):
>>     00 00 00 00 00 00 00 00 a8 31 85 c1 89 99 ff ff  .........1......
>>     00 00 00 00 00 00 00 00                          ........
>>   backtrace:
>>     [<ffffffffa00ad3e4>] security_file_alloc+0x24/0x90
>>     [<ffffffff9ffbb747>] __alloc_file+0x57/0xc0
>>     [<ffffffff9ffbbbc3>] alloc_empty_file+0x43/0xf0
>>     [<ffffffff9ffbbcad>] alloc_file+0x2d/0x170
>>     [<ffffffff9ffbbea7>] alloc_file_pseudo+0xa7/0x100
>>     [<ffffffffa05158a9>] sock_alloc_file+0x39/0xa0
>>     [<ffffffffa073594b>] handshake_genl_cmd_accept+0x19b/0x2a0
>>     [<ffffffffa05d44e7>] genl_family_rcv_msg_doit.isra.19+0xf7/0x120
>>     [<ffffffffa05d495f>] genl_rcv_msg+0x19f/0x2a0
>>     [<ffffffffa05d3286>] netlink_rcv_skb+0x56/0x110
>>     [<ffffffffa05d3cc4>] genl_rcv+0x24/0x40
>>     [<ffffffffa05d277b>] netlink_unicast+0x1bb/0x290
>>     [<ffffffffa05d2bc5>] netlink_sendmsg+0x365/0x4d0
>>     [<ffffffffa0516e9f>] sock_sendmsg+0x5f/0x70
>>     [<ffffffffa0517211>] ____sys_sendmsg+0x201/0x280
>>     [<ffffffffa0519ca8>] ___sys_sendmsg+0x88/0xd0
>>
>> But I guess you've found these already.
> 
> Nope, I haven't seen that either, but I'm not looking for
> memory leaks yet. My focus right now is to address netdev's
> concerns, so I haven't enabled kmemleak (as it slows down
> the dev loop). Not crashing is a higher priority than
> leaking right at the moment.
> Sure, perfectly fine.

I've got some patches queued up to enable PSK for v4 (both client and 
server side), how should I post them? Here on the list or on the general 
linux-block / linux-nvme list?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280CE8460
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 15:26:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 64F20219F3;
	Mon, 17 Apr 2023 15:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681745213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sr/79fsgCtFVBr6tp5JavPwzM22deoNhMRmwBGz1jSo=;
	b=Dd6j75NrzRJd4O0bMYWjeowl7+PS2rV75KdrQginCOXd+gWN7v1xog7j7uGWVP9bshxGju
	SyNwxUG0gEWP6vrO2NVw1aO6rU3ia9SFgSx/h4oOG0ulylTr7pUoY0uvVu8B0KBj727g8/
	cOuFpA33evrsV/0ilskfRsF3/SsHdYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681745213;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sr/79fsgCtFVBr6tp5JavPwzM22deoNhMRmwBGz1jSo=;
	b=xJnjRcHEPs8pSN0E0KWQ5RT6u5m29aSR/rlrtgAJCuyvEcnBxTgx8ila9li7NMV2p2GzUp
	uBR4k4kd07W2EoCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3E7831390E;
	Mon, 17 Apr 2023 15:26:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id M0p8Dj1lPWSpNAAAMHmgww
	(envelope-from <hare@suse.de>); Mon, 17 Apr 2023 15:26:53 +0000
Message-ID: <6de5a0d7-9b7a-1b27-a1c2-13c94f4e5a41@suse.de>
Date: Mon, 17 Apr 2023 17:26:52 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 12/18] nvme-tcp: control message handling for recvmsg()
Content-Language: en-US
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev
References: <20230417130302.86274-1-hare@suse.de>
 <20230417130302.86274-13-hare@suse.de>
 <0752225c-a798-014c-25ca-eba2d4ad8de4@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <0752225c-a798-014c-25ca-eba2d4ad8de4@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/17/23 17:24, Sagi Grimberg wrote:
> 
> 
> On 4/17/23 16:02, Hannes Reinecke wrote:
>> kTLS is sending TLS ALERT messages as control messages for recvmsg().
>> As we can't do anything sensible with it just abort the connection
>> and let the userspace agent to a re-negotiation.
>>
>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>> Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
>> ---
>>   drivers/nvme/host/tcp.c | 23 ++++++++++++++++++++++-
>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
>> index b80bcc5fe447..eeb3f85fe259 100644
>> --- a/drivers/nvme/host/tcp.c
>> +++ b/drivers/nvme/host/tcp.c
>> @@ -1352,6 +1352,11 @@ static int nvme_tcp_init_connection(struct 
>> nvme_tcp_queue *queue)
>>   {
>>       struct nvme_tcp_icreq_pdu *icreq;
>>       struct nvme_tcp_icresp_pdu *icresp;
>> +#ifdef CONFIG_NVME_TCP_TLS
> 
> I don't think you need the ifdef(s) here, right?
> 
Leftovers, sorry.
Will be cleaning it up with the next round.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


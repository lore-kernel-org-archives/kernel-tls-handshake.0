Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73708460
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 15:36:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0812A1F890;
	Mon, 17 Apr 2023 15:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681745805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X04HwJApHEKRmZUvhtzZWCQZ243CBwNWrrY8JtkmuSM=;
	b=wdYstHIrINuemA3RjGh3Uh1fgpEbgY4V258cOPeLzQ39hEgY3FtfXE9YuZQ+J3eJKWFzma
	jnGaQWFMHt3iFE1tKcVH+UpR0ft8s1DZl9g9xwIN2sbxLs6OLLSi43oTHEhI3K5Q53urE3
	AVr98WzTqvotaiWYL9H0dNVL/MTC8cU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681745805;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X04HwJApHEKRmZUvhtzZWCQZ243CBwNWrrY8JtkmuSM=;
	b=ldj6lEbKELry3qUR2Dedcttn1yLj5uGqGGjze6T7pIpRWS80ce0SFxeJX0QZU4ERffWeMj
	hcLHWI+RlJnYZyDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A8B851390E;
	Mon, 17 Apr 2023 15:36:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KLJvKIxnPWT0OQAAMHmgww
	(envelope-from <hare@suse.de>); Mon, 17 Apr 2023 15:36:44 +0000
Message-ID: <89b96e03-9a00-b1a7-733a-5e61ce57a164@suse.de>
Date: Mon, 17 Apr 2023 17:36:44 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 11/18] nvme-tcp: enable TLS handshake upcall
Content-Language: en-US
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev
References: <20230417130302.86274-1-hare@suse.de>
 <20230417130302.86274-12-hare@suse.de>
 <73d59afa-d385-2616-fc74-13ad3bfe49be@grimberg.me>
 <4e9b3f94-b059-b225-9fa6-68178ebda990@suse.de>
 <298e74a7-4560-ac01-ad40-24019057b9bb@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <298e74a7-4560-ac01-ad40-24019057b9bb@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/17/23 17:31, Sagi Grimberg wrote:
> 
>>>>   static int nvme_tcp_alloc_admin_queue(struct nvme_ctrl *ctrl)
>>>>   {
>>>>       int ret;
>>>> +    key_serial_t psk_id = 0;
>>>> +
>>>> +    if (ctrl->opts->tls) {
>>>> +        psk_id = nvme_tls_psk_default(NULL,
>>>> +                          ctrl->opts->host->nqn,
>>>> +                          ctrl->opts->subsysnqn);
>>>> +        if (!psk_id) {
>>>> +            dev_err(ctrl->device, "no valid PSK found\n");
>>>> +            ret = -ENOKEY;
>>>> +            goto out_free_queue;
>>>> +        }
>>>> +    }
>>>> -    ret = nvme_tcp_alloc_queue(ctrl, 0);
>>>> +    ret = nvme_tcp_alloc_queue(ctrl, 0, psk_id);
>>>>       if (ret)
>>>> -        return ret;
>>>> +        goto out_free_queue;
>>>>       ret = nvme_tcp_alloc_async_req(to_tcp_ctrl(ctrl));
>>>>       if (ret)
>>>> @@ -1778,9 +1887,15 @@ static int nvme_tcp_alloc_admin_queue(struct 
>>>> nvme_ctrl *ctrl)
>>>>   static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
>>>>   {
>>>>       int i, ret;
>>>> +    key_serial_t psk_id;
>>>> +    if (!ctrl->tls_key) {
>>>> +        dev_err(ctrl->device, "no PSK negotiated\n");
>>>> +        return -ENOKEY;
>>>> +    }
>>>
>>> is ctrl->tls_key always set? Looks like this is the expectation.
>>>
>>
>> It needs to be set when TLS is enabled for the admin queue.
>> Otherwise no.
> 
> Then aren't you missing also and statement with (ctrl->opts->tls) ?
> 
Indeed, I do. Will be fixing it up.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


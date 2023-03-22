Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384321FB1
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 08:08:28 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so5981550wmq.3
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 01:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679472506; x=1682064506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fFlcLlIh+EbA0METHTv2hF0/wJWmpDxutHxgXL5+so0=;
        b=LDXBIsHKssleI+3vs5kuoDrae52XcnODjEJp8ay40ptiXlrjlm+OKsXjll/pABVsww
         W2GPIa9Z3LKjj3uqAhHY6kjHyQxPA8Z9lRcZcF/qSRgXt6Fjk5uH+mrqQ+3ibtytEJpO
         GHc2MuWAOR0+5MoEJiWfZVnByJcVd6gu1MOa0V8HaPv16jqgk5LW2m98USIfaR8WMyQz
         wq2yrRQYrp5uWAb62mQhS4N/Paw4v5RCvkXFXrzBt/fXwwYgjCJf/cy0ATOS9WZQD0oV
         YN2pBM6R5agR1p3PT8aOoNVcWX8RCVhQVo8I0AIZqDYyisEmNEQpTkWT1M+a4+OAgLgw
         DMFA==
X-Gm-Message-State: AO0yUKVfWusSKYOtucIgsZEUUFG5Ldy+IPDqTTed0+Aju4U4yD/GDViv
	QO991jUssGjWreV30sf6dVn4Uwri1v0=
X-Google-Smtp-Source: AK7set/4b5izfnYGpBdkyBegIFsyBTn9pXl18Dzbv/N/z+Li2SKQ/6YJivmqEe9Xk8QFgnFOolR1hA==
X-Received: by 2002:a05:600c:3b90:b0:3ee:52fb:6dd9 with SMTP id n16-20020a05600c3b9000b003ee52fb6dd9mr1827327wms.4.1679472506383;
        Wed, 22 Mar 2023 01:08:26 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id k22-20020a05600c1c9600b003ee6a91b596sm465633wms.29.2023.03.22.01.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 01:08:26 -0700 (PDT)
Message-ID: <60d3a645-719a-40aa-959d-f461b0c3eed9@grimberg.me>
Date: Wed, 22 Mar 2023 10:08:24 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 06/18] nvme-tcp: call 'queue->data_ready()' in
 nvme_tcp_data_ready()
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-7-hare@suse.de>
 <d868b752-1d8b-1236-3543-c9ef82e42f23@grimberg.me>
 <3bd2c6b4-b276-b882-6f28-998118f96650@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <3bd2c6b4-b276-b882-6f28-998118f96650@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 3/21/23 16:09, Hannes Reinecke wrote:
> On 3/21/23 14:44, Sagi Grimberg wrote:
>>
>>> Call the original data_ready() callback in nvme_tcp_data_ready()
>>> to avoid a receive stall.
>>
>> Can you please improve the description to include what is the stall?
>> For example, does the stall exist today? If it is, I would like to
>> separate such patches from this set and include them asap.
>>
> That is actually particular to the TLS implementation, as it uses the 
> 'data_ready' callback to produce the data which can be read by eg 
> recvmsg().
> 
> Without this call there's no data to peruse for recvmsg().
> 
> But I'm not _that_ deep into networking details to know whether this is 
> TLS specific or an issue with any data_ready callback.
> I assume the latter, but then again, who knows.

Seems that this is only relevant when nvme_tcp runs on top of a ulp,
so a code comment would probably make sense here.

> 
> Hence the slightly vague description.
> 
>>>
>>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>>> ---
>>>   drivers/nvme/host/tcp.c | 8 +++++---
>>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
>>> index 0e14b1b90855..0512eb289dcf 100644
>>> --- a/drivers/nvme/host/tcp.c
>>> +++ b/drivers/nvme/host/tcp.c
>>> @@ -936,12 +936,14 @@ static void nvme_tcp_data_ready(struct sock *sk)
>>>       trace_sk_data_ready(sk);
>>> -    read_lock_bh(&sk->sk_callback_lock);
>>> -    queue = sk->sk_user_data;
>>> +    rcu_read_lock_bh();
>>
>> Now I understand your comment from a previous patch.
>> Can you explain why is this convention needed?
>>
>> I would prefer to have it as a separate patch with an
>> explanation to why it is needed.
>>
> This is the slightly odd socket callback handling.
> Any driver is free to set the socket callbacks, but it has to be aware 
> that it might not be the only one in the stack doing so.
> So one has to be prepared that the callbacks are set already, so we 
> should be calling them prior to our callback.

I meant the change from read_lock_bh to rcu_read_lock_bh and the
same for rcu_dereference_sk_user_data. It needs to be in a
separate patch with explanation to why it is needed.

> 
>>> +    queue = rcu_dereference_sk_user_data(sk);
>>> +    if (queue->data_ready)
>>> +        queue->data_ready(sk);
>>
>> Is the tls data_ready call sync or async? just for general knowledge?
>>
>>
> Sync, I guess. Otherwise we wouldn't be needing the lock ...

OK.

Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C05A1FB1
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 08:12:17 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so12444110wmb.5
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 01:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679472735; x=1682064735;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCUJxGjV7L1rJvHzwsGUV3/+MN9H6ACuEOI0mbTY1Sg=;
        b=orB5n2LtA6s92vpHozIfSaCO5qMBz2EgXe89G9Im97vBJ/yACO33QIRiZkSzOY2IEd
         d7KcgVy+NhsxJ3bBwTTRNd2BKjvfj5xNIT3HkHvOPJfEq8ggsE+7dBbe87xLJUbtVGUf
         bqc7oxcQLCOSvtAx6e5CyhJVNK4GOPoYkBqSgi8/XjpGFQX8BH+0ivlcaWd2p3/x/6oT
         FEEH79WqQ5q4di9C1uBtTh6fBA/vVt85KfUQlmkpJbJvzR5m011XJ+y1UCDne09zd6Az
         2kyXav8SkKjd08BVe1tA51/z0JkXI34MklaqQFC4iFx+15a7UNrdmcvnABFJMVIZavn7
         kw2w==
X-Gm-Message-State: AO0yUKXOLd/w2gn98JY2VBsl0dZMMB2NNInaWbdpOCJ/haMvkrphv0Kt
	r0Z15/+dh62gKpXdWaZwEoU=
X-Google-Smtp-Source: AK7set+56Fe+VnCC1zoexfEfKHQN1RoOMZBvv3e7HYxbiXSklW6Ef2RbOdlbOEIPkxKjeXyqkMVbpg==
X-Received: by 2002:a05:600c:4743:b0:3ed:c956:4854 with SMTP id w3-20020a05600c474300b003edc9564854mr5090652wmo.3.1679472735572;
        Wed, 22 Mar 2023 01:12:15 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b003e7f1086660sm22391000wmb.15.2023.03.22.01.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 01:12:15 -0700 (PDT)
Message-ID: <e55cf3ce-6446-7663-aaac-45d497714db7@grimberg.me>
Date: Wed, 22 Mar 2023 10:12:13 +0200
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
To: Hannes Reinecke <hare@suse.de>, Chris Leech <cleech@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <cel@kernel.org>,
 kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-7-hare@suse.de>
 <d868b752-1d8b-1236-3543-c9ef82e42f23@grimberg.me>
 <3bd2c6b4-b276-b882-6f28-998118f96650@suse.de> <ZBpJQENvFoyGortp@localhost>
 <2dbd26ec-c384-866c-8d76-38364fa3330e@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <2dbd26ec-c384-866c-8d76-38364fa3330e@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/22/23 08:59, Hannes Reinecke wrote:
> On 3/22/23 01:18, Chris Leech wrote:
>> On Tue, Mar 21, 2023 at 03:09:06PM +0100, Hannes Reinecke wrote:
>>> On 3/21/23 14:44, Sagi Grimberg wrote:
>>>>
>>>>> Call the original data_ready() callback in nvme_tcp_data_ready()
>>>>> to avoid a receive stall.
>>>>
>>>> Can you please improve the description to include what is the stall?
>>>> For example, does the stall exist today? If it is, I would like to
>>>> separate such patches from this set and include them asap.
>>>>
>>> That is actually particular to the TLS implementation, as it uses the
>>> 'data_ready' callback to produce the data which can be read by eg 
>>> recvmsg().
>>>
>>> Without this call there's no data to peruse for recvmsg().
>>>
>>> But I'm not _that_ deep into networking details to know whether this 
>>> is TLS
>>> specific or an issue with any data_ready callback.
>>> I assume the latter, but then again, who knows.
>>>
>>> Hence the slightly vague description.
>>
>> This looks like the socket callbacks end up hooked in the wrong order.
>> Ideally it would be tcp -> tls -> nvme_tcp, while this currently looks
>> like tcp -> nvme_tcp and then this call back to tls for decryption.
>>
> Well, problem is that I need not one but two sets the callbacks.
> One callback is for waking up userspace (took me weeks to figure that 
> out), and needs to added before calling the userspace helper.
> The other is the 'normal' nvme-tcp callback:
> 
> tcp->nvme-upcall->tls->nvme-tcp
> 
> So really the problem is not so much an inversion, but rather the fact
> that the nvme-upcall callback is really only needed for the duration
> of the handshake. And hence I thought that we should remove the callback
> once we're done with the upcall.

What do you mean remove the callback? data_ready? I'm not sure I'm
following.

> Turns out that we can't, and the best we can do is to disable the 
> functionality, leaving the callback itself in place.
> 
>> I'm not quite sure how to untangle this; nvme_tcp can't just set it's
>> own callbacks before initializing kTLS, becuse that's being done by
>> tlshd which is going to need the userspace socket API callbacks working.
>>
> Correct.
> So for now I'll leave the callbacks in place, even though they are 
> pointless after the upcall.

Does it make any difference now that callbacks setting moved to
nvme_tcp_start_queue?

Again, I'm not sure I understand what callback is pointless?

Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CDD23AD
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 10:13:59 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id l15-20020a05600c4f0f00b003ed58a9a15eso11067285wmq.5
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 03:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679480037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z5ZG7J64QOSTUx9XiiDdRmUx6P1347DK8XQ+rqg+tkc=;
        b=B0+nRHdio1vY22rYqR8g/mYpPpeZY+G0H+lFGEoFp+pLAxhZxKfNPurs1bsQX/3oU0
         OExHw4sBPs5WzamaQ1F8jkH0D7KXY7O61jb6si+y/x9D6tyjRTiKg1Pp1no5HkbUI9uU
         L7+vlh92ozFRkbOnlD6nCe4kXbP7pB7cPETwd34ajEP1bgT/lo4Nn0Rq4Gh3u5O8cYbf
         24CFYPaYio2zPTU0aklKGCCNuPN3scWYC0A3Pkp11cPz5QPVpwlyTeMOd7q3kGFu5zkd
         bmS/N4INN1WfB7i43jknTZQb8oFQeK4Y/ZLWsTi9Q25LuWzeXQsYmU8GTdlh06RUPG5G
         B+0w==
X-Gm-Message-State: AO0yUKVpXP5XXQZRBLZjJM44sQV0DUV0Guos5wdaP1KHDsC6Ndxc9w1k
	Sz15jDO0CJSTgEQGG9PwTuY=
X-Google-Smtp-Source: AK7set93TgwRQaw+xjse0ekF4SjABkMbOvVru2rCraEWY1WcVSB5UFoQBaTarvmF5EymqWEi3TTmIQ==
X-Received: by 2002:a05:600c:4744:b0:3ed:ebcb:e2c6 with SMTP id w4-20020a05600c474400b003edebcbe2c6mr5399548wmo.3.1679480037497;
        Wed, 22 Mar 2023 03:13:57 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id e22-20020a05600c4e5600b003ee6def283bsm491089wmq.11.2023.03.22.03.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 03:13:57 -0700 (PDT)
Message-ID: <435745c4-9701-bb4d-5c2c-84ab10eb4747@grimberg.me>
Date: Wed, 22 Mar 2023 12:13:55 +0200
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
 <60d3a645-719a-40aa-959d-f461b0c3eed9@grimberg.me>
 <3b6796e4-93ea-c493-4e03-27712257f69b@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <3b6796e4-93ea-c493-4e03-27712257f69b@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> I meant the change from read_lock_bh to rcu_read_lock_bh and the
>> same for rcu_dereference_sk_user_data. It needs to be in a
>> separate patch with explanation to why it is needed.
>>
> That is primarily for sanity checking.
> 
> Both us _and_ the tls code are setting the sk_user_data pointer,
> so I wanted to make sure that we do get things correct.
> But seems to work now, so I guess I can drop the rcu_dereference
> modifications.
> 
> Let's see.

As I said, I don't mind having it, seems harmless.
But need it as a separate patch, with a description for why
this is added.

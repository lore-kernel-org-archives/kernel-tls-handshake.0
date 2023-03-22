Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D36A2566
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 12:29:09 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id o32so5011437wms.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 05:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679488148; x=1682080148;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6l9nP91HpVaIuu5J7D+loIMCJ0ccMNyNWJa5DOX8PI=;
        b=js+V9ItUSqsCJST0hYU+dhJn4lYDISJyZ360+jDlOaohbZFOYVfe9dZqj931145mGn
         tLxHUpSSo11FsMjhjvFTlEzC/5KlywC4Ffr+HQp1Vzpryh6c0lrx4VgFJHSLQzs43MTG
         dYUAZkSo7gJPMTjt8SxRDoVVwsNlM8GGYhXdrQ6lO5ZC4D/uXUB8Xb9ragI0ve3lPe3h
         0KA3YQvdCnMbV06kMHZRI9SMlF4dnjlIeIxota2EHHzFrjf8YH2etJVEPhVYtCyrS+ul
         NFgybv3SFaZBpUZNREaQk834XYJjmimq8vXq4RNKvciFPMpA1T5JobcsgKMaQkOZ8IH2
         QOLg==
X-Gm-Message-State: AO0yUKWCOY7yiJ3eWI9mqKWftViZaQxidpFNbUBzcXw6gZsC2hr2YnXm
	VX0BNPmT4XKdKS7hyvx/MAo=
X-Google-Smtp-Source: AK7set8Yi1EJ4lm4bVZdQyskjPfglKWMWCCOuRm+yAHxrUf4xwo+ybQm2BZ3H5yRmDgBOdSSFdofkA==
X-Received: by 2002:a05:600c:4ec7:b0:3e9:b564:fae4 with SMTP id g7-20020a05600c4ec700b003e9b564fae4mr5841377wmq.0.1679488147855;
        Wed, 22 Mar 2023 05:29:07 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id v15-20020a05600c444f00b003edddce5b00sm10888500wmn.12.2023.03.22.05.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 05:29:07 -0700 (PDT)
Message-ID: <4963a908-8829-5894-a815-9b27fd0f9dd7@grimberg.me>
Date: Wed, 22 Mar 2023 14:29:05 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 11/18] nvme-tcp: control message handling for recvmsg()
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>,
 "boris.pismenny@gmail.com" <boris.pismenny@gmail.com>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-12-hare@suse.de>
 <0be88516-8e29-a1a5-f0ff-204830c0fba5@grimberg.me>
 <cd37b4a7-41e7-b142-e87d-908a2e7bcfc7@suse.de>
 <0cfcab69-c4a1-2072-a85b-12c5a087db58@grimberg.me>
 <0a8061ca-9c44-cae5-aab4-fd3222f372bd@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <0a8061ca-9c44-cae5-aab4-fd3222f372bd@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>>>> kTLS is sending TLS ALERT messages as control messages for recvmsg().
>>>>> As we can't do anything sensible with it just abort the connection
>>>>> and let the userspace agent to a re-negotiation.
>>>>
>>>> Is this a problem if we do end up adding read_sock to tls?
>>>> Although I do see that the tls code does manage this in the
>>>> sk_buff control buffer, so I assume there is access to this info.
>>>>
>>>> CC'ing Boris here as well.
>>>>
>>> Yeah, that was the other reason; cmsg aka TLS alerts are only 
>>> available for recvmsg().
>>>
>>> However, for TLS 1.3 the only TLS alert which does not trigger a 
>>> connection reset would the the ominous 'new session ticket' alert.
>>> But during TLS handshake development we already decided to _disable_
>>> session tickets as they are pretty meaningless for our us.
>>> Consequently all TLS alerts will trigger a connection reset, and 
>>> realistically we don't _need_ to know which alert type has triggered
>>> the reset.
>>>
>>> So 'read_sock()' could be implemented by closing the connection on
>>> any TLS alert, and not giving us access to any of the alerts via
>>> control messages. If that makes life easier ...
>>
>> Most likely read_sock() is the wrong place to ignore alerts. Probably
>> the better way is to do this in nvme, although its a bit harder.
> 
> But that's just the point; you don't have OOB information for 
> read_sock(). So I wouldn't know how you could pass the TLS alert 
> messages.

tls_sw populates cmsg from skb control block, and accesses it from the
skb with tls_msg(skb)...

> Hence my idea of converting them into a connection reset for 
> read_sock().

Probably its the wrong layer for this decision.

> As the whole idea of using ktls is that you do _not_ have to handle TLS 
> details, it's questionable what exactly one could do here except from 
> resetting the connection...

Well, in theory, you could have passed it to userspace along with the
sockfd to handle it for you. But I'm definitely not suggesting that we
do that. But at least the connection reset should be decided above
read_sock.

Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75498460
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 15:28:15 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-2f4130b898cso254223f8f.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 08:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681745294; x=1684337294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ptZ/THg+jTetYYDNVb/iJ09pj0p17BXD3NkPPLMsHk=;
        b=hGW2o3lhdWqK+wjCG6bZ0bxa21i8ntrn4pEm7hKp1/Db3lOXU1x4zBjxDdEeI20NwH
         GnPgAb8hiQw8xBSB/aneqDJFT5quv05q07mv6VQuAf7YmRAIIhi6Olfoqja1J1xKlTTl
         e3XqTjpQzuE9JNmjDOxwxOoBOLF56g2E3rfDphgbJyNocRGJAChYDjT3c76UA0X9+XOd
         jvYDK5dxe8j9MDW1fK6LAy1D/3ObiupfroShgnHNUuMAik9lk5F1M/TLpMpoqEa/iBD5
         mjzJqgVwWGsmPzVZjhTHDVAQRLFxX/kI9wshHd0kghT7klY1lqKD1sJ32afvPN8U4eHU
         gMcA==
X-Gm-Message-State: AAQBX9eSzJytI/+w4SB7xHSqkntwe4I5oxFSzg3O/nJRecEOJudyMrNc
	na9k7vt5mZ6V9HPGjoSOLoXq3SstxQs=
X-Google-Smtp-Source: AKy350ZmJvKfWvjaoZGeHpO9VtQWlc/uxKRhhJh+8BIt3MwoCS5pI8L1A1VDuzjPlFo4ApGySJFdfg==
X-Received: by 2002:adf:f802:0:b0:2cf:df6d:6063 with SMTP id s2-20020adff802000000b002cfdf6d6063mr7050064wrp.2.1681745293849;
        Mon, 17 Apr 2023 08:28:13 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id g2-20020a05600c000200b003f0aa490336sm11571527wmc.26.2023.04.17.08.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 08:28:13 -0700 (PDT)
Message-ID: <5df08f86-2599-6e47-2fdc-bda8d70edaf2@grimberg.me>
Date: Mon, 17 Apr 2023 18:28:12 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 08/18] nvme-tcp: do not set MSG_SENDPAGE_NOTLAST
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Jakub Kicinski <kuba@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev
References: <20230417130302.86274-1-hare@suse.de>
 <20230417130302.86274-9-hare@suse.de>
 <36976756-b4c5-f2a5-34b8-e9731a49c477@grimberg.me>
 <654702da-246a-934c-14e4-7b179c46ed98@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <654702da-246a-934c-14e4-7b179c46ed98@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> nak from me.
>>
>>> MSG_SENDPAGE_NOTLAST was introduced with commit 35f9c09fe9c7
>>> ("tcp: tcp_sendpages() should call tcp_push() once") to fix issues
>>> with the ->sendfile() call, and the implication seems to be that
>>> the flag should be strictly internal to sendfile.
>>
>> no, the use case was to allow sendpage consumers to build larger
>> tso packets for large payloads (splice being the primary one), nvme-tcp
>> also benefits from it (as do others), just like sendfile.
>>
>>> Hence we shouldn't be setting it on nvme-tcp, and anyway doing
>>> so will cause TLS sending invalid data.
>>
>> That is something else. I don't recall the full details on the
>> discussion with Jakub, but it was not my intention to strike
>> it altogether, just remove it if !sendpage_ok.
>>
> But then we're running afoul with tls_sw_do_sendpage(), which uses 
> MSG_SENDPAGE_NOTLAST as a record indicator. Forwarding 
> MSG_SENDPAGE_NOTLAST to tls results in incorrect TLS records on the wire 
> and a transmission stall.
> 
> Took me days to figure that out.
> 
> If you have a better idea, I'm all ears.

So sendfile is unsupported over kTLS? Or is there some special
case for it in the upper layer?

Jakub?

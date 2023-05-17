Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E76B29113
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 17 May 2023 06:43:28 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f42379d553so914125e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 16 May 2023 23:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684305807; x=1686897807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vF9lD3NAibz1hpQy4bgPq6IEM4SGxX0lLIRi3TZVHaI=;
        b=lD4FupPUr61aFERTGIFuHzOGZBzxXw4k6jbQRw8JYE+M6VdXmd9KVDCkUn/ohgqyqG
         lSrtvPB7Yt1FMr4YeAM+2xXKx3+BpYlbwDsDd8DHfsG/jp87ufR3D023/CqolE3BihdU
         V5ZOwCXwT1zgJAguoUIl4G+6KRCRTQ2dqt1tt0V2dCzlYfyz3iQAMbjE5g5NA5H3I4Ya
         Z50M/KvI+dghYShpEkIoQeLfTlyCHWhNu4IirPGsx19Yg0txTB3e3bE0P1j4aAgBRW9R
         Hhm8HwIvg8mpa9yetSZ/A/OTqqsD/3MuhKNInPNuXXsHlu8a1MA70EGrhi4MSmThjru9
         B/9g==
X-Gm-Message-State: AC+VfDyi/bEMgpg46mdAN+yCsWkge43X/XbxtdR3kbyMojBh4FPAjdzy
	2zeTTowodm6Xo7vUQPrGvCw=
X-Google-Smtp-Source: ACHHUZ5MPt4sOTjoGUUXkvmk4G68kB/12dg8gjnDVmvo7AxQ98lhup6OgO9KQfI8xQueymcbHZ+VLQ==
X-Received: by 2002:adf:f60e:0:b0:2f8:15d8:e627 with SMTP id t14-20020adff60e000000b002f815d8e627mr782517wrp.7.1684305807014;
        Tue, 16 May 2023 23:43:27 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id l5-20020a5d4105000000b00307b5376b2csm1797353wrp.90.2023.05.16.23.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 23:43:26 -0700 (PDT)
Message-ID: <0097e7c0-351a-b922-dd77-ab414b53170b@grimberg.me>
Date: Wed, 17 May 2023 09:43:24 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 06/17] net/tls: implement ->read_sock()
To: Jakub Kicinski <kuba@kernel.org>
Cc: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>,
 Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev,
 Boris Pismenny <boris.pismenny@gmail.com>
References: <20230419065714.52076-1-hare@suse.de>
 <20230419065714.52076-7-hare@suse.de>
 <da7135cf-c96e-f79f-9d49-87ee269871cf@grimberg.me>
 <20230509174724.4a198306@kernel.org>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230509174724.4a198306@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> Can we get an ack (or review) from you on this?
>>
>> The only consumer of this is nvme, and seems to at least
>> work on the limited testing this series has seen.
>>
>> We can take this piece from the nvme tree or not, whatever
>> you prefer.
> 
> Let's get all the TLS patches posted to netdev, reviewed there,
> then we can put them on a branch on top of -rc1 and they can
> be pulled into both netdev and nvme tree.

Hannes,

Are you planning to resubmit the series soon? Please make sure
to CC netdev on the next round.

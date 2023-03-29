Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321442F30
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 15:43:25 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id l37so9216992wms.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 08:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680104603; x=1682696603;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6FI5sEbkUhApVcE0IJUt2azvk0Blp5zEnwZxVcHOd68=;
        b=60hTqWYVIHEjxW0T6KZELxe2/jm4Ey+rZgMfO/Lw7Du53D0j1BbH6w7yONML8MuA5P
         Juxhf33K+/26wXcYcveV4A5iR2l0ls802/5gHlJZb1h8/fav6DG4fS/T9YzBPCbzfD+j
         /JioJlpmqxpa9aRV5v7yynSjRAzkm8Mxbnngok1j0IFkPFvvkYVXRa6V2TbWhvJGNTYS
         5yjIcf83Z07R+/0rCFS/I3SmrUbIVNoytp/yjl1TxZlPjct/a7q7hjAMUwtmCRWQKnf3
         dkoi8dYSdJRXMyW8A3LPJx5D/DfXOsW+V7FXGzmL20KmBhL10TGBKvyoV9mYSGZg5413
         bHjw==
X-Gm-Message-State: AO0yUKUIDQpEjVAABAl+095gtmG2gG7qDHDJgbJNdoWXaEaG0DyVbWrB
	exNhaGNyZ8gKbMDge78QBXE=
X-Google-Smtp-Source: AK7set/vSWjzqBbAoi9V89BLrD/KBoaZX2t6vdyrtIC2wXSVHJqWNuWBoiPoLjJ2EodLr1FsK7Q6ig==
X-Received: by 2002:a05:600c:1550:b0:3ed:d2ae:9adb with SMTP id f16-20020a05600c155000b003edd2ae9adbmr17593443wmg.0.1680104603467;
        Wed, 29 Mar 2023 08:43:23 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c191300b003ee1acdaf95sm2794562wmq.36.2023.03.29.08.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 08:43:23 -0700 (PDT)
Message-ID: <5fb6ae09-6174-e619-3923-dc33aa580336@grimberg.me>
Date: Wed, 29 Mar 2023 18:43:20 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 05/18] net/tls: implement ->read_sock()
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev,
 Boris Pismenny <boris.pismenny@gmail.com>
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-6-hare@suse.de>
 <d177a5d6-3f76-4eee-0cc5-2c6d995c2e8a@grimberg.me>
 <d97fa181-077a-6183-bdd2-17ad51b0fbc9@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <d97fa181-077a-6183-bdd2-17ad51b0fbc9@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


>>> Implement ->read_sock() function for use with nvme-tcp.
>>
>> Nice.
>>
>>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>>> Cc: Boris Pismenny <boris.pismenny@gmail.com>
>>
>> Would be great to see a tls_device implementation as well.
> 
> Sheesh. But first we would need to update the tls_device implementation 
> to TLS 1.3:

;)

The comment was for the nvidia folks..

> int tls_set_device_offload(struct sock *sk, struct tls_context *ctx)
> [ .. ]
>          crypto_info = &ctx->crypto_send.info;
>          if (crypto_info->version != TLS_1_2_VERSION) {
>                  rc = -EOPNOTSUPP;
>                  goto release_netdev;
>          }
> 
> which I'd rather defer to Boris or whoever maintains the hardware

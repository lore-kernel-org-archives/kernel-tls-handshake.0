Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21A7AFFE
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 15:35:40 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3ee4aa9acd5so8230135e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 08:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680104139;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aaMUNyqon5aG9BmkC40yJDgKJGxouLrsmpbZZ7+6PKM=;
        b=Jn9A0ggi4tLATL/P94/tz+tKFX4PJk7v6mEwnzwj4YPH5xPXt76nkd5ZKm8wDXGKNr
         wBRJWhYS1+7+A4Kfnl81iymTgQIb5BZdqAmLHE13A91k8aoc5kw2rInpiCmfhH/ko6Jo
         IebW1mGNv6WbHspcl1QHLB9QtsxCIfKRKT2VwvaNma+6ZIM/41cDod8o8M6Ikrk9QD6y
         qFiQNl6BJcmz2T0j3Bop4k7UOfO+VhEL3FTleEXiFCLgHHbhfbIq+PBPy7FTnKtDr3wn
         ugFHvSIFXOhoCX9rFmqJ0jaW6KJwpsZ6fjXRlf+WIdnQozolhLjp+fXsMK7lNhokdzLp
         KwgQ==
X-Gm-Message-State: AO0yUKUYA2NguOiiuAR3ebHJUOFsHqqvyZV/paMpQRLqsDOkNSZT6YA1
	2i4+DlyA3nu7XuYJvm2h2Rc=
X-Google-Smtp-Source: AK7set9LlGViGLAllZqbmx6Q+2o+JLtTSopPe9B5CUX0TkxQ3YJuVyogfBUTmcejvr8bIysQ43sIYg==
X-Received: by 2002:a05:600c:1d03:b0:3eb:42f6:ac55 with SMTP id l3-20020a05600c1d0300b003eb42f6ac55mr17154992wms.1.1680104139009;
        Wed, 29 Mar 2023 08:35:39 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id c1-20020a05600c0a4100b003ee5fa61f45sm2976683wmq.3.2023.03.29.08.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 08:35:38 -0700 (PDT)
Message-ID: <ea017b62-2b01-c655-823e-c3dfefca59a1@grimberg.me>
Date: Wed, 29 Mar 2023 18:35:37 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/18] nvme-keyring: implement nvme_tls_psk_default()
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-8-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230329135938.46905-8-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/29/23 16:59, Hannes Reinecke wrote:
> Implement a function to select the 'best' PSK for TLS.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/common/keyring.c | 47 +++++++++++++++++++++++++++++++++++
>   include/linux/nvme-keyring.h  |  2 ++
>   2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/nvme/common/keyring.c b/drivers/nvme/common/keyring.c
> index 4ac33538f839..ca36a061bd48 100644
> --- a/drivers/nvme/common/keyring.c
> +++ b/drivers/nvme/common/keyring.c
> @@ -103,6 +103,53 @@ struct key *nvme_tls_psk_lookup(struct key *keyring,
>   }
>   EXPORT_SYMBOL_GPL(nvme_tls_psk_lookup);
>   
> +/*
> + * NVMe PSK priority list
> + *
> + * 'Retained' PSKs (ie 'generated == false')
> + * should be preferred to 'generated' PSKs,
> + * and SHA-384 should be preferred to SHA-256.
> + */
> +struct nvme_psk_priority_list {

nvme_tls_psk_priority_list

> +	bool generated;
> +	enum nvme_tcp_tls_cipher cipher;
> +} nvme_psk_prio[] = {

nvme_tls_psk_prio

> +	{ .generated = false,
> +	  .cipher = NVME_TCP_TLS_CIPHER_SHA384, },
> +	{ .generated = false,
> +	  .cipher = NVME_TCP_TLS_CIPHER_SHA256, },
> +	{ .generated = true,
> +	  .cipher = NVME_TCP_TLS_CIPHER_SHA384, },
> +	{ .generated = true,
> +	  .cipher = NVME_TCP_TLS_CIPHER_SHA256, },
> +};
> +
> +/*
> + * nvme_tls_psk_default - Return 'best' PSK to use for TLS ClientHello

s/'best'/the preferred/...

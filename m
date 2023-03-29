Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87842582
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 15:04:43 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id y14so16087683wrq.4
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 08:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680102282; x=1682694282;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FaMmgvN463wn8/4vPI+oqIbv/Zy1HNYnDfVcekpYeZc=;
        b=Z63T2sG+rr9CCkCM2gdlM9Mtsl7MtxvcoIIOvH6Mg4tavnoZTCgfnB9R7NEebXuYeo
         YFCDvf12Rb5iycVEYkfoEmkUYFuyNc7/w90Yhkb/GHTmee/tIAhd2NLxr+uFPcO32afj
         GilpAfuQGboyB0Tlj7V3EXBMHdP7jVMKiExEuX+IbHPbvLyK9o0P0pk3sTVC+AQusapy
         MehF+WgWjlYDvJtqM1hhyvBSjnfdDx9yc8OtCtju67ChE66CqZR/nxmGyP1zaiVXwPSk
         GME2fLoOFQAHazs9AALnMlYTNeUlCz5slkNP3s2RwPMdcNKC/OGF7fdQmkTKw1XvWQgF
         NT1A==
X-Gm-Message-State: AAQBX9ePO5wH+WLRQs1/aTi4h7NT1RDZb9hV7UJ4Imh4Y9raNjViISo1
	YDbYCmOvCS13aYZpMpMb/vo=
X-Google-Smtp-Source: AKy350a/ybQEwx5CIpXlxwAzQAbA4x7eork5uF7n3MsqZYaXUcTKFwn/qz9QQLbUVyeGkWiWuwRthg==
X-Received: by 2002:a5d:4d88:0:b0:2c7:1c72:69ac with SMTP id b8-20020a5d4d88000000b002c71c7269acmr11567152wru.2.1680102281899;
        Wed, 29 Mar 2023 08:04:41 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id j6-20020a5d5646000000b002d2f0e23acbsm30333482wrw.12.2023.03.29.08.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 08:04:41 -0700 (PDT)
Message-ID: <2cfb1620-a09e-87ed-9224-5e94afc0747f@grimberg.me>
Date: Wed, 29 Mar 2023 18:04:39 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/18] nvme-keyring: register '.nvme' keyring and add
 CONFIG_NVME_TLS
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-2-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230329135938.46905-2-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Register a '.nvme' keyring to hold keys for TLS and DH-HMAC-CHAP and
> add a new config option NVME_TLS to enable support for NVMe-TCP/TLS.
> We need a separate keyring for NVMe as the configuration is done
> via individual commands (eg for configfs), and the usual per-session
> or per-process keyrings can't be used.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/common/Kconfig   |  9 +++++++++
>   drivers/nvme/common/Makefile  |  1 +
>   drivers/nvme/common/keyring.c | 36 +++++++++++++++++++++++++++++++++++
>   drivers/nvme/host/core.c      | 19 +++++++++++++++---
>   include/linux/nvme-keyring.h  | 12 ++++++++++++
>   5 files changed, 74 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/nvme/common/keyring.c
>   create mode 100644 include/linux/nvme-keyring.h
> 
> diff --git a/drivers/nvme/common/Kconfig b/drivers/nvme/common/Kconfig
> index 4514f44362dd..b6fff16da1fb 100644
> --- a/drivers/nvme/common/Kconfig
> +++ b/drivers/nvme/common/Kconfig
> @@ -2,3 +2,12 @@
>   
>   config NVME_COMMON
>          tristate
> +
> +config NVME_TLS

Better to call it NVME_TCP_TLS... although not a biggie, should be
well understood this is tcp

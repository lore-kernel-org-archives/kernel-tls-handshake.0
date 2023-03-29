Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0802582
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 14:49:04 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id s13so9091150wmr.4
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 07:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680101342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RxkL036kcFDqMn3MovCPQPFhu8c5tldGj+zWJ18/JRY=;
        b=W1621P8XQD8C9lhsU+a8lLykUvFOsZNKYalD2kxRWHoMAoxvreiNiYQVos4W9nHWZm
         G82V/Z+4dSMqsKht+rPk0Y+5pbI5XUB9QTAPKLhXkbP14fgArx6kzHeE2NGxGCG7ie7E
         huza6kEVsc7UPI6s0MWl24mMRYrsuKi/iFcNlRLEGvRZWhBpWrHAJHxgrRK2AO4vADRZ
         rr1p9nTohKAUmCGQdfBULPpfVsaXesEcjAFUe3K8BnbtU6ym0tbrYm57+DQyHlywz1DX
         GKi9gaTnV5t8MKQEhxQ1zFCTRarSZsuW3CbisVMRpG9rIuYKUKyed0aKOQoW3iEOUqqd
         Sbxg==
X-Gm-Message-State: AO0yUKUZTYmzlSXhq1CMAMsKKLR87Yh3WbWcl6/2GbxaOu9BqVsuteDO
	RQPLujvzgcxgeUx9YF0wwCaaHolEQ/c=
X-Google-Smtp-Source: AK7set/L7kry83fDQHx+LSN0MLhNEl+AoH9v13eokrgZpTWgLqgsUTKXYsLwtbW749lTVkM3ercUdQ==
X-Received: by 2002:a05:600c:468b:b0:3eb:f5a2:2d49 with SMTP id p11-20020a05600c468b00b003ebf5a22d49mr16354897wmo.0.1680101342429;
        Wed, 29 Mar 2023 07:49:02 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id z3-20020a05600c0a0300b003ee6aa4e6a9sm2871660wmp.5.2023.03.29.07.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 07:49:02 -0700 (PDT)
Message-ID: <56ab2e76-1d5e-0002-cf23-6c7e9b82d233@grimberg.me>
Date: Wed, 29 Mar 2023 17:49:00 +0300
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
> +	bool "NVMe/TCP TLS encryption support"
> +	depends on NVME_COMMON

depends on TLS as well? Or maybe select would be more appropriate?

> +	select KEYS
> +	help
> +	  Enables TLS encryption for NVMe/TCP using the netlink handshake API.
> +
> +	  If unsure, say N.

Would it not make sense to default it to y?

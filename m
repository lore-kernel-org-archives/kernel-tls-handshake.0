Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C5F9460
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 13:50:07 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id cn12so14287251edb.4
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 06:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679406605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLbUWdsVkoJ7W1ID9cXPzFHB8tA7OxZfpINoAt9+e1Y=;
        b=cFLg2AOz3AvSi9h4Zu83yejpsBwtKFi8JVdzMGjdvVxfPuMJgL/wrdA4SNN+MC5WcY
         GIq7CO6CmVYnbWMJo8b6L+gFblc7ResgWoy+XsSmbaxwNeAGyN7yIs8j8b9MZTLvC2nR
         reUi0gVNj5m6HR3rGDYJiQSQfbVgoLPzy6b9IP6En4MteflQqsa6+VO9D+fh+P4bpsHF
         FGCY61YTcDa1pxzyyHObWJZhGlIYhLPONyVWn4Z7QkSdlKPv1NHCWm+I/ioBQL98xF69
         2frL2+b0gvQ3E7DX1lUNMFZyj9YBuPW9jp7SdpMkT3wE7El/09JlbSKy/AVRLY8+Q8Ps
         f1qA==
X-Gm-Message-State: AO0yUKXpuXSF2sFkCdjFHVLXwWPjOPO/wgR8Sq/UdYx4zgy01uoNSvpH
	u2RsXcRGZ4j9Nxg7JDLq7Nk=
X-Google-Smtp-Source: AK7set8R4uP67AmZxemG5DllKx9Oj3m5rfKH6IRzU3rQHiFbWNkX9zQuXMiS/jWz9bJX9SRJ6dooMg==
X-Received: by 2002:a17:906:5307:b0:931:5145:c51d with SMTP id h7-20020a170906530700b009315145c51dmr2482227ejo.0.1679406605490;
        Tue, 21 Mar 2023 06:50:05 -0700 (PDT)
Received: from [10.100.102.14] (85.65.253.165.dynamic.barak-online.net. [85.65.253.165])
        by smtp.gmail.com with ESMTPSA id u8-20020a170906b10800b008c9b44b7851sm5826227ejy.182.2023.03.21.06.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 06:50:05 -0700 (PDT)
Message-ID: <08f5a168-3a15-2276-f472-dee926378e65@grimberg.me>
Date: Tue, 21 Mar 2023 15:50:03 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/18] nvme-keyring: register '.nvme' keyring
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-2-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230321124325.77385-2-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/21/23 14:43, Hannes Reinecke wrote:
> Register a '.nvme' keyring to hold keys for TLS and DH-HMAC-CHAP.
> We need a separate keyring as for NVMe the might not be a userspace
> process attached (eg during reconnect), and so the use of a session
> keyring or any other process-related keyrings might not be possible.

So the keys will be stored in the ring such that on any reconnect
userspace will have access to these keys? How does this affect 
dh-hmac-chap keys?

> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/common/Makefile  |  2 +-
>   drivers/nvme/common/keyring.c | 36 +++++++++++++++++++++++++++++++++++
>   drivers/nvme/host/core.c      | 10 +++++++++-
>   include/linux/nvme-keyring.h  | 12 ++++++++++++
>   4 files changed, 58 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/nvme/common/keyring.c
>   create mode 100644 include/linux/nvme-keyring.h
> 
> diff --git a/drivers/nvme/common/Makefile b/drivers/nvme/common/Makefile
> index 720c625b8a52..c4e3b312d2cc 100644
> --- a/drivers/nvme/common/Makefile
> +++ b/drivers/nvme/common/Makefile
> @@ -4,4 +4,4 @@ ccflags-y			+= -I$(src)
>   
>   obj-$(CONFIG_NVME_COMMON)	+= nvme-common.o
>   
> -nvme-common-y			+= auth.o
> +nvme-common-y			+= auth.o keyring.o
> diff --git a/drivers/nvme/common/keyring.c b/drivers/nvme/common/keyring.c
> new file mode 100644
> index 000000000000..3a6e8a0b38e2
> --- /dev/null
> +++ b/drivers/nvme/common/keyring.c
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020 Hannes Reinecke, SUSE Linux
> + */
> +
> +#include <linux/module.h>
> +#include <linux/nvme.h>
> +#include <linux/seq_file.h>
> +#include <linux/key-type.h>
> +#include <keys/user-type.h>
> +
> +static struct key *nvme_keyring;
> +
> +int nvme_keyring_init(void)
> +{
> +	int err;
> +
> +	nvme_keyring = keyring_alloc(".nvme",
> +				     GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
> +				     current_cred(),
> +				     (KEY_POS_ALL & ~KEY_POS_SETATTR) |
> +				     (KEY_USR_ALL & ~KEY_USR_SETATTR),
> +				     KEY_ALLOC_NOT_IN_QUOTA, NULL, NULL);
> +	if (IS_ERR(nvme_keyring))
> +		return PTR_ERR(nvme_keyring);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(nvme_keyring_init);
> +
> +void nvme_keyring_exit(void)
> +{
> +	key_revoke(nvme_keyring);
> +	key_put(nvme_keyring);
> +}
> +EXPORT_SYMBOL_GPL(nvme_keyring_exit);
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index d4be525f8100..839bc7587f54 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -25,6 +25,7 @@
>   #include "nvme.h"
>   #include "fabrics.h"
>   #include <linux/nvme-auth.h>
> +#include <linux/nvme-keyring.h>
>   
>   #define CREATE_TRACE_POINTS
>   #include "trace.h"
> @@ -5415,11 +5416,17 @@ static int __init nvme_core_init(void)
>   		goto unregister_generic_ns;
>   	}
>   
> -	result = nvme_init_auth();
> +	result = nvme_keyring_init();
>   	if (result)
>   		goto destroy_ns_chr;
> +
> +	result = nvme_init_auth();
> +	if (result)
> +		goto keyring_exit;
>   	return 0;
>   
> +keyring_exit:
> +	nvme_keyring_exit();
>   destroy_ns_chr:
>   	class_destroy(nvme_ns_chr_class);
>   unregister_generic_ns:
> @@ -5443,6 +5450,7 @@ static int __init nvme_core_init(void)
>   static void __exit nvme_core_exit(void)
>   {
>   	nvme_exit_auth();
> +	nvme_keyring_exit();
>   	class_destroy(nvme_ns_chr_class);
>   	class_destroy(nvme_subsys_class);
>   	class_destroy(nvme_class);
> diff --git a/include/linux/nvme-keyring.h b/include/linux/nvme-keyring.h
> new file mode 100644
> index 000000000000..a875c06cc922
> --- /dev/null
> +++ b/include/linux/nvme-keyring.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2021 Hannes Reinecke, SUSE Software Solutions
> + */
> +
> +#ifndef _NVME_KEYRING_H
> +#define _NVME_KEYRING_H
> +
> +int nvme_keyring_init(void);
> +void nvme_keyring_exit(void);
> +
> +#endif

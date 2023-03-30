Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B996FB1
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Mar 2023 14:38:09 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3edc2294fb4so9859405e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Mar 2023 07:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680187088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XTO/wDmK2UmTrFBMoprVG6kpljuMcGX46IeTf5JP1x8=;
        b=3RtsQxgjBzPNApHOUimucLhYXaaURjJQLtljROV45LQYtMxvCYkIh9FLFMDUUPUOom
         dJoN6DTDoZfTbwDMOw3Ro+SpQfI3YjCR/S6ZyKdvVI43XTuFQ7oYyUPNDqDbfDPRQj3q
         WDDj5rHjORt0biu+HTYRfGtyi7WUqRS0EhshKUACjXhplU2CsKodo9pbDr2/D3AVdGJH
         Ohw/JsMNxQwnkPzoRj3EtN/3BPcP4TKSJKwOK7bTVAm7AwT3FPADvvviVahxjsW6x1pF
         DrdXRbN5VjcqnoZm3uL9kc5fXmkWgA0swm+AB9xg2jPlxmNYc5xKgwhL0793/PmzbJKb
         UgKA==
X-Gm-Message-State: AAQBX9dXaD8bISWFeMoHwUP3BxGor/c6Cf8J4uWvlY/aV5SzqkTiEQn7
	3kUB8DR32GZ5NrKXxUE6xhs=
X-Google-Smtp-Source: AKy350Z5nQIEFMpyzn9bWokRg3bgkLalPWl4ZCHGhtXF25bNAvJ3Fi5G1VvqZZT4eO+x4JCWfj5lqw==
X-Received: by 2002:a05:600c:4fc9:b0:3ef:7bc5:4e14 with SMTP id o9-20020a05600c4fc900b003ef7bc54e14mr2202600wmq.4.1680187087792;
        Thu, 30 Mar 2023 07:38:07 -0700 (PDT)
Received: from [10.100.102.14] (85.65.206.11.dynamic.barak-online.net. [85.65.206.11])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b003ee1e07a14asm6459623wmq.45.2023.03.30.07.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 07:38:07 -0700 (PDT)
Message-ID: <b0c0b258-7af8-4ab7-bed3-901744c79378@grimberg.me>
Date: Thu, 30 Mar 2023 17:38:05 +0300
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
To: Daniel Wagner <dwagner@suse.de>, Hannes Reinecke <hare@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-2-hare@suse.de>
 <20230330085338.cf5z7zvy3elxiusm@carbon.lan>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230330085338.cf5z7zvy3elxiusm@carbon.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/30/23 11:53, Daniel Wagner wrote:
> On Wed, Mar 29, 2023 at 03:59:21PM +0200, Hannes Reinecke wrote:
>> +++ b/drivers/nvme/host/core.c
>> @@ -25,6 +25,9 @@
>>   #include "nvme.h"
>>   #include "fabrics.h"
>>   #include <linux/nvme-auth.h>
>> +#ifdef CONFIG_NVME_TLS
>> +#include <linux/nvme-keyring.h>
>> +#endif
>>   
>>   #define CREATE_TRACE_POINTS
>>   #include "trace.h"
>> @@ -3954,7 +3957,6 @@ static umode_t nvme_dev_attrs_are_visible(struct kobject *kobj,
>>   	if (a == &dev_attr_dhchap_ctrl_secret.attr && !ctrl->opts)
>>   		return 0;
>>   #endif
>> -
>>   	return a->mode;
>>   }
>>   
>> @@ -5414,13 +5416,21 @@ static int __init nvme_core_init(void)
>>   		result = PTR_ERR(nvme_ns_chr_class);
>>   		goto unregister_generic_ns;
>>   	}
>> -
>> -	result = nvme_init_auth();
>> +#ifdef CONFIG_NVME_TLS
>> +	result = nvme_keyring_init();
>>   	if (result)
>>   		goto destroy_ns_chr;
>> +#endif
> 
> Would it make sense to introduce empty nvme_keyring_init() function for
> !CONFIG_NVME_TLS and avoid this ifdefery here?

Yes.

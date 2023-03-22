Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F95E28FC
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 12:53:32 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id p13-20020a05600c358d00b003ed346d4522so11432807wmq.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 05:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679489610; x=1682081610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GBQh/e32RGe9v9WGlCa+SOrd9E3q84+zj4tZ8nuIydc=;
        b=6f3D/CFytMFSOJwpwEmy2ZyH4e9I6/pNdiyqhUFO4qIahrRsE68zwHBUF+CIzn7YQ8
         uVsXg1W4RpolOjvTxcW6v3eti/HL9oZPQ4gP696wacrvIf4yFYvg05eCS8PktSdZQ+aD
         Eoqu9K1KkczUcPDHh9Zqc1qoHwECW0GwGhjkYHCP2YDQBG+iV+86nDqao6wAp92+Etu6
         /Ce9p1VCEOMaYxrzMjty4FHseeahRlla/zzv4TBwJCQoIcNXq5xgGU0ZCEGsaLCIXywf
         OdrfWfU9n6Iv9OGttYL4pn5yCRsRCm0E59jXmhXvsIrX30Zrf5nG/J1MGSOBqps6KK+k
         zAvw==
X-Gm-Message-State: AO0yUKViR5vj+bVhmaWobBxlbcYe1aflMDHDxua0TyaJ6LXBQ7ehFihp
	XRy/0iFsHT1CNwTLEujEI4U=
X-Google-Smtp-Source: AK7set/sHCiN0T0QIuyoA7Zr05W3132oqLlW19kbV9EId9352YrqIurcnzsWZJuRvlHgI2tIqpfl9g==
X-Received: by 2002:a05:600c:3b90:b0:3ee:52fb:6dd9 with SMTP id n16-20020a05600c3b9000b003ee52fb6dd9mr2686853wms.4.1679489610394;
        Wed, 22 Mar 2023 05:53:30 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id n23-20020a7bcbd7000000b003ed243222adsm16504786wmi.42.2023.03.22.05.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 05:53:30 -0700 (PDT)
Message-ID: <c2b69576-19ce-b39f-0ff6-1e5f6c143b40@grimberg.me>
Date: Wed, 22 Mar 2023 14:53:28 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 00/18] nvme: In-kernel TLS support for TCP
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <98884644-99f3-7b3c-387a-66fbdd98d4ed@grimberg.me>
 <f9630511-d843-89fe-64db-1a4c41dbbd08@suse.de>
 <d57b8847-b57e-487d-cf90-c63f86716d6a@grimberg.me>
 <c90f39ed-1bcc-7a8f-fd2d-ee4663e94bb4@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <c90f39ed-1bcc-7a8f-fd2d-ee4663e94bb4@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>>>> Hi all,
>>>>>
>>>>> finally I've managed to put all things together and enable in-kernel
>>>>> TLS support for NVMe-over-TCP.
>>>>
>>>> Hannes (and Chuck) this is great, I'm very happy to see this!
>>>>
>>>> I'll start a detailed review soon enough.
>>>>
>>>> Thank you for doing this.
>>>>
>>>>> The patchset is based on the TLS upcall mechanism from Chuck Lever
>>>>> (cf '[PATCH v7 0/2] Another crack at a handshake upcall mechanism'
>>>>> posted to the linux netdev list), and requires the 'tlshd' userspace
>>>>> daemon (https://github.com/oracle/ktls-utils) for the actual TLS 
>>>>> handshake.
>>>>
>>>> Do you have an actual link to follow for this patch set?
>>>
>>> Sure.
>>>
>>> git.kernel.org:/pub/scm/linux/kernel/git/hare/scsi-devel.git
>>> branch tls-netlink.v7
>>
>> I meant Chuck's posting on linux-netdev.
> 
> To be found here:
> 
> <https://www.spinics.net/lists/netdev/msg890047.html>

Nice, it would be great to see code, if you have it, for nvme-cli and/or
nvmetcli as well.

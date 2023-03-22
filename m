Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEF88C01
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 15:43:15 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso1976366wms.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 08:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679499793; x=1682091793;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=suxlETsiUUstEeIIOtW+butzcDb1YEUR9bU5l0vZ7v8=;
        b=T8A1XsCqD9pAMfYctrtXaDjTJdO4NdH/pAQzOyzJHsMuNSFvuleWq+QnKgIESMIyR8
         atbOBKi3bVmHyFyhUxg5wTP4HhFn23U8r25oXAPCuguyP8fhEbWgle4aQ46JosGBhmE+
         1AFgZdN2H78MW15hEZJIWMyPZpzGXyRz1rDxDEwFNST2/WkYO4HDqs2l6YLesB9Nsh6T
         H0bZToBwB4rTGllTLQRNW9ibDDXVI1AhIdSWftyuo1FURVFz+8UcEta0vYIBfSqPZoc4
         DfvygSpUwoSu00GiuMcbbuXGprzBJ+B4fyKdNxN9exgu70bT2VsWDZxvAGcVYNlNWpRn
         b4ag==
X-Gm-Message-State: AO0yUKX0wsriIr4kExlozbZ5vR8WSGJ763AOY/bfJhpBFTBO6SeTtmge
	ORhJrQXED1zkPG48M7QRIEQ=
X-Google-Smtp-Source: AK7set9faYtwodnXHEpRE7JF1cgnlftbDh34WlKE8E9X6c9u7j0JCl5cyHTw1onWCe50C8cCsm3jfA==
X-Received: by 2002:a05:600c:46c4:b0:3eb:2e2a:be95 with SMTP id q4-20020a05600c46c400b003eb2e2abe95mr6676349wmo.2.1679499793209;
        Wed, 22 Mar 2023 08:43:13 -0700 (PDT)
Received: from [10.100.102.14] (85.65.206.11.dynamic.barak-online.net. [85.65.206.11])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b003ee11ac2288sm8192063wmo.21.2023.03.22.08.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 08:43:13 -0700 (PDT)
Message-ID: <9f3feb6c-6bb9-2293-df4c-41ddcb3bf99f@grimberg.me>
Date: Wed, 22 Mar 2023 17:43:11 +0200
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
 <c2b69576-19ce-b39f-0ff6-1e5f6c143b40@grimberg.me>
 <363f4965-87a0-829b-8556-1bc5006e916f@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <363f4965-87a0-829b-8556-1bc5006e916f@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>>>>>> Hi all,
>>>>>>>
>>>>>>> finally I've managed to put all things together and enable in-kernel
>>>>>>> TLS support for NVMe-over-TCP.
>>>>>>
>>>>>> Hannes (and Chuck) this is great, I'm very happy to see this!
>>>>>>
>>>>>> I'll start a detailed review soon enough.
>>>>>>
>>>>>> Thank you for doing this.
>>>>>>
>>>>>>> The patchset is based on the TLS upcall mechanism from Chuck Lever
>>>>>>> (cf '[PATCH v7 0/2] Another crack at a handshake upcall mechanism'
>>>>>>> posted to the linux netdev list), and requires the 'tlshd' userspace
>>>>>>> daemon (https://github.com/oracle/ktls-utils) for the actual TLS 
>>>>>>> handshake.
>>>>>>
>>>>>> Do you have an actual link to follow for this patch set?
>>>>>
>>>>> Sure.
>>>>>
>>>>> git.kernel.org:/pub/scm/linux/kernel/git/hare/scsi-devel.git
>>>>> branch tls-netlink.v7
>>>>
>>>> I meant Chuck's posting on linux-netdev.
>>>
>>> To be found here:
>>>
>>> <https://www.spinics.net/lists/netdev/msg890047.html>
>>
>> Nice, it would be great to see code, if you have it, for nvme-cli and/or
>> nvmetcli as well.
> 
> PR for libnvme: PR#599
> PR for nvme-cli: PR#1868
> 
> which is just for updating 'nvme gen-tls-key' to allow the admin to 
> provision 'retained' PSKs in the kernel keyring.
> 
> For nvmetcli we actually don't need an update; everything works with the 
> existing code :-)

Can you send these patches together with the next round of submission?

Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DFF1FB1
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 08:16:16 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so5698733wmq.4
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 01:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679472974;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3m7i+zffP8jLV18BUeNJ3reiF252gBIRgmXKF/VSW4o=;
        b=HhNKQ1rISN6rr7dg0k7NfexX6ZJ/c8DeBDrogdSRT5cr2RSEcj+XKpvkFxhxprKrPH
         +AwqYWAzcZYa4XzIOKT84qVFIsg/pAOxaHTukUzT1WI9U527op4jOY4kFF9zlolu0Nuj
         EYncFXaaI+g/eLoUkV2+Is6PIBUoJRvgGiwb/qryfnJURfUgkq4P4wPC4RuQxUtHhP0N
         HUPET+htwMikFxBoMcLLN+7LedBTAfuLm1kU9CC7DYZ87e4luI8lllAtTWk5mcwMwswy
         nhuOF7aY7j6MZUvRDhWtKjTDd5cwm+oYE28zTOvY5V5fAk3zImEiPiM95jQRvBL54MDb
         XiIg==
X-Gm-Message-State: AO0yUKWtmHNB2egxZJO3SllsVDB+lN0CQnbtYpbTNRndzy/kr/WHfh42
	dKr11I7g4gZVITv4Pw/zx7s=
X-Google-Smtp-Source: AK7set9P/8gSsiKFaEBTn2/l/DUTE7TSQucB+9QWRUZuQxGMuISE4lSBh0kqQZFklRRTB85ooBeJAg==
X-Received: by 2002:a05:600c:4755:b0:3ee:1c42:6582 with SMTP id w21-20020a05600c475500b003ee1c426582mr5570499wmo.3.1679472974480;
        Wed, 22 Mar 2023 01:16:14 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id k14-20020a7bc40e000000b003ee0d191539sm7016764wmi.10.2023.03.22.01.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 01:16:14 -0700 (PDT)
Message-ID: <d57b8847-b57e-487d-cf90-c63f86716d6a@grimberg.me>
Date: Wed, 22 Mar 2023 10:16:12 +0200
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
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <f9630511-d843-89fe-64db-1a4c41dbbd08@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>> Hi all,
>>>
>>> finally I've managed to put all things together and enable in-kernel
>>> TLS support for NVMe-over-TCP.
>>
>> Hannes (and Chuck) this is great, I'm very happy to see this!
>>
>> I'll start a detailed review soon enough.
>>
>> Thank you for doing this.
>>
>>> The patchset is based on the TLS upcall mechanism from Chuck Lever
>>> (cf '[PATCH v7 0/2] Another crack at a handshake upcall mechanism'
>>> posted to the linux netdev list), and requires the 'tlshd' userspace
>>> daemon (https://github.com/oracle/ktls-utils) for the actual TLS 
>>> handshake.
>>
>> Do you have an actual link to follow for this patch set?
> 
> Sure.
> 
> git.kernel.org:/pub/scm/linux/kernel/git/hare/scsi-devel.git
> branch tls-netlink.v7

I meant Chuck's posting on linux-netdev.

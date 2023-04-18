Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BD61FA0
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 10:07:51 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f16f792384so5292505e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 03:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681812470; x=1684404470;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zXD+1pLvjDPPuobphY8yfGqnMPmwxQgBLjCdfAbCRyU=;
        b=WttEw+Igl1wUUesmIYIoRPmBbP/lNCFdYAA7gVj37Ss4Q5K14OwcdZH2xCh4bHoeZC
         zHd7k17hMZY88LJU8scTQpBDeDMare6VXiYMNUppR63+UpjDrG7SMaR/T+TDNsdVLPAh
         jzLFN303zfC6Mx8yWMhFi7+C7JmP8gyWr23csH4I8mWP+9S/A7b7EDZD5MOCZWRrL676
         b+YWz8QS+EtdAvDz1FcoE6UK8h9SSj9+laQqckZDmxOV9xYtwXJhi0ULN6iMsIDl0vOU
         uX1Fad7QfF728kEk6e9EpqHfyzMCywdHJ56IO6PEDkQ2DQY90qm5aTDm8d6wN1wkE3WG
         PNjA==
X-Gm-Message-State: AAQBX9evgQ8mHQaSxASfmCDlVS9M9Opf8hzhnt879Q/mGc7ko3DUAt0n
	qV96ZpvDELnxybUXgtkIvpE=
X-Google-Smtp-Source: AKy350al4TY3coJfCg4xQzmLVS7diXcY/czD8cIPMmmxWy98wBFX8Uublt3Jgch/rSSZ5n/P5YBhtg==
X-Received: by 2002:a05:600c:1e12:b0:3f1:727f:1967 with SMTP id ay18-20020a05600c1e1200b003f1727f1967mr5688956wmb.4.1681812469701;
        Tue, 18 Apr 2023 03:07:49 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id t15-20020a05600c198f00b003f173956a82sm5577668wmq.21.2023.04.18.03.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 03:07:49 -0700 (PDT)
Message-ID: <beb7b0e8-2cb5-0c0e-63f9-6a13b9dfb787@grimberg.me>
Date: Tue, 18 Apr 2023 13:07:48 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/18] net/tls: sanitize MSG_EOR handling
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
Cc: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>,
 Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230417130302.86274-1-hare@suse.de>
 <20230417130302.86274-8-hare@suse.de>
 <20af9713-8d64-77de-dfbe-e9e732776d3c@grimberg.me>
 <20230417131048.66b6b3a0@kernel.org>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230417131048.66b6b3a0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>> The TLS stack is using MSG_EOR internally, so the flag cannot be
>>> set for sendmsg()/sendpage(). But to avoid having the caller to
>>> check whether TLS is active modify the code to clear the MSG_EOR
>>> flag. And blank out MSG_MORE / MSG_SENDPAGE_NOTLAST, too, as they
>>> conflict with MSG_EOR anyway.
>>
>> This looks like a temporary workaround to me.
>>
>> The networking folks really need to be CC'd on this (same for patch 6).
> 
> Thanks, when I said "we can support EOR" I obviously meant support
> not ignore it :(  No ack.

Obviously neither Hannes or I have sufficient tls knowledge to properly
support it... It needs to be done by someone who knows the
implementation.

Is this a large scope to add support for it? Because if it is, I'd
simply change nvme to clear MSG_EOR when tls is used (despite my
preference to not do special things for tls).

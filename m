Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E051FA0
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 10:12:41 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f167d0cbb7so5800745e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 03:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681812760; x=1684404760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6WI0nA37AUp34sTUjy1NIlOnJmsm+QM2pR8okkZqu20=;
        b=RFw9+RAfRrQFg8GytHWGQDV0QBdD+N1Wr6Lp/XV7EZLWtU9UlI+EEheZ8hzO5Qr3jD
         ElH+4RXpqNh40W7V0cXd/LysXBzEf7lsTvemH4c80asjPAmXOc/g+WIT0aU5Bhwe90Yt
         0rtxe8jcVAQPOUil/2f7vxvLaX1CYXsggokq2drfokgPpBmhzk86JEYcVHUZz5p25Eez
         tTZgLHKeQROtFnGkF+ycA4yINUZ2ilkcOsI6GVQsI+xJHinNnjzp6jf9I0Ykd+Gs+5ni
         59jdX3/EIRa4C3DF3CHq/kPzZypIBlOscKESQRPxsZk9jChJlWi0kfvlay3oU1F3NU1Q
         UBJg==
X-Gm-Message-State: AAQBX9eCle+hvNvSFh3JVo8ylSUPOPmYWbKxOX4LA+g89G/IFPDPbaAJ
	uv4hDtLm9xCdFTBjELTOPjc=
X-Google-Smtp-Source: AKy350YTDVIUKRtWrSVLFXu8L525ljTg1GyDAY9qN5XohQJESPSBxTCyNQ2XmYjb09rMimH5tOAYyg==
X-Received: by 2002:a05:600c:4f95:b0:3f1:7376:2335 with SMTP id n21-20020a05600c4f9500b003f173762335mr4855498wmq.3.1681812759849;
        Tue, 18 Apr 2023 03:12:39 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c1c0600b003f173987ec2sm5560981wms.22.2023.04.18.03.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 03:12:39 -0700 (PDT)
Message-ID: <f3c2fd60-b09c-6dd4-86f1-1c1e5b371ff4@grimberg.me>
Date: Tue, 18 Apr 2023 13:12:38 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 11/18] nvme-tcp: enable TLS handshake upcall
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Daniel Wagner <dwagner@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev
References: <20230417130302.86274-1-hare@suse.de>
 <20230417130302.86274-12-hare@suse.de>
 <msf6bjfbqiaj7s3ejxjwiueg7omvctsjftnux3qfvwadeg2jiq@hawgvoslzjo2>
 <c6ff524b-df91-f0ef-259e-ada0e1623cd5@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <c6ff524b-df91-f0ef-259e-ada0e1623cd5@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


>>   --- a/drivers/nvme/host/fabrics.c
>>> +++ b/drivers/nvme/host/fabrics.c
>>> @@ -609,6 +609,7 @@ static const match_table_t opt_tokens = {
>>>       { NVMF_OPT_DISCOVERY,        "discovery"        },
>>>       { NVMF_OPT_DHCHAP_SECRET,    "dhchap_secret=%s"    },
>>>       { NVMF_OPT_DHCHAP_CTRL_SECRET,    "dhchap_ctrl_secret=%s"    },
>>> +    { NVMF_OPT_TLS,            "tls"            },
>>>       { NVMF_OPT_ERR,            NULL            }
>>>   };
>>
>> Coming back to your previous discussion about this. 'tls' is always 
>> announced
>> but not always supported. This renders the unsupported option 
>> filtering added to
>> libnvme useles:
>>
>>    https://github.com/linux-nvme/libnvme/issues/612
>>
>> Let's assume we go ahead with this patch. The user set explicit the 
>> tls option
>> via 'nvme connect ... --tls' and the kernel will return EINVAL, but 
>> userland
>> can't really know what it was and drop --tls and retry again (or print 
>> some
>> useful information). It could be any other parameter provided by the 
>> user.
>>
>> How is userland supposed to do any feature detection?
>>
> And that is a good question.
> I've just removed most of the #ifdef annotations on request from Sagi.
> If we were going with your suggestion I would need to bring them back.
> 
> So, Sagi: What should we do?
> Re-clutter and allow nvme-cli to figure out if TLS is supported?
> And have it always enabled and invent other means for nvme-cli?

I don't understand the issue.

userspace already has a way to know if a feature is supported by reading
the misc device.

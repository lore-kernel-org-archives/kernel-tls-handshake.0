Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0327EC3
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 10:32:16 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-2f4130b898cso432645f8f.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 03:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681813935; x=1684405935;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vVcOCrGLH0tQIvj6TC4WA++T6xHKTjj21P8pX9bFbus=;
        b=GPwCaDaLYUoV+1PFBLC/BkKV2cmxDlpX+r+vikCTbAnSMOCNs7zjoVJHJYvXQuAByS
         fd+pruKux/A6+G70tIbB3+o+K02bsEQT1IXhxwaUZYS6NTIEM84hWgJtI6aVes3Swb0h
         Na4mmhXnqcfYxp0z3Ei8bWrcvcyZX6R6Zp0/xkfR3MpTaGS9F0U1xPvxri93o0yjdNEG
         Ho/U6hjsjS0GkPtqGGeMF3pj4cnNaV9KUqKg1DyUmLtiNbQu+b8uFMT3xzQm2Hf9EWSv
         /Ppl9+C+ZxER8INN90c7dRLZiIcuvy2L2B6jyOPWTffv2kJNzh2csXCbuyombZ5LsNnT
         pfNg==
X-Gm-Message-State: AAQBX9f6+V+3oSXiN+mRZ4T9dzzqIgEKyiKinFkmq7armvTdB5lclnt9
	RYSnn8E8D4Gks4IvUUkNpMc=
X-Google-Smtp-Source: AKy350ZHkQOzkQPltNiwqs3Ihj4mwazPQWDYyqriNPfFcI7RWa0jwcM6XE/0Nsj7J2HHnOxG0EbdOg==
X-Received: by 2002:a5d:548e:0:b0:2c7:1c72:699f with SMTP id h14-20020a5d548e000000b002c71c72699fmr8803274wrv.4.1681813934723;
        Tue, 18 Apr 2023 03:32:14 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id x14-20020adfdd8e000000b002efb4f2d240sm8118944wrl.87.2023.04.18.03.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 03:32:14 -0700 (PDT)
Message-ID: <b26166ce-3c3f-912e-d057-9a1a2dc45967@grimberg.me>
Date: Tue, 18 Apr 2023 13:32:13 +0300
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
 <f3c2fd60-b09c-6dd4-86f1-1c1e5b371ff4@grimberg.me>
 <aaa05f01-5047-03ed-2356-2f9544ee4b22@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <aaa05f01-5047-03ed-2356-2f9544ee4b22@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/18/23 13:28, Hannes Reinecke wrote:
> On 4/18/23 12:12, Sagi Grimberg wrote:
>>
>>>>   --- a/drivers/nvme/host/fabrics.c
>>>>> +++ b/drivers/nvme/host/fabrics.c
>>>>> @@ -609,6 +609,7 @@ static const match_table_t opt_tokens = {
>>>>>       { NVMF_OPT_DISCOVERY,        "discovery"        },
>>>>>       { NVMF_OPT_DHCHAP_SECRET,    "dhchap_secret=%s"    },
>>>>>       { NVMF_OPT_DHCHAP_CTRL_SECRET,    "dhchap_ctrl_secret=%s"    },
>>>>> +    { NVMF_OPT_TLS,            "tls"            },
>>>>>       { NVMF_OPT_ERR,            NULL            }
>>>>>   };
>>>>
>>>> Coming back to your previous discussion about this. 'tls' is always 
>>>> announced
>>>> but not always supported. This renders the unsupported option 
>>>> filtering added to
>>>> libnvme useles:
>>>>
>>>>    https://github.com/linux-nvme/libnvme/issues/612
>>>>
>>>> Let's assume we go ahead with this patch. The user set explicit the 
>>>> tls option
>>>> via 'nvme connect ... --tls' and the kernel will return EINVAL, but 
>>>> userland
>>>> can't really know what it was and drop --tls and retry again (or 
>>>> print some
>>>> useful information). It could be any other parameter provided by the 
>>>> user.
>>>>
>>>> How is userland supposed to do any feature detection?
>>>>
>>> And that is a good question.
>>> I've just removed most of the #ifdef annotations on request from Sagi.
>>> If we were going with your suggestion I would need to bring them back.
>>>
>>> So, Sagi: What should we do?
>>> Re-clutter and allow nvme-cli to figure out if TLS is supported?
>>> And have it always enabled and invent other means for nvme-cli?
>>
>> I don't understand the issue.
>>
>> userspace already has a way to know if a feature is supported by reading
>> the misc device.
>>
> Yes. But the output there is generated by evaluating the fields from the 
> fabrics 'opts' structure.
> 
> So if the 'tls' option is present it assumes that TLS is supported.
> With my current patchset the _option_ is always present, but the 
> evaluation of the option once set by nvme-cli might return -EINVAL if 
> it's not compiled in.
> 
> The request from Daniel is to have the compile option for the fabrics 
> 'tls' option, too, such that it doesn't show up with the misc device.
> IE revert the changes which you requested to convert all the
> '#ifdef CONFIG_NVME_TCP_TLS' conditionals.

Thanks for explaining.

Then we can add the ifdef on the opts statement alone, with a comment.

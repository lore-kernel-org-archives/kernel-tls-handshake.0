Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227C123AD
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 10:09:17 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id v1so10291838wrv.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 03:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679479755; x=1682071755;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TMNLtE+8CWLmF5uUFXtLcLDbxmyfL2T3TXUytir8l/A=;
        b=5J+hMOcOtZJ8kW58Y5fvLas5ZjxOPAex8DJjlkfLSZUHtTNnrnBlLhwuy/LDZCU872
         L57QgKbSUBZOkUux0f0c2RPZ6hU8sBCCjZE+F3UjdL7+jvI+pHu/rdtglNYsgoSjKGKk
         WzdSIlXEYi9oxVJxwkDhiP92ymX/pJa6/zsOCGpFA6CVJf7ArfyFTxOxVsBwrz7mTUDm
         jkR1qsz/3BfR8S0GiIK9mryCtIqc0naeMD+wh1/9bChx5LRmhevzT+5N4qaLiWU96h7Q
         6inZv5akUhtrDcVLccnRswoCehVOtla8zCq787T6JTlkY3EAlZf7YhW0e2UJf/gaXHFV
         R7oA==
X-Gm-Message-State: AO0yUKXs1otVDrRvRxdDPe0kUD2jhp5/Pk4tcn+JSWUARj4d8v9i84Pr
	Fw+7JEaMCLibX1neIS4ed9A=
X-Google-Smtp-Source: AK7set88xfIVjuGHWpBfFCXfKDe74Fhv0pWEj7HFHkEm+uNmP5Q0AwXmW0ILJJwAHxqrwGxLxbWypg==
X-Received: by 2002:a5d:6106:0:b0:2ce:a773:1150 with SMTP id v6-20020a5d6106000000b002cea7731150mr3303210wrt.6.1679479755411;
        Wed, 22 Mar 2023 03:09:15 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002cfe685bfd6sm13482471wrw.108.2023.03.22.03.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 03:09:15 -0700 (PDT)
Message-ID: <02f71d8b-754d-e0ba-a351-50cd1b309113@grimberg.me>
Date: Wed, 22 Mar 2023 12:09:13 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 09/18] nvme-tcp: add connect option 'tls'
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-10-hare@suse.de>
 <65e17a9f-cc5a-0286-71fd-34c8560137cd@grimberg.me>
 <131a482e-f2ac-5426-d712-6c5fe91a67c5@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <131a482e-f2ac-5426-d712-6c5fe91a67c5@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


>>> Add a connect option 'tls' to request TLS1.3 in-band encryption, and
>>> abort the connection attempt if TLS could not be established.
>>>
>>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>>> ---
>>>   drivers/nvme/host/fabrics.c | 5 +++++
>>>   drivers/nvme/host/fabrics.h | 2 ++
>>>   drivers/nvme/host/tcp.c     | 7 ++++++-
>>>   3 files changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
>>> index bbaa04a0c502..fdff7cdff029 100644
>>> --- a/drivers/nvme/host/fabrics.c
>>> +++ b/drivers/nvme/host/fabrics.c
>>> @@ -609,6 +609,7 @@ static const match_table_t opt_tokens = {
>>>       { NVMF_OPT_DISCOVERY,        "discovery"        },
>>>       { NVMF_OPT_DHCHAP_SECRET,    "dhchap_secret=%s"    },
>>>       { NVMF_OPT_DHCHAP_CTRL_SECRET,    "dhchap_ctrl_secret=%s"    },
>>> +    { NVMF_OPT_TLS,            "tls"            },
>>>       { NVMF_OPT_ERR,            NULL            }
>>>   };
>>> @@ -632,6 +633,7 @@ static int nvmf_parse_options(struct 
>>> nvmf_ctrl_options *opts,
>>>       opts->hdr_digest = false;
>>>       opts->data_digest = false;
>>>       opts->tos = -1; /* < 0 == use transport default */
>>> +    opts->tls = false;
>>>       options = o = kstrdup(buf, GFP_KERNEL);
>>>       if (!options)
>>> @@ -918,6 +920,9 @@ static int nvmf_parse_options(struct 
>>> nvmf_ctrl_options *opts,
>>>               kfree(opts->dhchap_ctrl_secret);
>>>               opts->dhchap_ctrl_secret = p;
>>>               break;
>>> +        case NVMF_OPT_TLS:
>>> +            opts->tls = true;
>>> +            break;
>>>           default:
>>>               pr_warn("unknown parameter or missing value '%s' in 
>>> ctrl creation request\n",
>>>                   p);
>>> diff --git a/drivers/nvme/host/fabrics.h b/drivers/nvme/host/fabrics.h
>>> index dcac3df8a5f7..c4538a9d437c 100644
>>> --- a/drivers/nvme/host/fabrics.h
>>> +++ b/drivers/nvme/host/fabrics.h
>>> @@ -70,6 +70,7 @@ enum {
>>>       NVMF_OPT_DISCOVERY    = 1 << 22,
>>>       NVMF_OPT_DHCHAP_SECRET    = 1 << 23,
>>>       NVMF_OPT_DHCHAP_CTRL_SECRET = 1 << 24,
>>> +    NVMF_OPT_TLS        = 1 << 25,
>>>   };
>>>   /**
>>> @@ -128,6 +129,7 @@ struct nvmf_ctrl_options {
>>>       int            max_reconnects;
>>>       char            *dhchap_secret;
>>>       char            *dhchap_ctrl_secret;
>>> +    bool            tls;
>>>       bool            disable_sqflow;
>>>       bool            hdr_digest;
>>>       bool            data_digest;
>>> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
>>> index bcf24e9a08e1..bbff1f52a167 100644
>>> --- a/drivers/nvme/host/tcp.c
>>> +++ b/drivers/nvme/host/tcp.c
>>> @@ -1902,6 +1902,9 @@ static int nvme_tcp_alloc_admin_queue(struct 
>>> nvme_ctrl *ctrl)
>>>               break;
>>>       }
>>>       if (ret) {
>>> +        /* Abort if TLS is requested */
>>> +        if (num_keys && ctrl->opts->tls)
>>> +            goto out_free_queue;
>>>           /* Try without TLS */
>>>           ret = nvme_tcp_alloc_queue(ctrl, 0, 0);
>>>           if (ret)
>>> @@ -1934,6 +1937,8 @@ static int __nvme_tcp_alloc_io_queues(struct 
>>> nvme_ctrl *ctrl)
>>>                   break;
>>>           }
>>>           if (ret) {
>>> +            if (num_keys && ctrl->opts->tls)
>>> +                goto out_free_queues;
>>
>> I don't see why we even attempt tls if we're not explicitly told to.
> 
> Because we don't know.

Exactly why we should do what we've been told.

> It's all easy if we do a discovery before connect, as the discovery log 
> page tells us what to do.
> But if we do _not_ do a discovery, how would we know what to do?

The initiator of the connect needs to know that.

> We could try to start off with no TLS, but if the server requires TLS 
> then all we get is a 'connection refused' error, leaving us none the wiser.
> So really we have to start off with TLS (if we have a matching 
> identity). The server then can always refuse the connection (with the 
> same error), in which case we should re-try without TLS.
> That's where the 'tls' option comes in: to avoid having a fallback 
> without TLS.

I don't think we should do any type of fallback in the driver.
I think that if we want a fallback we need to put it in userspace.

> So in the end we have three modes for the client:
> 
> 1) TLS not supported
> 2) TLS allowed (with fallback to non-TLS)
> 3) TLS required (no fallback to non-TLS)
4) TLS allowed, but not desired.

> For modes 2) and 3) a PSK has to be present, and
> the 'tls' option is used to switch from mode 2) to mode 3)

I think that tls option should tell the driver exactly what
it needs to do. It seems wrong to me that now every tcp connection
would unconditionally start with tls and fallback to normal.

But let me think about it some more...

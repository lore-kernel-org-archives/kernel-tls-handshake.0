Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CCF8460
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 15:31:35 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f05f61adbeso7372185e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 08:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681745494; x=1684337494;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/B1DIQ4G+ExycW+/gR3mus18QKSxpH8JiHV+2U3tGo=;
        b=GgsTy8Ty3YK1BAyAdRH4sQU2sB/GezJY2A2OCNUXSxU+9E9BkS79NjJWcsS3VF6+vZ
         PlVEbOFK3QFt0j8A2H4HRrnNWDlu0rGiakO6DuZeG/GZlfYHsTBr7H4Wsxu9TGjMsK95
         lqvbuv5AgSPuQZaEniRmR4N+syf1Wrwgxnk19rADHTMx/Nzzb2MWtRN482zzd37T4lbR
         p1IZH9S/XPduAEqdyIJlagvnR4ZFILlaRrl4aydv2IpxMF59NZy3wEGOA87RaoLJ8uA5
         zqQoJWc687coYWkhyfqUmecL2r4v6HX/MtdV00f9szAsnR12OYm6GfC3VoDvU5sIZGjf
         9QXQ==
X-Gm-Message-State: AAQBX9fNdcnb8YvPsb7PyFtHPu+ORt0f/CJ3IMF0AF6w1sonf7dcjMTf
	KXSSH/ITlcMHudZbPR+wxSY=
X-Google-Smtp-Source: AKy350Yk3blXdCY5+7BRzbp7JGNdf6n86ey2FvPMcvLXxXzmJKJpLjigpe14LFIq8fwf7rwMFFnssw==
X-Received: by 2002:a05:600c:1d1d:b0:3ed:793d:9dd6 with SMTP id l29-20020a05600c1d1d00b003ed793d9dd6mr8341701wms.1.1681745494224;
        Mon, 17 Apr 2023 08:31:34 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id k22-20020a05600c0b5600b003ef64affec7sm12171134wmr.22.2023.04.17.08.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 08:31:33 -0700 (PDT)
Message-ID: <298e74a7-4560-ac01-ad40-24019057b9bb@grimberg.me>
Date: Mon, 17 Apr 2023 18:31:32 +0300
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
To: Hannes Reinecke <hare@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev
References: <20230417130302.86274-1-hare@suse.de>
 <20230417130302.86274-12-hare@suse.de>
 <73d59afa-d385-2616-fc74-13ad3bfe49be@grimberg.me>
 <4e9b3f94-b059-b225-9fa6-68178ebda990@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <4e9b3f94-b059-b225-9fa6-68178ebda990@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


>>>   static int nvme_tcp_alloc_admin_queue(struct nvme_ctrl *ctrl)
>>>   {
>>>       int ret;
>>> +    key_serial_t psk_id = 0;
>>> +
>>> +    if (ctrl->opts->tls) {
>>> +        psk_id = nvme_tls_psk_default(NULL,
>>> +                          ctrl->opts->host->nqn,
>>> +                          ctrl->opts->subsysnqn);
>>> +        if (!psk_id) {
>>> +            dev_err(ctrl->device, "no valid PSK found\n");
>>> +            ret = -ENOKEY;
>>> +            goto out_free_queue;
>>> +        }
>>> +    }
>>> -    ret = nvme_tcp_alloc_queue(ctrl, 0);
>>> +    ret = nvme_tcp_alloc_queue(ctrl, 0, psk_id);
>>>       if (ret)
>>> -        return ret;
>>> +        goto out_free_queue;
>>>       ret = nvme_tcp_alloc_async_req(to_tcp_ctrl(ctrl));
>>>       if (ret)
>>> @@ -1778,9 +1887,15 @@ static int nvme_tcp_alloc_admin_queue(struct 
>>> nvme_ctrl *ctrl)
>>>   static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
>>>   {
>>>       int i, ret;
>>> +    key_serial_t psk_id;
>>> +    if (!ctrl->tls_key) {
>>> +        dev_err(ctrl->device, "no PSK negotiated\n");
>>> +        return -ENOKEY;
>>> +    }
>>
>> is ctrl->tls_key always set? Looks like this is the expectation.
>>
> 
> It needs to be set when TLS is enabled for the admin queue.
> Otherwise no.

Then aren't you missing also and statement with (ctrl->opts->tls) ?

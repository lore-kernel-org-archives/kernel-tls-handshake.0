Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622E633D1
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  3 Apr 2023 12:31:05 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-2cfe3278da7so503809f8f.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 03 Apr 2023 05:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680525063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qFuwslfLoE4sWWAJFNDYX7LQkV0lImtB/4fbY+D4Hno=;
        b=FvoOLSDPaKcBypj/Y44TP6yCWuqu7kmoaSJ6q/yr7vA4coWD6T/faldQR7Fp2pBvzX
         UlD5CXPqW4caPtonpaUsZWOERMWkU8IqzvwikO9TqPcr4g1QIhuD6L4yTXuk7giFg2+4
         Wb5B/ue4UJt5DPSlGo95ci9Nu1qHJIAZI2tKED9I7iKk814WU/amaafV5hh1lF+D8Jv1
         dmGtU6TEN1pgbQ2SKAyjSadLshFF6c479DnqO2XD9hHR2zlfny6jqGhiqkL1lVRxClda
         c6kvoPwYG3ouiDbyIbfJIx6xksczg1y1Rf4bm4vFAMQKteFzaWyALhxg6MJfj6mHAtUa
         W46w==
X-Gm-Message-State: AAQBX9chu4OvyBIFAaotFKclGCn+3Lc9r2ikxMe7H0riVGRdQMDpcfWZ
	ik9eNWO6DVmds3kuCtP0DeI=
X-Google-Smtp-Source: AKy350Z/c4EM4LwyfamIrBtIcJ1qZp3nqYS5CtOf/zcd2n2D7lJXJsVTJPhDTyEQT7fVJnuWfDlNaA==
X-Received: by 2002:a05:600c:3108:b0:3ee:1c42:6582 with SMTP id g8-20020a05600c310800b003ee1c426582mr11843421wmo.3.1680525063536;
        Mon, 03 Apr 2023 05:31:03 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id y22-20020a7bcd96000000b003ee42696acesm11933648wmj.16.2023.04.03.05.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 05:31:03 -0700 (PDT)
Message-ID: <2e63aeab-6384-e10a-40d7-bbe305bba51a@grimberg.me>
Date: Mon, 3 Apr 2023 15:31:02 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 13/18] nvmet: make TCP sectype settable via configfs
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-14-hare@suse.de>
 <6fe0b3db-d60d-822f-b03a-acf697e50ff2@grimberg.me>
 <0c2240f0-27cc-ba19-16d8-8aac0399dda5@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <0c2240f0-27cc-ba19-16d8-8aac0399dda5@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


>>> Add a new configfs attribute 'addr_tsas' to make the TCP sectype
>>> settable via configfs.
>>>
>>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>>> ---
>>>   drivers/nvme/target/configfs.c | 67 ++++++++++++++++++++++++++++++++++
>>>   1 file changed, 67 insertions(+)
>>>
>>> diff --git a/drivers/nvme/target/configfs.c 
>>> b/drivers/nvme/target/configfs.c
>>> index 907143870da5..ca66ee6dc153 100644
>>> --- a/drivers/nvme/target/configfs.c
>>> +++ b/drivers/nvme/target/configfs.c
>>> @@ -303,6 +303,11 @@ static void nvmet_port_init_tsas_rdma(struct 
>>> nvmet_port *port)
>>>       port->disc_addr.tsas.rdma.cms = NVMF_RDMA_CMS_RDMA_CM;
>>>   }
>>> +static void nvmet_port_init_tsas_tcp(struct nvmet_port *port, int 
>>> sectype)
>>> +{
>>> +    port->disc_addr.tsas.tcp.sectype = sectype;
>>> +}
>>> +
>>>   static ssize_t nvmet_addr_trtype_store(struct config_item *item,
>>>           const char *page, size_t count)
>>>   {
>>> @@ -325,11 +330,72 @@ static ssize_t nvmet_addr_trtype_store(struct 
>>> config_item *item,
>>>       port->disc_addr.trtype = nvmet_transport[i].type;
>>>       if (port->disc_addr.trtype == NVMF_TRTYPE_RDMA)
>>>           nvmet_port_init_tsas_rdma(port);
>>> +    else if (port->disc_addr.trtype == NVMF_TRTYPE_TCP)
>>> +        nvmet_port_init_tsas_tcp(port, NVMF_TCP_SECTYPE_NONE);
>>>       return count;
>>>   }
>>>   CONFIGFS_ATTR(nvmet_, addr_trtype);
>>> +static const struct nvmet_type_name_map nvmet_addr_tsas_tcp[] = {
>>> +    { NVMF_TCP_SECTYPE_NONE,    "none" },
>>> +    { NVMF_TCP_SECTYPE_TLS13,    "tls1.3" },
>>> +};
>>> +
>>> +static const struct nvmet_type_name_map nvmet_addr_tsas_rdma[] = {
>>> +    { NVMF_RDMA_QPTYPE_CONNECTED,    "connected" },
>>> +    { NVMF_RDMA_QPTYPE_DATAGRAM,    "datagram"  },
>>> +};
>>> +
>>> +static ssize_t nvmet_addr_tsas_show(struct config_item *item,
>>> +        char *page)
>>> +{
>>> +    struct nvmet_port *port = to_nvmet_port(item);
>>> +    int i;
>>> +
>>> +    if (port->disc_addr.trtype == NVMF_TRTYPE_TCP) {
>>> +        for (i = 0; i < ARRAY_SIZE(nvmet_addr_tsas_tcp); i++) {
>>> +            if (port->disc_addr.tsas.tcp.sectype == 
>>> nvmet_addr_tsas_tcp[i].type)
>>> +                return sprintf(page, "%s\n", 
>>> nvmet_addr_tsas_tcp[i].name);
>>> +        }
>>> +        return sprintf(page, "reserved\n");
>>
>> What is reserved?
>>
> All other values?

Yes, you should just consolidate it outside the if-else instead of "not
required" (which is a treq value iirc).

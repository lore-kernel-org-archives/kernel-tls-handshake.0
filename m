Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754658C02
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Mar 2023 17:37:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B32FD1F85D;
	Thu, 30 Mar 2023 17:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680197838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fnZSpiU1KPYooTl8m78dWpwV9+1ORBKE6ze7KplmJw=;
	b=zyJsPd4+KflqbpwDVJr5BW4s1ju+u9H3HAGVqRnd7BU3wpgpYjyU21rGYGDQ+n/gnn6CEE
	rUAQrotFUoL4j5+RTNA9QMb2ues6PFBzqss97odEv08LR5r1qxxn+Liobgzu2OHQlfsC1M
	wVvUtxBI5D5uBz8h8yFTN+2T8u/dKW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680197838;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fnZSpiU1KPYooTl8m78dWpwV9+1ORBKE6ze7KplmJw=;
	b=mSaT24jIz4yBST59Ca1clKNS8ERWBkrxwvFQhZKtkMxKKyqFJyNFtmk5HeEfWOv30mJXMO
	WxKXR+qNudrLrCBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 88B351348E;
	Thu, 30 Mar 2023 17:37:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id TEDLH87IJWT/DQAAMHmgww
	(envelope-from <hare@suse.de>); Thu, 30 Mar 2023 17:37:18 +0000
Message-ID: <0c2240f0-27cc-ba19-16d8-8aac0399dda5@suse.de>
Date: Thu, 30 Mar 2023 19:37:18 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 13/18] nvmet: make TCP sectype settable via configfs
Content-Language: en-US
To: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-14-hare@suse.de>
 <6fe0b3db-d60d-822f-b03a-acf697e50ff2@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <6fe0b3db-d60d-822f-b03a-acf697e50ff2@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/30/23 18:07, Sagi Grimberg wrote:
> 
>> Add a new configfs attribute 'addr_tsas' to make the TCP sectype
>> settable via configfs.
>>
>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>> ---
>>   drivers/nvme/target/configfs.c | 67 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 67 insertions(+)
>>
>> diff --git a/drivers/nvme/target/configfs.c 
>> b/drivers/nvme/target/configfs.c
>> index 907143870da5..ca66ee6dc153 100644
>> --- a/drivers/nvme/target/configfs.c
>> +++ b/drivers/nvme/target/configfs.c
>> @@ -303,6 +303,11 @@ static void nvmet_port_init_tsas_rdma(struct 
>> nvmet_port *port)
>>       port->disc_addr.tsas.rdma.cms = NVMF_RDMA_CMS_RDMA_CM;
>>   }
>> +static void nvmet_port_init_tsas_tcp(struct nvmet_port *port, int 
>> sectype)
>> +{
>> +    port->disc_addr.tsas.tcp.sectype = sectype;
>> +}
>> +
>>   static ssize_t nvmet_addr_trtype_store(struct config_item *item,
>>           const char *page, size_t count)
>>   {
>> @@ -325,11 +330,72 @@ static ssize_t nvmet_addr_trtype_store(struct 
>> config_item *item,
>>       port->disc_addr.trtype = nvmet_transport[i].type;
>>       if (port->disc_addr.trtype == NVMF_TRTYPE_RDMA)
>>           nvmet_port_init_tsas_rdma(port);
>> +    else if (port->disc_addr.trtype == NVMF_TRTYPE_TCP)
>> +        nvmet_port_init_tsas_tcp(port, NVMF_TCP_SECTYPE_NONE);
>>       return count;
>>   }
>>   CONFIGFS_ATTR(nvmet_, addr_trtype);
>> +static const struct nvmet_type_name_map nvmet_addr_tsas_tcp[] = {
>> +    { NVMF_TCP_SECTYPE_NONE,    "none" },
>> +    { NVMF_TCP_SECTYPE_TLS13,    "tls1.3" },
>> +};
>> +
>> +static const struct nvmet_type_name_map nvmet_addr_tsas_rdma[] = {
>> +    { NVMF_RDMA_QPTYPE_CONNECTED,    "connected" },
>> +    { NVMF_RDMA_QPTYPE_DATAGRAM,    "datagram"  },
>> +};
>> +
>> +static ssize_t nvmet_addr_tsas_show(struct config_item *item,
>> +        char *page)
>> +{
>> +    struct nvmet_port *port = to_nvmet_port(item);
>> +    int i;
>> +
>> +    if (port->disc_addr.trtype == NVMF_TRTYPE_TCP) {
>> +        for (i = 0; i < ARRAY_SIZE(nvmet_addr_tsas_tcp); i++) {
>> +            if (port->disc_addr.tsas.tcp.sectype == 
>> nvmet_addr_tsas_tcp[i].type)
>> +                return sprintf(page, "%s\n", 
>> nvmet_addr_tsas_tcp[i].name);
>> +        }
>> +        return sprintf(page, "reserved\n");
> 
> What is reserved?
> 
All other values?

>> +    } else if (port->disc_addr.trtype == NVMF_TRTYPE_RDMA) {
>> +        for (i = 0; i < ARRAY_SIZE(nvmet_addr_tsas_rdma); i++) {
>> +            if (port->disc_addr.tsas.rdma.qptype == 
>> nvmet_addr_tsas_rdma[i].type)
>> +                return sprintf(page, "%s\n", 
>> nvmet_addr_tsas_rdma[i].name);
>> +        }
>> +        return sprintf(page, "reserved\n");
>> +    }
>> +    return sprintf(page, "not required\n");
>> +}
>> +
>> +static ssize_t nvmet_addr_tsas_store(struct config_item *item,
>> +        const char *page, size_t count)
>> +{
>> +    struct nvmet_port *port = to_nvmet_port(item);
>> +    int i;
>> +
>> +    if (nvmet_is_port_enabled(port, __func__))
>> +        return -EACCES;
>> +
>> +    if (port->disc_addr.trtype != NVMF_TRTYPE_TCP)
>> +        return -EINVAL;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(nvmet_addr_tsas_tcp); i++) {
>> +        if (sysfs_streq(page, nvmet_addr_tsas_tcp[i].name))
>> +            goto found;
>> +    }
>> +
>> +    pr_err("Invalid value '%s' for tsas\n", page);
>> +    return -EINVAL;
>> +
>> +found:
>> +    nvmet_port_init_tsas_tcp(port, nvmet_addr_tsas_tcp[i].type);
>> +    return count;
>> +}
>> +
>> +CONFIGFS_ATTR(nvmet_, addr_tsas);
>> +
>>   /*
>>    * Namespace structures & file operation functions below
>>    */
>> @@ -1741,6 +1807,7 @@ static struct configfs_attribute 
>> *nvmet_port_attrs[] = {
>>       &nvmet_attr_addr_traddr,
>>       &nvmet_attr_addr_trsvcid,
>>       &nvmet_attr_addr_trtype,
>> +    &nvmet_attr_addr_tsas,
>>       &nvmet_attr_param_inline_data_size,
>>   #ifdef CONFIG_BLK_DEV_INTEGRITY
>>       &nvmet_attr_param_pi_enable,

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


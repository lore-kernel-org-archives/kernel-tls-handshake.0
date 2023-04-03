Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80645683
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  3 Apr 2023 12:43:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D6FDB1FF3C;
	Mon,  3 Apr 2023 12:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680525787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUBwuZ+S4oapPXf+bptKK8G2dxg14Dvnu+AZ9g28Nfs=;
	b=0RE7HA8rYZk8RJy+JWaR1uzAHljKraQPunqfOF12wX2iMy4QVBiTG+kl1d9G4bwp0b9+Sq
	CyM3VqQivJ1/FW4v68Vgl2SCxVgEE2rFXtJUfGKMhde6YnFvio/y1WmnWdCDlIxbmxGt95
	ZSDeS1cSkNY2LzFKDpCT1Dhz3wdTF7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680525787;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUBwuZ+S4oapPXf+bptKK8G2dxg14Dvnu+AZ9g28Nfs=;
	b=tBm+H358pUR7jML9ROjR1rfq4BXDFKtT5HM+jhC7fiWXDINltqJyhkPeWNGB3iupUrtyuL
	PcCKZhgsRLVu9/Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB4181331A;
	Mon,  3 Apr 2023 12:43:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OJzAK9vJKmQoVQAAMHmgww
	(envelope-from <hare@suse.de>); Mon, 03 Apr 2023 12:43:07 +0000
Message-ID: <9db0016b-f56c-99fc-45e0-26a5f48fb4e3@suse.de>
Date: Mon, 3 Apr 2023 14:43:07 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 13/18] nvmet: make TCP sectype settable via configfs
Content-Language: en-US
To: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-14-hare@suse.de>
 <6fe0b3db-d60d-822f-b03a-acf697e50ff2@grimberg.me>
 <0c2240f0-27cc-ba19-16d8-8aac0399dda5@suse.de>
 <2e63aeab-6384-e10a-40d7-bbe305bba51a@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <2e63aeab-6384-e10a-40d7-bbe305bba51a@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/3/23 14:31, Sagi Grimberg wrote:
> 
>>>> Add a new configfs attribute 'addr_tsas' to make the TCP sectype
>>>> settable via configfs.
>>>>
>>>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>>>> ---
>>>>   drivers/nvme/target/configfs.c | 67 
>>>> ++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 67 insertions(+)
>>>>
>>>> diff --git a/drivers/nvme/target/configfs.c 
>>>> b/drivers/nvme/target/configfs.c
>>>> index 907143870da5..ca66ee6dc153 100644
>>>> --- a/drivers/nvme/target/configfs.c
>>>> +++ b/drivers/nvme/target/configfs.c
>>>> @@ -303,6 +303,11 @@ static void nvmet_port_init_tsas_rdma(struct 
>>>> nvmet_port *port)
>>>>       port->disc_addr.tsas.rdma.cms = NVMF_RDMA_CMS_RDMA_CM;
>>>>   }
>>>> +static void nvmet_port_init_tsas_tcp(struct nvmet_port *port, int 
>>>> sectype)
>>>> +{
>>>> +    port->disc_addr.tsas.tcp.sectype = sectype;
>>>> +}
>>>> +
>>>>   static ssize_t nvmet_addr_trtype_store(struct config_item *item,
>>>>           const char *page, size_t count)
>>>>   {
>>>> @@ -325,11 +330,72 @@ static ssize_t nvmet_addr_trtype_store(struct 
>>>> config_item *item,
>>>>       port->disc_addr.trtype = nvmet_transport[i].type;
>>>>       if (port->disc_addr.trtype == NVMF_TRTYPE_RDMA)
>>>>           nvmet_port_init_tsas_rdma(port);
>>>> +    else if (port->disc_addr.trtype == NVMF_TRTYPE_TCP)
>>>> +        nvmet_port_init_tsas_tcp(port, NVMF_TCP_SECTYPE_NONE);
>>>>       return count;
>>>>   }
>>>>   CONFIGFS_ATTR(nvmet_, addr_trtype);
>>>> +static const struct nvmet_type_name_map nvmet_addr_tsas_tcp[] = {
>>>> +    { NVMF_TCP_SECTYPE_NONE,    "none" },
>>>> +    { NVMF_TCP_SECTYPE_TLS13,    "tls1.3" },
>>>> +};
>>>> +
>>>> +static const struct nvmet_type_name_map nvmet_addr_tsas_rdma[] = {
>>>> +    { NVMF_RDMA_QPTYPE_CONNECTED,    "connected" },
>>>> +    { NVMF_RDMA_QPTYPE_DATAGRAM,    "datagram"  },
>>>> +};
>>>> +
>>>> +static ssize_t nvmet_addr_tsas_show(struct config_item *item,
>>>> +        char *page)
>>>> +{
>>>> +    struct nvmet_port *port = to_nvmet_port(item);
>>>> +    int i;
>>>> +
>>>> +    if (port->disc_addr.trtype == NVMF_TRTYPE_TCP) {
>>>> +        for (i = 0; i < ARRAY_SIZE(nvmet_addr_tsas_tcp); i++) {
>>>> +            if (port->disc_addr.tsas.tcp.sectype == 
>>>> nvmet_addr_tsas_tcp[i].type)
>>>> +                return sprintf(page, "%s\n", 
>>>> nvmet_addr_tsas_tcp[i].name);
>>>> +        }
>>>> +        return sprintf(page, "reserved\n");
>>>
>>> What is reserved?
>>>
>> All other values?
> 
> Yes, you should just consolidate it outside the if-else instead of "not
> required" (which is a treq value iirc).
> 
Okay, will do.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		           Kernel Storage Architect
hare@suse.de			                  +49 911 74053 688
SUSE Software Solutions Germany GmbH, Frankenstr. 146, 90461 Nürnberg
Managing Directors: I. Totev, A. Myers, A. McDonald, M. B. Moerman
(HRB 36809, AG Nürnberg)


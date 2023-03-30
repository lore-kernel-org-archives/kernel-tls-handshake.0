Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2F08835
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Mar 2023 16:07:07 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id v6-20020a05600c470600b003f034269c96so1892035wmo.4
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Mar 2023 09:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680192425;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hEB5Mel7Vd54w/4ERCDqxMCUSy7mqUDyjKGbo6pcA/4=;
        b=I3J4AybRAqr1FGrG0cbA58bhtaIcNdSAMLj2YgG9NWi5hnx43Htecrfkr1AjLvlewe
         ftyQVepgbKk7qIsT5O4ttKWd/r1mM/XzEkFW3CvfkJU4B3fYFBercmh3OW9DYXpTJnll
         suNrAN6TD0DkhWmIvVSu3Yb4Dy6Xww+5bO9GJ1Wh4jhxrrC50LZoDkdGTD2NHwRkLaA3
         04GeAmla23aaCL7qtNwGQjKUyNXq4oUoHxWlnZwFBoFnxiUocVRgGWs/HauIguUmTc7w
         1Rtm8emBO18REDOaEG5lHM/xnv2gentn0N+LSP2co0a+xCdz8fIZVgLPcUG+Z9owp3hm
         4SRw==
X-Gm-Message-State: AAQBX9e++XE+ZVPt7JPtKk0bN0NusKe57+w9SgAjx3h93DF2RMGtabAo
	FvqsSLFNixGFfN2/6aN0SJU=
X-Google-Smtp-Source: AKy350bKBX4MA3yXro5wM9AbxV3V7cg5tYMLc2MvvS3H2UrzxMT13MoEydjOCfY0/9y6zq8asJJmuQ==
X-Received: by 2002:a05:600c:3d8b:b0:3f0:34c4:e76d with SMTP id bi11-20020a05600c3d8b00b003f034c4e76dmr2392501wmb.0.1680192425606;
        Thu, 30 Mar 2023 09:07:05 -0700 (PDT)
Received: from [10.100.102.14] (85.65.206.11.dynamic.barak-online.net. [85.65.206.11])
        by smtp.gmail.com with ESMTPSA id fc11-20020a05600c524b00b003ebff290a52sm6683818wmb.28.2023.03.30.09.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 09:07:05 -0700 (PDT)
Message-ID: <6fe0b3db-d60d-822f-b03a-acf697e50ff2@grimberg.me>
Date: Thu, 30 Mar 2023 19:07:04 +0300
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
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230329135938.46905-14-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Add a new configfs attribute 'addr_tsas' to make the TCP sectype
> settable via configfs.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/target/configfs.c | 67 ++++++++++++++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
> 
> diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
> index 907143870da5..ca66ee6dc153 100644
> --- a/drivers/nvme/target/configfs.c
> +++ b/drivers/nvme/target/configfs.c
> @@ -303,6 +303,11 @@ static void nvmet_port_init_tsas_rdma(struct nvmet_port *port)
>   	port->disc_addr.tsas.rdma.cms = NVMF_RDMA_CMS_RDMA_CM;
>   }
>   
> +static void nvmet_port_init_tsas_tcp(struct nvmet_port *port, int sectype)
> +{
> +	port->disc_addr.tsas.tcp.sectype = sectype;
> +}
> +
>   static ssize_t nvmet_addr_trtype_store(struct config_item *item,
>   		const char *page, size_t count)
>   {
> @@ -325,11 +330,72 @@ static ssize_t nvmet_addr_trtype_store(struct config_item *item,
>   	port->disc_addr.trtype = nvmet_transport[i].type;
>   	if (port->disc_addr.trtype == NVMF_TRTYPE_RDMA)
>   		nvmet_port_init_tsas_rdma(port);
> +	else if (port->disc_addr.trtype == NVMF_TRTYPE_TCP)
> +		nvmet_port_init_tsas_tcp(port, NVMF_TCP_SECTYPE_NONE);
>   	return count;
>   }
>   
>   CONFIGFS_ATTR(nvmet_, addr_trtype);
>   
> +static const struct nvmet_type_name_map nvmet_addr_tsas_tcp[] = {
> +	{ NVMF_TCP_SECTYPE_NONE,	"none" },
> +	{ NVMF_TCP_SECTYPE_TLS13,	"tls1.3" },
> +};
> +
> +static const struct nvmet_type_name_map nvmet_addr_tsas_rdma[] = {
> +	{ NVMF_RDMA_QPTYPE_CONNECTED,	"connected" },
> +	{ NVMF_RDMA_QPTYPE_DATAGRAM,	"datagram"  },
> +};
> +
> +static ssize_t nvmet_addr_tsas_show(struct config_item *item,
> +		char *page)
> +{
> +	struct nvmet_port *port = to_nvmet_port(item);
> +	int i;
> +
> +	if (port->disc_addr.trtype == NVMF_TRTYPE_TCP) {
> +		for (i = 0; i < ARRAY_SIZE(nvmet_addr_tsas_tcp); i++) {
> +			if (port->disc_addr.tsas.tcp.sectype == nvmet_addr_tsas_tcp[i].type)
> +				return sprintf(page, "%s\n", nvmet_addr_tsas_tcp[i].name);
> +		}
> +		return sprintf(page, "reserved\n");

What is reserved?

> +	} else if (port->disc_addr.trtype == NVMF_TRTYPE_RDMA) {
> +		for (i = 0; i < ARRAY_SIZE(nvmet_addr_tsas_rdma); i++) {
> +			if (port->disc_addr.tsas.rdma.qptype == nvmet_addr_tsas_rdma[i].type)
> +				return sprintf(page, "%s\n", nvmet_addr_tsas_rdma[i].name);
> +		}
> +		return sprintf(page, "reserved\n");
> +	}
> +	return sprintf(page, "not required\n");
> +}
> +
> +static ssize_t nvmet_addr_tsas_store(struct config_item *item,
> +		const char *page, size_t count)
> +{
> +	struct nvmet_port *port = to_nvmet_port(item);
> +	int i;
> +
> +	if (nvmet_is_port_enabled(port, __func__))
> +		return -EACCES;
> +
> +	if (port->disc_addr.trtype != NVMF_TRTYPE_TCP)
> +		return -EINVAL;
> +
> +	for (i = 0; i < ARRAY_SIZE(nvmet_addr_tsas_tcp); i++) {
> +		if (sysfs_streq(page, nvmet_addr_tsas_tcp[i].name))
> +			goto found;
> +	}
> +
> +	pr_err("Invalid value '%s' for tsas\n", page);
> +	return -EINVAL;
> +
> +found:
> +	nvmet_port_init_tsas_tcp(port, nvmet_addr_tsas_tcp[i].type);
> +	return count;
> +}
> +
> +CONFIGFS_ATTR(nvmet_, addr_tsas);
> +
>   /*
>    * Namespace structures & file operation functions below
>    */
> @@ -1741,6 +1807,7 @@ static struct configfs_attribute *nvmet_port_attrs[] = {
>   	&nvmet_attr_addr_traddr,
>   	&nvmet_attr_addr_trsvcid,
>   	&nvmet_attr_addr_trtype,
> +	&nvmet_attr_addr_tsas,
>   	&nvmet_attr_param_inline_data_size,
>   #ifdef CONFIG_BLK_DEV_INTEGRITY
>   	&nvmet_attr_param_pi_enable,

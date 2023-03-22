Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11EE2566
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 12:16:30 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id v4-20020a05600c470400b003ee4f06428fso1788232wmo.4
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 05:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679487389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDA/Ghf/TX7kr3KZzREqnH8Bircr4mFG0VwOERlPICE=;
        b=45cB9LLIYl6Gscbo/eCYDqshSFnTlyx88zfGTYdiHdyanyOBVg4RVQsKZDhQFsftbP
         CfbkaZdK4CBWbAFyhd1VEKe0BrSyO1o+wmRKIADiGnb4DKMoClNobLceYCzw3KzgDGV8
         uCTQogdLy45Gl/XrXIMK7p/RzldG2rSo636evRDyDbi7YG+olaBgJ4XdGoUy0etSIobw
         yAglVJ7QxM4r62gEFM4hQGZBQIEBhRMTbV+TLJVI4fkI54opo/Ov1syjkkBwowb87DeG
         g5grGq27Q5aa9GlR+C2FyOsLwCyFkXAVBfBdduM0DKlqiA3LhLvcCEPBKKHo+/7VD3/4
         dwHw==
X-Gm-Message-State: AO0yUKW9Xat0o3GuBHy6YSyeT8MrPQ2TpicmZhNecgVxaz+Og1JSR3lR
	4xZXPW6TA/qRx9qWwkPIEQGZxOG5oJk=
X-Google-Smtp-Source: AK7set9JFEl8C4+BBWHBNrx4c2J7+8cL7EC8MFu/tyO4Em1JcZLYJTjtlV1qrQFu+pNNEOtZXUnAXw==
X-Received: by 2002:a05:600c:45c3:b0:3eb:f5a2:2d49 with SMTP id s3-20020a05600c45c300b003ebf5a22d49mr5805931wmo.0.1679487389027;
        Wed, 22 Mar 2023 05:16:29 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c191300b003eddc6aa5fasm11156521wmq.39.2023.03.22.05.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 05:16:28 -0700 (PDT)
Message-ID: <c85a6dc1-07b1-daab-2bfd-70cc31309741@grimberg.me>
Date: Wed, 22 Mar 2023 14:16:26 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 16/18] nvmet-tcp: rework sendpage for kTLS
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-17-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230321124325.77385-17-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> kTLS ->sendpage() doesn't support the MSG_EOR flag, and it's
> questionable whether it makes sense for kTLS as one has to copy
> data anyway.
> So use sock_no_sendpage() for kTLS.

Same comments as the host side.
1. separate MSG_EOR from kernel_sendpage
2. keep kernel_sendpage unless unsupported properly.

> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/target/tcp.c | 56 ++++++++++++++++++++++++++++-----------
>   1 file changed, 41 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
> index 6e88e98a2c59..9b69cac84508 100644
> --- a/drivers/nvme/target/tcp.c
> +++ b/drivers/nvme/target/tcp.c
> @@ -570,9 +570,14 @@ static int nvmet_try_send_data_pdu(struct nvmet_tcp_cmd *cmd)
>   	int left = sizeof(*cmd->data_pdu) - cmd->offset + hdgst;
>   	int ret;
>   
> -	ret = kernel_sendpage(cmd->queue->sock, virt_to_page(cmd->data_pdu),
> -			offset_in_page(cmd->data_pdu) + cmd->offset,
> -			left, MSG_DONTWAIT | MSG_MORE | MSG_SENDPAGE_NOTLAST);
> +	if (cmd->queue->tls_psk)
> +		ret = sock_no_sendpage(cmd->queue->sock, virt_to_page(cmd->data_pdu),
> +				      offset_in_page(cmd->data_pdu) + cmd->offset,
> +				      left, MSG_DONTWAIT | MSG_MORE);
> +	else
> +		ret = kernel_sendpage(cmd->queue->sock, virt_to_page(cmd->data_pdu),
> +				      offset_in_page(cmd->data_pdu) + cmd->offset,
> +				      left, MSG_DONTWAIT | MSG_MORE | MSG_SENDPAGE_NOTLAST);
>   	if (ret <= 0)
>   		return ret;
>   
> @@ -600,10 +605,17 @@ static int nvmet_try_send_data(struct nvmet_tcp_cmd *cmd, bool last_in_batch)
>   		if ((!last_in_batch && cmd->queue->send_list_len) ||
>   		    cmd->wbytes_done + left < cmd->req.transfer_len ||
>   		    queue->data_digest || !queue->nvme_sq.sqhd_disabled)
> -			flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
> -
> -		ret = kernel_sendpage(cmd->queue->sock, page, cmd->offset,
> -					left, flags);
> +			flags |= MSG_MORE;
> +
> +		if (queue->tls_psk)
> +			ret = sock_no_sendpage(cmd->queue->sock, page, cmd->offset,
> +					       left, flags);
> +		else {
> +			if (flags & MSG_MORE)
> +				flags |= MSG_SENDPAGE_NOTLAST;
> +			ret = kernel_sendpage(cmd->queue->sock, page, cmd->offset,
> +					      left, flags);
> +		}
>   		if (ret <= 0)
>   			return ret;
>   
> @@ -645,12 +657,19 @@ static int nvmet_try_send_response(struct nvmet_tcp_cmd *cmd,
>   	int ret;
>   
>   	if (!last_in_batch && cmd->queue->send_list_len)
> -		flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
> -	else
> +		flags |= MSG_MORE;
> +	else if (!cmd->queue->tls_psk)
>   		flags |= MSG_EOR;
>   
> -	ret = kernel_sendpage(cmd->queue->sock, virt_to_page(cmd->rsp_pdu),
> -		offset_in_page(cmd->rsp_pdu) + cmd->offset, left, flags);
> +	if (cmd->queue->tls_psk)
> +		ret = sock_no_sendpage(cmd->queue->sock, virt_to_page(cmd->rsp_pdu),
> +			offset_in_page(cmd->rsp_pdu) + cmd->offset, left, flags);
> +	else {
> +		if (flags & MSG_MORE)
> +			flags |= MSG_SENDPAGE_NOTLAST;
> +		ret = kernel_sendpage(cmd->queue->sock, virt_to_page(cmd->rsp_pdu),
> +			offset_in_page(cmd->rsp_pdu) + cmd->offset, left, flags);
> +	}
>   	if (ret <= 0)
>   		return ret;
>   	cmd->offset += ret;
> @@ -673,12 +692,19 @@ static int nvmet_try_send_r2t(struct nvmet_tcp_cmd *cmd, bool last_in_batch)
>   	int ret;
>   
>   	if (!last_in_batch && cmd->queue->send_list_len)
> -		flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
> -	else
> +		flags |= MSG_MORE;
> +	else if (!cmd->queue->tls_psk)
>   		flags |= MSG_EOR;
>   
> -	ret = kernel_sendpage(cmd->queue->sock, virt_to_page(cmd->r2t_pdu),
> -		offset_in_page(cmd->r2t_pdu) + cmd->offset, left, flags);
> +	if (cmd->queue->tls_psk)
> +		ret = sock_no_sendpage(cmd->queue->sock, virt_to_page(cmd->r2t_pdu),
> +			offset_in_page(cmd->r2t_pdu) + cmd->offset, left, flags);
> +	else {
> +		if (flags & MSG_MORE)
> +			flags |= MSG_SENDPAGE_NOTLAST;
> +		ret = kernel_sendpage(cmd->queue->sock, virt_to_page(cmd->r2t_pdu),
> +			offset_in_page(cmd->r2t_pdu) + cmd->offset, left, flags);
> +	}
>   	if (ret <= 0)
>   		return ret;
>   	cmd->offset += ret;

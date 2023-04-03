Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F565683
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  3 Apr 2023 12:52:51 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id hg25-20020a05600c539900b003f05a99a841so127701wmb.3
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 03 Apr 2023 05:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680526370; x=1683118370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JCfDzNMQ70beC5O5GClciZ2nIdUEqxJFrG39irVbzl0=;
        b=I9AoICLoP9NH5+ooo6dXHk5wogO+l23pIy0HBNjtwEk6PzIJRRPs61s5oeAu0QEq9j
         vjvuSRTnh8++uhGTJHTSObjV4KLnNgbWe0Gfx2KAqbErHVfyNr3snjIPPJBwJmKbwv90
         Qv2Qrr2jpIX+SUYM/55U7whl2zD9rPRe4ega1hpFS0NC0MW4C34G6ozDBRSjN3JGjJ42
         mZwE88A1cOsVvZv7Z6kz8op5DHHmbDXg6akfYMKq4vha9RaBXcjMG7Biu2jnJPa41sOa
         FenxaQoYdWLk9ezRj76sujE42c3rbGldSJZKTxHG+GsHJmG3VNYFXiGRs31ZkhAqe7eW
         XsOA==
X-Gm-Message-State: AAQBX9cLXFzh84IevbrxjZtdyiTExLvlzHLf9q6+Mhnbs+3xE16Man5a
	s8sVhll7C81V+lf1O0DtWPM=
X-Google-Smtp-Source: AKy350b3rviohzUfIO7MFp6Cb4Db5lTTVsqX3JSu5+Yi3U4f6Xie/lw51323655120usIZa88tUvMQ==
X-Received: by 2002:a05:600c:1550:b0:3ed:d2ae:9adb with SMTP id f16-20020a05600c155000b003edd2ae9adbmr11760689wmg.0.1680526369871;
        Mon, 03 Apr 2023 05:52:49 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id m18-20020a7bca52000000b003ee44b2effasm11977487wml.12.2023.04.03.05.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 05:52:49 -0700 (PDT)
Message-ID: <6b964823-0a49-b2b5-dba5-4ee054d036a7@grimberg.me>
Date: Mon, 3 Apr 2023 15:52:48 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 16/18] nvmet-tcp: rework sendpage for kTLS
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-17-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230329135938.46905-17-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> kTLS ->sendpage() doesn't support the MSG_EOR flag, so blank
> it out if kTLS is enabled.

I'd prefer we don't do this, but lets wait for the verdict from
Jakub.

> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/target/tcp.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
> index ebec882120fd..5daf16138471 100644
> --- a/drivers/nvme/target/tcp.c
> +++ b/drivers/nvme/target/tcp.c
> @@ -650,7 +650,7 @@ static int nvmet_try_send_response(struct nvmet_tcp_cmd *cmd,
>   
>   	if (!last_in_batch && cmd->queue->send_list_len)
>   		flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
> -	else
> +	else if (!cmd->queue->tls_psk)
>   		flags |= MSG_EOR;
>   
>   	ret = kernel_sendpage(cmd->queue->sock, virt_to_page(cmd->rsp_pdu),
> @@ -678,7 +678,7 @@ static int nvmet_try_send_r2t(struct nvmet_tcp_cmd *cmd, bool last_in_batch)
>   
>   	if (!last_in_batch && cmd->queue->send_list_len)
>   		flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
> -	else
> +	else if (!cmd->queue->tls_psk)
>   		flags |= MSG_EOR;
>   
>   	ret = kernel_sendpage(cmd->queue->sock, virt_to_page(cmd->r2t_pdu),
> @@ -708,7 +708,7 @@ static int nvmet_try_send_ddgst(struct nvmet_tcp_cmd *cmd, bool last_in_batch)
>   
>   	if (!last_in_batch && cmd->queue->send_list_len)
>   		msg.msg_flags |= MSG_MORE;
> -	else
> +	else if (!cmd->queue->tls_psk)
>   		msg.msg_flags |= MSG_EOR;
>   
>   	ret = kernel_sendmsg(queue->sock, &msg, &iov, 1, iov.iov_len);

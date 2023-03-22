Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C347C2566
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 12:24:47 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id m35so11391180wms.4
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 05:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679487886; x=1682079886;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tITh4dChYxkdvElKxegNDMZLJ2gmBrwwzBXiwwFG7p8=;
        b=ew3/AN3OQCY9TmLAWx9w546Bt9VYYDWzPqlsUXHa+X4/gPBo26llZ4RvUgdD6H2+9L
         YTl8LdTPJmsf+lJvgIlZg7ZMsSv5r3rEX41hZWFqcKO7bXUS8UQ0keUnG8A7su1rpd+a
         OdisZXUl9CTbdSKuFo3frUJUNtsPiSjmBoCM+ydo4uptQDiuHD6uOp45nDlaCrZc27Ej
         rUxYBhcZyzMYsp1F0VNe/d1l581CvgFmq1ztJE49k6D9fV98f0opS1ehGk9pnMeklwE2
         tEuNfZQyfTih3RbEssLTUSkBb1bCJLhoNub9fsjNIpZkbIlBCJtDLXubF+GQz3cUZ5la
         fpyQ==
X-Gm-Message-State: AO0yUKVB6hpmdcA7QPaJsY7c7DIIn3j+rURkfWtRYF/bK1bVwpm2ONL2
	sFqSbiOJfq0iSSHC+pUdhTs=
X-Google-Smtp-Source: AK7set+NcyNnnfdwbnu9SnPtbrsgXCc3q7AWF32KXpsoHWY72qpFrbtwDCdKgMruqbMmN28Eu0+jdg==
X-Received: by 2002:a05:600c:46c4:b0:3eb:2e2a:be95 with SMTP id q4-20020a05600c46c400b003eb2e2abe95mr6029677wmo.2.1679487886031;
        Wed, 22 Mar 2023 05:24:46 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c05c500b003edf2ae2432sm9515845wmd.7.2023.03.22.05.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 05:24:45 -0700 (PDT)
Message-ID: <c7d0546b-0844-b1aa-7e35-0b304ebc59e9@grimberg.me>
Date: Wed, 22 Mar 2023 14:24:44 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 18/18] nvmet-tcp: peek icreq before starting TLS
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-19-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230321124325.77385-19-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/21/23 14:43, Hannes Reinecke wrote:
> Incoming connection might be either 'normal' NVMe-TCP connections
> starting with icreq or TLS handshakes. To ensure that 'normal'
> connections can still be handled we need to peek the first packet
> and only start TLS handshake if it's not an icreq.

I think that for nvmet, we will want to strictly enforce tsas.sectype.
What are we gaining from allowing this?

And if you insist that we must, then this needs to be an explicit
setting to a permissive mode.

> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/target/tcp.c | 60 +++++++++++++++++++++++++++++++++++++--
>   1 file changed, 58 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
> index a69647fb2c81..a328a303c2be 100644
> --- a/drivers/nvme/target/tcp.c
> +++ b/drivers/nvme/target/tcp.c
> @@ -1105,6 +1105,61 @@ static inline bool nvmet_tcp_pdu_valid(u8 type)
>   	return false;
>   }
>   
> +static int nvmet_tcp_try_peek_pdu(struct nvmet_tcp_queue *queue)
> +{
> +	struct nvme_tcp_hdr *hdr = &queue->pdu.cmd.hdr;
> +	int len;
> +	struct kvec iov = {
> +		.iov_base = (u8 *)&queue->pdu + queue->offset,
> +		.iov_len = sizeof(struct nvme_tcp_hdr),
> +	};
> +	char cbuf[CMSG_LEN(sizeof(char))] = {};
> +	unsigned char ctype;
> +	struct cmsghdr *cmsg;
> +	struct msghdr msg = {
> +		.msg_control = cbuf,
> +		.msg_controllen = sizeof(cbuf),
> +		.msg_flags = MSG_PEEK,
> +	};
> +
> +	len = kernel_recvmsg(queue->sock, &msg, &iov, 1,
> +			iov.iov_len, msg.msg_flags);
> +	if (unlikely(len < 0)) {
> +		pr_debug("queue %d peek error %d\n",
> +			 queue->idx, len);
> +		return len;
> +	}
> +
> +	cmsg = (struct cmsghdr *)cbuf;
> +	if (CMSG_OK(&msg, cmsg) &&
> +	    cmsg->cmsg_level == SOL_TLS &&
> +	    cmsg->cmsg_type == TLS_GET_RECORD_TYPE) {
> +		ctype = *((unsigned char *)CMSG_DATA(cmsg));
> +		if (ctype != TLS_RECORD_TYPE_DATA) {
> +			pr_err("queue %d unhandled TLS record %d\n",
> +				queue->idx, ctype);
> +			return -ENOTCONN;
> +		}
> +	}
> +
> +	if (len < sizeof(struct nvme_tcp_hdr)) {
> +		pr_debug("queue %d short read, %d bytes missing\n",
> +			 queue->idx, (int)iov.iov_len - len);
> +		return -EAGAIN;
> +	}
> +	pr_debug("queue %d hdr type %d hlen %d plen %d size %d\n",
> +		 queue->idx, hdr->type, hdr->hlen, hdr->plen,
> +		 (int)sizeof(struct nvme_tcp_icreq_pdu));
> +	if (hdr->type == nvme_tcp_icreq &&
> +	    hdr->hlen == sizeof(struct nvme_tcp_icreq_pdu) &&
> +	    hdr->plen == sizeof(struct nvme_tcp_icreq_pdu)) {
> +		pr_debug("queue %d icreq detected\n",
> +			 queue->idx);
> +		return len;
> +	}
> +	return 0;
> +}
> +
>   static int nvmet_tcp_try_recv_pdu(struct nvmet_tcp_queue *queue)
>   {
>   	struct nvme_tcp_hdr *hdr = &queue->pdu.cmd.hdr;
> @@ -1879,8 +1934,9 @@ static void nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
>   
>   	if (queue->state == NVMET_TCP_Q_TLS_HANDSHAKE) {
>   		nvmet_tcp_save_tls_callbacks(queue);
> -		if (!nvmet_tcp_tls_handshake(queue))
> -			return;
> +		if (!nvmet_tcp_try_peek_pdu(queue))

Who guarantees that a payload already exist? Where is the peek resumes
when a payload already exist?

> +			if (!nvmet_tcp_tls_handshake(queue))
> +				return;
>   		nvmet_tcp_restore_tls_callbacks(queue);
>   
>   		/*

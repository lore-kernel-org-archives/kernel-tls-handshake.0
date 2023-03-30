Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E798835
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Mar 2023 16:08:25 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so13726421wmq.4
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Mar 2023 09:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680192504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ToiM3SZACoWFSi8YWylNkFpayS+WfTASFdFSJ9SSeE=;
        b=vBwK1haqakr2PlJYg3ep6Lb0GjlIpeIapQFBSKs86WQLCFQrc++wv6cn9qfSHNzPgG
         aiRs8NctZAducTwYonkq3PzjCP57ZuSpMbFNqVkxIihfUBbDFm3G0PwMLvMQp1biR+v4
         lqFylOyg7CObHUzpRIy8+a3tNzGI5eptvm9Kig4eGC2nG58+761dt57cjdeBcdLSq+bd
         CGG9CiqKB8uxq+pQ2PXL+UTSPNPFB0enyRYrc0X/4spVGA+2oilitF5vlGGmG345wRvZ
         txc2H8mI9Bvh2LhVTl8qcR00JGEg9PtCEOl6qCZINk+rsambqByXB0XP5WBmajb10XeZ
         Liag==
X-Gm-Message-State: AAQBX9cU29A2T6kCvafUmEAHhRPGkI9oJgBMKLl+iqa41LEw8+HlD+uc
	+0dHueQgACBWq9S4htYDKBg=
X-Google-Smtp-Source: AKy350b/HxIP8RvO4xbH+XyjOrw/qR6UdUFHNWAei2Fq7jP+5kRk5jmT7dcov0PL/TqRAldOdqNftw==
X-Received: by 2002:a05:600c:474d:b0:3ed:2a41:8529 with SMTP id w13-20020a05600c474d00b003ed2a418529mr2365935wmo.2.1680192503947;
        Thu, 30 Mar 2023 09:08:23 -0700 (PDT)
Received: from [10.100.102.14] (85.65.206.11.dynamic.barak-online.net. [85.65.206.11])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c020c00b003ee70225ed2sm6191243wmi.15.2023.03.30.09.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 09:08:23 -0700 (PDT)
Message-ID: <1dfb48db-0d3e-6283-04d0-0481470174d2@grimberg.me>
Date: Thu, 30 Mar 2023 19:08:22 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 14/18] nvmet-tcp: allocate socket file
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-15-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230329135938.46905-15-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/29/23 16:59, Hannes Reinecke wrote:
> When using the TLS upcall we need to allocate a socket file such
> that the userspace daemon is able to use the socket.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/target/tcp.c | 51 +++++++++++++++++++++++++++++----------
>   1 file changed, 38 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
> index 66e8f9fd0ca7..5931971d715f 100644
> --- a/drivers/nvme/target/tcp.c
> +++ b/drivers/nvme/target/tcp.c
> @@ -96,12 +96,14 @@ struct nvmet_tcp_cmd {
>   
>   enum nvmet_tcp_queue_state {
>   	NVMET_TCP_Q_CONNECTING,
> +	NVMET_TCP_Q_TLS_HANDSHAKE,
>   	NVMET_TCP_Q_LIVE,
>   	NVMET_TCP_Q_DISCONNECTING,
>   };
>   
>   struct nvmet_tcp_queue {
>   	struct socket		*sock;
> +	struct file		*sock_file;
>   	struct nvmet_tcp_port	*port;
>   	struct work_struct	io_work;
>   	struct nvmet_cq		nvme_cq;
> @@ -1406,6 +1408,19 @@ static void nvmet_tcp_restore_socket_callbacks(struct nvmet_tcp_queue *queue)
>   	write_unlock_bh(&sock->sk->sk_callback_lock);
>   }
>   
> +static void nvmet_tcp_close_sock(struct nvmet_tcp_queue *queue)
> +{
> +	if (queue->sock_file) {
> +		fput(queue->sock_file);
> +		queue->sock_file = NULL;
> +		queue->sock = NULL;
> +	} else {
> +		WARN_ON(!queue->sock->ops);
> +		sock_release(queue->sock);
> +		queue->sock = NULL;
> +	}
> +}
> +
>   static void nvmet_tcp_uninit_data_in_cmds(struct nvmet_tcp_queue *queue)
>   {
>   	struct nvmet_tcp_cmd *cmd = queue->cmds;
> @@ -1455,12 +1470,11 @@ static void nvmet_tcp_release_queue_work(struct work_struct *w)
>   	nvmet_sq_destroy(&queue->nvme_sq);
>   	cancel_work_sync(&queue->io_work);
>   	nvmet_tcp_free_cmd_data_in_buffers(queue);
> -	sock_release(queue->sock);
> +	nvmet_tcp_close_sock(queue);
>   	nvmet_tcp_free_cmds(queue);
>   	if (queue->hdr_digest || queue->data_digest)
>   		nvmet_tcp_free_crypto(queue);
>   	ida_free(&nvmet_tcp_queue_ida, queue->idx);
> -
>   	page = virt_to_head_page(queue->pf_cache.va);
>   	__page_frag_cache_drain(page, queue->pf_cache.pagecnt_bias);
>   	kfree(queue);
> @@ -1583,7 +1597,7 @@ static int nvmet_tcp_set_queue_sock(struct nvmet_tcp_queue *queue)
>   	return ret;
>   }
>   
> -static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
> +static void nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
>   		struct socket *newsock)
>   {
>   	struct nvmet_tcp_queue *queue;
> @@ -1591,7 +1605,7 @@ static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
>   
>   	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
>   	if (!queue)
> -		return -ENOMEM;
> +		return;
>   
>   	INIT_WORK(&queue->release_work, nvmet_tcp_release_queue_work);
>   	INIT_WORK(&queue->io_work, nvmet_tcp_io_work);
> @@ -1599,15 +1613,28 @@ static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
>   	queue->port = port;
>   	queue->nr_cmds = 0;
>   	spin_lock_init(&queue->state_lock);
> -	queue->state = NVMET_TCP_Q_CONNECTING;
> +	if (queue->port->nport->disc_addr.tsas.tcp.sectype ==
> +	    NVMF_TCP_SECTYPE_TLS13)
> +		queue->state = NVMET_TCP_Q_TLS_HANDSHAKE;
> +	else
> +		queue->state = NVMET_TCP_Q_CONNECTING;
>   	INIT_LIST_HEAD(&queue->free_list);
>   	init_llist_head(&queue->resp_list);
>   	INIT_LIST_HEAD(&queue->resp_send_list);
>   
> +	if (queue->state == NVMET_TCP_Q_TLS_HANDSHAKE) {
> +		queue->sock_file = sock_alloc_file(queue->sock, O_CLOEXEC, NULL);
> +		if (IS_ERR(queue->sock_file)) {
> +			ret = PTR_ERR(queue->sock_file);
> +			queue->sock_file = NULL;
> +			goto out_free_queue;
> +		}
> +	}

Why not always allocate a sock_file? Like in the host?

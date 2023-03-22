Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696FB2566
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 11:46:41 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id y14so16716083wrq.4
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 04:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679485599; x=1682077599;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/m03CqCy4co4tkdyccpWt5yrEXYAiPYEGEjZD1zx0I=;
        b=MFGbMoqi+80VLvrkrqAm3hSFDU3CS5PwaiIY/oCuOnWBhNTojzgE+olnv8+lI2SCK3
         0ZLmGhCRizCvv0PwxKrgaXMItL3zrQ8taQUwcfxdEVBXlVTUFynH9BPOvAGHlIXMcQow
         f57QdzO0VbxNfijnfsXvUgTubgq5LHxNW0MSE61Q9Awx+btgaPbKWdj4HxBLbYrFTCEY
         ZaR5yZI+7QU0MzM2bGem90ckxjp2emeBNJg7OSwl0ysasilqkXSkII9xmcGPwZJBY7sF
         OusWSUMIaxoEwDF7+j1redxQxuVOuAzYC7oQfAHT9wkd/QYz2KQyTtuL62JEoBURpX1h
         ofmQ==
X-Gm-Message-State: AO0yUKUivzXYAAMIs7Y2YCPq07LNd6Wvh9dZkBsyFC930oA4B1A3IINb
	+YmcB7lm0Fm7py3K66X7Sss=
X-Google-Smtp-Source: AK7set8Z4MBk7cU2Ivm8MKOVQYQw4EYILysmY6oX57AQT1wuuI2Uj5yJJiRt+fuwC8E+6eYdq2NYqA==
X-Received: by 2002:adf:edc8:0:b0:2d6:7198:962a with SMTP id v8-20020adfedc8000000b002d67198962amr4173167wro.4.1679485599663;
        Wed, 22 Mar 2023 04:46:39 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002cfe685bfd6sm13674074wrw.108.2023.03.22.04.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 04:46:39 -0700 (PDT)
Message-ID: <8b037b12-86a6-f610-7b56-6d3201b30a25@grimberg.me>
Date: Wed, 22 Mar 2023 13:46:37 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 13/18] nvmet-tcp: allocate socket file
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-14-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230321124325.77385-14-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/21/23 14:43, Hannes Reinecke wrote:
> When using the TLS upcall we need to allocate a socket file such
> that the userspace daemon is able to use the socket.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/target/tcp.c | 49 ++++++++++++++++++++++++++++-----------
>   1 file changed, 36 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
> index 66e8f9fd0ca7..5c43767c5ecd 100644
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
> @@ -1455,12 +1457,19 @@ static void nvmet_tcp_release_queue_work(struct work_struct *w)
>   	nvmet_sq_destroy(&queue->nvme_sq);
>   	cancel_work_sync(&queue->io_work);
>   	nvmet_tcp_free_cmd_data_in_buffers(queue);
> -	sock_release(queue->sock);
> +	if (queue->sock_file) {
> +		fput(queue->sock_file);

I don't remember, but does the fput call sock_release
on the final put? I'd move this into a helper nvmet_tcp_close_sock()
or something.

> +		queue->sock_file = NULL;
> +		queue->sock = NULL;

I always get a bit weary when I see that deallocations are setting
pointers to NULL.

> +	} else {
> +		WARN_ON(!queue->sock->ops);
> +		sock_release(queue->sock);
> +		queue->sock = NULL;
> +	}
>   	nvmet_tcp_free_cmds(queue);
>   	if (queue->hdr_digest || queue->data_digest)
>   		nvmet_tcp_free_crypto(queue);
>   	ida_free(&nvmet_tcp_queue_ida, queue->idx);
> -
>   	page = virt_to_head_page(queue->pf_cache.va);
>   	__page_frag_cache_drain(page, queue->pf_cache.pagecnt_bias);
>   	kfree(queue);
> @@ -1583,7 +1592,7 @@ static int nvmet_tcp_set_queue_sock(struct nvmet_tcp_queue *queue)
>   	return ret;
>   }
>   
> -static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
> +static void nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
>   		struct socket *newsock)

Why is this becoming a void function? This absolutely can fail.

>   {
>   	struct nvmet_tcp_queue *queue;
> @@ -1591,7 +1600,7 @@ static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
>   
>   	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
>   	if (!queue)
> -		return -ENOMEM;
> +		return;
>   
>   	INIT_WORK(&queue->release_work, nvmet_tcp_release_queue_work);
>   	INIT_WORK(&queue->io_work, nvmet_tcp_io_work);
> @@ -1599,15 +1608,28 @@ static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
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
> +
>   	queue->idx = ida_alloc(&nvmet_tcp_queue_ida, GFP_KERNEL);
>   	if (queue->idx < 0) {
>   		ret = queue->idx;
> -		goto out_free_queue;
> +		goto out_sock;
>   	}
>   
>   	ret = nvmet_tcp_alloc_cmd(queue, &queue->connect);
> @@ -1628,7 +1650,7 @@ static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
>   	if (ret)
>   		goto out_destroy_sq;
>   
> -	return 0;
> +	return;
>   out_destroy_sq:
>   	mutex_lock(&nvmet_tcp_queue_mutex);
>   	list_del_init(&queue->queue_list);
> @@ -1638,9 +1660,14 @@ static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
>   	nvmet_tcp_free_cmd(&queue->connect);
>   out_ida_remove:
>   	ida_free(&nvmet_tcp_queue_ida, queue->idx);
> +out_sock:
> +	if (queue->sock_file)
> +		fput(queue->sock_file);
> +	else
> +		sock_release(queue->sock);
>   out_free_queue:
>   	kfree(queue);
> -	return ret;
> +	pr_err("failed to allocate queue");

Can we design this better?
It looks backwards that this routine deallocates an argument
coming from the call-site.

I know that this is similar to what happens with kernel_accept
to some extent. But would prefer to avoid this pattern if possible.

>   }
>   
>   static void nvmet_tcp_accept_work(struct work_struct *w)
> @@ -1657,11 +1684,7 @@ static void nvmet_tcp_accept_work(struct work_struct *w)
>   				pr_warn("failed to accept err=%d\n", ret);
>   			return;
>   		}
> -		ret = nvmet_tcp_alloc_queue(port, newsock);
> -		if (ret) {
> -			pr_err("failed to allocate queue\n");
> -			sock_release(newsock);
> -		}
> +		nvmet_tcp_alloc_queue(port, newsock);
>   	}
>   }
>   

Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9428460
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 15:30:01 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-2ef1e98d6bfso952717f8f.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 08:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681745400; x=1684337400;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L2wQrcRVyuAIpPGc71ANiHIV4S5ExVowWYwR1FSZgz8=;
        b=kUDoLbym6iHqjz7ofIrcXylUdmGqBpK5QvxqLNJlvwibM1UaCdSp/psfmZNzCuQJBB
         yQPtnUvPu+WY9xzky+O4CAzCjzd7T29G1AWhG/edgjugO0VAPub2Fh53pyfj5KgnTrE3
         +af/pwyX4COLVEJZmvfZP8y8tALEaZKCa6w+J93lrp1j/uALmYttLbPd18CvPTzwfR5M
         vyLJlnObodJxfuqq9BQu4l5Kj17EnGVtYMF8oQGEiE9BK5GDk97ImCPnDCLnAFIRbQfq
         eYD0oGXkjNFGxWVAxgSDrLq+WFdsDkP8uTkq0Kz6P6gH6hEHtl5ohPuqngXblW+5Rdqf
         B7uA==
X-Gm-Message-State: AAQBX9en3TgLwRttvulsuqTTyIYR8+qKd1eHuyNms9nAijP0l1fNPtsl
	UAUXg22EUff3doOscmZYT9Q=
X-Google-Smtp-Source: AKy350bzUT9Ex2ko0SNH0oGVnSNnF3uWf8c3swvZe/xp2aM7We6VvKzCgoiyRpOmAAJiHvN+0xwy/A==
X-Received: by 2002:adf:ef89:0:b0:2ef:b4e1:d0da with SMTP id d9-20020adfef89000000b002efb4e1d0damr7115148wro.7.1681745399945;
        Mon, 17 Apr 2023 08:29:59 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id h12-20020a5d4fcc000000b002f22c44e974sm10721598wrw.102.2023.04.17.08.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 08:29:59 -0700 (PDT)
Message-ID: <ff9f7f0c-2131-5a87-054a-a2c75ed48e83@grimberg.me>
Date: Mon, 17 Apr 2023 18:29:58 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 15/18] nvmet-tcp: allocate socket file
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev
References: <20230417130302.86274-1-hare@suse.de>
 <20230417130302.86274-16-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230417130302.86274-16-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/17/23 16:02, Hannes Reinecke wrote:
> For the TLS upcall we need to allocate a socket file such
> that the userspace daemon is able to use the socket.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/target/tcp.c | 36 +++++++++++++++++++++++-------------
>   1 file changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
> index ed98df72c76b..fc7a9fb56a83 100644
> --- a/drivers/nvme/target/tcp.c
> +++ b/drivers/nvme/target/tcp.c
> @@ -122,6 +122,7 @@ struct nvmet_tcp_cmd {
>   
>   enum nvmet_tcp_queue_state {
>   	NVMET_TCP_Q_CONNECTING,
> +	NVMET_TCP_Q_TLS_HANDSHAKE,

I think you got some misplaced chunks in the patch.

>   	NVMET_TCP_Q_LIVE,
>   	NVMET_TCP_Q_DISCONNECTING,
>   };
> @@ -1481,12 +1482,12 @@ static void nvmet_tcp_release_queue_work(struct work_struct *w)
>   	nvmet_sq_destroy(&queue->nvme_sq);
>   	cancel_work_sync(&queue->io_work);
>   	nvmet_tcp_free_cmd_data_in_buffers(queue);
> -	sock_release(queue->sock);
> +	/* ->sock will be released by fput() */
> +	fput(queue->sock->file);
>   	nvmet_tcp_free_cmds(queue);
>   	if (queue->hdr_digest || queue->data_digest)
>   		nvmet_tcp_free_crypto(queue);
>   	ida_free(&nvmet_tcp_queue_ida, queue->idx);
> -
>   	page = virt_to_head_page(queue->pf_cache.va);
>   	__page_frag_cache_drain(page, queue->pf_cache.pagecnt_bias);
>   	kfree(queue);
> @@ -1609,15 +1610,16 @@ static int nvmet_tcp_set_queue_sock(struct nvmet_tcp_queue *queue)
>   	return ret;
>   }
>   
> -static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
> +static void nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
>   		struct socket *newsock)
>   {
>   	struct nvmet_tcp_queue *queue;
> +	struct file *sock_file;
>   	int ret;
>   
>   	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
>   	if (!queue)
> -		return -ENOMEM;
> +		return;
>   
>   	INIT_WORK(&queue->release_work, nvmet_tcp_release_queue_work);
>   	INIT_WORK(&queue->io_work, nvmet_tcp_io_work);
> @@ -1625,15 +1627,25 @@ static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
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
> +	sock_file = sock_alloc_file(queue->sock, O_CLOEXEC, NULL);
> +	if (IS_ERR(sock_file)) {
> +		ret = PTR_ERR(sock_file);
> +		goto out_free_queue;
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
> @@ -1654,7 +1666,7 @@ static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
>   	if (ret)
>   		goto out_destroy_sq;
>   
> -	return 0;
> +	return;
>   out_destroy_sq:
>   	mutex_lock(&nvmet_tcp_queue_mutex);
>   	list_del_init(&queue->queue_list);
> @@ -1664,9 +1676,11 @@ static int nvmet_tcp_alloc_queue(struct nvmet_tcp_port *port,
>   	nvmet_tcp_free_cmd(&queue->connect);
>   out_ida_remove:
>   	ida_free(&nvmet_tcp_queue_ida, queue->idx);
> +out_sock:
> +	fput(queue->sock->file);
>   out_free_queue:
>   	kfree(queue);
> -	return ret;
> +	pr_err("failed to allocate queue");
>   }
>   
>   static void nvmet_tcp_accept_work(struct work_struct *w)
> @@ -1683,11 +1697,7 @@ static void nvmet_tcp_accept_work(struct work_struct *w)
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

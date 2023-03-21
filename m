Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB0D9460
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 13:52:39 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id o12so59953179edb.9
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 06:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679406758; x=1681998758;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0IRz85pGwGG2Tpe80ITqJFBqaaHFvPiEer+idqSdXEg=;
        b=Za4HTg2icqI1BLPK7bI7A8JF8buiutBz5N0exqwHU7ZzgBQC4TFO9m1yeZnogHe0YR
         pVKv0/AB0tVupeoYptC460o1uDu1zVAb1d4O4HFPbkglIXhH7hCDaPsaRmyg1z16d+HU
         AoyFMlfRVlEQLeOhx4tphIFh8xxie742LMzG6vRZ28j4ZdJaNzPkAHmT1/PMKATK7Z2s
         0LP9JQSzy9XTscjg3fAcYj5+giyP0fpDTsk6FS0GikZi07WWIFWjxVwVF+ThPPPFalMO
         pxfzBg15beo9kFJhNPZTEfJhOAHB5FbmEjJyhTfnasj6XQ1dIjuUmBdXR/VMEuuqH0Wx
         eT7A==
X-Gm-Message-State: AO0yUKWxKSU2Wnl8zmwpbJgxlaXG3MRTTFY6OL3qr2zyMsH/2HnsKPYX
	o0dDCcCBOpGKQuHlA5groQM=
X-Google-Smtp-Source: AK7set9uwlFDZoIM064z2OjGPdMCazQ47m4fae1RS/ho02MIVaJpz5r3OZHQHX8HJvkDxD/8Bri2eQ==
X-Received: by 2002:a17:906:dd:b0:92f:27c2:13a3 with SMTP id 29-20020a17090600dd00b0092f27c213a3mr2378739eji.3.1679406758283;
        Tue, 21 Mar 2023 06:52:38 -0700 (PDT)
Received: from [10.100.102.14] (85.65.253.165.dynamic.barak-online.net. [85.65.253.165])
        by smtp.gmail.com with ESMTPSA id fi9-20020a170906da0900b00931faf03db0sm5553460ejb.27.2023.03.21.06.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 06:52:37 -0700 (PDT)
Message-ID: <7944e142-3eb7-68cf-65c4-edaa4e05f135@grimberg.me>
Date: Tue, 21 Mar 2023 15:52:36 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 07/18] nvme/tcp: allocate socket file
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-8-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230321124325.77385-8-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/21/23 14:43, Hannes Reinecke wrote:
> When using the TLS upcall we need to allocate a socket file such
> that the userspace daemon is able to use the socket.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/host/tcp.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 0512eb289dcf..0438d42f4179 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -115,6 +115,7 @@ enum nvme_tcp_recv_state {
>   struct nvme_tcp_ctrl;
>   struct nvme_tcp_queue {
>   	struct socket		*sock;
> +	struct file		*sock_file;
>   	struct work_struct	io_work;
>   	int			io_cpu;
>   
> @@ -1330,7 +1331,12 @@ static void nvme_tcp_free_queue(struct nvme_ctrl *nctrl, int qid)
>   	}
>   
>   	noreclaim_flag = memalloc_noreclaim_save();
> -	sock_release(queue->sock);
> +	if (queue->sock_file) {
> +		fput(queue->sock_file);
> +		queue->sock_file = NULL;
> +		/* ->sock will be released by fput() */
> +	} else
> +		sock_release(queue->sock);
>   	memalloc_noreclaim_restore(noreclaim_flag);
>   
>   	kfree(queue->pdu);
> @@ -1526,6 +1532,12 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid)
>   		goto err_destroy_mutex;
>   	}
>   
> +	queue->sock_file = sock_alloc_file(queue->sock, O_CLOEXEC, NULL);
> +	if (IS_ERR(queue->sock_file)) {
> +		ret = PTR_ERR(queue->sock_file);
> +		queue->sock_file = NULL;
> +		goto err_sock;
> +	}

If a sock_file is always allocated, and fail the connection if
unsuccessful, why do you check on its existence when freeing the queue?

>   	nvme_tcp_reclassify_socket(queue->sock);
>   
>   	/* Single syn retry */
> @@ -1647,7 +1659,12 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid)
>   	if (queue->hdr_digest || queue->data_digest)
>   		nvme_tcp_free_crypto(queue);
>   err_sock:
> -	sock_release(queue->sock);
> +	if (queue->sock_file) {
> +		fput(queue->sock_file);
> +		queue->sock_file = NULL;
> +		/* ->sock will be released by fput() */
> +	} else
> +		sock_release(queue->sock);
>   	queue->sock = NULL;
>   err_destroy_mutex:
>   	mutex_destroy(&queue->send_mutex);

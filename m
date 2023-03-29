Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3D22F30
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 15:57:18 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso10030491wmo.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 08:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105437; x=1682697437;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpBMM16H4VxKR5S0BgjpnB4EOSPEUEXtpuHJU6u+kKM=;
        b=Y+3JfOQykjwOfJhpPSTmVvAmdx0ltZk2NcGpCghHeYKkKr0ab8RMmkYP7d5toA+ZWM
         OYUyXatKLxwE6WxV+Ib7CavpwRI39u3/OMLt4FU0HN3p6tCr418iCZ991yFyDnbSzS9R
         XpIr0Q/9HacAaN36kuCq6Mv9+rcAKCrKvtKV7rvsYaSxnaqBfqa58Ymdweee8EXNOzQR
         jGCCOdd75d4njGrMJiBBhAR6jf0ZguDTyJNCMMmVQoI4t2wUrfCIWooIdR8plYBa3SCh
         T6bv0jzOz4k5ZjZ6I3lIOl3GSkx7sRiv/QEb8G6ZvP/oFjlXTZmWiDj35e6sXgevF914
         BuDg==
X-Gm-Message-State: AAQBX9dOfpM4sW8kzkpsGjH+JWhojsKKmJcKhpf4g2q4NUqV2pqZJfAQ
	Mt1gaI67FC8p69wS+o3gmX8=
X-Google-Smtp-Source: AKy350YnTkuRhy6rZpyGthXVArnJI+1sVROHYPaPXbSSN7o5crWNv2FU6iBYKx+Ie2REEoIG0y+eSQ==
X-Received: by 2002:a05:600c:3c91:b0:3f0:330b:d3d4 with SMTP id bg17-20020a05600c3c9100b003f0330bd3d4mr346969wmb.4.1680105436796;
        Wed, 29 Mar 2023 08:57:16 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id n19-20020a7bcbd3000000b003ef684c5e32sm2594516wmi.48.2023.03.29.08.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 08:57:16 -0700 (PDT)
Message-ID: <54748ec5-2734-0000-1405-3d7e6d898a54@grimberg.me>
Date: Wed, 29 Mar 2023 18:57:14 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 06/18] nvme/tcp: allocate socket file
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-7-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230329135938.46905-7-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> When using the TLS upcall we need to allocate a socket file such
> that the userspace daemon is able to use the socket.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/host/tcp.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 42c0598c31f2..fddf785aba74 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -115,6 +115,7 @@ enum nvme_tcp_recv_state {
>   struct nvme_tcp_ctrl;
>   struct nvme_tcp_queue {
>   	struct socket		*sock;
> +	struct file		*sock_file;

I think that sock->file is storing the file, no need to store it as
well.

>   	struct work_struct	io_work;
>   	int			io_cpu;
>   
> @@ -1330,7 +1331,10 @@ static void nvme_tcp_free_queue(struct nvme_ctrl *nctrl, int qid)
>   	}
>   
>   	noreclaim_flag = memalloc_noreclaim_save();
> -	sock_release(queue->sock);
> +	/* ->sock will be released by fput() */
> +	fput(queue->sock_file);
> +	queue->sock_file = NULL;
> +	queue->sock = NULL;

Is the queue->sock = NULL here required because we allocate a sock_file?

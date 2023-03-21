Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E07810E9
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 13:44:14 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id cn12so14215596edb.4
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 06:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679406252;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qeXImOJXwQZtfKxYWP9d4cBjYPKhnaEc8iXXM/vt6yk=;
        b=ux9YL7NsQ4XfZAtO1VbSgp7tu7X4IfQzJfKpis8Fb3K6iBp9esnDi7py3OcrUS0Utq
         Ld69WfcPHfpQ3+7yQ0BX6mJQvvLpBjojPGgWb4uuuD/Cl3UObuJUQSJ2bw//luz6HdPZ
         HVcjwIG8+XtiBbE6kuUelbxwBfpIVF8ridm00zz2AXZjh1SP+JOWM0SlZbRP5vkZJfKO
         8zaZ5q5zU8Duw6OE8v9g814ApizhBd4BWmT2GKUSVs9bJZwG5RQmjp7yyo1w179tRFbS
         af4+FtqlPt4+Wffg1x++zjuOot/5h7vGpvbaSlJL76BACsJ0VxExUAODKYzaIqZpTrUR
         q7pw==
X-Gm-Message-State: AO0yUKWmkXb8/YAGG3sGg2lSjcNlM0oxdVftPd/Zh6+XGcwloeJysGCU
	EQMrMEYxYrVNhNU73eNlwc4+vBgHweE=
X-Google-Smtp-Source: AK7set+QtgsTOztEKP7Zluhztb0JkFvWLMf3ZhOlj5nPnXp2CzgR+/VuMM+pgBXNRWKMkBK0P2BnaA==
X-Received: by 2002:a17:906:289:b0:92b:dd20:16f5 with SMTP id 9-20020a170906028900b0092bdd2016f5mr2795267ejf.7.1679406252407;
        Tue, 21 Mar 2023 06:44:12 -0700 (PDT)
Received: from [10.100.102.14] (85.65.253.165.dynamic.barak-online.net. [85.65.253.165])
        by smtp.gmail.com with ESMTPSA id o11-20020a17090608cb00b008d0dbf15b8bsm5888283eje.212.2023.03.21.06.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 06:44:12 -0700 (PDT)
Message-ID: <d868b752-1d8b-1236-3543-c9ef82e42f23@grimberg.me>
Date: Tue, 21 Mar 2023 15:44:10 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 06/18] nvme-tcp: call 'queue->data_ready()' in
 nvme_tcp_data_ready()
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-7-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230321124325.77385-7-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Call the original data_ready() callback in nvme_tcp_data_ready()
> to avoid a receive stall.

Can you please improve the description to include what is the stall?
For example, does the stall exist today? If it is, I would like to
separate such patches from this set and include them asap.

> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/host/tcp.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 0e14b1b90855..0512eb289dcf 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -936,12 +936,14 @@ static void nvme_tcp_data_ready(struct sock *sk)
>   
>   	trace_sk_data_ready(sk);
>   
> -	read_lock_bh(&sk->sk_callback_lock);
> -	queue = sk->sk_user_data;
> +	rcu_read_lock_bh();

Now I understand your comment from a previous patch.
Can you explain why is this convention needed?

I would prefer to have it as a separate patch with an
explanation to why it is needed.

> +	queue = rcu_dereference_sk_user_data(sk);
> +	if (queue->data_ready)
> +		queue->data_ready(sk);

Is the tls data_ready call sync or async? just for general knowledge?


>   	if (likely(queue && queue->rd_enabled) &&
>   	    !test_bit(NVME_TCP_Q_POLLING, &queue->flags))
>   		queue_work_on(queue->io_cpu, nvme_tcp_wq, &queue->io_work);
> -	read_unlock_bh(&sk->sk_callback_lock);
> +	rcu_read_unlock_bh();
>   }
>   
>   static void nvme_tcp_write_space(struct sock *sk)

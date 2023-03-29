Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEF22F30
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 15:44:11 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id bg13-20020a05600c3c8d00b003ef90adc168so2211954wmb.5
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 08:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680104650;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7a1dW9F4ojy0JgCrFiPgBOfVCDcXyJKpkSLoLeqaKxc=;
        b=smlmOm4GADCBKiEc5zifDyYxn9cIyRfNOhYfxAuD4hoTtRg8Iaz48iQijr4uMwwytC
         TJO6ipjKN+mSOCX/v+y6C3X4nNLFn9x4nof7b0ugmRgGsiFRZxskyv7nACt3mbU1NqAi
         vaQRAa2mQa64/gny9NGFtRpxNBl1RaKyhAgy+zi+TdCsPHDxaToO7S3QvoFfehfk94FD
         6mbNaCid71IS5vUsp9S8jwskih1LS+iqmMNjFz/f47+N2e7JIPy8gpAaxHuqpnyEAa0a
         IZ3YhMUAveNCHoxSAmXvqQJYtb7FVzuwEYE+vNeoS5lUzWRU1nFIoBKDW8y1aET1NQOC
         tkYQ==
X-Gm-Message-State: AO0yUKVaH66dKgyyMw1l0gyxd05u+rYXBSs1Ux57dlV1hjBlee5Eo5+M
	O49ngYTqd1MXv95Wa2V89kw=
X-Google-Smtp-Source: AK7set8mQkseFBnIly+8D9uyQ3NiEdKfdZul/AC2C/JAiqL7mfXrXE2h01/h7Se325JoscUEQoVRWg==
X-Received: by 2002:a05:600c:1e86:b0:3ed:ebcb:e2c6 with SMTP id be6-20020a05600c1e8600b003edebcbe2c6mr16469814wmb.3.1680104650315;
        Wed, 29 Mar 2023 08:44:10 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id z15-20020a05600c220f00b003ef5f77901dsm2567192wml.45.2023.03.29.08.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 08:44:10 -0700 (PDT)
Message-ID: <1b333727-74a0-04f2-30af-bb89dda870d8@grimberg.me>
Date: Wed, 29 Mar 2023 18:44:08 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 05/18] net/tls: implement ->read_sock()
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev,
 Boris Pismenny <boris.pismenny@gmail.com>
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-6-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230329135938.46905-6-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Implement ->read_sock() function for use with nvme-tcp.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> Cc: Boris Pismenny <boris.pismenny@gmail.com>
> ---
>   net/tls/tls.h      |  2 ++
>   net/tls/tls_main.c |  2 ++
>   net/tls/tls_sw.c   | 71 ++++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 75 insertions(+)
> 
> diff --git a/net/tls/tls.h b/net/tls/tls.h
> index 804c3880d028..a5bf3a9ce142 100644
> --- a/net/tls/tls.h
> +++ b/net/tls/tls.h
> @@ -113,6 +113,8 @@ bool tls_sw_sock_is_readable(struct sock *sk);
>   ssize_t tls_sw_splice_read(struct socket *sock, loff_t *ppos,
>   			   struct pipe_inode_info *pipe,
>   			   size_t len, unsigned int flags);
> +int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
> +		     sk_read_actor_t read_actor);
>   
>   int tls_device_sendmsg(struct sock *sk, struct msghdr *msg, size_t size);
>   int tls_device_sendpage(struct sock *sk, struct page *page,
> diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
> index 3735cb00905d..9b097f2902f6 100644
> --- a/net/tls/tls_main.c
> +++ b/net/tls/tls_main.c
> @@ -934,9 +934,11 @@ static void build_proto_ops(struct proto_ops ops[TLS_NUM_CONFIG][TLS_NUM_CONFIG]
>   
>   	ops[TLS_BASE][TLS_SW  ] = ops[TLS_BASE][TLS_BASE];
>   	ops[TLS_BASE][TLS_SW  ].splice_read	= tls_sw_splice_read;
> +	ops[TLS_BASE][TLS_SW  ].read_sock	= tls_sw_read_sock;
>   
>   	ops[TLS_SW  ][TLS_SW  ] = ops[TLS_SW  ][TLS_BASE];
>   	ops[TLS_SW  ][TLS_SW  ].splice_read	= tls_sw_splice_read;
> +	ops[TLS_SW  ][TLS_SW  ].read_sock	= tls_sw_read_sock;
>   
>   #ifdef CONFIG_TLS_DEVICE
>   	ops[TLS_HW  ][TLS_BASE] = ops[TLS_BASE][TLS_BASE];
> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 782d3701b86f..77d57066daf4 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c
> @@ -2210,6 +2210,77 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
>   	goto splice_read_end;
>   }
>   
> +int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
> +		     sk_read_actor_t read_actor)
> +{
> +	struct tls_context *tls_ctx = tls_get_ctx(sk);
> +	struct tls_sw_context_rx *ctx = tls_sw_ctx_rx(tls_ctx);
> +	struct strp_msg *rxm = NULL;
> +	struct tls_msg *tlm;
> +	struct sk_buff *skb;
> +	ssize_t copied = 0;
> +	int err, used;
> +
> +	if (!skb_queue_empty(&ctx->rx_list)) {
> +		skb = __skb_dequeue(&ctx->rx_list);
> +	} else {
> +		struct tls_decrypt_arg darg;
> +
> +		err = tls_rx_rec_wait(sk, NULL, true, true);
> +		if (err <= 0)
> +			return err;
> +
> +		memset(&darg.inargs, 0, sizeof(darg.inargs));
> +
> +		err = tls_rx_one_record(sk, NULL, &darg);
> +		if (err < 0) {
> +			tls_err_abort(sk, -EBADMSG);
> +			return err;
> +		}
> +
> +		tls_rx_rec_done(ctx);
> +		skb = darg.skb;
> +	}
> +
> +	do {
> +		rxm = strp_msg(skb);
> +		tlm = tls_msg(skb);
> +
> +		/* read_sock does not support reading control messages */
> +		if (tlm->control != TLS_RECORD_TYPE_DATA) {
> +			err = -EINVAL;
> +			goto read_sock_requeue;

In the general case, this could just pass in the skb to recv_actor
and have it access the tlm and decide what to do with it...
(will require moving tls_msg() to include/net/strparser.h)

I agree that for nvme-tcp this would not have anything useful
other than breaking the connection and re-establish it later...

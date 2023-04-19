Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7D428F2
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 19 Apr 2023 09:09:49 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f18176ea3aso612835e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 19 Apr 2023 02:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681895388; x=1684487388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ihu9i9sfNp401ucAlRgtdY6/0UARzU6CkQxNKszI7U=;
        b=eobl/0ssLvt0ey6IgCYboRZwQ1VDNVPNQgx5uW0l3CDAwX2bihaHk8BVDyq6/zHsPF
         yJpAivHh60NjnddTqq8yfg+wKXfAxpVsRAoHgmDYM4avCpkxPEOg53ZEYIg4lQ0u+nG6
         XtcJYAhPBLuIxskHyp4wF+VF6uB86t5m28txiR7l4dfIcd+u1vyttaj46XpvxW53gDYB
         OAQ5wNeNCZ5nodgNukDYonDrr1NEkcPjvqWEGWN7FSRrooKIN47U6gHq60HuoPICo1f/
         O4iATtRPbQN/x4J6uGrnMtmMre4UPRYV7OYg5djHUTSsp2jEI2ytw1nIAQMiZrBk1LLq
         UPiA==
X-Gm-Message-State: AAQBX9dVxkkkj6dE7Wq2DFFbpn+TFgalY0+UtJIYoLdCtBcO2nDPfPW6
	itKxYgDB3wvkTkwGe7jzxp8=
X-Google-Smtp-Source: AKy350Z/YuiEZsRXXizu/gdZGPKVGpJlv2tD4bbpzSADiF5Dy4IWkxmUjWhui0JUxeWAO1lBfxt+rQ==
X-Received: by 2002:a05:600c:4709:b0:3f1:8278:8d81 with SMTP id v9-20020a05600c470900b003f182788d81mr312680wmo.4.1681895387785;
        Wed, 19 Apr 2023 02:09:47 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id l2-20020a05600c4f0200b003ee74c25f12sm1553592wmq.35.2023.04.19.02.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 02:09:47 -0700 (PDT)
Message-ID: <dcc501b5-eb3e-8552-695d-ce8b660309f7@grimberg.me>
Date: Wed, 19 Apr 2023 12:09:46 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 06/17] net/tls: implement ->read_sock()
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev,
 Boris Pismenny <boris.pismenny@gmail.com>, Jakub Kicinski <kuba@kernel.org>
References: <20230419065714.52076-1-hare@suse.de>
 <20230419065714.52076-7-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230419065714.52076-7-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

We probably need a wider exposure for this one because someone
else needs to approve it.

On 4/19/23 09:57, Hannes Reinecke wrote:
> Implement ->read_sock() function for use with nvme-tcp.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> Cc: Boris Pismenny <boris.pismenny@gmail.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
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
> index b32c112984dd..0b51b19aa46d 100644
> --- a/net/tls/tls_main.c
> +++ b/net/tls/tls_main.c
> @@ -921,9 +921,11 @@ static void build_proto_ops(struct proto_ops ops[TLS_NUM_CONFIG][TLS_NUM_CONFIG]
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
> index 635b8bf6b937..827292e29f99 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c
> @@ -2214,6 +2214,77 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
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
> +		}
> +
> +		used = read_actor(desc, skb, rxm->offset, rxm->full_len);
> +		if (used <= 0) {
> +			err = used;
> +			goto read_sock_end;
> +		}
> +
> +		copied += used;
> +		if (used < rxm->full_len) {
> +			rxm->offset += used;
> +			rxm->full_len -= used;
> +			if (!desc->count)
> +				goto read_sock_requeue;
> +		} else {
> +			consume_skb(skb);
> +			if (desc->count && !skb_queue_empty(&ctx->rx_list))
> +				skb = __skb_dequeue(&ctx->rx_list);
> +			else
> +				skb = NULL;
> +		}
> +	} while (skb);
> +
> +read_sock_end:
> +	return copied ? : err;
> +
> +read_sock_requeue:
> +	__skb_queue_head(&ctx->rx_list, skb);
> +	goto read_sock_end;
> +}
> +
>   bool tls_sw_sock_is_readable(struct sock *sk)
>   {
>   	struct tls_context *tls_ctx = tls_get_ctx(sk);

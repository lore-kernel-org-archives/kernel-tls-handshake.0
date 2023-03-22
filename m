Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C3A15A9
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 08:45:20 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id o40-20020a05600c512800b003eddedc47aeso5413046wms.3
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 01:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679474719; x=1682066719;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/R1ptgJArSro9MNhkWnO7w84GiDJO/BSIbe9irYn4R0=;
        b=SRxfMzpXJoyOYSfDoEVMKkmmx7vkYBMLu0xB/UdiTJmPP11fUN3hv0vSAZgvE+EX1p
         VuR3NuBzEi8ul5MIJ/WyHffVtGW2tfsSHSUAGNTD1l1ebOcynE7t15yB2BJAJg0e/6ew
         i9W64rTq8u+nQb4r24V6o9olgoPnqmYZoH17s4VIv+3/Up2Tb48I1FSZPO8utxbv8mq9
         fpdDJ+3jK4B4RcOxV9KhVGzMMb/LF3G67Ryv5ZZ8oW7llvNCgSpz6WotiVcssNde9zLM
         PE+tVs8wnkZIFNa8ILXA745RYHOnhZ72alIBjtHcBjoy1p9K54oc2ZM6kk0I9FRYxHb2
         2qcQ==
X-Gm-Message-State: AO0yUKUx0O9pVf7ZHwLt5MMLGfJk7Mutlt1vuyZEcZaZ9GwiFlv5Brh5
	WG7iooCaxma9xzyKpQBfSyU=
X-Google-Smtp-Source: AK7set9hxWNylBAUzuW84WYUoD1wHAI2l3zOzH5mr2ShBvB134ujLAXcmB6rQj4MZKRYmwVV9OXu2g==
X-Received: by 2002:a05:600c:4755:b0:3e8:7ca3:8424 with SMTP id w21-20020a05600c475500b003e87ca38424mr5368632wmo.1.1679474718676;
        Wed, 22 Mar 2023 01:45:18 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id p13-20020a7bcc8d000000b003ee1acdb036sm5902633wma.17.2023.03.22.01.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 01:45:18 -0700 (PDT)
Message-ID: <92bd0f9f-8df1-b1ef-dc8b-99ae3b1e0300@grimberg.me>
Date: Wed, 22 Mar 2023 10:45:17 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 08/18] nvme-tcp: enable TLS handshake upcall
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-9-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230321124325.77385-9-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Select possible PSK identities and call the TLS handshake upcall
> for each identity.
> The TLS 1.3 RFC allows to send multiple identities with each ClientHello
> request, but none of the SSL libraries implement it. As the connection
> is established when the association is created we send only a single
> identity for each upcall, and close the connection to restart with
> the next identity if the handshake fails.

Can't this loop be done in userspace? In other words, how can
we get rid of this when SSL libs would decide to support it?

> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/host/tcp.c | 157 +++++++++++++++++++++++++++++++++++++---
>   1 file changed, 148 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 0438d42f4179..bcf24e9a08e1 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -8,9 +8,12 @@
>   #include <linux/init.h>
>   #include <linux/slab.h>
>   #include <linux/err.h>
> +#include <linux/key.h>
>   #include <linux/nvme-tcp.h>
> +#include <linux/nvme-keyring.h>
>   #include <net/sock.h>
>   #include <net/tcp.h>
> +#include <net/handshake.h>
>   #include <linux/blk-mq.h>
>   #include <crypto/hash.h>
>   #include <net/busy_poll.h>
> @@ -31,6 +34,14 @@ static int so_priority;
>   module_param(so_priority, int, 0644);
>   MODULE_PARM_DESC(so_priority, "nvme tcp socket optimize priority");
>   
> +/*
> + * TLS handshake timeout
> + */
> +static int tls_handshake_timeout = 10;
> +module_param(tls_handshake_timeout, int, 0644);
> +MODULE_PARM_DESC(tls_handshake_timeout,
> +		 "nvme TLS handshake timeout in seconds (default 10)");

Can you share what is the normal time of an upcall?

> +
>   #ifdef CONFIG_DEBUG_LOCK_ALLOC
>   /* lockdep can detect a circular dependency of the form
>    *   sk_lock -> mmap_lock (page fault) -> fs locks -> sk_lock
> @@ -104,6 +115,7 @@ enum nvme_tcp_queue_flags {
>   	NVME_TCP_Q_ALLOCATED	= 0,
>   	NVME_TCP_Q_LIVE		= 1,
>   	NVME_TCP_Q_POLLING	= 2,
> +	NVME_TCP_Q_TLS		= 3,
>   };
>   
>   enum nvme_tcp_recv_state {
> @@ -148,6 +160,9 @@ struct nvme_tcp_queue {
>   	__le32			exp_ddgst;
>   	__le32			recv_ddgst;
>   
> +	struct completion       *tls_complete;
> +	int                     tls_err;
> +
>   	struct page_frag_cache	pf_cache;
>   
>   	void (*state_change)(struct sock *);
> @@ -1505,7 +1520,102 @@ static void nvme_tcp_set_queue_io_cpu(struct nvme_tcp_queue *queue)
>   	queue->io_cpu = cpumask_next_wrap(n - 1, cpu_online_mask, -1, false);
>   }
>   
> -static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid)
> +/*
> + * nvme_tcp_lookup_psk - Look up PSKs to use for TLS
> + *
> + */
> +static int nvme_tcp_lookup_psks(struct nvme_ctrl *nctrl,
> +			       key_serial_t *keylist, int num_keys)

Where is num_keys used?

> +{
> +	enum nvme_tcp_tls_cipher cipher = NVME_TCP_TLS_CIPHER_SHA384;
> +	struct key *tls_key;
> +	int num = 0;
> +	bool generated = false;
> +
> +	/* Check for pre-provisioned keys; retained keys first */
> +	do {
> +		tls_key = nvme_tls_psk_lookup(NULL, nctrl->opts->host->nqn,
> +					      nctrl->opts->subsysnqn,
> +					      cipher, generated);
> +		if (!IS_ERR(tls_key)) {
> +			keylist[num] = tls_key->serial;
> +			num++;
> +			key_put(tls_key);
> +		}
> +		if (cipher == NVME_TCP_TLS_CIPHER_SHA384)
> +			cipher = NVME_TCP_TLS_CIPHER_SHA256;
> +		else {
> +			if (generated)
> +				cipher = NVME_TCP_TLS_CIPHER_INVALID;
> +			else {
> +				cipher = NVME_TCP_TLS_CIPHER_SHA384;
> +				generated = true;
> +			}
> +		}
> +	} while(cipher != NVME_TCP_TLS_CIPHER_INVALID);

I'm unclear about a few things here:
1. what is the meaning of pre-provisioned vs. retained vs. generated?
2. Can this loop be reorganized in a nested for loop with a break?
    I'm wandering if it will make it simpler to read.

> +	return num;
> +}
> +
> +static void nvme_tcp_tls_done(void *data, int status, key_serial_t peerid)
> +{
> +	struct nvme_tcp_queue *queue = data;
> +	struct nvme_tcp_ctrl *ctrl = queue->ctrl;
> +	int qid = nvme_tcp_queue_id(queue);
> +
> +	dev_dbg(ctrl->ctrl.device, "queue %d: TLS handshake done, key %x, status %d\n",
> +		qid, peerid, status);
> +
> +	queue->tls_err = -status;
> +	if (queue->tls_complete)
> +		complete(queue->tls_complete);
> +}
> +
> +static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
> +			      struct nvme_tcp_queue *queue,
> +			      key_serial_t peerid)
> +{
> +	int qid = nvme_tcp_queue_id(queue);
> +	int ret;
> +	struct tls_handshake_args args;
> +	unsigned long tmo = tls_handshake_timeout * HZ;
> +	DECLARE_COMPLETION_ONSTACK(tls_complete);
> +
> +	dev_dbg(nctrl->device, "queue %d: start TLS with key %x\n",
> +		qid, peerid);
> +	args.ta_sock = queue->sock;
> +	args.ta_done = nvme_tcp_tls_done;
> +	args.ta_data = queue;
> +	args.ta_my_peerids[0] = peerid;
> +	args.ta_num_peerids = 1;
> +	args.ta_keyring = nvme_keyring_id();
> +	args.ta_timeout_ms = tls_handshake_timeout * 2 * 1000;
> +	queue->tls_err = -EOPNOTSUPP;
> +	queue->tls_complete = &tls_complete;
> +	ret = tls_client_hello_psk(&args, GFP_KERNEL);
> +	if (ret) {
> +		dev_dbg(nctrl->device, "queue %d: failed to start TLS: %d\n",
> +			qid, ret);
> +		return ret;
> +	}
> +	if (wait_for_completion_timeout(queue->tls_complete, tmo) == 0) {
> +		dev_dbg(nctrl->device,
> +			"queue %d: TLS handshake timeout\n", qid);
> +		queue->tls_complete = NULL;
> +		ret = -ETIMEDOUT;
> +	} else {
> +		dev_dbg(nctrl->device,
> +			"queue %d: TLS handshake complete, error %d\n",
> +			qid, queue->tls_err);
> +		ret = queue->tls_err;
> +	}
> +	queue->tls_complete = NULL;
> +	if (!ret)
> +		set_bit(NVME_TCP_Q_TLS, &queue->flags);
> +	return ret;
> +}
> +
> +static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
> +				key_serial_t peerid)
>   {
>   	struct nvme_tcp_ctrl *ctrl = to_tcp_ctrl(nctrl);
>   	struct nvme_tcp_queue *queue = &ctrl->queues[qid];
> @@ -1628,6 +1738,13 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid)
>   		goto err_rcv_pdu;
>   	}
>   
> +	/* If PSKs are configured try to start TLS */
> +	if (peerid) {

Where is peerid being initialized? Not to mention that peerid is
a rather cryptic name (at least to me). Is this the ClientHello
identity?

> +		ret = nvme_tcp_start_tls(nctrl, queue, peerid);
> +		if (ret)
> +			goto err_init_connect;
> +	}
> +
>   	ret = nvme_tcp_init_connection(queue);
>   	if (ret)
>   		goto err_init_connect;
> @@ -1774,11 +1891,22 @@ static int nvme_tcp_start_io_queues(struct nvme_ctrl *ctrl,
>   
>   static int nvme_tcp_alloc_admin_queue(struct nvme_ctrl *ctrl)
>   {
> -	int ret;
> +	int ret = -EINVAL, num_keys, k;
> +	key_serial_t keylist[4];
>   
> -	ret = nvme_tcp_alloc_queue(ctrl, 0);
> -	if (ret)
> -		return ret;
> +	memset(keylist, 0, sizeof(key_serial_t));
> +	num_keys = nvme_tcp_lookup_psks(ctrl, keylist, 4);
> +	for (k = 0; k < num_keys; k++) {
> +		ret = nvme_tcp_alloc_queue(ctrl, 0, keylist[k]);
> +		if (!ret)
> +			break;
> +	}
> +	if (ret) {
> +		/* Try without TLS */

Why? this is trying to always connect with tls and fallback to no-tls?
Why not simply do what userspace is asking us to do?

Seems backwards to me. Unless there is a statement in the spec
that I'm not aware of which tells us to do so.

> +		ret = nvme_tcp_alloc_queue(ctrl, 0, 0);
> +		if (ret)
> +			goto out_free_queue;
> +	}
>   
>   	ret = nvme_tcp_alloc_async_req(to_tcp_ctrl(ctrl));
>   	if (ret)
> @@ -1793,12 +1921,23 @@ static int nvme_tcp_alloc_admin_queue(struct nvme_ctrl *ctrl)
>   
>   static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
>   {
> -	int i, ret;
> +	int i, ret, num_keys = 0, k;
> +	key_serial_t keylist[4];
>   
> +	memset(keylist, 0, sizeof(key_serial_t));
> +	num_keys = nvme_tcp_lookup_psks(ctrl, keylist, 4);
>   	for (i = 1; i < ctrl->queue_count; i++) {
> -		ret = nvme_tcp_alloc_queue(ctrl, i);
> -		if (ret)
> -			goto out_free_queues;
> +		ret = -EINVAL;
> +		for (k = 0; k < num_keys; k++) {
> +			ret = nvme_tcp_alloc_queue(ctrl, i, keylist[k]);
> +			if (!ret)
> +				break;

What is going on here. are you establishing queue_count x num_keys nvme 
queues?


> +		}
> +		if (ret) {
> +			ret = nvme_tcp_alloc_queue(ctrl, i, 0);
> +			if (ret)
> +				goto out_free_queues;
> +		}
>   	}
>   
>   	return 0;

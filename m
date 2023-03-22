Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AAA23AD
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 09:31:56 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id p16so11046219wmq.5
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 02:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679477514; x=1682069514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5uLOTkK39PrCSOqQ8K3sNJmGJw6COw9InIkyRtI6Hds=;
        b=3xflQNO80B8arOXllV6fqIgIzvQW5J89+q75U7uQeabBK/KIxvEuH1S2kSYI2f0vef
         m+4zuAyKmJcvh61m34Wk3cs9ySZyvq+waJzEG8sAuJaRH5nmfaF2rG3uQipljK8iH3R6
         LbUi3uM2pIc6iiD9aQsHHrHzC6Zd89TK8tSuQH8Guy9MmlG+htl27tW8pxvf/tccmQ1Z
         ci6evZjAO3xAsnMmh9hWe+k6tp80bn1kQ3ptLNBaxBYrOx8PQ5GDgd4vuLHrdVmhaEEW
         3jo808AR+OYZabPezG4t1+Oy9iQ9ugEjJsg1u3ljYifH8mNCsoJmcOaCgCCJo5Yu0nOc
         tNIg==
X-Gm-Message-State: AO0yUKXbQwgJMvXOl394Dy8xobq4Vd42uAd0iigail3zUnNJY3EJpJ+7
	zn/oylSRMAd8okrIYwAltWI=
X-Google-Smtp-Source: AK7set9cDa17kjziokfkr8xqnlNPWc/m9b978RR6MS+NCafoJ2ap5H3ZKci0afl9jQEHrQYdDWINug==
X-Received: by 2002:a05:600c:4ec7:b0:3e9:b564:fae4 with SMTP id g7-20020a05600c4ec700b003e9b564fae4mr5353131wmq.0.1679477514274;
        Wed, 22 Mar 2023 02:31:54 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id n23-20020a7bcbd7000000b003ed243222adsm15990025wmi.42.2023.03.22.02.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 02:31:54 -0700 (PDT)
Message-ID: <e189b779-8621-bfa6-4c7a-1eb38bd1c29d@grimberg.me>
Date: Wed, 22 Mar 2023 11:31:52 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 10/18] nvme-tcp: fixup send workflow for kTLS
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-11-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230321124325.77385-11-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/21/23 14:43, Hannes Reinecke wrote:
> kTLS does not support MSG_EOR flag for sendmsg(), and the ->sendpage()
> call really doesn't bring any benefit as data has to be copied
> anyway.
> So use sock_no_sendpage() or sendmsg() instead, and ensure that the
> MSG_EOR flag is blanked out for kTLS.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/host/tcp.c | 33 +++++++++++++++++++++------------
>   1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index bbff1f52a167..007d457cacf9 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -1034,13 +1034,19 @@ static int nvme_tcp_try_send_data(struct nvme_tcp_request *req)
>   		bool last = nvme_tcp_pdu_last_send(req, len);
>   		int req_data_sent = req->data_sent;
>   		int ret, flags = MSG_DONTWAIT;
> +		bool do_sendpage = sendpage_ok(page);
>   
> -		if (last && !queue->data_digest && !nvme_tcp_queue_more(queue))
> +		if (!last || queue->data_digest || nvme_tcp_queue_more(queue))
> +			flags |= MSG_MORE;
> +		else if (!test_bit(NVME_TCP_Q_TLS, &queue->flags))
>   			flags |= MSG_EOR;
> -		else
> -			flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;

I think its time to move the flags setting to a helper.

>   
> -		if (sendpage_ok(page)) {
> +		if (test_bit(NVME_TCP_Q_TLS, &queue->flags))
> +			do_sendpage = false;
> +
> +		if (do_sendpage) {

The do_sendpage looks redundant to me.

> +			if (flags & MSG_MORE)
> +				flags |= MSG_SENDPAGE_NOTLAST;
>   			ret = kernel_sendpage(queue->sock, page, offset, len,
>   					flags);

I think that the SENDPAGE_NOLAST should be set together with MSG_MORE
regardless.

>   		} else {
> @@ -1088,19 +1094,22 @@ static int nvme_tcp_try_send_cmd_pdu(struct nvme_tcp_request *req)
>   	bool inline_data = nvme_tcp_has_inline_data(req);
>   	u8 hdgst = nvme_tcp_hdgst_len(queue);
>   	int len = sizeof(*pdu) + hdgst - req->offset;
> -	int flags = MSG_DONTWAIT;
> +	struct msghdr msg = { .msg_flags = MSG_DONTWAIT };
> +	struct kvec iov = {
> +		.iov_base = (u8 *)req->pdu + req->offset,
> +		.iov_len = len,
> +	};
>   	int ret;
>   
>   	if (inline_data || nvme_tcp_queue_more(queue))
> -		flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
> -	else
> -		flags |= MSG_EOR;
> +		msg.msg_flags |= MSG_MORE;
> +	else if (!test_bit(NVME_TCP_Q_TLS, &queue->flags))
> +		msg.msg_flags |= MSG_EOR;
>   
>   	if (queue->hdr_digest && !req->offset)
>   		nvme_tcp_hdgst(queue->snd_hash, pdu, sizeof(*pdu));
>   
> -	ret = kernel_sendpage(queue->sock, virt_to_page(pdu),
> -			offset_in_page(pdu) + req->offset, len,  flags);
> +	ret = kernel_sendmsg(queue->sock, &msg, &iov, 1, iov.iov_len);

I'd prefer to do kernel_sednpage/sock_no_sendpage similar to how we do
it for data and data pdu.

>   	if (unlikely(ret <= 0))
>   		return ret;
>   
> @@ -1131,7 +1140,7 @@ static int nvme_tcp_try_send_data_pdu(struct nvme_tcp_request *req)
>   	if (queue->hdr_digest && !req->offset)
>   		nvme_tcp_hdgst(queue->snd_hash, pdu, sizeof(*pdu));
>   
> -	if (!req->h2cdata_left)
> +	if (!test_bit(NVME_TCP_Q_TLS, &queue->flags) && !req->h2cdata_left)
>   		ret = kernel_sendpage(queue->sock, virt_to_page(pdu),
>   				offset_in_page(pdu) + req->offset, len,
>   				MSG_DONTWAIT | MSG_MORE | MSG_SENDPAGE_NOTLAST);

Something is unclear to me. Is kernel_sendpage unsupported with tls? (I
think it is). I understand the motivation to add more checks in the code
for kernel_sendpage vs. sock_no_sendpage given that it should be
perfectly fine to use either.

Did you see any regressions with using kernel_sendpage? If so, isn't
that a bug in the tls code?

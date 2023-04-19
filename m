Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C8F28F2
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 19 Apr 2023 09:08:44 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f18176ea3aso610775e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 19 Apr 2023 02:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681895322; x=1684487322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hC/fMFkjFWo9Uftolex3Z/mDYGpb53zn3bFdpwwKt5Q=;
        b=YS+QIb4N0Czx/knC9R9ZvVc533IqUkztKAbK/PttiTd+mEcHOdvj711vQhyfrA8o9a
         BewTvZIbWZCsoGmRFV3xzEFyo3KSuhZbvpEX9oxctqK6OqQ4b3zNi3CWQeziYetiKvXE
         dr+vacOyZNOSSROGnzgyN3oDdpvw17MbRwjV5DdhLkMr8iOTKqUtDEqYVrjpFY1mDPXo
         C+hWDP6CzOu8ipSVCKfG15XB42s1vyHeILAGcfLF/j3LzI/qjO5npx/sfxktAc3ouIWB
         EdOr5J/n8BvnlfbHKP8Yr9pdtM58fLjTOxMgGUHspU/EOdA4iB+mM9fZrGEqmuFitU6+
         nYWQ==
X-Gm-Message-State: AAQBX9efT4eoN4y0DnReh+BphlB2zWl0Axg2XJYe+DwDN3ErLxWJQs7g
	r89hsNqSY398tkNeTZVV27c=
X-Google-Smtp-Source: AKy350aJxJjrRDFU1eRcW9k9thdvwBCGRgb4WPnoF16n2yZ/TL30tzZvsK4tf7QG50K6UfqH8+KJVw==
X-Received: by 2002:a05:600c:3ca0:b0:3f0:a845:f215 with SMTP id bg32-20020a05600c3ca000b003f0a845f215mr13509576wmb.3.1681895322510;
        Wed, 19 Apr 2023 02:08:42 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id s9-20020a05600c45c900b003f092f0e0a0sm2581157wmo.3.2023.04.19.02.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 02:08:42 -0700 (PDT)
Message-ID: <15fb377e-125f-df25-f752-2e093b628327@grimberg.me>
Date: Wed, 19 Apr 2023 12:08:40 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 08/17] nvme-tcp: fixup MSG_SENDPAGE_NOTLAST
To: Hannes Reinecke <hare@suse.de>, Jakub Kicinski <kuba@kernel.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev
References: <20230419065714.52076-1-hare@suse.de>
 <20230419065714.52076-9-hare@suse.de>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230419065714.52076-9-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Please CC Jakub and Vadim in the next iterations.
I'd also CC netdev to let the networking folks this is going on...

> We can only set MSG_SENDPAGE_NOTLAST when sending the command PDU if the
> actual data is transferred via sendpage(), too.
> If we use sendmsg() to transfer the data we end up with a TX stall on TLS
> as it implements different code paths for sendmsg() and sendpage().
> So check in nvme_tcp_try_send_pdu() if inline data is present and revert
> to sendmsg if the inline data cannot be sent via sendpage().

ifaiu, the TX stalls are not related to sendpage and sendmsg being
separate code paths. The stalls are just a bug in an untested scenario
of sendpage(NOTLAST)+sendmsg..

It needs to be documented in the change log:
"Due to a bug in the tls code, we do xxx to workaround it"

In a separate patch.

> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/host/tcp.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 273c1f2760a4..9ecd7db2cd98 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -995,9 +995,11 @@ static int nvme_tcp_try_send_data(struct nvme_tcp_request *req)
>   		if (last && !queue->data_digest && !nvme_tcp_queue_more(queue))
>   			flags |= MSG_EOR;
>   		else
> -			flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
> +			flags |= MSG_MORE;
>   
>   		if (sendpage_ok(page)) {
> +			if (flags & MSG_MORE)
> +				flags |= MSG_SENDPAGE_NOTLAST;
>   			ret = kernel_sendpage(queue->sock, page, offset, len,
>   					flags);
>   		} else {

This is fine, lets move this to its own patch.

> @@ -1049,15 +1051,23 @@ static int nvme_tcp_try_send_cmd_pdu(struct nvme_tcp_request *req)
>   	int ret;
>   
>   	if (inline_data || nvme_tcp_queue_more(queue))
> -		flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
> +		flags |= MSG_MORE;
>   	else
>   		flags |= MSG_EOR;
>   
>   	if (queue->hdr_digest && !req->offset)
>   		nvme_tcp_hdgst(queue->snd_hash, pdu, sizeof(*pdu));
>   
> -	ret = kernel_sendpage(queue->sock, virt_to_page(pdu),
> -			offset_in_page(pdu) + req->offset, len,  flags);
> +	if (!inline_data || sendpage_ok(nvme_tcp_req_cur_page(req))) {

This needs a big fat comment to why we are doing this bizzare and
untrivial condition:

Something like:
--
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 7723a4989524..cd8610836de9 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1046,15 +1046,32 @@ static int nvme_tcp_try_send_cmd_pdu(struct 
nvme_tcp_request *req)
         int ret;

         if (inline_data || nvme_tcp_queue_more(queue))
-               flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
+               flags |= MSG_MORE;
         else
                 flags |= MSG_EOR;

         if (queue->hdr_digest && !req->offset)
                 nvme_tcp_hdgst(queue->snd_hash, pdu, sizeof(*pdu));

-       ret = kernel_sendpage(queue->sock, virt_to_page(pdu),
-                       offset_in_page(pdu) + req->offset, len,  flags);
+       /**
+        * FIXME: Due to a bug in the tls code, issuing sendpage with msg
+        * flag MSG_SENDPAGE_NOTLAST and then issuing sendmsg, we can hit
+        * some TX stalls. Our connect data (which is the request 
inline_data)
+        * is a slab allocated page and hence we must not use sendpage to
+        * send it, and this hits exactly the tls issue. workaround it by
+        * sending sendmsg on the command itself as if we are running with
+        * a tls socket and the inline data cannot be sendpage'd.
+        * When the tls code is resolve, this workaround needs to be 
removed.
+        */
+       if (nvme_tcp_tls_enabled(queue) && inline_data &&
+           sendpage_ok(nvme_tcp_req_cur_page(req))) {
+               ret = sock_no_sendpage(queue->sock, virt_to_page(pdu),
+                               offset_in_page(pdu) + req->offset, len, 
flags);
+       } else {
+               flags |= MSG_SENDPAGE_NOTLAST;
+               ret = kernel_sendpage(queue->sock, virt_to_page(pdu),
+                               offset_in_page(pdu) + req->offset, len, 
flags);
+       }
         if (unlikely(ret <= 0))
                 return ret;
--

> +		if (flags & MSG_MORE)
> +			flags |= MSG_SENDPAGE_NOTLAST;
> +		ret = kernel_sendpage(queue->sock, virt_to_page(pdu),
> +				offset_in_page(pdu) + req->offset, len,  flags);
> +	} else {
> +		ret = sock_no_sendpage(queue->sock, virt_to_page(pdu),
> +				offset_in_page(pdu) + req->offset,
> +				len, flags);
> +	}
>   	if (unlikely(ret <= 0))
>   		return ret;
>   

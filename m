Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FE08460
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 15:19:15 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f16f792384so3166875e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 08:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681744754; x=1684336754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKGu76ykgM+BAOABZpdUDyx+z03h5RqQ0VuKA485N7Y=;
        b=FWK0duIkZpZL+PQnPdlf8Ybf8Hj74/NyYu5zIgL4q/XZU9VILCK0hhliADCf/U4fXz
         zXjlPIsj6QfPgvUzbpZvRWrbN+4kHw243BV321FnfTJSLVdu4z9fWDDT9b1+qkuL/Ry+
         11aF2kGecU+T4j4n9yGBK7QmjdEOmAEGc4zaReamjq6gzpFq0dZBuLMQO4Zy025uVIoE
         mLDqQrkPFVthBT9GleRRebqA4sHD7MjWid3Nbe1kLw75MkLAY7chsekzTF+qHsr5HSOn
         YYGIIZgzqHaXe6n8VaH+iEhBE/na8PzyhvijTgD9/Z9G48zVOPwGnRDAgK5rKNd/CE/3
         qsvA==
X-Gm-Message-State: AAQBX9dYUZzmQ7B8dVgFdihHgXRSBEw7lWNNdWrRD841gm2YjyppeqCh
	9OgkDKHNm187B5kqhq9jcZc=
X-Google-Smtp-Source: AKy350bzomnJTVuJbG6co0H9dpHl/zlZsd+NREV8e9neW1McPxidVstuQvEHyMiWBkTY+DXj28BLIA==
X-Received: by 2002:a05:600c:6025:b0:3f1:75a5:a369 with SMTP id az37-20020a05600c602500b003f175a5a369mr1519230wmb.3.1681744753943;
        Mon, 17 Apr 2023 08:19:13 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id t1-20020a1c7701000000b003ede06f3178sm12164328wmi.31.2023.04.17.08.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 08:19:13 -0700 (PDT)
Message-ID: <20af9713-8d64-77de-dfbe-e9e732776d3c@grimberg.me>
Date: Mon, 17 Apr 2023 18:19:12 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/18] net/tls: sanitize MSG_EOR handling
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Jakub Kicinski <kuba@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev
References: <20230417130302.86274-1-hare@suse.de>
 <20230417130302.86274-8-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230417130302.86274-8-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> The TLS stack is using MSG_EOR internally, so the flag cannot be
> set for sendmsg()/sendpage(). But to avoid having the caller to
> check whether TLS is active modify the code to clear the MSG_EOR
> flag. And blank out MSG_MORE / MSG_SENDPAGE_NOTLAST, too, as they
> conflict with MSG_EOR anyway.

This looks like a temporary workaround to me.

The networking folks really need to be CC'd on this (same for patch 6).

CC'ing Jakub for starters.

> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   net/tls/tls_device.c | 10 ++++++++++
>   net/tls/tls_sw.c     | 21 +++++++++++++++++++++
>   2 files changed, 31 insertions(+)
> 
> diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
> index a7cc4f9faac2..38e44e216865 100644
> --- a/net/tls/tls_device.c
> +++ b/net/tls/tls_device.c
> @@ -576,6 +576,10 @@ int tls_device_sendmsg(struct sock *sk, struct msghdr *msg, size_t size)
>   	mutex_lock(&tls_ctx->tx_lock);
>   	lock_sock(sk);
>   
> +	/* MSG_EOR conflicts with MSG_MORE, so clear both */
> +	if (msg->msg_flags & MSG_EOR)
> +		msg->msg_flags &= ~(MSG_EOR | MSG_MORE);
> +
>   	if (unlikely(msg->msg_controllen)) {
>   		rc = tls_process_cmsg(sk, msg, &record_type);
>   		if (rc)
> @@ -604,6 +608,12 @@ int tls_device_sendpage(struct sock *sk, struct page *page,
>   	if (flags & MSG_SENDPAGE_NOTLAST)
>   		flags |= MSG_MORE;
>   
> +	/*
> +	 * MSG_EOR conflicts with MSG_MORE/MSG_SENDPAGE_NOTLAST,
> +	 * so clear all of them */
> +	if (flags & MSG_EOR)
> +		flags &= ~(MSG_EOR | MSG_SENDPAGE_NOTLAST | MSG_MORE);
> +
>   	mutex_lock(&tls_ctx->tx_lock);
>   	lock_sock(sk);
>   
> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 827292e29f99..d0e6b7a04176 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c
> @@ -952,6 +952,11 @@ int tls_sw_sendmsg(struct sock *sk, struct msghdr *msg, size_t size)
>   	int ret = 0;
>   	int pending;
>   
> +	if (msg->msg_flags & MSG_EOR) {
> +		eor = true;
> +		/* MSG_EOR conflicts with MSG_MORE, so clear both */
> +		msg->msg_flags &= ~(MSG_EOR | MSG_MORE);
> +	}
>   	if (msg->msg_flags & ~(MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL |
>   			       MSG_CMSG_COMPAT))
>   		return -EOPNOTSUPP;
> @@ -1274,6 +1279,14 @@ static int tls_sw_do_sendpage(struct sock *sk, struct page *page,
>   int tls_sw_sendpage_locked(struct sock *sk, struct page *page,
>   			   int offset, size_t size, int flags)
>   {
> +	/*
> +	 * MSG_EOR is invalid for TLS, and conflicts
> +	 * with MSG_MORE / MSG_SENDPAGE_NOTLAST.
> +	 * So clear all of them.
> +	 */
> +	if (flags & MSG_EOR)
> +		flags &= ~(MSG_MORE | MSG_SENDPAGE_NOTLAST | MSG_EOR);
> +
>   	if (flags & ~(MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL |
>   		      MSG_SENDPAGE_NOTLAST | MSG_SENDPAGE_NOPOLICY |
>   		      MSG_NO_SHARED_FRAGS))
> @@ -1288,6 +1301,14 @@ int tls_sw_sendpage(struct sock *sk, struct page *page,
>   	struct tls_context *tls_ctx = tls_get_ctx(sk);
>   	int ret;
>   
> +	/*
> +	 * MSG_EOR is invalid for TLS, and conflicts
> +	 * with MSG_MORE / MSG_SENDPAGE_NOTLAST.
> +	 * So clear all of them.
> +	 */
> +	if (flags & MSG_EOR)
> +		flags &= ~(MSG_MORE | MSG_SENDPAGE_NOTLAST | MSG_EOR);
> +
>   	if (flags & ~(MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL |
>   		      MSG_SENDPAGE_NOTLAST | MSG_SENDPAGE_NOPOLICY))
>   		return -EOPNOTSUPP;

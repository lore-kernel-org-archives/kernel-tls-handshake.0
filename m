Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3468460
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 15:24:29 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f0968734f6so10509875e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 08:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681745067; x=1684337067;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cD5YuHLFnPXiXV0O4WImDbbRBnTQXytqGKVi+DWNloQ=;
        b=hWCKl5YO8GOZza+Ebb3JnUTNMPWlgvtM/kEvezQgp5rfJl6LyHwur9dbjtZnW9DsNi
         CCwLdPwoKFq2kHquqlf8jtS9HEytcfQAOvx3340XRtnCFCJ28k+M6XBiQw1qIkRgcMLU
         B+IwUxWriv+dDqGoksuqjID0ufbGkpfZePpWEaYKogsOn7Gd/FuD7rqj/ojOmQYEuCdt
         +HkqcKdXwUQDZHcgQNyfAy7hqFKLGyuNhpPwMLwY+REu6jXpLF4q+gen48XWneSjcTB7
         68QnpCHgmsDG4nL2ys06+GFkkLDB5KxK6I1Dv02za2yKHqag/V8+x0iwmr/KKFZH8Bd9
         07AA==
X-Gm-Message-State: AAQBX9dCsizxGFMqONQQVBW7G+ZlH+ss+46OZbASBZ3foSPfC5unBY9T
	3hXDt+zonVlUlVvYrl0ssEA=
X-Google-Smtp-Source: AKy350aqbtb2el3U9SLZofrbvGvaafsgGq+srj5w6istFGn/4igSmNUUth+Z+P4wLIqazAsk8G3sAw==
X-Received: by 2002:a05:600c:450f:b0:3f1:714d:c40b with SMTP id t15-20020a05600c450f00b003f1714dc40bmr3809570wmo.3.1681745067377;
        Mon, 17 Apr 2023 08:24:27 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c205600b003f16f362ae7sm6329802wmg.21.2023.04.17.08.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 08:24:27 -0700 (PDT)
Message-ID: <0752225c-a798-014c-25ca-eba2d4ad8de4@grimberg.me>
Date: Mon, 17 Apr 2023 18:24:25 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 12/18] nvme-tcp: control message handling for recvmsg()
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev
References: <20230417130302.86274-1-hare@suse.de>
 <20230417130302.86274-13-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230417130302.86274-13-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/17/23 16:02, Hannes Reinecke wrote:
> kTLS is sending TLS ALERT messages as control messages for recvmsg().
> As we can't do anything sensible with it just abort the connection
> and let the userspace agent to a re-negotiation.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
> ---
>   drivers/nvme/host/tcp.c | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index b80bcc5fe447..eeb3f85fe259 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -1352,6 +1352,11 @@ static int nvme_tcp_init_connection(struct nvme_tcp_queue *queue)
>   {
>   	struct nvme_tcp_icreq_pdu *icreq;
>   	struct nvme_tcp_icresp_pdu *icresp;
> +#ifdef CONFIG_NVME_TCP_TLS

I don't think you need the ifdef(s) here, right?

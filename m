Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5471A10E9
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 13:46:33 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id o12so59877837edb.9
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 06:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679406391;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4eUoDWNw1Z+l6YYHfOywwPEfIF8+TCWzoLU7qfq1dA=;
        b=UMT7k2gkrcQaP/wq7jbNfLc/EBzyt6L6cMR+Yi7teik1gdHe+Bw1+cnxJB5mrT6yb4
         qlfDTd5I3NP7ydnQaQgzUhc+l+IKjaNG25evOgxpja1CdCgANs2043PBBTf+WDcgwbd2
         mj3gXPXUVQL5/1MkOsUY+NJMcA3wmJHQ973V8hETvTeJgMszyNN6Br7JYWQbyTSD/IkI
         3fzmhPc5gGHpl7GX2iYSuhjYjCik6KutR4XagG1HapjotBwyF62vevgVT7tJLTqSVpLt
         w7vbr5/IFX1EeIWUaN5jPa6aJYOX/sS4pcNeX8gaYDtHL3+DklDiBsWK6+u25Xlz7im8
         C+9g==
X-Gm-Message-State: AO0yUKUxMgbfq9k3Nwz15JwwGgM87y6QhBCoEUgH+kGCSjGKDG4Pt/RG
	677zmYJ/tbpazsHwGSgx688=
X-Google-Smtp-Source: AK7set/wFcrBQ14K5RnVnsMUhn9ELzmqIBnZ9rv9Hbd2LMbTpTgTTuSchlRAx8M6y1/uJN9uTU7IZg==
X-Received: by 2002:a17:906:749d:b0:92c:fc0:b229 with SMTP id e29-20020a170906749d00b0092c0fc0b229mr2864965ejl.0.1679406391347;
        Tue, 21 Mar 2023 06:46:31 -0700 (PDT)
Received: from [10.100.102.14] (85.65.253.165.dynamic.barak-online.net. [85.65.253.165])
        by smtp.gmail.com with ESMTPSA id k9-20020a17090666c900b0092b606cb803sm5932709ejp.140.2023.03.21.06.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 06:46:31 -0700 (PDT)
Message-ID: <ed711471-e914-93d6-2b20-a0d2cb14d1b4@grimberg.me>
Date: Tue, 21 Mar 2023 15:46:29 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 03/18] nvme: add TCP TSAS definitions
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-4-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230321124325.77385-4-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/21/23 14:43, Hannes Reinecke wrote:
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   include/linux/nvme.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/nvme.h b/include/linux/nvme.h
> index 779507ac750b..ea961ca2022d 100644
> --- a/include/linux/nvme.h
> +++ b/include/linux/nvme.h
> @@ -108,6 +108,13 @@ enum {
>   	NVMF_RDMA_CMS_RDMA_CM	= 1, /* Sockets based endpoint addressing */
>   };
>   
> +/* TSAS SECTYPE for TCP transport */
> +enum {
> +	NVMF_TCP_SECTYPE_NONE = 0, /* No Security */
> +	NVMF_TCP_SECTYPE_TLS12 = 1, /* TLSv1.2, NVMe-oF 1.1 and NVMe-TCP 3.6.1.1 */
> +	NVMF_TCP_SECTYPE_TLS13 = 2, /* TLSv1.3, NVMe-oF 1.1 and NVMe-TCP 3.6.1.1 */
> +};

I think these should be located in nvme-tcp.h
Otherwise looks good,

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>


> +
>   #define NVME_AQ_DEPTH		32
>   #define NVME_NR_AEN_COMMANDS	1
>   #define NVME_AQ_BLK_MQ_DEPTH	(NVME_AQ_DEPTH - NVME_NR_AEN_COMMANDS)
> @@ -1458,6 +1465,9 @@ struct nvmf_disc_rsp_page_entry {
>   			__u16	pkey;
>   			__u8	resv10[246];
>   		} rdma;
> +		struct tcp {
> +			__u8	sectype;
> +		} tcp;
>   	} tsas;
>   };
>   

Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8891C5683
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  3 Apr 2023 12:59:30 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id v6-20020a05600c470600b003f034269c96so7830512wmo.4
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 03 Apr 2023 05:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680526769;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BoKO4eV+Sit4Qc/5BGXHigTKiex33Td64vcVfsvbsQE=;
        b=ZKcDEwSd4I59oRj4o29OB0qW7T/VuYhxdVR50fkTPGi2aUyjh0EFEhdvUBMIYo8Gqb
         2ql5axLF1VKMZxbEGKDKaBWX5J66bxy7X+DR1oGbGzZjBl9BSI1ux7HwoxyDyquQYYCs
         IeXbvKpYtk+/AfjvfYY6rfeQq3eCP/3697gV1NcUx9GOmA6iuerNLUcSV2OHODzyYUhH
         9/OvwJ8b6HcbrJFmBrlpwcZCB/no0Chrlw54yoy9DsvazItfHIVxJAd++4kurQ+KXYl6
         x0WTfdL7zNttuMTyT620NNnRHfoeRuhK7lXL2z13k5tGSO/CMMcmmkwpMPLIS3ob+pNN
         5tzA==
X-Gm-Message-State: AAQBX9fNf5Fp5G5h4v0NAJPjeaOllCV2W5vxxhVERqWYKgo6P3DS63Zz
	LP7LvuLFBoDa6959Rp92YIs=
X-Google-Smtp-Source: AKy350bRBVP2JejaLKT4ar3AQdD0L7PrZfPohl3lmxRBuVdhliJYtT6CTKaxZ890//g/OH5cilOcGw==
X-Received: by 2002:a05:600c:1c83:b0:3ed:ebcb:e2c6 with SMTP id k3-20020a05600c1c8300b003edebcbe2c6mr11398606wms.3.1680526768646;
        Mon, 03 Apr 2023 05:59:28 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id t23-20020a1c7717000000b003edcc2223c6sm12104998wmi.28.2023.04.03.05.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 05:59:28 -0700 (PDT)
Message-ID: <ef8a32b6-aa9d-c0a4-df77-2636d35efb9f@grimberg.me>
Date: Mon, 3 Apr 2023 15:59:27 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 17/18] nvmet-tcp: control messages for recvmsg()
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-18-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230329135938.46905-18-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/29/23 16:59, Hannes Reinecke wrote:
> kTLS requires control messages for recvmsg() to relay any out-of-band
> TLS messages (eg TLS alerts) to the caller.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/target/tcp.c | 71 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 71 insertions(+)
> 
> diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
> index 5daf16138471..75017fd5da9f 100644
> --- a/drivers/nvme/target/tcp.c
> +++ b/drivers/nvme/target/tcp.c
> @@ -12,6 +12,7 @@
>   #include <net/sock.h>
>   #include <net/tcp.h>
>   #ifdef CONFIG_NVME_TLS
> +#include <net/tls.h>
>   #include <net/handshake.h>
>   #include <linux/nvme-keyring.h>
>   #endif
> @@ -92,6 +93,7 @@ struct nvmet_tcp_cmd {
>   	u32				pdu_len;
>   	u32				pdu_recv;
>   	int				sg_idx;
> +	char				recv_cbuf[CMSG_LEN(sizeof(char))];
>   	struct msghdr			recv_msg;
>   	struct bio_vec			*iov;
>   	u32				flags;
> @@ -1086,7 +1088,18 @@ static int nvmet_tcp_try_recv_pdu(struct nvmet_tcp_queue *queue)
>   	struct nvme_tcp_hdr *hdr = &queue->pdu.cmd.hdr;
>   	int len;
>   	struct kvec iov;
> +#ifdef CONFIG_NVME_TLS

Do you need this ifdef? The recv_cbuf in the cmd is not under and ifdef.

> +	char cbuf[CMSG_LEN(sizeof(char))] = {};
> +	unsigned char ctype;
> +	struct cmsghdr *cmsg;
> +	struct msghdr msg = {
> +		.msg_control = cbuf,
> +		.msg_controllen = sizeof(cbuf),
> +		.msg_flags = MSG_DONTWAIT
> +	};
> +#else
>   	struct msghdr msg = { .msg_flags = MSG_DONTWAIT };
> +#endif
>   
>   recv:
>   	iov.iov_base = (void *)&queue->pdu + queue->offset;
> @@ -1095,6 +1108,19 @@ static int nvmet_tcp_try_recv_pdu(struct nvmet_tcp_queue *queue)
>   			iov.iov_len, msg.msg_flags);
>   	if (unlikely(len < 0))
>   		return len;
> +#ifdef CONFIG_NVME_TLS
> +	cmsg = (struct cmsghdr *)cbuf;
> +	if (CMSG_OK(&msg, cmsg) &&
> +	    cmsg->cmsg_level == SOL_TLS &&
> +	    cmsg->cmsg_type == TLS_GET_RECORD_TYPE) {
> +		ctype = *((unsigned char *)CMSG_DATA(cmsg));
> +		if (ctype != TLS_RECORD_TYPE_DATA) {
> +			pr_err("queue %d unhandled TLS record %d\n",
> +				queue->idx, ctype);
> +			return -ENOTCONN;
> +		}
> +	}
> +#endif

Can we consolidate this to a helper?

Something like:
static int nvmet_tcp_check_cmsg(struct nvmet_tcp_queue *queue, struct 
cmsghdr *cmsg)
{
	if (!IS_ENABLED(CONFIG_NVME_TLS))
		return 0;

	if (CMSG_OK(&msg, cmsg) &&
	    cmsg->cmsg_level == SOL_TLS &&
	    cmsg->cmsg_type == TLS_GET_RECORD_TYPE) {
		ctype = *((unsigned char *)CMSG_DATA(cmsg));
		if (ctype != TLS_RECORD_TYPE_DATA) {
			pr_err("queue %d unhandled TLS record %d\n",
				queue->idx, ctype);
			return -ENOTCONN;
		}
	}
	return 0;
}

>   
>   	queue->offset += len;
>   	queue->left -= len;
> @@ -1150,10 +1176,27 @@ static int nvmet_tcp_try_recv_data(struct nvmet_tcp_queue *queue)
>   	int ret;
>   
>   	while (msg_data_left(&cmd->recv_msg)) {
> +#ifdef CONFIG_NVME_TLS
> +		struct cmsghdr *cmsg;
> +		unsigned char ctype;
> +#endif
>   		ret = sock_recvmsg(cmd->queue->sock, &cmd->recv_msg,
>   			cmd->recv_msg.msg_flags);
>   		if (ret <= 0)
>   			return ret;
> +#ifdef CONFIG_NVME_TLS
> +		cmsg = (struct cmsghdr *)cmd->recv_cbuf;
> +		if (CMSG_OK(&cmd->recv_msg, cmsg) &&
> +		    cmsg->cmsg_level == SOL_TLS &&
> +		    cmsg->cmsg_type == TLS_GET_RECORD_TYPE) {
> +			ctype = *((unsigned char *)CMSG_DATA(cmsg));
> +			if (ctype != TLS_RECORD_TYPE_DATA) {
> +				pr_err("queue %d unhandled TLS record %d\n",
> +				       queue->idx, ctype);
> +				return -ENOTCONN;
> +			}
> +		}
> +#endif
>   
>   		cmd->pdu_recv += ret;
>   		cmd->rbytes_done += ret;
> @@ -1175,7 +1218,18 @@ static int nvmet_tcp_try_recv_ddgst(struct nvmet_tcp_queue *queue)
>   {
>   	struct nvmet_tcp_cmd *cmd = queue->cmd;
>   	int ret;
> +#ifdef CONFIG_NVME_TLS
> +	char cbuf[CMSG_LEN(sizeof(char))] = {};
> +	unsigned char ctype;
> +	struct cmsghdr *cmsg;
> +	struct msghdr msg = {
> +		.msg_control = cbuf,
> +		.msg_controllen = sizeof(cbuf),
> +		.msg_flags = MSG_DONTWAIT
> +	};
> +#else
>   	struct msghdr msg = { .msg_flags = MSG_DONTWAIT };
> +#endif
>   	struct kvec iov = {
>   		.iov_base = (void *)&cmd->recv_ddgst + queue->offset,
>   		.iov_len = queue->left
> @@ -1185,6 +1239,19 @@ static int nvmet_tcp_try_recv_ddgst(struct nvmet_tcp_queue *queue)
>   			iov.iov_len, msg.msg_flags);
>   	if (unlikely(ret < 0))
>   		return ret;
> +#ifdef CONFIG_NVME_TLS
> +	cmsg = (struct cmsghdr *)cbuf;
> +	if (CMSG_OK(&msg, cmsg) &&
> +	    cmsg->cmsg_level == SOL_TLS &&
> +	    cmsg->cmsg_type == TLS_GET_RECORD_TYPE) {
> +		ctype = *((unsigned char *)CMSG_DATA(cmsg));
> +		if (ctype != TLS_RECORD_TYPE_DATA) {
> +			pr_err("queue %d unhandled TLS record %d\n",
> +				queue->idx, ctype);
> +			return -ENOTCONN;
> +		}
> +	}
> +#endif
>   
>   	queue->offset += ret;
>   	queue->left -= ret;
> @@ -1354,6 +1421,10 @@ static int nvmet_tcp_alloc_cmd(struct nvmet_tcp_queue *queue,
>   	if (!c->r2t_pdu)
>   		goto out_free_data;
>   
> +#ifdef CONFIG_NVME_TLS
> +	c->recv_msg.msg_control = c->recv_cbuf;
> +	c->recv_msg.msg_controllen = sizeof(c->recv_cbuf);
> +#endif
>   	c->recv_msg.msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
>   
>   	list_add_tail(&c->entry, &queue->free_list);

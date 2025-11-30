Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F1023D7FD
	for <kernel-tls-handshake@lists.linux.dev>; Sun, 30 Nov 2025 22:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764541904; cv=none; b=s/4GdxP3L3pTGbB7zYzppi0hyFILe0ZAStBrkCekDFHD5oyTTqfyCad4YA8/t3NZivDPcveyFwbvXjfO6iKzQF9F7tyNnUPH4FH3NY7j0g5D/9HrFbECrGZr2PSlgSbBbtiBp26/xqqBaklQFU/KKFb5Vjk5kMgJ0BIAhvu6Svo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764541904; c=relaxed/simple;
	bh=6+4uZImWSiMTBq4+/nhPhZXP1PQJeW9bCnVdfcHjOzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qLq1vtstLHs5FNIACrsuutExtZu3GDaeHgtH/lYmdZvK8b6/PWLS+xKwd9gKtLhxXJWbMye5FcD60MXPjMsqeAXGZNuJAKPp1w1UnZfkpMj5d2UcMZ5cTURayfsg8tGx7+Wlz+MnqeX9hir1nvnY8+KxIjt6qdJnez/4uaZlSgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso18515255e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 30 Nov 2025 14:31:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764541901; x=1765146701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcQPpGxPe5sL+9Hgs4hRWML4oh/qUbrpFwVuPEgD/H8=;
        b=RxLvoiwuWx9CjITOiNCkvkwnx9OiNr79IZHUsLTOf8WPXS9aynnUW4c16wFie//1R5
         Mwc6Enmjwma9fy3KHnuvHPeFzSeGtq4HcArkO5PrpsmPUid0aOldFUAUVlahN5ow82BO
         hl4fYfOralzz+rC70B02vD1li1COyppsk7c0crtEgAMF1uj0E4bLZ2bqtrodfRIvEhzj
         y33MAPIk1QsMxNSseyVlQKqbqhM3NhY4xvjIJGSoiAH0H/LFok3ImghamARVxb3gAf1/
         pQBLeTlJr7MY0meQsID/q9WseURiKMA+nVqnUzRXjr0FE+pg+d/MB2Ay8J941JnyT9YZ
         Xxlg==
X-Forwarded-Encrypted: i=1; AJvYcCVMLTXuSMJXFi3KU5pHJt6Soo0T4N4HU4iyobAvCknNWh7/9gsr8EPyY44rCNEYpys6OR5yI9iPcNMXEpV1jQxURO5khA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMpUGaKexrfsfTA1K0p9KpNbYFg+qhjZxoBcScvjwebQ4Gh0EA
	TPUw+TNdEEMkHJifkirkZAzl868rWlFTf2uQsavDpQsSrghEsJuFz1C8
X-Gm-Gg: ASbGncsHXe9cKEcOiIT0N/pTrfUAudyxW8xoHodT6d1ngDo3eNdljZaEPIsdwlRWMvN
	Ev6N3wWDZKa4aVt9D/8NAiojWl9X5uzcfYPpr0qcWlY66PD3hQuP2wSSSX+22wja72VmdzZDTGj
	PT+n+hbklOHM9+mMf/cHkdhqiIz40WyzDG6K/iFhMYb/z+XZgcPjMieSf+zl9R+USbfKCuSQe2y
	at8PE4Byp5RKsJhn+IMZ92FCuSvK+ywBj8vNCf2ynWYfokRJGg0wHDObfhOGOwqmzogydJEIs1H
	aZFq3g5IQS6FJmXlPaMyVqjAVw6xP1u1y18mheViI1EwezMrJJvRLPtRk5ZUW+/ajsG96tWtnna
	30joPU5FPadtahzmnOGGBgp1iqBnpZPRegREzm8FSH4cl2MwMP9NvIkhMwXtCdSZp6PpWXuy2Pq
	NQsXCc5/eRacamsQ+b45YitHEe9ZmWrujwJp1YPzD3
X-Google-Smtp-Source: AGHT+IE06nECDAq+Uk5QtE1+56tfrJDdijXtZ3fW9Zv+27AAc3S+rK/IWGF+IFYLl0pdMZ3C0cSJQA==
X-Received: by 2002:a05:600c:1f0f:b0:477:8b2e:aa7d with SMTP id 5b1f17b1804b1-477c1132bf2mr354572535e9.30.1764541900754;
        Sun, 30 Nov 2025 14:31:40 -0800 (PST)
Received: from [10.100.102.74] (89-138-71-2.bb.netvision.net.il. [89.138.71.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791163e36csm198706755e9.9.2025.11.30.14.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Nov 2025 14:31:40 -0800 (PST)
Message-ID: <1184961b-5488-4150-b647-29ed363e2276@grimberg.me>
Date: Mon, 1 Dec 2025 00:31:38 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] nvme-tcp: Support KeyUpdate
To: alistair23@gmail.com, chuck.lever@oracle.com, hare@kernel.org,
 kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, kch@nvidia.com,
 hare@suse.de, Alistair Francis <alistair.francis@wdc.com>
References: <20251112042720.3695972-1-alistair.francis@wdc.com>
 <20251112042720.3695972-6-alistair.francis@wdc.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20251112042720.3695972-6-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/11/2025 6:27, alistair23@gmail.com wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
>
> If the nvme_tcp_try_send() or nvme_tcp_try_recv() functions return
> EKEYEXPIRED then the underlying TLS keys need to be updated. This occurs
> on an KeyUpdate event as described in RFC8446
> https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3.
>
> If the NVMe Target (TLS server) initiates a KeyUpdate this patch will
> allow the NVMe layer to process the KeyUpdate request and forward the
> request to userspace. Userspace must then update the key to keep the
> connection alive.
>
> This patch allows us to handle the NVMe target sending a KeyUpdate
> request without aborting the connection. At this time we don't support
> initiating a KeyUpdate.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---

I see this is on top of Hannes recvmsg patch. Worth noting in the patch 
here at least.

> v5:
>   - Cleanup code flow
>   - Check for MSG_CTRUNC in the msg_flags return from recvmsg
>     and use that to determine if it's a control message
> v4:
>   - Remove all support for initiating KeyUpdate
>   - Don't call cancel_work() when updating keys
> v3:
>   - Don't cancel existing handshake requests
> v2:
>   - Don't change the state
>   - Use a helper function for KeyUpdates
>   - Continue sending in nvme_tcp_send_all() after a KeyUpdate
>   - Remove command message using recvmsg
>
>   drivers/nvme/host/tcp.c | 85 +++++++++++++++++++++++++++++++++--------
>   1 file changed, 70 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 4797a4532b0d..5cec5a974bbf 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -172,6 +172,7 @@ struct nvme_tcp_queue {
>   	bool			tls_enabled;
>   	u32			rcv_crc;
>   	u32			snd_crc;
> +	key_serial_t		handshake_session_id;
>   	__le32			exp_ddgst;
>   	__le32			recv_ddgst;
>   	struct completion       tls_complete;
> @@ -858,7 +859,10 @@ static void nvme_tcp_handle_c2h_term(struct nvme_tcp_queue *queue,
>   static int nvme_tcp_recvmsg_pdu(struct nvme_tcp_queue *queue)
>   {
>   	char *pdu = queue->pdu;
> +	char cbuf[CMSG_LEN(sizeof(char))] = {};
>   	struct msghdr msg = {
> +		.msg_control = cbuf,
> +		.msg_controllen = sizeof(cbuf),
>   		.msg_flags = MSG_DONTWAIT,
>   	};
>   	struct kvec iov = {
> @@ -873,12 +877,17 @@ static int nvme_tcp_recvmsg_pdu(struct nvme_tcp_queue *queue)
>   	if (ret <= 0)
>   		return ret;
>   
> +	hdr = queue->pdu;
> +	if (hdr->type == TLS_HANDSHAKE_KEYUPDATE) {
> +		dev_err(queue->ctrl->ctrl.device, "KeyUpdate message\n");
> +		return 1;
> +	}
> +
>   	queue->pdu_remaining -= ret;
>   	queue->pdu_offset += ret;
>   	if (queue->pdu_remaining)
>   		return 0;
>   
> -	hdr = queue->pdu;
>   	if (unlikely(hdr->hlen != sizeof(struct nvme_tcp_rsp_pdu))) {
>   		if (!nvme_tcp_recv_pdu_supported(hdr->type))
>   			goto unsupported_pdu;
> @@ -944,6 +953,7 @@ static int nvme_tcp_recvmsg_data(struct nvme_tcp_queue *queue)
>   	struct request *rq =
>   		nvme_cid_to_rq(nvme_tcp_tagset(queue), pdu->command_id);
>   	struct nvme_tcp_request *req = blk_mq_rq_to_pdu(rq);
> +	char cbuf[CMSG_LEN(sizeof(char))] = {};
>   
>   	if (nvme_tcp_recv_state(queue) != NVME_TCP_RECV_DATA)
>   		return 0;
> @@ -976,10 +986,26 @@ static int nvme_tcp_recvmsg_data(struct nvme_tcp_queue *queue)
>   
>   		ret = sock_recvmsg(queue->sock, &msg, msg.msg_flags);
>   		if (ret < 0) {
> -			dev_err(queue->ctrl->ctrl.device,
> -				"queue %d failed to receive request %#x data",
> -				nvme_tcp_queue_id(queue), rq->tag);
> -			return ret;
> +			/* If MSG_CTRUNC is set, it's a control message,
> +			 * so let's read the control message.
> +			 */
> +			if (msg.msg_flags & MSG_CTRUNC) {
> +				memset(&msg, 0, sizeof(msg));
> +				msg.msg_flags = MSG_DONTWAIT;
> +				msg.msg_control = cbuf;
> +				msg.msg_controllen = sizeof(cbuf);
> +
> +				ret = sock_recvmsg(queue->sock, &msg, msg.msg_flags);
> +			}
> +
> +			if (ret < 0) {
> +				dev_dbg(queue->ctrl->ctrl.device,
> +					"queue %d failed to receive request %#x data, %d",
> +					nvme_tcp_queue_id(queue), rq->tag, ret);
> +				return ret;
> +			}
> +
> +			return 0;
>   		}
>   		if (queue->data_digest)
>   			nvme_tcp_ddgst_calc(req, &queue->rcv_crc, ret);
> @@ -1384,15 +1410,39 @@ static int nvme_tcp_try_recvmsg(struct nvme_tcp_queue *queue)
>   		}
>   	} while (result >= 0);
>   
> -	if (result < 0 && result != -EAGAIN) {
> -		dev_err(queue->ctrl->ctrl.device,
> -			"receive failed:  %d\n", result);
> -		queue->rd_enabled = false;
> -		nvme_tcp_error_recovery(&queue->ctrl->ctrl);
> -	} else if (result == -EAGAIN)
> -		result = 0;
> +	if (result < 0) {
> +		if (result != -EKEYEXPIRED && result != -EAGAIN) {
> +			dev_err(queue->ctrl->ctrl.device,
> +				"receive failed:  %d\n", result);
> +			queue->rd_enabled = false;
> +			nvme_tcp_error_recovery(&queue->ctrl->ctrl);
> +		}
> +		return result;
> +	}
> +
> +	queue->nr_cqe = nr_cqe;
> +	return nr_cqe;
> +}
> +
> +static void update_tls_keys(struct nvme_tcp_queue *queue)
> +{
> +	int qid = nvme_tcp_queue_id(queue);
> +	int ret;
> +
> +	dev_dbg(queue->ctrl->ctrl.device,
> +		"updating key for queue %d\n", qid);
>   
> -	return result < 0 ? result : (queue->nr_cqe = nr_cqe);
> +	flush_work(&(queue->ctrl->ctrl).async_event_work);
> +
> +	ret = nvme_tcp_start_tls(&(queue->ctrl->ctrl),
> +				 queue, queue->ctrl->ctrl.tls_pskid,
> +				 HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED);

No need to quiesce the queue or anything like that? everything continues 
as usual?
Why are you flushing async_event_work?

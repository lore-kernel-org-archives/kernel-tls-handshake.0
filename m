Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA66323AD
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 09:59:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DEBAC20C26;
	Wed, 22 Mar 2023 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679479143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5u48NfCtD3GevZW8dmkisL4vWBUyF59/SO7SUwoT5u4=;
	b=IgSXNbVlaQc4K9wXmtgc5gmLMcoianq7xcZmq71j3S2Q6rGLbtieWICzseFwHz82Q6ng++
	YnyPsx6dmdEg+YIvZmHnYbZAtW6vWI/YLxF4ZleY6APPRREIxvgOWwl7pHRTfwrYpiB6k2
	dGBvXZ8EFoiYkL9uK+SFLCIln26L+HM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679479143;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5u48NfCtD3GevZW8dmkisL4vWBUyF59/SO7SUwoT5u4=;
	b=Epafx1hQnNuhKgAZaAckpmR2jlBDdyMxX2q3aKRUfW7SnRFeOx+iRYQbRfLsgPULB8/CAM
	nDfI1cthw0i/rvBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C972113416;
	Wed, 22 Mar 2023 09:59:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id DQK8MGfRGmSeAQAAMHmgww
	(envelope-from <hare@suse.de>); Wed, 22 Mar 2023 09:59:03 +0000
Message-ID: <131a482e-f2ac-5426-d712-6c5fe91a67c5@suse.de>
Date: Wed, 22 Mar 2023 10:59:03 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 09/18] nvme-tcp: add connect option 'tls'
To: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-10-hare@suse.de>
 <65e17a9f-cc5a-0286-71fd-34c8560137cd@grimberg.me>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <65e17a9f-cc5a-0286-71fd-34c8560137cd@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/22/23 10:24, Sagi Grimberg wrote:
>> Add a connect option 'tls' to request TLS1.3 in-band encryption, and
>> abort the connection attempt if TLS could not be established.
>>
>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>> ---
>>   drivers/nvme/host/fabrics.c | 5 +++++
>>   drivers/nvme/host/fabrics.h | 2 ++
>>   drivers/nvme/host/tcp.c     | 7 ++++++-
>>   3 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
>> index bbaa04a0c502..fdff7cdff029 100644
>> --- a/drivers/nvme/host/fabrics.c
>> +++ b/drivers/nvme/host/fabrics.c
>> @@ -609,6 +609,7 @@ static const match_table_t opt_tokens = {
>>       { NVMF_OPT_DISCOVERY,        "discovery"        },
>>       { NVMF_OPT_DHCHAP_SECRET,    "dhchap_secret=%s"    },
>>       { NVMF_OPT_DHCHAP_CTRL_SECRET,    "dhchap_ctrl_secret=%s"    },
>> +    { NVMF_OPT_TLS,            "tls"            },
>>       { NVMF_OPT_ERR,            NULL            }
>>   };
>> @@ -632,6 +633,7 @@ static int nvmf_parse_options(struct 
>> nvmf_ctrl_options *opts,
>>       opts->hdr_digest = false;
>>       opts->data_digest = false;
>>       opts->tos = -1; /* < 0 == use transport default */
>> +    opts->tls = false;
>>       options = o = kstrdup(buf, GFP_KERNEL);
>>       if (!options)
>> @@ -918,6 +920,9 @@ static int nvmf_parse_options(struct 
>> nvmf_ctrl_options *opts,
>>               kfree(opts->dhchap_ctrl_secret);
>>               opts->dhchap_ctrl_secret = p;
>>               break;
>> +        case NVMF_OPT_TLS:
>> +            opts->tls = true;
>> +            break;
>>           default:
>>               pr_warn("unknown parameter or missing value '%s' in ctrl 
>> creation request\n",
>>                   p);
>> diff --git a/drivers/nvme/host/fabrics.h b/drivers/nvme/host/fabrics.h
>> index dcac3df8a5f7..c4538a9d437c 100644
>> --- a/drivers/nvme/host/fabrics.h
>> +++ b/drivers/nvme/host/fabrics.h
>> @@ -70,6 +70,7 @@ enum {
>>       NVMF_OPT_DISCOVERY    = 1 << 22,
>>       NVMF_OPT_DHCHAP_SECRET    = 1 << 23,
>>       NVMF_OPT_DHCHAP_CTRL_SECRET = 1 << 24,
>> +    NVMF_OPT_TLS        = 1 << 25,
>>   };
>>   /**
>> @@ -128,6 +129,7 @@ struct nvmf_ctrl_options {
>>       int            max_reconnects;
>>       char            *dhchap_secret;
>>       char            *dhchap_ctrl_secret;
>> +    bool            tls;
>>       bool            disable_sqflow;
>>       bool            hdr_digest;
>>       bool            data_digest;
>> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
>> index bcf24e9a08e1..bbff1f52a167 100644
>> --- a/drivers/nvme/host/tcp.c
>> +++ b/drivers/nvme/host/tcp.c
>> @@ -1902,6 +1902,9 @@ static int nvme_tcp_alloc_admin_queue(struct 
>> nvme_ctrl *ctrl)
>>               break;
>>       }
>>       if (ret) {
>> +        /* Abort if TLS is requested */
>> +        if (num_keys && ctrl->opts->tls)
>> +            goto out_free_queue;
>>           /* Try without TLS */
>>           ret = nvme_tcp_alloc_queue(ctrl, 0, 0);
>>           if (ret)
>> @@ -1934,6 +1937,8 @@ static int __nvme_tcp_alloc_io_queues(struct 
>> nvme_ctrl *ctrl)
>>                   break;
>>           }
>>           if (ret) {
>> +            if (num_keys && ctrl->opts->tls)
>> +                goto out_free_queues;
> 
> I don't see why we even attempt tls if we're not explicitly told to.

Because we don't know.

It's all easy if we do a discovery before connect, as the discovery log 
page tells us what to do.
But if we do _not_ do a discovery, how would we know what to do?

We could try to start off with no TLS, but if the server requires TLS 
then all we get is a 'connection refused' error, leaving us none the wiser.
So really we have to start off with TLS (if we have a matching 
identity). The server then can always refuse the connection (with the 
same error), in which case we should re-try without TLS.
That's where the 'tls' option comes in: to avoid having a fallback 
without TLS.

So in the end we have three modes for the client:

1) TLS not supported
2) TLS allowed (with fallback to non-TLS)
3) TLS required (no fallback to non-TLS)

For modes 2) and 3) a PSK has to be present, and
the 'tls' option is used to switch from mode 2) to mode 3)

Cheers,

Hannes


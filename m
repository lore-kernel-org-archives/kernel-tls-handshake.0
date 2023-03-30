Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149018C02
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Mar 2023 17:34:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5D26D1F8AA;
	Thu, 30 Mar 2023 17:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680197675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2Ty5rkf75McgcOWTOsV8JH/Lx9bjG+T+0ktf/Hv4Kc=;
	b=shI1Nft3s+XBh1ZS24vE0AYmiOtgcPcwV0cx/ncH0D9Zh41Y4ORNgv8SedEYTvAUacUmmf
	khzB4w3nH+0GJRgxR7FzphW4e2xNE5GesBgagh5AUgjhDEv5IgxyH3o0tgo3cidL5FiyKk
	sOoN9o7aAgaZLRm1Ac2zYDMBaG0Oi/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680197675;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2Ty5rkf75McgcOWTOsV8JH/Lx9bjG+T+0ktf/Hv4Kc=;
	b=E/hV8fNUUP34GA7SL908WnfJchr6zG196Y081CNHUAguaSgDNLDzWNpgdWSiQ/0v8lF0OY
	S1L622uU0VwCPPCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 357721348E;
	Thu, 30 Mar 2023 17:34:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id hNh3CyvIJWS3DAAAMHmgww
	(envelope-from <hare@suse.de>); Thu, 30 Mar 2023 17:34:35 +0000
Message-ID: <daf1e19e-119b-3ceb-7808-b74d8b113e05@suse.de>
Date: Thu, 30 Mar 2023 19:34:34 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 12/18] nvme-fabrics: parse options 'keyring' and 'tls_key'
Content-Language: en-US
To: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-13-hare@suse.de>
 <677f3f9a-872d-27fe-9a21-b41bbe1c44ff@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <677f3f9a-872d-27fe-9a21-b41bbe1c44ff@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/30/23 17:33, Sagi Grimberg wrote:
>> Parse the fabrics options 'keyring' and 'tls_key' and store the
>> referenced keys in the options structure.
> 
> Can you explain the reasoning to why a user need to pass a keyring
> given that we already set up one?
> 
Choice.
With a single keyring we can only have a single identity.
But there might be configurations where we want to have different PSKs
for the same identity (eg for key rotation).
With this option we can prepare a new keyring, and use that instead of 
the old one.

(And it really doesn't add much complexity...)

>>
>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>> ---
>>   drivers/nvme/host/fabrics.c | 79 ++++++++++++++++++++++++++++++++++++-
>>   drivers/nvme/host/fabrics.h |  6 +++
>>   drivers/nvme/host/tcp.c     | 20 +++++++---
>>   3 files changed, 98 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
>> index 3e4f0e45b58f..5f5e487d498c 100644
>> --- a/drivers/nvme/host/fabrics.c
>> +++ b/drivers/nvme/host/fabrics.c
>> @@ -605,6 +605,8 @@ static const match_table_t opt_tokens = {
>>       { NVMF_OPT_NR_WRITE_QUEUES,    "nr_write_queues=%d"    },
>>       { NVMF_OPT_NR_POLL_QUEUES,    "nr_poll_queues=%d"    },
>>       { NVMF_OPT_TOS,            "tos=%d"        },
>> +    { NVMF_OPT_KEYRING,        "keyring=%d"        },
>> +    { NVMF_OPT_TLS_KEY,        "tls_key=%d"        },
>>       { NVMF_OPT_FAIL_FAST_TMO,    "fast_io_fail_tmo=%d"    },
>>       { NVMF_OPT_DISCOVERY,        "discovery"        },
>>       { NVMF_OPT_DHCHAP_SECRET,    "dhchap_secret=%s"    },
>> @@ -620,8 +622,9 @@ static int nvmf_parse_options(struct 
>> nvmf_ctrl_options *opts,
>>       char *options, *o, *p;
>>       int token, ret = 0;
>>       size_t nqnlen  = 0;
>> -    int ctrl_loss_tmo = NVMF_DEF_CTRL_LOSS_TMO;
>> +    int ctrl_loss_tmo = NVMF_DEF_CTRL_LOSS_TMO, key_id;
>>       uuid_t hostid;
>> +    struct key *key = NULL;
>>       /* Set defaults */
>>       opts->queue_size = NVMF_DEF_QUEUE_SIZE;
>> @@ -889,6 +892,74 @@ static int nvmf_parse_options(struct 
>> nvmf_ctrl_options *opts,
>>               }
>>               opts->tos = token;
>>               break;
>> +        case NVMF_OPT_KEYRING:
>> +#ifdef CONFIG_NVME_TLS
> 
> Same comment as before:
>              if (!IS_ENABLED(CONFIG_NVME_TLS)) {
>                  pr_err("TLS is not supported\n");
>                  ret = -EINVAL;
>                  goto out;
>              }
> 
OK.

>> +            if (match_int(args, &key_id)) {
>> +                ret = -EINVAL;
>> +                goto out;
>> +            }
>> +            if (key_id < 0) {
>> +                pr_err("Invalid keyring id %d\n", key_id);
>> +                ret = -EINVAL;
>> +                goto out;
>> +            }
>> +            if (!key_id) {
>> +                pr_debug("Using default keyring\n");
>> +                if (opts->keyring) {
>> +                    key_put(opts->keyring);
>> +                    opts->keyring = NULL;
>> +                }
>> +                break;
>> +            }
>> +            key = key_lookup(key_id);
>> +            if (!key) {
>> +                pr_err("Keyring id %08x not found\n", key_id);
>> +                ret = -ENOKEY;
>> +                goto out;
>> +            }
>> +            if (opts->keyring)
>> +                key_put(opts->keyring);
>> +            opts->keyring = key;
>> +            break;
>> +#else
>> +            pr_err("TLS is not supported\n");
>> +            ret = -EINVAL;
>> +            goto out;
>> +#endif
>> +        case NVMF_OPT_TLS_KEY:
>> +#ifdef CONFIG_NVME_TLS
>> +            if (match_int(args, &key_id)) {
>> +                ret = -EINVAL;
>> +                goto out;
>> +            }
>> +            if (key_id < 0) {
>> +                pr_err("Invalid key id %d\n", key_id);
>> +                ret = -EINVAL;
>> +                goto out;
>> +            }
>> +            if (!key_id) {
>> +                pr_debug("Using 'best' PSK\n");
>> +                if (opts->tls_key) {
>> +                    key_put(opts->tls_key);
>> +                    opts->tls_key = NULL;
>> +                }
>> +                break;
>> +            }
>> +            key = key_lookup(key_id);
>> +            if (!key) {
>> +                pr_err("Key id %08x not found\n", key_id);
>> +                ret = -ENOKEY;
>> +                goto out;
>> +            }
>> +            if (opts->tls_key)
>> +                key_put(opts->tls_key);
>> +            opts->tls_key = key;
>> +#else
>> +            pr_err("TLS is not supported\n");
>> +            ret = -EINVAL;
>> +            goto out;
>> +#endif
>> +            break;
>>           case NVMF_OPT_DISCOVERY:
>>               opts->discovery_nqn = true;
>>               break;
>> @@ -1054,6 +1125,12 @@ static int nvmf_check_allowed_opts(struct 
>> nvmf_ctrl_options *opts,
>>   void nvmf_free_options(struct nvmf_ctrl_options *opts)
>>   {
>>       nvmf_host_put(opts->host);
>> +#ifdef CONFIG_NVME_TLS
>> +    if (opts->keyring)
>> +        key_put(opts->keyring);
>> +    if (opts->tls_key)
>> +        key_put(opts->tls_key);
> 
> I think key_put is null safe.

Possibly. I'll check.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


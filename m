Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B8D1FDE
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 08:49:04 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id l12so16147845wrm.10
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 01:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679474943;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jyzJCjEb3uLVZsp7cxfG/DqIFon8OUNxLH/9tEstvh8=;
        b=oJR5RTfRgIA6IfIuqTMkZ6i3Ir29xCE1N8CXg5fxAUVtj/F5FIeNTUES5nqlu6fBHG
         TXsnipBFeUujSKoETgOjsA3tQTXvmTSh7RyE3G8y82XH1WxWDf3lPKsW47dlfPC5823v
         plHYdO6RgE7W439vv2idGW/zPImhnLPhb6rijF04qd3l2rG2LABGesP5s6bVvc31HtlR
         /L4zVj/APZWk8//0Oe6mGp/x5UVDNkDUWg08NXb7uDSs31s5A2/H42ciLz9rCM9MuIPh
         Ip31n5JPUfZ9z7noPo7uvwqnL1yXGsuP2ho/FpaA23pvlr6oaOihW5CvS4LcfEOIyupm
         XNQA==
X-Gm-Message-State: AO0yUKUHgkMBAnhHA9js8qkQc49QpDTpN66u4WQQe7rGBuxvjiHUam/d
	PXbNWaHB7sECLkonutbxnHI=
X-Google-Smtp-Source: AK7set9W7ZqKSwztAWJSyPyxEf8ZvRdhlJzLFh1FsEOSXyYcenAg3oOct09itrpgkHMrNArwOmtRSQ==
X-Received: by 2002:a5d:6e54:0:b0:2d2:9c19:f75 with SMTP id j20-20020a5d6e54000000b002d29c190f75mr3719388wrz.1.1679474943263;
        Wed, 22 Mar 2023 01:49:03 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id d12-20020adffbcc000000b002c54e26bca5sm13357345wrs.49.2023.03.22.01.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 01:49:03 -0700 (PDT)
Message-ID: <7480845a-1a95-2801-a929-b6b3dc0ad88d@grimberg.me>
Date: Wed, 22 Mar 2023 10:49:01 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 02/18] nvme-keyring: define a 'psk' keytype
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-3-hare@suse.de>
 <d5ca39af-ff50-db27-ab1b-a8c57d2152b9@grimberg.me>
 <fa1f8cd0-4bb7-c3cc-f4ca-64e2f877b528@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <fa1f8cd0-4bb7-c3cc-f4ca-64e2f877b528@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


>> On 3/21/23 14:43, Hannes Reinecke wrote:
>>> Define a 'psk' keytype to hold the NVMe TLS PSKs.
>>>
>>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>>> ---
>>>   drivers/nvme/common/keyring.c | 96 +++++++++++++++++++++++++++++++++++
>>>   include/linux/nvme-keyring.h  |  8 +++
>>>   2 files changed, 104 insertions(+)
>>>
>>> diff --git a/drivers/nvme/common/keyring.c 
>>> b/drivers/nvme/common/keyring.c
>>> index 3a6e8a0b38e2..6cbb9d66e0f6 100644
>>> --- a/drivers/nvme/common/keyring.c
>>> +++ b/drivers/nvme/common/keyring.c
>>> @@ -11,6 +11,96 @@
>>>   static struct key *nvme_keyring;
>>> +key_serial_t nvme_keyring_id(void)
>>> +{
>>> +    return nvme_keyring->serial;
>>> +}
>>> +EXPORT_SYMBOL_GPL(nvme_keyring_id);
>>> +
>>> +static void nvme_tls_psk_describe(const struct key *key, struct 
>>> seq_file *m)
>>> +{
>>> +    seq_puts(m, key->description);
>>> +    seq_printf(m, ": %u", key->datalen);
>>> +}
>>> +
>>> +static bool nvme_tls_psk_match(const struct key *key,
>>> +                   const struct key_match_data *match_data)
>>> +{
>>> +    const char *match_id;
>>> +    size_t match_len;
>>> +
>>> +    if (!key->description) {
>>> +        pr_debug("%s: no key description\n", __func__);
>>> +        return false;
>>> +    }
>>> +    match_len = strlen(key->description);
>>> +    pr_debug("%s: id %s len %zd\n", __func__, key->description, 
>>> match_len);
>>> +
>>> +    if (!match_data->raw_data) {
>>> +        pr_debug("%s: no match data\n", __func__);
>>> +        return false;
>>> +    }
>>> +    match_id = match_data->raw_data;
>>> +    pr_debug("%s: match '%s' '%s' len %lu\n",
>>> +         __func__, match_id, key->description, match_len);
>>> +    return !memcmp(key->description, match_id, match_len);
>>> +}
>>> +
>>> +static int nvme_tls_psk_match_preparse(struct key_match_data 
>>> *match_data)
>>> +{
>>> +    match_data->lookup_type = KEYRING_SEARCH_LOOKUP_ITERATE;
>>> +    match_data->cmp = nvme_tls_psk_match;
>>> +    return 0;
>>> +}
>>> +
>>> +static struct key_type nvme_tls_psk_key_type = {
>>> +    .name           = "psk",
>>> +    .flags          = KEY_TYPE_NET_DOMAIN,
>>> +    .preparse       = user_preparse,
>>> +    .free_preparse  = user_free_preparse,
>>> +    .match_preparse = nvme_tls_psk_match_preparse,
>>> +    .instantiate    = generic_key_instantiate,
>>> +    .revoke         = user_revoke,
>>> +    .destroy        = user_destroy,
>>> +    .describe       = nvme_tls_psk_describe,
>>> +    .read           = user_read,
>>> +};
>>> +
>>
>> Hannes, can you please provide a documentation section
>> to this function? most importantly 'generated' argument.
>>
> Sure. There are two types of PSK types specified in the NVMe TCP spec;
> a 'retained' one which has to be provided by the admin, and a 
> 'generated' one which is derived from the shared key material from 
> DH-HMAC-CHAP when doing a secure channel concatenation.
> And each type has two possible hash algorithms (SHA-256 and SHA-384),
> resulting in 4 possible PSKs.
> 
> And indeed, the secure channel concatenation bits are missing as we're 
> still hashing out details at the fmds group.
> I do have a patchset for that, though, but decided not to include it in 
> this submission as it'll increase the patchset even more.
> Can do if you like ...

I'd prefer to split the secure channel concatenation out of this.
But it would be good to give some context in the code.

Also the bool is confusing, can you make this an enumeration that
translates to 'G' or 'R' and pass that in?

> 
> But will be updating the documentation.
> 
>>> +struct key *nvme_tls_psk_lookup(key_ref_t keyring,
>>> +        const char *hostnqn, const char *subnqn,
>>> +        int hmac, bool generated)
>>> +{
>>> +    char *identity;
>>> +    size_t identity_len = (NVMF_NQN_SIZE) * 2 + 11;
>>> +    key_ref_t keyref;
>>> +    key_serial_t keyring_id;
>>> +
>>> +    identity = kzalloc(identity_len, GFP_KERNEL);
>>> +    if (!identity)
>>> +        return ERR_PTR(-ENOMEM);
>>> +
>>> +    snprintf(identity, identity_len, "NVMe0%c%02d %s %s",
>>> +         generated ? 'G' : 'R', hmac, hostnqn, subnqn);
>>
>> Is that a format that is expected from userspace to produce?
>>
> Yes. See
> NVMe-TCP 1.0a section 3.6.1.3 "TLS PSK and PSK Identity Derivation"
> for details.
> 

Yes, I see it now. Thanks.

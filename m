Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29634EC3
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 08:38:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6DC6820B62;
	Wed, 22 Mar 2023 08:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679474281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1RvAxe15+D2V2m1hbNwfHaDcWR6Xe6C0IeBdNTH7uw=;
	b=gCObaOuO24FIrZM/IzHkRLR1AqnPmBWZN0jdl2VxlF8HQYEbXU8AX0+/WPwnnVUvQq5c2e
	j6TKYCCBmG8y4Fbe3R2WNyO+G6Gke4JnQYvkCF3SY1ETZR3QfWqLym+NPtfJnXLwoVXXPl
	5n25yX6S2HDdIuJUXUEazcaCkK7vQxw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679474281;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1RvAxe15+D2V2m1hbNwfHaDcWR6Xe6C0IeBdNTH7uw=;
	b=J+Yv8mrFC0e5o97d+1eefEOzUrntDI1fUyhJBaP0l/DW0XihHc+drLmcPaj/CyUrqNm+OK
	DynJyvoOJh8uxEDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A466138E9;
	Wed, 22 Mar 2023 08:38:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IJ6TEWm+GmRRRAAAMHmgww
	(envelope-from <hare@suse.de>); Wed, 22 Mar 2023 08:38:01 +0000
Message-ID: <fa1f8cd0-4bb7-c3cc-f4ca-64e2f877b528@suse.de>
Date: Wed, 22 Mar 2023 09:38:00 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 02/18] nvme-keyring: define a 'psk' keytype
Content-Language: en-US
To: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-3-hare@suse.de>
 <d5ca39af-ff50-db27-ab1b-a8c57d2152b9@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <d5ca39af-ff50-db27-ab1b-a8c57d2152b9@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/22/23 09:29, Sagi Grimberg wrote:
> 
> 
> On 3/21/23 14:43, Hannes Reinecke wrote:
>> Define a 'psk' keytype to hold the NVMe TLS PSKs.
>>
>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>> ---
>>   drivers/nvme/common/keyring.c | 96 +++++++++++++++++++++++++++++++++++
>>   include/linux/nvme-keyring.h  |  8 +++
>>   2 files changed, 104 insertions(+)
>>
>> diff --git a/drivers/nvme/common/keyring.c 
>> b/drivers/nvme/common/keyring.c
>> index 3a6e8a0b38e2..6cbb9d66e0f6 100644
>> --- a/drivers/nvme/common/keyring.c
>> +++ b/drivers/nvme/common/keyring.c
>> @@ -11,6 +11,96 @@
>>   static struct key *nvme_keyring;
>> +key_serial_t nvme_keyring_id(void)
>> +{
>> +    return nvme_keyring->serial;
>> +}
>> +EXPORT_SYMBOL_GPL(nvme_keyring_id);
>> +
>> +static void nvme_tls_psk_describe(const struct key *key, struct 
>> seq_file *m)
>> +{
>> +    seq_puts(m, key->description);
>> +    seq_printf(m, ": %u", key->datalen);
>> +}
>> +
>> +static bool nvme_tls_psk_match(const struct key *key,
>> +                   const struct key_match_data *match_data)
>> +{
>> +    const char *match_id;
>> +    size_t match_len;
>> +
>> +    if (!key->description) {
>> +        pr_debug("%s: no key description\n", __func__);
>> +        return false;
>> +    }
>> +    match_len = strlen(key->description);
>> +    pr_debug("%s: id %s len %zd\n", __func__, key->description, 
>> match_len);
>> +
>> +    if (!match_data->raw_data) {
>> +        pr_debug("%s: no match data\n", __func__);
>> +        return false;
>> +    }
>> +    match_id = match_data->raw_data;
>> +    pr_debug("%s: match '%s' '%s' len %lu\n",
>> +         __func__, match_id, key->description, match_len);
>> +    return !memcmp(key->description, match_id, match_len);
>> +}
>> +
>> +static int nvme_tls_psk_match_preparse(struct key_match_data 
>> *match_data)
>> +{
>> +    match_data->lookup_type = KEYRING_SEARCH_LOOKUP_ITERATE;
>> +    match_data->cmp = nvme_tls_psk_match;
>> +    return 0;
>> +}
>> +
>> +static struct key_type nvme_tls_psk_key_type = {
>> +    .name           = "psk",
>> +    .flags          = KEY_TYPE_NET_DOMAIN,
>> +    .preparse       = user_preparse,
>> +    .free_preparse  = user_free_preparse,
>> +    .match_preparse = nvme_tls_psk_match_preparse,
>> +    .instantiate    = generic_key_instantiate,
>> +    .revoke         = user_revoke,
>> +    .destroy        = user_destroy,
>> +    .describe       = nvme_tls_psk_describe,
>> +    .read           = user_read,
>> +};
>> +
> 
> Hannes, can you please provide a documentation section
> to this function? most importantly 'generated' argument.
> 
Sure. There are two types of PSK types specified in the NVMe TCP spec;
a 'retained' one which has to be provided by the admin, and a 
'generated' one which is derived from the shared key material from 
DH-HMAC-CHAP when doing a secure channel concatenation.
And each type has two possible hash algorithms (SHA-256 and SHA-384),
resulting in 4 possible PSKs.

And indeed, the secure channel concatenation bits are missing as we're 
still hashing out details at the fmds group.
I do have a patchset for that, though, but decided not to include it in 
this submission as it'll increase the patchset even more.
Can do if you like ...

But will be updating the documentation.

>> +struct key *nvme_tls_psk_lookup(key_ref_t keyring,
>> +        const char *hostnqn, const char *subnqn,
>> +        int hmac, bool generated)
>> +{
>> +    char *identity;
>> +    size_t identity_len = (NVMF_NQN_SIZE) * 2 + 11;
>> +    key_ref_t keyref;
>> +    key_serial_t keyring_id;
>> +
>> +    identity = kzalloc(identity_len, GFP_KERNEL);
>> +    if (!identity)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    snprintf(identity, identity_len, "NVMe0%c%02d %s %s",
>> +         generated ? 'G' : 'R', hmac, hostnqn, subnqn);
> 
> Is that a format that is expected from userspace to produce?
> 
Yes. See
NVMe-TCP 1.0a section 3.6.1.3 "TLS PSK and PSK Identity Derivation"
for details.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


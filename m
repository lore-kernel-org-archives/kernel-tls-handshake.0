Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7051FB1
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 08:29:37 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id w11so9907289wmo.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 01:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679473776; x=1682065776;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rFFtXhWVnyy6B1TQuSUK7Y0owhPhRt8wZn9t68S1Vzo=;
        b=AgzwqKrYHZXEeedyKz19qEjOmrKUzKnzA8LAGa5J3C0YfcnbwLHFaWNyvseXPvcQfV
         33x0Rs6ILkSkNVlMHzrIBGpQHcqDaC6PlqCp657T8g3woCHv7q0zJuMnsmnFEiV91DHr
         TEVeibBWEQHk8AjPOBawAiM4VOSKIitx66fS2A3bodbfQw/tuZ4PhqK1BkA6ySom9lL9
         8h9Qw3MSB16X5RBmjWWeINI2Cnh0FZPj+ybhNvyiP3vuexg6uJe0o8AoTit2j3+9d7Wf
         2/cKn53NUa8njdC3s1SB3ao2DJvF+Kv6Lk8BLaJOcRLCLTNDwT2zJRrLFqDFWfqRTHFy
         QtTg==
X-Gm-Message-State: AO0yUKUmE0eIhHee5cmTJPd1DnjvoZxoNkFFHKoX1I9lyY1IgTOsiOlJ
	661tWyv30lNEkR0QxTvgF/g=
X-Google-Smtp-Source: AK7set+7TTCogOgs2Xm+lBmCz+vYhA8tgm2F+hB9qRVumvGzaBSTq9f55lwpQ6I9bV7pTmc5dOfmqg==
X-Received: by 2002:a05:600c:4504:b0:3ed:d119:df27 with SMTP id t4-20020a05600c450400b003edd119df27mr5305541wmo.3.1679473776143;
        Wed, 22 Mar 2023 01:29:36 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id s11-20020a1cf20b000000b003db0bb81b6asm16255388wmc.1.2023.03.22.01.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 01:29:35 -0700 (PDT)
Message-ID: <d5ca39af-ff50-db27-ab1b-a8c57d2152b9@grimberg.me>
Date: Wed, 22 Mar 2023 10:29:34 +0200
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
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230321124325.77385-3-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/21/23 14:43, Hannes Reinecke wrote:
> Define a 'psk' keytype to hold the NVMe TLS PSKs.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   drivers/nvme/common/keyring.c | 96 +++++++++++++++++++++++++++++++++++
>   include/linux/nvme-keyring.h  |  8 +++
>   2 files changed, 104 insertions(+)
> 
> diff --git a/drivers/nvme/common/keyring.c b/drivers/nvme/common/keyring.c
> index 3a6e8a0b38e2..6cbb9d66e0f6 100644
> --- a/drivers/nvme/common/keyring.c
> +++ b/drivers/nvme/common/keyring.c
> @@ -11,6 +11,96 @@
>   
>   static struct key *nvme_keyring;
>   
> +key_serial_t nvme_keyring_id(void)
> +{
> +	return nvme_keyring->serial;
> +}
> +EXPORT_SYMBOL_GPL(nvme_keyring_id);
> +
> +static void nvme_tls_psk_describe(const struct key *key, struct seq_file *m)
> +{
> +	seq_puts(m, key->description);
> +	seq_printf(m, ": %u", key->datalen);
> +}
> +
> +static bool nvme_tls_psk_match(const struct key *key,
> +			       const struct key_match_data *match_data)
> +{
> +	const char *match_id;
> +	size_t match_len;
> +
> +	if (!key->description) {
> +		pr_debug("%s: no key description\n", __func__);
> +		return false;
> +	}
> +	match_len = strlen(key->description);
> +	pr_debug("%s: id %s len %zd\n", __func__, key->description, match_len);
> +
> +	if (!match_data->raw_data) {
> +		pr_debug("%s: no match data\n", __func__);
> +		return false;
> +	}
> +	match_id = match_data->raw_data;
> +	pr_debug("%s: match '%s' '%s' len %lu\n",
> +		 __func__, match_id, key->description, match_len);
> +	return !memcmp(key->description, match_id, match_len);
> +}
> +
> +static int nvme_tls_psk_match_preparse(struct key_match_data *match_data)
> +{
> +	match_data->lookup_type = KEYRING_SEARCH_LOOKUP_ITERATE;
> +	match_data->cmp = nvme_tls_psk_match;
> +	return 0;
> +}
> +
> +static struct key_type nvme_tls_psk_key_type = {
> +	.name           = "psk",
> +	.flags          = KEY_TYPE_NET_DOMAIN,
> +	.preparse       = user_preparse,
> +	.free_preparse  = user_free_preparse,
> +	.match_preparse = nvme_tls_psk_match_preparse,
> +	.instantiate    = generic_key_instantiate,
> +	.revoke         = user_revoke,
> +	.destroy        = user_destroy,
> +	.describe       = nvme_tls_psk_describe,
> +	.read           = user_read,
> +};
> +

Hannes, can you please provide a documentation section
to this function? most importantly 'generated' argument.

> +struct key *nvme_tls_psk_lookup(key_ref_t keyring,
> +		const char *hostnqn, const char *subnqn,
> +		int hmac, bool generated)
> +{
> +	char *identity;
> +	size_t identity_len = (NVMF_NQN_SIZE) * 2 + 11;
> +	key_ref_t keyref;
> +	key_serial_t keyring_id;
> +
> +	identity = kzalloc(identity_len, GFP_KERNEL);
> +	if (!identity)
> +		return ERR_PTR(-ENOMEM);
> +
> +	snprintf(identity, identity_len, "NVMe0%c%02d %s %s",
> +		 generated ? 'G' : 'R', hmac, hostnqn, subnqn);

Is that a format that is expected from userspace to produce?


> +
> +	if (!keyring)
> +		keyring = make_key_ref(nvme_keyring, true);
> +	keyring_id = key_serial(key_ref_to_ptr(keyring));
> +	pr_debug("keyring %x lookup tls psk '%s'\n",
> +		 keyring_id, identity);
> +	keyref = keyring_search(keyring, &nvme_tls_psk_key_type,
> +				identity, false);
> +	if (IS_ERR(keyref)) {
> +		pr_debug("lookup tls psk '%s' failed, error %ld\n",
> +			 identity, PTR_ERR(keyref));
> +		kfree(identity);
> +		return ERR_PTR(-ENOKEY);
> +	}
> +	kfree(identity);
> +
> +	return key_ref_to_ptr(keyref);
> +}
> +EXPORT_SYMBOL_GPL(nvme_tls_psk_lookup);
> +
>   int nvme_keyring_init(void)
>   {
>   	int err;
> @@ -24,12 +114,18 @@ int nvme_keyring_init(void)
>   	if (IS_ERR(nvme_keyring))
>   		return PTR_ERR(nvme_keyring);
>   
> +	err = register_key_type(&nvme_tls_psk_key_type);
> +	if (err) {
> +		key_put(nvme_keyring);
> +		return err;
> +	}
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(nvme_keyring_init);
>   
>   void nvme_keyring_exit(void)
>   {
> +	unregister_key_type(&nvme_tls_psk_key_type);
>   	key_revoke(nvme_keyring);
>   	key_put(nvme_keyring);
>   }
> diff --git a/include/linux/nvme-keyring.h b/include/linux/nvme-keyring.h
> index a875c06cc922..c0c3d934f474 100644
> --- a/include/linux/nvme-keyring.h
> +++ b/include/linux/nvme-keyring.h
> @@ -6,6 +6,14 @@
>   #ifndef _NVME_KEYRING_H
>   #define _NVME_KEYRING_H
>   
> +#include <linux/key.h>
> +
> +struct key *nvme_tls_psk_lookup(key_ref_t keyring,
> +				const char *hostnqn, const char *subnqn,
> +				int hmac, bool generated);
> +
> +key_serial_t nvme_keyring_id(void);
> +
>   int nvme_keyring_init(void);
>   void nvme_keyring_exit(void);
>   

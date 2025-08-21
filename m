Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630CD30BF76
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 21 Aug 2025 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755781129; cv=none; b=WHAFBklmW5YyZAePXdZHVI6icjjYmZjjue3iXQ8SVoKvy/jd+SrHNoPnA2gMH3io3wwPmJVKodqyJJpTzNTTzOWeLrhVnae/LGY3gQW6nsKNZOh9+LP+IJqYkrf63breZYivun+SAB5cj0z2jF/F6hvozg4hKavMvhVr6PL/4hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755781129; c=relaxed/simple;
	bh=UmDrSVDQW61OlvQ/IGYxMAsgvIJ7POsZmxmcj0A/NJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BxnzFywYDdFTB1KTCVfv4QzAyEbRjrxeQuBVNDfOyfwEeJ3JQbE2wu6v45xaO8ivxAQ/GOUksipYhZWgt6bICUpaaO2by2/aNc0DnIJP2UoymWWp7HrRYbsX4qNetNOqGHj7WmxgijJw5Mkvlu6NUkeiF8QK2bjv1LMZmCKNvBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f7fL2PpG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f7fL2PpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755781126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/IN9LRocJtUUiNrQBqBO7to/5wjV3VgWDXDoteVLDx8=;
	b=f7fL2PpGOQwA4mKHO0HRLo+Wcgn/qxDGb1XOzgq+352lZSruJH2DGeUG2xaeB8UTKbJnqe
	dMf1lQ2HonTB0F73mcJPqxYiLwPVu/NxH9OtTN7M3l5r7gnC1vxoXT6oG9pkSk4DMcgoj8
	Xi5rqQE0MD2pJ5Oiawsc/6p5cE2niMk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-jpQ08_7BOS6j8iiDmVj-Vw-1; Thu, 21 Aug 2025 08:58:43 -0400
X-MC-Unique: jpQ08_7BOS6j8iiDmVj-Vw-1
X-Mimecast-MFC-AGG-ID: jpQ08_7BOS6j8iiDmVj-Vw_1755781123
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e86f8f27e1so311929185a.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 21 Aug 2025 05:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755781123; x=1756385923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/IN9LRocJtUUiNrQBqBO7to/5wjV3VgWDXDoteVLDx8=;
        b=gezhmwuOEYKQlc1HVziBLoeGzttftgDSYQpG96I198kPwk8fIsYY2OEcrta7ydF62B
         kV20bxMPkk6JWCOZL6aOWeIVMzxQzeAROyXX5HZFLPmVXPAq1NIbnO4ePba9BoKi9xx+
         EB/JH4URUq1QcNzDXYEIQSdh3MnL5nEueZQrrevWE1f6QPfM+zz3BVsW0MRUWtzeevDv
         bgAk2ZMWDYZiW/7aKsR1j0NtFZ5WBGE7sMZBiAQQmA+b1C+eqzk3RgP1LO7Rd/iszSqZ
         OUeUwny39FJCGJpYZmqLk3+cxGO+83sMDyOLWGCUhN4/GqZgytqVmuRU4h5XYox5po6A
         TRGg==
X-Forwarded-Encrypted: i=1; AJvYcCWAKEdI/BhPlrjXB1hJW2bxhi1k9LGxLifKax3IbMlBEM0Us2+JlmSU2aat3t/X71CgHyb4qNQGew2vLcVU+18adPcMhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQX+3yggNJg+lYcq8j2mAt+Jn0sag4me8WHt0X6JQY82ilnWKx
	OQRZrwk49M55KMPgprUnEAPH5RPcbctcG/dDds+q1NT78fQBFDWujOJc8IqFQjZ+AEtnY9DEfgS
	dkntBvkB8xB+2M+NvG4FvHLkinDWEvz3ix/Y2Su8p3RGJbFgo/iao4HJsXbpeoBl1o9qZBlKomr
	W7
X-Gm-Gg: ASbGncvxLgJFGkccMxq9DmwgkMGumivHbWdY6+NdAjvTTi7T/7pmLDr6tlw6kj0yDdt
	5ojFGbjCVmOloo0IfJnFAPB9kZlG/7LGJVTTcutXRVVGqPLa8CW3d+Pp4+N7MoY4Hr0lGvPQd7H
	8ylcs8nZVFihWC/6kYYtyBIYkEvp6KbGcCPcacawM8rWhhgxf6CiVTJxIgrtOs3eoWD2C1ate1X
	kK92YffGTJSjsxOpn20odQ7sbTBin3j6VzrWslZesMxhBVGyAKvNLi4I8fcJXCuvq8kMyO21yEa
	bzDfeT9o7FozZe9fSAhNzbbwKRoKFswDIGNgUFIgaxsWlxLaa1V5zY4TZ05Jg8fqGi5y24rzxMa
	+QTZ2B+iDQvI=
X-Received: by 2002:a05:620a:7101:b0:7e9:f820:2b2d with SMTP id af79cd13be357-7ea0972278cmr193924885a.34.1755781122862;
        Thu, 21 Aug 2025 05:58:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeLCUTHxEtHASKMXXKEyJ4YpoMztM3prkSUwTcVyjkV1jcsAE3AD3QhjWbx6EIt/TNb6CzQg==
X-Received: by 2002:a05:620a:7101:b0:7e9:f820:2b2d with SMTP id af79cd13be357-7ea0972278cmr193919585a.34.1755781122333;
        Thu, 21 Aug 2025 05:58:42 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e06ef54sm1114950585a.34.2025.08.21.05.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 05:58:41 -0700 (PDT)
Message-ID: <c06ff3eb-f69d-4bd8-b81a-a28b8b69ba52@redhat.com>
Date: Thu, 21 Aug 2025 14:58:36 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 03/15] quic: provide common utilities and data
 structures
To: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>,
 Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>,
 Jeff Layton <jlayton@kernel.org>, Benjamin Coddington <bcodding@redhat.com>,
 Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1755525878.git.lucien.xin@gmail.com>
 <7788ed89d491aa40183572a444b91dfdb28f20c4.1755525878.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <7788ed89d491aa40183572a444b91dfdb28f20c4.1755525878.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: spAGIb4TuQWoiNfQOjgImwi_dVaqSD20C5yrYbw1rqo_1755781123
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/18/25 4:04 PM, Xin Long wrote:
[...]
> +void quic_hash_tables_destroy(void)
> +{
> +	struct quic_hash_table *ht;
> +	int table;
> +
> +	for (table = 0; table < QUIC_HT_MAX_TABLES; table++) {
> +		ht = &quic_hash_tables[table];
> +		ht->size = QUIC_HT_SIZE;

Why?

> +		kfree(ht->hash);
> +	}
> +}
> +
> +int quic_hash_tables_init(void)
> +{
> +	struct quic_hash_head *head;
> +	struct quic_hash_table *ht;
> +	int table, i;
> +
> +	for (table = 0; table < QUIC_HT_MAX_TABLES; table++) {
> +		ht = &quic_hash_tables[table];
> +		ht->size = QUIC_HT_SIZE;

AFAICS the hash table size is always QUIC_HT_SIZE, which feels like too
small for connection and possibly quick sockets.

Do yoi need to differentiate the size among the different hash types?

> +		head = kmalloc_array(ht->size, sizeof(*head), GFP_KERNEL);

If so, possibly you should resort to kvmalloc_array here.

> +		if (!head) {
> +			quic_hash_tables_destroy();
> +			return -ENOMEM;
> +		}
> +		for (i = 0; i < ht->size; i++) {
> +			INIT_HLIST_HEAD(&head[i].head);
> +			if (table == QUIC_HT_UDP_SOCK) {
> +				mutex_init(&head[i].m_lock);
> +				continue;
> +			}
> +			spin_lock_init(&head[i].s_lock);

Doh, I missed the union mutex/spinlock. IMHO it would be cleaner to use
separate hash types.

[...]
> +/* Parse a comma-separated string into a 'quic_data' list format.
> + *
> + * Each comma-separated token is turned into a length-prefixed element. The
> + * first byte of each element stores the length (minus one). Elements are
> + * stored in 'to->data', and 'to->len' is updated.
> + */
> +void quic_data_from_string(struct quic_data *to, u8 *from, u32 len)
> +{
> +	struct quic_data d;
> +	u8 *p = to->data;
> +
> +	to->len = 0;
> +	while (len) {
> +		d.data = p++;
> +		d.len  = 1;
> +		while (len && *from == ' ') {
> +			from++;
> +			len--;
> +		}
> +		while (len) {
> +			if (*from == ',') {
> +				from++;
> +				len--;
> +				break;
> +			}
> +			*p++ = *from++;
> +			len--;
> +			d.len++;
> +		}
> +		*d.data = (u8)(d.len - 1);
> +		to->len += d.len;
> +	}

The above does not perform any bound checking vs the destination buffer,
it feels fragile.

/P


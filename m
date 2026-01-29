Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0F333D6D4
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 29 Jan 2026 16:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769703994; cv=none; b=V8DC3sAGvv587zNvINKwbgOSjo7El09oq0sgLIHWid4TEXmFlkju4HQpiQwjF5iAi5xzqM0oBxAdmzRgTg1qrOmV8tNXwDWDxMswR/WFLJkh4mthAnRyh+/2v9tD/O9zROAK1RZaURAmvBsi8S06nhonAl9rGgbxXwwilKjTCLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769703994; c=relaxed/simple;
	bh=l86OLD8ANrV0mU8pNoPBa0/YPrKD248BWDWu+9LLv88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HmxNv6MsXvlAf7XzNtjybbAr6KDmGAYzWHcdzvyJN2SmkhNMfU4WfJslJ3r1TQHSTNVf80xxZoFzxmQZCideA+iXkE6ILjooqr+7K65mUK/jc9ZrYbihtJpxJ+hxWwLJC2ei6jYrgs+izghUgaK7U0CQRUZvuVP467xhnViBtRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L97rwyNU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L97rwyNU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769703992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=smuqHJFpRj+j2xYajnlqs/VsDNhOWtBkZ67qclJoWoE=;
	b=L97rwyNUmhXr6951Rn0dMEipSXGsv0y8/Sdvh3YtnKEp+8eo/03Oap1s/3O9AAdEMyAbrT
	7MlNh4/PgIPK83iXXlAC82gfy6uk1eNftRgewOxbBwOmgfaLrSqCdNn/eQZU1HHp8IjqtN
	/Wwbfe21h2G9v0BOi6tNTrTv5+qA8oE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-KV8Zj2A9Nwq_Lq1iMD71nw-1; Thu, 29 Jan 2026 11:26:30 -0500
X-MC-Unique: KV8Zj2A9Nwq_Lq1iMD71nw-1
X-Mimecast-MFC-AGG-ID: KV8Zj2A9Nwq_Lq1iMD71nw_1769703989
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-435ab907109so611650f8f.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 29 Jan 2026 08:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769703989; x=1770308789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smuqHJFpRj+j2xYajnlqs/VsDNhOWtBkZ67qclJoWoE=;
        b=tt5Hwxuf/Gz6jPBpB1oZTPIdPAEqbIX9tWpTreIxgQrcTnflr2F/kio+lbgfNNygbT
         T/XOkAFt1uILppz545X9qgcodYnZlUm9u8lqeAbMyy34kS5VeyKgZirM0cTKvlMrSbaa
         Xbij0PKIQ7e14KLQBqf6tz4EibWww327GDvNG1/+oBozSpgS83/6Eb5VuVQREgBB+L+3
         GoO3T6sHG1ygFNRLnvU+Xmo3LHJCLW8uIzY7qe9k36kdXVdYPZ5hy7NxNkydA4fMKrnu
         7Pz471oueILSBteDz5XYKYvW8oDQdnCnKwx+gpQa3asHZGqFKfgxWBKuuwJxWqehAvfe
         MzkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP9bBfiwUr+4Bs3hk0D7/SAuDbN6xMSk1/R5H6gS7jzpqlPoM/S5kC7QId3I+RNrjiNjRJ+EBs4EkQkw9PwxA/w0AIPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKwI4ZeCPLCNoy6H5aIq0BdOtmigx+L4awYuXd9qrjUiwQoTs3
	JOdZzhR5WQYdGLF4GKAGM0w4z3rachBE3lCcSdarjnnqifeoghvOYsWfEPfOj/YAxfttPzasXWd
	fuWNytxe5zpnnwMrlNdL56gbdJ7Qvn4QjpicTUyf5u45XZ7GnE16lUGGzJqMSHvTF8oJ3cu9hRc
	d7
X-Gm-Gg: AZuq6aIz0InL/KkLDv9kgTL+XHRir+Cgsk1UPeAtAv0BPNzxRZHTCQtik+m3LBn7W4j
	3p17VKhaz1v5tNbIzlh2uYbETUkCgfOH8wXE+HY1Nucxnl7R0TfnCxFF79D2fS8RZ0TsPlCvnEy
	2icZzR7PLcf+PUC21LWh3G/09CtOfEUuHwwzhX6VYOZJHMRdp6FZV+Axm/cJHA3ZrJfnJcXY6Is
	VCkjCXh6Nv+z/qrnCHoDkcAa9FCHxVQc+nIWcK6qY+LLvsgLIFBawsH8Yul5zC4NW3am60JVZQB
	gWbl1Ykli9qsyHj0sU7fX39HZkjZQZURnC8crU+SItuFg4528FuRuBDaiwaU0PzMMM/PrEnno4R
	/RYMPf/3VxU91
X-Received: by 2002:a05:6000:18a7:b0:430:fdc8:8be3 with SMTP id ffacd0b85a97d-435f3aafd25mr246939f8f.29.1769703988848;
        Thu, 29 Jan 2026 08:26:28 -0800 (PST)
X-Received: by 2002:a05:6000:18a7:b0:430:fdc8:8be3 with SMTP id ffacd0b85a97d-435f3aafd25mr246869f8f.29.1769703988173;
        Thu, 29 Jan 2026 08:26:28 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee562sm15878577f8f.18.2026.01.29.08.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 08:26:27 -0800 (PST)
Message-ID: <9c17e0f5-0a07-4800-9356-0ee9445e3922@redhat.com>
Date: Thu, 29 Jan 2026 17:26:25 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 03/15] quic: provide common utilities and data
 structures
To: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>,
 quic@lists.linux.dev
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>,
 Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>,
 linux-cifs@vger.kernel.org, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Paulo Alcantara <pc@manguebit.com>,
 Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev,
 Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1769439073.git.lucien.xin@gmail.com>
 <1cbfbd45fda48c82f629b000fc102ee011515e12.1769439073.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <1cbfbd45fda48c82f629b000fc102ee011515e12.1769439073.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G7605oJXIV_IgKjgsvDfoA-pVnkvJwjbo0OBjPw9NlU_1769703989
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/26/26 3:51 PM, Xin Long wrote:
> +struct quic_skb_cb {
> +	/* Callback and temporary context when encryption/decryption completes in async mode */
> +	void (*crypto_done)(struct sk_buff *skb, int err);
> +	void *crypto_ctx;
> +	union {
> +		struct sk_buff *last;	/* Last packet in bundle on TX */
> +		u64 time;		/* Arrival timestamp in UDP tunnel on RX */
> +	};
> +	s64 number;		/* Parsed packet number, or the largest previously seen */
> +	u32 seqno;		/* Dest connection ID number on RX */
> +	u16 errcode;		/* Error code if encryption/decryption fails */
> +	u16 length;		/* Payload length + packet number length */
> +
> +	u16 number_offset;	/* Offset of packet number field */
> +	u8 number_len;		/* Length of the packet number field */
> +	u8 level;		/* Encryption level: Initial, Handshake, App, or Early */
> +
> +	u8 key_update:1;	/* Key update triggered by this packet */
> +	u8 key_phase:1;		/* Key phase used (0 or 1) */
> +	u8 backlog:1;		/* Enqueued into backlog list */
> +	u8 resume:1;		/* Crypto already processed (encrypted or decrypted) */
> +	u8 path:1;		/* Packet arrived from a new or migrating path */
> +	u8 ecn:2;		/* ECN marking used on TX */
> +};
> +
> +#define QUIC_SKB_CB(skb)	((struct quic_skb_cb *)&((skb)->cb[0]))

Please add a build time check on quic_skb_cb size.

Thanks,

Paolo


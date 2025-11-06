Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F11308F35
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  6 Nov 2025 08:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762419128; cv=none; b=Qx24XPXp/P7c6HE8pqsOYcId6GhVmKqH29JAPsO2uer31kNYaYwcjKZqy5tVizea11hmLyigzwv1jkb6OvIRvtNYePq8P4uPxIflrJzhG6TA3CdzmC/tgMHHEUtX9iROYtzZn70NOlvH4P729k7/cBFImMyybLMkanJTzqFcEBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762419128; c=relaxed/simple;
	bh=l2uWDhEaQy0Z5iNX0dnyrT6a21b6LKnpGMNZZDcdtwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQdmgSN4vvvnT9rQ8einWR5fZ/l4SpbQJFUQ6hRraTI/dnJ/M88knJfpBsEU6Ty7ir/caRecqH1pxtrF9srEsMv1i4AgR9SaAg5c4u2K3w4tfWK1D6YSMABXOroUgc4RLYt9liOiqEzFS2NUAqGeIA1xTgiiMryRoZ9d2eG8rVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VuHdrHIx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VuHdrHIx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762419125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8NanxbbpkNDlbUyOTW56q78Ac+UJfat3j75mYZLY0ZE=;
	b=VuHdrHIxZR/7cVGvErg9gko6xtUAxlEcQXNU3EmG/smPG+6alvwPrXtQ70WgEH8infLl13
	K01nQzPm+38vq7QoctFoGwFOlNINoI3zDBTR/H6VyCMhsOGsnLDcV1Gkvy89X3gzEwOxQF
	P/smIMDkT0Bc4wfjjwcFd3cDigYK4Mk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-nvyVasfMPsydVe9GNUoH_w-1; Thu, 06 Nov 2025 03:52:04 -0500
X-MC-Unique: nvyVasfMPsydVe9GNUoH_w-1
X-Mimecast-MFC-AGG-ID: nvyVasfMPsydVe9GNUoH_w_1762419124
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-477632ce314so2987395e9.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 06 Nov 2025 00:52:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762419123; x=1763023923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8NanxbbpkNDlbUyOTW56q78Ac+UJfat3j75mYZLY0ZE=;
        b=UVtjxW+I7GtVGtx+za+RgFAlEysiEny+4gTBJsM/p6pdryBJo4ZtEncJlw++azdz3Q
         snEhoowK0yPFTbaDx835bnQwCtslttkFe8PDDAR/GfHAv0XB68fghyI3+ES27NZYNie4
         p21+hJ3JeRRZd1IbOrFSVIJRrB4uBIuqqecQ5v/F97RW0KFbGrwzee44KsFVutw4pcnz
         GxQyzMnZhsnNEK4zlEte/E7PL0EvmYvn3NpAJ1ZfmPNaQVgLOVgs6Y2p8sNI6sfHPg1e
         KQxfxKertHz1P/ErSBB+IVHE5WTiuGx36jrSaKhC0MdkbtB/wesqnMwnM+VtLPfLXqFu
         URLA==
X-Forwarded-Encrypted: i=1; AJvYcCXQqCOhfyE9CGLbZXcxK6FsBboVcq8WIlGCGP3POXf0ldVXLBOHcomaZuhf0ygXTB5BRr8xyfXPQb1rel96smFRq5NPNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwS8lyIyvOCMKZ0r5ywb0Q6HT1cKBxy5k+IehSULiyt94U5VWBo
	IUt5z4fhiCBmb8nTVndKH4Ten3TLwCZPDAVITcJ5oNkgeFqGgW0wff/r7qvcAAuKxeZlxNrwDaL
	WKXwderv+I10D3VWEnXDhhJranFNeVMUAxBm+hN1sNfZWqADwSZG0BTh8qLuhqHIkZ+jsWunxtC
	Wo
X-Gm-Gg: ASbGnctossYTmrGHs749vesCVyem91JF4HAl2j0b8/cBjPbIeIp7Tn2f9VWasc4oftY
	MWf78KzyqRagx4+bBC+qwwYy7ZsIdqqgjx+wL477kUyeiWEC8TQnd+55DX/0JghuUgdj+gBJZTs
	WfDDgEjpUHhbToDU1OlBvzVLXZfk37oZVpH2zAoYOWQaejGZHzktzKieHekb5p3lo0vHiGsMBRl
	jc7MlVOWbNdls2MvPLAwm01voJ3iGUdDzxeyrqv9Jc4U2IJoZHnnYKrdZmohjs1UJZC70un8lKY
	eW3U8vuHOeu4UKLINASeHEPxl+FzUD5guk8IMObSuJraijZgKZ9CPEN+JGJOMZZ35JfHbJUsd/9
	v7Q==
X-Received: by 2002:a05:600c:3487:b0:471:115e:9605 with SMTP id 5b1f17b1804b1-4775ce3d8a1mr64704975e9.35.1762419123475;
        Thu, 06 Nov 2025 00:52:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPovKIk02f8ddjHUYyEZ+Oj38N6pOCkSx8ThIFm92RoMszw4bRUVHCaXxRkNiaePAEdRptZw==
X-Received: by 2002:a05:600c:3487:b0:471:115e:9605 with SMTP id 5b1f17b1804b1-4775ce3d8a1mr64704515e9.35.1762419123036;
        Thu, 06 Nov 2025 00:52:03 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb410ffcsm3542471f8f.15.2025.11.06.00.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 00:52:02 -0800 (PST)
Message-ID: <24cee5fb-1710-4d1e-a1af-793fb99fc9c7@redhat.com>
Date: Thu, 6 Nov 2025 09:51:59 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 06/15] quic: add stream management
To: Xin Long <lucien.xin@gmail.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev,
 davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>,
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
References: <cover.1761748557.git.lucien.xin@gmail.com>
 <6b527b669fe05f9743e37d9f584f7cd492a7649b.1761748557.git.lucien.xin@gmail.com>
 <ad38f56b-5c53-408e-abcc-4b061c2097a3@redhat.com>
 <CADvbK_c2gUNyDNYfgVrQ+Cm9rL6P_n+s0LJsrAPz0VK9FDDxyg@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CADvbK_c2gUNyDNYfgVrQ+Cm9rL6P_n+s0LJsrAPz0VK9FDDxyg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -rloy93rDz4TzmFzGDNNpXli09wTLJMmeNW7XERD9AM_1762419124
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/6/25 2:27 AM, Xin Long wrote:
> On Tue, Nov 4, 2025 at 6:05 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>
>> On 10/29/25 3:35 PM, Xin Long wrote:
>> +/* Create and register new streams for sending. */
>>> +static struct quic_stream *quic_stream_send_create(struct quic_stream_table *streams,
>>> +                                                s64 max_stream_id, u8 is_serv)
>>> +{
>>> +     struct quic_stream *stream = NULL;
>>> +     s64 stream_id;
>>> +
>>> +     stream_id = streams->send.next_bidi_stream_id;
>>> +     if (quic_stream_id_uni(max_stream_id))
>>> +             stream_id = streams->send.next_uni_stream_id;
>>> +
>>> +     /* rfc9000#section-2.1: A stream ID that is used out of order results in all streams
>>> +      * of that type with lower-numbered stream IDs also being opened.
>>> +      */
>>> +     while (stream_id <= max_stream_id) {
>>> +             stream = kzalloc(sizeof(*stream), GFP_KERNEL_ACCOUNT);
>>> +             if (!stream)
>>> +                     return NULL;
>>> +
>>> +             stream->id = stream_id;
>>> +             if (quic_stream_id_uni(stream_id)) {
>>> +                     stream->send.max_bytes = streams->send.max_stream_data_uni;
>>> +
>>> +                     if (streams->send.next_uni_stream_id < stream_id + QUIC_STREAM_ID_STEP)
>>> +                             streams->send.next_uni_stream_id = stream_id + QUIC_STREAM_ID_STEP;
>>
>> It's unclear to me the goal the above 2 statements. Dealing with id
>> wrap-arounds? If 'streams->send.next_uni_stream_id < stream_id +
>> QUIC_STREAM_ID_STEP' is not true the next quic_stream_send_create() will
>> reuse the same stream_id.
>>
>> I moving the above in a separate helper with some comments would help.
>>
> I will add a macro for this:
> 
> #define quic_stream_id_next_update(limits, type, id)    \
> do {                                                    \
>         if ((limits)->next_##type##_stream_id < (id) +
> QUIC_STREAM_ID_STEP)     \
>                 (limits)->next_##type##_stream_id = (id) +
> QUIC_STREAM_ID_STEP; \
>         (limits)->streams_##type++;
>          \
> } while (0)
> 
> So that we can use it to update both next_uni_stream_id and next_bidi_stream_id.

A function would be better tacking the next_id value as an argument.
More importantly please document the goal here which is still unclear to me.

>> The above 2 functions has a lot of code in common. I think you could
>> deduplicate it by:
>> - defining a named type for quic_stream_table.{send,recv}
>> - define a generic /() helper using an additonal
>> argument for the relevant table.{send,recv}
>> - replace the above 2 functions with a single invocation to such helper.
> This is a very smart idea!
> 
> It will dedup not only quic_stream_recv_create(), but also
> quic_stream_get_param() and quic_stream_set_param().
> 
> I will define a type named 'struct quic_stream_limits'.
> Note that, since we must pass 'bool send' to quic_stream_create() for
> setting the fields in a single 'stream' .
> 
>         if (quic_stream_id_uni(stream_id)) {
>                 if (send) {
>                         stream->send.max_bytes = limits->max_stream_data_uni;
>                 } else {
>                         stream->recv.max_bytes = limits->max_stream_data_uni;
>                         stream->recv.window = stream->recv.max_bytes;
>                 }
> 
> I'm planning not to pass additional argument of table.{send,recv},
> but do this in quic_stream_create():
>         struct quic_stream_limits *limits = &streams->send;
>         gfp_t gfp = GFP_KERNEL_ACCOUNT;
> 
>         if (!send) {
>                 limits = &streams->recv;
>                 gfp = GFP_ATOMIC | __GFP_ACCOUNT;
>         }
> 
>>
>> It looks like there are more de-dup opportunity below.
>>
> Yes, the difference is only the variable name _uni_ and _bidi_.
> I'm planning to de-dup them with macros like:
> 
> #define quic_stream_id_below_next(streams, type, id, send)        \
>     ((send) ? ((id) < (streams)->send.next_##type##_stream_id) :    \
>           ((id) < (streams)->recv.next_##type##_stream_id))
> 
> /* Check if a send or receive stream ID is already closed. */
> static bool quic_stream_id_closed(struct quic_stream_table *streams,
> s64 stream_id, bool send)
> {
>     if (quic_stream_id_uni(stream_id))
>         return quic_stream_id_below_next(streams, uni, stream_id, send);
>     return quic_stream_id_below_next(streams, bidi, stream_id, send);
> }
> 
> #define quic_stream_id_above_max(streams, type, id)            \
>     (((id) > (streams)->send.max_##type##_stream_id) ? true :    \
>         (quic_stream_id_to_streams((id) -
> (streams)->send.next_##type##_stream_id) +    \
>             (streams)->send.streams_##type >
> (streams)->send.max_streams_##type))

Uhmm... with "more de-dup opportunity below" I intended
quic_stream_get_param() and quic_stream_set_param(). I would refrain
from adding macros. I think the above idea ('struct quic_stream_limits')
would not need that?!?

/P


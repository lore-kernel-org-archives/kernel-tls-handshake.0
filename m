Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C1D2E5B1F
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  4 Nov 2025 12:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762258657; cv=none; b=H/EmCabUOGLL10q8+Pywicy/lOljZEWth7yssonGHlnBl2ZbOHlR3L5k8ORQoU9E9vDjZOrMP+GJ/WGcVd3ZdLz5xY1J0BqUYQa6YvPEixNUag5s1eAE9iiw6hQg9ZobFr4nlKeqQNlHwQmnboSfZafLCTAvEl6OO7BoJcnvJ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762258657; c=relaxed/simple;
	bh=P0QOjc+Y/i4SUjAz9hyI1Est9kQhNqP0MO2eaNzC2o0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kshevolZS65AUuFM5EUp4WEISfeWyiFAGqwxYYGfMgpGkLOACPEwcoPin7e90brBZ4DBdVcQtERk6UEXopweD+YTCHzd7nnnUtZdon6OUmtty9S8DUBZ8LMv3d0H+pyOL9e18bPDzKHc/Up1CQCBpTjGDfO2UsP8V75ntq8CIhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GQ+h4T5k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GQ+h4T5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762258654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SrVv52+Wup10TuV26Al3G9RFtHr2QH+o3/M+H4STBAA=;
	b=GQ+h4T5k54per9jxyJmDkoSGTzqV4M8fYj5p+eORfmMcHOZz8RCm48h1CUlP6QRao+XLtB
	8ErEdkSRStBAFjKrvZCpcCI1IXpxTMvyd+0U38cZ6UY6AD2gDLKlvDPyApZ1rcYAWhmjiX
	hj6QT0gfNxmmVjqqZrc618GfMI1Qtls=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-aJSq8cXTNfel6CNF-qIMuQ-1; Tue, 04 Nov 2025 07:17:31 -0500
X-MC-Unique: aJSq8cXTNfel6CNF-qIMuQ-1
X-Mimecast-MFC-AGG-ID: aJSq8cXTNfel6CNF-qIMuQ_1762258650
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-475de1afec6so19298945e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 04 Nov 2025 04:17:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762258650; x=1762863450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SrVv52+Wup10TuV26Al3G9RFtHr2QH+o3/M+H4STBAA=;
        b=mpNyYhZzjoQimGHIvE71yn56LPP8+KKhF0esQofm1hfHGxlmVHxaYzM03vfddJ5zTj
         RFUjtKaZkK/XxC7kROp4kfgldm1y6G6+CNX+RZWKap+q62nzPrZIRVvPGK1z3Nwp7gdZ
         y/ydgTNSrodxGKNjrnVYMs1CQpuxXcPdFLYC2xeYMZE6+whW7SImTENA24TiDhHbFJcy
         8bEjATjCMQgXharxoBx3bx1pnXIG1GjiR1M6rew/0D5my+jaKSpb7pAmyKRGDwxEablP
         oQ3PKr1iCkC7gfPoVW3dhGH4/EdjESD8ZDrjYnw3x1N1wXc8y++SyfYNeI7AqPaeQNkV
         RyXw==
X-Forwarded-Encrypted: i=1; AJvYcCWHYm45/l0W5Ps+Ud9C41CG5bzkp+MsJeD9Fj9jJsE9++T/XvxaymBae04da+8XuKo4dvS/9qA/U4ZIZAB/wkCCbkNoUA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUsrNsqx9MmEKq/2jrpy8LnkAOXTS31cLTZ/ZuPAKFMqZtxw+F
	P+2GVdySqZAXuUcKwK125AXxodUhB2kZTHTV/KATF8Sh+U9Jbr9FOV9mSnX9XJpNqfOWPj7CmNu
	489qWR/Yz+l+8JszgTN29EdkaxPIc4k4KaznXr6gyQipu8WmVHUqK4G1foI2oCJk8knV2jujDOy
	PB
X-Gm-Gg: ASbGncsYXGaYlUR6lKjuaO4PzHCX/wRgsdba7pbYOjKVlJbbyi9xHCAbzY09LszW/ll
	/OTNoI4ZWei9FrXbc6Iw8cb3GmcyWVa5n8AyFv1iYQBeW09aTTpx9qtvN8yauzbYvEkVFnBsrps
	fw5Qqs+hFSbUkNkzZanrhkUfKy3QL1Qjz2urxOtkAW/yNxy8I/LO+Wat/bbZgrw92i29Q2vm17S
	YavP9eiApUgptL74ztQn77R+tqWgVppyPakXtsQYhgx0e+G6wteOxNlqmivg8NMVon5oQVKCUoW
	1dUq/rxkSVt62FNMcO2XTcWOh34saiNX6cH8BfqRf2KsnpbtHSy39eh0QhIHb7m+JnWh0+9b+0P
	J30IMnTtJ9Zderm4fIk3Y/Y2en75W0l4obSnfLn0l92Nw
X-Received: by 2002:a05:6000:40de:b0:429:d290:22f9 with SMTP id ffacd0b85a97d-429dbcabe53mr2945315f8f.4.1762258650458;
        Tue, 04 Nov 2025 04:17:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElFwJq3LBE7DNZtfuVK0eheDgsp8L8ZPbTvbUgjo7k2WL6IDip2GsX5myepH9Q0/Tu9JOyzw==
X-Received: by 2002:a05:6000:40de:b0:429:d290:22f9 with SMTP id ffacd0b85a97d-429dbcabe53mr2945262f8f.4.1762258649949;
        Tue, 04 Nov 2025 04:17:29 -0800 (PST)
Received: from ?IPV6:2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6? ([2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1f5a7fsm4316521f8f.24.2025.11.04.04.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 04:17:29 -0800 (PST)
Message-ID: <635b0dad-98bf-41e9-b7b6-1f28da48fc00@redhat.com>
Date: Tue, 4 Nov 2025 13:17:26 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 10/15] quic: add packet number space
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
 Benjamin Coddington <bcodding@redhat.com>, Steve Dickson
 <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1761748557.git.lucien.xin@gmail.com>
 <a1df61880c9f424b49b2d4933e0d6ea0bf6da268.1761748557.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <a1df61880c9f424b49b2d4933e0d6ea0bf6da268.1761748557.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1ckbk3pUl0ACDQdR6sId1CAtJoQIA7616JiezEmgkCQ_1762258650
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/25 3:35 PM, Xin Long wrote:
> +struct quic_pnspace {
> +	/* ECN counters indexed by direction (TX/RX) and ECN codepoint (ECT1, ECT0, CE) */
> +	u64 ecn_count[QUIC_ECN_DIR_MAX][QUIC_ECN_MAX];
> +	unsigned long *pn_map;	/* Bit map tracking received packet numbers for ACK generation */
> +	u16 pn_map_len;		/* Length of the packet number bit map (in bits) */
> +	u8  need_sack:1;	/* Flag indicating a SACK frame should be sent for this space */
> +	u8  sack_path:1;	/* Path used for sending the SACK frame */
> +
> +	s64 last_max_pn_seen;	/* Highest packet number seen before pn_map advanced */
> +	u32 last_max_pn_time;	/* Timestamp when last_max_pn_seen was received */
> +	u32 max_time_limit;	/* Time threshold to trigger pn_map advancement on packet receipt */
> +	s64 min_pn_seen;	/* Smallest packet number received in this space */
> +	s64 max_pn_seen;	/* Largest packet number received in this space */
> +	u32 max_pn_time;	/* Time at which max_pn_seen was received */
> +	s64 base_pn;		/* Packet number corresponding to the start of the pn_map */
> +	u32 time;		/* Cached current time, or time accept a socket (listen socket) */

There are a few 32 bits holes above you could avoid reordering the fields.

Otherwise LGTM,

Acked-by: Paolo Abeni <pabeni@redhat.com>


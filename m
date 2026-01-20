Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403A84418DE
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Jan 2026 14:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768918417; cv=none; b=fADCTp/av/PocST2gMjghLZwikZGUPfIHiHAl/Gnq1RoEuYbfEP55BuXhs1cfSoRPDNHz9UoFc8h2W7Nzfx2X24AhRAfwdDYW/MJG4P+GS2Rk1fzs1ri59ubgyvX/Jr77JMMXWNq9/W9Xb9+UsDKLdVFGjFiXZmJLV16kwF1+mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768918417; c=relaxed/simple;
	bh=MTXAttGcmQV+gKT1VuxP3RbxteQV73dhqFSiu5vTsKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rD9gd/tpQ+e7c9YXR/ChnsUAkeBxmRfKusnfuwBK9BvuoJYIHHe6V0CGLqegkDpOqQ3rI2+Ia0AgU396W9H74tjFCzRNn4OoZP+L9Cbs60dKzgWLBrRuV1nEglcxxt7n2G4RQY06FlqNGx9X7OzSYmUynXIDOFrchI9bDpiY66Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XruGX3/I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XruGX3/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768918414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o4YIZav5bzJmQLAgwNywWVFJIuBH5AeoqXsTBWn1nZk=;
	b=XruGX3/I2vMhjOFPIFSP/pUuYEecIhXX5v/Eu2/82sTp5pN3QeRzoNOXeo1n6Y/CwmWxWT
	5DUQUBdHb31CB0YQkNo3q08/zCGRIEnnp1TSpKX7kr443nRo2AcKOxJZSG6AckjJ6Uv48I
	eGc/+LEgD8iGeHQmoC1WV9ooF39wFO8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-_clhLP14N5aAlpkA0G03Rg-1; Tue, 20 Jan 2026 09:13:31 -0500
X-MC-Unique: _clhLP14N5aAlpkA0G03Rg-1
X-Mimecast-MFC-AGG-ID: _clhLP14N5aAlpkA0G03Rg_1768918410
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-430fdaba167so3715628f8f.3
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Jan 2026 06:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768918410; x=1769523210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4YIZav5bzJmQLAgwNywWVFJIuBH5AeoqXsTBWn1nZk=;
        b=QtM9aHN92hx6XMjlesC5j5iYUSXrihKMvCbJwc6ziM8N+Yz1JjlFqT+qEmw4U64p4z
         sbpEyDmft5H4W1Grb0qaNzXVJ8HbTXeY3FElPfw59zfiZgcG2UqXElRUx61JawgMhaiy
         n1gftt/YmQ6Z50rfo6/DqYs8GXvScTbZFREzabkS/C+SAU7gLjneXTQ1c7PIFIIhW1ng
         ygx1rYBMgx5NUPP7KDQRRXAGsA3XX+87TkeQXALAELCpQLALpLf8wM7VreH95LdhafZH
         m9prWUfwl5lzJirK9uNXApNIyfPKBnkEsG0bilfbBf0HymmDcoqYhxTjTzjV0H0h/Iax
         M0wg==
X-Forwarded-Encrypted: i=1; AJvYcCVV/bNFpZrgVmSj57JcYlLC+QEem5Aqwy5LefWi38SLg87jL7PIjOqgYl34ZTk51Q2hPZgh3SZtAhSTBVRYwzD263AUEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5Kqc6fYwOwsZkmXRVdMEEb2qCnu8gL1XCKjMp3KNhOWmPmvhA
	5WSaSs1lusbONBWPh93XBFx+rfR5uM4DAZjFSheAqSdAAxTuBxjs9JYXxaxScm8oC7K9XyMecYz
	WKSogj/Geqh9KrtGZ0eh7ssZoiDwwYn6kEk7v8tdUZv65B4kIxsrHYzXsYPE6aJZCsSonEm53K+
	AE
X-Gm-Gg: AZuq6aJiZ3Gm9vEmYDahwHsmghADclaTWtPX6qnUduSM+tKftcde58XHgbSwG654qZ1
	wmeTp4d9qKOB5f1ry7oriPNvg4klIlIDyQZOKFZI6bUI9n46LIF3qpYBysIffmgLUYbs7z5nIue
	g5gOoiRP5cCnEnePDQ0JXeJ5g29zmxpmclWK+Nxul4it8MnwS38ww4Bf35oJG9wAfuYgFPK7SSy
	i8M6zSgBrnlHA1BqGZT/7t1UmqJw/v2SpONMxNF5zrYM5OqsFgSWTP7pEOvZ3fnNqImoNQ14f5P
	wA20P/oyUhAGPALDfqkDkns4dCJdtCgUoFUceq4Y+yZJI99xXQH8MajK7pPQKyXHsEaTOP5kG4i
	jgyciwppxap+x
X-Received: by 2002:a5d:5887:0:b0:432:8504:8d5b with SMTP id ffacd0b85a97d-43569bcb816mr18237028f8f.50.1768918409938;
        Tue, 20 Jan 2026 06:13:29 -0800 (PST)
X-Received: by 2002:a5d:5887:0:b0:432:8504:8d5b with SMTP id ffacd0b85a97d-43569bcb816mr18236980f8f.50.1768918409485;
        Tue, 20 Jan 2026 06:13:29 -0800 (PST)
Received: from [192.168.88.32] ([150.228.93.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43596b62700sm581337f8f.42.2026.01.20.06.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 06:13:28 -0800 (PST)
Message-ID: <71705484-46fc-469f-9357-07a076ee0e73@redhat.com>
Date: Tue, 20 Jan 2026 15:13:22 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 08/16] quic: add path management
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
References: <cover.1768489876.git.lucien.xin@gmail.com>
 <3771dfc211626a9f0c603c90113e38f325ceb456.1768489876.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <3771dfc211626a9f0c603c90113e38f325ceb456.1768489876.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uTAmkuiMsyy9zfdQCbMh7t9PACtfzGJMN40k2jPdiMU_1768918410
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/15/26 4:11 PM, Xin Long wrote:
> @@ -0,0 +1,524 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* QUIC kernel implementation
> + * (C) Copyright Red Hat Corp. 2023
> + *
> + * This file is part of the QUIC kernel implementation
> + *
> + * Initialization/cleanup for QUIC protocol support.
> + *
> + * Written or modified by:
> + *    Xin Long <lucien.xin@gmail.com>
> + */
> +
> +#include <net/udp_tunnel.h>
> +#include <linux/quic.h>
> +
> +#include "common.h"
> +#include "family.h"
> +#include "path.h"
> +
> +static int (*quic_path_rcv)(struct sock *sk, struct sk_buff *skb, u8 err);

It's unclear why an indirect call is needed here. At least some
explanation is needed in the commit message, possibly you could call
directly a static function.

> +
> +static int quic_udp_rcv(struct sock *sk, struct sk_buff *skb)
> +{
> +	memset(skb->cb, 0, sizeof(skb->cb));
> +	QUIC_SKB_CB(skb)->seqno = -1;
> +	QUIC_SKB_CB(skb)->time = quic_ktime_get_us();
> +
> +	skb_pull(skb, sizeof(struct udphdr));
> +	skb_dst_force(skb);
> +	quic_path_rcv(sk, skb, 0);
> +	return 0;

Why not:
	return quic_path_rcv(sk, skb, 0);
?

> +static struct quic_udp_sock *quic_udp_sock_create(struct sock *sk, union quic_addr *a)
> +{
> +	struct udp_tunnel_sock_cfg tuncfg = {};
> +	struct udp_port_cfg udp_conf = {};
> +	struct net *net = sock_net(sk);
> +	struct quic_uhash_head *head;
> +	struct quic_udp_sock *us;
> +	struct socket *sock;
> +
> +	us = kzalloc(sizeof(*us), GFP_KERNEL);
> +	if (!us)
> +		return NULL;
> +
> +	quic_udp_conf_init(sk, &udp_conf, a);
> +	if (udp_sock_create(net, &udp_conf, &sock)) {
> +		pr_debug("%s: failed to create udp sock\n", __func__);
> +		kfree(us);
> +		return NULL;
> +	}
> +
> +	tuncfg.encap_type = 1;
> +	tuncfg.encap_rcv = quic_udp_rcv;
> +	tuncfg.encap_err_lookup = quic_udp_err;
> +	setup_udp_tunnel_sock(net, sock, &tuncfg);
> +
> +	refcount_set(&us->refcnt, 1);
> +	us->sk = sock->sk;
> +	memcpy(&us->addr, a, sizeof(*a));
> +	us->bind_ifindex = sk->sk_bound_dev_if;
> +
> +	head = quic_udp_sock_head(net, ntohs(a->v4.sin_port));
> +	hlist_add_head(&us->node, &head->head);
> +	INIT_WORK(&us->work, quic_udp_sock_put_work);
> +
> +	return us;
> +}
> +
> +static bool quic_udp_sock_get(struct quic_udp_sock *us)
> +{
> +	return refcount_inc_not_zero(&us->refcnt);
> +}
> +
> +static void quic_udp_sock_put(struct quic_udp_sock *us)
> +{
> +	if (refcount_dec_and_test(&us->refcnt))
> +		queue_work(quic_wq, &us->work);

Why using a workqueue here? AFAICS all the caller are in process
context. Is that to break a possible deadlock due to nested mutex?
Likely a comment on the refcount/locking scheme would help.

/P


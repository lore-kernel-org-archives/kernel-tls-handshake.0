Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C395280A51
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 21 Aug 2025 14:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755785933; cv=none; b=gtBwqQFy+1t8KZl0h8ZGXib9DaVQizDmdqShu0U+XaAeDXj1UDGc6r49d5NPN8CN19j/HVsJAapw2FAvQdx5AbHHoUZ7VKhCzlH0YsEexJGSZxo6IzCV8tgy3PzVTYggeocxTDAbR1k6EtnH6TckWLReq6ePVWfKpeKWxgdL3Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755785933; c=relaxed/simple;
	bh=6fYOKYDWtJXk/nb3SNwoXg8QDC7pMUsBU5vYe0/EFT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/Iwzh0QeHtkR3AVu6zXHHPkwwmHIRgxvpmSVzQteglHE3GA77ICB/iYhpZSmFagFZuu1OL7l/4oJHnS182iH+NuN0QK+xyzDEm0Ts/o4SU1CIZeVZ80GVeBO16R4qKULcKQu78Eew8tyQOJc4PRnhj8GmfhUOneC4d8SvENDlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e/Y0e3aP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e/Y0e3aP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755785930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d2W2WJn9o2ImqIVXfkc9IKgb9T6LWDj6xaBh01W7LZY=;
	b=e/Y0e3aPQSjLV7o2CzG17CzH6sC0Xs1LtDnhy6DfECmzTvcsng6Id5mya0OH8vhr0zHn6X
	MoH7q9FN8/cFDD8GEjdgV/PDbJmwSeBjwkyoZluEHcrxmQ1GryjfSF9LEQ3jlSZR1bdu4j
	3RDtkIy+MrvSqHU2ekyAiuC7lVmD9ZI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-sUt013MAPbaO_ZAeICL7WQ-1; Thu, 21 Aug 2025 10:18:47 -0400
X-MC-Unique: sUt013MAPbaO_ZAeICL7WQ-1
X-Mimecast-MFC-AGG-ID: sUt013MAPbaO_ZAeICL7WQ_1755785926
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45a1b10418aso6106415e9.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 21 Aug 2025 07:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755785926; x=1756390726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2W2WJn9o2ImqIVXfkc9IKgb9T6LWDj6xaBh01W7LZY=;
        b=fZeSwMUV1dtix7XFeYvB/3TuFz/MduAQSob4Eseho8t2ql2emHCxQFgjMpVV/HDlDh
         ebA2OnGyR1IPWmE9GdlbfGMgceYFwuI1obCUViyhakTLoSXD0fj2jOFoHME92sT1GUL1
         DMb1efm0mO+V43EjRpsVt0hgeotBetq996vnq2umAlqS40B1Dt8+jlsR3EtyYDI90vYh
         Lzxsuo/1f3xXTDMgEFLCUoxYhXHZ5wRO6RgR8iezS29AYM0mgJlAn4P/xqBtEXHzgOBH
         eKQ7CzJj2vDaVeek+80XRTCe5gK7u6fRwRkS3SY13oKY6AaaKqgPDXMRBzkoFhT6uk/+
         RJdw==
X-Forwarded-Encrypted: i=1; AJvYcCWXc9u1/J8qDKGHc4iVnEYVY6eFeoGuTuDBa/dk7C9yF3ZwwXYSmv2MfZJO7ASdgDIH7zuhMv8KWaalFYY9p0JtGrmavw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzzJmp1YolWDDhZ3WC9n0Z8Pd6cWqHksRNe+Odwoj1mighgt6w0
	sHn8sNoqsLvT9Lphht2Y6d+fIi6iUN+j8xmacu1Civz38kf5I7FPu6n2hUpbCpByU4SEuFd00O8
	6Q+cya7DeTlpjp/uX0mkc9Yt2HSRh6BoiHEYNF8ZiPZDEB0rW6y61WsgATGlvZePrtrCetl/wUJ
	CT
X-Gm-Gg: ASbGncuUkv872l8/GySiD4+gO8oCxt6Q9m15nmcwn9++r80iRoIqmgRu7OAFgxJc3ZS
	j463dIhnl6Is5EEdjHh0tC+4zVjKi87FXFgwniVC9tQv2chKh2plSZbXDdxhnHfSAxfI5ykcitD
	CYeOBuEL8oIG7R8C6tmbTmwdnaxDz8akYL3EuwHSjUImKFsmahloNeP8KLv86f5Vj0WEagFBLqX
	HNcmL96fiswmY0zW0/bMNkSsNXOjno63nDNSJTNlMW4UAdagmVY3sHae97LUdH2hCtpfbfKhOCm
	kRDEaAMry5k+I/EOaJWfosrE6XGSOAzHPpK3j+3bJkiI+QH4gSjlCrSSyalxNuSQaYoxaqJ2Svs
	HzODbAc4Vspw=
X-Received: by 2002:a05:600c:3147:b0:458:b4a6:19e9 with SMTP id 5b1f17b1804b1-45b4d7ea0e6mr21934965e9.13.1755785925661;
        Thu, 21 Aug 2025 07:18:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLwKJXKyCXn0Ep8Pg/fTs01OWaVxGdAUn91+tk/jR7dvj0U5zOA0d/juE648QGc7ZwVXZL8Q==
X-Received: by 2002:a05:600c:3147:b0:458:b4a6:19e9 with SMTP id 5b1f17b1804b1-45b4d7ea0e6mr21934385e9.13.1755785925123;
        Thu, 21 Aug 2025 07:18:45 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788b39sm11839502f8f.47.2025.08.21.07.18.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 07:18:44 -0700 (PDT)
Message-ID: <a45ba272-685f-41dd-8582-6bbc5bc086bb@redhat.com>
Date: Thu, 21 Aug 2025 16:18:42 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 08/15] quic: add path management
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
 <507c85525538f0dc64e536f7ccdd7862b542a227.1755525878.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <507c85525538f0dc64e536f7ccdd7862b542a227.1755525878.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jl6abFdH1AHZbG-fZbwnfn_0XmH6KjDow3LjKm-Z6Ko_1755785926
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/18/25 4:04 PM, Xin Long wrote:
> +/* Lookup a quic_udp_sock in the global hash table. If not found, creates and returns a new one
> + * associated with the given kernel socket.
> + */
> +static struct quic_udp_sock *quic_udp_sock_lookup(struct sock *sk, union quic_addr *a, u16 port)
> +{
> +	struct net *net = sock_net(sk);
> +	struct quic_hash_head *head;
> +	struct quic_udp_sock *us;
> +
> +	head = quic_udp_sock_head(net, port);
> +	hlist_for_each_entry(us, &head->head, node) {
> +		if (net != sock_net(us->sk))
> +			continue;
> +		if (a) {
> +			if (quic_cmp_sk_addr(us->sk, &us->addr, a) &&
> +			    (!us->bind_ifindex || !sk->sk_bound_dev_if ||
> +			     us->bind_ifindex == sk->sk_bound_dev_if))
> +				return us;
> +			continue;
> +		}
> +		if (ntohs(us->addr.v4.sin_port) == port)
> +			return us;
> +	}
> +	return NULL;
> +}

The function description does not match the actual function implementation.

> +
> +/* Binds a QUIC path to a local port and sets up a UDP socket. */
> +int quic_path_bind(struct sock *sk, struct quic_path_group *paths, u8 path)
> +{
> +	union quic_addr *a = quic_path_saddr(paths, path);
> +	int rover, low, high, remaining;
> +	struct net *net = sock_net(sk);
> +	struct quic_hash_head *head;
> +	struct quic_udp_sock *us;
> +	u16 port;
> +
> +	port = ntohs(a->v4.sin_port);
> +	if (port) {
> +		head = quic_udp_sock_head(net, port);
> +		mutex_lock(&head->m_lock);
> +		us = quic_udp_sock_lookup(sk, a, port);
> +		if (!quic_udp_sock_get(us)) {
> +			us = quic_udp_sock_create(sk, a);
> +			if (!us) {
> +				mutex_unlock(&head->m_lock);
> +				return -EINVAL;
> +			}
> +		}
> +		mutex_unlock(&head->m_lock);
> +
> +		quic_udp_sock_put(paths->path[path].udp_sk);
> +		paths->path[path].udp_sk = us;
> +		return 0;
> +	}
> +
> +	inet_get_local_port_range(net, &low, &high);

you could/should use inet_sk_get_local_port_range().

/P


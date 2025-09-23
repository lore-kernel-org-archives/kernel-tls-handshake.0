Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6082C21EA
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Sep 2025 11:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758627022; cv=none; b=mQvkGZxm82C+AKtVPFdw9pyN0RIUwO/vAqIMys+0nICwJ+xd1OtBIxBIDONhUV9PJV4Je8sZ6utcEDR3+ogp71fq7J1Wk/ebVZAoRRwo95nqcCgfvpLbFsCNguATAyiiF/C6H/9FJ7MjZT6ijb0SgXmWASC89fT5TkurMobgHC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758627022; c=relaxed/simple;
	bh=5DaMJrUxXR4YPrxwaj1kZ+kaUXa9/2KwhiV8u06N8Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uDCOHd4nejGWICVY0VCh9d/yT6G1Uz3CM/1eAB5YIOxb4zJoAiWxG/d0Su/vJE0ZMZ0pg5XlgMy7IXGMOWE+pDxVd5Eq/dScbRHXeJ23lLB2XO5iUAJ2IajTWzhBgp4HkWm689wIkLOsrOs2NDhE4v79bobiKXGxLj7DquqYIRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HwDqWQJ+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HwDqWQJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758627020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U8Cz9CK0YHBErPFvNkhud/4SiB4snJhC+aqfyzfqbM4=;
	b=HwDqWQJ+tnACLZXkkTdQ6UvTjMJlzQ9r69RJSfIlGrOW/Ky/U/mHwUj3PLdBQWqnR0Bitk
	pPNSr+IoKTyMkagghoBPALRt16SnVgJ4CTGSLN9HHxym6In9wYYAnkcNMghhvypHF2k4q0
	xjrxki4qW5AT2le+2ERQQ4LbSk9Dms0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-BhlnGjNVNEy8koIYJQBZOg-1; Tue, 23 Sep 2025 07:30:18 -0400
X-MC-Unique: BhlnGjNVNEy8koIYJQBZOg-1
X-Mimecast-MFC-AGG-ID: BhlnGjNVNEy8koIYJQBZOg_1758627017
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3ee13e43dd9so2303257f8f.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Sep 2025 04:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758627017; x=1759231817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8Cz9CK0YHBErPFvNkhud/4SiB4snJhC+aqfyzfqbM4=;
        b=qSgN8TQ/mRLh8rLUB0UWLShAoxx6AHf4n650ep6j3QfGLicCiKJYpou0ISpBJnJDGM
         NvvAZdT82IvhiOv/pRsI3uyxTw9jCtrESAgC9GfcdSAI+uPFCoovkd4amMioRzBnqq//
         MuWOj0q8aIPAJAOqbllibaTVKVpEFz26F2eMPTIhNPMNa/Hr3c1KETh71MxqjMRN0xsa
         /9bfxHFe17Mu2QZc30jO5RWL3qs0JX5sLePYHdDJbeBopbHdUy53fINvQtVzD55JNOmm
         89jx3w13qensBeFJ1plvyJ6q86yXV3KOp/Aljo9ohnvroekCP5QtzvSYtYYgYTEb2X5s
         WnEg==
X-Forwarded-Encrypted: i=1; AJvYcCXg9rAjup8rsrcBs4TP3j29ot52WuBCv6pCVMhlOEtBrFRRRwMFcSAHQOafCSpgGP5jLPLqOVgpx8L/brjqovVYra8Ksg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQjf52waipiUmB7GQwYQFbYhGcEXPNVH13NUBAPtP2wX+YKEGv
	XHLMFbfk5gMci5dQ/TXZfPijXF8xJj5SN11CFo5qJsEdPO6gOBB79+vIrrBB/6rz7aFu6TLAPtr
	1fxdIxvBK5VLpTZlllwynjgQx7OonJ0iyLz14/Y20r3tHIa6ad3dq01NgeKcJCp4HDjzKbhzsHz
	/b
X-Gm-Gg: ASbGncv7OHWXckxVAAonm7MqWG4YBgcdTsYWtAcSdCM+Ur7TDr+5uv1MNce/luRfh0j
	eWQE25IjVcaN0W0qJngv8z0e8qijiIBxHKId5CsICt3jhvojwokRJy/3yWIiV5GPVUponcfx2bA
	7Hiu/lSgjm/Wn2OWri+086OOnGtnfHAzE6vQqx7kVxAxyUVIg2Vu/0PtiFUN+8CwBPwKrC0Y9N6
	rA3vcp944dDpQBRFcDcrbOq7BNTCD4WG+XpXGj2XEaxviKj6C5rOo7WQqJSEYYKBTmnZCrhV703
	3yOMoqBF6HzcRboETbWavZcOwCwHmpYEdNmTksyNNAtVE1mkZJYGPf+PBFtqs/4BS7aKz0QEQZi
	7be4NhoQUjnAq
X-Received: by 2002:a05:6000:26cf:b0:3ea:2ed6:9e37 with SMTP id ffacd0b85a97d-405c523c43dmr1718609f8f.24.1758627017003;
        Tue, 23 Sep 2025 04:30:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOtd51dDWtvpstikmjH6brQOCnE92z+FWDlYxnWzVfcNycf+071kLC826JpBeONXc4C3B4Ew==
X-Received: by 2002:a05:6000:26cf:b0:3ea:2ed6:9e37 with SMTP id ffacd0b85a97d-405c523c43dmr1718576f8f.24.1758627016349;
        Tue, 23 Sep 2025 04:30:16 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e24835b32sm5932355e9.13.2025.09.23.04.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 04:30:15 -0700 (PDT)
Message-ID: <a3fa95a3-ce18-498a-a656-16581212c6cb@redhat.com>
Date: Tue, 23 Sep 2025 13:30:13 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 04/15] quic: provide family ops for address
 and protocol
To: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>,
 quic@lists.linux.dev
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
 Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1758234904.git.lucien.xin@gmail.com>
 <01dd8f3b9afc6c813f036924790997d3ed4bcf3d.1758234904.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <01dd8f3b9afc6c813f036924790997d3ed4bcf3d.1758234904.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wA8GO-H7crV7ifUUxYGF2LAFL2g8PvcJ6puBWRDFs9o_1758627017
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/19/25 12:34 AM, Xin Long wrote:
> +static int quic_v4_flow_route(struct sock *sk, union quic_addr *da, union quic_addr *sa,
> +			      struct flowi *fl)
> +{
> +	struct flowi4 *fl4;
> +	struct rtable *rt;
> +	struct flowi _fl;
> +
> +	if (__sk_dst_check(sk, 0))
> +		return 1;
> +
> +	fl4 = &_fl.u.ip4;
> +	memset(&_fl, 0x00, sizeof(_fl));
> +	fl4->saddr = sa->v4.sin_addr.s_addr;
> +	fl4->fl4_sport = sa->v4.sin_port;
> +	fl4->daddr = da->v4.sin_addr.s_addr;
> +	fl4->fl4_dport = da->v4.sin_port;
> +	fl4->flowi4_proto = IPPROTO_UDP;
> +	fl4->flowi4_oif = sk->sk_bound_dev_if;

Why you need a local variable? I think you could use the 'fl' argument
directly.

> +
> +	fl4->flowi4_scope = ip_sock_rt_scope(sk);
> +	fl4->flowi4_dscp = inet_sk_dscp(inet_sk(sk));
> +
> +	rt = ip_route_output_key(sock_net(sk), fl4);
> +	if (IS_ERR(rt))
> +		return PTR_ERR(rt);
> +
> +	if (!sa->v4.sin_family) {
> +		sa->v4.sin_family = AF_INET;
> +		sa->v4.sin_addr.s_addr = fl4->saddr;
> +	}
> +	sk_setup_caps(sk, &rt->dst);
> +	memcpy(fl, &_fl, sizeof(_fl));
> +	return 0;
> +}
> +
> +static int quic_v6_flow_route(struct sock *sk, union quic_addr *da, union quic_addr *sa,
> +			      struct flowi *fl)
> +{
> +	struct ipv6_pinfo *np = inet6_sk(sk);
> +	struct ip6_flowlabel *flowlabel;
> +	struct dst_entry *dst;
> +	struct flowi6 *fl6;
> +	struct flowi _fl;
> +
> +	if (__sk_dst_check(sk, np->dst_cookie))
> +		return 1;
> +
> +	fl6 = &_fl.u.ip6;
> +	memset(&_fl, 0x0, sizeof(_fl));
> +	fl6->saddr = sa->v6.sin6_addr;
> +	fl6->fl6_sport = sa->v6.sin6_port;
> +	fl6->daddr = da->v6.sin6_addr;
> +	fl6->fl6_dport = da->v6.sin6_port;
> +	fl6->flowi6_proto = IPPROTO_UDP;
> +	fl6->flowi6_oif = sk->sk_bound_dev_if;

Same here.

> +
> +	if (inet6_test_bit(SNDFLOW, sk)) {
> +		fl6->flowlabel = (da->v6.sin6_flowinfo & IPV6_FLOWINFO_MASK);
> +		if (fl6->flowlabel & IPV6_FLOWLABEL_MASK) {
> +			flowlabel = fl6_sock_lookup(sk, fl6->flowlabel);
> +			if (IS_ERR(flowlabel))
> +				return -EINVAL;
> +			fl6_sock_release(flowlabel);
> +		}
> +	}
> +
> +	dst = ip6_dst_lookup_flow(sock_net(sk), sk, fl6, NULL);
> +	if (IS_ERR(dst))
> +		return PTR_ERR(dst);
> +
> +	if (!sa->v6.sin6_family) {
> +		sa->v6.sin6_family = AF_INET6;
> +		sa->v6.sin6_addr = fl6->saddr;
> +	}
> +	ip6_dst_store(sk, dst, NULL, NULL);
> +	memcpy(fl, &_fl, sizeof(_fl));
> +	return 0;
> +}
> +
> +static void quic_v4_lower_xmit(struct sock *sk, struct sk_buff *skb, struct flowi *fl)
> +{
> +	struct quic_skb_cb *cb = QUIC_SKB_CB(skb);
> +	u8 tos = (inet_sk(sk)->tos | cb->ecn), ttl;
> +	struct flowi4 *fl4 = &fl->u.ip4;
> +	struct dst_entry *dst;
> +	__be16 df = 0;
> +
> +	pr_debug("%s: skb: %p, len: %d, num: %llu, %pI4:%d -> %pI4:%d\n", __func__,
> +		 skb, skb->len, cb->number, &fl4->saddr, ntohs(fl4->fl4_sport),
> +		 &fl4->daddr, ntohs(fl4->fl4_dport));
> +
> +	dst = sk_dst_get(sk);
> +	if (!dst) {
> +		kfree_skb(skb);
> +		return;
> +	}
> +	if (ip_dont_fragment(sk, dst) && !skb->ignore_df)
> +		df = htons(IP_DF);
> +
> +	ttl = (u8)ip4_dst_hoplimit(dst);
> +	udp_tunnel_xmit_skb((struct rtable *)dst, sk, skb, fl4->saddr, fl4->daddr,
> +			    tos, ttl, df, fl4->fl4_sport, fl4->fl4_dport, false, false, 0);
> +}
> +
> +static void quic_v6_lower_xmit(struct sock *sk, struct sk_buff *skb, struct flowi *fl)
> +{
> +	struct quic_skb_cb *cb = QUIC_SKB_CB(skb);
> +	u8 tc = (inet6_sk(sk)->tclass | cb->ecn), ttl;
> +	struct flowi6 *fl6 = &fl->u.ip6;
> +	struct dst_entry *dst;
> +	__be32 label;
> +
> +	pr_debug("%s: skb: %p, len: %d, num: %llu, %pI6c:%d -> %pI6c:%d\n", __func__,
> +		 skb, skb->len, cb->number, &fl6->saddr, ntohs(fl6->fl6_sport),
> +		 &fl6->daddr, ntohs(fl6->fl6_dport));
> +
> +	dst = sk_dst_get(sk);
> +	if (!dst) {
> +		kfree_skb(skb);
> +		return;
> +	}
> +
> +	ttl = (u8)ip6_dst_hoplimit(dst);
> +	label = ip6_make_flowlabel(sock_net(sk), skb, fl6->flowlabel, true, fl6);
> +	udp_tunnel6_xmit_skb(dst, sk, skb, NULL, &fl6->saddr, &fl6->daddr, tc,
> +			     ttl, label, fl6->fl6_sport, fl6->fl6_dport, false, 0);
> +}
> +
> +static void quic_v4_get_msg_addrs(struct sk_buff *skb, union quic_addr *da, union quic_addr *sa)
> +{
> +	struct udphdr *uh = quic_udphdr(skb);
> +
> +	sa->v4.sin_family = AF_INET;
> +	sa->v4.sin_port = uh->source;
> +	sa->v4.sin_addr.s_addr = ip_hdr(skb)->saddr;
> +
> +	da->v4.sin_family = AF_INET;
> +	da->v4.sin_port = uh->dest;
> +	da->v4.sin_addr.s_addr = ip_hdr(skb)->daddr;
> +}
> +
> +static void quic_v6_get_msg_addrs(struct sk_buff *skb, union quic_addr *da, union quic_addr *sa)
> +{
> +	struct udphdr *uh = quic_udphdr(skb);
> +
> +	sa->v6.sin6_family = AF_INET6;
> +	sa->v6.sin6_port = uh->source;
> +	sa->v6.sin6_addr = ipv6_hdr(skb)->saddr;
> +
> +	da->v6.sin6_family = AF_INET6;
> +	da->v6.sin6_port = uh->dest;
> +	da->v6.sin6_addr = ipv6_hdr(skb)->daddr;
> +}
> +
> +static int quic_v4_get_mtu_info(struct sk_buff *skb, u32 *info)
> +{
> +	struct icmphdr *hdr;
> +
> +	hdr = (struct icmphdr *)(skb_network_header(skb) - sizeof(struct icmphdr));
> +	if (hdr->type == ICMP_DEST_UNREACH && hdr->code == ICMP_FRAG_NEEDED) {
> +		*info = ntohs(hdr->un.frag.mtu);
> +		return 0;
> +	}
> +
> +	/* Defer other types' processing to UDP error handler. */
> +	return 1;
> +}
> +
> +static int quic_v6_get_mtu_info(struct sk_buff *skb, u32 *info)
> +{
> +	struct icmp6hdr *hdr;
> +
> +	hdr = (struct icmp6hdr *)(skb_network_header(skb) - sizeof(struct icmp6hdr));
> +	if (hdr->icmp6_type == ICMPV6_PKT_TOOBIG) {
> +		*info = ntohl(hdr->icmp6_mtu);
> +		return 0;
> +	}
> +
> +	/* Defer other types' processing to UDP error handler. */
> +	return 1;
> +}
> +
> +static u8 quic_v4_get_msg_ecn(struct sk_buff *skb)
> +{
> +	return (ip_hdr(skb)->tos & INET_ECN_MASK);
> +}
> +
> +static u8 quic_v6_get_msg_ecn(struct sk_buff *skb)
> +{
> +	return (ipv6_get_dsfield(ipv6_hdr(skb)) & INET_ECN_MASK);
> +}
> +
> +static int quic_v4_get_user_addr(struct sock *sk, union quic_addr *a, struct sockaddr *addr,
> +				 int addr_len)
> +{
> +	u32 len = sizeof(struct sockaddr_in);
> +
> +	if (addr_len < len || addr->sa_family != AF_INET)
> +		return 1;
> +	if (ipv4_is_multicast(quic_addr(addr)->v4.sin_addr.s_addr))
> +		return 1;
> +	memcpy(a, addr, len);
> +	return 0;
> +}
> +
> +static int quic_v6_get_user_addr(struct sock *sk, union quic_addr *a, struct sockaddr *addr,
> +				 int addr_len)
> +{
> +	u32 len = sizeof(struct sockaddr_in);
> +	int type;
> +
> +	if (addr_len < len)
> +		return 1;
> +
> +	if (addr->sa_family != AF_INET6) {
> +		if (ipv6_only_sock(sk))
> +			return 1;
> +		return quic_v4_get_user_addr(sk, a, addr, addr_len);
> +	}
> +
> +	len = sizeof(struct sockaddr_in6);
> +	if (addr_len < len)
> +		return 1;
> +	type = ipv6_addr_type(&quic_addr(addr)->v6.sin6_addr);
> +	if (type != IPV6_ADDR_ANY && !(type & IPV6_ADDR_UNICAST))
> +		return 1;
> +	memcpy(a, addr, len);
> +	return 0;
> +}
> +
> +static void quic_v4_get_pref_addr(struct sock *sk, union quic_addr *addr, u8 **pp, u32 *plen)
> +{
> +	u8 *p = *pp;
> +
> +	memcpy(&addr->v4.sin_addr, p, QUIC_ADDR4_LEN);
> +	p += QUIC_ADDR4_LEN;
> +	memcpy(&addr->v4.sin_port, p, QUIC_PORT_LEN);
> +	p += QUIC_PORT_LEN;
> +	addr->v4.sin_family = AF_INET;
> +	/* Skip over IPv6 address and port, not used for AF_INET sockets. */
> +	p += QUIC_ADDR6_LEN;
> +	p += QUIC_PORT_LEN;
> +
> +	if (!addr->v4.sin_port || quic_v4_is_any_addr(addr) ||
> +	    ipv4_is_multicast(addr->v4.sin_addr.s_addr))
> +		memset(addr, 0, sizeof(*addr));
> +	*plen -= (p - *pp);
> +	*pp = p;
> +}
> +
> +static void quic_v6_get_pref_addr(struct sock *sk, union quic_addr *addr, u8 **pp, u32 *plen)
> +{
> +	u8 *p = *pp;
> +	int type;
> +
> +	/* Skip over IPv4 address and port. */
> +	p += QUIC_ADDR4_LEN;
> +	p += QUIC_PORT_LEN;
> +	/* Try to use IPv6 address and port first. */
> +	memcpy(&addr->v6.sin6_addr, p, QUIC_ADDR6_LEN);
> +	p += QUIC_ADDR6_LEN;
> +	memcpy(&addr->v6.sin6_port, p, QUIC_PORT_LEN);
> +	p += QUIC_PORT_LEN;
> +	addr->v6.sin6_family = AF_INET6;
> +
> +	type = ipv6_addr_type(&addr->v6.sin6_addr);
> +	if (!addr->v6.sin6_port || !(type & IPV6_ADDR_UNICAST)) {
> +		memset(addr, 0, sizeof(*addr));
> +		if (ipv6_only_sock(sk))
> +			goto out;
> +		/* Fallback to IPv4 if IPv6 address is not usable. */
> +		return quic_v4_get_pref_addr(sk, addr, pp, plen);
> +	}
> +out:
> +	*plen -= (p - *pp);
> +	*pp = p;
> +}
> +
> +static void quic_v4_set_pref_addr(struct sock *sk, u8 *p, union quic_addr *addr)
> +{
> +	memcpy(p, &addr->v4.sin_addr, QUIC_ADDR4_LEN);
> +	p += QUIC_ADDR4_LEN;
> +	memcpy(p, &addr->v4.sin_port, QUIC_PORT_LEN);
> +	p += QUIC_PORT_LEN;
> +	memset(p, 0, QUIC_ADDR6_LEN);
> +	p += QUIC_ADDR6_LEN;
> +	memset(p, 0, QUIC_PORT_LEN);
> +}
> +
> +static void quic_v6_set_pref_addr(struct sock *sk, u8 *p, union quic_addr *addr)
> +{
> +	if (addr->sa.sa_family == AF_INET)
> +		return quic_v4_set_pref_addr(sk, p, addr);
> +
> +	memset(p, 0, QUIC_ADDR4_LEN);
> +	p += QUIC_ADDR4_LEN;
> +	memset(p, 0, QUIC_PORT_LEN);
> +	p += QUIC_PORT_LEN;
> +	memcpy(p, &addr->v6.sin6_addr, QUIC_ADDR6_LEN);
> +	p += QUIC_ADDR6_LEN;
> +	memcpy(p, &addr->v6.sin6_port, QUIC_PORT_LEN);
> +}
> +
> +static bool quic_v4_cmp_sk_addr(struct sock *sk, union quic_addr *a, union quic_addr *addr)
> +{
> +	if (a->v4.sin_port != addr->v4.sin_port)
> +		return false;
> +	if (a->v4.sin_family != addr->v4.sin_family)
> +		return false;
> +	if (a->v4.sin_addr.s_addr == htonl(INADDR_ANY) ||
> +	    addr->v4.sin_addr.s_addr == htonl(INADDR_ANY))
> +		return true;
> +	return a->v4.sin_addr.s_addr == addr->v4.sin_addr.s_addr;
> +}
> +
> +static bool quic_v6_cmp_sk_addr(struct sock *sk, union quic_addr *a, union quic_addr *addr)
> +{
> +	if (a->v4.sin_port != addr->v4.sin_port)
> +		return false;
> +
> +	if (a->sa.sa_family == AF_INET && addr->sa.sa_family == AF_INET) {
> +		if (a->v4.sin_addr.s_addr == htonl(INADDR_ANY) ||
> +		    addr->v4.sin_addr.s_addr == htonl(INADDR_ANY))
> +			return true;
> +		return a->v4.sin_addr.s_addr == addr->v4.sin_addr.s_addr;
> +	}
> +
> +	if (a->sa.sa_family != addr->sa.sa_family) {
> +		if (ipv6_only_sock(sk))
> +			return false;
> +		if (a->sa.sa_family == AF_INET6 && ipv6_addr_any(&a->v6.sin6_addr))
> +			return true;
> +		if (a->sa.sa_family == AF_INET && addr->sa.sa_family == AF_INET6 &&
> +		    ipv6_addr_v4mapped(&addr->v6.sin6_addr) &&
> +		    addr->v6.sin6_addr.s6_addr32[3] == a->v4.sin_addr.s_addr)
> +			return true;
> +		if (addr->sa.sa_family == AF_INET && a->sa.sa_family == AF_INET6 &&
> +		    ipv6_addr_v4mapped(&a->v6.sin6_addr) &&
> +		    a->v6.sin6_addr.s6_addr32[3] == addr->v4.sin_addr.s_addr)
> +			return true;
> +		return false;
> +	}
> +
> +	if (ipv6_addr_any(&a->v6.sin6_addr) || ipv6_addr_any(&addr->v6.sin6_addr))
> +		return true;
> +	return ipv6_addr_equal(&a->v6.sin6_addr, &addr->v6.sin6_addr);
> +}
> +
> +static int quic_v4_get_sk_addr(struct socket *sock, struct sockaddr *uaddr, int peer)
> +{
> +	return inet_getname(sock, uaddr, peer);
> +}
> +
> +static int quic_v6_get_sk_addr(struct socket *sock, struct sockaddr *uaddr, int peer)
> +{
> +	union quic_addr *a = quic_addr(uaddr);
> +	int ret;
> +
> +	ret = inet6_getname(sock, uaddr, peer);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (a->sa.sa_family == AF_INET6 && ipv6_addr_v4mapped(&a->v6.sin6_addr)) {
> +		a->v4.sin_family = AF_INET;
> +		a->v4.sin_port = a->v6.sin6_port;
> +		a->v4.sin_addr.s_addr = a->v6.sin6_addr.s6_addr32[3];
> +	}
> +
> +	if (a->sa.sa_family == AF_INET) {
> +		memset(a->v4.sin_zero, 0, sizeof(a->v4.sin_zero));
> +		return sizeof(struct sockaddr_in);
> +	}
> +	return sizeof(struct sockaddr_in6);
> +}
> +
> +static void quic_v4_set_sk_addr(struct sock *sk, union quic_addr *a, bool src)
> +{
> +	if (src) {
> +		inet_sk(sk)->inet_sport = a->v4.sin_port;
> +		inet_sk(sk)->inet_saddr = a->v4.sin_addr.s_addr;
> +	} else {
> +		inet_sk(sk)->inet_dport = a->v4.sin_port;
> +		inet_sk(sk)->inet_daddr = a->v4.sin_addr.s_addr;
> +	}
> +}
> +
> +static void quic_v6_copy_sk_addr(struct in6_addr *skaddr, union quic_addr *a)
> +{
> +	if (a->sa.sa_family == AF_INET) {
> +		skaddr->s6_addr32[0] = 0;
> +		skaddr->s6_addr32[1] = 0;
> +		skaddr->s6_addr32[2] = htonl(0x0000ffff);
> +		skaddr->s6_addr32[3] = a->v4.sin_addr.s_addr;
> +	} else {
> +		*skaddr = a->v6.sin6_addr;
> +	}
> +}
> +
> +static void quic_v6_set_sk_addr(struct sock *sk, union quic_addr *a, bool src)
> +{
> +	if (src) {
> +		inet_sk(sk)->inet_sport = a->v4.sin_port;
> +		quic_v6_copy_sk_addr(&sk->sk_v6_rcv_saddr, a);
> +	} else {
> +		inet_sk(sk)->inet_dport = a->v4.sin_port;
> +		quic_v6_copy_sk_addr(&sk->sk_v6_daddr, a);
> +	}
> +}
> +
> +static void quic_v4_set_sk_ecn(struct sock *sk, u8 ecn)
> +{
> +	inet_sk(sk)->tos = ((inet_sk(sk)->tos & ~INET_ECN_MASK) | ecn);
> +}
> +
> +static void quic_v6_set_sk_ecn(struct sock *sk, u8 ecn)
> +{
> +	quic_v4_set_sk_ecn(sk, ecn);
> +	inet6_sk(sk)->tclass = ((inet6_sk(sk)->tclass & ~INET_ECN_MASK) | ecn);
> +}
> +
> +#define quic_af_ipv4(a)		((a)->sa.sa_family == AF_INET)
> +
> +u32 quic_encap_len(union quic_addr *a)
> +{
> +	return (quic_af_ipv4(a) ? sizeof(struct iphdr) : sizeof(struct ipv6hdr)) +
> +	       sizeof(struct udphdr);
> +}
> +
> +int quic_is_any_addr(union quic_addr *a)
> +{
> +	return quic_af_ipv4(a) ? quic_v4_is_any_addr(a) : quic_v6_is_any_addr(a);
> +}
> +
> +void quic_seq_dump_addr(struct seq_file *seq, union quic_addr *addr)
> +{
> +	quic_af_ipv4(addr) ? quic_v4_seq_dump_addr(seq, addr) : quic_v6_seq_dump_addr(seq, addr);
> +}
> +
> +void quic_udp_conf_init(struct sock *sk, struct udp_port_cfg *conf, union quic_addr *a)
> +{
> +	quic_af_ipv4(a) ? quic_v4_udp_conf_init(sk, conf, a) : quic_v6_udp_conf_init(sk, conf, a);
> +}
> +
> +int quic_flow_route(struct sock *sk, union quic_addr *da, union quic_addr *sa, struct flowi *fl)
> +{
> +	return quic_af_ipv4(da) ? quic_v4_flow_route(sk, da, sa, fl)
> +				: quic_v6_flow_route(sk, da, sa, fl);
> +}
> +
> +void quic_lower_xmit(struct sock *sk, struct sk_buff *skb, union quic_addr *da, struct flowi *fl)
> +{
> +	quic_af_ipv4(da) ? quic_v4_lower_xmit(sk, skb, fl) : quic_v6_lower_xmit(sk, skb, fl);
> +}
> +
> +#define quic_skb_ipv4(skb)	(ip_hdr(skb)->version == 4)
> +
> +void quic_get_msg_addrs(struct sk_buff *skb, union quic_addr *da, union quic_addr *sa)
> +{
> +	memset(sa, 0, sizeof(*sa));
> +	memset(da, 0, sizeof(*da));
> +	quic_skb_ipv4(skb) ? quic_v4_get_msg_addrs(skb, da, sa)
> +			   : quic_v6_get_msg_addrs(skb, da, sa);
> +}
> +
> +int quic_get_mtu_info(struct sk_buff *skb, u32 *info)
> +{
> +	return quic_skb_ipv4(skb) ? quic_v4_get_mtu_info(skb, info)
> +				  : quic_v6_get_mtu_info(skb, info);
> +}
> +
> +u8 quic_get_msg_ecn(struct sk_buff *skb)
> +{
> +	return quic_skb_ipv4(skb) ? quic_v4_get_msg_ecn(skb) : quic_v6_get_msg_ecn(skb);
> +}
> +
> +#define quic_pf_ipv4(sk)	((sk)->sk_family == PF_INET)
> +
> +int quic_get_user_addr(struct sock *sk, union quic_addr *a, struct sockaddr *addr, int addr_len)
> +{
> +	memset(a, 0, sizeof(*a));
> +	return quic_pf_ipv4(sk) ? quic_v4_get_user_addr(sk, a, addr, addr_len)
> +				: quic_v6_get_user_addr(sk, a, addr, addr_len);

Minor nit: I think the most idiomatic way to express the abvoe is:

return quic_pf_ipv4(sk) ? quic_v4_get_user_addr(sk, a, addr, addr_len) :
			  quic_v6_get_user_addr(sk, a, addr, addr_len);

(other cases below)

/P


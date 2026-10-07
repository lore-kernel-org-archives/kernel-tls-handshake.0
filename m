Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D40E4DE73C
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  7 Oct 2026 18:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791398536; cv=pass; b=N/T+TKG/1/iANL2nlCWhPzcl0AUhZQ4zqDpsjdBuhiaY4go8nv5ebkwRj85DcgDu8SwFeJykmn7/LNats6yXrPvMqhOtsYJVBwIjEG9dgI1tWt8Yd0Q2XztCnf/HGNX3OfZ/3LL7oMAOVgqbUNjtzNBjN8TAv51s8XTKHQsnvKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791398536; c=relaxed/simple;
	bh=xoNPOXAYCmo9NEF9nKgtfLLIDyxsAiCZOxjU7IUScDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Or/fc21+fX+UWivitbvsI5VYT0ZRehxG3cG3Ve8kXZvNMDBP6/DvSfEbfxRjHqSMzpsQbWm7lBlhMwhSE9s47auA5vqx/lLZEu2TInR1YUrsflBwgXyterhU38om1GSwXN0gBGQau8E9NRrpDDTxm080jl6jcy/1t6EHuvAAWsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYdUZMHN; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYdUZMHN"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-86aecf49833so1418333b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 07 Oct 2026 11:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791398531; cv=none;
        d=google.com; s=arc-20260327;
        b=KnR/FSCQgCxHoYUlZOmo8hhVKYfhvdbLmqT5W0jywTqOxf4KHNupIjhzEGyfN+QUlr
         lkkNODnRS/1NsPH2jDvn8EcsfgYsqI/02EP5PqIwHcSOl1yFV050cG/90dKUcnn5Bq4C
         0U3o1f9d7MmLaAAray1QjxktveiWu7MZy0sRa2Zrmn8fy1g8oYTHFYD+PtaoC8nCYtyU
         F1wxR84Z0CzPx9kyFBZtf7PkrGaPqlfBAraiLKfjRMP7B1g6+z+pLGGZV8tpZLRIl6a6
         bfr+mr+Hb7rdXPYrB8y4nPdOt8dZb5f3gDQT8vTfcjCyQn/ymneXEnyV35kVsVf5/lOp
         twNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVY/k/l22EduN0afxcG6neeIyEhDBFiNHHXvyZBQ71g=;
        fh=drI/npINdSGGXNtNgxUQdkYqXjd9k9UgZaBaRaVVdSY=;
        b=jtMrkhAJCaa939GLkl58JnnPeIGNP3mjCMLaJKcx0frSz/hME7cfmBMUdfrGSjX24U
         wiJ/3uYHEukCJAp4922ANOctIVjSWUJbX8ezBQ/TBPmx5pIVREAO5W/q3nUroJJ2LSSc
         318DzDlC00DAzQPV8CKDr9PNixdhItoQnp9XoetztEVklsrABynDJ4Bk8TmFCrSuW0Yt
         vnYrTEKpNjuh1zOkdgCdBM1FN4UxvSa/TUdN3G17Rjbk6Vq2eAoHct1BozGPYynrIIZP
         QGXRX15ZXTJTz2gTElDAC3k7F51EFUr+JSydhsCAcoa5voL/ykijJq/ydoP3NcL4RBFZ
         APRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791398531; x=1792003331; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVY/k/l22EduN0afxcG6neeIyEhDBFiNHHXvyZBQ71g=;
        b=NYdUZMHN7sAClkCmYUa5VvnOXN7PmQ7eWqBSmP5WWkgj4/YwJMXkoJnGo0ISd/QxFm
         HR0bD429Y98DzNgFh8dRFlQb3k4hnrTJFUZa8rG/TdieDNunIZRVnm6EIq/IiJ2pOnjt
         hNFw51Jcz5/f7st3i3N0YQafvIecqzxj1D2z92OMzkGZXGXuoXYbStvnYm+VHSnPF4eA
         Fh5wAG/GwRksaQXw5MOxpf7ycwhxNPEj4TtO+YSbesLZWh4r7GFwSDWB+3+2dK7dbrRn
         ZUqKL+guQ+Zyc1xdc9vwbnD3Gznj0Rfqdz5hocAzJI0IOE7MbYKarabLav6+t5U1HvH3
         KZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791398531; x=1792003331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVY/k/l22EduN0afxcG6neeIyEhDBFiNHHXvyZBQ71g=;
        b=FRXygpZa4dXTaITXbKver9ThC9VcQwEJTJk3eckS4fB2XS/suEuklsAh2NcizFYbv8
         Q6SqTkAHnW9HxiPotcME2wAEs/O0oLN9qTtD7VlP28bsJ/MkBxPH4THMcHZzL4JGWU+E
         cv06muE+9utPehi9FHOPPSDByjq1utyd7DHxXlLbqZZ7LLrW268RhW8DGCvfBERGa1Iy
         BNh78Be8N4teOyTkx61Yjuf6/xuH+1CXX09MtBsUMDV1Nea4zCutLSCmkRoId7KHsPOp
         M6eIaWRZaH08y4aCKkt7cGr+ecg2kCZSK7cqkJ3on79oWlJoDJ2rGA5AbtoP+2mri+6h
         EXfA==
X-Forwarded-Encrypted: i=1; AKwUvBxylKouAgkAzc/dCZFZQq1d9sJwXgXSmlMeoG4Q07lBnWBh1+f6xBfbbakWI0Rm1CJQ3KF9K4wMGgY1c+whQBiGAbXqug==@lists.linux.dev
X-Gm-Message-State: AFuF++kifcCIextbW8lXZUy9vl/J3qCJIsg9HSf29B1cqG6is2PvGaR5
	mjNIIR56C6I4OmlW38bOk9hFPLx73aZO7eWif2nXqirG82f7gVmaK1+8Oq0M8x+rB6J8KyY3mHq
	IH0dU0XsPxO/J5TLm9NAy9OmeFeLu1lo=
X-Gm-Gg: AYBFou3DZGPlrTWCyMSPFf5mH/Ve71BVeGZMTTgQczcsXpgv8Pu+/w9Za5k2et4/iVe
	h06VNY09iSHMYeQSPW2r0Yu8eyrrP+KQ6UygoRZCRAKP2x73aQyUmtRtufvDIZfjGvlQL1P1BPM
	z3BFC4Z3DeOxBJgpbBp0tqrqMHCnDVRlxv3r37M3pEEpEOyNqiS+viIvr+3cIRU60fS9EarEf8u
	Hg02+pEI2GeT4VDto5CqGURaNIEKjzjZAG3LZvUMOVC50ZyTtDT7SurNDQt1uI/9iuwgsz2vNJD
	qstxc16gu/PoTcFuuMh/BUJ/I74MXNd5qBuBMZqNAza4nr4fTRxXwK7Gky2XRUwzjA/4jqASMSo
	cCqmk/D/CxhDMZYLQYaaFFhmqCDmZZ4KAClbPeqMhnvk9O3/4zXMqcOf78Y/FmiGO+4JIoWjDwI
	kzuuYH8kj6LJ8P
X-Received: by 2002:a05:6a00:4c96:b0:883:7868:94d7 with SMTP id
 d2e1a72fcca58-89309b14625mr28772b3a.10.1791398531420; Wed, 07 Oct 2026
 11:42:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <fff91f2c9ae1bdbbf76aa46c618b440c896d131f.1791227050.git.lucien.xin@gmail.com>
 <179133510313.434549.8082953410374436828@kernel.org>
In-Reply-To: <179133510313.434549.8082953410374436828@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 7 Oct 2026 14:41:59 -0400
X-Gm-Features: AclHuK_-WpbiNIs5rFoC0CPwAOXjrqmHL68V9DWecj4Pwatas5adXnnPR15tPLQ
Message-ID: <CADvbK_cPbqGt1MzrSUSOt6qqJghwBLz3obg+p-XC5wg+P3MaSg@mail.gmail.com>
Subject: Re: [PATCH net-next v16 04/15] quic: provide family ops for address
 and protocol
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, edumazet@google.com, pabeni@redhat.com, horms@kernel.org, 
	metze@samba.org, mbuhl@openbsd.org, tfanelli@redhat.com, hepengtao@xiaomi.com, 
	dreibh@simula.no, linux-cifs@vger.kernel.org, pc@manguebit.org, 
	linkinjeon@kernel.org, tom@talpey.com, kernel-tls-handshake@lists.linux.dev, 
	chuck.lever@oracle.com, jlayton@kernel.org, steved@redhat.com, hare@suse.de, 
	aahringo@redhat.com, dhowells@redhat.com, matttbe@kernel.org, 
	mail@johnericson.me, xiyou.wangcong@gmail.com, alibuda@linux.alibaba.com, 
	jbaron@akamai.com, illiliti@protonmail.com, sd@queasysnail.net, 
	marcelo.leitner@gmail.com, daniel@haxx.se, andrew.gospodarek@broadcom.com, 
	mef@scarletmail.rutgers.edu, paul@jakma.org, kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 9:05=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 1 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] An unprivileged sticky IPv6 routing header makes the route
>   lookup and the transmitted packet disagree, so packets go to the real=
=E2=80=A6
> - [Medium] IP_TTL and IPV6_UNICAST_HOPS are accepted but ignored on
>   transmit.
> - [Low] The commit message leaves out user-visible changes and describes
>   the code inaccurately.
> - [Low] IP_OPTIONS is accepted and stored but never sent.
>
> --
>
> quic: provide family ops for address and protocol
>
> This commit adds net/quic/family.{c,h} with IPv4/IPv6 helpers for route
> lookup, UDP tunnel transmit, address parsing and comparison, and UDP port
> config setup. It also connects quic_inet_getname() and the setsockopt()
> and getsockopt() levels other than SOL_QUIC to the inet and inet6 code.
>
> > Introduce QUIC address and protocol family operations to handle IPv4/IP=
v6
> > specifics consistently, similar to SCTP. The new quic_family.{c,h} prov=
ide
> > helpers for routing, skb transmit handling, address parsing and compari=
son
> > and UDP socket config initializing etc.
>
> [Severity: Low]
> This isn't a bug, but the patch creates net/quic/family.{c,h}, not
> quic_family.{c,h}.
>
> The wording "family operations ... similar to SCTP" looks left over from
> before v3. That version replaced the ops abstraction with if statements.
>
> Could the message also mention the changes userspace can see?
> quic_inet_getname() used to return -EOPNOTSUPP. It now returns real
> addresses through inet_getname() or inet6_getname().
>
> quic_setsockopt() and quic_getsockopt() now send every level other than
> SOL_QUIC to ip_setsockopt()/ipv6_setsockopt() and
> ip_getsockopt()/ipv6_getsockopt(). All SOL_IP and SOL_IPV6 options can
> now be set on QUIC sockets. An unknown level also returns -ENOPROTOOPT
> now, where it used to return -EOPNOTSUPP.
>
> > diff --git a/net/quic/family.c b/net/quic/family.c
> > new file mode 100644
> > index 0000000000000..f5d859b337b10
> > --- /dev/null
> > +++ b/net/quic/family.c
> > @@ -0,0 +1,449 @@
>
> [ ... ]
>
> > +static int quic_v6_flow_route(struct sock *sk, union quic_addr *da,
> > +                           union quic_addr *sa, struct flowi *fl)
> > +{
> > +     struct ipv6_pinfo *np =3D inet6_sk(sk);
>
> [ ... ]
>
> > +     security_sk_classify_flow(sk, flowi6_to_flowi_common(fl6));
> > +
> > +     rcu_read_lock();
> > +     final_p =3D fl6_update_dst(fl6, rcu_dereference(np->opt), &final)=
;
> > +     rcu_read_unlock();
> > +
> > +     dst =3D ip6_dst_lookup_flow(sock_net(sk), sk, fl6, final_p);
> > +     if (IS_ERR(dst))
> > +             return PTR_ERR(dst);
>
> [Severity: High]
> Can a sticky routing header make the route lookup disagree with the packe=
t
> that is actually sent?
>
> quic_common_setsockopt() now passes SOL_IPV6 to ipv6_setsockopt(). That
> lets an unprivileged user set IPV6_RTHDR, because ipv6_set_opt_hdr() only
> requires CAP_NET_RAW for the other option headers:
>
> net/ipv6/ipv6_sockglue.c:ipv6_set_opt_hdr() {
>     ...
>         /* hop-by-hop / destination options are privileged option */
>         if (optname !=3D IPV6_RTHDR && !sockopt_ns_capable(net->user_ns, =
CAP_NET_RAW))
>                 return -EPERM;
>     ...
> }
>
> Suppose np->opt holds a type-4 SRH or a type-2 routing header. Then
> fl6_update_dst() replaces fl6->daddr with a segment Y that the user picks=
.
> ip6_dst_lookup_flow() looks up a route for Y and then puts the real
> destination X back into fl6->daddr. ip6_dst_store() caches that dst.
>
> quic_v6_lower_xmit() then calls udp_tunnel6_xmit_skb(). That helper build=
s
> a plain IPv6 header addressed to X and never adds the np->opt extension
> headers:
>
> net/ipv6/ip6_udp_tunnel.c:udp_tunnel6_xmit_skb() {
>     ...
>         ip6h->nexthdr     =3D IPPROTO_UDP;
>         ip6h->hop_limit   =3D ttl;
>         ip6h->daddr       =3D *daddr;
>         ip6h->saddr       =3D *saddr;
>
>         ip6tunnel_xmit(sk, skb, dev, ip6cb_flags);
> }
>
> Doesn't this send packets to X using the device, gateway and MTU of the
> route for Y? Neighbour discovery for X would then run on Y's link. Local
> route policy for X, such as prohibit, blackhole, unreachable or policy
> routes, would also be bypassed.
>
> UDP and SCTP avoid this because they pass opt to
> ip6_append_data()/ip6_xmit(), which put the routing header on the wire.
>
> The transmit path is only connected in the next patchset. This code is
> the same at the end of this series.
>
> Should fl6_update_dst() be dropped here, since the tunnel transmit cannot
> send extension headers? Alternatively, should QUIC sockets reject sticky
> routing headers?
True.

udp_tunnel6_xmit_skb() does not support ipv6 opts yet.

will drop fl6_update_dst().

Thanks.

>
> [ ... ]
>
> > +static void quic_v4_lower_xmit(struct sock *sk, struct sk_buff *skb,
> > +                            struct flowi *fl)
> > +{
>
> [ ... ]
>
> > +     if (cb->ecn)
> > +             tos =3D (tos & ~INET_ECN_MASK) | cb->ecn;
> > +     ttl =3D (u8)ip4_dst_hoplimit(dst);
>
> [Severity: Medium]
> Are IP_TTL and IPV6_UNICAST_HOPS silently ignored here?
>
> Through quic_common_setsockopt(), setsockopt(SOL_IP, IP_TTL) stores its
> value in inet->uc_ttl. setsockopt(SOL_IPV6, IPV6_UNICAST_HOPS) stores its
> value in np->hop_limit. Both calls succeed, and getsockopt(IP_TTL) return=
s
> the stored value.
>
> However, this function always takes the TTL from the route.
> quic_v6_lower_xmit() does the same:
>
>         ttl =3D (u8)ip6_dst_hoplimit(dst);
>
> UDP and SCTP apply these options through ip_select_ttl() and
> ip6_sk_dst_hoplimit(). These functions already apply IP_TOS and
> IPV6_TCLASS through inet_sk(sk)->tos and inet6_sk(sk)->tclass.
>
> Should the hop limit use the socket setting as well?
>
> > +     udp_tunnel_xmit_skb((struct rtable *)dst, sk, skb, fl4->saddr,
> > +                         fl4->daddr, tos, ttl, df, fl4->fl4_sport,
> > +                         fl4->fl4_dport, false, false, 0);
> > +}
>
> [Severity: Low]
> What happens to IP_OPTIONS on a PF_INET QUIC socket?
>
> ip_setsockopt(IP_OPTIONS) parses the options and stores them in
> inet->inet_opt, and getsockopt(IP_OPTIONS) returns them.
>
> udp_tunnel_xmit_skb() ends up in iptunnel_xmit(). That function never
> reads inet->inet_opt and builds a header with no options:
>
> net/ipv4/ip_tunnel_core.c:iptunnel_xmit() {
>     ...
>         memset(IPCB(skb), 0, sizeof(*IPCB(skb)));
>     ...
>         iph->ihl        =3D       sizeof(struct iphdr) >> 2;
>     ...
> }
>
> Options such as Record Route or Timestamp are reported as set, but they
> never appear in any packet. quic_encap_len() also reserves no room for
> them.
>
> Should QUIC sockets reject IP_OPTIONS?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1791227050.git.lucien.xin%40gmail.com

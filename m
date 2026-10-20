Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792530641;
	b=NVW1U/iou7DeTNK8IYKgsb3YHGoab2gtuf2z4KD67GCu4q9PBWz/LfzAoy/urY0Rhrp7
	 XGXHiN6TZhzOH/EbgMwnC7lnYe2Ear3YScVXUTtQTCz4xduDOjNOQVOGUFvfdGPuoy0qF
	 lokeoYsKZ+Ht+9rH2hJdedCUHRKHuiLuk9hO1wQfwoA8uuhd3fVdKzFYPF9B29JIpLXjp
	 P5PVPc0FZvb/P6MYRTBaWa5+Yh7WIzV3Tk5lGhplNzRppF9/7TUUhPwSYyKLH/Jgsza1P
	 PlVR7V1jNbHGdw02qAmGVslon7sWMWfmO7wETbD3/XtDBmysLTb5j1cbxltltOx4rGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IjpJhJj3XPvV3nh0FGBKO62yC++yDA1DsEy0orMi22E=;
	b=ksMB6bA4AJYLpR9nMpdFJH2PQ8SaSE45CAmaN5vlD+LCsNfangTIYHlhVpFutotjRd5F
	 ZmRH8LXCVn+6T6b+Pu36h/ZeWLmrPY+WK8cteZAhl89/lWvGtdCZYFZjX1NpiFo0zjTV4
	 Ca20yVQL2UOABjlLbzByFk9d9tC8mEcqEEzMC5z+YA7R/kwYJ/gkdRDgz6JVaU7qr3eHG
	 EGmpH/YXm5VEMzxvCo2lyib4MgDeY37Qk1eEJmYUmi+wnaa9gpdwRA7l2Y3He3G52yDwQ
	 E8SYKatmlsJQ9cKPuIIvzo88qWWYI0m8q2TcAPmkSCJAg3a39QE/585zJ6C2cUlHRzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BbOcogkK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7367D606A31A
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Oct 2026 21:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7367D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BbOcogkK
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so932864e0c.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Oct 2026 14:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792530640; cv=none;
        d=google.com; s=arc-20260327;
        b=s2Itaasaa0Te4h8TAS2mO49MH7XuJe4gwUwM4QzMeJUjrnAUaACmPtVU2xidQIDX/D
         n2hlJBSdIozfEmFE14Yz0vZJ14fvGc1PQFJ7v5KfFKGmvtq80ePGxdo6GFl+IuYpYAgT
         hDmqbdpgXO/smxPG5B49J2l0Y095BScxuoEqbHPWFtngPgAW+TUsdz2HdFX9bcYWQ61F
         pE+d7+mcyNoswICJGCb4eZwWIQxNCjvb9cSkgqcPAOdm0z3U4SfoAk3xfsB63jvV5+Rt
         Qb1+vfpZG4kQUoYDkBoHTbeeDcxlLct0Waz/ZsFfZHfuaPCEFniubURgrnODLGwhOAzN
         RvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IjpJhJj3XPvV3nh0FGBKO62yC++yDA1DsEy0orMi22E=;
        fh=NfqFIobkdRhMJLFXu/oFnpOF4lgPtJDhYBgHigH6H3I=;
        b=pCWSXfRgQpGHel6yUluIkg3Pz4j+HILwATdLNjEnqsmNumAAIC6/XwiPRqRaFtywQD
         aXLYz92xVXRSX8DzsFKMHDs74rNnObtt0eTNCCf3isG5tN8AJ3Ewy+QNXhJ4HUN1opJL
         RhSM4UPi/5XUSS+H6JPx2cx/msOC8d8qxhYKSX3xCIlRXpz9U4cOZ/R6NEldm/aQgZpr
         0Pr70qGEXO/tYQPN2NwO8YfbrxhlEO9zRbgRRJz+QLF/eESLMYem76sP+28vtElhhPea
         n17GYKWQ9Xy/FRjJVbZ61AAmBMseFUjgduOAtuuwUYPS4QIDX6VGG8yZI4NBXVGkOvaT
         dOug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792530640; x=1793135440; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IjpJhJj3XPvV3nh0FGBKO62yC++yDA1DsEy0orMi22E=;
        b=BbOcogkKUVyGamD9bRkQ2uxHbiT1bCI+xSomhykQzunKG4mTn0C1JiM8SJ4kYuwrYc
         +TVaedsQwyOAS28nWNQ9fXXfOVEANLyGlDtb7TEf5fLYP4LRxVxK4wwWMV550XjlM5Sb
         npSsJ0K9nt+tdMmYMV/NwPsec6MrlioMT4lqqnDAJJNy4688KZMf2eoVtbCxbAynV/7u
         l7jMka+Q8ptV/OzQrFSLlNs9Gya1nT2yE604BgtryOzAfTTUa8TbrVYwGX6KTEOgROGI
         YgzrLvRjdPEXRG4XTkVd9jjBcRbkZjHLCisbzbuwyUrj+0u4D8BkCBVNGv98rL6ioBTV
         5B5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792530640; x=1793135440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjpJhJj3XPvV3nh0FGBKO62yC++yDA1DsEy0orMi22E=;
        b=LocbtEJnwGtHNiFRBFmpZpHZpLndSAklb1hdde+zYmgavKcOea2wDi+SO4NdGwK5/2
         0V3GdumH/WUw21p++BGg951iYvRN+BRGwVePq4f4VrVCkH/6mQ2E9LNIwS31hsMAN9aB
         D8cNF/lbAsQXNwhQuZr0kQAwoUWj+WbT7/zm3Uqua0cbpC5ilqMa7X7Vd8hdK8ET3wXr
         0t7ZyLpVw2g3TlRq71SuP85BGMVCMf53SfIvElzwPRIq9zucOsoHOuMpmtyVUWtHHRkL
         RrbnfqXloixJpBpE1/q7pqZzfR37AmWzQFgj9e6+Tmo8PmfCCti2bJn9+gjJe38pJvIc
         MqfA==
X-Forwarded-Encrypted: i=1; AKwUvBwleSS93I7QBjHH5xj5uwx7mUCKcizG6SOFmRbKtyOMAYAbapwpYRef9XBOHs7TaGwAJuNx8FK3Z0oYGoC3rH4tau9uZg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIzS3q2l7Q+OiD0sIOQhCkd/Xdjo1j0eYiHbDfixZxMU174Oh9I
	01MgDkPRNJtzGQCySwJ1x3uiq18yNcHKlwErXrrwWGSzlk0iJ6LIfrmCJsO1BnKNVz3TvWGjd+/
	4RhcVHeDN0V3dzMWwhfRL8mWEIlh/R3o=
X-Gm-Gg: AYBFou23u1mtvI9tLiTAtap5QGxPiKwQOpEVrz7mQ/1XUYai8KtKnyQqGBkbiCXviQz
	E1IF1n6lhU3pYS33NumUlq04+q+PIE4vSmoAaxhkw2RuEyHgP1BVWF88vnhYMa5M46b0+utM7yV
	SEnN0CcgBMZSXjqNjxjh1P8Y28w3bQklXjnyL6AhMmFHsvqFyDBBvwo0HrtJ0mHhP58jxuf1YS4
	fD02X816AIsMP+1G0q4+mDe2Ak1F3/9CORfzQ/6uOdnlRCsBEMzFcaUVk4NBqH2C/0aZV2VjaV+
	oDmFyB9rqEomaXPBCUbIhL13g+3HBdDrCvAuNcQEmUt4pMYQKCiEKU5eeN72E3m9xBC3NyroGpc
	5ijWDPGjrFs4eRDKKlGNE8EqofCIM4t0Okv9iFXobCKywvwRb4UZAcGZa8z6NflYbD1QiOupF+S
	FU4d2/vY/Aroal
X-Received: by 2002:a05:6122:8b0a:b0:5ea:aedd:6077 with SMTP id
 71dfb90a1353d-5eaebdb8b25mr11924e0c.5.1792530640358; Tue, 20 Oct 2026
 14:10:40 -0700 (PDT)
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <89a17e38fca0c84eb23ccde147942e44034ce05b.1792164438.git.lucien.xin@gmail.com>
 <179244539028.3135.8632269420764172979@kernel.org>
In-Reply-To: <179244539028.3135.8632269420764172979@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 20 Oct 2026 17:10:27 -0400
X-Gm-Features: AclHuK90ubiZ_3Vt7ioV-VUXcLL_AkSfJ2ivx6yoB89OB2lkvKl3ARidx8adw2s
Message-ID: <CADvbK_fNMJxJq8QFiFLtAE1op_bAGYU7bMi8qZ58Ai-aGGP7KQ@mail.gmail.com>
Subject: Re: [PATCH net-next v17 04/15] quic: provide family ops for address
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

On Mon, Oct 19, 2026 at 5:29=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] quic_common_setsockopt() (net/quic/family.c:416) passes every
>   SOL_IP/SOL_IPV6 option to the core IP stack without filtering.
> - [Low] The commit message describes the patch as only adding
>   family.{c,h} helpers (routing, transmit, address parsing and=E2=80=A6
> - [Low] When routing picks a link-local source for a wildcard sa,
>   quic_v6_flow_route() (net/quic/family.c:131) sets=E2=80=A6
>
> --
>
> quic: provide family ops for address and protocol
>
> This patch adds net/quic/family.{c,h} with IPv4/IPv6 helpers for routing,
> UDP tunnel transmit, address parsing and comparison, and UDP socket confi=
g
> setup. It also connects quic_inet_getname() to quic_get_sk_addr(), and se=
nds
> setsockopt/getsockopt calls for any level other than SOL_QUIC to the
> IP/IPv6 handlers.
>
> > Introduce QUIC address and protocol family operations to handle IPv4/IP=
v6
> > specifics consistently. The new family.{c,h} provide helpers for routin=
g,
> > skb transmit handling, address parsing and comparison and UDP socket co=
nfig
> > initializing etc.
>
> [Severity: Low]
> This isn't a bug, but the commit message only talks about new helpers. Th=
e
> patch also changes three socket entry points that userspace can see.
>
> quic_inet_getname() in net/quic/protocol.c used to return -EOPNOTSUPP. It
> now calls quic_get_sk_addr(), so getsockname() and getpeername() return
> real addresses. IPv4-mapped results on AF_INET6 sockets are also rewritte=
n
> to sockaddr_in.
>
> quic_setsockopt() and quic_getsockopt() in net/quic/socket.c now pass eve=
ry
> level other than SOL_QUIC to ip_setsockopt()/ipv6_setsockopt() and
> ip_getsockopt()/ipv6_getsockopt(). That makes the full SOL_IP and SOL_IPV=
6
> option sets reachable on QUIC sockets.
>
> The errno for unknown levels changes as well. setsockopt() now returns
> -ENOPROTOOPT. getsockopt() returns -EOPNOTSUPP from do_ip_getsockopt() on
> IPv4 sockets and -ENOPROTOOPT from ipv6_getsockopt() on IPv6 sockets.
>
> Could the commit message mention these changes?
>
> > diff --git a/net/quic/family.c b/net/quic/family.c
> > new file mode 100644
> > index 0000000000000..dc41a0ae07086
> > --- /dev/null
> > +++ b/net/quic/family.c
> > @@ -0,0 +1,441 @@
>
> [ ... ]
>
> > +static int quic_v6_flow_route(struct sock *sk, union quic_addr *da,
> > +                           union quic_addr *sa, struct flowi *fl)
> > +{
>
> [ ... ]
>
> > +     fl6->flowi6_proto =3D IPPROTO_UDP;
> > +     fl6->flowi6_oif =3D quic_get_dev_if(sk, da);
>
> [ ... ]
>
> > +     dst =3D ip6_dst_lookup_flow(sock_net(sk), sk, fl6, NULL);
> > +     if (IS_ERR(dst))
> > +             return PTR_ERR(dst);
> > +
> > +     if (quic_v6_is_any_addr(sa)) {
> > +             sa->v6.sin6_family =3D AF_INET6;
> > +             sa->v6.sin6_addr =3D fl6->saddr;
> > +             if ((ipv6_addr_type(&fl6->saddr) & IPV6_ADDR_LINKLOCAL))
> > +                     sa->v6.sin6_scope_id =3D fl6->flowi6_oif;
>
> [Severity: Low]
> Is fl6->flowi6_oif the right value to store as the scope id here?
>
> It holds the oif requested before the lookup, which is
> quic_get_dev_if(sk, da). The ip6_dst_lookup_flow()->ip6_dst_lookup_tail()
> path doesn't appear to write the chosen egress device back into it.
>
> On the fib6 rules path, l3mdev_update_flow() can also clear it when the o=
if
> is an L3 master:
>
>         if (netif_is_l3_master(dev))
>                 fl->flowi_oif =3D 0;
>
> The IPv4 side is different. ip_route_output_flow() sets
> flp4->flowi4_oif =3D rt->dst.dev->ifindex after the lookup.
>
> Two cases can store a link-local source with sin6_scope_id =3D=3D 0: an u=
nbound
> socket with a link-local destination that has no scope, or routing pickin=
g
> a link-local source.
>
> After that, quic_get_dev_if(sk, sa) falls back to sk->sk_bound_dev_if (0)=
.
> quic_v6_udp_conf_init() then asks to bind a link-local local_ip6 with
> bind_ifindex 0, which __inet6_bind() rejects. The link-local scope check =
in
> quic_v6_cmp_sk_addr() is also skipped, because one side's scope is 0.
>
> Would dst_dev(dst)->ifindex record the real egress interface instead?
>
> > +     }
> > +     ip6_dst_store(sk, dst, false, false);
> > +     return 0;
> > +}
>
> [ ... ]
>
> > +int quic_common_setsockopt(struct sock *sk, int level, int optname,
> > +                        sockptr_t optval, unsigned int optlen)
> > +{
> > +     return quic_pf_ipv4(sk) ?
> > +            ip_setsockopt(sk, level, optname, optval, optlen) :
> > +            ipv6_setsockopt(sk, level, optname, optval, optlen);
> > +}
>
> [Severity: Medium]
> This passes every SOL_IP and SOL_IPV6 option to the core IP stack. The
> QUIC route and transmit helpers above only use part of the resulting
> socket state: tos/tclass, uc_ttl/hop_limit, pmtudisc, SNDFLOW flow labels=
,
> sk_bound_dev_if, mark and uid.
>
> Can setsockopt() then report success for options that never take effect o=
n
> QUIC traffic? Some examples follow.
>
> IP_OPTIONS sets inet->inet_opt. However, quic_v4_lower_xmit() goes throug=
h
> udp_tunnel_xmit_skb()->iptunnel_xmit(), which always builds a header with
> no options:
>
> net/ipv4/ip_tunnel_core.c:iptunnel_xmit() {
>     ...
>         iph->ihl        =3D       sizeof(struct iphdr) >> 2;
>     ...
> }
>
> quic_v4_flow_route() also does no source route handling.
>
> IPV6_RTHDR, IPV6_HOPOPTS and IPV6_DSTOPTS set np->opt, but
> udp_tunnel6_xmit_skb() never adds extension headers. The v17 changelog
> notes this when it drops fl6_update_dst(), yet these options are still
> accepted.
>
> IP_UNICAST_IF (inet->uc_index) and IPV6_UNICAST_IF (np->ucast_oif) are
> ignored, because quic_get_dev_if() only looks at the link-local scope id
> and sk_bound_dev_if. UDP does use ucast_oif in udpv6_sendmsg():
>
>         fl6->flowi6_oif =3D READ_ONCE(np->ucast_oif);
>
> The sticky IPV6_PKTINFO (np->sticky_pktinfo) and IP_TRANSPARENT are not
> checked either.
>
> Would an allow-list in quic_common_setsockopt() make sense, returning
> -EOPNOTSUPP for options the QUIC path can't honour, as MPTCP does?
>
True.

But this is more like an improvement, it will take a long time to go over
all IP/IPv6/SOL socket options. I may leave it for future work.

Thanks.

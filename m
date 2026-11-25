Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795625083;
	b=nbHe4pnJvJ5tRt/ziyCMCkVVookr8ekwdnCBcG1mD73AWk0J8fvwrM33LgH/w27zjN6y
	 +bNNlCCL51DCqMpyPqcNXR2dCJgq/kVDiJZ8OTHgDMa/UCsa7b8l9lmdG7xkgpZhluF2m
	 fpoPQhQw+giPvJhbC0PlgcDdunisOsAyDMQUTgssO8FXjOcE0GIqzvi31sf0YKE4OBuSa
	 lVHOlaITz7c6ZYqZQdvoeB0Sa3iLg5KSpXH6J1z0hniHD5ViGNqij59G3gTTNe6v15SRH
	 WU3bP4SAY388Nz81Rt61fMNlxyoaz0iBMz40mjZxebQqL7ShnWS/+MaWKU7tHSg12gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VqQCnrL/aKCm/C9vlxA9BxjPZ3u2dEkyObqv4aLYECU=;
	b=QkinqfAd5fjMj5c3kDE01F8Zj1N7zOq7y3VFogR57jXa3rO7IWdzPX8D9og0ZVNH/Ed+
	 nyOXArHPndmjpHPeWeJtER+ziw3aWpmJU4JwMU3J1mySLgXlEXJBsVG7o4Y4l5zTif5C+
	 o7xl5Y6plLM5n74deJvuC4g73AMYx4PkKPbmXNAaUwAWaOzU/PXOgkhTVcK3nFMLf2pLp
	 3EoQuV0VNZWTSrPpeRpWH3i9U9ayaLOme9QODSV7iDF/FweTyNE1AoIuLpw+BWMYiMAZN
	 rTnzsTQRC5IXOSgGMLO3qBzOy7kOPgYCDxVVGainMQLpUIe34+1fhczzIdv1tcjnjAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+CY4Ijk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F784606A327
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 25 Nov 2026 16:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F784606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+CY4Ijk
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so2077866b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 25 Nov 2026 08:44:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795625082; cv=none;
        d=google.com; s=arc-20260327;
        b=DyD6EihKS308mHTU+oqIPSdcvNYrDpJjPdXKaWEAFLGMelj80YzJ7/ZSxgH5I2l9ig
         Fj3EHpqPWkSvVRAp6vq7FwbAdQYr84ovhPFGLMbQ8iLJ2r/s6Pk8nJJIE0edtE79Mjc5
         /FwcJW1V1AbHuUXcNXxwag8jBRhCYoRUrls39zUWl4Lm/dhk/R7G/D2GGi8eSwa91dPe
         EEoC60UHT3lDjpRFekfYdPJiesMPVW9P+NaxmU8JkZlc3qXvKcETBUn3tRAUsyGC851a
         AJAyNvTR3XVB5ILNmUNAJThMsOZoPa2TPLa5fOpSf0JgeAVQvnBk9yMk5I/URlTVvjVY
         SyFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VqQCnrL/aKCm/C9vlxA9BxjPZ3u2dEkyObqv4aLYECU=;
        fh=EOAoi40fIkrtubnp40DyDW2MmH5h+zj0ymNC+GeLKz0=;
        b=qsXnnYhBAKAQqprXTrenfPOcwaao3abWEjZ3eykLV475XW1rlJj1srsd8pJcpzrNsl
         0shzEWqr6HlqchF/dxOwe7pRTX9TNWdiVvndALqXfupEtys/HKZriXck4gJa5RiUnqCB
         PDND4PRkLMdilSbTAMifcXcVg4P14i3BIIyld0MGmqVwuggR//wG0Vh7HPj306i0tad0
         c5fDLbZu8manpgt4vw4ipLg8lFrf3wBhSXeYq6scJQjYqk5r3vAR95vE9LOwfW3yL8xy
         tPlx0ELSWMrFHaAGrVST4HpGThkphqcuUKHuBuQI3qsgrNvTYzbfEmmgdOrsHPve584k
         z9mw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625082; x=1796229882; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VqQCnrL/aKCm/C9vlxA9BxjPZ3u2dEkyObqv4aLYECU=;
        b=C+CY4IjkmZtHjsUiRZhPq36pnI0Wv7dYsVDzV1XmSSeCl5Ta4WBcPPHV+kJV+2DNlH
         KtqN7pnSarNZWlFNFvEZlniRxnx+EMe6ksbrWYPlP9x2b+0J2vuK2Bm+Z3rIwC33cNU2
         zc56NkZpSEB4ApiAPwNMwUOmr8t/K8SyTYoDLG6NEtkSlGAxiJ15LQmf3yV75SKuwtMs
         gVa6fWR342iYS5kbyWiRBQokGA3XEMonFGeA7036tbEBzzdL8Gf0UIS4cJUK4YwGETFq
         axFcS2wG4ZyPCeTS+KmX8aAbGix2RRYg65f+yDPL9egQJiZrb6T+YKC0RMQyTMZ6F8zt
         iT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625082; x=1796229882;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VqQCnrL/aKCm/C9vlxA9BxjPZ3u2dEkyObqv4aLYECU=;
        b=TYLVTNVi+eCpq4HxX/4bBzSOR8+WHK4XhbqUmTWIssctwuoq4GKjQ8mNIXdykd9naq
         4zUcuqHAc3hVLmzUiQSuglI8nQ+kcHPx0ORjmgt8BARYDphcGGpu8xaEsmAn1eCqojl5
         QXMjtMfzz7IXqFvwc4jh8eLkCdYvnSA1OLyGi0Td8xMeVgzyyatPlhxL2ZkP1hydV3rC
         KDm8iq7EYD61toDn4njOvNPKpDeyM83Ipft4IG1kWYONuprDa/YHGri1qLtYjrVJ7CG/
         QBZuF+ITrzD4I84P3pazO+H2Uv4NPwYMTRn9tbSyKhCkQ0qACR4sNDg0SoC5VM3wVx1h
         Oy4Q==
X-Forwarded-Encrypted: i=1; AL+hErG0nIOQIBFVHFPyw9/Hgt4oi9kud1g/+ojnZhF3vCBKm2Ef0/GnGR7cZSxkEsEmVImrfTMNuD+/Wu5qkqyTOXm2pXi33g==@lists.linux.dev
X-Gm-Message-State: APuU4Z+/4daLbUk9aWcdsh27KWg2R2+F2Fr/+w8ul4FiMGMpJVjN/jGy
	n2uNqDvo6k9cNWExUKaNGz7gUU2u9VgXA5T1ZuZb+ITfxoxxOk7jYakSEvft3Y5PD7Ube0e5zlS
	WsdSt7thpQUqsSLMY+Gv4wdQbyPNk4D4=
X-Gm-Gg: AZFdTZdjDRZ4F1QGd7/abE4E9f/CmLDwrKWpCmd6YaaZf0CsgRNQdmnHr6PmUlNYRnG
	k4+3pNRDrtdm5zVx2yEvH31deTha8hyvvKwwFMYbPeWf2iJxE1CXj+jiTsD0wx7IVXj9+whfLIs
	W5jEwDi+KE6/I6AU4eCkgN4gl84afWjQTndqfOLigw1ByI19mUnSvKFH/KRxVF8mZiZ+OMAnzcO
	liUZr2jttKZYuuAbkiVP1BQPjyYSmo9k1WmiRgmIQKlHWpARPHGxorlczwmkknfz9L9SnyujDQj
	Dha+4XLJlh9M1+rsAS2JeOo5PQUAhi2RVf6kmurXMYd/RVyJnuCIwcWDJ1/BNgBHSNmJlOC9z/I
	b5y3IPxY+pEN1BA3PmuRmoIunsHi0DQSNpTmxBdIS1y1kxPrX2TyUSUJLza7Wh9OsC46Hu9ScXr
	oh1QzGk2rkQuy0+BqFrpgoLWM+4DmF5MiFeXSQhHte2Mx9J9UhUG9vJbO4kVOlpKvMG9Z7
X-Received: by 2002:a05:6a00:17a3:b0:881:cbb0:6a90 with SMTP id
 d2e1a72fcca58-8c87d80b24bmr16495257b3a.58.1795625082380; Wed, 25 Nov 2026
 08:44:42 -0800 (PST)
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <e33f69fbe24e60c4f624c08279553be2888558ff.1795393691.git.lucien.xin@gmail.com>
 <179548326686.3135.1885327270671072036@kernel.org>
In-Reply-To: <179548326686.3135.1885327270671072036@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 25 Nov 2026 11:44:30 -0500
X-Gm-Features: Aa3M54rwA_4B_Qvf2uz_eVnjuVavXWhSvilNzKm8mtiFvEJGwuVKtS7cR4uh2Fw
Message-ID: <CADvbK_dW3LHZq1b0Y7pbWBbi1BikLyajruJ=iJz25sp_nkXdAA@mail.gmail.com>
Subject: Re: [PATCH net-next v19 04/15] quic: provide family ops for address
 and protocol
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	metze@samba.org, mbuhl@openbsd.org, tfanelli@redhat.com, hepengtao@xiaomi.com, 
	dreibh@simula.no, jamie.bainbridge@gmail.com, linux-cifs@vger.kernel.org, 
	pc@manguebit.org, linkinjeon@kernel.org, tom@talpey.com, 
	kernel-tls-handshake@lists.linux.dev, cel@kernel.org, jlayton@kernel.org, 
	steved@redhat.com, hare@suse.de, aahringo@redhat.com, dhowells@redhat.com, 
	matttbe@kernel.org, mail@johnericson.me, xiyou.wangcong@gmail.com, 
	alibuda@linux.alibaba.com, jbaron@akamai.com, illiliti@protonmail.com, 
	sd@queasysnail.net, marcelo.leitner@gmail.com, daniel@haxx.se, 
	andrew.gospodarek@broadcom.com, mef@scarletmail.rutgers.edu, paul@jakma.org, 
	kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:21=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 3 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] quic_flow_route() in net/quic/family.c returns -EINVAL
>   whenever `sa->sa.sa_family` is non-zero and differs from=E2=80=A6
> - [Medium] quic_v4_flow_route() in net/quic/family.c accepts any route
>   returned by ip_route_output_flow() and passes it straight to=E2=80=A6
> - [Medium] When the selected IPv6 source is link-local,
>   quic_v6_flow_route() in net/quic/family.c runs `sa->v6.sin6_scope_id =
=3D=E2=80=A6
> - [Low] The commit message does not mention three user-visible behaviour
>   changes.
>
> --
>
> quic: provide family ops for address and protocol
>
> This patch adds net/quic/family.{c,h} with IPv4/IPv6 helpers for routing,
> transmit, address parsing and comparison, and UDP tunnel socket
> configuration. It also wires quic_inet_getname(), quic_setsockopt() and
> quic_getsockopt() to these helpers.
>
> > quic: provide family ops for address and protocol
> >
> > Introduce QUIC address and protocol family operations to handle IPv4/IP=
v6
> > specifics consistently. The new family.{c,h} provide helpers for routin=
g,
> > skb transmit handling, address parsing and comparison and UDP socket co=
nfig
> > initializing etc.
>
> [Severity: Low]
> This isn't a bug, but the commit message describes only internal helpers.
> The patch also changes user-visible behaviour on QUIC sockets.
>
> quic_inet_getname() used to return -EOPNOTSUPP. It now calls
> quic_get_sk_addr(), so getsockname() and getpeername() return real
> addresses through inet_getname() or inet6_getname().
>
> quic_setsockopt() and quic_getsockopt() used to return -EOPNOTSUPP for an=
y
> level other than SOL_QUIC. They now pass the call to ip_setsockopt() or
> ipv6_setsockopt(), and to ip_getsockopt() or ipv6_getsockopt(). With
> CONFIG_NETFILTER the call can also reach nf_setsockopt() or
> nf_getsockopt(). For unknown levels the error changes from -EOPNOTSUPP to
> -ENOPROTOOPT.
>
> SOL_IP and SOL_IPV6 options set this way change state that the new helper=
s
> read: inet_sk(sk)->tos, uc_ttl, np->tclass, SNDFLOW and ipv6_only_sock().
>
> Could the commit message mention these changes? The subject also still
> says "family ops", but v3 replaced the ops abstraction with if/else
> helpers.
>
> > diff --git a/net/quic/family.c b/net/quic/family.c
> > new file mode 100644
> > index 0000000000000..73f3b955e13c4
> > --- /dev/null
> > +++ b/net/quic/family.c
>
> [ ... ]
>
> > +static int quic_v4_flow_route(struct sock *sk, union quic_addr *da,
> > +                           union quic_addr *sa, struct flowi *fl)
> > +{
>
> [ ... ]
>
> > +     security_sk_classify_flow(sk, flowi4_to_flowi_common(fl4));
> > +     rt =3D ip_route_output_flow(sock_net(sk), fl4, sk);
> > +     if (IS_ERR(rt))
> > +             return PTR_ERR(rt);
> > +
> > +     if (quic_v4_is_any_addr(sa)) {
> > +             sa->v4.sin_family =3D AF_INET;
> > +             sa->v4.sin_addr.s_addr =3D fl4->saddr;
> > +     }
> > +     sk_setup_caps(sk, &rt->dst);
>
> [Severity: Medium]
> Should quic_v4_flow_route() reject RTCF_BROADCAST and RTCF_MULTICAST
> routes before caching the dst?
>
> Other IPv4 socket types check rt->rt_flags at this point. For example,
> __ip4_datagram_connect() does:
>
>         if ((rt->rt_flags & RTCF_BROADCAST) && !sock_flag(sk, SOCK_BROADC=
AST)) {
>                 ip_rt_put(rt);
>                 err =3D -EACCES;
>                 goto out;
>         }
>
> raw_sendmsg() has the same check. tcp_v4_connect() returns -ENETUNREACH
> for both RTCF_MULTICAST and RTCF_BROADCAST.
>
> Without such a check, a QUIC socket can cache and send on a broadcast
> route (255.255.255.255 or a subnet-directed broadcast) without
> SO_BROADCAST.
>
> On the server side, the reply destination comes from the source address
> of a received packet. With rp_filter=3D0, the kernel default, a spoofed
> source equal to the local subnet broadcast (e.g. 192.168.1.255) gets past
> ip_route_input_slow() and fib_validate_source().
>
> Would the server's replies then go out as link-layer broadcasts to every
> host on the LAN? That multiplies the 3x anti-amplification budget by the
> number of hosts. A userspace QUIC server on a UDP socket would get -EACCE=
S
> from sendto() in this case.
>
False.

The spoofed broadcast source) is already blocked by the IP layer for
multicast and 255.255.255.255, and by fib_validate_source() for subnet
broadcast on any system with rp_filter >=3D 1. The remaining gap: subnet
broadcast with rp_filter=3D0 is narrow, and the 3x anti-amplification limit
further constrains it. It's a defense-in-depth improvement, not a security
hole.

> > +     return 0;
> > +}
> > +
> > +static int quic_v6_flow_route(struct sock *sk, union quic_addr *da,
> > +                           union quic_addr *sa, struct flowi *fl)
> > +{
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
> > +                     sa->v6.sin6_scope_id =3D dst->dev->ifindex;
>
> [Severity: Medium]
> Is it safe to dereference dst->dev here without rcu_read_lock()?
>
> This code runs in preemptible process context, under lock_sock() through
> quic_packet_route(). A dst reference does not pin the original
> net_device. On unregister, dst_dev_put() does:
>
>         rcu_assign_pointer(dst->dev_rcu, blackhole_netdev);
>         netdev_ref_replace(dev, blackhole_netdev, &dst->dev_tracker,
>                            GFP_ATOMIC);
>
> That drops the reference on the old device. This reader is not inside an
> RCU read-side section, so the synchronize_net() calls during unregister
> do not wait for it.
>
> If the task is preempted after loading dst->dev but before reading
> ->ifindex, can it read freed net_device memory? Even in the harmless
> case, it could store blackhole_netdev's ifindex as the scope ID.
>
> include/net/dst.h provides dst_dev() and dst_dev_rcu() for this.
> sk_setup_caps() on the IPv4 path reads the device through dst_dev_rcu()
> under rcu_read_lock().
>
True.

But the practical risk is low: this code only runs for link-local source
addresses, which is uncommon, and the window between loading dst->dev and
reading ->ifindex is tiny. Even if the race occurs, the most likely outcome
is reading blackhole_netdev->ifindex as the scope ID, incorrect but not a
crash.

There's a similar case in quic_v6_get_pref_addr() in the subsequent
patchset. I can fix both there when adding the function.

Thanks.

> > +     }
> > +     ip6_dst_store(sk, dst, false, false);
> > +     return 0;
> > +}
>
> [ ... ]
>
> > +int quic_flow_route(struct sock *sk, union quic_addr *da, union quic_a=
ddr *sa,
> > +                 struct flowi *fl)
> > +{
> > +     if (sa->sa.sa_family && da->sa.sa_family !=3D sa->sa.sa_family)
> > +             return -EINVAL;
>
> [Severity: Medium]
> Does this check reject a valid dual-stack setup?
>
> An AF_INET6 '::' source (a socket bound to the IPv6 wildcard) with an
> AF_INET destination fails here. quic_v6_cmp_sk_addr() accepts that same
> pairing on receive:
>
>         if (a->sa.sa_family !=3D addr->sa.sa_family) {
>                 if (ipv6_only_sock(sk) || a->sa.sa_family =3D=3D AF_INET)
>                         return false;
>                 return quic_is_any_addr(a);
>         }
>
> So a stored AF_INET6 '::' address matches AF_INET traffic on receive, but
> routing refuses the same combination on transmit.
>
> Suppose the later bind() and connect() code stores a bound [::] source
> as-is. Would a client bound to [::]:port that connects to an IPv4 peer
> then fail in quic_packet_route()->quic_flow_route() with -EINVAL? The v14
> changelog says IPv4-mapped addresses are converted to AF_INET, so the
> peer address would arrive here as AF_INET. Plain UDP allows this on a
> dual-stack socket.
>
> Dropping the check alone would not fix it. quic_v4_flow_route() reads
> sa->v4.sin_addr, which overlays sin6_flowinfo, so an IPv6-wildcard sa
> would need to be treated as IPv4 ANY.
>
> The v15 changelog shows the family mismatch check is intentional. Was the
> dual-stack wildcard case considered?
>
False.

The dual-stack server case works correctly. accept sockets and stateless
reply paths use addresses from the received packet, which are already
family-matched. The only affected case is a client explicitly binding to
[::] then connecting to a bare IPv4 address, which is uncommon. clients
typically either auto-bind or use IPv4-mapped addresses. We can address
this in a follow-up if needed.

> > +
> > +     return quic_af_ipv4(da) ? quic_v4_flow_route(sk, da, sa, fl) :
> > +                               quic_v6_flow_route(sk, da, sa, fl);
> > +}
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1795393690.git.lucien.xin%40gmail.com

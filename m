Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF141FCFEF
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  6 Nov 2025 01:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762390929; cv=none; b=Q72eLndL4Yeg8KFMsT/v4B0PzHldWIGG/4KM39xGDqHisp7sFBzbSPwPETcFG+vq+ka/NxAEB9q3bPzQ38XyMSkm3jP0CMvQjTKyVCDCsXdaQOIEvpJmJZWBGyx/B6S6C3S437OkRvJ/ryGuQ67biZnjFOEZXslAW+Kac4Q1dsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762390929; c=relaxed/simple;
	bh=1Xl6A1n4r9574KDPDn1VKNxqCb9t4wD9GmqRB9E0eco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t02SDlz7WN0qlu0+vZvLYFzB3nEL91K7y6FKFWb2EXZehD1LKwt5a+qMqYsnyMfUxGVn3aec6Z+pNwl3TEdVw32P7xuCcgbdj+I2NRYq4m/K3dX731ShU4E/J38ez0jAYC9P0s6bFpYfTifT669xC+ohAjasZ1a4CBNnKXFol4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njePudQu; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njePudQu"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-33b5a3e8ae2so1239787a91.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 05 Nov 2025 17:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762390926; x=1762995726; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dZNEBn3e6jyep5yKHvTM/6SnNrMGkEC6yO7qjIyAxs=;
        b=njePudQueQbZo0Mrv73BP5igldZHrJlD1EFNhbleQRm7tm86XvMXXA9S+op70yGb1w
         CahaFiKKiiPx8+SHyYIer8qHP62arG3w1NQZ3aAfOHBbVJbPsENOzxe9mcxfAzgMzFYt
         WVvQRlFQH/jymNXXdVZAUCH7Rsmk9gnfS4iIN1epdaw64brfInGEGuf56rZZXhub/u43
         AIclfbfhIx5Lw/NBk1MX62JePTlQ6rq7HH9G9hByoatMeX3pOIrobZonhQsUbikljVmx
         l8+9RcbONa+2EAs8x65xhaGjdDe3+r8wroCq24v5izFBr50SmaU3vQpntL1ES73NGLp+
         ahMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762390926; x=1762995726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dZNEBn3e6jyep5yKHvTM/6SnNrMGkEC6yO7qjIyAxs=;
        b=I1Th5yJwdrqXkYTETnMDIFjkeTE16+SflTkhWQaMhk38ChVaqo3ecOV2cqILGxJrCs
         utthoK4Dqv26cmpgiDVu6qso/rG0/jed/C8Yrv/uqEyAs8vB+c0oMAACBpOliTDyScMj
         a61Kl8uGKGooYW73IuoJl58UK9euhHA5jEsWcSf5lXq0EqiIMnniaj50671q4AM167SW
         jaUZUIaRItiqR+zS83FQEKcY8dXgnF3+M7UgD2AfMC/MkaX22VEZC9EayHqKPhu98XVf
         cYfMbOq0ILqyKHp7cCQTv4daHQRemM0dhR6q+z6AifGCziN0FsC2wwtw30fmHhoNfwkD
         q/jg==
X-Forwarded-Encrypted: i=1; AJvYcCWno2XRYydttTxEqErf4KRc/jqztEAkbEi07tKwKKJYnEIDlwKK35tBfR6DJcAIYfeXzlHJCwJj9+VoGhz8/8jwbHcdJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNA+D/6VLhaqaIS7jAE3UGwalsBNP+3MTke0Lgezn631lRRa0k
	eoAXiqNsNCmrkyCiogfImBjPHYb2pO9GXx7yIKbrF8P+FnS05lpd/mbmt3raLBDQQHrHzO5JtEg
	skMYLYQkDzxpgOKAJyb4lD10S/Omas8Q=
X-Gm-Gg: ASbGncsBxFGlAS237hbJJJ6ZvGM+U2g4iCOwbssolux27T9mhrh0P4zfG3RqnnakqBC
	kn5Dt3Fuvdejq9oDh1L9AU2HVnyuCbRSY3UTi1G9wUHOehGltcGc5S5NtVVFwOlJkz0/OXq+Xt+
	+n79gltLjHORQTbjmXwn5v9CGOLj4xBcxzsfRzEsS7zbnh5aZB1wUmpIBbbzQFgV9dYLXVScLTz
	ZevFWIsn4OyNCYV5I0APNq2tMFXaXbaY/xxWPpCibIgcCF+gyt4PdwlXidHUKJS430H9qNUGNMT
	CEbA0tCBP7nI5DYHdIE=
X-Google-Smtp-Source: AGHT+IEvQ67mnFTPK85m0X0BN6VR7ZAdrC7a5DTgNRHcXwLJcO1zVpnpldgm9dcZLWdqCwk700yhYzaYPLM0iTuqbEE=
X-Received: by 2002:a17:90b:5388:b0:32e:8ff9:d124 with SMTP id
 98e67ed59e1d1-341cd1216efmr1562948a91.15.1762390925935; Wed, 05 Nov 2025
 17:02:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <204debefcf0329a04ecd03094eb4d428bf9a44f1.1761748557.git.lucien.xin@gmail.com>
 <f557c3eb-9177-4e4f-b46e-e83bf938e2b0@redhat.com>
In-Reply-To: <f557c3eb-9177-4e4f-b46e-e83bf938e2b0@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 5 Nov 2025 20:01:54 -0500
X-Gm-Features: AWmQ_blEEWuCjM0sidfRbyVWZGvPUBOoAa2O7D4leyHLEYb6Jrd1D9JCPtULuMQ
Message-ID: <CADvbK_cG-yAAqUjGMVcmewP1Cc-7HqRLWsn2j_yWu_hmxqP5Eg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 04/15] quic: provide family ops for address
 and protocol
To: Paolo Abeni <pabeni@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, Alexander Aring <aahringo@redhat.com>, 
	David Howells <dhowells@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, 
	John Ericson <mail@johnericson.me>, Cong Wang <xiyou.wangcong@gmail.com>, 
	"D . Wythe" <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>, 
	illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 5:27=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 10/29/25 3:35 PM, Xin Long wrote:
> > +static int quic_v4_flow_route(struct sock *sk, union quic_addr *da, un=
ion quic_addr *sa,
> > +                           struct flowi *fl)
> > +{
> > +     struct flowi4 *fl4;
> > +     struct rtable *rt;
> > +
> > +     if (__sk_dst_check(sk, 0))
> > +             return 1;
> > +
> > +     memset(fl, 0x00, sizeof(*fl));
> > +     fl4 =3D &fl->u.ip4;
> > +     fl4->saddr =3D sa->v4.sin_addr.s_addr;
> > +     fl4->fl4_sport =3D sa->v4.sin_port;
> > +     fl4->daddr =3D da->v4.sin_addr.s_addr;
> > +     fl4->fl4_dport =3D da->v4.sin_port;
> > +     fl4->flowi4_proto =3D IPPROTO_UDP;
> > +     fl4->flowi4_oif =3D sk->sk_bound_dev_if;
> > +
> > +     fl4->flowi4_scope =3D ip_sock_rt_scope(sk);
> > +     fl4->flowi4_dscp =3D inet_sk_dscp(inet_sk(sk));
> > +
> > +     rt =3D ip_route_output_key(sock_net(sk), fl4);
> > +     if (IS_ERR(rt))
> > +             return PTR_ERR(rt);
> > +
> > +     if (!sa->v4.sin_family) {
>
> The above check is strange. Any special reason to not use
> quic_v4_is_any_addr()?
>
quic_v4_is_any_addr() looks better, will try to replace it.

> > +             sa->v4.sin_family =3D AF_INET;
> > +             sa->v4.sin_addr.s_addr =3D fl4->saddr;
> > +     }
> > +     sk_setup_caps(sk, &rt->dst);
> > +     return 0;
> > +}
> > +
> > +static int quic_v6_flow_route(struct sock *sk, union quic_addr *da, un=
ion quic_addr *sa,
> > +                           struct flowi *fl)
> > +{
> > +     struct ipv6_pinfo *np =3D inet6_sk(sk);
> > +     struct ip6_flowlabel *flowlabel;
> > +     struct dst_entry *dst;
> > +     struct flowi6 *fl6;
> > +
> > +     if (__sk_dst_check(sk, np->dst_cookie))
> > +             return 1;
> > +
> > +     memset(fl, 0x00, sizeof(*fl));
> > +     fl6 =3D &fl->u.ip6;
> > +     fl6->saddr =3D sa->v6.sin6_addr;
> > +     fl6->fl6_sport =3D sa->v6.sin6_port;
> > +     fl6->daddr =3D da->v6.sin6_addr;
> > +     fl6->fl6_dport =3D da->v6.sin6_port;
> > +     fl6->flowi6_proto =3D IPPROTO_UDP;
> > +     fl6->flowi6_oif =3D sk->sk_bound_dev_if;
> > +
> > +     if (inet6_test_bit(SNDFLOW, sk)) {
> > +             fl6->flowlabel =3D (da->v6.sin6_flowinfo & IPV6_FLOWINFO_=
MASK);
> > +             if (fl6->flowlabel & IPV6_FLOWLABEL_MASK) {
> > +                     flowlabel =3D fl6_sock_lookup(sk, fl6->flowlabel)=
;
> > +                     if (IS_ERR(flowlabel))
> > +                             return -EINVAL;
> > +                     fl6_sock_release(flowlabel);
> > +             }
> > +     }
> > +
> > +     dst =3D ip6_dst_lookup_flow(sock_net(sk), sk, fl6, NULL);
> > +     if (IS_ERR(dst))
> > +             return PTR_ERR(dst);
> > +
> > +     if (!sa->v6.sin6_family) {
>
> (similar question here)
>
right.

> [...]
> > +static int quic_v4_get_mtu_info(struct sk_buff *skb, u32 *info)
> > +{
> > +     struct icmphdr *hdr;
> > +
> > +     hdr =3D (struct icmphdr *)(skb_network_header(skb) - sizeof(struc=
t icmphdr));
>
> Noting the above relies on headers being already pulled in the linear
> part. Later patch will do skb_linarize(), but that looks overkill and
> should hit performance badly. Instead you should use pskb_may_pull() &&
> friends.
This path (ICMP error path) doesn't need to parse frames and bundled
packets, so yes we can use pskb_may_pull().

However, in the normal QUIC packet receive path:

- for short header packet path, the packet format is:

Before decryption:

  UDP hdr | QUIC hdr | conn_id | encrypted text

After decryption:

  UDP hdr | QUIC hdr | conn_id | frame1 hdr | frame1 data | frame2 hdr
   | frame2 data ...

When parsing the frames, it's hard to do it without linearizing the
skb, also fields in these frame headers are always variable-length
integers, making the parsing more difficult if it's not a linearized
buffer.

- for long header (handshake) packet path, more complex, packets can
  be bundled like:

  UDP hdr | QUIC hdr1 | encrypted text | QUIC hdr2 | encrypted text |
  ...

>
> > +     if (hdr->type =3D=3D ICMP_DEST_UNREACH && hdr->code =3D=3D ICMP_F=
RAG_NEEDED) {
> > +             *info =3D ntohs(hdr->un.frag.mtu);
> > +             return 0;
> > +     }
> > +
> > +     /* Defer other types' processing to UDP error handler. */
> > +     return 1;
> > +}
> > +
> > +static int quic_v6_get_mtu_info(struct sk_buff *skb, u32 *info)
> > +{
> > +     struct icmp6hdr *hdr;
> > +
> > +     hdr =3D (struct icmp6hdr *)(skb_network_header(skb) - sizeof(stru=
ct icmp6hdr));
> > +     if (hdr->icmp6_type =3D=3D ICMPV6_PKT_TOOBIG) {
> > +             *info =3D ntohl(hdr->icmp6_mtu);
> > +             return 0;
> > +     }
> > +
> > +     /* Defer other types' processing to UDP error handler. */
> > +     return 1;
> > +}
> > +
> > +static u8 quic_v4_get_msg_ecn(struct sk_buff *skb)
> > +{
> > +     return (ip_hdr(skb)->tos & INET_ECN_MASK);
> > +}
> > +
> > +static u8 quic_v6_get_msg_ecn(struct sk_buff *skb)
> > +{
> > +     return (ipv6_get_dsfield(ipv6_hdr(skb)) & INET_ECN_MASK);
> > +}
> > +
> > +static int quic_v4_get_user_addr(struct sock *sk, union quic_addr *a, =
struct sockaddr *addr,
> > +                              int addr_len)
> > +{
> > +     u32 len =3D sizeof(struct sockaddr_in);
> > +
> > +     if (addr_len < len || addr->sa_family !=3D AF_INET)
> > +             return 1;
> > +     if (ipv4_is_multicast(quic_addr(addr)->v4.sin_addr.s_addr))
> > +             return 1;
> > +     memcpy(a, addr, len);
> > +     return 0;
> > +}
>
> It looks like the above function is not used in this series?!? (well
> it's called by quic_get_user_addr() which in turn is unsed.
>
> Perhaps drop from here and add later as needed?
Sure, I will drop:

quic_seq_dump_addr()
quic_get_msg_ecn()
quic_get_user_addr()
quic_get_pref_addr()
quic_set_pref_addr()
quic_set_sk_addr()
quic_set_sk_ecn()

>
> Also the name sounds possibly misleading, I read it as it should copy
> data to user-space and return value could possibly be an errnum.
>
Maybe quic_get_addr_from_user()? and I will return -EINVAL instead
of 1 in the err path.

> > +static void quic_v4_get_pref_addr(struct sock *sk, union quic_addr *ad=
dr, u8 **pp, u32 *plen)
> > +{
> > +     u8 *p =3D *pp;
> > +
> > +     memcpy(&addr->v4.sin_addr, p, QUIC_ADDR4_LEN);
> > +     p +=3D QUIC_ADDR4_LEN;
> > +     memcpy(&addr->v4.sin_port, p, QUIC_PORT_LEN);
> > +     p +=3D QUIC_PORT_LEN;
> > +     addr->v4.sin_family =3D AF_INET;
> > +     /* Skip over IPv6 address and port, not used for AF_INET sockets.=
 */
> > +     p +=3D QUIC_ADDR6_LEN;
> > +     p +=3D QUIC_PORT_LEN;
> > +
> > +     if (!addr->v4.sin_port || quic_v4_is_any_addr(addr) ||
> > +         ipv4_is_multicast(addr->v4.sin_addr.s_addr))
> > +             memset(addr, 0, sizeof(*addr));
> > +     *plen -=3D (p - *pp);
> > +     *pp =3D p;
> > +}
>
> Similarly unused?
>
> > +static bool quic_v4_cmp_sk_addr(struct sock *sk, union quic_addr *a, u=
nion quic_addr *addr)
> > +{
> > +     if (a->v4.sin_port !=3D addr->v4.sin_port)
> > +             return false;
> > +     if (a->v4.sin_family !=3D addr->v4.sin_family)
> > +             return false;
> > +     if (a->v4.sin_addr.s_addr =3D=3D htonl(INADDR_ANY) ||
> > +         addr->v4.sin_addr.s_addr =3D=3D htonl(INADDR_ANY))
> > +             return true;
> > +     return a->v4.sin_addr.s_addr =3D=3D addr->v4.sin_addr.s_addr;
> > +}
> > +
> > +static bool quic_v6_cmp_sk_addr(struct sock *sk, union quic_addr *a, u=
nion quic_addr *addr)
> > +{
> > +     if (a->v4.sin_port !=3D addr->v4.sin_port)
> > +             return false;
> > +
> > +     if (a->sa.sa_family =3D=3D AF_INET && addr->sa.sa_family =3D=3D A=
F_INET) {
> > +             if (a->v4.sin_addr.s_addr =3D=3D htonl(INADDR_ANY) ||
> > +                 addr->v4.sin_addr.s_addr =3D=3D htonl(INADDR_ANY))
> > +                     return true;
> > +             return a->v4.sin_addr.s_addr =3D=3D addr->v4.sin_addr.s_a=
ddr;
> > +     }
> > +
> > +     if (a->sa.sa_family !=3D addr->sa.sa_family) {
> > +             if (ipv6_only_sock(sk))
> > +                     return false;
> > +             if (a->sa.sa_family =3D=3D AF_INET6 && ipv6_addr_any(&a->=
v6.sin6_addr))
> > +                     return true;
> > +             if (a->sa.sa_family =3D=3D AF_INET && addr->sa.sa_family =
=3D=3D AF_INET6 &&
>
> Below this code assumes that sa_family is either AF_INET or AF_INET6. If
> such assumtion hold, you should use here, too. and drop the
> 'addr->sa.sa_family =3D=3D AF_INET6' condition.
I agree.

>
> > +                 ipv6_addr_v4mapped(&addr->v6.sin6_addr) &&
> > +                 addr->v6.sin6_addr.s6_addr32[3] =3D=3D a->v4.sin_addr=
.s_addr)
> > +                     return true;
> > +             if (addr->sa.sa_family =3D=3D AF_INET && a->sa.sa_family =
=3D=3D AF_INET6 &&
> > +                 ipv6_addr_v4mapped(&a->v6.sin6_addr) &&
> > +                 a->v6.sin6_addr.s6_addr32[3] =3D=3D addr->v4.sin_addr=
.s_addr)
> > +                     return true;
>
> Nothing this branch does not handle the 'ipv6_addr_any(&addr->v6.sin6_add=
r)'
>
Will add a helper:

static bool quic_v4_match_v6_addr(union quic_addr *a4, union quic_addr *a6)
{
        if (ipv6_addr_any(&a6->v6.sin6_addr))
                return true;
        if (ipv6_addr_v4mapped(&a6->v6.sin6_addr) &&
            a6->v6.sin6_addr.s6_addr32[3] =3D=3D a4->v4.sin_addr.s_addr)
                return true;
        return false;
}

and change this branch to:

                if (a->sa.sa_family =3D=3D AF_INET)
                        return quic_v4_match_v6_addr(a, addr);
                return quic_v4_match_v6_addr(addr, a);

Thanks.

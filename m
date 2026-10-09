Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4319330307
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  9 Oct 2026 01:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510936; cv=pass; b=l+/Go036LIjvS3oZQy8d/1Xtt8+y5vq//srW4TWKqcViR/Al4IvV1ud0XH80IBC2kat/kPAzgMaHlL0j/93zsVS3O/MWyc2kS08T7sswS5dA05Ma1lY+BE8UiaMcdr6nxoemQXuqyMkuZER5Ks0TluvEhwOXcIxUp9jRspbNGp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510936; c=relaxed/simple;
	bh=35fIWUdY0+PUqZkYVHqyYWSj8S/8qpG3+Jwu5f2fVSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHG4Cjl0ZLF55P4HVrWCSAvy05jnEG77K8XqLzHMePV2milsRgArXuQe+JYjW9f6DhCOnmYcewKY5wwCiDU0MyDMbwKIZ2ZgSMEUomdlbVm0zrqitcPivPok7PCyhrPwUUNkkLuaEBdd5i7a1RCoEPf54dhjinn8CSDSfYTr9ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOM5CNWF; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOM5CNWF"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-892734ce7e6so1167853b3a.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 08 Oct 2026 18:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791510934; cv=none;
        d=google.com; s=arc-20260327;
        b=r5pH0BmmW/EO4QsRK1ScIBblSY7xSpeUCsYHioXXy/7zyQVEzAgo9dd+kR0s9ZLHec
         FtKLTxu5TbRuK8TN/B7JOoGg4nc6DHUcfCo3LWPi04p4/c6pQ05z07EaxEG5iqddLN7b
         NfL1e6qd/16f1XGQRf7gBWnkThyJwCY/zQiZmFVe9wqCf3DcfpEwfJYc5xyemIFsqQGx
         86s5Fvwled4/XUODmxDdxFq5OoXe0+WBNJK405KB9MZuS25gxJGBDOSuJUN6DNZlfCnl
         SiD9nvihdjFGzUjqsk1XJ6b4m3K8lvpEILvJ5AUxqEHcaMtwt1OSCc3DKaR2yg21+Wvn
         ejpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bKGCaBNhIQly2LY7lY+NOmyJ6aI0Yd/h629XMH7wx3Q=;
        fh=olQgNdV/Tm1nn7OMCnUsbLoS3jthGAKfYrbFXT96zPo=;
        b=WJljcZzhiSa1YcsRQuIRY5sTPYz7O8vFfDVEkGMZ5txXURlUhdxn13woqim4d9gnhH
         qwblyIBNGtbr/n0NZxMdzyTghLA0fEsBu6HGhipLuM4dQVl1lC7ne64tTgq4eLjJAGgM
         0YKICaee6RWcRh/V5WsCYrSAx1AwsBmH6JwvMjxRCcrstJox+dvk9Hf6DEs6dXzd7AV9
         PGTPG0E27/N+AoteuD37tSh6QDWmmIDUQSaMr5xUfNHrIJNaO5QCPXVE34EbIZjc58A1
         CBnRxn6fbMxfr79Imt6eB+2pnVl0c5ONXzfPa3kIXgaH82Q9rAewJ0A206xVxHoBBKQw
         EvPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510934; x=1792115734; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bKGCaBNhIQly2LY7lY+NOmyJ6aI0Yd/h629XMH7wx3Q=;
        b=QOM5CNWF0Jw399wv+egUZtwQuRqJ0WpMCUEY8mkodE0GRYSYY2fQ9eGj583h4VpW//
         gz1BKTB47NjJiU13xTWQsqRhc6Pn0Deq74OIs87ysz0dGhw+GNieuit4OcS12Jqxo4Cs
         HIingutUQA5rEStZN0bIaKS1sT6HfU08Lw2Zq7z/17djspsgGeEGvC9r52lX3i53EwRH
         A8w9/xRLaJZbzoRGft8qOtTHyfJ0DOEG3XPW/lIVtYz48Crs//FYdt7WZUV3IUE72raL
         W+8Dj3OYDkO2J9JPLi4WNh2Ddkv9GCzzFKMaf+S7iwWqcGvIONlSjmZFDKwIpJ09kxby
         aAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510934; x=1792115734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKGCaBNhIQly2LY7lY+NOmyJ6aI0Yd/h629XMH7wx3Q=;
        b=mFgazEuVVc6rOxbHJWcWndTBi1Pu0BZoDXzQp0M0LC0nwRLw6LR/8qIsOqzNprlmPV
         38TVE9yxTTq6SIaRVMmty+X1zj3uLHPDj7e2CpC3Q30XAIKjl9NpR6PDlUHTG8s2jqFK
         kyFB2Q2xpsocbemWjqwT+MJ20KF6HoBlEMS45MxtUhSNF1G8r4iK3krjFBKQgPXm7QjE
         MFZQBTfAihBfMoW6dIx1d7zVYcOv5/h4d5T8Guw/v0y9ap22rq0l7fkh/KB1uz9qZtAI
         doPhr3DRLWELRjEE9kWYc8nvTBhDcYrNJUl4qtBMeUA04EyMC1RdXiTdG94mEfPdPTQY
         taTw==
X-Forwarded-Encrypted: i=1; AKwUvBz4noUU+27qpRnxjrtpiC+EFAlLW1C3HSM8fYgdoN3FVDiY2VN7uhJ42lmDDvGmr8axjGmV8RBLJOHG16+aWNhKxeFwpg==@lists.linux.dev
X-Gm-Message-State: AFq9FYL2ZY7dTetf/j69tVdJjjV8df12SCh85b8V/Gd2qDk0K0MixdtI
	jN+OEHdOuWbsFonQcczcxEbR7u4lWBlRx/PBmmQZaqdP/+jvBi0SZDGSxb0P1eYpxkSBMJPv2hw
	FDcu75wJJfaNDrIQVcGdMpLYtd5zrN4Y=
X-Gm-Gg: AYBFou3Mh79MRsJOgWj9gC7528qQDHkNAlGVGhQqzOBXT3bDFIEyNtZ1AYQwYlCa0RR
	788Vtu+LpZJ4Kp5Ds6v1d6cDXy0/flBlbo5zUAuGd12dhXDNgRyn6sm6RVAGXp+RJVRwduVsl44
	Pibv/aps89+6T6rRuPBj92aZTwTI9qL1JAW33lBEU0KkpC/Rem6Pc+K1wS16sSPZIoc/1vksCuo
	o0+5+jkfzJxkkAdsWNi2LalyEEqJr+/50Q89iUcjTiGI32VTJPh3ihOvQ6N1OBU0kdZic8z4nGN
	c61+qmdCYvDE9GzNIGC1gNHQ0185T0GvU9Y4JlUkABpxq+EsFpT942SChXYaAhwJIdg+vV502e9
	4xHo3qU6QtTx2zFuYXEbVp0MghvitdySXHJZ2aInlmB0/kJvoCaxr
X-Received: by 2002:a05:6a00:2887:b0:881:4b47:f30b with SMTP id
 d2e1a72fcca58-897c6443587mr353692b3a.12.1791510933832; Thu, 08 Oct 2026
 18:55:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <333607babf249e24fe90625d7abb7625b97c0b50.1791227050.git.lucien.xin@gmail.com>
 <179133512872.434549.11248338098140405125@kernel.org>
In-Reply-To: <179133512872.434549.11248338098140405125@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 8 Oct 2026 21:55:21 -0400
X-Gm-Features: AclHuK8bQc1UycT-_KEl0eTokTRsi7auN1Ri9mWxKSe-T9TNyMx8BTQMr8J1Amw
Message-ID: <CADvbK_crkLjX2D+nu4LE16UpcQkUFa9DUp59hVKcXeTHxZXMHA@mail.gmail.com>
Subject: Re: [PATCH net-next v16 15/15] quic: add packet parser base
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
> Thank you for your contribution! Sashiko AI review found 7 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 3 =C2=B7 Low: 4
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The permanent commit message (the part above '---') describes
>   much less than the patch does, and some of it is wrong.
> - [Medium] When PLPMTUD is disabled (paths->plpmtud_interval =3D=3D 0, th=
e
>   default in this tree because nothing sets it),=E2=80=A6
> - [Medium] quic_packet_listen_process() replies to, and creates state
>   for, long-header packets of any size.
> - [Low] The kernel-doc for quic_listen_sock_lookup() in net/quic/socket.c
>   says that when several listening sockets share the same address, port=
=E2=80=A6
> - [Low] The patch adds definitions that nothing in this commit uses.
> - [Low] struct quic_packet in net/quic/packet.h documents `daddr` as
>   'Dest address from received packet' and `saddr` as 'Source address=E2=
=80=A6
> - [Low] The header comment of quic_packet_deferred_work() (packet.c:776)
>   reads 'Work function to process packets in the backlog queue', but the=
=E2=80=A6
>
> --
>
> quic: add packet parser base
>
> This commit adds the QUIC receive path. quic_packet_rcv() finds the
> owning socket by connection ID, by address, or through the listener, then
> passes the packet to quic_packet_process(). The patch also adds
> listen-side Initial handling, request sockets, ALPN-based listener
> switching through a per-socket work item, and ICMP Packet Too Big
> handling through quic_packet_rcv_err() and quic_packet_rcv_err_pmtu().
>
> > This patch uses 'quic_packet' to handle packing of QUIC packets on the
> > receive (RX) path.
>
> [ ... ]
>
> > - quic_packet_get_alpn(): Parse the ALPN from a client Initial packet,
> >   then locate the appropriate listener using the ALPN.
>
> [ ... ]
>
> > - quic_packet_rcv_err_pmtu(): Find the socket and update the PMTU via
> >   quic_packet_mss_update().
>
> [Severity: Medium]
> Some parts of the commit message don't match the code.
>
> Should "packing" in the first sentence be "parsing"?
>
> quic_packet_get_alpn() installs the Initial keys, decrypts the packet and
> parses the ALPN list. It doesn't look up a listener. The lookup and the
> switch happen in quic_listen_sock_switch() in net/quic/socket.c.
>
> For ICMP errors, the socket lookup is done in quic_packet_rcv_err(), not
> in quic_packet_rcv_err_pmtu().
>
> The message also leaves out much of what the patch adds:
>
>   - quic_packet_listen_process(), with token verification and the
>     Stateless Reset, Version Negotiation, Retry and CONNECTION_REFUSED
>     triggers
>   - struct quic_request_sock and quic_request_sock_lookup(),
>     quic_request_sock_create() and quic_request_sock_backlog_tail(),
>     which charge sk_ack_backlog and receive memory
>   - the per-socket work_struct with deferred_list/backlog_list on
>     quic_wq, and flush_work() in quic_packet_free()
>   - quic_accept_sock_exists() and quic_listen_sock_switch()
>   - quic_backlog_rcv() now processing packets instead of dropping them
>   - the ALPN free moving from quic_destroy_sock() to quic_sock_destruct()
>
True.

These updates were added only to the last version, and
I will also reflect them on the commit message.

> Most of this is described only in the changelog below the --- line, and
> git am drops that part. Could the permanent commit message cover these
> pieces?
>
> > diff --git a/net/quic/packet.c b/net/quic/packet.c
> > index 56d2b8df292a0..673f1cd491438 100644
> > --- a/net/quic/packet.c
> > +++ b/net/quic/packet.c
> > @@ -14,6 +14,781 @@
> >
> >  #define QUIC_HLEN            1
> >
> > +#define QUIC_LONG_HLEN(dcid, scid) \
> > +     (QUIC_HLEN + QUIC_VERSION_LEN + 1 + (dcid)->len + 1 + (scid)->len=
)
>
> [Severity: Low]
> This isn't a bug, but nothing in this patch uses QUIC_LONG_HLEN().
>
> Two of the new struct quic_packet members are in a similar state.
>
> backlog_list is described as "Packets waiting for crypto keys". It is
> only initialized in quic_packet_init() and purged in quic_packet_free(),
> and nothing enqueues to it yet.
>
> quic_packet_listen_process() reads validate_peer_address, but nothing
> ever sets it, so the token validation and Retry branch can't be reached:
>
>         if (packet->validate_peer_address) {
>
> The changelog says these are staged for the next patchset. Could they be
> added together with the code that uses them? Failing that, could the
> backlog_list comment describe what the field does today?
>
> [ ... ]
>
> > +/* Process PMTU reduction event on a QUIC socket. */
> > +void quic_packet_rcv_err_pmtu(struct sock *sk)
> > +{
>
> [ ... ]
>
> > +     info =3D clamp(paths->mtu_info, QUIC_PATH_MIN_PMTU, QUIC_PATH_MAX=
_PMTU);
> > +     /* If PLPMTUD is not enabled, update MSS using route and ICMP inf=
o. */
> > +     if (!paths->plpmtud_interval) {
> > +             if (quic_packet_route(sk))
> > +                     return;
> > +
> > +             dst =3D __sk_dst_get(sk);
> > +             if (dst)
> > +                     dst->ops->update_pmtu(dst, sk, NULL, info, true);
> > +             quic_packet_mss_update(sk, info - packet->hlen);
>
> [Severity: Medium]
> Can a Packet Too Big that reports a larger MTU than the current path MTU
> raise the MSS here?
>
> info is only clamped to [QUIC_PATH_MIN_PMTU, QUIC_PATH_MAX_PMTU], and
> quic_packet_mss_update() stores whatever it is given. The route layer
> ignores increases:
>
> net/ipv4/route.c:__ip_rt_update_pmtu() {
>     ...
>         old_mtu =3D ipv4_mtu(dst);
>         if (old_mtu < mtu)
>                 return;
>     ...
> }
>
> __ip6_rt_update_pmtu() also returns early when mtu >=3D dst6_mtu(dst).
>
> Nothing in this tree sets plpmtud_interval, so this branch is the
> default. A delayed or spoofed ICMP that arrives through quic_udp_err()
> -> quic_packet_rcv() -> quic_packet_rcv_err() -> quic_packet_rcv_err_pmtu=
()
> and claims 9000 on a 1500-byte path would set the MSS to 9000 - hlen.
>
> The route is left unchanged, so the cached dst stays valid. Later
> quic_packet_route() calls then get 1 back from quic_flow_route() and
> never recompute the MSS from dst_mtu().
>
> Would it be safer to re-read dst_mtu(dst) after update_pmtu(), or to only
> ever lower the MSS, as tcp_v4_mtu_reduced() does?
>
True.

Will follow the suggestion to re-read it after update_pmtu():

    info =3D dst_mtu(dst);

> [ ... ]
>
> > +static int quic_packet_listen_process(struct sock *sk, struct sk_buff =
*skb,
> > +                                   gfp_t gfp)
> > +{
>
> [ ... ]
>
> > +     if (!quic_packet_compatible_versions(version)) {
> > +             /* rfc9000#section-6.1:
> > +              *
> > +              * If the version selected by the client is not acceptabl=
e to
> > +              * the server, the server responds with a Version Negotia=
tion
> > +              * packet. This includes a list of versions that the serv=
er
> > +              * will accept.
> > +              */
> > +             err =3D quic_packet_version_create_and_xmit(sk, gfp);
> > +             consume_skb(skb);
> > +             return err;
> > +     }
>
> [Severity: Medium]
> Is a minimum datagram size check missing before this reply?
>
> RFC 9000 sections 5.2.2 and 6.1 say a server MUST drop smaller packets
> that specify an unsupported version. Section 14.1 says a server MUST
> discard an Initial packet in a UDP datagram whose payload is smaller than
> 1200 bytes.
>
> On the receive path nothing compares skb->len with QUIC_MIN_UDP_PAYLOAD.
> quic_packet_rcv() and quic_packet_get_sock() only require
> skb->len >=3D QUIC_HLEN.
>
> Packets of any size can therefore reach the Version Negotiation reply
> above, the Retry and refuse-close paths, and this call further down:
>
>         req =3D quic_request_sock_create(sk, &odcid, retry, gfp);
>
> When ALPN demux is disabled, the Length field isn't parsed at all. A
> 16-byte spoofed long-header Initial (8-byte DCID, empty SCID, empty
> token) would allocate a quic_request_sock and call sk_acceptq_added().
>
> Could a burst of these fill the accept queue, so that legitimate clients
> hit sk_acceptq_is_full() and get CONNECTION_REFUSED?
>
> Once the Version Negotiation and Retry builders are implemented, would
> they also reply to spoofed sources for these small datagrams?
>
True.

Will add a check for udp_hdr(skb)->len against QUIC_MIN_UDP_PAYLOAD here.

Thanks.

> [ ... ]
>
> > +/* Work function to process packets in the backlog queue. */
> > +static void quic_packet_deferred_work(struct work_struct *work)
> > +{
>
> [ ... ]
>
> > +     head =3D &quic_packet(sk)->deferred_list;
>
> [Severity: Low]
> This isn't a bug, but the comment says "backlog queue" while the function
> drains deferred_list. struct quic_packet now has a separate backlog_list,
> so should the comment say deferred list instead?
>
> [ ... ]
>
> > diff --git a/net/quic/packet.h b/net/quic/packet.h
> > index cf0b97112d9b1..4a7bcf959e997 100644
> > --- a/net/quic/packet.h
> > +++ b/net/quic/packet.h
> > @@ -14,6 +14,8 @@ struct quic_packet {
> >       union quic_addr daddr;    /* Dest address from received packet */
> >       union quic_addr saddr;    /* Source address from received packet =
*/
>
> [Severity: Low]
> These comments seem reversed compared to how this patch fills the fields.
>
> quic_get_msg_addrs() takes (skb, da, sa), and quic_packet_listen_process(=
)
> calls it like this:
>
>         quic_get_msg_addrs(skb, &packet->saddr, &packet->daddr);
>
> The inline comment there says "Read Destination address (packet->saddr)
> and Source address (packet->daddr)".
>
> So packet->saddr holds the received packet's destination (local) address
> and packet->daddr holds its source (peer) address. The users,
> quic_crypto_verify_token(), quic_accept_sock_exists() and
> quic_listen_sock_switch(), all follow that convention.
>
> Could the struct comments be changed to match?
>
> [ ... ]
>
> > diff --git a/net/quic/socket.c b/net/quic/socket.c
> > index 0173416d0368a..be8dc30f8208a 100644
> > --- a/net/quic/socket.c
> > +++ b/net/quic/socket.c
>
> [ ... ]
>
> > +/* Find the listening QUIC socket for an incoming packet.
> > + *
> > + * This function searches the QUIC socket table for a listening socket=
 that
> > + * matches the dest address and port, and the ALPN(s) if presented in =
the
> > + * ClientHello.  If multiple listening sockets are bound to the same a=
ddress,
> > + * port, and ALPN(s) (e.g., via SO_REUSEPORT), this function selects a=
 socket
> > + * from the reuseport group.
>
> [Severity: Low]
> This isn't a bug, but the function body doesn't select from a reuseport
> group.
>
> It walks the hash chain with sk_nulls_for_each_rcu() and returns the
> first specific-address match, or an ANY-address candidate. It never calls
> reuseport_select_sock() or looks at sk_reuseport_cb.
>
> The v16 changelog says reuseport_select_sock() moved to the next
> patchset. Should this part of the comment move with it?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1791227050.git.lucien.xin%40gmail.com

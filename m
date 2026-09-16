Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFF34B2CA0
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 16:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575663; cv=pass; b=RIR4onVpmnrD5VWofyOscoNEqiC3ZJCUSpqsR3OeWv6icTPdzf5tWSPdOWekq8c6BxYerd/eJ7mAUoHxuJBGTR8pwFXNBJ+8yorCwZ9uoqKnFUuwinlUdpAgG89t03vre6Nk2OM99r4bNoR0xnjAGwBH0hN2xNBcj4lGlt/jN84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575663; c=relaxed/simple;
	bh=FPz/2WUVvjgw7KkPB3vp0v3QrEeT+i8/AjpDko6jgx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AahWrggJ0e91t5wtZA9OyOeYBY7CcoY/GVhW9vaSNd1BZ2LGtgWDbdU3DhfHDKEP0K3W36f1QnxOA69eVat5L7DukJ2PHJXgDlrAM3Y08c9VT2Lrik8DAgK7GhC17hSPjz+ivEAgfHI/2KSSMHLmu2+L27NKodNs4QIgft9uTM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6gq4a8H; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6gq4a8H"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e211a3so876779b3a.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 09:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789575659; cv=none;
        d=google.com; s=arc-20260327;
        b=mGX+GK10v4wyEbdH3f0rzw4PaIv3Qu8nlw8cq1NApFAQybro/DgY2vtYYjhcID6cX3
         C6d/53yBBNckkgQ2edQHfQpKv9e2OgheMc06dqeW0RvkWlFFLn2h25+ke9USsDpWJ+tf
         3gfLX9uOp5FShASG4rSc0jJAMqUWWr6HhaTO1NO7eMYNKj8DBJueL3xgixeq0LD9/WUb
         /7iWDsM9ij9a+jah6W2IDk4pbPkZtdtQBYf366BHIEd+xxL3rZ4AY8V7+fpT6DJ8Ph+H
         PrFtE7KDBErn0TGCCD3ZJCtoeCuMJs7NuJ8sH/gYfX8XIKwBPbsOyWx2/Xszbvrpnh+J
         4aVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x758SQiPr4F20CkTzm4wFsu2ipWDv2Ry++hF6Myngkc=;
        fh=/x92k+bvOX+evG1ogbZoXEbKJY2UunZlRt8umDOcMxQ=;
        b=bVaqGkMYxlmNfZgGDcPU4yiwqtarf9pd09siWcwOa5d2lZxmepjphMMR0EpRwL6gru
         NYQKi8hSgd0b8ggrg6M6Urp54Uq2Xw6WNuhnrkT/7MmvxtKrwv7wkPwV3cuv/w+XJ4cm
         9nGb2YGznqbsBhF7srKiQmvcKFTBpIJSJnVTqc0UNbqYpZoxpHfTfK3tCsujYb907yV9
         yYGAcgS7+LsKyRkfgH+85yyhVSmw4EWaARPgolhoSRTwPtnBhmDwFx3oLXSqQhVHuGog
         d1yP1D6RitUL+qzcQbtZ+NxhJ8DGd+2RU58XLtv/qq2Gim2Yf7TjVe35EUy+SAWx08aM
         DjIw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789575659; x=1790180459; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x758SQiPr4F20CkTzm4wFsu2ipWDv2Ry++hF6Myngkc=;
        b=L6gq4a8Hfa2nVRne5+076j+9dF/HmpZZ37UXNtAZa6iisj1A2Z8kHW8+AAV8puvqpS
         1JHk6F9gPgZXuAq6TXkG0GwHsXIY6MpDfwCb118B/u/DR5qtFsbMNpov2Zg2pw/NFG/p
         POOC/Lf1cmN3/38m6QWymObvsmmNRPXN09cZri6Lraf1RWQ0yq41Pg6vpm8KUfsXMZF4
         NoYbcSYiBHOsAql9oD2oaKHrZQzdz1hw3OX1i0jnxZBk1+qVjoVzG0ZlhdKENOBQwSwq
         Zzor4ILe8BBwP/Et6HrqDMq7e7Nu8iJtwTtdIqZYoNkmOHRbxlA7HW2vR6kGjzgvJuwW
         oRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575659; x=1790180459;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x758SQiPr4F20CkTzm4wFsu2ipWDv2Ry++hF6Myngkc=;
        b=qcaEPOQISW/rdXdUvgbrncwuSGElE7tnp7qnS3oIXEbTBCFRe2JkNY5/waY58MYK2J
         IIRybs/HJeHjopEhBEMnk4DcNO7Z3MROEbi0DnOGuUXwM7Kto/8E/8T3WGTjyHhliXom
         eM4YTAB07MJmsVuQGOx7yTFkXYJD9lB195Zz/64FFEnxS9r4Cue0Bfj5UplytDzyA2qi
         v8T5mgLkpVCxTbrZDrD6hDexs4ZS8d/3hHJf1gTMstEfR+8ZraxAemHWaxovAjdTToHh
         oO9FxACkeedA9OirjpexvkRUvs2oYO3OnMzTnmFH4S49gDN3A4/t+a3822M4PDuXww+A
         hb2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxC2Nvhpr7JfLDWquZRPlqR6utu0lkQ4S15PJmVXyMPzAt5ydrXko+d6OHnp7Tv+4HCsHbZtacL6GUB1sw/8sX4PicB7Q==@lists.linux.dev
X-Gm-Message-State: AFuF++mmkw+VhxIBVLXV/YQwu02ZGSIA7m+PzxN4dfH9Ro+cuyBeoMIP
	ALa/ybr5oA4vXAmII9d2xCru95YbP9u6z9J6WiUKdYxqMu0o/Kk1L3hiDiktxMgZ/udKChkhZHb
	Ba4Uo2KGID89tl7niWH9FGCDrdtFbrAs=
X-Gm-Gg: AYBFou1PDL+cBeffcX4dIFFZwv185WstEEBk6eeFCQPDmKL+mApmEwFTpGMxYGGUi6q
	GNHDka8UI0jm9tFH4oex/OFVPxzGb96aoFq36Yy+pz5Z6iMPSu9qpj1FXnAtE5yPPLmlcN+Vi6Q
	GS0VjYxb7Q8KHfsriwU+EIBck7LafxeQ9dy8zGl4legGcnsCc0E23zGIHV40OKBQnveXaamybIK
	CCdvfGhZMReSmZ5ZhFIghXd3Qw7ONzZiSfmyl84qQFtCyDSkjXdAPVDj+1WTh8BBLl9rFLrCB1M
	e79/x4Ncrv7RQw9ULgiSRgbYBNxPIXOH8NZabT6pucp+KD2ErsNtaVZOia6nu/k/31uAgMAHpjv
	kku2aQ73dDdO8INtmlLmFWPBvJWrkqHcgFg9aMkr1rEcQqGq4fsMQl/OD
X-Received: by 2002:a05:6a00:1888:b0:84a:60a4:2651 with SMTP id
 d2e1a72fcca58-87238c8aad3mr5950497b3a.6.1789575659295; Wed, 16 Sep 2026
 09:20:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <927bfa67165193368d642396c4b8fcfc580d494d.1789393775.git.lucien.xin@gmail.com>
 <178950185914.22033.7074901863240008115@kernel.org>
In-Reply-To: <178950185914.22033.7074901863240008115@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 16 Sep 2026 12:20:47 -0400
X-Gm-Features: AcwNN1XmGdIGcCY3hppZmiydWNjDn39LITr2KKjk_zm8yrhQJrHdBYRINPy6wLg
Message-ID: <CADvbK_eN8x=MTceZrgNJRTGsGphQ2QsfJ0oNBET99VKBh=b9gA@mail.gmail.com>
Subject: Re: [PATCH net-next v15 14/15] quic: add packet builder base
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
	mef@scarletmail.rutgers.edu, paul@jakma.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 3:51=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 3
>
> - [Medium] Unit mismatch in quic_packet_route()
>   (net/quic/packet.c:63-66): the *IP-level* MTU returned by dst_mtu() is=
=E2=80=A6
> - [Low] Claim that the commit message over-advertises the packet builder:
>   quic_packet_handshake_create()/quic_packet_app_create()=E2=80=A6
> - [Low] In struct quic_packet (net/quic/packet.h:24) the field comment
>   reads 'u16 mss[2]; /* MSS for datagram and non-datagram packets */',=E2=
=80=A6
> - [Low] Claim that quic_packet_xmit() (net/quic/packet.c:199) must bail
>   out instead of only warning when skb_set_owner_sk_safe(skb, sk) fails,=
=E2=80=A6
>
> --
>
> quic: add packet builder base
>
> This adds net/quic/packet.c and net/quic/packet.h with the TX-side
> 'quic_packet' state: quic_packet_config() sets the path and computes head=
er
> overhead, quic_packet_create_and_xmit() builds and sends a packet, and
> quic_packet_flush() sends any bundled packets.  quic_packet_init() is wir=
ed
> into quic_init_sock().
>
> A few questions on the new code below.
>
> > diff --git a/net/quic/packet.c b/net/quic/packet.c
> > new file mode 100644
> > index 0000000000000..a1967f39c9242
> > --- /dev/null
> > +++ b/net/quic/packet.c
> > @@ -0,0 +1,280 @@
>
> [ ... ]
>
> > +static struct sk_buff *quic_packet_handshake_create(struct sock *sk, g=
fp_t gfp)
> > +{
> > +     return NULL;
> > +}
> > +
> > +static int quic_packet_number_check(struct sock *sk, gfp_t gfp)
> > +{
> > +     return 0;
> > +}
> > +
> > +static struct sk_buff *quic_packet_app_create(struct sock *sk, gfp_t g=
fp)
> > +{
> > +     return NULL;
> > +}
>
> [Severity: Low]
> This isn't a bug, but could the commit message list all of the placeholde=
rs?
>
> It mentions that "Functions to create application (short) and handshake
> (long) packets are currently placeholders for future implementation", whi=
ch
> covers quic_packet_handshake_create() and quic_packet_app_create() above,
> but quic_packet_encrypt_done() is also a stub that frees every
> asynchronously encrypted packet:
>
> net/quic/packet.c:quic_packet_encrypt_done() {
>         /* Free it for now, future patches will implement the actual defe=
rred
>          * transmission logic.
>          */
>         kfree_skb(skb);
> }
>
> Worth naming that one in the changelog too?
>
> [ ... ]
>
> > +/* Perform routing for the QUIC packet on the specified path, update h=
eader
> > + * length and MSS accordingly, reset path and start PMTU timer.
> > + */
> > +int quic_packet_route(struct sock *sk)
> > +{
> > +     struct quic_path_group *paths =3D quic_paths(sk);
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +     union quic_addr *sa, *da;
> > +     u32 pmtu;
> > +     int err;
> > +
> > +     da =3D quic_path_daddr(paths, packet->path);
> > +     sa =3D quic_path_saddr(paths, packet->path);
> > +     err =3D quic_flow_route(sk, da, sa, &paths->fl);
> > +     if (err)
> > +             return err < 0 ? err : 0;
> > +
> > +     packet->hlen =3D quic_encap_len(da);
> > +     pmtu =3D clamp(dst_mtu(__sk_dst_get(sk)),
> > +                  QUIC_PATH_MIN_PMTU, QUIC_PATH_MAX_PMTU);
> > +     quic_packet_mss_update(sk, pmtu - packet->hlen);
>
> [Severity: Medium]
> Are the units on both sides of this subtraction the same?
>
> The clamp floor is applied to the IP-level MTU returned by dst_mtu(), and
> packet->hlen (the full IP plus UDP encapsulation length from
> quic_encap_len(), 28 for IPv4 and 48 for IPv6) is subtracted afterwards.
> So for a route whose dst_mtu() is at or below 1228 (IPv4) the result is
> 1172, and at or below 1248 (IPv6) it is 1152:
>
>         pmtu  =3D clamp(dst_mtu(...), 1200, 65535);   /* IP MTU */
>         mss   =3D pmtu - packet->hlen;                /* UDP payload */
>
> That value then lands in packet->mss[QUIC_PACKET_MSS_NORMAL] and in
> congestion control via quic_packet_mss_update() -> quic_cong_set_mss(),
> and it is also the coalescing limit in quic_packet_bundle():
>
>         if (packet->head->len + skb->len >
>             packet->mss[QUIC_PACKET_MSS_NORMAL]) {
>
> Can that put the UDP payload size below the 1200-byte minimum that
> quic_packet_init() installs as QUIC_MIN_UDP_PAYLOAD, and below
> QUIC_BASE_PLPMTU (also 1200, in net/quic/path.c) that quic_path_pl_reset(=
)
> writes into paths->pl.pmtu two lines later?
>
> Note dst_mtu() can legitimately come back well under 1200 after a remote
> ICMP "fragmentation needed", which is presumably why the clamp is there a=
t
> all.  Should the floor be QUIC_MIN_UDP_PAYLOAD + packet->hlen, or the
> resulting MSS clamped to 1200 instead?
>
> The three 1200 constants in this codebase denote three different layers
> (net/quic/path.h QUIC_PATH_MIN_PMTU as an IP MTU floor, path.h
> QUIC_MIN_UDP_PAYLOAD as a UDP payload size, path.c QUIC_BASE_PLPMTU as a
> packetization-layer size), which makes this easy to mix up.
>
False:

QUIC_MIN_UDP_PAYLOAD is only used for the minimum size of the Initial
packet when building or parsing it. There is no requirement for it to match
QUIC_PATH_MIN_PMTU or QUIC_BASE_PLPMTU.

Thanks.

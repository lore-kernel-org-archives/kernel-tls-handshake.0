Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792531994;
	b=0VaOtPqstwL2bTjGdYOQqRwqNBzQFsZTJ2HQ2/jjAqHE4HRtyUmAbo7pwZGhnDmwvygr
	 EWCJXAcGvqRIrjSN4yzWvGCo4WWpbdFtjzQ+D9AIhebgbptRoI992JEzWmu3ixMJccrbA
	 9/XSaviC6MkJXu/39vz6YOYuUN+4Na8dSCPREwZchIOpXufRCfelijrwOGbcsWTZqxjKH
	 rD0j+yGB6Vlg1V6zvatFZhC7ryx7+Krn8DkOXg7kqr2c8ydZptDkzBn1w4jvfTuPmgJtZ
	 rzEd0eBtHCIVKwsWTM9SZkNXGn3gEhuUp4S+zs6LwnMDxl5pcup9NdC69kZmDr3G90g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792531994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2AgfGA8Z+ldUgBgGgA9RrGOTzaa/n9KB7xtFx5qm7gA=;
	b=c8pzIofVddkJRi8bp6k77sqUB6nqJTzu8TFzMS2RmHcV+qkbOlHpi9pzcN29GnnJbge4
	 8xfQhvdzpkNz2eSrxD6D3RtZxBxDXSMMxBX+icyojB1+6Qx1YVOUmewqNNwIPhbVeiv97
	 hgGr3e6ZdIU0an/Som87RBimETlXWI8cdNKmO/+teG3Sp79oO+YnpEYhhjwnvHG5+8Ctv
	 BhQyBYmwAVYEeH4AOmde3GV6hqXDXYAunxbGlrUPH1nDdoB+e9BvqzkEOPzF5Ok33RTXi
	 QYPgakvvALefe3aSrwCck8n/omDqHCtXP9Qc0Jpx0C2+nbYhzIyygQy4yV3/+ZF/gTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HgzAe4mP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6324E606A31A
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Oct 2026 21:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6324E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HgzAe4mP
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so47935b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Oct 2026 14:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792531994; cv=none;
        d=google.com; s=arc-20260327;
        b=DRxUAHk7oa5CmO30UEjAwsZVjJkqlNuiMYeHt9MRlarjrEvYY/SzNmeJBW2qSeeMYP
         KtjEdW4WpKBxOHvgWtU/x2FCpIecEl2sx6g8392eYKthw+yn7B87oLZ2XEXjyvqy82Cp
         RPIjk/WdSFxm30d+QPwlgZbuRjPwAom4WXO49eExw5ofhWKPw4E0fTQLOUM/Pjbom28n
         rvKL+AA7gLG0Aimz77TVuVOXVp8mAxi12LoQse7fBLUUJvGDNbTuMMcnwaiKqFWtGp4I
         Yfog5bbCEday50WNPuPJwxm2YGKe1Jln6hZZJm4JbhTXg0LaAPIPM6Pl3dEJV0s3Z5Q3
         SEwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2AgfGA8Z+ldUgBgGgA9RrGOTzaa/n9KB7xtFx5qm7gA=;
        fh=3NwQjF6PQvnMlO8fR3gfaQIEM0wIJ1WhlqFz5CJ7VbE=;
        b=iItr5GCyb/2+RH8J03MfE58zKnmLpvd0Km3/lJatz6aiFqWkpeGofWdT0QXCukLTvj
         rtTrAyYgYqJaekOZcqs6LOxE+4P/pIj7ja2L98ChkmHVfSJHwiTzJpTQlDx2ZTfQ2CrC
         rN5QuTeKWAEFSuqBNAZ9O3UfIzOOBCIgTngbNoa4PDn2UXu8gqKk9M7CkP35m8Gu9AO9
         KyiWuGc1R69wQEa9y2sZVYQImTuNmzY8IJRmZdTwTiZIbgYQQ22halDKQspeeWh5L0g+
         YNrCOhpMMjD1kt4UZNSclXZOBZShSRlJku10wTNPMHBTpREQgRDffeyv/HKNxqhGDoAU
         pN1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792531994; x=1793136794; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2AgfGA8Z+ldUgBgGgA9RrGOTzaa/n9KB7xtFx5qm7gA=;
        b=HgzAe4mPFlHLQp8onHSEyIi1UY+NGkllpEJrmSepHN57Y+Qdau2KwrkLnX/sWT+/1e
         H8dS3P8qDoTDf4U4AWFCZLOWXTD/4cJPRvCNrFTcZwqzI3d3PBXmLh04NXv/Mhjw2uyz
         8+PpyoZPcewxeCqYF2EnBxu8zY5q/gHknZxB3QqFBBlNVWUP4rnWnYxQV0robbNNgFpR
         EPhTjrPjouQ5LvRzYA4XQ0t81wzkx1R80XD9PjOQTHe3Q96emFXPeslNTOyx4YLWyl7h
         NzLf4qg1ZoE6Ix+XZPuqfbPDg6rWdnQ/hpcQ4UHx9wJ6VZPOxbNxLT7bA+4EocFNo3Di
         mP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792531994; x=1793136794;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AgfGA8Z+ldUgBgGgA9RrGOTzaa/n9KB7xtFx5qm7gA=;
        b=m4AAVJQOicHFabjwq1/RiOZQcHAqSDeUFzv36TrY4wMK3VxLeRSiFF9vK7E4TYKkUP
         BXimuhUCfDmGKTCLAlSIwPBT0uPSd6jGdJuC/iRhbiYxYxHodI1xwajkr7xL5ipN2niE
         mKrLu0xbOEPWalMWEb80Fg8me58zu4h8nf1o/dhTlJifpdo2OXe8F1yTwIe4VRa1aszy
         G7KS1E7c2MFNgwb8N5MvrP9q2GpomzvYJ/zu086MN9RaeSKn/v+wWZmb4e99kXwdBgXn
         covbU0nw80LBVZAXvjmDwiJISWk6YcG4pPQV3e3KeX9STmZp2vH/zOtFe2yOy78KIFW/
         0+Iw==
X-Forwarded-Encrypted: i=1; AKwUvBxROcaPpC6c9mOue/o/hfd5Oh+uAWwuPDwWaICJcM9pfGmfjqberAq67Zye3Vc3TKUWNMW2TsZmGzzsFIDJedhokxL/lg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ7mwwJ1e3jBx4FX54UjPRThZedU9tTNGYRCOoV6hUy6A1m6DuG
	h4aCtu657KNYEYXGMavV69yu1LccXDqR5BEmKsTBwvns/eb0Qky3lXkpEcyShfG2ddUQRt09xvb
	4LcUWcpArw89DyQBOz+9ErAQaJ2lnyNI=
X-Gm-Gg: AYBFou3v2ngsyAHV3KNGulmm/Q9FDODrjv/KY9ZWueEc0k0M8Mu9VCBL9h3EwaBbv+A
	BDzCm8K27PuwZiqnkCwJD5DOXrW//sgw+4vZdiEI75/mPZWsJ4JtzpHAxy/Ho2yLD/yz8zQTmZP
	32TKS2RZPBp3uNDtw+CQSo2aeKdUlAcVGKjQr1p3nvbzlfVewvb7IKHFmRZi5P/3v4r0TWFZUU+
	FwpLyxPF1DVvxxzSkDWr3E8nge4aWrfOpapGKp38GP7eBSlHllhG+U7gchseR8WRyJYx9GqYtZH
	4sJKG8N5mruwyP246awn9ikeUxI7vt5ZIQuI5ZhwVGJ7xH58O4rWaAsgxc+BNXPf+46AI//2juO
	oF73sYwXuBDxanvGyb6eUF9dkyyaVvcrbsgXjdPNsNk3zBe6SpNkw+mWbsMxF835y+mO4IYowWI
	w2mijAX7TMPzxb
X-Received: by 2002:a05:6a00:a0c:b0:89e:779b:d0f with SMTP id
 d2e1a72fcca58-8a089dfdbb8mr140032b3a.37.1792531993626; Tue, 20 Oct 2026
 14:33:13 -0700 (PDT)
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <ae36949f7685ef74318d3c742f02e1398db3b454.1792164438.git.lucien.xin@gmail.com>
 <179244539859.3135.15973054396060254186@kernel.org>
In-Reply-To: <179244539859.3135.15973054396060254186@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 20 Oct 2026 17:33:00 -0400
X-Gm-Features: AclHuK-OS8Rlsq-Vf92z9Ck0SMvPAMUJ9Zd-S0XjwZRWioNbmezgdXlvGsvI2pg
Message-ID: <CADvbK_en5dm-psb_eXs26y1bYTNq8_76eHv6ZWX_FbcSPjv8Zg@mail.gmail.com>
Subject: Re: [PATCH net-next v17 08/15] quic: add path management
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

On Mon, Oct 19, 2026 at 5:30=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] quic_udp_sock_create() in net/quic/path.c zero-initializes
>   udp_conf and fills it with quic_udp_conf_init() ->=E2=80=A6
> - [Medium] IP_FREEBIND (and the IPv6 equivalent) set on a QUIC socket has
>   no effect when a new UDP tunnel socket is created.
>
> --
>
> quic: add path management
>
> This adds struct quic_path_group and struct quic_path to manage the
> active and alternate paths of a QUIC connection. Each path is bound to a
> kernel UDP tunnel socket, which can be shared and is tracked in a
> per-port hash table. The patch also adds bind, unbind and swap helpers,
> alternate path detection for migration, and basic PLPMTUD state handling.
>
> > diff --git a/net/quic/path.c b/net/quic/path.c
> > new file mode 100644
> > index 0000000000000..ba7e2c952a36a
> > --- /dev/null
> > +++ b/net/quic/path.c
> > @@ -0,0 +1,596 @@
>
> [ ... ]
>
> > +static struct quic_udp_sock *quic_udp_sock_create(struct sock *sk,
> > +                                               union quic_addr *a)
> > +{
> > +     struct udp_tunnel_sock_cfg tuncfg =3D {};
> > +     struct udp_port_cfg udp_conf =3D {};
> > +     struct net *net =3D sock_net(sk);
> > +     struct quic_uhash_head *head;
> > +     struct quic_udp_sock *us;
> > +     struct socket *sock;
> > +     int err;
> > +
> > +     us =3D kmalloc_obj(*us);
> > +     if (!us)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     quic_udp_conf_init(sk, &udp_conf, a);
>
> [Severity: Medium]
> Should the tunnel socket take its IPV6_V6ONLY setting from the QUIC
> socket that owns it?
>
> quic_udp_conf_init()->quic_v6_udp_conf_init() fills in the family,
> address, port, checksum flags and bind_ifindex. It never sets
> conf->ipv6_v6only:
>
> net/quic/family.c:quic_v6_udp_conf_init() {
>         conf->family =3D AF_INET6;
>         conf->local_ip6 =3D a->v6.sin6_addr;
>         conf->local_udp_port =3D a->v6.sin6_port;
>         conf->use_udp6_rx_checksums =3D true;
>         conf->use_udp6_tx_checksums =3D true;
>         conf->bind_ifindex =3D quic_get_dev_if(sk, a);
> }
>
> udp_sock_create6() applies v6only only when the config asks for it:
>
> net/ipv6/ip6_udp_tunnel.c:udp_sock_create6() {
>     ...
>         if (cfg->ipv6_v6only) {
>                 err =3D ip6_sock_set_v6only(sock->sk);
>     ...
> }
>
> As a result, the kernel UDP socket always gets the net.ipv6.bindv6only
> default. An IPV6_V6ONLY value set on the QUIC socket through
> quic_setsockopt()->ipv6_setsockopt() is ignored. A zero cfg value also
> can't clear an inherited bindv6only=3D1.
>
> With bindv6only=3D0, could an IPV6_V6ONLY QUIC socket bound to [::]:P get=
 a
> dual-stack tunnel? That tunnel would also hold IPv4 port P and could
> cause unexpected EADDRINUSE for IPv4 binds.
>
> With bindv6only=3D1, a QUIC socket that cleared IPV6_V6ONLY gets a v6-onl=
y
> tunnel, and IPv4 UDP lookup skips ipv6_only sockets. Would IPv4 packets
> for that dual-stack QUIC socket ever be delivered?
>
> quic_udp_sock_lookup() also decides sharing through
> quic_cmp_sk_addr(us->sk, ...), which checks ipv6_only_sock() on the
> tunnel socket. A wrong v6only state would therefore also change which
> QUIC sockets end up sharing a tunnel.
>
> quic_path_bind() has no caller yet in this series, so this would only
> show up once quic_bind() is wired in by the next patchset.
>
False.

This is on purpose, as two quic socket may share the same lower
udp tunnel socket, we try to make the lower :: bind udp socket always
with bindv6only =3D 0 (unless net.ipv6.bindv6only =3D 1), so that two socke=
ts:

- bind(sk1, ::, 1234, ALPN=3D'h3', bindv6only =3D 1)
- bind(sk2, ::, 1234, ALPN=3D'smbd', bindv6only =3D 0)

can co-exist, the bindv6only check will be performed on the quic
socket layer like when looking up the listen socket.

if the tunnel socket takes its IPV6_V6ONLY setting from the QUIC,
the sk2 will never accept IPv4 requests.

> > +     err =3D udp_sock_create(net, &udp_conf, &sock);
>
> [Severity: Medium]
> Is IP_FREEBIND (or its IPv6 equivalent) on the QUIC socket honoured
> when a new tunnel socket is created here?
>
> struct udp_port_cfg has no freebind or transparent field.
> udp_sock_create4() and udp_sock_create6() call kernel_bind() right after
> sock_create_kern(), so FREEBIND can never be set on the new socket
> before it is bound:
>
> net/ipv6/ip6_udp_tunnel.c:udp_sock_create6() {
>         err =3D sock_create_kern(net, AF_INET6, SOCK_DGRAM, 0, &sock);
>     ...
>         err =3D kernel_bind(sock, (struct sockaddr_unsized *)&udp6_addr,
>                           sizeof(udp6_addr));
>     ...
> }
>
> The bind path then calls inet_addr_valid_or_nonlocal() on the new tunnel
> socket. That socket doesn't have FREEBIND set, so a nonlocal source
> address would fail with -EADDRNOTAVAIL.
>
> The QUIC socket accepts IP_FREEBIND through
> quic_common_setsockopt()->ip_setsockopt(). quic_get_user_addr() in the
> next patchset is described as honouring FREEBIND. Could bind validation
> then accept the address, only for
> quic_path_bind()->quic_udp_sock_create() to reject it?
>
> It looks like only the netns-wide ip_nonlocal_bind sysctl would make a
> nonlocal bind work here.
>
False.

quic_get_user_addr() will be called to handle IP_FREEBIND for user
addresses in quic_bind/quic_connect/quic_sock_connection_migrate
in the next patchset.

Thanks.

> > +     if (err) {
> > +             pr_debug("%s: failed to create udp sock\n", __func__);
> > +             kfree(us);
> > +             return ERR_PTR(err);
> > +     }
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1792164438.git.lucien.xin%40gmail.com

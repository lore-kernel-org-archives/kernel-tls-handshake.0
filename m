Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795623090;
	b=SZ7b2NdgfZasEX8SEHl91GRxqpxwbSkithZdo3iXUfr2mobYkxjDiRv+ibr07BJrOScl
	 F1WQsMG0ceBT/lLoHC3u/Lmc0pEP/sLK6MLDq0rRAgDw8AHO3C69ongRW9jFq10rVk06O
	 bis3bSX91DKn4JVpqEI3eKm0Nl/VUxq5MS20GL8MHpetBAk6RLRgErmVUu7Id0YRTh6OX
	 42u7jquqWqsiS1YKwzfszfvdTOUhkfkcGBm0H5s0PMP5NIS3yIFLKa62kyq0ybIzrjKTy
	 0oTHzZ0RScgKlreQAq3dTF9mp32/t8CpU1cgwd4FypGpdomb6oXKWtxmQ4atP/i173g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hqeM9bcRy4K57cIOrdP0ZMwShWjCWd1IsL+uvjRPcsI=;
	b=WYbt1JeuOmC4n28wZwlidw52YNB0pKT+ZUCx5Vh5T6zyZ8Ol5XE/wIk/vdjVyPxq0AuY
	 5/jUs34s2JAa8eQBpwppxjwFRDiun6fbdn9PV8YacmFE/Wrs4RaAhF88FoU68hRPKMHMS
	 dhFVzn/aKhjjh8QNp2dCFMiXBT/FsaEkn2ZL9oVC7tOw3PWJ4BZLkfGfg79q6Y6PE9yYK
	 71+3pXLoieJKhQTSKO3QsEb9rhM9k8k6tC1BxnBt4nQ8a0huWQxzBEK8jYTayQqxzjood
	 LEyZTb7p3eT14qy7WUfYTH9C2fPVJJv/+xOQcsr2NdGD4XS8hy2ynHxJUaKIUpCrAVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iTlyMOzE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B30606A32A
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 25 Nov 2026 16:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05B30606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iTlyMOzE
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so3623654b3a.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 25 Nov 2026 08:11:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795623089; cv=none;
        d=google.com; s=arc-20260327;
        b=Bh8+pHxFtZwJx/hhw2m7uF7UNJSgtAvVuaWCJmZt8TfojUW3nZ/Vv4hnkQWx57ZLWg
         sIGbDHsuYPVmwDvriUYPGzMmCYNOVu4XtoQGhYzlj9BP7re0MA1HRcrVmticz83Z9GD3
         nA/qUR7Mkw/kS7A7WrHHWx2lQ5e/K3s8k1ehZlsUIJYvJK8qKbjgy/3W7Jp+vqDMr60B
         rTNYRlVOwHqkZzNi4WBCeo1Ivtd47nLZj23p4K93peDl0wSYiVE1vLoEah2ywb49LCrM
         IC0+ijVg6oGaMNxppE03tRKZUyR0A0y+g1gJuMG75JkvW9t+zwh/grRstdwEystJj2Ej
         MV2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hqeM9bcRy4K57cIOrdP0ZMwShWjCWd1IsL+uvjRPcsI=;
        fh=ToCwXmo09wucUsEtbMIA9hD4P+Y3dZktTgMKvbJTriE=;
        b=KPyv6bEwCdJsWVAlx8q/yKlaoeCDcVeiRf/uDjh1XKT257SXzWJqKWApDX+W+P+Ypo
         wIoSaUlTct4YFrH3GHRbjsANZBJrNjhAyk6rr2ovsoGggrK5s9F1cSXeOp8gs0700t9U
         ngP/R2EsE/0Lo17prwsHR/edxLF27fPg0l+jK5KWePKSQudlX1GyTtBd6eSBhA8FUedo
         aQe/yC69SVlpBLGTRkBp4tsYLjjrAaK8b4Bj5ZWR8tvVEgXY+hVt/i6SuBO/oowFuq84
         yV3TfLExSdyavr2oJLMqJsT1ARNy4uFMtEVmiddaLHYmIPrXEJoZcvElQZViqsmdGEZw
         Ri/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795623089; x=1796227889; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hqeM9bcRy4K57cIOrdP0ZMwShWjCWd1IsL+uvjRPcsI=;
        b=iTlyMOzEENkGV1Stlpw/XcswWiglZf0ouynv/OXW9yak2457/jP4ar4G8d+DpH1AMz
         bHXa2VBu2AV6aF9grMsvv0NdJPFe+VLjkCoNlb1rzt7kqG/HZWVmZ0FbKaBYVOCCx4h+
         dM9Avop/k8XQR3ZJgJ7dtT1AAwI+IAp1ajoO+7mIhjUNNz4DDYQDWl8wr39WRwwOuQd8
         pamdwq5UjyjORkmTSa5CfAu3L7Yz925uYK8jlYiwyixt10YKzLJL5EUBe3VvrDkynCjB
         TC81/KfbZpgYUFKv+Ji/pdsWV1/8SnnFj3XPNILmlnQ6qLV0FuJ0wcguicP3B4jK3+D7
         um7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623089; x=1796227889;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqeM9bcRy4K57cIOrdP0ZMwShWjCWd1IsL+uvjRPcsI=;
        b=2t8dKUg76sXCpFPWN6ropnj7wHsCMDXHkvJOz0mCxpVE7fR1OH2tBKRb1qVCkJRWrZ
         iPDMsVGVASSD+JXNfJGqXJldlxxsPk4Om0xf/2Pa3wrCCG4DGUrRhlgmOzYuaYGQ1ytZ
         UzGQi1TuKCmRwjaQh0GyRrkxIA57pM/A17284Q8ha2qVc7nesvBfKCl2qnSVtVeWm1My
         HaKrNgt2X1JMfKt0FYXiAH+d5ZOgWKdUm/JE+pUtiOhtj77oW5Egn0Lc+hinWWCgynca
         0OkPqqcFVAV+TeYmoIewYLm0MsPx8+TjJgWFbv/6SWz1ivYfJ/B5UTEB9MlcCxtDcp12
         J/vg==
X-Forwarded-Encrypted: i=1; AL+hErEX2jkADw43P/bSj2T4arKQWsR2DRvnQrgzD5utApHcyLwTV6u4rAFz8GnKu+ZW0E3CiGvwGohHe6hU64dm7NchE7hEXg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+iZDe9zRQu2sPp2YtAHJqZnw7X47QdTBI/D72NjF0ZnRoCmcw2
	vHUhRtA+WVJGJaORm34tYvIq5vvsT4bN/Eb7t0zh2VkKbqQQt4YiQ4ZxnMkWD7+0pbHk6oQAHTa
	rCOzzfpRauX1XGfDS+he9SDLO4k34GmQ=
X-Gm-Gg: AZFdTZcRB6ica9h13AB1eeJtmq7E7qk9f3n3V7Z9XCdLGeQVSpnIZpSA22SQYRub6xg
	iKc+Gmiy/jEYSoS0nx/sSLz83Gf0JyWYJUVblbnJbgPxGua7csCBdsFwJJkqBc1Fd979JXQ/Bob
	RMzCTQuR4I3OWLKqVU0IXH3blySt/So09F3iUpWPhCwKBjtJMnwnMwVl4aSWe4WT1/opUIdcduR
	NAbmt3UqPwNceKeYn76/pX2BXh3ya8RZCKomE+gpL2YeowcyClk3xLMW7djxqYVPiJ6wt1ngLq1
	mW9qNZ43GFLvOQWOTmGscHOsA8ILRjhvGI1nG/XdmHgR13KH+RGJL73AGDn92qMFYgH9Ry7ZZQg
	hQxCmh7iRHdrspFqR1eFbskwuvbwLidXHefhvTqzsEGX+SsTdcZsng3eFHaMPxkYKBG5AWtG0LD
	tR/d/jy3nRdzbpl8tQxTTqwoSMCrcBdzcB8VH8wPoxKxGwhdhRjS+uoY1PP2+I/nuoMoGuUKbbh
	QR/szXHSG4OKQXOLQ==
X-Received: by 2002:a05:6a00:84d:b0:883:4a94:8132 with SMTP id
 d2e1a72fcca58-8c7dd9d6a17mr12973536b3a.20.1795623089256; Wed, 25 Nov 2026
 08:11:29 -0800 (PST)
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <6a6d9da5d2d7ae5dfd1a6cdcd409326023fc7c2c.1795393691.git.lucien.xin@gmail.com>
 <179548327574.3135.6574572531783833085@kernel.org>
In-Reply-To: <179548327574.3135.6574572531783833085@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 25 Nov 2026 11:11:17 -0500
X-Gm-Features: Aa3M54o1KhSLEBbvf_IuXRh_AZAPAxe2wdTrfHcpNM5mGPKS186BqyC7tIAvBxU
Message-ID: <CADvbK_cacMFPHz3hAqXcY92C2yAzq=+ajxZYZL_RQrYmY5Ft9Q@mail.gmail.com>
Subject: Re: [PATCH net-next v19 08/15] quic: add path management
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
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] In net/quic/path.c, quic_path_bind() decides whether a path
>   may take a port by looking at the credentials of the task that happens=
=E2=80=A6
> - [Medium] quic_path_bind() binds a real UDP port (explicit or ephemeral)
>   on behalf of the caller via quic_udp_sock_create() ->=E2=80=A6
> - [Low] The comment on quic_path_detect_alt() in net/quic/path.c does not
>   describe what the function does.
> - [Low] Two PLPMTUD field comments in struct quic_path_group
>   (net/quic/path.h) do not match how path.c uses the fields.
>
> --
>
> quic: add path management
>
> This patch adds struct quic_path_group to manage the active and alternate
> QUIC paths. Each path is backed by a refcounted UDP tunnel socket wrapper
> (quic_udp_sock) kept in a global hash table, with helpers to bind, unbind=
,
> swap and detect alternate paths for connection migration. It also adds a
> basic PLPMTUD state machine that is driven by probe sends, ACKs and ICMP
> feedback.
>
> > diff --git a/net/quic/path.c b/net/quic/path.c
> > new file mode 100644
> > index 0000000000000..946f5e44b6350
> > --- /dev/null
> > +++ b/net/quic/path.c
> > @@ -0,0 +1,608 @@
>
> [ ... ]
>
> > +static struct quic_udp_sock *quic_udp_sock_create(struct sock *sk,
> > +                                               union quic_addr *a)
> > +{
>
> [ ... ]
>
> > +     us =3D kmalloc_obj(*us);
> > +     if (!us)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     quic_udp_conf_init(sk, &udp_conf, a);
> > +     err =3D udp_sock_create(net, &udp_conf, &sock);
>
> [Severity: Medium]
> Can this let a confined, unprivileged process bind UDP ports that its LSM
> policy does not allow?
>
> udp_sock_create() goes through udp_sock_create4()/udp_sock_create6(), whi=
ch
> call sock_create_kern() and then kernel_bind():
>
> net/ipv4/udp_tunnel_core.c:udp_sock_create4() {
>     ...
>         err =3D sock_create_kern(net, AF_INET, SOCK_DGRAM, 0, &sock);
>     ...
>         err =3D kernel_bind(sock, (struct sockaddr_unsized *)&udp_addr,
>                           sizeof(udp_addr));
>     ...
> }
>
> kernel_bind() in net/socket.c calls sock->ops->bind() directly. That mean=
s
> security_socket_bind() never runs for the UDP socket that actually holds
> the port.
>
> The socket is also created with kern=3D1, so it gets a kernel label inste=
ad
> of the caller's. The user socket create hooks (LSM and cgroup-BPF inet so=
ck
> create) are skipped as well.
>
> The only remaining bind check is on the QUIC socket. SELinux classes an
> IPPROTO_QUIC socket as rawip_socket, and sel_netport_sid() with
> sk_protocol =3D=3D IPPROTO_QUIC does not match any udp port labels.
>
> As a result, the port bound here is not covered by udp_socket
> name_bind/node_bind rules with per-port labels, or by Smack/AppArmor netw=
ork
> rules. Per-packet LSM checks and netfilter socket-owner matching would al=
so
> see a kernel socket rather than the user.
>
> Other UDP tunnel users either require CAP_NET_ADMIN (vxlan, geneve, fou,
> tipc) or take the port from an admin sysctl (SCTP over UDP). Here an
> unprivileged user picks the port. The CAP_NET_BIND_SERVICE and uid checks=
 in
> quic_path_bind() do not mediate the UDP bind itself.
>
> quic_path_bind() has no callers yet in this series. quic_bind() and
> quic_connect() arrive in the next patchset, so the user-reachable path
> can't be confirmed here.
>
> Does the UDP tunnel bind need some form of LSM mediation before the port =
is
> bound on the caller's behalf?
>
False.

QUIC does not implement LSM hooks yet. The UDP tunnel socket is an internal
kernel transport detail, same pattern as SCTP's UDP encapsulation. LSM
mediation will apply to user-facing QUIC sockets, not the internal tunnel.

> [ ... ]
>
> > +/* Binds a QUIC path to a local port and sets up a UDP socket. */
> > +int quic_path_bind(struct sock *sk, struct quic_path_group *paths, u8 =
path)
> > +{
>
> [ ... ]
>
> > +     port =3D ntohs(a->v4.sin_port);
> > +     if (port) {
> > +             if (inet_port_requires_bind_service(net, port) &&
> > +                 !ns_capable(net->user_ns, CAP_NET_BIND_SERVICE))
> > +                     return -EACCES;
> > +             head =3D quic_udp_sock_head(net, port);
> > +             mutex_lock(&head->lock);
> > +             us =3D quic_udp_sock_lookup(sk, a, port);
> > +             if (us) {
> > +                     if (!uid_eq(current_fsuid(), sk_uid(us->sk))) {
> > +                             mutex_unlock(&head->lock);
> > +                             return -EADDRINUSE;
> > +                     }
>
> [Severity: Medium]
> Is it intended that both checks here use the credentials of the task that
> calls quic_path_bind(), rather than the QUIC socket's own credentials?
>
> The ns_capable(CAP_NET_BIND_SERVICE) check runs before the lookup. So it
> also applies when an existing tunnel socket is only being reused and
> refcounted.
>
> The reuse branch then compares current_fsuid() with sk_uid(us->sk). That
> value is the fsuid of whoever first created the kernel tunnel socket.
>
> For comparison, the SO_REUSEPORT model in inet_csk_bind_conflict() and
> udp_lib_get_port() compares the new socket's sk_uid with the existing
> socket's sk_uid.
>
> Consider a server that binds port 443 as root and then drops privileges. =
A
> later explicit-port quic_path_bind() for 443, for example for an accepted
> child socket or a migration path, would get -EACCES (capability gone) or
> -EADDRINUSE (fsuid changed). Is that the expected result?
>
> Likewise, a QUIC socket passed to another process via SCM_RIGHTS would be
> judged by the receiver's credentials. A kernel thread caller would pass
> both checks no matter who owns the socket.
>
> The commit message and the code comments don't describe this model. The
> only mention is the v15 changelog line. quic_path_bind() has no callers i=
n
> this series, so whether a reuse bind can follow a privilege drop depends =
on
> the next patchset.
>
> Would comparing sk_uid(sk) against sk_uid(us->sk), or at least documentin=
g
> the intended model, make sense here?
>
False.

The CAP_NET_BIND_SERVICE check uses current task credentials, consistent
with how inet_bind() works. The fsuid comparison on tunnel reuse prevents
cross-user hijacking. In the accept path, the same process that created the
tunnel is accepting, so the fsuid matches. A server that drops privileges
after bind would not re-bind, and it reuses the existing tunnel created
before the drop.

> [ ... ]
>
> > +/* Detects and records a potential alternate path.
> > + *
> > + * If the new source or destination address differs from the active pa=
th, and
> > + * alternate path detection is not disabled, the function updates the =
alternate
> > + * path slot (path[1]) with the new addresses.
> > + *
> > + * This is typically called on packet receive to detect new possible n=
etwork
> > + * paths (e.g., NAT rebinding, mobility).
> > + *
> > + * Returns true if the alternate path (path[1]) matches (sa, da), rega=
rdless
> > + * of whether it was newly detected or already present. Returns false =
if the
> > + * addresses don't match the alternate path.
> > + */
> > +bool quic_path_detect_alt(struct quic_path_group *paths, union quic_ad=
dr *sa,
> > +                       union quic_addr *da, struct sock *sk)
> > +{
>
> [ ... ]
>
> > +     if (!quic_path_saddr(paths, 1)->v4.sin_port)
> > +             quic_path_set_saddr(paths, 1, sa);
> > +
> > +     if (!quic_cmp_sk_addr(sk, quic_path_saddr(paths, 1), sa))
> > +             return false;
> > +
> > +     if (!quic_path_daddr(paths, 1)->v4.sin_port)
> > +             quic_path_set_daddr(paths, 1, da);
> > +
> > +     return quic_cmp_sk_addr(sk, quic_path_daddr(paths, 1), da);
> > +}
>
> [Severity: Low]
> This isn't a bug, but the comment doesn't match the code. It says path[1]
> is updated with the new addresses, but path[1] is never overwritten. Only=
 a
> saddr or daddr whose port is 0 gets filled in.
>
> The function can also modify path[1] and still return false. Suppose
> path[1].saddr is empty but path[1].daddr already holds a different peer
> address. Then path[1].saddr is set to sa, the daddr comparison fails, and
> the function returns false.
>
> That leaves path[1] with the new source paired with the old destination,
> which matches neither candidate. The "Returns false if the addresses don'=
t
> match the alternate path" text implies the false case has no side effects=
.
>
> Within this patch, path[1].daddr is only set by quic_path_detect_alt()
> itself (saddr first) or by quic_path_swap(). quic_path_unbind() clears bo=
th
> fields together, so this half-written state may not be reachable yet.
>
> Could the comment describe the fill-only-empty-fields behaviour and the
> possible partial update on a false return?
>
> [ ... ]
>
> > diff --git a/net/quic/path.h b/net/quic/path.h
> > new file mode 100644
> > index 0000000000000..c2537cf65a7d4
> > --- /dev/null
> > +++ b/net/quic/path.h
> > @@ -0,0 +1,191 @@
>
> [ ... ]
>
> > +     /* MTU discovery handling */
> > +     struct { /* PLPMTUD probing (rfc8899) */
> > +             s64 number; /* Packet number used for current probe */
> > +             u16 pmtu;   /* Confirmed path MTU */
> > +
> > +             u16 probe_size; /* Current probe packet size */
> > +             u16 probe_high; /* Highest failed probe size */
> > +             u8 probe_count; /* Retry count for current probe_size */
>
> [Severity: Low]
> This isn't a bug, but these two field comments don't match how path.c use=
s
> the fields.
>
> probe_high is also set when no probe has failed. In SEARCH state,
> quic_path_pl_recv() does this once probe_size reaches the 9000 byte cap:
>
>         paths->pl.probe_high =3D QUIC_MAX_PLPMTU;
>
> so the field works as an upper search bound, not only as a failed size.
>
> probe_count is incremented on every quic_path_pl_send() call, including t=
he
> first probe of a new size:
>
>         paths->pl.probe_count++;
>
> so the probe_count < QUIC_MAX_PROBES check counts total probes sent for t=
he
> current size, not retries.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1795393690.git.lucien.xin%40gmail.com

Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6574545DB0
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 15:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573431; cv=pass; b=N7SkFzYm62d4H0vPpItVSmC84wdODBqqugF+79ZGyKOaCZvYJ2YNQBNozN1FXELPeufcvkVVuwo/0BOxagzCCCh+fhjGMJ2flGW/EWq/YlSOY+SMDNzk3rBeXohCMCsmg6LpBu/BwFHm+7ABnMMcew0Kae7B1873P/QtWFRvsGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573431; c=relaxed/simple;
	bh=5r9oITh6Ke0h0LdwQAODmCkNekYxLU9BUgIqqL0e/CQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dwt/msNwiKjxadsVSwZfsXZxG1etpkZyrRPWFgkN9gVUx3xQQ3wqCGvDk2cNu97j9sE2/q94xpbJyRg3sjLmRKJ5W7HuPOTB2/7akNOBKNIyZlw+agBmPzoIXC8ScR+YyJ3cjyZ2GmqSjTPBRWOIRKkWNc8llBFxGfklqYi0H8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaxIHgcT; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaxIHgcT"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so950676b3a.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 08:43:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789573429; cv=none;
        d=google.com; s=arc-20260327;
        b=jcmKl5//dy7/BDukDpGa9PS/w80x41sH/k4xJMtk8EZ2XgrjEEPA2wmkDE2BZHRvfT
         c18EmpMezqPGQvOQ5Kra0jsnYrGTVctPhatAS3vpwwJAimkmSiT9oj/U5vsh83L2eWYB
         wkLXk8Axt4itOX3y1kwTSIsT8oshMCjCpq5PzymANHzQ/ECio2Nem7ILL3/qHNR+4g0o
         V8XGF+q4y/NehnHC9fEOdwd6RJCsW+Zt04Fi0NM48LhDPbgoXvljJzBhV6DzTRyTpeVM
         M5Uzr/hSCEzLrSQu/N7FZPeIB+T2Han5Naa0jhWgtTuDL9IDF9ksWPDqIwmXRfeVrGkA
         sUeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ODqiZXRBdCHmyesWjPny1yNGa+YI4ZP+iScqkVqOaCM=;
        fh=b5sQ6t3C4NrxLP/2TBBsOfjlOhdVfp/DXyqela5Apik=;
        b=hqWqZemxKP7722MhN8gBaC5SIh5cbxAA9OkUP0pEtSn8A7Taam2JrpManZJUpLx600
         S71NqEQY8eMUhEQTKzuWE9ZjU9yGzWm7bcR2unx+jVGGoHZ0P3OGbe3EAPLAbyl/VlI/
         flib7Yf2WFkmI6Ld2FCu3Y+JaziayJL3qdcH9cNlxasycEYqhiO9f10bXPZ0yxUKnUVH
         PwTvpenIKexSnOgeFhTPjFS+WjvadLOLwReLW5PCzntJ+pvEhVKnXPg0bWDCdL3ltlOh
         59QBn4Gx9pG88mG31KUN0YIsENmxBmVANAWJ/5CianFkjVOew+6Ja2ZP1HLmLZht2n+H
         HiQw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789573429; x=1790178229; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ODqiZXRBdCHmyesWjPny1yNGa+YI4ZP+iScqkVqOaCM=;
        b=iaxIHgcTlUUDTEQEcaLinU6tPccqoixGKZBhdI7hHTQFHx2YPzm/sr7Xcn2bU03yx4
         XiBiFJP9iN/s+MhhbcKqc9px31blYemHyuqv81M1CjBRI4EHIvMQ1K3kCUuYqHG9FhRz
         ofw/UqAgFFBjahOZODWnAaHwtX3p0lhqy8wDtdkay+j9gO3Rysbheq0tk8Fth7jUKoUf
         4TgBIjMg1NtN0OQz2FUwGwZuS4gKhJRR9oqOlZ43GtQLwlYAtDSikb6ieM7v4gvgqd5K
         0r49JNue3ML1JDCxErb5EjMQ4XFhvROQKzPDjUOH7pHuECPCNEEcp1H0YEH3D8KequWA
         KoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573429; x=1790178229;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODqiZXRBdCHmyesWjPny1yNGa+YI4ZP+iScqkVqOaCM=;
        b=TMVbxJEjru3sP4floYmKuohbHIRY5jB6+1oq6a0G8G1AKNrGkyyslmZ+w7gF60jqCs
         qgckDlFjQ4PQafNcTgb+IrLSG+pxaBvoBQ9/c1Tew8emhYHdFeNLjb7oFP4oyKaQW/hM
         4GZAYlefBhZFzHxYDvmn9lFmjmhpbfhKT4w8Mfci0bK8YEUiGStDX+gXFunHy/ymedYI
         krmsvYy9hLKYJoVXFhBi+THLEG9uBmagt+GHH5XfwlNRuhUP6ri9NSJQPUkmEeOBInq9
         J/Eg5j4fS7awCHCy0HsFK8YnM4ck5mDo2TNMaJgm458yGQgqV3QPBvIStIeSS3RxiClJ
         FTaQ==
X-Forwarded-Encrypted: i=1; AKwUvBy60PDTQrkyINE0fVp+AEwOBupjp/9Xdci9BtpGU2tvBbsI+ERcp2ck546oCjlbWGaIjMjBukcq3r5gf2HSTjWaGGOw2Q==@lists.linux.dev
X-Gm-Message-State: AFuF++kB9kdStshgDY9jTqntnXWBaH/TFlVTGKG3ere9MqhGiEfhp34a
	trBJRWyAHAEvn5g4OtG1DMQoHvOWptXaFqq58leSka5Rs5XFCKYpbVi7g/TuL1Fdq4TsmalDiGU
	fjSDNZIDM0/wkv2RIII0bbHZNA31hmAk=
X-Gm-Gg: AYBFou2BOJAKrg78TFDV/nmN/i+Pbs9UVsiqtrJFBhDHRd5/vaiKd+SHPG3XJ66OKpu
	QI5yn4j0SRA/PqJe9oAe7xqORjbvUsybpWR3tCwsnjD2GwtTRg4qhoO0Rv9ZIRUv4UqxH8/89Az
	w1KpvU7yxjfVoob2XiBHE++B1X72MiXNkRrqVJk5iUfS6GD7S4BOSKDwPMrR7/oeLL/JkUkzI+l
	6on1dZ3e7qfHspVpbU+XYev/jFVkQyXslke9mFpnFVWBDLcFSwUK1DJs3wX8UeqB7QhnGik9fiK
	AgldCziw+EeVWiif7bB2b0QW5x0P9YOEcaHHb0/LY4F4JYDA6b4dQHfY6anl75ZCryhe3lgXa51
	6T/qeNPmA7VzBJxUnZSjmfpLxOkNDagGn2C3lbqR0YlXIfULce4BrQJwy
X-Received: by 2002:a05:6a00:4406:b0:86a:141e:2a8d with SMTP id
 d2e1a72fcca58-872379b1f8cmr7321250b3a.11.1789573429057; Wed, 16 Sep 2026
 08:43:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <375ee7fe827d9df248a27a8072c84a7c167fc50a.1789393775.git.lucien.xin@gmail.com>
 <178950184430.22033.8793987707688483661@kernel.org>
In-Reply-To: <178950184430.22033.8793987707688483661@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 16 Sep 2026 11:43:37 -0400
X-Gm-Features: AcwNN1XSc3BIya9VHdn-b90bW5THPSIgMzBCtVU9z3ZhvPnGIT-zThpbhq1QirI
Message-ID: <CADvbK_dwf3bMTs_TnOsqJQMAnCCvnr1M8x8DyCtesaL2Wy5ceg@mail.gmail.com>
Subject: Re: [PATCH net-next v15 08/15] quic: add path management
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

On Tue, Sep 15, 2026 at 3:50=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 7 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 5
>
> - [Medium] quic_path_swap() opens a write section on a bare seqcount_t
>   (paths->path_seq) with only local_bh_disable() for context protection.
> - [Medium] In the explicit-port branch of quic_path_bind(), an existing
>   UDP tunnel socket is reused whenever quic_cmp_sk_addr() matches.
> - [Low] Commit message claims PLPMTUD/ICMP feedback is integrated, but at
>   this commit quic_udp_err() is a stub returning 0 and no quic_path_pl_*=
=E2=80=A6
> - [Low] quic_path_pl_send()'s kernel-doc ("Called immediately after
>   sending a probe packet in QUIC Path MTU Discovery") and the matching=E2=
=80=A6
> - [Low] The new file net/quic/path.c carries the header comment
>   "Initialization/cleanup for QUIC protocol support." =E2=80=94 verbatim=
=E2=80=A6
> - [Low] quic_path_pl_recv()'s documented contract ("Return: New PMTU to
>   apply if search completes, or 0 if no change") disagrees with the=E2=80=
=A6
> - [Low] The three PLPMTUD pr_debug() statements in quic_path_pl_send(),
>   quic_path_pl_recv() and quic_path_pl_toobig() print the label "dst:=E2=
=80=A6
>
> --
>
> quic: add path management
>
> This patch adds struct quic_path / struct quic_path_group plus the global
> hash table of UDP tunnel sockets, with helpers to bind, unbind, swap and
> detect alternate paths for connection migration.  It also adds the RFC 88=
99
> PLPMTUD state machine helpers (quic_path_pl_send/recv/toobig/reset/confir=
m)
> and a quic_wq workqueue used to release UDP tunnel sockets.
>
> A few questions below.
>
> > diff --git a/net/quic/path.c b/net/quic/path.c
> > new file mode 100644
> > index 0000000000000..a9e02fc22e609
> > --- /dev/null
> > +++ b/net/quic/path.c
>
> [ ... ]
>
> > +             head =3D quic_udp_sock_head(net, port);
> > +             mutex_lock(&head->lock);
> > +             us =3D quic_udp_sock_lookup(sk, a, port);
> > +             if (us) {
> > +                     if (!uid_eq(sk->sk_uid, us->sk->sk_uid)) {
> > +                             mutex_unlock(&head->lock);
> > +                             return -EADDRINUSE;
> > +                     }
> > +                     /* Allow reuse of an existing UDP tunnel socket.
> > +                      * However, if it is in the middle of asynchronou=
s
> > +                      * teardown (via workqueue), it is temporarily un=
usable.
> > +                      * Return -EAGAIN (not -EADDRINUSE) to signal the=
 caller
> > +                      * to retry soon.
> > +                      */
> > +                     if (!quic_udp_sock_get(us)) {
> > +                             mutex_unlock(&head->lock);
> > +                             return -EAGAIN;
> > +                     }
> > +             } else {
> > +                     us =3D quic_udp_sock_create(sk, a);
> > +                     if (IS_ERR(us)) {
> > +                             mutex_unlock(&head->lock);
> > +                             return PTR_ERR(us);
> > +                     }
> > +             }
> > +             mutex_unlock(&head->lock);
> > +             quic_path_set_udp_sk(&paths->path[path], us);
> > +             return 0;
> > +     }
>
> [Severity: Medium]
> Can this reuse branch bind a path to a source address the host does not o=
wn?
>
> quic_udp_sock_lookup() calls quic_cmp_sk_addr(us->sk, &us->addr, a), so t=
he
> existing tunnel socket address is the first argument, and
> net/quic/family.c:quic_v4_cmp_sk_addr() has:
>
>         /* Match only if socket is also ANY-bound. */
>         if (addr->v4.sin_addr.s_addr =3D=3D htonl(INADDR_ANY))
>                 return a->v4.sin_addr.s_addr =3D=3D htonl(INADDR_ANY);
>         if (a->v4.sin_addr.s_addr =3D=3D htonl(INADDR_ANY))
>                 return true;
>
> That second test means an ANY-bound tunnel socket matches a request for a=
n
> arbitrary specific address (quic_v6_cmp_sk_addr() has the same rule for
> IPv6).
>
> On that branch quic_path_bind() returns 0 without ever going through
> quic_udp_sock_create() -> udp_sock_create() -> kernel_bind(), so
> __inet_bind()'s address ownership check (inet_addr_type() must be
> RTN_LOCAL/MULTICAST/BROADCAST unless IP_FREEBIND, ip_nonlocal_bind or
> CAP_NET_ADMIN) never runs, and paths->path[path].saddr keeps the
> unvalidated address:
>
>   process A: bind 0.0.0.0:P     -> quic_udp_sock_create(), tunnel sk is A=
NY
>   process B (same uid): bind <non-local addr>:P
>                                -> quic_udp_sock_lookup() matches the ANY =
sk
>                                -> quic_udp_sock_get(), return 0
>
> The same request would be rejected if no wildcard tunnel socket existed f=
or
> port P, since then udp_sock_create() would do the bind and validate the
> address.  Should the reuse branch validate the requested source address
> before accepting it?
>
False:

The source address to bind is validated by quic_get_user_addr() when the
quic_bind() socket API is added in the next patchset, including the
FREEBIND and sysctl_ip_nonlocal_bind checks.

> [ ... ]
>
> > +void quic_path_swap(struct quic_path_group *paths)
> > +{
> > +     struct quic_path path =3D paths->path[0];
> > +
> > +     paths->alt_probes =3D 0;
> > +     paths->alt_state =3D QUIC_PATH_ALT_SWAPPED;
> > +
> > +     /* Protect path[0] modifications with seqcount for RCU readers in
> > +      * quic_sock_lookup(). The seqcount allows readers to detect torn=
 reads
> > +      * during the non-atomic structure assignment.
> > +      */
> > +     local_bh_disable();
> > +     write_seqcount_begin(&paths->path_seq);
>
> [Severity: Medium]
> Is local_bh_disable() enough to open a write section on a bare seqcount_t=
?
>
> path_seq is declared as a plain counter in net/quic/path.h:
>
>         seqcount_t path_seq;      /* Protects path[0] during swap */
>
> so there is no associated write serialization lock, and
> write_seqcount_begin() expands to seqprop_assert(s), which for seqcount_t=
 is
> lockdep_assert_preemption_disabled().  On PREEMPT_RT
> __local_bh_disable_ip() only takes softirq_ctrl.lock and does
> migrate_disable(); it does not touch preempt_count():
>
>         kernel/softirq.c (CONFIG_PREEMPT_RT)
>         void __local_bh_disable_ip(unsigned long ip, unsigned int cnt)
>         {
>                 ...
>                 local_lock(&softirq_ctrl.lock);
>                 ...
>         }
>
> Does that make write_seqcount_begin() warn on every path swap with lockde=
p
> enabled on PREEMPT_RT?
>
> The other half of the same point: the odd-sequence window becomes
> preemptible, and the reader added later in the series busy-waits on it:
>
>         do {
>                 seq =3D read_seqcount_begin(&paths->path_seq);
>                 ...
>         } while (read_seqcount_retry(&paths->path_seq, seq));
>
> Would preempt_disable_nested() around the write section, or declaring the
> counter as a seqcount_LOCKNAME_t associated with the socket lock, be a
> better fit here?
>
True:

I missed that local_bh_disable() does not disable preemption on PREEMPT_RT.
I'll add preempt_disable_nested(), which disables preemption on PREEMPT_RT.

Thanks.

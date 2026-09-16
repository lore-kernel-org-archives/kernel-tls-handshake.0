Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A8250EC08
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 15:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572115; cv=pass; b=f/Jcur+m8LMD17/j2laTWkyUCqhiAM5i2CTQPBt1qPnMI5SpB2hRXYQhjHmhhmf/Fvll8pwohHHKGwpWWBSW+fQcQTivZ3B4o5W3XLSC5MbOrN2sDI3ecfuP6tQ3UWkIX7nSoyvWWlP4pR5fSM5gC+i89ihpgk/zz5bkXCrcIzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572115; c=relaxed/simple;
	bh=ZLzBSbLHdIx7oKJft5euLp5tK8dytE+WWJeEygpcoPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lg+RuBcAfc2Kh3O4C9BtAGjvjqkMUgnWOswO03fUq3oYGU0kGwMB+rtCk+hrti1OymEjbkJvPMp+1QIMgK/YlVr5uutbBC52TL21wxmf1PR+OUNapF59EfemBQ8/DIYxpOwTgcsgRd/zNP5ctJdyaXb7fa8ELMRpr41kZoFqRVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUZDCsd+; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUZDCsd+"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so1203525b3a.3
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 08:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789572109; cv=none;
        d=google.com; s=arc-20260327;
        b=Dlp7Z2yoskjX/6UDERXt5kZRuoAe4xHqCCtKjtuHvlqfxu9O04w5fYjI7GstF8sjGk
         HTwe0NgmSVC4ZHLRA9Y1V7gOZefSe9sUbIbHIwzb1gknA/px6ZYl6KO2Jvf90qmt7tLh
         4LaULiI4sCjCnADw69yoehO23tLCoq1dIdYlQzEAqGAvYM7u/AkPMmC9PbIXkiePF9Aa
         y+9FZYVx8SCQZqfdYGbP9AqdaW7gc7Hr/QhnOsffhzuZUslvvUJNJSEpnFRZUeLx6QG4
         DuGy+V4xZgvZdHJuA+LzRKRnFYKl7KfkYDGuvn7WNq6bSwspkcGrH1diNoGbJUeymMfB
         AcmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p1eY0XzQHV53ynXnFivLaDlowT7CeoLCfbXUtFiZQ8o=;
        fh=1mckU6NeMccKeI25pgfm6MCJW6W4MJug6gB836PM5bs=;
        b=QFiiqZvIhUWgLIEshy61EVn3LDbkPhGdA86m+tcOYS1yG3+R62GirRFANkJiSlyLcT
         AfFgl5wwORsl1tFw6VgaIaCL5Qa+ONioxjJEA40d813ueJ6eVfHXN1dixVewOoAV8Vhb
         Ksd5Xc8C2nA1lZoqbm7PFHAJGrZooRaxTSAOpR0/V7CYWFvvxY0OfGFjol9hMlpFQ5Al
         WNL7+XJvP6faj41F+en65ch7Ldqi3xk3QNbRjR8L1J8huK7R8wu+FQPiTG/X8uINgnsf
         /S5hFzgBjbgzRFCKV43/nIHP4gL/OTQRCtTw0W69lmNvaCySTNVTgRhLAowcM3ZuAOT6
         zn3w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789572109; x=1790176909; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p1eY0XzQHV53ynXnFivLaDlowT7CeoLCfbXUtFiZQ8o=;
        b=VUZDCsd+TVHz7LM8iUk0MYtQFxYxIS16t/mK476vXl+1E56DgSfpuh63Jc/y3zT4AH
         jcY0P0rmrHr1TUaYFRb0VMIyixGUnGHZMgg4mvKjwyps6uV+qyf3Du2A6ZoHQdGXH7Ap
         1WHwnEIGnjh82RS3RfDzlISJQMLVCb4i8SpolUqrhww4+sH7v3mDcqUG637S1PFzlov5
         ZREQ90yGyiNGgZvtQIkbZHAdFtnM8Lr2GzbgWXsLFuZQM9YXortuBOeJRNJX2vBuD/me
         xvJtqnJIeReryNU4DkDwcIIK3PulJuqjzoNUPx+VUsFzMpVF7inL72RYXNMuMlP6d/Xa
         FLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572109; x=1790176909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1eY0XzQHV53ynXnFivLaDlowT7CeoLCfbXUtFiZQ8o=;
        b=I+11XgQxLBniufRn0Ub0b42yl96xRmxEZRfhhi8MyyXy+6KyWrKagsGVKptudfYLD1
         Q/5T5q3Q2c4j1sHm9YYDZEoHgKtcpkDM1J1xgfbRnhPXPmv+qE889iPUcbkLbSL7WlXA
         OCfAnqDmnAtla40jDOIZ89q36RbUDwaCP2ky9A9lA36tF/AvlpX9q/cWDoAlmDgdRsa0
         dvybPkl/IRIdaB5JOjxDr2RYckADpQ6RA6jV9eG8k1sIael84jeWevkk7QqCanWXceyM
         YIJFqQpyBCtwGJTjPtmhxjZlghnbw9lmXJ5LwFAYHHP+BaIAuTW2b2Xsc9oizZ/otSU0
         DolQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcNYIUch4n+VJ9/NjNdzeXZ9RNMnu5q6LdTB8IbkkkmcPkaShk2r6uNoXGR7IZT51JhTx7bm8n7lNLJszengAckn9nnQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lu3Xu6PDZv0HaSWOFgrx3QG6sJcFAjuK+4jCSZf7Gf8kN7Oks8
	WFYvt68BThMA75eI67VswlthAeAqop607XA4R8+NK/vuIO5cwwvAQu4sMhVo4EOpA8y9LVYTSCb
	sbLibS5hZhHWKAUadR2bU5HjMUXL0imM=
X-Gm-Gg: AYBFou2EqC6gD72Spk794BU3p8i4IKrAFkkmRQHnCpcKkVLkuOhEzUAK+GuPxk5H6zM
	nW0FXcQlJYo4QkEkq9NoEFw/m7qcZ9qzRWvBIwR3YQP2MTueQB5pgXSRiKkHeFAui6WixN5aiwt
	bRT0eFhry6kNGugA+hkcjnzbgrgLLtgPgDndCKG7dHMa9ucbkw/7w3foJ7OY9BL0FuDHTv0PInW
	W4ftF+mBSwUBJcid4T48V9eyqwhAdIigGoUR+vRE5gomN8kOZM1/EE2xuoIXwL58MY4DuRf/73l
	Lo8zFm/R0XcaQ8whV3zWfN8ebctHK2AMFEy/q4CBpPbCIfLL3ccoehZDNvJA+XTScZ6c2tzyF3H
	k6thft8CdkArQ6/kVMB4HsNblYDu5aqqPteA4zZftK/Io3Lg1FpS5Zhs+
X-Received: by 2002:a05:6a00:4fc3:b0:86f:2d2f:48ef with SMTP id
 d2e1a72fcca58-87236ddb105mr6042886b3a.1.1789572108837; Wed, 16 Sep 2026
 08:21:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6d7bfc9ba424a7170befff9ca9eaed1663017ca8.1789393775.git.lucien.xin@gmail.com>
 <178950183921.22033.10083649522216474862@kernel.org>
In-Reply-To: <178950183921.22033.10083649522216474862@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 16 Sep 2026 11:21:36 -0400
X-Gm-Features: AcwNN1UD3xdvGptxprJEVONmj0qpc-MJ-3juUKU_3i9i2Xyg8-vDsV7GrGmZ3i4
Message-ID: <CADvbK_ejqDoS3bA33Ryi-qeNV7eRbTE9QPc-90XDoRujmuaoxg@mail.gmail.com>
Subject: Re: [PATCH net-next v15 06/15] quic: add stream management
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
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 2
>
> - [Medium] quic_stream_set_param() (net/quic/stream.c:387-416) treats the
>   UAPI field `struct quic_transport_param::remote` (a __u8, so 0..255)=E2=
=80=A6
> - [Low] quic_stream_create() (net/quic/stream.c:83-160) allocates each
>   stream with kzalloc_obj() and explicitly initializes only id,=E2=80=A6
> - [Low] Concern: quic_stream_free() is called from quic_destroy_sock()
>   (net/quic/socket.c:60), i.e. from proto->destroy, which=E2=80=A6
>
> --
>
> quic: add stream management
>
> Adds struct quic_stream_table and struct quic_stream along with the
> per-socket stream hash table, the acquire/release helpers
> quic_stream_get()/quic_stream_put(), the stream ID limit checks, and the
> transport parameter get/set helpers.  The table is allocated in
> quic_init_sock() and released in quic_destroy_sock().
>
> A few questions below about stream state initialization, the handling of
> the transport parameter "remote" field, and the teardown ordering.
>
> > diff --git a/net/quic/socket.c b/net/quic/socket.c
> > index 0e0a13235fa42..731c1e00dba2b 100644
> > --- a/net/quic/socket.c
> > +++ b/net/quic/socket.c
> > @@ -49,11 +49,16 @@ static int quic_init_sock(struct sock *sk)
> >       sock_prot_inuse_add(sock_net(sk), sk->sk_prot, 1);
> >       INIT_LIST_HEAD(quic_reqs(sk));
> >
> > +     if (quic_stream_init(quic_streams(sk)))
> > +             return -ENOMEM;
> > +
> >       return 0;
> >  }
> >
> >  static void quic_destroy_sock(struct sock *sk)
> >  {
> > +     quic_stream_free(quic_streams(sk));
>
> [Severity: Low]
> Is the stream table teardown ordering here what is intended for later
> patches?  quic_destroy_sock() is proto->destroy, and sk_common_release()
> runs it before ->unhash(), with no socket lock held:
>
> net/core/sock.c:sk_common_release() {
>         ...
>         if (sk->sk_prot->destroy)
>                 sk->sk_prot->destroy(sk);
>         ...
>         sk->sk_prot->unhash(sk);
>         ...
> }
>
> So quic_stream_free() frees streams->head and then stores NULL into it at
> a point where the socket is no longer reachable from user space but is
> still, in principle, reachable from the network.  A concurrent
> quic_stream_find() would then walk freed hlist heads, or dereference NULL
> in quic_stream_head().
>
> Nothing can hit this in the current tree, since quic_hash() is
> "return 0;" and quic_unhash() is empty, so a QUIC socket is never inserte=
d
> into a hash table and cannot be looked up from the receive path.  Would i=
t
> still be worth doing the free after unhash, or under the socket lock the
> way udp_destroy_sock() does with lock_sock_fast(), so this stays correct
> once the lookup paths land?
>
> [ ... ]
>
> > diff --git a/net/quic/stream.c b/net/quic/stream.c
> > new file mode 100644
> > index 0000000000000..6b34b117103a8
> > --- /dev/null
> > +++ b/net/quic/stream.c
> > @@ -0,0 +1,416 @@
>
> [ ... ]
>
> > +     /* rfc9000#section-2.1: A stream ID that is used out of order res=
ults in
> > +      * all streams of that type with lower-numbered stream IDs also b=
eing
> > +      * opened.
> > +      */
> > +     while (stream_id <=3D max_stream_id) {
> > +             stream =3D kzalloc_obj(*stream, gfp);
> > +             if (!stream)
> > +                     goto free;
> > +
> > +             stream->id =3D stream_id;
> > +             if (quic_stream_id_uni(stream_id)) {
> > +                     if (send) {
> > +                             stream->send.max_bytes =3D
> > +                                     limits->max_stream_data_uni;
> > +                     } else {
> > +                             stream->recv.max_bytes =3D
> > +                                     limits->max_stream_data_uni;
> > +                             stream->recv.window =3D stream->recv.max_=
bytes;
> > +                     }
>
> [Severity: Low]
> Should stream->recv.state be initialized here?
>
> The stream comes from kzalloc_obj(), and only id, send.max_bytes,
> recv.max_bytes and recv.window are assigned, so recv.state stays 0.  The
> send and receive states share one enum in include/uapi/linux/quic.h:
>
>         enum {
>                 QUIC_STREAM_SEND_STATE_READY,
>                 ...
>                 QUIC_STREAM_SEND_STATE_RESET_RECVD,
>
>                 QUIC_STREAM_RECV_STATE_RECV,
>                 ...
>         };
>
> which makes 0 equal to QUIC_STREAM_SEND_STATE_READY, while
> QUIC_STREAM_RECV_STATE_RECV is 6.
>
> net/quic/stream.h documents the field as a receive state:
>
>                 u8 state;  /* Receive stream state, per rfc9000#section-3=
.2 */
>
> and quic_stream_put() compares it against the receive constants:
>
>                 if (stream->recv.state < QUIC_STREAM_RECV_STATE_RECVD)
>                         return;
>
> This comparison happens to give the same answer for 0 as for 6, so nothin=
g
> misbehaves today, and the same field is what gets reported to user space =
as
> struct quic_stream_update::state.  Would setting recv.state to
> QUIC_STREAM_RECV_STATE_RECV at creation time (or documenting that 0 means
> "Recv") avoid an equality test going wrong later?
>
> [ ... ]
>
> > +/* Configure stream hashtable from transport parameters. */
> > +void quic_stream_set_param(struct quic_stream_table *streams,
> > +                        struct quic_transport_param *p, bool is_serv)
> > +{
> > +     struct quic_stream_limits *limits =3D p->remote ? &streams->send =
:
> > +                                                     &streams->recv;
> > +     u8 bidi_type, uni_type;
> > +
> [ ... ]
> > +     if (p->remote ^ is_serv) {
> > +             bidi_type =3D QUIC_STREAM_TYPE_CLIENT_BIDI;
> > +             uni_type =3D QUIC_STREAM_TYPE_CLIENT_UNI;
> > +     } else {
> > +             bidi_type =3D QUIC_STREAM_TYPE_SERVER_BIDI;
> > +             uni_type =3D QUIC_STREAM_TYPE_SERVER_UNI;
> > +     }
>
> [Severity: Medium]
> Can the two different interpretations of p->remote in this function
> disagree?  It is a __u8 in the uAPI (struct quic_transport_param), so it
> can hold 0..255.  The limits selection uses a truth test, while the type
> selection uses a bitwise XOR, so for p->remote =3D=3D 2 with is_serv =3D=
=3D true:
>
>         limits    =3D &streams->send              /* truth test: non-zero=
 */
>         2 ^ 1 =3D 3 -> non-zero                   /* takes the CLIENT bra=
nch */
>         bidi_type =3D QUIC_STREAM_TYPE_CLIENT_BIDI
>
> which leaves streams->send.next_bidi_stream_id =3D 0 on a server instead =
of
> 1.  Would !!p->remote ^ is_serv (or rejecting p->remote > 1) keep the two
> tests consistent?
>
> The follow-on in that state is that quic_stream_get() for the server's
> first bidi stream (ID 1) passes every gate: quic_stream_id_valid(1, true,
> true) is true, find() returns NULL, quic_stream_id_local(1, true) is true=
,
> quic_stream_id_closed() is false because 1 < 0 is false, and
> quic_stream_id_exceeds() is false.  quic_stream_create() then starts at
> stream_id 0:
>
> > +     while (stream_id <=3D max_stream_id) {
>
> allocates a single stream with id 0, advances stream_id to 4 and returns
> that stream.  quic_stream_get() reports success and records
> streams->send.active_stream_id =3D 1 for a stream that does not exist, wh=
ile
> ID 1 is now permanently -ENOSTR because next_bidi_stream_id is 4.
>
> A later quic_stream_put() on the returned stream 0 evaluates
> quic_stream_id_local(0, true) as false and decrements
> streams->recv.streams_bidi, which was never incremented, so that u16
> underflows and feeds quic_stream_max_streams_update().
>
> quic_stream_set_param() has no caller yet in the tree, so this is
> forward-looking rather than something reachable today.  Along the same
> lines, should quic_stream_create() return an error rather than a stream
> whose id differs from the requested max_stream_id, since no caller can
> detect that today?
>
False:

The caller of quic_stream_set_param() added in the next patchset validates
p->remote and ensures it can only be 0 or 1.

Thanks.

Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365733C5DC3
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 18:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789582132; cv=pass; b=Cl6p6x6hxiM7eFr5pUNHzKNYOKZenlT66ePybmE2zuqEh4F0hnDuCP1UyunK6Q3TZCOwl4Urmy4xhbxYYbo3AwnGvR2h9gZImt/nCUIs9PQndSTel85jXYURJZT/o8ZGl2/8orRjU79aASluXnzAilbgtGvchmsYyqGAy1KA75I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789582132; c=relaxed/simple;
	bh=F7I1BNfKVLFa4ZA/B7t0vEn92pcVyy0nU1EvtPmr7yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBssMKxRNnGQPkk4M8yikl1jlyXIUGi2V0VVYd6xmPIbxOje/XAuCoD0XR2HJz5LucCrOf1/wsnaKWn1UGnoqRyxcHN5L5rVy6GtHugr0eUD0pkgmR5/5xf0Z1NOZJYyTBTNJr69Y6m6DiqdAOL81mBwDcl8FoLjyMhHZk7H2UU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGGho5PO; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGGho5PO"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-868a9c48f9eso1206055b3a.3
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 11:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789582115; cv=none;
        d=google.com; s=arc-20260327;
        b=aRs1Jg+17nRxEIkwCRIzJCME/qh/e+MIf3qSvJzsvDqOMPQzLQBMkvN6trQ8AbIyv5
         ScZA13sfEVxLhwsIk53Tpr3xgaBkbfmeuclZsRCCOAdaWyOJefDDnFUg+CpRDMKANil9
         panxiKBNJZJuiPdz8mtK7mxQE75tySLxlg+DTPS9kvETHzgxDT34R3uiKURVR+TqrGdE
         Gh4EpqGRIaS5hxXHPv4HHeDu9t3GbH0kKZlJftiehWNOFv+cag6bS8QHOrPRS3S3T44c
         r6FzoxkzmUeKo17N8rqPTzPxhHH2DFopqrWwN9pZnMpMlQws0JKwvrdR5FCmT5qx2gvF
         Cebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zk7ZRTa4/uNbLSjjz64qbMgZu6SnZnQXxXCrw4XD3tU=;
        fh=CVPEb5Y3YwDdqUQHIw2/Yy2/nGEZpAIbNQj9OW6uhCg=;
        b=SHGJ0cdItPbnWFdZ1xNXLs/GnUsBN/L4rcIap3I52N7CSX0TukKbths8AdIg+WBnAx
         cC5EBokgH5KxJDBayKg/tCU2JCRm6xO6FiJf7FdY/qHeQiI4h5i070UEgDmfarw6zi2p
         DvMUAhiGm3jWHzpkwzgS26ww9+ILv2cIFZqEO3B3U8N9cqEGdtLfjA8FCn9HMGm3XpEk
         4gb41pl8H+3PPPe1515tt6EXPuAPJi1keDgVjuzf/OPTM/snd088ZH6VQ6yTp9cbqLwL
         xEyxlUtPv2PYV74gt53vnCB04MbbAcfyPcDTOhCha8/8Y8hzeDH4suxBjT1v6nWIewzD
         7Wkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789582115; x=1790186915; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zk7ZRTa4/uNbLSjjz64qbMgZu6SnZnQXxXCrw4XD3tU=;
        b=fGGho5PODKPYhZJF41zvGfgrQhU6vGIP0Z/wn3tMeqKBd8XUdOvtuQ0d108T+CjGh7
         GymYws6AwqEVPKCwHuESHDkUg1UN0l3ADNYL/y9sU69hT7QLE4t1RO91lR8VPuzAtRVB
         gA1N8JyNq2/n8OvQIkDmCo/RfuUrHYkV98ua0WTan2ceWgdmU7k6a/TlU8skUsG3THXF
         l3NH5GJdG5hCiPJpdCh2Y9PljRsmWxX4SDMiESPMGE7hNOECrODw72qQ0cBYRtjLNRi7
         joF/qty8zmrs/js0E3EmGUI6mrONYE0gq5BBUlEL/JrFJb7LqcLek7Z5mLBfi59K91+a
         Jy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789582115; x=1790186915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zk7ZRTa4/uNbLSjjz64qbMgZu6SnZnQXxXCrw4XD3tU=;
        b=KAjD1L9h0Ag7o2/9X9k8FrI5nKs5NTLooMyrK0y76lzTARaEIS2dcpQ0Y49+oFkqOp
         bU4lLpi1AhmMEihN4pEABjKyl7jUg+5aea150ZTzRhoNg6uJDU3oybzejzJbfNF62MHm
         7yZcU3ttAgCn3vmJD7RePNRXY/T9r5uLoFz92CK8P+1aVvp01Jj375ZTDZw5sTURbzCq
         +zrCtKiejw2aZLZC9Popu73coWt7ks94KElFKjzRmYNMEyv+44edXCsgE/NomhpoaTAy
         k2zTpED9kW8tdBhKPPBo/mc2+pt7C6psmGHdfOTkRnOhgsdrp1vXxjpGH0KrJCnT4xnR
         f6bA==
X-Forwarded-Encrypted: i=1; AKwUvBwe4IjhhXPq6D4jS3TVtv0yz/N4R0ngJ7JhwcvBoMD/xqhPb9MMfFJTIIBW8AaRB7ACmOJ7Tj/7b9uNQUMomW5jtDikkA==@lists.linux.dev
X-Gm-Message-State: AFuF++k7uHWwNCfIRLk+8jieumDE8rgESE9qFIe4p7eOne1egnTrniWc
	FsdxkU4XZUu/OzDF3O3K7ZaJInTnR0TlK8PsWzPTGQdssb6iFvcSp98C9PSOb8pNj/rBRjtPIE3
	+zk6R3gj374VShtPHVLZ9ApXDck1hDOs=
X-Gm-Gg: AYBFou0daVuHJxUAUDU2xhJpVh2U8CZ6byRXAoG5sIM2t7BwcAtxRk6Bewd60QXm6Xo
	uRw0EbLjI6sJBcQCMbvknZ9W+/+LfZwCoxlnot9LhM1CASF94gIxJVAV1YkF9MAZBQCdP9lEnVz
	Tg3hJSZeqS221IpUyUMMQk1KDpL0QBmG03Gw4ar3Lx9kgszcKHDiGl6l1vg85ayjcWUoQD+6HeN
	YVgavOp69bP5hrOtcMEBLU9r3Ci/YpIR/RqtTYBuJYEu6gvC6bw/gCS66SiKLqwnqFYkTf7o6GM
	QLZNWQoSqAjTz5c3qmqxNr8Pv9hpcNOKSjPrsDeROdUvBXc8Bfz5275nt2BisYBM8rEwZMcmwNJ
	1eBw76covAbwxewzaFFvOOCcLRO7W2NxMzLUC/Ki/lQJSsoPU+I2r4UYi
X-Received: by 2002:a05:6a00:8d94:b0:869:7511:b860 with SMTP id
 d2e1a72fcca58-8723adafcd5mr7745685b3a.5.1789582114578; Wed, 16 Sep 2026
 11:08:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <40d0796769992c78bffe59b179833d71ed80e771.1789393775.git.lucien.xin@gmail.com>
 <178950186149.22033.824022402798948504@kernel.org>
In-Reply-To: <178950186149.22033.824022402798948504@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 16 Sep 2026 14:08:22 -0400
X-Gm-Features: AcwNN1VnRxRax7MXc9uJwht51A6Q_JluQ9yCTvI8wNhK1nENvOaIslNzFN3HMaQ
Message-ID: <CADvbK_dHPkHjkPwu0RepYgDsHs5reHepprRHU9hDFBxQM9_RGw@mail.gmail.com>
Subject: Re: [PATCH net-next v15 15/15] quic: add packet parser base
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
> Thank you for your contribution! Sashiko AI review found 7 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 5 =C2=B7 Low: 1
>
> - [High] quic_request_sock_create() publishes a newly allocated request
>   before its first packet is successfully queued: it links req into=E2=80=
=A6
> - [Medium] Commit message understates the scope of the patch and does not
>   disclose that the newly added listen-side connection-establishment=E2=
=80=A6
> - [Medium] quic_listen_sock_lookup() passes hdr_len =3D 1 to
>   reuseport_select_sock() (net/quic/socket.c:292-293), but by the time=E2=
=80=A6
> - [Medium] In quic_accept_sock_exists() (net/quic/socket.c:132-135) and
>   quic_listen_sock_switch() (socket.c:~330) the indirect call is=E2=80=A6
> - [Medium] A QUIC Initial decryption failure inside
>   quic_packet_get_alpn() is counted twice and once under the wrong=E2=80=
=A6
> - [Medium] quic_packet_listen_process() treats every non-zero return of
>   quic_crypto_verify_token() as a peer token-validation failure.
> - [Low] The documented meanings of struct quic_packet's saddr/daddr are
>   the reverse of the new receive-side implementation.
>
> --
>
> quic: add packet parser base
>
> This adds the RX side of the QUIC packet handling: quic_packet_rcv() look=
s
> up the socket for an incoming datagram, quic_packet_process() dispatches =
it,
> and ICMP Packet Too Big errors are turned into PMTU updates.  A listener
> path with ALPN parsing, request sock creation and a per-socket deferred
> workqueue is added as well.
>
> A few questions on the new code below.
>
> > diff --git a/net/quic/packet.c b/net/quic/packet.c
> > index a1967f39c9242..db87c32d7469d 100644
> > --- a/net/quic/packet.c
> > +++ b/net/quic/packet.c
> > @@ -14,6 +14,768 @@
>
> [ ... ]
>
> > +/* Decrypt Initial packet and extract ALPN from TLS ClientHello for AL=
PN-based
> > + * socket demultiplexing. Marks packet as decrypted (cb->resume =3D 1)=
 to avoid
> > + * redundant decryption later.
> > + */
> > +static int quic_packet_get_alpn(struct sk_buff *skb, struct quic_data =
*alpn)
> > +{
>
> [ ... ]
>
> > +     cb->sync =3D 1;
> > +     net =3D sock_net(sk);
> > +     err =3D quic_crypto_decrypt(crypto, skb, GFP_KERNEL);
> > +     if (err) {
> > +             QUIC_INC_STATS(net, QUIC_MIB_PKT_DECDROP);
> > +             return err;
> > +     }
>
> [Severity: Medium]
> Is a single dropped packet meant to bump two drop counters here?
>
> quic_packet_get_alpn() counts the AEAD failure as QUIC_MIB_PKT_DECDROP an=
d
> returns the error, and the caller in quic_packet_listen_process() then co=
unts
> the same skb again:
>
>         err =3D quic_packet_get_alpn(skb, &alpns);
>         if (err) {
>                 QUIC_INC_STATS(net, QUIC_MIB_PKT_INVHDRDROP);
>                 kfree_skb(skb);
>                 return err;
>         }
>
> net/quic/protocol.h documents these as distinct reasons:
>
>         QUIC_MIB_PKT_INVHDRDROP,     /* Dropped: invalid packet header */
>         ...
>         QUIC_MIB_PKT_DECDROP,        /* Dropped: decryption failure */
>
> So QuicPktInvHdrDrop ends up reporting drops for packets whose header par=
sed
> fine.  The same applies to a quic_crypto_initial_keys_install() failure i=
nside
> quic_packet_get_alpn(), which is not a header error either.
>
True:

quic_packet_get_alpn() doesn't really perform QUIC header parsing, so I'll
remove this QUIC_INC_STATS(net, QUIC_MIB_PKT_INVHDRDROP).

> [ ... ]
>
> > +static int quic_packet_retry_create_and_xmit(struct sock *sk)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +static int quic_packet_version_create_and_xmit(struct sock *sk, gfp_t =
gfp)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +static int quic_packet_stateless_reset_create_and_xmit(struct sock *sk=
, u32 len,
> > +                                                    gfp_t gfp)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +static int quic_packet_refuse_close_create_and_xmit(struct sock *sk,
> > +                                                 u32 errcode)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
>
> [Severity: Medium]
> Could the changelog describe the listener side that is added here?
>
> The commit message says:
>
>   "Similar to the TX path, handling for application and handshake packets=
 is
>    not yet implemented."
>
> and names only quic_packet_get_alpn(), quic_packet_rcv(),
> quic_packet_process() and quic_packet_rcv_err_pmtu().
>
> The patch also adds the whole listen path: quic_packet_listen_process() w=
ith
> token validation and Retry triggering, quic_request_sock_create() /
> quic_request_sock_lookup() / quic_request_sock_backlog_tail() with accept
> queue accounting, quic_accept_sock_exists(), quic_listen_sock_switch(), t=
wo
> socket lookup helpers and a per-socket deferred workqueue.
>
> At the same time every response the embedded RFC quotes promise is one of=
 the
> four stubs above, and the skb is then consumed, so those packets are sile=
ntly
> dropped rather than answered.
>
> And the request socks produced by this path have no consumer in the resul=
ting
> tree, since the registered .accept callback is:
>
> net/quic/socket.c:
>         static struct sock *quic_accept(struct sock *sk, struct proto_acc=
ept_arg *arg)
>         {
>                 arg->err =3D -EOPNOTSUPP;
>                 return NULL;
>         }
>
> so requests that are created, charged with sk_acceptq_added() and signall=
ed
> with sk_data_ready() can never be dequeued.
>
False:

quic_listen(), quic_bind(), and quic_connect() are not implemented yet, so
these packet processing functions cannot actually be reached at this stage.
It is fine to leave some of them empty until the corresponding socket APIs
are added.

> [ ... ]
>
> > +             /* Verify Token. */
> > +             crypto =3D quic_crypto(sk, QUIC_CRYPTO_INITIAL);
> > +             err =3D quic_crypto_verify_token(crypto, &packet->daddr,
> > +                                            sizeof(packet->daddr),
> > +                                            &odcid, token.data, token.=
len);
> > +             if (err) {
> > +                     if (!retry) {
> > +                             err =3D quic_packet_retry_create_and_xmit=
(sk);
> > +                             consume_skb(skb);
> > +                             return err;
> > +                     }
>
> [Severity: Medium]
> Should a local allocation failure here be reported to the peer as an inva=
lid
> token?
>
> quic_crypto_verify_token() does not only return token mismatches:
>
> net/quic/crypto.c:
>         token_buf =3D kmemdup(token, len, GFP_KERNEL);
>         if (!token_buf)
>                 return -ENOMEM;
>
> and it also propagates -ENOMEM from quic_crypto_token_protect(), which
> allocates via quic_crypto_aead_mem_alloc().
>
> Under memory pressure a client presenting a perfectly valid NEW_TOKEN tok=
en
> gets a Retry it should not receive, and one presenting a valid Retry toke=
n
> takes the rfc9000#section-8.1.3 path:
>
>         errcode =3D QUIC_TRANSPORT_ERROR_INVALID_TOKEN;
>         quic_packet_refuse_close_create_and_xmit(sk, errcode);
>
> Would it be better to distinguish -ENOMEM from a real verification failur=
e
> and just drop the packet?
False:

I think it is fine to treat it as a verification failure, since memory
allocation is part of the verification and allocation failures are very
rare in practice.

> [ ... ]
>
> > diff --git a/net/quic/socket.c b/net/quic/socket.c
> > index 1e278a2109b2f..0fcb123d31bba 100644
> > --- a/net/quic/socket.c
> > +++ b/net/quic/socket.c
> > @@ -24,6 +24,324 @@ static void quic_enter_memory_pressure(struct sock =
*sk)
>
> [ ... ]
>
> > +/* Create and enqueue a QUIC request sock for a new incoming connectio=
n. */
> > +struct quic_request_sock *quic_request_sock_create(struct sock *sk,
> > +                                                struct quic_conn_id *o=
dcid,
> > +                                                u8 retry, gfp_t gfp)
> > +{
>
> [ ... ]
>
> > +     /* Enqueue request into listen socket=E2=80=99s pending list for =
accept(). */
> > +     list_add_tail(&req->list, quic_reqs(sk));
> > +     sk_acceptq_added(sk);
> > +     return req;
> > +}
> > +
> > +int quic_request_sock_backlog_tail(struct sock *sk,
> > +                                struct quic_request_sock *req,
> > +                                struct sk_buff *skb)
> > +{
> > +     u32 limit =3D sk->sk_rcvbuf / sk->sk_max_ack_backlog;
> > +     int len =3D skb->truesize;
> > +
> > +     limit =3D  max_t(u32, limit, QUIC_MIN_UDP_PAYLOAD * 4);
> > +     if (req->blen + len > limit || !__sk_rmem_schedule(sk, len, false=
)) {
> > +             QUIC_INC_STATS(sock_net(sk), QUIC_MIB_PKT_RCVDROP);
> > +             kfree_skb(skb);
> > +             return -ENOBUFS;
> > +     }
>
> [ ... ]
>
> > +     } else {
> > +             /* Socket not busy: process immediately. */
> > +             sk->sk_backlog_rcv(sk, skb); /* quic_packet_process(). */
> > +     }
>
> [Severity: Medium]
> Is the annotation on this indirect call right?  .backlog_rcv is
> quic_backlog_rcv(), further down in this file:
>
>         static int quic_backlog_rcv(struct sock *sk, struct sk_buff *skb)
>         {
>                 return quic_packet_process(sk, skb, GFP_ATOMIC);
>         }
>
> The existing site in quic_packet_rcv() spells it as
> /* quic_backlog_rcv(). */, so the two new sites here and in
> quic_listen_sock_switch() look inconsistent.
>
> More than the name: quic_listen_sock_switch() runs in sleepable context (=
it
> calls release_sock()/lock_sock() around the hand-off and is reached from =
the
> deferred workqueue), but routing through .backlog_rcv pins the allocation
> flags to GFP_ATOMIC, which defeats the gfp argument this patch threads th=
rough
> quic_packet_process() so that quic_packet_deferred_work() can pass
> GFP_KERNEL.  Should those two sites call quic_packet_process() directly w=
ith
> the appropriate gfp?
>
True:

It would be better to call quic_packet_process() with GFP_KERNEL instead
of GFP_ATOMIC in quic_listen_sock_switch().

> [ ... ]
>
> > +struct sock *quic_listen_sock_lookup(struct sk_buff *skb, union quic_a=
ddr *sa,
> > +                                  union quic_addr *da, struct sock *us=
k,
> > +                                  struct quic_data *alpns)
> > +{
>
> [ ... ]
>
> > +out:
> > +     if (sk && sk->sk_reuseport)
> > +             sk =3D reuseport_select_sock(sk, quic_addr_hash(net, da),=
 skb, 1);
>
> [Severity: Medium]
> Should the hdr_len argument be 0 rather than 1 here?
>
> quic_udp_rcv() already did skb_pull(skb, sizeof(struct udphdr)) before
> quic_packet_rcv() is reached, so skb->data points at the QUIC payload, an=
d
> reuseport_select_sock() documents hdr_len as how far the pointer must adv=
ance
> to reach the payload.
>
> With a classic SO_ATTACH_REUSEPORT_CBPF program, run_bpf_filter() does:
>
> net/core/sock_reuseport.c:
>         if (unlikely(!pskb_may_pull(skb, hdr_len)))
>                 return -EINVAL;
>         ...
>         pskb_pull(skb, hdr_len);
>         ...
>         __skb_push(skb, hdr_len);
>
> so the filter would see the datagram starting one byte into the QUIC head=
er:
> all its offsets are shifted and the first byte (form/fixed/type bits) is
> invisible, which can select the wrong socket in the reuseport group.
>
> [ ... ]
>
True:

BPF programs may need to access the QUIC header, so I will pass 0 to
reuseport_select_sock() to ensure the full QUIC packet is visible.

Thanks.

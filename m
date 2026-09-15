Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008203DA7D4
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 15 Sep 2026 21:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789508072; cv=pass; b=TOlE7FLeYsdsmbpLOm8rWjWaS4b3Y3y3RcKKwYRL8wyTud1onQ9pcoEXjzJ7/Snkxmf9ueYceY/QZlSx1dwM6lvJ+6tjIqXbrIoU9817iA9R053VmTUIqd8nuq2gWZ2Pf9uXWc26yBramkVUSD6HjhjYf9vkdYPcUFuMNZShu9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789508072; c=relaxed/simple;
	bh=3tSi6YPO6dZgLOttRBqCdbt4IoBwpA72PAaMe+M45Sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TaKZtZc8TL3b2vc6KcmC/IOchjKmVYfjFYuDek1SyUhxqD/H1XPsfPRhZCASXIvgwRu3jNC74M4LDUFRcySNXvBGbKRFStK7cRDAARiUc2xDwTt23WonaqWtvAAQpo+uyX8dD8x6MBT4Z0NE2uMTKbFq9liNfc2GhRFvrB9oqs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HeF6IWkj; arc=pass smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeF6IWkj"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so243366a12.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 15 Sep 2026 14:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789508069; cv=none;
        d=google.com; s=arc-20260327;
        b=aeHcS4dl99ZHeGSJvHeuzcSoooni81NKGkuxYIvboXUz9c2AOjUMe/X6S+Qp5w/TiD
         TJk2VqYZVAOSc1SIMq7CPlmirG73+r6o5veBQ+m3425MqU/i3CxuKKVd+Y6M3Rv8p+CN
         1SkogQPA12TvLlHX7srMuo9+vlKgGrPcyWjZwt/rWA5Ref+9mvLP62dxTtziYW51IUdn
         3erAvBTARbVFzOhkTzgnxXhYAO8ixVblSXD+w+CM4TqpG2gMQfUvq0GtCuzRQXscCfiv
         30LW0OnOIuY0ticBw52CqKqZnYwnbFpDDIz1qGlaFp020D0d/syp9vWUmV48ZCw1DjDu
         fP4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0fEUb43A7umW3ihvJnwkK88IB+JsXUCBhQ/HexoLCXg=;
        fh=lE1dD+HEj/lTi0Mvgq5YhjcHudEtMnR+H0zC6kkJYDM=;
        b=dfDvSOR+qdlMPfslTG0olU+ZMx84h2J5XeVv71wPnOq+IOAvld2uMtIzLPyCdrNx38
         TBwG9Bg/PZTjfLFiDACkqXDeF1vPczqwtIhWtYPmsUgnjM90EpGPeWEKrJDl+0fDJBBa
         N/mk3Tah3TeLBg7xu9YkHFPplRqnBWOraeldDmGxRdp0rgGsqpVRsOoXe2DX2EPaOrgK
         alpLd/AawqfA/AM2LK4fpnTNPe1uL4XGB4LwUv57k8eNQlbcgFoY6dAOOoAYIomPU8m9
         FqC1+HOU9SBUYQgTwtLwZBmAv9jLosyU7hJejaBKetvjJ6fOKauTLLEaDCVrAaCHY8jq
         KRmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789508069; x=1790112869; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fEUb43A7umW3ihvJnwkK88IB+JsXUCBhQ/HexoLCXg=;
        b=HeF6IWkjp2y1826RN0ImWtM5n+6GMLPtW0Vnoq2BtmqSz7h4c4yQtex/9aTbvUQz4g
         QyC8LUMJmpSlTkUPxzOBJC+Nj36yw76Hun9IQtBmapwBXWNqfRnBafbii1kReVX2BECV
         ItI8e0qt0Gmr9/CKmO+4eqUlUNrEOdnm/6SZNhq+x5mmMYUd5OVdB0GY/Y15UwEuyD5s
         JJYFzqB4f9eYMaAHH/KehZhWJ0cAnJAkc2jcvV0k32hh4W40HS7du0KrN8MlNIfBEzng
         mGTNeTLnlt60hwnQe4QjsNcBUa4AXwjkkUNEjuvVdKK55NL34R6TVCeStH8rdt8owhtX
         TNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789508069; x=1790112869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fEUb43A7umW3ihvJnwkK88IB+JsXUCBhQ/HexoLCXg=;
        b=ESqxxDjM+CzKRGPbvEcgKWrPCfm8dJq03hZMOUUHXKFzWUetQY1fSbFugzb22O1vy9
         nusND5c3+z7VGUdA/fdkzn5cGUYpX6vbkL6sAvr62ChqNS2FHZJSycjCXr3a3NTyslie
         rZfBORxqDtW7ko92HA6if1Vh9W7PS+gEGTcdHMYoZQsWeLW3nuFnYJJIqOtAzscfrM1u
         E24ls1Dixeq/oqRxBd1ZWJF5r+zODm3AAhnTBRrOecCvyq7SLNjUmMgsOQ1NjFG8kxUL
         JNSAYYvg63DeddPi5y1ZSeQjTI8iAVnNLNJ8QI8wG+j8YAyTNpKrcVybhz8aWxdoQ0qx
         qdsg==
X-Forwarded-Encrypted: i=1; AKwUvBwQ4KzWTvdlvM0RCATHGHstM0dCLU+FMse0WDZmNbXoxPRWM/nrm07DeqTPmGhS/6PTjXTmE28cLmz7W3ckP+1EweDZWQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nVXlYdMePpr+ePtXSC/U5LXR/2PWmZWrcXtr8a89dL7tvbhRcv
	pjm23xm9JhA0ePk7/aK7CxTGOL50Ukjfe/eO6MBXokIQ5BKSplBqnowNlQ5zT3QT9HVoFVUhvHc
	0HlXytopKDdV2C3nW+UqUSr6ZroNilrU=
X-Gm-Gg: AYBFou0rca9FEw+NeXJHNIAoZOoYgBqknW+UyT84aGSxztUYBbr6A4JUlCC/hvMe1yQ
	774ns/EAh48bNRk6at13PJzmz+98JsCziekYl5HvKZJCP6LIhnrNaF0PyZnDhhWMnaE0A2kv/8o
	vau4qrdhngCkxaLRtxxy1wxKzeqTLacJ/9JWrS4rxAr7lrRxNs6tZsN4sKBWIijbw8JKbOUZlwD
	6ph7cnsa8+JZneeej9uSryTxm172ibrYA0oZT73Pub8d39asBba/IuLUiQt32DSOzQL2UDWaKay
	nnUK6v0zVhDx10Npy/RCNjth0504mg2Grn0SRcwjD6KN0KU7fqefCYwA6X0RhuqC1doOJxKqjyu
	VBGq6sGhrYyplWyFlzXlIMTEkxSmnI7VuRjcLGs1Sgcc0y1FILpzWtg==
X-Received: by 2002:a05:6a20:914f:b0:3da:bd6d:bef4 with SMTP id
 adf61e73a8af0-3dd5f5ab21cmr393026637.13.1789508069183; Tue, 15 Sep 2026
 14:34:29 -0700 (PDT)
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
Date: Tue, 15 Sep 2026 17:34:17 -0400
X-Gm-Features: AcwNN1UCuBUgm-EOueiaZPczPJIdPSEaimJ2WD6qHGHnlwNL-00IDB4em_SMmw4
Message-ID: <CADvbK_foTup7AgsmLPa0=Wabmkj=6QFrzYZ1jFRQX+Wti1_Vbw@mail.gmail.com>
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
> [Severity: High]
> Can this path leak the quic_request_sock and permanently consume an accep=
t
> queue slot?
>
> quic_request_sock_create() already published the request before the first
> packet was queued:
>
>         list_add_tail(&req->list, quic_reqs(sk));
>         sk_acceptq_added(sk);
>
> and quic_packet_listen_process() then hands it straight to the enqueue:
>
> net/quic/packet.c:
>         out:
>                 /* Add to backlog list and wake blocked accept() calls */
>                 return quic_request_sock_backlog_tail(sk, req, skb);
>
> On the -ENOBUFS path above only the skb is freed.  The request stays link=
ed in
> quic_reqs(sk) with an empty backlog, and sk_acceptq_added() is not undone=
.
>
> The size test is deterministic for a given packet size, since limit is
> max(sk_rcvbuf / sk_max_ack_backlog, QUIC_MIN_UDP_PAYLOAD * 4), so a clien=
t
> sending a large Initial fails on the first attempt and on every
> retransmission, and the slot is never reclaimed.  Repeating with differen=
t
> addresses or DCIDs would then make sk_acceptq_is_full() refuse all furthe=
r
> connections.
>
> Should this failure path unlink and free a freshly created request, or sh=
ould
> the request only be created after the first packet is successfully queued=
?
>
False:

This does not leak the quic_request_sock. The request remains on the
listener's accept queue, so accept() can still consume it and create the
accept socket.

Dropping the skb here only means that this particular packet was not queued
due to the buffer limit. The peer is expected to retransmit the packet, and
once the connection is accepted, the retransmitted packet will be processed
by the accept socket.

(I will check those with 'Severity: Medium' of this patchset tomorrow.)

Thanks.

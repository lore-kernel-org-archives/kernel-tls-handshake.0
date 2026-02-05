Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586C830C613
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  5 Feb 2026 19:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770318191; cv=pass; b=irJXfYuQlxEKDlqLHlnMNEromQTV1X1W5VeoqAbTRlyuOR0WMZL2j2lAGUY5Pu4OjScPzoSgoOf+hYzEXCvhAVg5lFuLBYES5duvRWeDpoo5/iclIBAmP89gM2tpPnR5nOQ9tpbGquu1xzmnybqHK+/joIQF2mM1HaLZnmF0Tzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770318191; c=relaxed/simple;
	bh=Sv7j14ymtGLHlmTqP+BoOPCTX/cQqHoGUXoIMpAvOkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TFyORZ2d8+D/GLByDItoIcXE4hKdIw74OB8C81ENTYvl0goISZ32XBO1nAjLaOZ45uYvEASOMKkQxv9du+wwPJvJ6WX2np/ej2+yefKOFSEtW6gHzS2YvOaB/nLuLcWyhzUwEEipPg0Ho/yobct8fXnwY8jyapK+XWh7p6by/ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgOttGnv; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgOttGnv"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c2dd0c24e5cso394894a12.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 05 Feb 2026 11:03:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770318191; cv=none;
        d=google.com; s=arc-20240605;
        b=JaZmAykXplak/w1Apkaxldx+9qyDoRrlQGIWI4gZ2/ysSyYMiF/+btmhEOcugt0+gR
         hswjdXz12PRRgffcWUb0WTLqomlcyAGIa4tzUwxhEy3NsTYRS26SaPsD3HPs+S65MaBN
         3ULR/oeKryBxndNvA5bACq83yet3ZeU6RaMLZheQvrsmV+X4g3DdKBkaNLDJPeSfYr+J
         mQFX4R3IEXPL7bUI2FCCX4Q9MUhcukQOZE+qNmUAueT3j1yM8QLnsQkx3CiGHnNTkzjg
         39+uvepWaIAh0ocDvEW+hj9/r2Db327kURNA9T20QHhYtqT6xSKvaP17s163Cz8LX/rk
         IcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wMq2czingLs1wcNHuupFAGOHUrKeCMVUSnWEEmpxoVE=;
        fh=TfPVlhft9IjVw088udTZqOUKLDk7hD34Jh7r4rlrY48=;
        b=NmDyZyPcgkA5WDmVrZTEF7lGOV1CcXu+ZFiUeWoytYNdz1Az8U54f4wuDHtxiHop4W
         bJCViWVFSLn2kE2kUwYhxPgDSJXprMxAjeGiXOEu2ieP08kcVqu6j5i635ofK0xli0+N
         Q5DqsQ9RhLeWpAg+VoaThTCjcny0RCJ6wwxRea9BXB/MbUOqUiZpW3zoTgkWhphNMnoM
         28GqLOKC4brh226UaNmN2YJeeel+cm6YgJzNmfyWhzygmruH1eFThCyJ9i29d9aIYJT7
         qlKUKZAaSqfivGOrqX/D2AClM5jIVJsKU+2ET7ImBDDmK7eB2KJsxdvjBervQA3ELBlm
         cMwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770318191; x=1770922991; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMq2czingLs1wcNHuupFAGOHUrKeCMVUSnWEEmpxoVE=;
        b=AgOttGnv/GF3e0kTs9t0jsOnwHLCeiV5MK47UjdtqnSfsTb/uKs04pbR2UE0hZWVG5
         fSH+Cw7Yx8GRXDoI3PS/1CIocDwO380T7hTCd5ODTV/lk7kqJDxIwdIRFtE+EJJF/kMk
         TfVN1NF56O8wUZ5Q5cTjwCMSrEUt7xiiicfrl17k3MxAwqix7TTosjqgn4boVn/dSicw
         GxX2wPS6XHFz7hpc+BhnsJEbpSkctLtPitKv9Djf4aqD2ofhujc1WJdoNDEU2LYH0iKq
         qEn1tLGhSaVe/qcQXH90HKmTnPY7BuXEonK5peXSx/rEjhnWgjYQyJi+yuUETegjUsy6
         dotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770318191; x=1770922991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wMq2czingLs1wcNHuupFAGOHUrKeCMVUSnWEEmpxoVE=;
        b=xFCZQsva6R+9Aeoq+rMjQOQdfXVFVCVwqi611qdMwkwqJC2e3S2ytmh+yjM46JvOQE
         3CNnvZEoWD8kHFprBtv+ExNO3HnwmvM4Nzze64Lv4COm1mve1I2i8z9apsNHtRqKkQ08
         XX8Ux4z2df5GNrikD4wdX+0IyTUJAUSNxijK2jzoqmk8rlTy5JszWgMP+zJc2Ew0WpDG
         jQQBgopXVAbn4liWuxu32wrGaOmuBTc+7ZpYzW4x7iuz1J5wqJxSmzwvYW3LqMO+mDSd
         TwtyrINt3vMyNflA5lqC3dO1xrbSlhkaBtnqS30g/KOjE2JvUUSJd9ii8Om1pwLL8KlP
         5XSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKJ2SUB1QaOMMhXKyk9FhUfDsx7CqDHRXmEkQwYw7Q5jX2jwLTZ+g2xIiHDenrwMcxk2X7rlEU701D2bIS8CIiTOqVbw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHD3V1bp1InNKnKK3vEXNE0a6c3pHYD4CtW9D1Mk5dBAel1SJN
	3tQLWDM7Xx6SgNOB6pbmp10wA62CAdPnX16GA9kVFLRqhE40/vBPgycy5qqplaI/1a/e5VLF8HE
	QyB0sjMQOUdI6UXi2MCuVX0CpxU4hLLs=
X-Gm-Gg: AZuq6aLk9e3E4LBPOAXl0P/M+80LhX4+S64wkyanG8+MnYoNJwZXx5rHxpq/NiXdJGj
	lcgJ+S8CVoZIWd8pOkV2sRV19v4/BAXtee4nokkthEifQDEkXrbSwJttx6l/PKCiCv9sSxf9seg
	ZiG1kSN+bvu2q3qZuDlTcDbo6VZh9L1PN7Q8BF1bJeLLAwgg3SZN+KylvCYWWt/X4nOjvzXmrAp
	0bT41pUEiqQVU6ypzNpMlijqttBgFJ0HFQhJaq9uhW1bi2QfghIMnBpO9wB1ZrWeQ6jIl0+3RtD
	I7PfqbWDmNQkV+csw90jHeObRkBt
X-Received: by 2002:a17:90a:dfcd:b0:352:d59a:b28 with SMTP id
 98e67ed59e1d1-354b3cae091mr42496a91.19.1770318190665; Thu, 05 Feb 2026
 11:03:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <431335747d3604c46f2e57a32d839a73aa8a8536.1770042461.git.lucien.xin@gmail.com>
 <20260205115542.2195362-1-horms@kernel.org>
In-Reply-To: <20260205115542.2195362-1-horms@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 5 Feb 2026 14:02:58 -0500
X-Gm-Features: AZwV_QhI8OwuLRWeiqC_GNUtx69lACcTHyYZmGGt6r8v7RB2RzBMyspqQrCybPk
Message-ID: <CADvbK_e8Sbm8Q3KVR=uZZDYuQLTdprRskN=jgompaSeYDkmhFw@mail.gmail.com>
Subject: Re: [net-next,v9,15/15] quic: add packet parser base
To: Simon Horman <horms@kernel.org>
Cc: steved@redhat.com, marcelo.leitner@gmail.com, aahringo@redhat.com, 
	alibuda@linux.alibaba.com, jbaron@akamai.com, hare@suse.de, kuba@kernel.org, 
	tom@talpey.com, linux-cifs@vger.kernel.org, daniel@haxx.se, 
	quic@lists.linux.dev, jlayton@kernel.org, tfanelli@redhat.com, 
	dhowells@redhat.com, linkinjeon@kernel.org, hepengtao@xiaomi.com, 
	pc@manguebit.com, kernel-tls-handshake@lists.linux.dev, 
	illiliti@protonmail.com, xiyou.wangcong@gmail.com, 
	andrew.gospodarek@broadcom.com, mail@johnericson.me, edumazet@google.com, 
	pabeni@redhat.com, matttbe@kernel.org, netdev@vger.kernel.org, 
	smfrench@gmail.com, metze@samba.org, mbuhl@openbsd.org, 
	chuck.lever@oracle.com, dreibh@simula.no, davem@davemloft.net, 
	sd@queasysnail.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 6:55=E2=80=AFAM Simon Horman <horms@kernel.org> wrot=
e:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-loca=
l.html
> ---
> quic: add packet parser base
>
> This patch uses 'quic_packet' to handle packing of QUIC packets on the
> receive (RX) path. It introduces mechanisms to parse the ALPN from client
> Initial packets to determine the correct listener socket, routes received
> packets accordingly, and adds support for ICMP-based MTU updates by
> locating the relevant socket and updating the stored PMTU.
>
> > diff --git a/net/quic/packet.c b/net/quic/packet.c
> > index cf64a6aaa795..16a7db6ccd87 100644
> > --- a/net/quic/packet.c
> > +++ b/net/quic/packet.c
>
> [ ... ]
>
> > @@ -14,6 +14,637 @@
> >
> >  #define QUIC_HLEN            1
> >
> > +/* Handle ICMP Toobig packet and update QUIC socket path MTU. */
> > +static int quic_packet_rcv_err(struct sock *sk, struct sk_buff *skb)
> > +{
> > +     union quic_addr daddr, saddr;
> > +     u32 info;
> > +
> > +     /* All we can do is lookup the matching QUIC socket by addresses.=
 */
> > +     quic_get_msg_addrs(skb, &saddr, &daddr);
> > +     sk =3D quic_sock_lookup(skb, &daddr, &saddr, sk, NULL);
>
> Are the address arguments swapped in quic_packet_rcv_err()? Looking at
> other call sites in this file, quic_get_msg_addrs is consistently called
> with &daddr first, then &saddr:
>
>   Line 476 in quic_packet_get_listen_sock():
>     quic_get_msg_addrs(skb, &daddr, &saddr);
>
>   Line 513 in quic_packet_get_sock():
>     quic_get_msg_addrs(skb, &daddr, &saddr);
>
>   Line 536 in quic_packet_get_sock():
>     quic_get_msg_addrs(skb, &daddr, &saddr);
>
> But here quic_packet_rcv_err() passes &saddr first, then &daddr.
>
> Looking at the implementation of quic_v4_get_msg_addrs() in
> net/quic/family.c, the function extracts addresses from the packet as:
>
>   sa->v4.sin_port =3D uh->source;
>   sa->v4.sin_addr.s_addr =3D ip_hdr(skb)->saddr;
>   da->v4.sin_port =3D uh->dest;
>   da->v4.sin_addr.s_addr =3D ip_hdr(skb)->daddr;
>
> So sa gets the packet's source address (remote), and da gets the packet's
> destination address (local).
>
> Then quic_sock_lookup() in net/quic/socket.c expects:
>
>   if (quic_cmp_sk_addr(tmp, quic_path_saddr(paths, 0), sa) &&
>       quic_cmp_sk_addr(tmp, quic_path_daddr(paths, 0), da) &&
>
> This compares the socket's local address with sa and the socket's remote
> address with da, meaning sa should be the local (packet dest) address and
> da should be the remote (packet source) address.
>
> With the swapped arguments, quic_packet_rcv_err() would pass the remote
> address where the local is expected and vice versa, causing the socket
> lookup to fail. This would prevent ICMP Packet Too Big messages from bein=
g
> processed correctly, breaking Path MTU Discovery.
>
The code is correct, I may add a comment for the explanation:


        /* ICMP embeds the original outgoing QUIC packet, so
saddr/daddr are reversed when
         * parsed. Only address-based socket lookup is possible in this cas=
e.
         */

Thanks.

Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EAE3C9886
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 17 Sep 2026 19:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672015; cv=pass; b=sOjh6VzQqeZOc1kT2kHat9Ml7MvKNlWZvW85CpFgpzodv1KB4bLZrX9bdihl8asR2+sIdoUt9psSR/rfv9FkVw2JZHAdQn37B4/jS/pYUyqfpqvJfBpF/Z3cn83lSnhoWaV5ed5VB8vhm2a11UIqzlimea3yQ8LyRI4ogyBheeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672015; c=relaxed/simple;
	bh=qqBrqtVZFn6NsXxcXXIMtlSWkhWESw0qIbjgWLUJZHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jfxD6qxVrbl4+6eK8gDvGTfzTXBaQOJJTkVAfzvpeFvGYndUoao6d5RnRpXqrRkxHFWYnLToeqWAqvbmdVynYVViYUUESu6wm4treFyRZJo2JMmNZGNW4wGjzbFjpWKJfQG5Uv/TYClpHzsMNeESowyndbwRVpdjphZ8tH6XUgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=poCrWqCM; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="poCrWqCM"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb65437so7016a91.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 17 Sep 2026 12:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789672014; cv=none;
        d=google.com; s=arc-20260327;
        b=WumWFPmCCTJUC1OVvrbcL/ObPchqcdxib2q7j/0NGibRlako/+3O0zIc6TQxQUrGcu
         fZThqql4aRwp11WFtUzPOEjQIZprDha5JPLCgwUlOQ8u6Afmy6hoCMKt+1NDOgIoyWTM
         Z4Gq8e56+XeubvCQ75gPR+kESPJam3ko4FUNO7sjnHBAolbn1oEBUa+uoKoVASWqaOEP
         8ZV+SlAYLlGyN3liaIUh9LVXgKaVwdb5kjEwvvlLexG8AOR72knKjsDQPTJI6UCsGaks
         SKNQhKG842Yxm5VAbJBPMx3MbYgkKPMjeLObbKHCLJVuuwapqMDDSm/UIEb0z5+C/qUI
         7oyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AJdmTMqYmE/7xu/8ItFmggn+Kr8BDXFZhgiN1tzQfFI=;
        fh=Syjai3kwtJvywqVMS3gKPZ9K1caP+L/jjk+6w+6U1OA=;
        b=GV9/wIOoD7V8F+M1BMi0lVwuE7k2iJ+zOH5/r3274B12IehR0PWfZHggBDnPLxXciF
         Pq/8Dfobff6TQWLL40JcbIVp0V/cGjOlNkF9HbDH5BhqObe8SsnMFrJo93cmFc1XnnGd
         L4PtdajqId8fWNy6w848xopSvHa7lqYdrUxBfj7ulhyASFQUFf32RKkm/6WgIHCSORG+
         cFnrOE0vdvvgSHBKDgbU7IhHnlfAmcMTPlR2G/MlNfpKbIKg/QO1qJ9tmow19tGfR6Zm
         1qErXR3mKqvDD8Mp1Ty9W+okk61xAvqmyu4vjsG1lUY+N62xcU5KsAE6VtwxQSWuVo69
         xyCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789672014; x=1790276814; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AJdmTMqYmE/7xu/8ItFmggn+Kr8BDXFZhgiN1tzQfFI=;
        b=poCrWqCMvr2EbIQWEfR+NqVa4zGtElq/sl4situ0SiPK+8hH1MUSqSKn0NeEy6lV7f
         fFeXbsw0bP9TIxdTSxhM2aGbyH9m4wEVeP2N0MZfUFrIDTJTrTH4ynpUONkspxVa+1zF
         CXJ1g/k2AUNSh153+Sz08Ds9yi541Gp4xO4yJwaWzlJ5HuPdtQ6AofSN9V2w/9vA7z1O
         yCb4TxgnVf06uFUhARzZsbQvAJy3p6Fphiz3WTEr2Hzt0ldZjxwYRqhyQKU0JM2oT04X
         +jONybztfACq29mGr674VHvxkI2TfgjaGlPm+gVZSmWGaGGMVFdfIHdETQepMEVBjxJ4
         tiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672014; x=1790276814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJdmTMqYmE/7xu/8ItFmggn+Kr8BDXFZhgiN1tzQfFI=;
        b=OVZUyac035bcxnRC3/+/QPTLqv7M2HZ+QRqL85zobBMpe80Ud8jHLopvxI/Cv1QGun
         P1Db88i56zDlIYvnGy/EMluLScRPIfV5KFkVan178px/HxDhJw1MZW/eI2Sehr6ohyAX
         D82jg2sSfO0uGr/hYAb3cuoH5NIzCSqDcplUtKSnTx+845dByCEXCKtroqx4PyAuWBJa
         s5jfJ04c7+hCAZb34lwYzdwfqQ4pJ0IpJWvK+g+CtXAgJo87Se96gbDO7XF+wzAKwNrJ
         s8un1jPN+Rg7RCGNNPyKfd74tOn7Q47hkeengxju1h89bp24QFbilNLUCnZUfHZSaeaA
         JMPA==
X-Forwarded-Encrypted: i=1; AKwUvBwmNHX39M5tJofTugiCIVFxC9pFPGWoI9trbWtff2TIYw0Jj8qTbS5QUOidKS+pPjidV3PNKYRC9i+QTl4MHTm84IHorQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lld3yPF/U0Lb8pA/9Ov+8gp78AkTLv9b2niIlH24FE4kFJoJwX
	Q2hz+2ITp+5KfHRsfAJs48yZnsmMVQWYKE0C43hae3uB2VcLvpbTX+UkLURH1imqBLJA2jhYMtx
	VhdEOR86sa3wHO52uO5Oi7/ZbTGkU/XJkX2P4WV3i
X-Gm-Gg: AYBFou3Fins4UCSYbg6e/q7dP3xvt0CPzc9ARJauj9yvIWDfKZyaqS2poY+lpJne/7s
	+pYidlR62vNdPxFC5WN+SKzY3BNMY6eeXNfpagfLmwuSbGWSuPnYPHHCsMxRQgOphxlpQi+OIO0
	DEkF3zYALwVPJCVRtEuEyjFk+ouXZlzcSCXEr8sK8Igg7/JMaJps2MOIl+yBKkiuYId05psP/g4
	LGRoxT9Jao5xgCsXa86xoyV0dWuQP7u6b5TVyHb2Jq2xpx9gGqpPm3hf9O2/0REAulHWCKb0RAo
	qlnDljS6ZeuwqavyL7q/w5aS8sP9xGR1onUOyB5DuiIUIGQviOejFK6wfHyHtI8TNiquOtAjQAb
	dWZxw8tcUNirFWk6suaobw10QKgWTWEwQiOBNzKK/fwBjjnLFtoIjxSUyyyYUrLozwhbJ372wm0
	rTlgeVT3bK6Q3TiuYVvM6N9OG2qA==
X-Received: by 2002:a17:90b:54c4:b0:39e:4c7f:7308 with SMTP id
 98e67ed59e1d1-39e55071981mr225580a91.31.1789672013089; Thu, 17 Sep 2026
 12:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADvbK_dHPkHjkPwu0RepYgDsHs5reHepprRHU9hDFBxQM9_RGw@mail.gmail.com>
 <20260916234654.420056-1-kuniyu@google.com> <CADvbK_df5X=Szsd-d8=0gndhoBSHJhnEqSh826iYUW6=Ce_xEw@mail.gmail.com>
In-Reply-To: <CADvbK_df5X=Szsd-d8=0gndhoBSHJhnEqSh826iYUW6=Ce_xEw@mail.gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 17 Sep 2026 12:06:41 -0700
X-Gm-Features: AcwNN1Vf1Dgl1Yuz1331KMxjXrgwRsS9uLrWePJOZIUaTVSoZLWo_yT69Va3HQo
Message-ID: <CAAVpQUCRcBQOS4H5zJBOoYeCgsQBiGyu8gjhXaocDXDw9jqTOg@mail.gmail.com>
Subject: Re: [PATCH net-next v15 15/15] quic: add packet parser base
To: Xin Long <lucien.xin@gmail.com>
Cc: aahringo@redhat.com, alibuda@linux.alibaba.com, 
	andrew.gospodarek@broadcom.com, chuck.lever@oracle.com, daniel@haxx.se, 
	davem@davemloft.net, dhowells@redhat.com, dreibh@simula.no, 
	edumazet@google.com, hare@suse.de, hepengtao@xiaomi.com, horms@kernel.org, 
	illiliti@protonmail.com, jbaron@akamai.com, jlayton@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, kuba@kernel.org, linkinjeon@kernel.org, 
	linux-cifs@vger.kernel.org, mail@johnericson.me, marcelo.leitner@gmail.com, 
	matttbe@kernel.org, mbuhl@openbsd.org, mef@scarletmail.rutgers.edu, 
	metze@samba.org, netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, paul@jakma.org, pc@manguebit.org, quic@lists.linux.dev, 
	sd@queasysnail.net, steved@redhat.com, tfanelli@redhat.com, tom@talpey.com, 
	xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 6:38=E2=80=AFAM Xin Long <lucien.xin@gmail.com> wro=
te:
>
> On Wed, Sep 16, 2026 at 7:46=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.=
com> wrote:
> >
> > From: Xin Long <lucien.xin@gmail.com>
> > Date: Wed, 16 Sep 2026 14:08:22 -0400
> > > > > +struct sock *quic_listen_sock_lookup(struct sk_buff *skb, union =
quic_addr *sa,
> > > > > +                                  union quic_addr *da, struct so=
ck *usk,
> > > > > +                                  struct quic_data *alpns)
> > > > > +{
> > > >
> > > > [ ... ]
> > > >
> > > > > +out:
> > > > > +     if (sk && sk->sk_reuseport)
> > > > > +             sk =3D reuseport_select_sock(sk, quic_addr_hash(net=
, da), skb, 1);
> > > >
> > > > [Severity: Medium]
> > > > Should the hdr_len argument be 0 rather than 1 here?
> > > >
> > > > quic_udp_rcv() already did skb_pull(skb, sizeof(struct udphdr)) bef=
ore
> > > > quic_packet_rcv() is reached, so skb->data points at the QUIC paylo=
ad, and
> > > > reuseport_select_sock() documents hdr_len as how far the pointer mu=
st advance
> > > > to reach the payload.
> > > >
> > > > With a classic SO_ATTACH_REUSEPORT_CBPF program, run_bpf_filter() d=
oes:
> > > >
> > > > net/core/sock_reuseport.c:
> > > >         if (unlikely(!pskb_may_pull(skb, hdr_len)))
> > > >                 return -EINVAL;
> > > >         ...
> > > >         pskb_pull(skb, hdr_len);
> > > >         ...
> > > >         __skb_push(skb, hdr_len);
> > > >
> > > > so the filter would see the datagram starting one byte into the QUI=
C header:
> > > > all its offsets are shifted and the first byte (form/fixed/type bit=
s) is
> > > > invisible, which can select the wrong socket in the reuseport group=
.
> > > >
> > > > [ ... ]
> > > >
> > > True:
> > >
> > > BPF programs may need to access the QUIC header, so I will pass 0 to
> > > reuseport_select_sock() to ensure the full QUIC packet is visible.
> >
> > Why do you use reuseport_select_sock() here ?
>
> Because QUIC socket supports SO_REUSEPORT and allows multiple sockets
> listening on the same addr/port/ALPNs:
>
> https://github.com/lxin/quic/blob/main/modules/net/quic/socket.c#L724

Okay, I was wondering how it was supposed to work without
reuseport_add_sock() etc.

reuseport_select_sock() should be moved to a later patch.


>
> The client Initial packet can select the listening socket based on the
> packet's source address and port, or by a BPF program that can inspect
> the QUIC packet.
>
> Thanks.

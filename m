Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86A051DB01
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 18 Sep 2026 19:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789761084; cv=pass; b=FDFMWLF/JhbMqFppvfUUd0SSk4XIzFShhdvkwuVW2v6l5ynqQoWjis/Cgop6V681V1GEpCGMrFrNdR+3BhELNWO3f7SC1SL8sSN34FopXLKZB26N0NvWJPbYSxLFAE5JYO+4nFikwL3sXRJPJi4AENb0ygx4BxC6I/hpNTBWgAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789761084; c=relaxed/simple;
	bh=y/292QxEdUMf5pPsOfQZfieYF0PKSz2Ezz35GxIZDCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEBHs0BqYvEB0Ch2Cw8Gu2kRx7R7wo5KVhRXCamOgS3hin2u44YMYEAUPZ2dLV5Db6kw92D5QrtsIpor+KICVtMKk9chK5SASNmgmWAwFqwfJjW6MpxEPqMf64llPl+i7EfZczBW/UDuRY5VRAhQsuItfLAgUPidGQ8ztIsmLPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYdcX/Jp; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYdcX/Jp"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8633a38df87so810798b3a.2
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 18 Sep 2026 12:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789761082; cv=none;
        d=google.com; s=arc-20260327;
        b=K57qV+1gK+AskqT8rdUZjePcpat7CX01Bo1sYFei6p1Tw/1abQFHrK/11N1NC5xXY5
         AWP19uh197Ivp0BACJ7m6m+lmZMLYZULXXLn/yVY+Bc7PgqmsRPkhBp6iB5BjgVMFS4l
         LYAm050aKMYDhBJdIjXnDoReQ6z/2IQf9uKorHBx8iRCXiHjnZNvM1Sefzk3WfgVK4gr
         PocDxsScXyhFKSq65TgOFmOBghj88T3l99UWdkhzILwGlF1EcswNxezN07U7DR2iF1ra
         YNepm8SFmzcf7rIkXqMQlgxB5TlLfogu7jmWYB3/ztUQfHGqvK9ia4Be6Fgdmq9YmsXD
         hZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=87V+Fh4sb0y1GssnVq8tqPVBCLJOUuiDb7vS0kmG6PY=;
        fh=b1i/+xreL2vFB1K0ECTYVqMQmshuCC4mdYyaeYueq9w=;
        b=rnPZjq6Q2JOP4S8ssYu0jkLQ+0iFANJPHs1Tj+eNmMGV24fzB8RtFw1TM8zf2XRwgy
         3Hu1RGPvIXnnhrWo5ytAktmjYc/9Yjl2t9S64ArNUiS0wN8NKbe0OCDJCYjaiANj95+A
         6sFyhBvgOYSySxDj549MRBgNxX4f2hCFBM0CnVGApjRkCe7z1Dw1Bm+SkIO6rBVDg7AW
         1Vhuzfp1c1ihKlL1MAAjl/RKuy3Y0yBQvKtuFHe1w5BYKUX6dD3JQXuA4F5Qt5S76lSA
         AYxTBDm/ay4j4hRSOmi32dhhRQfTL0lhlW2wZ1soPMq8/DnHcMaN7YPiJskzA4gkkGoD
         ZPug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789761082; x=1790365882; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87V+Fh4sb0y1GssnVq8tqPVBCLJOUuiDb7vS0kmG6PY=;
        b=nYdcX/Jp5vErx9BGAnEb0hSygDn7f2TtrAB0yBbuKWoBVCEtBLPNecxuaw8m85Z88a
         f9nkLgZP0SVv0XZzvFz+DDF83SvAL8Qt0OJ1mqukSIFyeyVYcOzeFwLlDE3MzQmqrRhQ
         iWjYHmtnGmCaL3DIHzCuPz4udG9nJZlMBJfQ7MhJH9wps7ae0xwgmiGLu49FjeAagVNA
         AmzfiUd+5oGrPZqQgGKeLgKrg7hSV+LSQsuHE/4GGULKrcnzfMizygEqj/9XVffyQOYb
         y01ZygNjc//2xu1If7VVIH9vU1blduaolEME702wRgdsn1G3IG4s7nI9xFOj3j27Tl6f
         DL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789761082; x=1790365882;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87V+Fh4sb0y1GssnVq8tqPVBCLJOUuiDb7vS0kmG6PY=;
        b=F+0ZaT0Xyd0Vob6hJnCX+MCqPNJAxq14oCWrBpJUGv4LBKwhGRtTp7A8pxXlj5S7Pc
         IJ9fMg7Psw+wj6QtDEvlS6gWZr3QkpdqsqfJbykkpRj9MVamevD/D4H/hpiFeFK9/jk2
         iME5WIlzFWLrAagmiYoCch0TyemMNufL+MGQLBvVI52lm+mGEOv4RSN5CIS5hmowITjE
         lo9I2vIQ/psWlwkPZJHulrCeYozaIMWq1Q0XP9LmAWIQ5W9SmD/e+fTWaVexNSzB3Vl4
         Rgc2NUsCmIO/sd9r17ukrZmPAmV+8OXGlyIZ5L/rN8Jzuzdg+dJgrnpK97F8dbXQ3EpA
         3o4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzBkFt7myY3rdKz5FJbEkSiamGocw2NjqDWRYl1xkMTkT5hXZD6EVP3b0jI+ylZ+Hyu9o1K66rD7555xKvn165LL/2ScQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nBKiinGMIIYLnkUGKDbjwm0w9NXKyGxUMZ3TRXfnmdfYn/cWOV
	j73U56qm/rIS5L7bEuHx0KKfG86uIae0HaZ3RzXYi6bxiKkzXj6yA6BLuW1WhmAMuSJ+3tRoeEv
	ZC5krZZSaX3qQ6t4u44zGcVE48pPwzNY=
X-Gm-Gg: AYBFou2pID8pfxAwMxGY2tlRYBUGinNi4gqeBLShIVaHtTnPkdo84YbjaOLi4WY7CO+
	u9z136EofE+bUdzEdBWAi3YLDCx3BYFw7oj64Nf7+WB2Qpl/tbGKdClcaMhhnLLU/9Z/YOIePVk
	PacN78ZA6C83pgwqTbK1XQHpk9CoSmQc2iVlABcT7Rdjm6Jd8gmW+Hk8YZS58s7knDAlSj2T/Lv
	ElQgRMSIkPVGVe6Fy1V8UYTKCaiTwvfA+WCdzrK0KlECMn6nHvQKZ3rxJqcktNXCLZhnwX/+Gzy
	AUKjmAgKEOMbUD01yKmumA0cCMfPaBW4vd+YkU48CJbjf7c/JhywMQ8dX2XkKkcU5uKAOY+FY/p
	Vh96WzOlhtS/ps/r00hv1XvuS2sFEqqVg3V9bmWtJm8GdcahKtJFnZ+b6
X-Received: by 2002:a05:6a00:4185:b0:86b:b308:b926 with SMTP id
 d2e1a72fcca58-874dcbed261mr7094177b3a.14.1789761082116; Fri, 18 Sep 2026
 12:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADvbK_dHPkHjkPwu0RepYgDsHs5reHepprRHU9hDFBxQM9_RGw@mail.gmail.com>
 <20260916234654.420056-1-kuniyu@google.com> <CADvbK_df5X=Szsd-d8=0gndhoBSHJhnEqSh826iYUW6=Ce_xEw@mail.gmail.com>
 <CAAVpQUCRcBQOS4H5zJBOoYeCgsQBiGyu8gjhXaocDXDw9jqTOg@mail.gmail.com>
In-Reply-To: <CAAVpQUCRcBQOS4H5zJBOoYeCgsQBiGyu8gjhXaocDXDw9jqTOg@mail.gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 18 Sep 2026 15:51:09 -0400
X-Gm-Features: AcwNN1VIcCElFEGPge_VRMPC4oISQAbf6IB5C7NCKiJGMnhf9LEZN0g8RJucO_Q
Message-ID: <CADvbK_cweNjHtX-m=Ba5BT3g3aHhJ7se5TqaW44OXicONW6oYQ@mail.gmail.com>
Subject: Re: [PATCH net-next v15 15/15] quic: add packet parser base
To: Kuniyuki Iwashima <kuniyu@google.com>
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

On Thu, Sep 17, 2026 at 3:06=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.co=
m> wrote:
>
> On Thu, Sep 17, 2026 at 6:38=E2=80=AFAM Xin Long <lucien.xin@gmail.com> w=
rote:
> >
> > On Wed, Sep 16, 2026 at 7:46=E2=80=AFPM Kuniyuki Iwashima <kuniyu@googl=
e.com> wrote:
> > >
> > > From: Xin Long <lucien.xin@gmail.com>
> > > Date: Wed, 16 Sep 2026 14:08:22 -0400
> > > > > > +struct sock *quic_listen_sock_lookup(struct sk_buff *skb, unio=
n quic_addr *sa,
> > > > > > +                                  union quic_addr *da, struct =
sock *usk,
> > > > > > +                                  struct quic_data *alpns)
> > > > > > +{
> > > > >
> > > > > [ ... ]
> > > > >
> > > > > > +out:
> > > > > > +     if (sk && sk->sk_reuseport)
> > > > > > +             sk =3D reuseport_select_sock(sk, quic_addr_hash(n=
et, da), skb, 1);
> > > > >
> > > > > [Severity: Medium]
> > > > > Should the hdr_len argument be 0 rather than 1 here?
> > > > >
> > > > > quic_udp_rcv() already did skb_pull(skb, sizeof(struct udphdr)) b=
efore
> > > > > quic_packet_rcv() is reached, so skb->data points at the QUIC pay=
load, and
> > > > > reuseport_select_sock() documents hdr_len as how far the pointer =
must advance
> > > > > to reach the payload.
> > > > >
> > > > > With a classic SO_ATTACH_REUSEPORT_CBPF program, run_bpf_filter()=
 does:
> > > > >
> > > > > net/core/sock_reuseport.c:
> > > > >         if (unlikely(!pskb_may_pull(skb, hdr_len)))
> > > > >                 return -EINVAL;
> > > > >         ...
> > > > >         pskb_pull(skb, hdr_len);
> > > > >         ...
> > > > >         __skb_push(skb, hdr_len);
> > > > >
> > > > > so the filter would see the datagram starting one byte into the Q=
UIC header:
> > > > > all its offsets are shifted and the first byte (form/fixed/type b=
its) is
> > > > > invisible, which can select the wrong socket in the reuseport gro=
up.
> > > > >
> > > > > [ ... ]
> > > > >
> > > > True:
> > > >
> > > > BPF programs may need to access the QUIC header, so I will pass 0 t=
o
> > > > reuseport_select_sock() to ensure the full QUIC packet is visible.
> > >
> > > Why do you use reuseport_select_sock() here ?
> >
> > Because QUIC socket supports SO_REUSEPORT and allows multiple sockets
> > listening on the same addr/port/ALPNs:
> >
> > https://github.com/lxin/quic/blob/main/modules/net/quic/socket.c#L724
>
> Okay, I was wondering how it was supposed to work without
> reuseport_add_sock() etc.
>
> reuseport_select_sock() should be moved to a later patch.
>
I'll try. Thanks.

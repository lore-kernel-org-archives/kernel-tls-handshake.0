Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2017519C569
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 23 Aug 2025 17:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755969783; cv=none; b=TekWAyM9PeGktmHdLIY3kkr5ejx8wY3L22PAZd19Pi5wO3fbeiKb+3AvvRUJY7ObYdy9aPTUpFIh4+EBKXJBbj9B3bidOApf6yNEVxQwUbkJ45KDAvGeDsJPLq7Z2xt8Z59zTvI44enw6H1pBeQOEvqgiDDANQGWOWGm1Z+bSek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755969783; c=relaxed/simple;
	bh=y4CJ7pNPLS1ZJkKwumtvhMv6UuLq5y7tWRpXPjkKtcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kcGip52b0KFlKHxd4GvQMrteoFcXNAEGJnghyBx+J638rz718Lgy7IA+KYajSh6atmnDK+hfqlX+zGBwsWnTxPsuaW6a++TROaKg4mMrh/3kpWHTk53cs9C+Er+o8V5jhuoFpMw/nMzy+gxnRSyelcIkhsqQCUug84PzuyA9WWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZckDz3sh; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZckDz3sh"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3ea8b3a6454so4615995ab.1
        for <kernel-tls-handshake@lists.linux.dev>; Sat, 23 Aug 2025 10:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755969781; x=1756574581; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgTr60nA3z5wWgqDNNxThiGUeORtD2/iVsCPnp7jsKg=;
        b=ZckDz3shNssn7nFnidmzarKkM5Ga81f5Ak6xrxDIBqDDHkcTYFzSqPGzaBPTFPTfxb
         9i43CN6VHWnfR4oKd/ZGKSXrR4ueHohgnSF6gcNhPYhwjqIcZQBeVKJScIMWhEnoiCGh
         lWFzdWWHj4Kwrq6raF5CdzB0h7fQ43Z+rgVcg+ah55Y7bsildFNmHoP1mRQ8b1/WBQwW
         Poj1h+7NxpXCtRbhL/NzZ1fgVC/ldYXTxsZlalyys+13LV86Kc1EU8V1SbuLigUL1vYC
         2tfVPKj+IIZKNJq7MDOi073VNP3y8HHmtbGLF6DJWeSF5gcUV6gXrSijZTRFAydFPCMV
         PvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755969781; x=1756574581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgTr60nA3z5wWgqDNNxThiGUeORtD2/iVsCPnp7jsKg=;
        b=GMjQzouiD6p0rHLJZxc0wYmLKNagoQsn8Xp3OhErts0hafKLG9DytoFhP1tVOIm4qO
         L5xzQMDwUapoJCICihrwnLQ0LBVQpsCRXV/VyC9+GBMowQr5z3VB5DrNz17BJBxL3tN5
         SZpdTEyyXGOjl31hGwDdCi0Yt6KRPloKt0L8dtpwJouoJiJmVy9WgXs7ADAh0bcAB2PL
         mTitAu2x6+GHTRCbLrHalFZ5o9Bbx2YYjLLFyBEQKt2blUKvFIGQywtWyG6DFSdLUhmU
         i4L+2c86uSeJpS5QSRGWex5fd6040BmveOLByNCQ5DC+7P/tm0WsguW8TKccB2ikweX3
         6nMw==
X-Forwarded-Encrypted: i=1; AJvYcCWUfmS72xWrCXdLCxB7LIsg78Nu8jjjKvSdfGgkFFWR13GQ+hTHhhNr1yFSWrkMXoijDrAs/pIiPhdqc6rLzRbcCeM/9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMRMRlN3ad3c5cOw8rrlgLA27u/XAF/+86WUyw8tRcO93Sk7ss
	uXHxMk08mNWX1wa0Fi0UhAW7M4Tc3r4mRLwdb5PPe5ztREuw+oNtO4kGKzMEFqHN97w0yaXEsfN
	RLZTxPhw9Oy3CBQHnxGp6OTPacgZrJFg=
X-Gm-Gg: ASbGncu4PbVVnK745iR3LUkneLnXWE0zDUAHqMlI69ABsEHxWJcpGQXMJMLkL0Uqu8X
	CF6b4OYQIQUe3KijIG0oZaU/jGcQOKEfTP6U2V7LW7QEhvnaHlVyIatsa+uNN7WGglMyzDwwn3A
	IoSh3E48EZQ5BKfDaS8K8exQxiOWNpKyniY+bdLyygSOn6a9zpyqjJvTbWWrWVu3MbQ6fRCMS8R
	vXYGCcOgg==
X-Google-Smtp-Source: AGHT+IGDgzVnlVzscvJnBG9FDE4WcKIMgwBQ1Jf4FgB0cD44iHYsBoMuVfqjxn2nGhLnAXbFA3c3w6iRsS6DBkXvPJM=
X-Received: by 2002:a05:6e02:4801:b0:3e5:8113:35e1 with SMTP id
 e9e14a558f8ab-3e6d6db51ddmr154390015ab.4.1755969781042; Sat, 23 Aug 2025
 10:23:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1755525878.git.lucien.xin@gmail.com> <d208163af2fdd4c6ca5375e1305774e632676e5b.1755525878.git.lucien.xin@gmail.com>
 <7cfc62a6-b988-400d-829a-306211e1a156@redhat.com>
In-Reply-To: <7cfc62a6-b988-400d-829a-306211e1a156@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Sat, 23 Aug 2025 13:22:50 -0400
X-Gm-Features: Ac12FXyjyvvegt8T5QIUSsiqZo6sbk8kkevKDzpi0oloLzoWFmErRK2Y5unTX94
Message-ID: <CADvbK_cMDaSXcDC-iR_5dqPaz4O8o0mzYvNC+akQJyMzXnGq5Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2 04/15] quic: provide family ops for address
 and protocol
To: Paolo Abeni <pabeni@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, davem@davemloft.net, kuba@kernel.org, 
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Benjamin Coddington <bcodding@redhat.com>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 9:17=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 8/18/25 4:04 PM, Xin Long wrote:
> > This patch introduces two new abstraction structures to simplify handli=
ng
> > of IPv4 and IPv6 differences across the QUIC stack:
> >
> > - quic_addr_family_ops: for address comparison, flow routing,
> >   UDP config, MTU lookup, formatted output, etc.
> >
> > - quic_proto_family_ops: for socket address helpers and preference.
> >
> > With these additions, the QUIC core logic can remain agnostic of the
> > address family and socket type, improving modularity and reducing
> > repetitive checks throughout the codebase.
>
> Given that you wrap the ops call in quick_<op>() helper, I'm wondering
> if such abstraction is necessary/useful? 'if' statements in the quick
> helper will likely reduce the code size, and will the indirect function
> call overhead.
I'm completely fine to change things to be like:

int quic_flow_route(struct sock *sk, union quic_addr *da, union
quic_addr *sa, struct flowi *fl)
{
        return da->sa.sa_family =3D=3D AF_INET ? quic_v4_flow_route(sk,
da, sa, fl) :
                quic_v6_flow_route(sk, da, sa, fl);
}

>
> [...]
> > +static void quic_v6_set_sk_addr(struct sock *sk, union quic_addr *a, b=
ool src)
> > +{
> > +     if (src) {
> > +             inet_sk(sk)->inet_sport =3D a->v4.sin_port;
> > +             if (a->sa.sa_family =3D=3D AF_INET) {
> > +                     sk->sk_v6_rcv_saddr.s6_addr32[0] =3D 0;
> > +                     sk->sk_v6_rcv_saddr.s6_addr32[1] =3D 0;
> > +                     sk->sk_v6_rcv_saddr.s6_addr32[2] =3D htonl(0x0000=
ffff);
> > +                     sk->sk_v6_rcv_saddr.s6_addr32[3] =3D a->v4.sin_ad=
dr.s_addr;
> > +             } else {
> > +                     sk->sk_v6_rcv_saddr =3D a->v6.sin6_addr;
> > +             }
> > +     } else {
> > +             inet_sk(sk)->inet_dport =3D a->v4.sin_port;
> > +             if (a->sa.sa_family =3D=3D AF_INET) {
> > +                     sk->sk_v6_daddr.s6_addr32[0] =3D 0;
> > +                     sk->sk_v6_daddr.s6_addr32[1] =3D 0;
> > +                     sk->sk_v6_daddr.s6_addr32[2] =3D htonl(0x0000ffff=
);
> > +                     sk->sk_v6_daddr.s6_addr32[3] =3D a->v4.sin_addr.s=
_addr;
> > +             } else {
> > +                     sk->sk_v6_daddr =3D a->v6.sin6_addr;
> > +             }
> > +     }
>
> You could factor the addr assignment in an helper and avoid some code
> duplication.
>
Right, I will add a helper.

Thanks.

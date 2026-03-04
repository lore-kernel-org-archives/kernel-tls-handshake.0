Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E8034B437
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  4 Mar 2026 23:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772667481; cv=pass; b=Npd/RS0fgFlsvTPO/hz2xnKneRtlS2BRHALQO9gNEvG4npScESYtKbIXcwndISR7BLdA2udVvK30vJHcgyilHUFrLQ8AnfUqazKLdQCbS3UahthzKzgNPp3PbXr20PljYiV5mI3Wx0hP4AmP7e9GXWeUpgpqIT99p3R6gCliq3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772667481; c=relaxed/simple;
	bh=w1TG5DyyD/MOa39o2nEmPuagdIYdEe1dCKPHHwXRuCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJtudRc0+qli6gPKkPG8AJzomamdj5eom1hBiqqA5KyOt6z3pPO1/eNMfbIR2UM7bFiy0IBW4EzgSlpn5rHJQJF8+EJfSrYX4xfDQ1Z3R0C/HuPpyX0bAvdbK7LskfSp3LsWgCVXvVnaNRJUfZP2Yohp1YOCtAQkZpFGR2eFmBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSfHo6su; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSfHo6su"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94acf9ce1b7so5004051241.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 04 Mar 2026 15:38:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772667479; cv=none;
        d=google.com; s=arc-20240605;
        b=ToN4yIBmOqokl6iJSBTwIMzFghnj5dGPWD2UrBIKufmvH+ReaiFYlnjN/F2Mp/A+lg
         L1hDfF+59Ja7US49w3koKW8bUhP/Bo0cpp9qc3/TZdMlpf8IENy62qCCdvb4Lkb4XSq2
         KNy4ErHi5O1QKEOD9WlA8ODHGOZn6Jz0gGWTcPY7QFgLWUGZuOsRlp4rhf5Wx/NCiWOS
         jsusbLmoah7uyizANVfj2izwvxFZWt8kk7H4lrOh2NRpohHvMD3qdijD0vKKZojlq8O/
         yn7BxYsteic9BmoFxdX7bGDIqa27t63SJSwJ1ZFqLutAU8d4nUYeCl97yNbY10O6ItGy
         HXaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f2lsS6J1KrbGRFoggFb+7TwDvtJ+7CgdNNb0+XNMCDA=;
        fh=IRMneVaj5lYc9uR6F/o0RBSwX9xwYTxfgrRgotyDScw=;
        b=EMUzxe73+UyKcgfIOmgD9z9U1JPl5Rpu0L3pSWulmWTIyyETEMBwWzZ9HH7hFrfv7/
         KHTaF7DTSnG6qDQXBgG37gXrDW0MT+JL4EaG0hZxh0e+cwwYG00tdmBcaNHW9tI4U6wt
         8TqhIPaagxtk1+x5CtlF7djKWhl1cIUu/TLbhXKqsr4j540Zn+X3k5rppDoe7IKxJibP
         kUnsYIlHfmqXZDvMoHYJokbvS9r7zZcEtSHaTYvu1KA3SA9Fng9mWSsaHE6XaqHDuYiL
         X4Y3uWPo4TrivEIFaZw6580N+NFAEwoHmYSH6NakROHankC4gza59Zqs+lE5kLkZYugm
         3bwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772667479; x=1773272279; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2lsS6J1KrbGRFoggFb+7TwDvtJ+7CgdNNb0+XNMCDA=;
        b=KSfHo6suUzI3B/zQnaRxfVV5tH3NAfsNBiVFDNl9GdKyLnqUK0rp+Ikr4U1Jq5LuCa
         bhatc3+K0RwmzE+4iUQZKN5LcoAQR7u1CsuCd0yr2OYi8bjyoVQorluKTODsgS9Dg4yZ
         ax99z+XVtPJmnDBRWbL4sc1JhDMuocvrvDTkjBJAdesTO8SNtq/HEQRDWOHXfrrs5NNO
         N3fBtJKbxLYbvD8ZfBKtiqfZLySNbAr8FOeq/f59XfBLFWTjm7MjUMuJNI+Ovtlu/kGQ
         /QLuaf8q7vV5lxI1NLFO5N47Ff9xxUVmbg7Eu12jJhMmkZNk3Xqb/e91l2ERNY04ax3N
         nqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772667479; x=1773272279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f2lsS6J1KrbGRFoggFb+7TwDvtJ+7CgdNNb0+XNMCDA=;
        b=lXYpq5gQHyeMkzCA5QWD/W88PCJBUMJkS5S/+k1ToZz1TW+O0lXwuS2zAeO6P2nNNz
         xPOXXsyZdtdor+zm35M5wPVqUHLZ7STj2UE/gNmXXncPNYudJjPo5CURsMjf97FR4S0W
         XJ8roovPgDJWqlk8YJAu+e9aGg1wYgoo8Z0XS1CDpYyv5mTtQrXZkeY+nzHadlgzuqJt
         0jUuXELML2k9HYjtPHd+tJ/wZ+C9Cu6YNc/Ud1/rl5AveS0OmHV+Cdy7wOREiSHlNadk
         Kfa+q3xKTVwiNRxGG5n2sPNHlHiXhbqwxqQRAmqKd1y2bZOlUb/5cImoxHiICXqA/QZf
         JVhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj8C5HcmtuD/J+xbvYJAFb40HE/Bx4UODe1f56HvdwEDjB3Dbx5h3H24raUSODbCGDJeaAZt0npalcpd8kjcmPQi1HcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHZQYnCKDs3z9k7ruatDKJ8fTOPmVEN5MYETkn1oHBLLhR2YBO
	wKJybeg+r6dNr0Qr+l2NhfWrdZHMvbkiS7ClDPKcOiMML5PFn1Q7UseXSKaIe3dK3blBozCLUKP
	yFpuaTCUCSmNoTpQEms+r6r5RX7pRSto=
X-Gm-Gg: ATEYQzzPFjq9GQOzTyxE0r8m2KpKl/OiGlyW1G5D2wv0TNU0TvaLAqcisxNHRvgTtgJ
	wNZzrMA6Oz5d+O2OCuPPeliMAGAkUjqf3EtvwWBXW7MHU3PItEB7+4W+Xc5GX09bXfLJB+1C5aU
	C05yUKDYGszFIZxTyNptbp38/OH+rnfZadzYhHpO1MY4sPP3tygJHHLxmnd61tT/KTs2HjQ3ndw
	ycw4qP+qOwKGF/3hEC9HKcfW1dUowoooXSOMzY1FX6JpjuERdr6XU0TzheCBGJKa3bPoJyXttyO
	yg1ukrdEoPfrTmx0YV3As/0YOVQSgFjbvko4sYiuaGi1pHNyd5tguYk9LZbAxyHY9Li0tnSX017
	GxdRHrjiJYwBDR8jY
X-Received: by 2002:a05:6102:510f:b0:5ff:a34:6ce8 with SMTP id
 ada2fe7eead31-5ffaaf1af3amr1982362137.20.1772667479118; Wed, 04 Mar 2026
 15:37:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <08a63705058aff77dd54fb388870f0bca6036c95.1771986861.git.lucien.xin@gmail.com>
 <20260303083351.35558-1-pabeni@redhat.com>
In-Reply-To: <20260303083351.35558-1-pabeni@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 4 Mar 2026 18:37:46 -0500
X-Gm-Features: AaiRm51OBlwUOZC4nFNNd6vu4H5gc_uzuMHgB2908jHUlSejY2ws0x0OMALq7Fk
Message-ID: <CADvbK_e-Tkb8aVzSy4WhVogETvQy16TrFdtWROtf3Y6oC+PczQ@mail.gmail.com>
Subject: Re: [net-next,v10,15/15] quic: add packet parser base
To: Paolo Abeni <pabeni@redhat.com>
Cc: hepengtao@xiaomi.com, kuba@kernel.org, jlayton@kernel.org, metze@samba.org, 
	davem@davemloft.net, kernel-tls-handshake@lists.linux.dev, horms@kernel.org, 
	hare@suse.de, aahringo@redhat.com, tfanelli@redhat.com, mail@johnericson.me, 
	andrew.gospodarek@broadcom.com, linkinjeon@kernel.org, dhowells@redhat.com, 
	matttbe@kernel.org, xiyou.wangcong@gmail.com, dreibh@simula.no, 
	jbaron@akamai.com, quic@lists.linux.dev, pc@manguebit.com, 
	marc@fiuczynski.com, edumazet@google.com, alibuda@linux.alibaba.com, 
	steved@redhat.com, illiliti@protonmail.com, tom@talpey.com, 
	marcelo.leitner@gmail.com, sd@queasysnail.net, linux-cifs@vger.kernel.org, 
	netdev@vger.kernel.org, mbuhl@openbsd.org, smfrench@gmail.com, 
	chuck.lever@oracle.com, daniel@haxx.se
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 3:34=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
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
> receive (RX) path. It introduces mechanisms to parse the ALPN from
> client Initial packets to determine the correct listener socket.
> Received packets are then routed and processed accordingly.
>
> > diff --git a/net/quic/packet.c b/net/quic/packet.c
> > index a56edc745bb1..a23ce99a6656 100644
> > --- a/net/quic/packet.c
> > +++ b/net/quic/packet.c
>
> [ ... ]
>
> > +/* Extract the Destination Connection ID (DCID) from a QUIC Long heade=
r packet. */
> > +int quic_packet_get_dcid(struct quic_conn_id *dcid, struct sk_buff *sk=
b)
> > +{
> > +     u32 plen =3D skb->len;
> > +     u8 *p =3D skb->data;
> > +     u64 len;
> > +
> > +     if (plen < QUIC_HLEN + QUIC_VERSION_LEN)
> > +             return -EINVAL;
> > +     plen -=3D (QUIC_HLEN + QUIC_VERSION_LEN);
> > +     p +=3D (QUIC_HLEN + QUIC_VERSION_LEN);
> > +
> > +     if (!quic_get_int(&p, &plen, &len, 1) ||
> > +         len > plen || len > QUIC_CONN_ID_MAX_LEN)
> > +             return -EINVAL;
> > +     quic_conn_id_update(dcid, p, len);
> > +     return 0;
> > +}
>
> This parsing logic looks nearly identical to what's already in
> quic_packet_get_version_and_connid().  Both skip QUIC_HLEN +
> QUIC_VERSION_LEN, read the length byte, validate against
> QUIC_CONN_ID_MAX_LEN, and call quic_conn_id_update().
>
> Could quic_packet_get_dcid() call quic_packet_get_version_and_connid()
> with dummy parameters, or could both share a helper to extract just the
> DCID portion?
>
No, they work on different forms of QUIC packet, one for short header and
the other for long header packets.

> > diff --git a/net/quic/path.c b/net/quic/path.c
> > index 9414c4f813c5..655f38af4107 100644
> > --- a/net/quic/path.c
> > +++ b/net/quic/path.c
> > @@ -17,6 +17,8 @@
> >  #include "family.h"
> >  #include "path.h"
> >
> > +extern int quic_packet_rcv(struct sock *sk, struct sk_buff *skb, u8 er=
r);
>
> Could this include packet.h instead? The canonical declaration already
> exists in packet.h (after this patch). Using 'extern' here creates a
> duplicate signature.
>
> If the signature in packet.h changes later, this extern could silently
> become stale depending on calling conventions. Since packet.h has no
> include directives and wouldn't create a circular dependency, including
> it would keep the declaration in sync.
>
No, let's not have this dependency for now.

Thanks.
> > +
> >  static int quic_udp_rcv(struct sock *sk, struct sk_buff *skb)
> >  {
> >       memset(skb->cb, 0, sizeof(skb->cb));
>

Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5D5324B33
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  5 Feb 2026 19:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770319092; cv=pass; b=M/GropisgBy43zamF1VRMELSksWZZMQ8gY2j4dsdH2VS7JfHwGdtuUjeSDTKXoWK6uJ5M7YBejrm8X5Nfh/ZYqqt6L9YZivtAoCPZ7NiVI8AzSFIeplhzT7j3CrZ39L453e28atIOcbKMj0F09MjviRtqza1XV53Ozds+WFWHnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770319092; c=relaxed/simple;
	bh=QRhy0aaIatw5X2ingQ3dP6bzvBtQ67P0/48x91gmp1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVZ7gf88Iv8vDTQ6qHt/DI5nAC214Cigx5CnWjX8m37340e2PzJpM10Dxqd1ajG5hqUjA6tMiKfvpWE/iP6V48Aj0u+p2CK8SKwzTTc+/i7ucOB15dA0b/mZlInsW7mrrMEccJgspFl6FuMQyseIhyUXmNIGMdyzxT4Nx/4GEYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuM1ZwVQ; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuM1ZwVQ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3530f597ea3so528498a91.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 05 Feb 2026 11:18:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770319092; cv=none;
        d=google.com; s=arc-20240605;
        b=lBDhQSsZ7LMWNaNxT5j5tFKmb/BTwZLYCfrzACGRaveFpjxJTTfEPvCNPWcGZhboA5
         v4Cb+6ZnW7yDknmOalS5Dz5WhUcBS5gil+xo7ghWMg2MaOlYWZ9ZOh2y3s1ud77u2wCx
         3Yqxn/caBsrGCzWqgLvXvVNZRNbMmWdplF54LnD1g+Q/3MpawLDyaWWObUZGo44BpROS
         wR1KspZg3/ZKx6fgRPt5ypxVfErkZkNklg50W3lwCm7BukLmWD92z11oKEIOSvsKzzK5
         vx+py1uaqDIrtVY2NjFcYMI6zgh3+qq6U8g56+ZjnUaP9HjwnmmsYXF8BnMKY03aowd1
         Johw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vp6eSjM8r19A+ldOLHO2Ln5yqplokvRmWPI5a2FR3lU=;
        fh=NlfO0NuxwZ/T8XuZmxNdq9EocaOOJUUgWQ2l2JtySCU=;
        b=VaoEgRu+oZjqNPj3Kjhak3JUw5AfdNsV2+aiUWnIx6OIIZYeazR0DCCTidR+8ycgIB
         BsoM4wDqYGiMqTWpY/KIAvfaigyisgHsY0OLhzACHWHDDJQyZPPTGWj5ayZhw1jDnwZz
         KUJQQdxrFOMVm0l5fkzRVZHNNcKn7iobPr9nIQT2+bFu007XFV2Cl/Sry33Jo5RR5mmx
         i4DoCkg2rmFLidc3rpFLiBol0jvpoNIuq9JYPU1/H4vpwILibyqS7zOD15PUfwKSw8/4
         Ns9XcaDxH++0G6mxjVakAXykDSFhbfwNRLOFfqd2kvjbFafb19g+YwXXHVVDYSCI5pk5
         hTDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770319092; x=1770923892; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vp6eSjM8r19A+ldOLHO2Ln5yqplokvRmWPI5a2FR3lU=;
        b=fuM1ZwVQQk38RrRnnluzn2ez73dsDsHrFEZFPmXwByx5ulSQhUqItMlrnh1LKQHxDm
         YPlQvgq6I5vmNwjXzjDpoKH5JwtIPUfRLG/jfRBGT3EXa2H1NE04pEDnVufrnWVjezCj
         zng7h/zJSHmID45oRNx8gj6oE5cF50eGyGqjUcnqTqbPYVtCQzEK7yEyfoOTSN25uzyD
         cQtWIDIWPLHQA4eToEF5fv+Nyml/xcuKyD0wH39JxoS1+Ez/uDBpaTsJ7iMiGwEFnqbS
         j4iqFBPxa2YxsAd3pRM6UQPDERkQlybgamdj2pGt9hCqCNd8Hg6Yt/a/QuGFVCHBcGeA
         2vKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770319092; x=1770923892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vp6eSjM8r19A+ldOLHO2Ln5yqplokvRmWPI5a2FR3lU=;
        b=FtgaH/QeuvICEL3RGtKPzhtU00pRa6PdIE7Q9uG6LTIQPCwHwqG8Oh9lQyW5HSCpuy
         vC7LpvY+Ic5hg0QqIF6vfeJ6YcCFWg/LkhO6jJ3H7DXMkEP5MwOcCOytiPCZ03Wwp7ks
         GxnEdLUnVwh3IN1EMTO1mLmstIQ8Kz/H2CcZ5hcZUVoElTIeZn7cLnTP4gxiqGihuXxp
         hJNY+d8wn2PMevypHKPP5FcwmNzVpw/yn/JNcCg4Rny5H7KvEPNXcowfUXEI89wAtWWa
         gAfe+o1lwqgzV7bqkLIEthqNrJcd9hca6lydkMGi8Z9G5vV4q2rZdAqWcR3Bz8rqhY6R
         P2EA==
X-Forwarded-Encrypted: i=1; AJvYcCUGkBOn1xzgxZauJaJlQh6ItNNbZusOWzyf+v1z6cLJP55ZI9yQqCEn2jMqmwMJQBrQ3EP/NjCqyl/F0WPbikbaPziSyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxACmsXWQkTQIEvdgPHpQrysa12oQup5Yu4xK0uC7jOmu8orp5A
	GtbtuojKwMc7mfJTRsRxN5cMaqX5bKtz2SRT/d0GPlr70I3pnJ6GK2hms7z6ILmDzLQQhByJVvd
	nZ+aApwMVHoBC0Jiib11NzQ/AWie9zOQ=
X-Gm-Gg: AZuq6aKlKEXclQC+hmwtamY0OIKdlkcgjhn9k2dBQCHxMs/ETU4Vp6Al6h5mZuDNJxH
	3MbXfxTjm6qLKuFUpkI6RP4IxfO2UTzJ1i5wzvtq/WRDBC8Hs38QQ3ASnjGi1Fnywsl5dwA7QFS
	reqno0LXyu8tz/G6tvuo/arDDUJSYN46oKbfiLvNzxXj7lO6JWI4dvMZDpNimZ1l2teaUnXn7ox
	MKWwq5EDUBq4vhw5EmwH+IpyLFTwFqK2CJupgZ5ZyEQK1bMxdf0wOqMqqkhCnr0uGjZrFC+y9d0
	DVorm3xsA4auf21WB3M7ueh2yhJZ
X-Received: by 2002:a17:90b:268b:b0:34f:63b7:a1f5 with SMTP id
 98e67ed59e1d1-354b3e2f135mr64355a91.21.1770319091958; Thu, 05 Feb 2026
 11:18:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <74174c085fb11b8a63e72a7df730b6f4a7479c5c.1770042461.git.lucien.xin@gmail.com>
 <20260205115449.2195294-1-horms@kernel.org> <1bcfe20e-0103-44a5-82b5-90cba7ba5a60@redhat.com>
In-Reply-To: <1bcfe20e-0103-44a5-82b5-90cba7ba5a60@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 5 Feb 2026 14:18:00 -0500
X-Gm-Features: AZwV_Qh_mc3jaIOzqDW1hY_eOgDZvqz5PolYvBWVQrjtRoVkuvNydWMH3Z6Pil0
Message-ID: <CADvbK_eLJ2HWxx5G8PBwePCUZ7dXdDw6X8pryWWyn7SRx1NdDg@mail.gmail.com>
Subject: Re: [net-next,v9,03/15] quic: provide common utilities and data structures
To: Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, steved@redhat.com, marcelo.leitner@gmail.com, 
	aahringo@redhat.com, alibuda@linux.alibaba.com, jbaron@akamai.com, 
	hare@suse.de, kuba@kernel.org, tom@talpey.com, linux-cifs@vger.kernel.org, 
	daniel@haxx.se, quic@lists.linux.dev, jlayton@kernel.org, tfanelli@redhat.com, 
	dhowells@redhat.com, linkinjeon@kernel.org, hepengtao@xiaomi.com, 
	pc@manguebit.com, kernel-tls-handshake@lists.linux.dev, 
	illiliti@protonmail.com, xiyou.wangcong@gmail.com, 
	andrew.gospodarek@broadcom.com, mail@johnericson.me, edumazet@google.com, 
	matttbe@kernel.org, netdev@vger.kernel.org, smfrench@gmail.com, 
	metze@samba.org, mbuhl@openbsd.org, chuck.lever@oracle.com, dreibh@simula.no, 
	davem@davemloft.net, sd@queasysnail.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 7:51=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 2/5/26 12:54 PM, Simon Horman wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> >
> > For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-lo=
cal.html
> > ---
> > quic: provide common utilities and data structures
> >
> > This patch provides foundational data structures and utilities for
> > the QUIC stack, including hash tables for socket lookup, connection
> > ID management, and helpers for encoding/decoding transport parameters.
> >
> >> diff --git a/net/quic/common.c b/net/quic/common.c
> >> new file mode 100644
> >> index 000000000000..94321f3f213d
> >> --- /dev/null
> >> +++ b/net/quic/common.c
> >
> > [ ... ]
> >
> >> +/* Reads a QUIC transport parameter value. */
> >> +u8 quic_get_param(u64 *pdest, u8 **pp, u32 *plen)
> >> +{
> >> +    u64 valuelen;
> >> +
> >> +    if (!quic_get_var(pp, plen, &valuelen))
> >> +            return 0;
> >> +
> >> +    if (*plen < valuelen)
> >> +            return 0;
> >> +
> >> +    if (!quic_get_var(pp, plen, pdest))
> >> +            return 0;
> >> +
> >> +    return (u8)valuelen;
> >> +}
> >
> > Does quic_get_param() need to verify that quic_get_var() consumed exact=
ly
> > valuelen bytes?
> >
> > The function reads valuelen at the first quic_get_var() call, then deco=
des
> > the value with the second quic_get_var(). However, quic_get_var() deter=
mines
> > how many bytes to consume based on the varint prefix in the data, not f=
rom
> > valuelen.
> >
> > If a malformed packet has valuelen=3D2 but the varint encoding requires=
 4 bytes,
> > quic_get_var() will consume 4 bytes while the function returns valuelen=
=3D2.
> > This could desynchronize parsing of subsequent parameters since the cal=
ler
> > expects the buffer to have advanced by valuelen bytes based on the retu=
rn
> > value.
>
> Hard to tell without any caller for this function. Possibly you could
> drop it? IDK if enforcing such check would be correct/safe from an
> interoperability PoV.
I kind of forgot why I didn't validate it, I will decide if it should be
added after interop testing with those userland implementations.

>
> >> diff --git a/net/quic/common.h b/net/quic/common.h
> >> new file mode 100644
> >> index 000000000000..bfec0aaf2907
> >> --- /dev/null
> >> +++ b/net/quic/common.h
> >
> > [ ... ]
> >
> >> +#define QUIC_CONN_ID_MAX_LEN        20
> >
> > [ ... ]
> >
> >> +struct quic_conn_id {
> >> +    u8 data[QUIC_CONN_ID_MAX_LEN];
> >> +    u8 len;
> >> +};
> >> +
> >> +static inline void quic_conn_id_update(struct quic_conn_id *conn_id, =
u8 *data, u32 len)
> >> +{
> >> +    memcpy(conn_id->data, data, len);
> >> +    conn_id->len =3D (u8)len;
> >> +}
> >
> > Should quic_conn_id_update() validate that len does not exceed
> > QUIC_CONN_ID_MAX_LEN before the memcpy?
> >
> > The destination buffer conn_id->data is a 20-byte array, but the len
> > parameter is u32 with no bounds check. If a caller passes len > 20, the
> > memcpy would overflow the buffer.
>
> It looks like the check responsibility is on the callers. I guess it
> would make things more robust and simpler move the check here.
>
Parsing the connid from incoming packets will always check its length,
not good to move the check here then return an error for coding.

I will only leave a comment here. like:

/* Caller must ensure len does not exceed QUIC_CONN_ID_MAX_LEN. */

Thanks.

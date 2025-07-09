Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7099224240
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  9 Jul 2025 17:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752080754; cv=none; b=qoO/yYU6IrapFRv4YTgBodUNrGE1c+CrD0On0JN0U3DNuLh/Rfv569fTDHSJvjb0Re+KL708hcLupQpDqaY+U82Da4O3qb1250t3xv+CN+3zu697uu5gHBYE7ehlTRRpYJMeJ4hDE/1BtB3roFkJmcfhBCi/zvmjJi1CrA6Mkf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752080754; c=relaxed/simple;
	bh=cFmMmbNOZ2lQJhyooZRxqPMgpHehUky7qeBgN96eCfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sNs3tRG2cP4FwP2aB2fv4KOgI5RVQ41v5LnqT06ZiXT/EMoFjyFgXvT8ozGYzyQrViMOWPoCLm4JyRz+ILGJ8KafL/WZ/A0HzOGXb7S8P2c76hHaFVuMXGs7dm6KCLJqtkIivSn5/TkaEdRsVcCg8uB19LJqovl47R6dwOXXDa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OF81ZFHC; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OF81ZFHC"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-86d013c5e79so13375339f.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 09 Jul 2025 10:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752080752; x=1752685552; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGs7uOkUqSiWd98cc20bhkdpAwjdYLKrg86sS4UNbPk=;
        b=OF81ZFHCOEHewfjXYev8hnbvMiNkf+ULniHjsNZdd5AcO3/YSEzRFWbTfa+/NWM/y4
         4qpeOe2CLMzAKcd0S652wim9s/7a1OIQjv2HZuUSkEQqTx/PtAUd2hWRoTUJZQpIOZF2
         b4PQwsTFksTx/b6Cv3vPWk0tdlZEgFcGGSF2xdSnGDUvcUOR99PmWz/qYWI8I2t7wE1p
         jYZ1MSqxYw8X5pRBSjNVMZ/xTnSSRoppQ24MhE+R00zVLO0EH+fmvFw6Kgi4smSRZ4ET
         FjvueKysjP1VVvfSXrcpxNyWJe4UY7ZxgAH2Llgz8mvpVMfcIAcGh1NKrzYcDqg0zobj
         CHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752080752; x=1752685552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGs7uOkUqSiWd98cc20bhkdpAwjdYLKrg86sS4UNbPk=;
        b=r64BKBVaL1JJLAiXz4DQ6GHS9wPjt7Y5Wph75sJrEcT+kUwVlIyGyemrt1Ls1clH4V
         8hs4G1GYS64Jw47I8qn1ZZ4iN4iVo3TORlOPwAue5+j8w9Y3JmANjZ/A+xjTMBegbyUi
         NAxkLwaHP0YUZu/AZD1Lm/spLK2yKeHxhnWQwJcek2HjZDHDE5Iwedn+i3zThLMDenp5
         dX/ZK2tNtp74XJTYMgQ4yQf9GDnP3QadTP3aMqvGlGQooV98KgiB4CoFt0aJenIRx2lr
         xbwHQs6tybskpnZhy5nbkQ0yBOwdlRnYx+fbj3sm4qSWUvgsH/DWk602GGzTg2xthLBa
         tUPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrpdh7eoZpF9DwTJeZU+IJNsLwyG1xHkjBWjfpWEbIZFFL/9I5QrKNarA/fWQ3roNdA1I+CdFomDc7+w0JtzuFZoIRxw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx24LIcjUb7f6ZsI34FcugsamgoMedrkTSbFb1uQ4uaMZ02P8wf
	NQdCLiyNXDoSyEV44bArmBR/HwJkI7f/EKxPOB7Upx65xxVBne5QRYHEUBvcJm1ehVPfN/M3+9i
	J2TJ+nVBwVt1jLn/L1oqxOau7SRhBDio=
X-Gm-Gg: ASbGncu3KETN6tg7j7zTNYCVpxqqtjr3AduSBiurKUxMjzGYgTzbrObDMkHwlSeIXkx
	Os9khwv4XAN0CIHhXTjxwmhnboyyCpIdrHavA1Tq8Z4h5xQeA+2SR4HQESCGyjSYyHNwWGYELoi
	iVpwKRahyJTMrwJuJVbzwTH8mR3dwx0HweVepu7jJl6BLD/taITE2LHcVEe3rt+m/dtvIBa4eEo
	73+Vg==
X-Google-Smtp-Source: AGHT+IHkC8eqHXDge3FF4Xvot2aMbjbR7sKK8tVlJ313IzZe9U21AnU/z/HqEzLBntqyUltgr5L5GDqFvSXbBSlJJjc=
X-Received: by 2002:a05:6e02:744:b0:3d6:cbad:235c with SMTP id
 e9e14a558f8ab-3e243f93c4amr7234935ab.6.1752080751927; Wed, 09 Jul 2025
 10:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1751743914.git.lucien.xin@gmail.com> <74b62316e4a265bf2e5c0b3cf7061b4a6fde68b1.1751743914.git.lucien.xin@gmail.com>
 <2641256.1751992436@warthog.procyon.org.uk>
In-Reply-To: <2641256.1751992436@warthog.procyon.org.uk>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 9 Jul 2025 13:05:40 -0400
X-Gm-Features: Ac12FXw-Gy78wqwOzpg95VzRYPTCTxXs-MQSS5qJzV_rAfy_j3TuOneN8vlxOwI
Message-ID: <CADvbK_dDbzdxdfZT43M17hG6TKFfoQZ+YuZGR6q6E5s7eRUr4A@mail.gmail.com>
Subject: Re: [PATCH net-next 05/15] quic: provide quic.h header files for
 kernel and userspace
To: David Howells <dhowells@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, davem@davemloft.net, kuba@kernel.org, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Benjamin Coddington <bcodding@redhat.com>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, Cong Wang <xiyou.wangcong@gmail.com>, 
	"D . Wythe" <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>, 
	illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 12:34=E2=80=AFPM David Howells <dhowells@redhat.com>=
 wrote:
>
> Xin Long <lucien.xin@gmail.com> wrote:
>
> > +#ifndef __uapi_quic_h__
> > +#define __uapi_quic_h__
>
> I think capital letters are preferred for system headers, e.g.:
> _UAPI_LINUX_QUIC_H.
>
Looks better, will update.

> > +enum quic_crypto_level {
> > +     QUIC_CRYPTO_APP,
> > +     QUIC_CRYPTO_INITIAL,
> > +     QUIC_CRYPTO_HANDSHAKE,
> > +     QUIC_CRYPTO_EARLY,
> > +     QUIC_CRYPTO_MAX,
> > +};
>
> I would recommend that you assign explicit values to enums in uapi header=
s to
> avoid accidental changes if someone tries inserting in the middle of the =
list.
>
That doesn't sound like an easy mistake to make. Assigning explicit values
to zero-based, continuous enums isn=E2=80=99t commonly seen in other header=
 files
either.

But I will make such a change for QUIC_TRANSPORT_ enums, as their values
are actually defined in:
https://datatracker.ietf.org/doc/html/rfc9000#section-20.1

> > +struct quic_transport_param {
> > +     uint8_t         remote;
> > +     uint8_t         disable_active_migration;
> > +     uint8_t         grease_quic_bit;
>
> I believe use of __u8, __u16, __s32 and similar is preferred to uint8_t,
> uint16_t, int32_t, etc. in UAPI headers.
>
Make sense, will update.

Thanks for the suggestions.

> > +enum {
> > +     QUIC_TRANSPORT_ERROR_NONE,
> > +     QUIC_TRANSPORT_ERROR_INTERNAL,
> > +     QUIC_TRANSPORT_ERROR_CONNECTION_REFUSED,
>
> Again, recommend assigning actual values.
>
> David
>

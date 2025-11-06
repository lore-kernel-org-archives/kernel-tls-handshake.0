Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E452F7477
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  6 Nov 2025 20:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762460685; cv=none; b=qbMbRB3BuD4JSYVvVUrsslZz94gR1nRlrv0PxJtIp+Ru8h1F9yxfE2LAL6ZrVRSUmYshOOhzwytKqxoC9EETy6puQdW/+XhyNmWFqfXZiqsupRMfQ+yNgETwkpqQj1ckJzs9rD+YmqrRS09gYagh0J5eHEhbr7CIXfO2laLB9Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762460685; c=relaxed/simple;
	bh=Im9QWWxJXdZqz7HeLFWXZzmI9TfaqMlaB4gqcycUoss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HyTIYKjDufB2FSMWlNdBU0YDY3AmOUTvQK+zDYKrdnnMoPOCn0g/C4/I2oW6x6/KFYoPrtR/FnD6mYqHARcN2jNw9P4hEaq+fvjCoZQSzF7XIMmDw0aYyFhbs6tJrXKth+F16Ry3fPOMUvJJeC4VFJnSfbq6wI/pI1kKdUh5EdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aeywhely; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aeywhely"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-294fd2ca6acso259235ad.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 06 Nov 2025 12:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762460683; x=1763065483; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3gyUgZQhfQPtS7SLCIDf6NbyslQ68pOuETZ2b4hfpg=;
        b=AeywhelyyRhVcvSTW5y3qzPZq1yeX+dXisADbZ3JKd4uVPjv/pFaamY0X+1I2chheS
         u/DthJrAlDw/PqyJhmeWfau1mfTin+7Un5mp9O1YktcCkwJDFIOHb3dW99UdNAiiD1UT
         ydxC+PTjegyyTA50+APXn36NKGA8i/grDZA9rhICefo3X6pqG0ASknGxDTBwoRfyJmHt
         i/v2xqYgPJX37cITm13tl4b/jAiRUMUoS31HITVotmkuPWbOIhsZjQOwK2zdoAgLnYit
         jKEe50nShTsZJ5O3qzJpwszrs91GOkVjA8mJUi22qZ/j50f5ckGI0MhM6yJP42hroqp7
         CnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762460683; x=1763065483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z3gyUgZQhfQPtS7SLCIDf6NbyslQ68pOuETZ2b4hfpg=;
        b=gAY4nnMDvoCA60kufx30VSFQdJkLe3FhHE1eroUvSIQ3s0kYkdby/BUDYzVfzQvcT/
         hyb2hIOB+E0uV31zEVFwAt0bEWoRzn/hArpXMcRe5alEUlwlY/kKBGmETuSBqUffGX0/
         g/dgimRJ+B5tOArmPY2hBW2z26VnybFp1mRnqNAC/SrzrlTJ474UzvG4WXcORd4KlA1t
         WOjyeGx5aF6ycBt+KyibziNZpuQRm7A553NwCoMZdokoit/UWEFn71JSYfmrg1+WLc25
         KYDHwhRc3qKPB5e6dwRuTwJDVorQ8uxRjeazRtlc2H+H6QxzIDR16yKvRwESd9c4AV4d
         2bxg==
X-Forwarded-Encrypted: i=1; AJvYcCWPzNTCe29qGOJMS8zFJQ8FKiyZ+GTany4iOiGMSf2TkrUef9jHlyN7jVPPz1JJDPI8lYIzsZKTrJ5/futYpl+ZuS5bWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRS3TbcT/1vRbh8gLVdSm8+Jko9qUHfwvXjrI2vqpvkQljIoCb
	Xfmln5Od5ckXJ/MpRdUBCuuB5CG9m1DyRx5NN/EZ1VmDBZfHWBdUHTRjU7QEPkWgs0S9DzOXT66
	H37+UokYlyS9LtXCJitCxxSnLHynAzvM=
X-Gm-Gg: ASbGncuh7G4/MIEKfJ2sx32tN5bNW3q4evPS7Rf+S5rM8I9jX477ar2JxztF5iJu8RR
	2J9iBil7tWm7ejiFqVcq207lnCWMdlAM/PXxsl10NOf9EXR2Zst0MLdBxftRhsu+8lsTzRWDMB1
	oT1Uhwsjkrz6nD8dYafaYVYCCn6FSifF5stBG/SvP7Sgor5B9c84yVWpqb5ZOuXo4/0NI9I95D7
	AAktgt/P/7qd0Z4IvfMWWIVtNKU9cJeHfEQyrUa6TQrudenhi90C2F7A58cdxNozHQ/jDfv3kYf
	Uavnfa1fo3WqfVCc+KE7Qc/qlcsu2A==
X-Google-Smtp-Source: AGHT+IGTWzJU0xlvlovHbYWoDH5XM24Ae1wEThKwWG8ycDKpQ4Pza4FucwMrn4xnT46tQsURsHTnLGHE4XvA3l/bTbM=
X-Received: by 2002:a17:902:da86:b0:267:912b:2b36 with SMTP id
 d9443c01a7336-297c00de2ecmr9261995ad.23.1762460682652; Thu, 06 Nov 2025
 12:24:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <32c7730d3b0f6e5323d289d5bdfd01fc22d551b5.1761748557.git.lucien.xin@gmail.com>
 <43ea4062-75a8-4152-bf19-2eca561036bd@redhat.com>
In-Reply-To: <43ea4062-75a8-4152-bf19-2eca561036bd@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 6 Nov 2025 15:24:30 -0500
X-Gm-Features: AWmQ_blGjOQ50fcZQT5EtzHNncMYn6qzWEjBf9UHnF498_0zXTgvgxEng025WXQ
Message-ID: <CADvbK_d8WoKJkU7ACK6nzbv7hzxxkAYZ5--DPzVQHsSZbEJnuw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 09/15] quic: add congestion control
To: Paolo Abeni <pabeni@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, Alexander Aring <aahringo@redhat.com>, 
	David Howells <dhowells@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, 
	John Ericson <mail@johnericson.me>, Cong Wang <xiyou.wangcong@gmail.com>, 
	"D . Wythe" <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>, 
	illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 7:02=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 10/29/25 3:35 PM, Xin Long wrote:
> > +/* Compute and update the pacing rate based on congestion window and s=
moothed RTT. */
> > +static void quic_cong_pace_update(struct quic_cong *cong, u32 bytes, u=
32 max_rate)
> > +{
> > +     u64 rate;
> > +
> > +     /* rate =3D N * congestion_window / smoothed_rtt */
> > +     rate =3D (u64)cong->window * USEC_PER_SEC * 2;
> > +     if (likely(cong->smoothed_rtt))
> > +             rate =3D div64_ul(rate, cong->smoothed_rtt);
> > +
> > +     WRITE_ONCE(cong->pacing_rate, min_t(u64, rate, max_rate));
> > +     pr_debug("%s: update pacing rate: %u, max rate: %u, srtt: %u\n",
> > +              __func__, cong->pacing_rate, max_rate, cong->smoothed_rt=
t);
>
> I think you should skip entirely the pacing_rate update when
> `smoothed_rtt =3D=3D 0`
>
will update it.

> [...]> +/* rfc9002#section-5: Estimating the Round-Trip Time */
> > +void quic_cong_rtt_update(struct quic_cong *cong, u32 time, u32 ack_de=
lay)
> > +{
> > +     u32 adjusted_rtt, rttvar_sample;
> > +
> > +     /* Ignore RTT sample if ACK delay is suspiciously large. */
> > +     if (ack_delay > cong->max_ack_delay * 2)
> > +             return;
> > +
> > +     /* rfc9002#section-5.1: latest_rtt =3D ack_time - send_time_of_la=
rgest_acked */
> > +     cong->latest_rtt =3D cong->time - time;
> > +
> > +     /* rfc9002#section-5.2: Estimating min_rtt */
> > +     if (!cong->min_rtt_valid) {
> > +             cong->min_rtt =3D cong->latest_rtt;
> > +             cong->min_rtt_valid =3D 1;
> > +     }
> > +     if (cong->min_rtt > cong->latest_rtt)
> > +             cong->min_rtt =3D cong->latest_rtt;
> > +
> > +     if (!cong->is_rtt_set) {
> > +             /* rfc9002#section-5.3:
> > +              *   smoothed_rtt =3D latest_rtt
> > +              *   rttvar =3D latest_rtt / 2
> > +              */
> > +             cong->smoothed_rtt =3D cong->latest_rtt;
> > +             cong->rttvar =3D cong->smoothed_rtt / 2;
> > +             quic_cong_pto_update(cong);
> > +             cong->is_rtt_set =3D 1;
> > +             return;
> > +     }
> > +
> > +     /* rfc9002#section-5.3:
> > +      *   adjusted_rtt =3D latest_rtt
> > +      *   if (latest_rtt >=3D min_rtt + ack_delay):
> > +      *     adjusted_rtt =3D latest_rtt - ack_delay
> > +      *   smoothed_rtt =3D 7/8 * smoothed_rtt + 1/8 * adjusted_rtt
> > +      *   rttvar_sample =3D abs(smoothed_rtt - adjusted_rtt)
> > +      *   rttvar =3D 3/4 * rttvar + 1/4 * rttvar_sample
> > +      */
> > +     adjusted_rtt =3D cong->latest_rtt;
> > +     if (cong->latest_rtt >=3D cong->min_rtt + ack_delay)
> > +             adjusted_rtt =3D cong->latest_rtt - ack_delay;
> > +
> > +     cong->smoothed_rtt =3D (cong->smoothed_rtt * 7 + adjusted_rtt) / =
8;
>
> Out of sheer curiosity, is the compiler smart enough to use a 'srl 3'
> for the above?
>
Yes.

266 cong->smoothed_rtt =3D (cong->smoothed_rtt * 7 + adjusted_rtt) / 8;

0x593d <+77>:  mov    (%rbx),%ecx         ; ecx =3D cong->smoothed_rtt
0x593f <+79>:  lea    (%rax,%rcx,8),%edx   ; edx =3D adjusted_rtt + (ecx * =
8)
0x5942 <+82>:  sub    %ecx,%edx           ; edx =3D adjusted_rtt +
(8*ecx) - ecx =3D ecx*7 + adjusted_rtt
0x5946 <+86>:  shr    $0x3,%edx           ; edx >>=3D 3 =E2=86=92 divide by=
 8
0x594d <+93>:  mov    %edx,(%rbx)         ; store result back to
cong->smoothed_rtt

Thanks.

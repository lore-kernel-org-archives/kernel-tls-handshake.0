Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795623686;
	b=rNyLc1+d9E5EE9JYHndLFicuZ00CGCoRnKK9Pne5G3JWwKYPIkA55Yp/leiaSZ191nGu
	 cAWIFQkRGasvXkV/r6Hv5F0Sp2yDV3/w1XcpiekYbsi01VrF95R5x6XxYCz5XN0nMEccu
	 t4p33pja7+Cpf0jiOt8eX9T4Gfj6gtuM2GZK/Ikwr1kqsY60u4rJRRnNq7ic7K7HVkH0S
	 VFSMZAGuOf0xcjFOWyRgbyD33GKDLAnA0qdk1tLFHQqQ1NmPckw9OEoxIHLUJdleLU2UK
	 tLKbhOZGalCbIlPh0BfRxRoWH9cDFXcgd0ozHsiHD1fyrx8FfVFKuKRdbvP9L30KYaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jL/0Bwl1ePYdGwOEmrzwhpq81wxXh5l9YreMntjOUuk=;
	b=uSQ2Y3WQL8Z/jX24sFOxUF/KfPbiJc0WTAsYIoojA4msupHn+ha+uu5qNfA+XhED5SME
	 GRrkfhhk8rfKuzRPp+V9ke55ArbX2kRASqdtIaoc2YJTxHraVLI2/B/z7CggYv/Z1CKGB
	 fQhYYgOkPKS/oWudXJVGTO9pS/BS3YOzT/2Z5/3nsEy9DybrYmnVgif2R9maiO8jfpa0Y
	 kwak6AIsg83gcynuoY7z7h3q09gNrZT8L63c4Hjv0r5yGPE/eFnCoakRM4KhK6PLOw/x0
	 lomivHTgIQ2exqSV4LZIZA05tp6wjFmxSJUg2x4SyATVI8jRcTFazL7iI5Eh6WRuQag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eAN/TWFQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2DF606A334
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 25 Nov 2026 16:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E2DF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eAN/TWFQ
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8c4cc85a315so4067784b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 25 Nov 2026 08:21:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795623685; cv=none;
        d=google.com; s=arc-20260327;
        b=oPPxqahIVifuxGKE5zYhO+DrgDsDaKYhh537ugXZa0MR3IOzK7KFdhY0VYu/C5WmMU
         tEZILOiLjHgIyrY+1iLN7lUDpOthJ49jMMx3Mw20FQ2q1izbDVCUBY8hharWxs8nWuYw
         9dF7ToGls5ZBqBaSOfIhCVZG8RvMs8Me4rlebO3xXOYHaFlIu60yCw4ZrD8TowaK8pT/
         IS2TR9vcusCpzy4JrGhL1Ldq/Yml4RWWAos6teAp5Upw4F8H/AoBfVUFtUp+P+KyE37/
         WcESAk2JG+2cpdzqrySa73wFHDoxEPJeRAobrxRYgbG2nB5rLtwUp+NUR1JmACIfStU3
         tzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jL/0Bwl1ePYdGwOEmrzwhpq81wxXh5l9YreMntjOUuk=;
        fh=EeTv5WAZROp9NX6cyIvr0UhuHIJtMFMEVtCBeyHdr90=;
        b=C0esBIyD5bPGNx/27wPYbvLQq3TGpHz5lWuvvvZv8aBU043gs4Zyt1RdKjOZes3HFe
         SABIe7RbNFfMFgivXrohDpYreuBo1a+Xa4qZ3xuEnV/Ad0vifiHOVsArxjlM2Wl0jzer
         2vpuIOASMlnk3z1Ap1gOCvwl7aOdZgVoN7Sj6TeB8XQl6SzkVWaFd4xbvCv3/HCRvGe2
         BFFLYIFAaE/jexIcWfl1PDwuIY6srq+TZ85o96eG0vxLvM/90NuDq8dPGtNzEk2bJCcp
         sX1KxAanU3KqVK/Fm5wVpUvTmIa/AcsUkQmLDwE9qP7MOCVC1hnPq3QscqC/YiE8pgU3
         Nivw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795623685; x=1796228485; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jL/0Bwl1ePYdGwOEmrzwhpq81wxXh5l9YreMntjOUuk=;
        b=eAN/TWFQDzV5diC+qfOIXX55kB9kTQPipxBNjiHaoEF2PBcuB0wrhXBLgK0+Dzjr94
         uwAmHJXBzejHqso10qj2Dvb75TXyiWCLUvR8wgcaoOGnfS6uRfyraIhVJhS5roz2LUcC
         vOHR/kpqoBB6pO2BObkQwRg6qgHKd32KPzhKHccfkUNBZPliBJAsHE2WRYpY5mP24jBA
         s7wtfmOVX5Du4dKM8NZcCgiAwC+m2RVr/Zux8qDaS2UkSIcQT84G2mcY7ZHjixtkVzCf
         I5RCVYpzy3wTab/tGISyBLqvO2eDjSMyzVuYII+8Rkmz3Iug6u12OBk00qXZVn8w3GYM
         PYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623685; x=1796228485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jL/0Bwl1ePYdGwOEmrzwhpq81wxXh5l9YreMntjOUuk=;
        b=PGY/9muJffLAmo8kp9oUAM8H91piZIuTvukvJjtWiwc/igTDL4c7HRsBQWy9oEtt6i
         TJHHJoEG4THmrrSkcvnrDSjZ957I/PAAkiLTuifGtrWXVQDdYqqcA3lUWXrg2LSZ/uDJ
         DKS85bWOgCKalIllxN6HWMJfAD5k7CqWlCOBuBlcrAtAxdU7jb1nYBdLCubzH0+l5S8m
         ROsUV0001lpcolWKhrF9pqquWeZXokSIEnsa5/wuWbchTUrd9Zq8OgwN1BIs9nooI2or
         n5I2sjDLJEf37g8Vep+zZVMNu9yf2iQo8eLOENurK7PNij2AWBGnniIvqo+il2aSQmhP
         5boQ==
X-Forwarded-Encrypted: i=1; AL+hErE34yl3PurcrGaFhnJnW79U0dMd25CTNEBoiWgOJTfhLGkgf+sQiroh4i61csUgt8CJkTqGmgq2jy9Bwo8wmAlBFdqB1A==@lists.linux.dev
X-Gm-Message-State: APuU4Z9w9+ifzdyHjLboMuhfVPvKMi/9tJ5FRnH6JPY5Wj0kAsb61Pru
	v1FGb3mRtf/tB9gEkZuTTE4iuDjgFCs9WI9wyufW3d1tJbc/4FL+cNfaDEZab8Hpzqo7CdigSRz
	s+7ByCpNnHYf4E+HETgDpYJZx6wH31ek=
X-Gm-Gg: AZFdTZeiASVv5WkBggAbJJlf7BABuS5PfFbOdBtrJPMEKBfrrRqFbKeVc6PdBFlfLBg
	+Cicm89aBi6+G6z+/zJjHb+wmcoBHsRwAJXKtnqRDchG4CVat7hCOb3M01e5w/KKiBN/tViiVN0
	svkHtBvgc/jUF0KKu+TmPTmSd5gjPecTId5qnar3dQFI1L7ww6hs0rM8qrLGurMEjBu4X91p0mx
	Wi8xIe76oq8PTdzUAv673nTu+NVw6/YIrFWjv0CFbe/Lc5m+1Qi+l3K1BZ3bdh8VpvsmmwmO9+H
	y6B+WKZw+MuGAg6OhDDGfnV+w3itPtIo/vSdX/BZSBYq27mnrYBh0gxmGHAESnCd8jEbEdEDcPB
	/hGsZKreaMFCi5GZpjJFvdZGfXfKV6FWZ2TSy9peomO5YaSuuU6SQSBoFeLlGqsSL0ehb+DbjIa
	fNCuCZafelThJXAZTCY3W1jz5vs26RcIH4hocbXrF+1ioHx0eFHdg43nqfAmGbtcPeKg4v
X-Received: by 2002:a05:6a00:2185:b0:8b5:8fcd:a5d6 with SMTP id
 d2e1a72fcca58-8c87ca51d89mr16484911b3a.41.1795623685392; Wed, 25 Nov 2026
 08:21:25 -0800 (PST)
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <b69a2cad6c2faeab9ee1e90ad11c4b64168c8235.1795393691.git.lucien.xin@gmail.com>
 <179548327865.3135.16261562840994895440@kernel.org>
In-Reply-To: <179548327865.3135.16261562840994895440@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 25 Nov 2026 11:21:13 -0500
X-Gm-Features: Aa3M54rsWzghsJWI76cZEUFf_JplE3C1oHkXrqs2BiFz_WXGdtzu3O8u2H29aYA
Message-ID: <CADvbK_fRG1sXR97cXfMMMG30RyM+-vyHMamOje5oxUO6=UEnpw@mail.gmail.com>
Subject: Re: [PATCH net-next v19 09/15] quic: add congestion control
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	metze@samba.org, mbuhl@openbsd.org, tfanelli@redhat.com, hepengtao@xiaomi.com, 
	dreibh@simula.no, jamie.bainbridge@gmail.com, linux-cifs@vger.kernel.org, 
	pc@manguebit.org, linkinjeon@kernel.org, tom@talpey.com, 
	kernel-tls-handshake@lists.linux.dev, cel@kernel.org, jlayton@kernel.org, 
	steved@redhat.com, hare@suse.de, aahringo@redhat.com, dhowells@redhat.com, 
	matttbe@kernel.org, mail@johnericson.me, xiyou.wangcong@gmail.com, 
	alibuda@linux.alibaba.com, jbaron@akamai.com, illiliti@protonmail.com, 
	sd@queasysnail.net, marcelo.leitner@gmail.com, daniel@haxx.se, 
	andrew.gospodarek@broadcom.com, mef@scarletmail.rutgers.edu, paul@jakma.org, 
	kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:21=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] quic_cong_rtt_update() in net/quic/cong.c begins with `if
>   (ack_delay > cong->max_ack_delay * 2) return;`.
>
> --
>
> quic: add congestion control
>
> This patch adds struct quic_cong for RTT measurement and congestion
> control, along with struct quic_cong_ops for congestion control
> algorithms. It implements a slow start, congestion avoidance and
> recovery state machine, and currently provides New Reno only.
>
> > diff --git a/net/quic/cong.c b/net/quic/cong.c
> > new file mode 100644
> > index 0000000000000..99fe8045d0170
> > --- /dev/null
> > +++ b/net/quic/cong.c
>
> [ ... ]
>
> > +/* rfc9002#section-5: Estimating the Round-Trip Time */
> > +void quic_cong_rtt_update(struct quic_cong *cong, u64 time, u32 ack_de=
lay)
> > +{
> > +     u32 adjusted_rtt, rttvar_sample;
> > +     u64 raw_rtt;
> > +
> > +     /* Ignore RTT sample if ACK delay is suspiciously large. */
> > +     if (ack_delay > cong->max_ack_delay * 2)
> > +             return;
>
> [Severity: Medium]
> Should this early return be here? When it fires, quic_cong_rtt_update()
> skips every update. latest_rtt, min_rtt/min_rtt_valid, smoothed_rtt,
> rttvar and first_rtt_time stay as they are, and quic_cong_pto_update()
> is never called.
>
> RFC 9002 section 5.1 generates an RTT sample whenever the largest
> acknowledged packet is newly acked and at least one newly acked packet
> was ack-eliciting. It has no rule for rejecting a sample because of its
> ack_delay.
>
> RFC 9002 section 5.3 also says the endpoint SHOULD ignore the peer's
> max_ack_delay until the handshake is confirmed. During the handshake,
> peers can legitimately report delays larger than max_ack_delay (RFC 9000
> sections 13.2.1 and 13.2.5). One example is a peer that buffers
> undecryptable packets until keys arrive.
>
> The changelog says callers will cap ack_delay to max_ack_delay after
> handshake confirmation. If so, this check can only fire before
> confirmation, which is the phase where the RFC says to ignore
> max_ack_delay.
>
> With the default from quic_cong_init():
>
>         cong->max_ack_delay =3D QUIC_DEF_ACK_DELAY;
>
> any handshake-phase sample with ack_delay above 50ms would be dropped. A
> peer that advertises max_ack_delay of 0, which is a legal value, would
> cause every pre-confirmation sample with a non-zero ack_delay to be
> dropped.
>
> In that case smoothed_rtt and rttvar would stay at the QUIC_RTT_INIT
> values set by quic_cong_set_srtt(), so pto and loss_delay would not match
> the real path. first_rtt_time would also stay 0. That keeps
> quic_cong_on_packet_lost() from ever setting pc_start_time.
>
> The RFC already handles a large ack_delay safely further down in this
> function:
>
> > +     adjusted_rtt =3D cong->latest_rtt;
> > +     if (cong->latest_rtt >=3D cong->min_rtt + ack_delay)
> > +             adjusted_rtt =3D cong->latest_rtt - ack_delay;
>
> Is the drop-the-sample heuristic needed on top of this?
>
> The commit message describes quic_cong_rtt_update() as "Performs RTT
> measurement" and does not mention this deviation from RFC 9002.
>
> This patch has no caller of quic_cong_rtt_update(), so whether this
> triggers depends on the ACK processing code in the later patchset.
>
False.

This is a defense-in-depth sanity check for pre-handshake RTT samples.
Post-handshake it's unreachable because the caller already clamps
ack_delay. During the handshake, samples with large ack_delay reflect
peer-side key-derivation buffering, not network RTT =E2=80=94 using them wo=
uld
inflate SRTT and delay loss detection. The max_ack_delay =3D 0 concern
doesn't apply in practice: the default QUIC_DEF_ACK_DELAY is active during
the handshake, before the peer's transport parameter is applied. The 2x
threshold is intentionally generous to pass normal samples while catching
outliers.

> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1795393690.git.lucien.xin%40gmail.com

Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C552B49B44F
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 15:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573744; cv=pass; b=lATmPeL74qPoh0SNHVLKF+kUSLTD9wSrbwMzh+H5uWf/Zm1LPElV0ltIfLxR03fOKyy27ehMXrQCGOiZd3KJudNmz5MGIqnXtr8xsWtbqdzMGj5Zk/c7DjYo8tLsrXktBpe3Yfapszca8ycxtQYkdpRF9+UhkO60/36hngkak8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573744; c=relaxed/simple;
	bh=2HTFcw51GJTpM0vzPofi6oeFOtDofXyLi0if3h9f4Tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3dy3MgGaWgPSTWhc4iv+1slwLU4tLmtyg0OvOkNBYGgo+0r3hgZ0t//RtRsbTOxUTSDDfaXLyKVpohSO7rqt/apEEcAAGnEowdlUGaIOUzoXOYl65pEs4LsFo7p/UKLN6yyGZGawUqG2kvNXoFxx9pCslHXXiQ4PpDvTpb3ZyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVC66FWU; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVC66FWU"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8674704dab1so1260726b3a.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 08:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789573741; cv=none;
        d=google.com; s=arc-20260327;
        b=ALNz8OW3rM+Zct2VbYNW1KOdWgEPKSe+vCD1mbtP3D8jz+u0D9OrxSDT9EBo/YAa2k
         JO9K2FEyN9gf/TskeBv4DeKrtvFVaeoWvWTViwFq241RnXpSMuZP9CdaHdX389/PH3kB
         YhzbTJ/UyhE7UjCiP2WRH9VVTTS0Xupia24Z5HCshgqsoylYH2QxLYG6IWz8Efay3KHa
         4jQ0NtrACjywksuAH/EpL6Yn5pdISLPeyeyvbP6Yk8zJ1pzqGaH33RePYuhV2M8Rp9o+
         /9GsAOG/F+aZZZTL2O2WOq7JDR4HSLIBBhbvmIuv/zy7NWSwbyIKS2mSUT6KITfzkPmr
         M9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9gmxz7ND3t4uc8MZW2dQN60LpvsltqXz4L3oWlJ7Ftw=;
        fh=cwhxGAnUbFk9qooXkH0kdxazWMkqfEHq0mpYDqsFdoQ=;
        b=FeqXc2FpyHrEgd04Mn28Ly4zjA3H776i2g+bPkbEhCUnwJ+SEYDlw0ZuI1zXAVSQFx
         qxfHLXciDo1w1+Png7+3H6rvAcn7kbbwjpirolIgUnrZ6Qx1h00/N2NFvfoTRFjXoXJt
         6oq6PVzwgCVgiDgpw/0w0SYKUrKnnW9zWGyqYTw0tTbxJjpMUIgxRc5wTOaBZc17YGiv
         9jM9c5NpGp0ZwkqpryfPN1y/+1EqBVtMTzmNQqiGSqJQ42SquawZHmaltm2PgERO394q
         Ct+pKkTnJo5ham++nBcn0coO97T3KewFFbiOfsOVGF6svIHZhPTiwi0lvbyvRvxsur3i
         Y1Vw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789573741; x=1790178541; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9gmxz7ND3t4uc8MZW2dQN60LpvsltqXz4L3oWlJ7Ftw=;
        b=FVC66FWUJT5FKCUfp6qmK7lCtFpiVPZbGuzGv2UIMp0bENpzq9A3C4akFOXt/YsTxz
         R0KiwokjWMrPx+gipMCLZoAGgi/yZiQmJWLZwnPFZFMccT8oKsbxieWvXe44zvWrKT/n
         rc8uBnp/FyzQNwgSOKHT8m0+zP7+7GE+6aBHBrh97KujuakejpYwNQV87lq/PiGlY+fm
         s1bI0vJKa6qi43iyRTgUbE1si+qPORoadEe6pKHbRhRWfsQtJTDy5ns3oSAb4YcMIZu7
         xFvyIfn+rradm5OxE+WK8OPfQFcUpbfXYyawisPXBhSNlgDCETo8mny6Y9gVtdeNTsLU
         zEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573741; x=1790178541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gmxz7ND3t4uc8MZW2dQN60LpvsltqXz4L3oWlJ7Ftw=;
        b=pR6QXmCJfJN4E6ubEH6xhPbDLYVNS+Za76WiAi5hgGsWef19nclMWISWzfNPgWutRN
         E+4Rr5VxgJ77h12vgyJjBH3k3qEZYhNW0HFGrExY7KJ1I+hghAJfIVY4bFQ+FeZ3H5U5
         3P/PCTghy+19L6j5u4Jl8B7QgKzhzksEcqAvvyFJeXXmR+Niu2uOwaCzbwMdzzp6+v8H
         ubZ5C6/k05/DbEREJggdMGlpCbzkzCp2lH+LefXa6tZx1GqNwOdVCKll6/+s5GouuSjv
         xz7vwUEpbErp09yLyKN0efKP5GNPrDGvPz2PqCVSaNNaEnLYpqsN2QcGmcB6v5A7nvuV
         yiEg==
X-Forwarded-Encrypted: i=1; AKwUvBwQ6eb55GLB1qIqbjyAg2KwttCtxKkZUcVSuN892ne5PaGmspMML7IyZONPzSCG8cQOlvasfr5xWX1O9i78zHTxV7pIhw==@lists.linux.dev
X-Gm-Message-State: AFuF++mkVdapAhjDpKNjzfvFr09r2eg+HpVCKRZI8h9hRIwPf+KJoAo3
	Bcc9DO12gXtilG/Z9HwRBfNtXB95qPHbcl1XdlY5SEtO9gn0RGywQxzZKgjigtiWgj5iqdqZ+fP
	iRSRQD99POgRBqhzBhCJ+sEuBURzKdHc=
X-Gm-Gg: AYBFou18nMVUB9ICiybmQFmEVuWg51Myq8BpIWfRg+OUqKy215siws2tG5j43R/8K1S
	KsHzN7e2HJXFnrzKPH4Dxjfz+18DaxakPAQj153titnHsjZGh8TY3XGt3RPW8bgtEKx2bChmsLo
	YVa4sULEicGMczFhZJQ01c4aJU+rVxl64/obxAqcisYM/PGo3/7sC3IHY+UK5MgMSdA4FKMUvgA
	ZRQdvjvFi0/qejaDq49QClQR6T8fJYfTPSB3/CS/9dKUDOlCdfs8l7V6i5QHGatF/7Hh+5u7FxK
	7bJYOC6A7x9bhjibHbfJVEKUcb6RXxoxS/asnT6cZsdePCSpSqv+gYKC5aRU8AU19gMzahiX7g/
	3BKNb15qqrtsVxO7U2FanfthuJJLE6gTYqPtSjzQXMtrwNgL/NRJc3mLp
X-Received: by 2002:a05:6a00:a88e:b0:872:20f2:3282 with SMTP id
 d2e1a72fcca58-8723de188d4mr6336975b3a.22.1789573740955; Wed, 16 Sep 2026
 08:49:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ede5ba63212b87ddfa14acf70426b81d87501e44.1789393775.git.lucien.xin@gmail.com>
 <178950184662.22033.5889968066649167674@kernel.org>
In-Reply-To: <178950184662.22033.5889968066649167674@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 16 Sep 2026 11:48:49 -0400
X-Gm-Features: AcwNN1Xi8cSlHvt5PrpP04qaA_yB_ZBp9zlIFRWFrwm51DDVLQoanNnzmXwbS2M
Message-ID: <CADvbK_eU+ozoWVcCWEhKuyeBK_c78Eqp-OTKQHqUBTu8hwq+hg@mail.gmail.com>
Subject: Re: [PATCH net-next v15 09/15] quic: add congestion control
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

On Tue, Sep 15, 2026 at 3:50=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> - [Medium] Spurious persistent-congestion detection:
>   quic_cong_on_packet_lost() (net/quic/cong.c:125-140) is the ONLY place=
=E2=80=A6
> - [Low] Commit message vs. what the patch actually enables: the message
>   says the implementation 'adjusts the congestion window accordingly=E2=
=80=A6
>
> --
>
> quic: add congestion control
>
> This adds net/quic/cong.c and net/quic/cong.h with RTT estimation, a
> congestion control state machine (slow start, recovery, congestion
> avoidance), pacing helpers and the New Reno algorithm behind a
> quic_cong_ops indirection.  quic_init_sock() now calls quic_cong_init().
>
> A couple of questions below.
>
> > This patch introduces 'quic_cong' for RTT measurement and congestion
> > control. The 'quic_cong_ops' is added to define the congestion
> > control algorithm.
> [ ... ]
> > +static bool quic_cong_check_persistent_congestion(struct quic_cong *co=
ng,
> > +                                               u64 time)
> > +{
> > +     u32 ssthresh;
> > +
> > +     time -=3D cong->pc_start_time;
> > +
> > +     /* rfc9002#section-7.6.1:
> > +      *   (smoothed_rtt + max(4*rttvar, kGranularity) + max_ack_delay)=
 *
> > +      *      kPersistentCongestionThreshold
> > +      */
> > +     ssthresh =3D cong->smoothed_rtt +
> > +                max(4 * cong->rttvar, QUIC_KGRANULARITY);
> > +     ssthresh =3D (ssthresh + cong->max_ack_delay) *
> > +                QUIC_KPERSISTENT_CONGESTION_THRESHOLD;
> > +
> > +     return time > ssthresh;
> > +}
> > +
> > +/* COMMON APIs */
> > +void quic_cong_on_packet_lost(struct quic_cong *cong, u64 time, u32 by=
tes,
> > +                           s64 number)
> > +{
> > +     if (cong->pc_start_time && time > cong->pc_start_time &&
> > +         quic_cong_check_persistent_congestion(cong, time)) {
> > +             cong->pc_start_time =3D 0;
> > +             cong->min_rtt_valid =3D 0;
> > +             cong->window =3D cong->min_window;
> > +             cong->state =3D QUIC_CONG_SLOW_START;
> > +             return;
> > +     }
> > +
> > +     if (!cong->pc_start_time && cong->is_rtt_set)
> > +             cong->pc_start_time =3D time;
>                 ^^^^
>
> [Severity: Medium]
> Can persistent congestion be declared here even though a packet sent
> inside the interval was acknowledged?
>
> quic_cong_on_packet_lost() is the only place that establishes
> cong->pc_start_time, and quic_cong_on_packet_acked() can only clear an
> interval that already exists, so an acknowledgment processed before the
> first loss callback leaves no state behind.
>
> With srtt =3D 100ms the duration threshold is roughly 400ms.  Consider
> packet A sent at t=3D0, B sent at t=3D100ms, C sent at t=3D500ms, and B
> acknowledged first (ACK processing precedes loss detection):
>
> quic_cong_on_packet_acked(time=3D100ms)
>         /* pc_start_time =3D=3D 0, so this guard is false */
>         if (cong->pc_start_time && time > cong->pc_start_time &&
>             !quic_cong_check_persistent_congestion(cong, time))
>                 cong->pc_start_time =3D 0;
>
> quic_cong_on_packet_lost(time=3D0ms)      /* A declared lost */
>         if (!cong->pc_start_time && cong->is_rtt_set)
>                 cong->pc_start_time =3D time;     /* pc_start_time =3D 0m=
s */
>
> quic_cong_on_packet_lost(time=3D500ms)    /* C declared lost */
>         /* 500ms - 0ms > 400ms */
>         quic_cong_check_persistent_congestion() =3D=3D true
>                 cong->window =3D cong->min_window;
>                 cong->state =3D QUIC_CONG_SLOW_START;
>                 cong->min_rtt_valid =3D 0;
>
> B was sent at 100ms, i.e. between the send times of A and C, and it was
> acknowledged, which rfc9002#section-7.6.2 says should disqualify the
> interval.  Since neither the acknowledgment timestamp nor the packet
> number is retained (the number argument is unused in both callbacks), is
> there a way to reject this interval, for example by recording the send
> time or packet number of the most recently acknowledged packet?
>
False:

The above case relies on packet A having a send time of 0, but packet send
times come from quic_ktime_get_us(), which cannot return 0 in practice on a
running system.

Thanks.

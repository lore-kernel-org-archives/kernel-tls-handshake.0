Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C19D189BB6
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  5 Feb 2026 19:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770318051; cv=pass; b=o5Olp/HhEuU6CPrBmodwoBW9cpMwOkMLjY1QpTcHaLdwthXsF9ptx5Dt3dThSnC5LjEgewlTlC+7SlnkanHNlUsTQCWIYc6S+PHAlQjiu05SnWqbqTkdwcwkNES9pwUTJVYhC3zm19jOOxcqskS3K/P7vr6CiCElLgmNj1FzYN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770318051; c=relaxed/simple;
	bh=AuskjtNOz6nZ0G+yrh6WViA45fpVm0rg4c0PZaDjONg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hrEM5xh6mzspGrCZRaS4qosMZ1MOjB5FGXvpcbh6O/4RfXxzeBav6qkSOCrC3k5AVNMZD1sdUzfWmNTY4NF8OHPvSnoAo9r3v7eId+w3qs3fNm///U85Tpfl/FNsTRFhbI2hKywea7PQ7Zg8hCkKgHqQCyMtN7CjtDmnGFYsYNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJW2L9HN; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJW2L9HN"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8230c839409so1260488b3a.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 05 Feb 2026 11:00:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770318050; cv=none;
        d=google.com; s=arc-20240605;
        b=girv6qOKuYzUR20sdA694rvWKgKWicVpRuUidhE7T2Ix17c0XP0j4/Tmlo/LutnJ+i
         cFqOkfqgdMJIOB+ztmyI6YjD2KRQjuwC2wFRpVmnHt1u0p5npehhZBkDdYE6Yze70m+l
         GvKZdPAplDhIJV+DyStelJeKTCYd1+nBLLIWbXgtLw5NLnIiS9rmg48dbaBq2R9787Zw
         mmaw/fnH+TobnYT68uxsGelFMKycYuaqZZ0688kM16hIY+sYyOJGAWrNXvzBKqWCi9C6
         80V46D2GSUy7Ca5ypPCUc16JkBaW5tikRH9NT8vHNAqMqDkCL/dwrtinJ1/erR19POPV
         VoUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CzWk8gLvE9O246b4A2vdYNLzmmHIUhQKe38cf0ISaC8=;
        fh=z1zzZFkIaKplRhXh8r26K9Jncp2xBNVSApG3QONbt4o=;
        b=OHc7rIJtBiSZ7KA7PuipEIRk1WbcSZMAPI5H1LFtdFo3bPRR2QXtzj5HjGQ1kQbavb
         SKaSw70vKxEebDJ8kdDLvyaS6fIiZ3dbuOkSslnxgay7N+bRQhNkIMqkDp4BsCz20zPG
         p3xfP9i4jV+ncsn5KlUhPD+qiaCinv5GvA2OACB/d9Br+dbAwE8V/mgiqGlB0yd6LUCz
         Ml8Eb2DB1EivMHglwj8S/SujCvZDffMuB1hUaKkrYDoGdl95n477FY3sUINtd1d1h4GW
         wZZzNCd7Avfg7z1rq34eCx8wEUYcmmZ379Iv5XrVwTKYE4qqJYCvjCK7bouPQqKOOoTm
         m4uQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770318050; x=1770922850; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzWk8gLvE9O246b4A2vdYNLzmmHIUhQKe38cf0ISaC8=;
        b=CJW2L9HN8xLffHSb/XHZRKdGI8VrHHPH8E/lE2itSP1b+Bc/1US680a+qqXWp+h8KU
         lcJlZyIrsoVEDzCRliv+JHKOYs1OZy2M//2lJKd0x32qpvmF1DedsZStBtqI9JgjPUKY
         Z/87ruw2jY32CNGxJxttCAIsSipiFqlHRFkeloCZKICJXdvl+h50NxGlszAtoL830Xp1
         8fYDYkXwG6GnWmQJ8Q5nj7LmLaK4XQeezpZbdXww4OWuK3hCePI0XUEbNXvQxGNBeHLV
         P2Cx1MpAWIAwdPOdV91Ozt3LBOjK2ZCxlM/vT0oFVA4DV18BldplcPG8dVoALhDL4L++
         duzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770318050; x=1770922850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CzWk8gLvE9O246b4A2vdYNLzmmHIUhQKe38cf0ISaC8=;
        b=sTE4FAgN7DZL+DkuVSsb4Ni+HeUwT3caqZCP1JCeNWjr9HjAFdFHcaTX1ELqlgjzKm
         7GFcHSMXwsQjmkweHyBLoilCo3PTm0abhy5skJVnxobQPFYLkNrEkY1GNacxrejChQbA
         lsNPBuN08jBscjPA6bpNQmyfdfRtsa+/FS66ugTmGSm1ePgibHvtpAJLIi1+spaUARaa
         qJawkef47cVkG9ZIfuT6V6amME+AIli23su/gDnEq1dAOxCVrzFeSrN5ASb/zmWqtxf7
         v5jGE+r/1vqJKMif5Bs1Vo0WPXBDauRSBByu4iQQ8Ar+jljUZZZNe7jRzSoEnv/DU8es
         m7cg==
X-Forwarded-Encrypted: i=1; AJvYcCXkr2H1rh+5RhZ+THBttfyAzNSJZ3mV/frQNPl5cHSrrtdOn9XTRVRUApxkN3zg8h5EniRqcghYX30yekWtO22i188seQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqwKxlBKHIRV+Q8XaqA8fTRxxq26xTBk0h7fq6jMY5pHAFN71R
	PixQ45pMAxn8HJa4uXaLbf2CBiXEMD883EneqEEiOmfMb8UtWQsJ887oqkM/GcW1JkFUiQWDxKk
	TkqwIyEkWXxKWRIJTjkpkkdbG0Fdatdk=
X-Gm-Gg: AZuq6aL8uidzi7XiKVbuiKfVKJ7ZqjZSDdLpegQYBvYB3uFtaJd8axvY3HSlXAw553s
	Tcla8ktmnH1ATOMKqXNOCfnwxFfyCsVBmVlWf/cjSSaIXXbPEcLfokl/zforfmqBOSZHUCmyI2u
	ojfzm6qQRmoNvqeb/KNawgN/Sf/K0b/0kZltCLjQ2gXpYDubplgMN1kTQqEFH8XbVlmnpPPPYb+
	AxTCX/XPFVrt8bWQS9srjVqiVZZhg1p7dr+SCXUA4iBgi0J48njxr+OaTWHell1LXbg1be1z0hD
	KfppveqRve+92ddMdg7DJ12YtQMF
X-Received: by 2002:a05:6a00:2e07:b0:81e:711d:b26f with SMTP id
 d2e1a72fcca58-824416f7a4bmr51256b3a.43.1770318045758; Thu, 05 Feb 2026
 11:00:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a872188a6e4d7b39d6d6d0f6fad7e5077bce4bae.1770042461.git.lucien.xin@gmail.com>
 <20260205115532.2195345-1-horms@kernel.org>
In-Reply-To: <20260205115532.2195345-1-horms@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 5 Feb 2026 14:00:34 -0500
X-Gm-Features: AZwV_QhKP_xJtDWc386RLFvCIecEAqeBpy1wdehizIZr3NTnLt_Pak2USLctFus
Message-ID: <CADvbK_cHtubdKv4PbYf0vG=3EPMrYw_Jo=_qqNvVb6+SoDvB3w@mail.gmail.com>
Subject: Re: [net-next,v9,09/15] quic: add congestion control
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
> quic: add congestion control
>
> This patch introduces quic_cong for RTT measurement and congestion contro=
l,
> implementing a state machine with slow start, congestion avoidance, and
> recovery phases using the New Reno algorithm.
>
> > diff --git a/net/quic/cong.c b/net/quic/cong.c
> > --- /dev/null
> > +++ b/net/quic/cong.c
>
> [ ... ]
>
> > +static int quic_cong_check_persistent_congestion(struct quic_cong *con=
g, u64 time)
> > +{
> > +     u32 ssthresh;
> > +
> > +     /* rfc9002#section-7.6.1:
> > +      *   (smoothed_rtt + max(4*rttvar, kGranularity) + max_ack_delay)=
 *
> > +      *      kPersistentCongestionThreshold
> > +      */
> > +     ssthresh =3D cong->smoothed_rtt + max(4 * cong->rttvar, QUIC_KGRA=
NULARITY);
> > +     ssthresh =3D (ssthresh + cong->max_ack_delay) * QUIC_KPERSISTENT_=
CONGESTION_THRESHOLD;
> > +     if (cong->time - time <=3D ssthresh)
> > +             return 0;
>
> [ ... ]
>
> > +/* rfc9002#section-5: Estimating the Round-Trip Time */
> > +void quic_cong_rtt_update(struct quic_cong *cong, u64 time, u32 ack_de=
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
>
> The field cong->time is described as "Cached current timestamp" in struct
> quic_cong, but where is it written? The socket struct is zero-initialized=
,
> so cong->time will always be 0.
>
> When computing RTT with a positive packet send timestamp in the time
> parameter, does this cause unsigned integer underflow? For example, if th=
e
> packet was sent at time 12345, computing 0 - 12345 wraps to a very large
> value.
>
> The same issue appears in quic_cong_check_persistent_congestion() where
> cong->time - time is compared against ssthresh, and in quic_reno_on_packe=
t_lost()
> and quic_reno_on_process_ecn() where recovery_time is set to cong->time.
This is not a problem, cong->time will always be set before processing
the packet on the TX path in the next patch series.

Thanks.

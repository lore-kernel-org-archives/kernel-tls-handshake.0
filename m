Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CDC3090C6
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  5 Feb 2026 18:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770317773; cv=pass; b=U54JeFt5OZ8vnR9KylcEAfP9BeRZ/g16XWeWfX7c3JSFwyYuKxtoY4u87cQxe0GO8W68j62y1axcU720pn5ADENdH2anboVfdcN3//sf3FPxWAth1xSCfkteKCi967XmWJfD5oomvPlBMRYt+PEmxeFtraHIRzFdSen6xLXnjN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770317773; c=relaxed/simple;
	bh=UTAeTogqMPOzWsl43rYalxijcnMd4QsYh0uYCJzTId8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nz1sGU5clD8KZ3KqvuWwsgDXG9wiI8ZbQKAcGJ1Ot4s6ZtoFY4eAUjUWObSPZvzomATC2TtKr4gIIjNAcJYrYRnaZi4AuE/sqhhJF4knhiGi2x/aH9mmGdeidSYuOtQ5jRZIZWoqYfQvdxnoCD1HrLbjRJN8s8efaTsG4hJX71o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C03A7cO/; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C03A7cO/"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35334ea1f98so586932a91.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 05 Feb 2026 10:56:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770317772; cv=none;
        d=google.com; s=arc-20240605;
        b=R3Xg6iMrjHicarRge8F09O/S43Bk4uzf84nQ9YYTzKyy+n69jNuDkSlyWB5rdGh+hi
         36xCM75hcdzcQb8kzU3ge5Z7h9ARY0AK7hay2CTdWMpckrg/37LpyH9cbx/xKWww+pUH
         xDZM2LXE0X0jv1OAM+R52hHctAB2z8Bk+nKR61SmMNlLw9c/PQpn+gd5u0wsBUuCmVEd
         XJ0sNtKWair+gr2YGmLYIa3RCndM24gv2Z2AvRbv60svqbLt+Ku5AeXsG8P1riagG3vf
         MyM190sLyzn6KhWUNIG5GujrPPHwidKXzJLNuzCmEvvwcJJBRvvjuqeNrqHiKFLLt6Ie
         HZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=80WFsFgkgPBLtk7OvSKjFaYy+3cWwSZUPkBNVljL2Sk=;
        fh=6sE7NByeSYHx9zA8JYLgrf9coKu0BI6UuIZuJGIyr2I=;
        b=ZULzybWSYzfisMFDCggc1MUYe7LjVDoV5WctHF4MuIuwXzwA2zCRVuK/N8uRYvpEJ1
         9UfOmDBVuF1eHnCR2l77h63IsQKjRpX8A4+bGMxyeEUJj/5JMh7cfXxBBl7v/6hBSmtN
         mtQQB/esHEExo7AOoQNbLQBggldyzfaWOkRS5FS4tkFrD4IKVZp3pId4S3BOKimKtzVD
         tz//uFY41DL0YUYhvD/JTpGV5Sn2mweArUIJMgflGiLXqRc6SznzmgRqP/pJdnS7nBXT
         xKkDhGusYJDcBM6aRpVDZucUeaUWrhLimdWcEdNMaLT798UNMR3okeuQulq0PToZdj30
         hgiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770317772; x=1770922572; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80WFsFgkgPBLtk7OvSKjFaYy+3cWwSZUPkBNVljL2Sk=;
        b=C03A7cO/A2TDYkGWSGKV05vB97YhFLbyetPiGHasR4cEVBm/xEPli8+zyZeV8cglOV
         MyB9mdcHKZ7AFLtr3V/eEC1nzMBumyffTbVMZsVJw8UwQDoDrps4kAa44u37OTHtPxxe
         wNKTXM1RnByQZA7WXuLRW9tuab22ElrtjYYNbo6ePxNNU4ctRtc5sbUEV/NpPjkVbasQ
         LtqsxgaZTqgSS1ll2Hy8jSLLoPzm3CXkkyF4oQo6yFkVN9/rxsAMVBVeGDdpagpAySqu
         x/GaNjihwKe0ratG2TOqF15D4JD36HC/gW7YPRpDHMWMAhOnCD1hsRho16DkK8fFLm0Q
         j7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770317772; x=1770922572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=80WFsFgkgPBLtk7OvSKjFaYy+3cWwSZUPkBNVljL2Sk=;
        b=rxki14bIr4uz/PUaSrtVNX9CIqjfUz5Fu+ZVSnu2lCRrEbCHAs3F4LVDGX9RTRz2SN
         WSML8rzkZx2fXl+gZ0g+dHW4fMfIbiJA4SnHYib7ne60LnnbMiKyj0u7lBtj5ghoY6G8
         qkNJmPVrHW6mDjkJUGv/qeLGhhuQxZPf2OHkFWOzmwpCdtP1Oj7ry/qauI4O/pxLfFlx
         2vZApN/qBZf3PFj7OpMg3p5ZlNVAY3dw9i2+L6ydGh6/Hc80xgYfjJsWUg/Q30pl9XTg
         8QXftAndueu1uMwUQ4wjBEGHa8W/HpcMaxXvX33CLMLeU3OhTKhP/KkGC3U6zuBOaPHg
         XYcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAYpEZHpi6gpfTuj7RmKIDtrArLl/EDA0WRWUKl5Ee4lhbkN8/ZeWZHiPULO222HNX9F11CMWw7ZVTVQcb+fJiex4aEA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlkKJN2OtZeB4AylmIR/apbzAh9tMtoLnnbnsci1LiK6NSqckW
	OcYpdCy31zGpmKGc007hHsTqhbZNloMFueq3rAng1sv8BKMbN62vPnkpNC09bxYvPexBYc8FYz/
	/SBzjZGN9NcIlG0rDS9y59VyVwQUZ0tc=
X-Gm-Gg: AZuq6aJe945Th82mK3IuSZm/4AOD4bwL486Bi+MXsHN+xinW1RfbCIjrTa1Yxx/YZPT
	xFssiAgaXP85Ug4pEO32CvSSSr0BX6pVPA2b5/gWxhKMnX3HkiKLQTB7weH9CAzW6yRogcYIsVv
	+HCEs6QibFNkloJCZuS4egc76oj+fo9b4ZJ8SN3JET3GxpYLnQsImOEpNBKO5KwCT3+jnaBn8e1
	OZQAN4R6Q9NirAm9MRoKRqLpuQAejox3eaWtDwJtlCwp8qUmrmnUi4e6KuhcfqSfMnhKTw3OXcz
	n655qR05RjfmiDoaRL1/3F1gTA5Z
X-Received: by 2002:a17:90b:3d89:b0:34c:2db6:57a7 with SMTP id
 98e67ed59e1d1-354b3c50bcdmr29630a91.8.1770317772303; Thu, 05 Feb 2026
 10:56:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <d3a376cf555e7740330a50d83e6201c9084bff01.1770042461.git.lucien.xin@gmail.com>
 <20260205115518.2195328-1-horms@kernel.org>
In-Reply-To: <20260205115518.2195328-1-horms@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 5 Feb 2026 13:56:01 -0500
X-Gm-Features: AZwV_QhMX6JEvl213fgLGN4KP_FM-9zVeYTAxoLTMPmESDUtW4x9IOxJ01wxKVg
Message-ID: <CADvbK_fsXE6MkgF9KMVThTgsid9Tgkyjrvwyek9NM1jd0KZ4Vg@mail.gmail.com>
Subject: Re: [net-next,v9,06/15] quic: add stream management
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
> quic: add stream management
>
> This patch introduces stream management infrastructure for the QUIC
> protocol, including a hash table for tracking active streams, functions
> for acquiring and releasing streams, and logic for detecting stream
> ID limits.
>
> > diff --git a/net/quic/socket.c b/net/quic/socket.c
> > index b86989080184..d6f25669c693 100644
> > --- a/net/quic/socket.c
> > +++ b/net/quic/socket.c
> > @@ -41,6 +41,9 @@ static int quic_init_sock(struct sock *sk)
> >       sk->sk_write_space =3D quic_write_space;
> >       sock_set_flag(sk, SOCK_USE_WRITE_QUEUE);
> >
> > +     if (quic_stream_init(quic_streams(sk)))
> > +             return -ENOMEM;
>
> If quic_stream_init() fails here, the function returns before calling
> sk_sockets_allocated_inc() and sock_prot_inuse_add() below. However,
> when initialization fails, inet_create() calls sk_common_release() which
> invokes quic_destroy_sock():
>
> quic_init_sock()
>     quic_stream_init() fails
>     return -ENOMEM
>         -> sk_common_release()
>             -> quic_destroy_sock()
>                 -> sk_sockets_allocated_dec()  // underflow
>                 -> sock_prot_inuse_add(..., -1)  // underflow
>
> Can this cause counter underflow since the increments never executed but
> the decrements in quic_destroy_sock() are unconditional?
This is a good catch, will fix it.

Thanks.
>
> > +
> >       WRITE_ONCE(sk->sk_sndbuf, READ_ONCE(sysctl_quic_wmem[1]));
> >       WRITE_ONCE(sk->sk_rcvbuf, READ_ONCE(sysctl_quic_rmem[1]));
> >
> > @@ -52,6 +55,8 @@ static int quic_init_sock(struct sock *sk)
> >
> >  static void quic_destroy_sock(struct sock *sk)
> >  {
> > +     quic_stream_free(quic_streams(sk));
> > +
> >       quic_data_free(quic_ticket(sk));
>
> [ ... ]

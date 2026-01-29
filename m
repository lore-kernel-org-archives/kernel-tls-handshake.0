Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B3D3271EB
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 29 Jan 2026 19:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769715486; cv=pass; b=T9HQpxO6U4E/HYGzpqEW6WbSU54uR4iWy4pjhmyaNmDADHvyYG4i64XE2ALLmRx/27tChfcCAYm7vQYAu1vNC2kcPzWmhNimTL3/9p9V/Dl+68ka6gR+RRyap631db2WB3d38AbVviadJnT48LGTPczAKljGBhF+EMPzUy65tfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769715486; c=relaxed/simple;
	bh=an23PzgT+ETDMUmkvQg/3z0rXD8Ts/s/wrp73SCQ/LI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MzpfNM+zokYolKCAHm6dxXGQ6X/C6MtA1C6jCmU36/rFfzTTMCpH38ErxGug1pPtlcE6wxiLx8eHxi1K3c3OPLrL/1dvihl0d/4MB8oAY91F2opNvATGqTBQRg4setwTgyy/zspu+dgOSFVAdKi1gpMsLyhSd1OGQCOhqvdxUfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThEBb4Vk; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThEBb4Vk"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c6541e35fc0so742455a12.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 29 Jan 2026 11:38:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769715484; cv=none;
        d=google.com; s=arc-20240605;
        b=RyrGd9yaTBxBnJyYPPplO/ijh/heeqxlILaybZeeghoedLweGZnfYSIVy9lsS/khSf
         PCk6tNqxnNzoLjw8dZd/VttV4pSJ0s/jUlvm14X+N40qiNpGVcANlxsNDX/l7k2Uhr7n
         FbPv7Ywl4obx7X82UKWWwTCb6hOdfikOtYwuDKwxt5kPgyUfSIk6csfSYjl1xTkpI/i3
         f2q8kOUkrBJpDOM0JFdT7en0YF7A0C7EPZGJjTewvtyfiduG4L04Zqa/dAEieURIg4V5
         2GbPyB0FJrFCNtSfDuorbuSa65Z7RYHW94Y1mwT4AnlmAxBlnl8TLGxtoyt+ByG0lDro
         qPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8jgscGADAtGExE/c6eNO9k9qz7qLCMhugDMGIDtgfTs=;
        fh=IK1l+yv37DoUrBZX/spRXtkjdW+lhG80E96/gvS+sJs=;
        b=cIKblbN03+9G3g6/K61wF4shDrnw4c3LB73dw89um0y0YoVb5NeLFws8M+5ZfJu7B/
         9iggLGyLx68pib84ygZIVJEpALpszJi2b0zE6VLe6nsq3R5jhYXjRX/C3uxL0n/pgl04
         5M70SlxgijaLlgJFc2ODMYtGPgGVCGA4oH+57J3Olvo3oHcsupZY5d1fRuHq1ai6pR1k
         nhwdTBCW5rwqWn2fB9ADkb0slnojiCFR/QOd5EzRVi7BkW23yiQ9MUOBIAjiHKVd8gPc
         PtKAVdOyxlsGAVnE6qKfOKjaels+j0rixMOYNoYqO2BH2QWKoHtKDPqCkZujoeUGTZZE
         jvfw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769715484; x=1770320284; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jgscGADAtGExE/c6eNO9k9qz7qLCMhugDMGIDtgfTs=;
        b=ThEBb4Vkn17atQKEgsp35euGNDMUoEz0PIRDKkiOTN67PxMIUbstZf9kflWKMLFFg7
         n0YKD6QTMfm5h3SkeAtmJjdLKyJukZ96nTRXsgZgq8UsyfUlrRz6Fp/K+pffyLaCc5BN
         rldU99lTTjfUsMYL5HCxKEMEuGghCohrihnrPzDQmzKag9nE0xFf8YYixrU/BLFpPtJM
         xDBXWr9DxQAiA3h3ues84LbvDzxhQREhoAnvP2d2iRZwcZabLtrDwRxXaPatmtLGGhxB
         QDQGPpIIzW+THOapFGQmyFE7pW+4p7pRanOI0utMIasKJeteAdtIrMJKm07GJ1Lt2/Bb
         hKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769715484; x=1770320284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8jgscGADAtGExE/c6eNO9k9qz7qLCMhugDMGIDtgfTs=;
        b=i0CmG6dvFPXDIRHTavIEgyw7hypt4B/6gzyW88q15pv7uxcWo7oKoO+FAChuk2gCuY
         P27i8GliXPGbslGpZbD57GbU8dOrZvzoVYEvl3eUpWNJC+gcZJbi7WVQokYxnvH4gTaQ
         YtGMwhvgpcByc+wa+fMZKmYXqaL0hGaJHDikzx2KRZwlyIEbQSJ2vammiC2Jdg3JwqGw
         QocEVR+I9VzEvFoMSRgnRTVGj0O4flrLeQeoe0zhQsTan1aNGmrEJfNgghsa1swxYE6a
         4r/YncBMbEezwuzeRdJqB3qlUL8BASXNobU1bEx9/wyPbqGpoAZ+5o3FAiHtyuRfZCDe
         SETA==
X-Forwarded-Encrypted: i=1; AJvYcCVz67i5ouMOSUxNvm748ItxPWHxhyAVUe/+Jru0IGY0M6RrORmHgOfJTofg1IDvYD1G9ws+kupP74zNCAseURMUhAyCmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIox3LQghB+7zs4rFuIt5KhREP70kLtoP3cEYESFDngo2o7vcN
	ebfvtcJGKX4QtjKlQUtpOxag9kIzk2NY6B4teHamiFWUFxaZDKj6CoJ/01dc7Af9MKq0r2yZz9b
	SbpJTtMe675hP55VDNgNI2L1CCpuuYPs=
X-Gm-Gg: AZuq6aK2Fo7zUiYBy9hd13LUVfLNq3wpNuoyDrN6xYItudUlCiEi6wMlhY8lKgNsUjI
	4O3T5C1nyLtB0/seISY33FhcR8mGgF7WFpOi7JulfmqckKMVKgFtUAdQqGRt2e0Uels4X8B8VKT
	ZKwR9v6oC+ZZRC1L3RBEm/xPiqHakYWeo1pNUdy77rtOjUiGOte31QEBPhqEmbz5mcBLOMU9+b1
	o5XOJHIBnZQXxuvHOJXZFqS7JTHqPqaos+l6HpjjriMUKL4kDNKDY6N74fUcaPyCFgTWQxK9Qsu
	rpmnhMuqc9twVPkbziTLzlQY2n/0gqtBX5QAuclA
X-Received: by 2002:a17:90b:2e10:b0:32d:a0f7:fa19 with SMTP id
 98e67ed59e1d1-3543b39c961mr584686a91.17.1769715484009; Thu, 29 Jan 2026
 11:38:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1769439073.git.lucien.xin@gmail.com> <46f93cbee41da1e1f7b7f408b17915fd93b39ec1.1769439073.git.lucien.xin@gmail.com>
 <bbbaf4e5-1c31-4c84-adb4-dbb94b8d07f4@redhat.com>
In-Reply-To: <bbbaf4e5-1c31-4c84-adb4-dbb94b8d07f4@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 29 Jan 2026 14:37:51 -0500
X-Gm-Features: AZwV_Qjv2qurpUKIB7y-u0yeOaDoaz7ma2YS0Xi_VtbJ92jOQ4X9Nw-fNxtkIAs
Message-ID: <CADvbK_eHu0=8G7--neMHz5CDT4_MV-MONRu8obOsYbUhCc1ocg@mail.gmail.com>
Subject: Re: [PATCH net-next v8 15/15] quic: add packet parser base
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

On Thu, Jan 29, 2026 at 11:53=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 1/26/26 3:51 PM, Xin Long wrote:
> > +/* Lookup listening socket for Client Initial packet (in process conte=
xt). */
> > +static struct sock *quic_packet_get_listen_sock(struct sk_buff *skb)
> > +{
> > +     union quic_addr daddr, saddr;
> > +     struct quic_data alpns =3D {};
> > +     struct sock *sk;
> > +
> > +     quic_get_msg_addrs(skb, &daddr, &saddr);
> > +
> > +     if (quic_packet_parse_alpn(skb, &alpns))
> > +             return NULL;
> > +
> > +     local_bh_disable();
>
> Is this really needed? If so, it needs some comment explaining the
> rationale, otherwise please drop it.
>
It was needed, as a spin_lock use in quic_listen_sock_lookup(), now
it's changed to rcu_read_lock(), maybe I should drop it. will double check.

Thanks.

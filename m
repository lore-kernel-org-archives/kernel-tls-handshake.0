Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA6027C162
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  4 Mar 2026 21:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772660538; cv=pass; b=H3+WM6ofjIV2GIcXPVW9Ed6aP4ajllOFHpuyuF61/dRmFBKBS+C74UYpiHDHQMvd/HfPHil+lCKth6IAOAtA5+NukmC+tXp/Nr+l4ROLIcZ7xpyZWD7u1x/AbVrDOGbbXDK97COWNLd6A/Am708/Pk3m1aLhXCPNyFdX+xp6yaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772660538; c=relaxed/simple;
	bh=CZu//w8nfUqxfRbIfFweHrXIoGfZbN61WXULKZ59AeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqSW1Xs3MCDYJ1l9tllxXRsyrpgxV17sEKSk6O6XfpaEBn+TbdcSTgjvEEmc1CJzNy03FqLbWwYJeWuIZCAakyC7sXJU1uhvADjz5H3erUJhH//9wNPsw8bhgOA4rdtQOhsVSr3Ae7swqisA6S3hQZiBp4Nnu+Ft5KxOIJlf1Hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jInS4VAZ; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jInS4VAZ"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ff174502ffso5221197137.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 04 Mar 2026 13:42:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772660532; cv=none;
        d=google.com; s=arc-20240605;
        b=HqV4+x1YwpKR3x1FpIlenCw6lT79lHOz+gqN4D3mblIp1MVn+UD+5RAl8KyQhZWBnZ
         xdPh2W1i3s+9BUYKrUhrvNkRgW3aZeiF0T6iKohtY2/1jHxZMiFLLZkmAhVVRlparmh5
         NG/FCEFsxjWJUHoqqG+uXmN6dMZwU7pPpc7iezFu1uY87bOnRC843R/GEEE19cuCC0xt
         0ZzmFsySZbxLNSO7bLnY7WSZLYmS7Bl4nuCbrJ2sJ1MrODgZM7qIhd+NSKETRrhVAwsc
         xZGuRfaMim41wkoBo80EG3yha1tfCQy3YdG6J7CcX0KLJsaHKIQzLJyV3dvu8ASnqh+P
         uF2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k3W5ct/v2iGUTvV1EtPmndYMgCvTbcZYMCleQX41UhM=;
        fh=HYJ9NzeHlgDuwaYvoyi8mXvJb+dLJejOX5H/eub3VF4=;
        b=KL1bcfpOX633ehQnlgAKiQjM2sZucp79ioSRwg3bJnOW8Nh3KMEKM3MwK0eeSNCThC
         5OSdMWXDnAawbytAxiWeY8mE16aAqggvAqBpYCubP0yjCARP+gBve/SDs1+wz1WL0Kjd
         WxX2aPKq4HIBSIScA2CkQZfgxuVI66uT4jfVNNQe8V4sAV7o+5GVZUlpHCkYBsq/nMj9
         v2SIH8FikUk4JU3KijFERH03SeI4cfKF57iqY3/mvQ/tAOz4V5bKSMP5zS8ExCZ6cFbO
         Mmz/2XgCK63TncRkCaN2Nf3Zqr7s3ydqM4/vPrisYDFysZ5VyaX8LkScXbjqgLh6SJ1g
         XX3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772660532; x=1773265332; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3W5ct/v2iGUTvV1EtPmndYMgCvTbcZYMCleQX41UhM=;
        b=jInS4VAZLkL9pVZJAcLStf067rgcFU9TxbpBxNi0XjklN2bxozADXamOKUO4/e/+Ux
         bG+OKrHtuDx9WFueEIClcqndVOGTUgw2PVqogfAXFttt2hssFpUNUWwtGxRi/hZ6jcmS
         1NyGBFeQf0BGn62tgDKt+OM9kd370yok/vztQBVc0RMZOlb6iUkEG8Mox5xwFYwtK3Yx
         pXxUG36uMUFD0x3wNXKroU3THZT+pZUOcLckhXbyUPbcD3m/lazwp+OZ8v+Wf1/15iHu
         2rWsq2dDz5wJJD7+v1N+1tmadZNx5D7ZH8HlK39g+9/7Df6OY4EOOvmjLbPjIHxsfKOx
         4O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772660532; x=1773265332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k3W5ct/v2iGUTvV1EtPmndYMgCvTbcZYMCleQX41UhM=;
        b=FEkuBebWtcPiYIB286wS9jOtWJebU31uDGe1APD16tv4nSGZsqp2DNeRL8irMsrPi1
         ce1ukFFBgE2B29/glRi9Ws3vhAZ36QPOdmlYgu1rGY2DolwjZYFT/hzn/vdY28QYCbel
         mtmPL2zByCypHqG+L2a+KAUvROralEwWIBLOOSgTh2qbJdUbZAwOWs4cvvy5zaFuGFde
         OX2XmdA/ZDgN330Vio5H13/LVRt/kQXXz/fW+EoiuSP9rKTJewcAulQRolIr0lcr0mMg
         Vg2+PUHUQBCM42lH91kBBwvMER8cquHrDDvzC+L9Nw21yfBLkBayUL4Kr07TWhEDODOo
         bjzg==
X-Forwarded-Encrypted: i=1; AJvYcCVP0GWNBmhhOGpAeZ5psFIM3OKXSWGz8YXhF8xPR+Ro63Ib3LDpwpExMuS4Jg62gLX4PLKVvVpqS2afTLyP/tf64/IP5w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWmjuxFEjWFO8BtaWy5yIoBj6Jfq8Rsmm/YRi0xXd6kDbl5lCr
	qktYbsJIOZwgtjc2+WatWfKKJeLqKjBXjnH/7G7TDKKjOO7isTJ9Hq7A2FvxcNS2CbK9MoKt9pb
	C7LMrQS6sNo+a/bpJRGRA+/SlnBdxKsI=
X-Gm-Gg: ATEYQzzRFOySEoXh0ORMZke4djwRVms/f0Ub4ohyS9u+b9n6OzTyBSoI+qTT2FcDCTh
	jzRysiBsszXmGsqKYCz9Lutm3PDXSZx1DNmlNNYweHxMPCtS/yfL2sVlGeq4j1VMcU3R/OboihZ
	q2Q+B2BmemC1lMYMTp5QtCaRAEz9ycI5nnycd9aVB3YenGSZ56R2SfQftbmMNNJrsnYe9QRsRmF
	oQ1zzfod6eXSQ6lZx6Ijz7ZJ8xHmgYB7lAW6sQ9bBwWGW0hiJBr5sxIMxakeLbqC/zuuCajsru3
	93oTumj//AUdPdngDEW6zyH36QqlFTU2ppVCwbmTL+KYsOow0+iEnzUwNELp0N1BFhYNCb9wfvX
	ttmGYLa4fGXajDzbhIJ1H5qik9/qvdLzeMFkd80JQY2tj+rKnSQU=
X-Received: by 2002:a05:6102:26c6:b0:5ef:b0d3:295f with SMTP id
 ada2fe7eead31-5ffaac4951bmr1696488137.8.1772660532453; Wed, 04 Mar 2026
 13:42:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <91c5313a4c6675fc9f98efbafc92ca162a6e7d66.1771986861.git.lucien.xin@gmail.com>
 <20260303083207.34631-1-pabeni@redhat.com>
In-Reply-To: <20260303083207.34631-1-pabeni@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 4 Mar 2026 16:41:59 -0500
X-Gm-Features: AaiRm50iQw95v8k3Y7-EQTJAv0UA-MtI9QwoadQFdZTYPxQjeDw-BRrDhXRxJ78
Message-ID: <CADvbK_cKefZpb=yCi_yxVWX4ear96LpCb+9W7pXs_thRWCWB2g@mail.gmail.com>
Subject: Re: [net-next,v10,09/15] quic: add congestion control
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

On Tue, Mar 3, 2026 at 3:32=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
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
> This patch introduces quic_cong for RTT measurement and congestion
> control, implementing a state machine with slow start, congestion
> avoidance, and recovery phases using the New Reno algorithm.
>
> Signed-off-by: Xin Long <lucien.xin@gmail.com>
>
> > diff --git a/net/quic/Makefile b/net/quic/Makefile
> > index 1565fb5cef9d..4d4a42c6d565 100644
> > --- a/net/quic/Makefile
> > +++ b/net/quic/Makefile
> > @@ -5,4 +5,5 @@
> >
> >  obj-$(CONFIG_IP_QUIC) +=3D quic.o
> >
> > -quic-y :=3D common.o family.o protocol.o socket.o stream.o connid.o pa=
th.o
> > +quic-y :=3D common.o family.o protocol.o socket.o stream.o connid.o pa=
th.o \
> > +       cong.o
> > diff --git a/net/quic/cong.c b/net/quic/cong.c
> > new file mode 100644
> > index 000000000000..e0f78ecb00e4
> > --- /dev/null
> > +++ b/net/quic/cong.c
>
> [ ... ]
>
> > +static void quic_reno_on_packet_lost(struct quic_cong *cong, u64 time,=
 u32 bytes, s64 number)
> > +{
> > +     if (quic_cong_check_persistent_congestion(cong, time))
> > +             return;
> > +
> > +     switch (cong->state) {
> > +     case QUIC_CONG_SLOW_START:
> > +             pr_debug("%s: slow_start -> recovery, cwnd: %u, ssthresh:=
 %u\n",
> > +                      __func__, cong->window, cong->ssthresh);
> > +             break;
> > +     case QUIC_CONG_RECOVERY_PERIOD:
> > +             return;
> > +     case QUIC_CONG_CONGESTION_AVOIDANCE:
> > +             pr_debug("%s: cong_avoid -> recovery, cwnd: %u, ssthresh:=
 %u\n",
> > +                      __func__, cong->window, cong->ssthresh);
> > +             break;
> > +     default:
> > +             pr_debug("%s: wrong congestion state: %d\n", __func__, co=
ng->state);
> > +             return;
> > +     }
> > +
> > +     cong->recovery_time =3D cong->time;
> > +     cong->state =3D QUIC_CONG_RECOVERY_PERIOD;
> > +     cong->ssthresh =3D max(cong->window >> 1U, cong->min_window);
> > +     cong->window =3D cong->ssthresh;
> > +}
>
> [ ... ]
>
> > +static void quic_reno_on_process_ecn(struct quic_cong *cong)
> > +{
> > +     switch (cong->state) {
> > +     case QUIC_CONG_SLOW_START:
> > +             pr_debug("%s: slow_start -> recovery, cwnd: %u, ssthresh:=
 %u\n",
> > +                      __func__, cong->window, cong->ssthresh);
> > +             break;
> > +     case QUIC_CONG_RECOVERY_PERIOD:
> > +             return;
> > +     case QUIC_CONG_CONGESTION_AVOIDANCE:
> > +             pr_debug("%s: cong_avoid -> recovery, cwnd: %u, ssthresh:=
 %u\n",
> > +                      __func__, cong->window, cong->ssthresh);
> > +             break;
> > +     default:
> > +             pr_debug("%s: wrong congestion state: %d\n", __func__, co=
ng->state);
> > +             return;
> > +     }
> > +
> > +     cong->recovery_time =3D cong->time;
> > +     cong->state =3D QUIC_CONG_RECOVERY_PERIOD;
> > +     cong->ssthresh =3D max(cong->window >> 1U, cong->min_window);
> > +     cong->window =3D cong->ssthresh;
> > +}
>
> This isn't a bug, but these two functions share almost identical logic
> for entering the recovery state. The switch statement has the same three
> cases with identical handling in both functions, and the four-line
> recovery-entry block at the end is exactly the same:
>
>     cong->recovery_time =3D cong->time;
>     cong->state =3D QUIC_CONG_RECOVERY_PERIOD;
>     cong->ssthresh =3D max(cong->window >> 1U, cong->min_window);
>     cong->window =3D cong->ssthresh;
>
> The only difference is quic_reno_on_packet_lost() checks for persistent
> congestion first. Would factoring this shared logic into a helper
> function make future maintenance easier and ensure the recovery path
> stays consistent across both ECN and loss events?
>
I will add a helper quic_reno_handle_packet_lost() for this.

> [ ... ]
>
> > +void quic_cong_set_algo(struct quic_cong *cong, u8 algo)
> > +{
> > +     /* The caller must ensure algo < QUIC_CONG_ALG_MAX. */
> > +     cong->algo =3D algo;
> > +     cong->state =3D QUIC_CONG_SLOW_START;
> > +     cong->ssthresh =3D U32_MAX;
> > +     cong->ops =3D &quic_congs[algo];
> > +     cong->ops->on_init(cong);
> > +}
>
> Should this function validate the algo parameter? The comment says the
> caller must ensure algo is less than QUIC_CONG_ALG_MAX, but there's no
> runtime check. Since QUIC_CONG_ALG_MAX is defined in the UAPI and this
> function is exported in cong.h, could a future caller (for example, a
> setsockopt path accepting user-supplied algorithm choices) pass an
> out-of-range value and cause an out-of-bounds array access into
> quic_congs[]?
>
The callers will do the validation as the comment said, hopefully AI will n=
ot
flag this again.

Thanks.

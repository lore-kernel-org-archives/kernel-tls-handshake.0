Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795621940;
	b=B5mggXkcGTagiTscVr0AaChYqeEd8530gmJbxKICF7Z24C25KUk8lo4VmG7r7QbXfL6m
	 S5Zh1xdZpsQvlsAbBiKzGcNJRF4BYTvvmGR1MjqJfGFikaz3KYH9XlIoWmM+hiAIaZmrE
	 oSya0VUJLgmhda0rSrTmkv9lSNjp65k2g94/PtZQmVU5OpVQ5BnlXWYwyboiD/4s8taMp
	 MsUsGSLwQNDgANauF1odCJ+mn36uEdd+B3sqlkwd49qoGensAiE+CAPcdZGYM2P4GPR3+
	 w0TUy4oOnzb8EwKGcyTxi5G5o1cIoDRe58EjS3CLzIDQxhRmrdPfcUdbRN0euE0kxSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Wl1gc75zEow3srAWy7eV7VFmzyOiVWcKqUcpVHuYC6w=;
	b=h+RjBXwa8BqoGpo82bra8rRKgXCBw0lpTywUgkK3ShuBvkyGZh3twnzRRJTDZti6MIdL
	 FXWBaYDRXjPy5L3L3NZlJ/Ekqv1RejLNcBmEP5UB0ZxW5MNVCYXrRRvn5hqY2DMoDw6uD
	 v0UdPc7998xCk14rwkEi28xCTDINmoZrslAhsNvgaQqBP7YE0D1drFh00Znb06QyoSK5A
	 Ta04jPnfSuhMen+EbEC85y083T4Ldw3P/Psf4U78+l41T0g5ihZoJ43laSZRvofV83Rh1
	 8OR+BPNFrgeTltzKGtf+XfMZ1yHNXXPMUC5FrWA8x+u1lTxqgdAmfdJCJyDSNrZtJ3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUpuXlpO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CE4606A32A
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 25 Nov 2026 15:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71CE4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUpuXlpO
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b271e573adso2557813b3a.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 25 Nov 2026 07:52:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795621939; cv=none;
        d=google.com; s=arc-20260327;
        b=SBjVrHpgabUaklIEQjkzIa0jamVtlZfB+q2EcIz9+R02BH/CiIjBpD0mQacUnKxCNC
         f+z4474du68eCa6Cu5xP3gV0c1IV1DzG15AywHuMZu2o8KtI22C9/jAYcsCgcTKvFGjF
         8aoTM8DDdfXB8vUg2o9ZcPlhZ92mTiijh9A5hHTvmNiPvMVTLcWegi0xzBCpoJ5xmTjY
         LJK2GGnyzcB1+0V6ex2c8f/6qBKFGnXMDdmqsOi1BxhfqeVgS5Pkf1MZ0JHGOackBtDD
         0j/dR4rZcH4gGWn/Msw6fsXAMGq6HdiwOsf5iQK4CUiywVhLXzGNaZF0F2Brk08XWx9W
         GXIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wl1gc75zEow3srAWy7eV7VFmzyOiVWcKqUcpVHuYC6w=;
        fh=PgTwgF+oX0uqEcW7wEvdri2YuHMhTiZNt5kZ0O+MK08=;
        b=EFn9Jj9lGpMpqJnGGmBBCIoCYSwNY1wXG0e60POHi2Z+UjV5rK0uqX+qeCV1N4yoFT
         alSOZ/Trj4/BFyv/cvpZu7LZX1Du0iqA6EqdNZ0ykxBfVwl6z6lM0K2xbOeEhKKnT67i
         wOcCbZuOvRY+T6WqV4nEHuPvBsLMUvYZx91+rszsbVJC9zF1omny+Oqtqry9Ap1FvCgX
         OVkFD+3OoXYhViB6QApwupVbjHCQGsJj2dmgBipqxAtIPCgSo7HQt4bwaZLJ7VKBVfdJ
         uNHnl4hcMjidprCkTU7CdXm60Hwij9jZoRzreoQfgAeb76FndXm9lnmOkWmUVozbLxdb
         uk2g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795621939; x=1796226739; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wl1gc75zEow3srAWy7eV7VFmzyOiVWcKqUcpVHuYC6w=;
        b=dUpuXlpOisquLJerK3ED14Z++JZBPL0gDHKYafcd2ofaTxbVeu3uOsYDSJyVIZODYp
         P5o9w46MFnSRkK2qynH3bzz/4yoVGTJcKkd70+eN1fCQQwgjqfk9C4Hq6juix1yCQExH
         ZNm6X3BAO2rB7o3ZY+uSr5HZEY4hmQxo5ZzGVCTLCpHiJbG4nd7j2PxjaDKL6K+utwX8
         RLtmjbpD7T14OIfgWanfIMqnVW3clHdoekEoePytjKnOh97SxKLOKzaEP4Q2krwzIVJn
         HYllfwFa8iJLRpofU6PjSEagsnSn2hP0nUuNQr4DQMeXjkAZvbSlNn4mZjeCnGBTuvCn
         05oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621939; x=1796226739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wl1gc75zEow3srAWy7eV7VFmzyOiVWcKqUcpVHuYC6w=;
        b=IwhzZU0j78FyMBw+1tR+jXcGp8+MaQ26nAAjqfH6mg1tneJXInuuhf9lwyeeef8XT6
         vo5N48s+lAD4HC5ZH8fRv76iK3glFy/bcn/mts1UytfgnN2NH8HYLvo1HHV/t0ni6fU6
         SUR9wS/hhhOb2H2QsjKPKNW6eNzTUyvREA/WMD4PMTHVXMx4FaDw8HbzBzj0ypfF5bsI
         7bmg43RfshsY61n4XBqNK4ARR9iuP479OBw+/VJR3zeOWkFpxn5QIcNzp17JecKgOOIl
         pnaftEtUKKGqpl99Aq2lfj8XMAHyYeBEo0RUKn/Hh/q/hLo1qClUkTRI2maLKkQN93pM
         z44A==
X-Forwarded-Encrypted: i=1; AL+hErFIj0lmOt6kTaBp0YULLkLfxqtcvUPANIoUeJf7Pq9psmLVIem5X6rMq2SZlF1aPRnUD9LDFl2y0oL8J/q8kDCO3yPLOg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9ZcGMn9h53q3rqJmAF3jQ7fs6sUHPnX85iA2HybR5PbswUB426
	0zQknY/OJ4rEkYNrlOdyL1NI/scM0BZA7d/88K7mR9lvtPwioUcSqmSsLfopjMjUT4vXydsCSp1
	21hjEzwml418jfQhDxErQrNvEYM90/vI=
X-Gm-Gg: AZFdTZfAeToHQM3MIGJU2wyOId5vcGWv7neg13Wa1AYFL6kc0f29/nHcW/tGoNupvV6
	czVJBihaNl/G88Z434+kaHS2qEtHKselXI4KQ00rOQNTaTDtDZ/aTDRFUfzHY+r5ZRmM7UsaIdP
	S8JP9MiuQMlEHIbdhKvQ29OPIJsYJvd145zk7qQS3UJ5blCkWJpbX1GYPMZmVENJUANRDR/852X
	vkTbVsTW1uWX0QuQVDetMq3bGqd+/yEpFURAV3q2eiflINdGvwQN/FFfg/NHVkuhE9NlupJJhlL
	e+XhiI7yhtdiASKyB2J4LUTigsBD36Dsk4l1lyxlfPkXB27x2dKfGiaWTQbUzaBogieaX51QngM
	eEULU/keepYcwFQ1nmNOKCFybPW73vhEPFeOMbQEAbbdFz9fVoKtSMJzHciLGcFVPiUkVEJoOm/
	9uf6MmqGnO0jCg1WYlfqRYBG0EbNDxXrb4bTWf69aJdfO2jNt4F0kLUIyv6SsMA5L+GfgY
X-Received: by 2002:a05:6a00:1c84:b0:89d:a947:9d58 with SMTP id
 d2e1a72fcca58-8c87bfa78d6mr15873197b3a.25.1795621938615; Wed, 25 Nov 2026
 07:52:18 -0800 (PST)
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <5c305e22057f748d5c4d4cbc94a1e14271dbc485.1795393691.git.lucien.xin@gmail.com>
 <179548328755.3135.13551034983466058259@kernel.org>
In-Reply-To: <179548328755.3135.13551034983466058259@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 25 Nov 2026 10:52:07 -0500
X-Gm-Features: Aa3M54pb6nKYJidOZT5TgP5nXd3wLNCTpX3AZEaTxx4hR_vcQqSA7EC-JYn_mcw
Message-ID: <CADvbK_e4PXuzSrvuErCMQ2wPSFrvOW7-JwruzUBbLeENkKOg9w@mail.gmail.com>
Subject: Re: [PATCH net-next v19 15/15] quic: add packet parser base
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
> - [Medium] When ALPN demux is enabled, a valid ClientHello with an ALPN
>   extension longer than 128 bytes is silently dropped, so that client=E2=
=80=A6
>
> --
>
> quic: add packet parser base
>
> This patch adds RX packet parsing for QUIC. Sockets are looked up by
> connection ID and address, and Initial packets are decrypted to pull ALPN
> out of the TLS ClientHello so the right listener can be selected. It also
> adds ICMP PMTU handling, deferred packet processing, and the request sock
> and backlog infrastructure for incoming connections.
>
> > diff --git a/net/quic/packet.c b/net/quic/packet.c
> > index b6f76681b6902..919745d954403 100644
> > --- a/net/quic/packet.c
> > +++ b/net/quic/packet.c
>
> [ ... ]
>
> > +     /* Read TLS extensions length (2 bytes). */
> > +     if (!quic_get_int(&p, &len, &length, 2))
> > +             return err;
> > +     if (len > (u32)length) /* Limit len to extensions length if large=
r. */
> > +             len =3D length;
> > +     while (len >=3D 4) { /* Scan extensions for ALPN (TLS_EXT_alpn). =
*/
> > +             if (exts++ >=3D TLS_MAX_EXTENSIONS)
> > +                     return err;
> > +             if (!quic_get_int(&p, &len, &type, 2))
> > +                     break;
> > +             if (!quic_get_int(&p, &len, &length, 2))
> > +                     break;
> > +             /* Incomplete TLS extensions: skip ALPN demux. */
> > +             if (len < (u32)length)
> > +                     return 0;
> > +             if (type =3D=3D TLS_EXT_alpn) { /* Found ALPN extension. =
*/
> > +                     if (length > QUIC_ALPN_MAX_LEN)
> > +                             return err;
>
> [Severity: Medium]
>
> Is returning err the right choice in quic_packet_get_alpn() when the ALPN
> extension is longer than QUIC_ALPN_MAX_LEN (128)?
>
> RFC 7301 defines ProtocolNameList<2..2^16-1>, so a ClientHello that offer=
s
> more than 128 bytes of protocol names is still well formed.
>
> Other cases this parser cannot demux return 0 and keep the current
> listener. Those cases are a missing CRYPTO frame, a non-zero CRYPTO offse=
t
> and incomplete extensions.
>
> The caller, quic_packet_listen_process(), frees the skb on any error:
>
>         err =3D quic_packet_get_alpn(skb, &alpns);
>         if (err) {
>                 kfree_skb(skb);
>                 return err;
>         }
>
> With quic_alpn_demux_key enabled, would this drop the client's first
> Initial packet with no response? No request sock is created and nothing i=
s
> sent back. Each retransmit of the same ClientHello would be dropped the
> same way, so the handshake would time out.
>
> This path also does not increment any MIB drop counter. The decrypt
> failure path above it counts QUIC_MIB_PKT_DECDROP.
>
> Would it be more consistent to return 0 here and skip demux, as the
> function already does for the other cases it cannot demux?
>
False.

We expect to handle it by either discard it or route it to the socket with
right ALPN if there's ALPN find, instead of routing it to the incorrect
socket, besides, ALPN > QUIC_ALPN_MAX_LEN (128) is very uncommon in QUIC.

> > +                     len =3D length;
> > +                     found =3D 1;
> > +                     break;
> > +             }
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1795393690.git.lucien.xin%40gmail.com

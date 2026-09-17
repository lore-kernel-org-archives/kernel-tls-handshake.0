Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC2250EBE3
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 17 Sep 2026 13:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652304; cv=pass; b=fwgugl+Rro/TPokay9R+9azZPeVulecFmxp6a2B79c3ZnKQgY+z615aGykZ4B4Am7EyqyNc+fpJ1XvT5AsXyoERtFsyXo9RqFHZvFmfuv/kt+TW+oIPggPN1/SM2uhzlYyeRlNWQh0PuRGTDBJdphQf1067I7H/tpdJBFQv52bE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652304; c=relaxed/simple;
	bh=QNgM/kGDeBltidJ5TEbfEpxfYTzoLMWF0KKEi/Dse7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snzxOXeeCwpFS1EGgWBpC+7UXigbtQx9lhHNX6efaqn0ELvQsboovUVO/iLl8c09M1o6xYjFEsSTowArdCnhqwaBWOE8uO7szKdSXRqdJWL5EvzAfgounaBsG6u9G5VD++TOc4VLp6wkLTA+DUNIlQaoxdmLUnQ0bJKqdPB4eA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYR00vt+; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYR00vt+"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-853e2610bb4so465182b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 17 Sep 2026 06:38:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789652292; cv=none;
        d=google.com; s=arc-20260327;
        b=Lhv2dCML50Z4VceQcM0GK5xROfJb838ZqwsTQJ5si3AGiCodv3qkVpXXVWoHAMTtM1
         CLLnG6NwvwaGaY7dgKZs5kJmx9mOjIg4YYRaZmfOVFVjpnB5F0mXa3Gr5+55EQ4psTPE
         3m5GWq4oLTiQixVl3tfVB8Pe+iB+Zf85ucm4RIMDH3O6ijL0KzjPMG9LtokxuF3ixy0a
         CgjphP7VB6ztORntrw4yQ/a2PnMkW2yX4hsI7RLcubA+yh+i7vfpv6kZWKy8LBZZxHbd
         +24CQe/DLfuuV7jNwcZkPvwPsf/fGjhRS9TIb76BZlome4RAwQw6IsLkHXwgbazGoLvs
         /cvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iuO1BQZ4V2eevpIqkFGI24nl/ujAkD0tm8XPYi2iD1M=;
        fh=Smp46SePeVnYrL20oqVHfb+zk1lJQ/49qyQ09/hLPdE=;
        b=m9Gbj3OpESiaX6Qil2VP+OFIPjr54oWfyd4R/C4GaZQPvkuk9HrAiteyre1ZgoHWEM
         GZ8Dm26Ij2+ZHW7gsIApRPMA8rmlFGZySdRR5Qm9ctb82PHP0+CfH1ZAgo6nJV6zaVKo
         Dp+DZM8ipIVlC2zQvQFWAwTOKdznQ2ZjaHVo2s4Bkb7iKhkR6LapnKV80Md08zsSCOxJ
         t1hDtVwQ4omJEdVPjYQBstF3+ihHgrjVeKqopVYJdSL2VmFAwEFm2Kv+YFRSjsZOcmSB
         7Ysj5YT+JGB7bNQ+mLNIN8W9unWwCcrEh3l17SkAUvUxaOguLEJb5egYtFtKqZIJqYX8
         YXeA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789652292; x=1790257092; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iuO1BQZ4V2eevpIqkFGI24nl/ujAkD0tm8XPYi2iD1M=;
        b=sYR00vt+22yNVX2SkcVHGXwiAnO9H/TEGwJau47C3G2ZlVwW3dPY1EdCf9+iJwSQ50
         Jl97/Z4J75hTjFJlxjzjeuHo0NA+PpmrTWST9yr+9lnR9b8eBeDtXZhqDbhATNBFn356
         9Et3Kbxe/0oJ4Rum3IeVf5hwbRwYQB7N7fU3pVv0PURS3eTLOfI+uPdZk1dVNXsqOAut
         /IERrODHf3eIpz3WJjATnFd62zhiBaImcO44Hw+/Gr2Tx4GBm+d57tCRhcTSkTJ80av1
         fcO+O+x8WxztubuJvsiPGzWtMqoQ8U4TM/MQ8x06VrDIrteJMLPq9SN5b71/JC6D4X8w
         JbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789652292; x=1790257092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iuO1BQZ4V2eevpIqkFGI24nl/ujAkD0tm8XPYi2iD1M=;
        b=sEFXlBUNDydTNuBHuGY5Uz9nR2TpvqYa7pJWCZWueFgPMD9NrUNSso05+St/Ri4Ufe
         CBJRJIQGkFi9IRDPKb9ZM2kmHA2e1zQzM15axl6oLadGBXrEDoX09sNinas0CDNLZz8U
         bl+dRGNS1nzdU5i0Uv+63z8q7PMYon/utjBquUyIHJ5PpXma0XPmDh2mBhp4wEG8H8P9
         hisWt95o+1pvzNdB3+tZxFRP57ve90EdpVdAuCFAvFI+BuFkcm8/GDs5oszXuttarN8d
         +lnPN/t12h3pzRB31aLNcZ99a9wLYk4l/KYCdSjO3izBjisC5YHLiFEMyfkPoOJtyD5z
         b/jQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsXuZyaEfOVrDRoH9usvy5jCf4Nmmn2gpGQzSA4rtUYW9kLxeXZv4vJhkoYkAvObDIT30aZaMiqh9wMmUP+0qUW2/59A==@lists.linux.dev
X-Gm-Message-State: AFuF++l0vBI9HEVn6e+USCCe1RZolUctkraWzEOCo0XMfUSWbEVQ/whF
	VCC6cRnzJFS+vMRZ5IME9GbrKJqaTdWO47QRtkMwFxUjaPYlZqk4d2Gb8cidJ6qW3DYwxl+f+hG
	UOqoAhVrzcxzIsVy5VM68SFQGX4rEMcw=
X-Gm-Gg: AYBFou3GximxQQE6V7OH2a8LpDsHAB1Y2T4Yxx5ZbB9pkNViAekHjwC7L2CId23zHMu
	6rvjebZjTlCEnC/IX0lkrAk9yaTmUbaTupT+t7rWKKBZrpCdB9lK/uyLLzmKOwous5jqPk5mooQ
	MwhXNbjFMvOyfZWsVkaWxH7qJqGsNEc8pxdoUEFlBJqTQvOX9Vx7iVcehO/KPEFfLjInMf0UFkh
	TGZwwNpmkjCw3hHDZp6f+RuAcWKDe1vfiZDvFFLvcok7ygL7BXzRjYP5d5TNRCvhXH8Bfac69bm
	LkVxu04ZmYSK93Vvt3vLWzDbolbzrBnAcjdiPBAD407wAhOsADClYAPI8GHp1iMR+CqGyzGeI3K
	XXvtJCoYXaDwc7yb63VC/x+IEsoFYMEqXnngYSTrzEL06oRx0Exf2Z9g=
X-Received: by 2002:a05:6a00:c58e:10b0:874:72b6:7dac with SMTP id
 d2e1a72fcca58-87472b68104mr229753b3a.39.1789652291802; Thu, 17 Sep 2026
 06:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADvbK_dHPkHjkPwu0RepYgDsHs5reHepprRHU9hDFBxQM9_RGw@mail.gmail.com>
 <20260916234654.420056-1-kuniyu@google.com>
In-Reply-To: <20260916234654.420056-1-kuniyu@google.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 17 Sep 2026 09:38:00 -0400
X-Gm-Features: AcwNN1WyswquGpQo0eLBq8SospQls0DTN_D79sTSRdER_SDP9o7rXxWvgz7asJ4
Message-ID: <CADvbK_df5X=Szsd-d8=0gndhoBSHJhnEqSh826iYUW6=Ce_xEw@mail.gmail.com>
Subject: Re: [PATCH net-next v15 15/15] quic: add packet parser base
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: aahringo@redhat.com, alibuda@linux.alibaba.com, 
	andrew.gospodarek@broadcom.com, chuck.lever@oracle.com, daniel@haxx.se, 
	davem@davemloft.net, dhowells@redhat.com, dreibh@simula.no, 
	edumazet@google.com, hare@suse.de, hepengtao@xiaomi.com, horms@kernel.org, 
	illiliti@protonmail.com, jbaron@akamai.com, jlayton@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, kuba@kernel.org, linkinjeon@kernel.org, 
	linux-cifs@vger.kernel.org, mail@johnericson.me, marcelo.leitner@gmail.com, 
	matttbe@kernel.org, mbuhl@openbsd.org, mef@scarletmail.rutgers.edu, 
	metze@samba.org, netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, paul@jakma.org, pc@manguebit.org, quic@lists.linux.dev, 
	sd@queasysnail.net, steved@redhat.com, tfanelli@redhat.com, tom@talpey.com, 
	xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 7:46=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.co=
m> wrote:
>
> From: Xin Long <lucien.xin@gmail.com>
> Date: Wed, 16 Sep 2026 14:08:22 -0400
> > > > +struct sock *quic_listen_sock_lookup(struct sk_buff *skb, union qu=
ic_addr *sa,
> > > > +                                  union quic_addr *da, struct sock=
 *usk,
> > > > +                                  struct quic_data *alpns)
> > > > +{
> > >
> > > [ ... ]
> > >
> > > > +out:
> > > > +     if (sk && sk->sk_reuseport)
> > > > +             sk =3D reuseport_select_sock(sk, quic_addr_hash(net, =
da), skb, 1);
> > >
> > > [Severity: Medium]
> > > Should the hdr_len argument be 0 rather than 1 here?
> > >
> > > quic_udp_rcv() already did skb_pull(skb, sizeof(struct udphdr)) befor=
e
> > > quic_packet_rcv() is reached, so skb->data points at the QUIC payload=
, and
> > > reuseport_select_sock() documents hdr_len as how far the pointer must=
 advance
> > > to reach the payload.
> > >
> > > With a classic SO_ATTACH_REUSEPORT_CBPF program, run_bpf_filter() doe=
s:
> > >
> > > net/core/sock_reuseport.c:
> > >         if (unlikely(!pskb_may_pull(skb, hdr_len)))
> > >                 return -EINVAL;
> > >         ...
> > >         pskb_pull(skb, hdr_len);
> > >         ...
> > >         __skb_push(skb, hdr_len);
> > >
> > > so the filter would see the datagram starting one byte into the QUIC =
header:
> > > all its offsets are shifted and the first byte (form/fixed/type bits)=
 is
> > > invisible, which can select the wrong socket in the reuseport group.
> > >
> > > [ ... ]
> > >
> > True:
> >
> > BPF programs may need to access the QUIC header, so I will pass 0 to
> > reuseport_select_sock() to ensure the full QUIC packet is visible.
>
> Why do you use reuseport_select_sock() here ?

Because QUIC socket supports SO_REUSEPORT and allows multiple sockets
listening on the same addr/port/ALPNs:

https://github.com/lxin/quic/blob/main/modules/net/quic/socket.c#L724

The client Initial packet can select the listening socket based on the
packet's source address and port, or by a BPF program that can inspect
the QUIC packet.

Thanks.

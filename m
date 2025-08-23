Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD18C1F76A5
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 23 Aug 2025 18:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755974336; cv=none; b=PV9J3qPGBDWYX3uDQDCgVBiuVL2ng5Itn/tHUFXT+ygKcQ+oDXlisGjAdCCpdAaLMfzPXmD/WtXYgEN5wuDKv5xMq7hoqC2b3jZjfiGMHV8yy1NyXaTqhforadFKEPkAlmhBQXnOlLAQSdd+Oy97bhSz7mg4Eo14eoS28saXsy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755974336; c=relaxed/simple;
	bh=oDVXvpiKxpr3c0kqrtTAXtEiqo4KWRDKicFiwWIhotI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJCHWhb0gknPvdJVjp8Fre/+kzFpU+58sHR37ro7RqAhizai+GLhHNl6uiCY8VebbBs686uAHAkWrzsCrp6UKHYhX9WsV4DpaKfrbX/W1FSywcd0f+qzKVJZV/7vlSIpewyu8c0OAYOP7N3kjAsF8H24KYGv31owjUsFBgIpdR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d67qQPC7; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d67qQPC7"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3eb6da24859so2548445ab.3
        for <kernel-tls-handshake@lists.linux.dev>; Sat, 23 Aug 2025 11:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755974333; x=1756579133; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jUIUF6ZY6U8MjwBCMuchcHLJGd676CBVlVvwermg10=;
        b=d67qQPC7G9yBSvavFoLHZiElw8TPxdObvSrRFf1bn5+8lt0m48po0HPPn+G/HloTef
         KYguPVzYGgTNjhzcx+Q9X9hGcX39muKHq5t8KY5V/fxoGevBaMx13I3Ua+Dyc8AJRAxf
         zjWewoDswQ+B/DlWOMbKn912mNd7xpMvblj4XRWnCYLYB9xqlC8J2z75RFPE4WVLXUVg
         DVjDstG2YgG4Wlf/XckJWjABOXZaQpGKHaLIItVEmaXWhXdqDQPMgGBJ8Z68ycSFkp5B
         nl/lgoa7PgFohg2jUc3T2RWUPgoszG6p+g/8gMo4p+bJg3qCSJz7ALveOtKUiBeq9KJQ
         Prbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755974333; x=1756579133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jUIUF6ZY6U8MjwBCMuchcHLJGd676CBVlVvwermg10=;
        b=ciaOSXmnhLuK1TJfXdqijNXphSMQyMgyuRj10DrsbKSY+QFmA9BH2Xgmbtw5hcqNBu
         WS/WwLhxLZPaMDbThiCaEQZeGFaNxLj52yLyfXuESUFDagVMxCVBHn9/f7UY09G/+Sc1
         76WMrhd/bwms5bhtjXMkLiOuB95v1c6N9y9t6Lq/mnk7OUfAimM6ZbQGf7Cn7T2YVOa5
         2rcc3Smg65nPYgKjEIN3pyh28Tp+bedykDDTsRrXyQVWcEPnuVsl8+FLVUA67rWkVDLT
         LEx0uDfszZfTlqV01PmABXHUZiTPmpYrvLleJyw2s2CHluAC03NaDj/tNNNsYorIUb0D
         Gr0w==
X-Forwarded-Encrypted: i=1; AJvYcCUPKQapXXCPeywySWXqnAjoiL7eDOzvj71FBsHygI5fGdP367ctQL1ft/HlNaQczYtwK1u3980OperkaUzNrNLJn0ifRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRcWrFQJTKADhEE1ycPWcMfVPNb8kEZkhWRLMUhcWLmUXSZuqA
	u1NIf/H/tFgYVFNgGRXXI80aJbokOLeK6lfl5VwG4yFbLnSz6TsvGERCN82FGo+ErfmbD/hn8H/
	RtHroQYyq58bre8ncd/JlBPfqH7jvcuE=
X-Gm-Gg: ASbGncuLA2ZNNv9QubkyqJXzK5MnuCaM+cvlihw40RcSXmQVqpNhU+zJKlvroq+LQ08
	gfhMXiFaa+5fYReKE4amjHidYYdgzCmFhgUwrD3IlDFLaOpfbyTSddU9sHWZbtTlpQ267LLGSoY
	VOK9CXNQIr3NrUdkFTAQlQwgGqLcdsA4bktVsPJtCD7VlgKy9MUzxm4PK1pdAnKkvTh2BYZloEU
	E81/3kRIQ==
X-Google-Smtp-Source: AGHT+IHjqCRqA5bCUScez5a0pAsH33Kb+WtLn6JdoplwFwpk8wVaOFWIXmhQcq/pIGPV6GcDpv3H4C8jNquyCWCSAcI=
X-Received: by 2002:a05:6e02:1a86:b0:3eb:b611:2d0d with SMTP id
 e9e14a558f8ab-3ebb61130fcmr6651985ab.10.1755974332802; Sat, 23 Aug 2025
 11:38:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1755525878.git.lucien.xin@gmail.com> <0456736751c8beb50a089368d8adb71ecccb32b1.1755525878.git.lucien.xin@gmail.com>
 <ec99ef48-c805-4ce8-99d5-dcf254f6e189@redhat.com>
In-Reply-To: <ec99ef48-c805-4ce8-99d5-dcf254f6e189@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Sat, 23 Aug 2025 14:38:41 -0400
X-Gm-Features: Ac12FXzw8WAlfIH_Sg1ayu84V-ToxTSjwW2bXEf5ZWX563u_u__-ehR5B6Rhpm4
Message-ID: <CADvbK_d+BqJdwDW1ngX4qh_dySQQcLuO5oEZKEFmNzm=P9NPeA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 02/15] net: build socket infrastructure for
 QUIC protocol
To: Paolo Abeni <pabeni@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, davem@davemloft.net, kuba@kernel.org, 
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Benjamin Coddington <bcodding@redhat.com>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 7:17=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 8/18/25 4:04 PM, Xin Long wrote:
> > diff --git a/net/Makefile b/net/Makefile
> > index aac960c41db6..7c6de28e9aa5 100644
> > --- a/net/Makefile
> > +++ b/net/Makefile
> > @@ -42,6 +42,7 @@ obj-$(CONFIG_PHONET)                +=3D phonet/
> >  ifneq ($(CONFIG_VLAN_8021Q),)
> >  obj-y                                +=3D 8021q/
> >  endif
> > +obj-$(CONFIG_IP_QUIC)                +=3D quic/
> >  obj-$(CONFIG_IP_SCTP)                +=3D sctp/
> >  obj-$(CONFIG_RDS)            +=3D rds/
> >  obj-$(CONFIG_WIRELESS)               +=3D wireless/
> > diff --git a/net/quic/Kconfig b/net/quic/Kconfig
> > new file mode 100644
> > index 000000000000..b64fa398750e
> > --- /dev/null
> > +++ b/net/quic/Kconfig
> > @@ -0,0 +1,35 @@
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +#
> > +# QUIC configuration
> > +#
> > +
> > +menuconfig IP_QUIC
> > +     tristate "QUIC: A UDP-Based Multiplexed and Secure Transport (Exp=
erimental)"
> > +     depends on INET
> > +     depends on IPV6
>
> What if IPV6=3Dm ?
I think 'depends on IPV6' will include IPV6=3Dm.

>
> > +     select CRYPTO
> > +     select CRYPTO_HMAC
> > +     select CRYPTO_HKDF
> > +     select CRYPTO_AES
> > +     select CRYPTO_GCM
> > +     select CRYPTO_CCM
> > +     select CRYPTO_CHACHA20POLY1305
> > +     select NET_UDP_TUNNEL
>
> Possibly:
>         default n
I missed that..

>
> ?
> [...]
> > +static int quic_init_sock(struct sock *sk)
> > +{
> > +     sk->sk_destruct =3D inet_sock_destruct;
> > +     sk->sk_write_space =3D quic_write_space;
> > +     sock_set_flag(sk, SOCK_USE_WRITE_QUEUE);
> > +
> > +     WRITE_ONCE(sk->sk_sndbuf, READ_ONCE(sysctl_quic_wmem[1]));
> > +     WRITE_ONCE(sk->sk_rcvbuf, READ_ONCE(sysctl_quic_rmem[1]));
> > +
> > +     local_bh_disable();
>
> Why?
Good catch, there was a quic_put_port() before, and I forgot to
delete local_bh_disable()f while removing quic_put_port().

>
> > +     sk_sockets_allocated_inc(sk);
> > +     sock_prot_inuse_add(sock_net(sk), sk->sk_prot, 1);
> > +     local_bh_enable();
> > +
> > +     return 0;
> > +}
> > +
> > +static void quic_destroy_sock(struct sock *sk)
> > +{
> > +     local_bh_disable();
>
> Same question :)
>
> [...]
> > +static int quic_disconnect(struct sock *sk, int flags)
> > +{
> > +     quic_set_state(sk, QUIC_SS_CLOSED); /* for a listen socket only *=
/
> > +     return 0;
> > +}
>
> disconnect() primary use-case is creating a lot of syzkaller reports.
> Since there should be no legacy/backward compatibility issue, I suggest
> considering a simple implementation always failing.
>
OK. This means shutdown(listensk) won't work.

Thanks Paolo for all the helpful feedback!

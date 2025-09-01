Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249AE1E868
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  1 Sep 2025 21:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756763225; cv=none; b=PovvZ9kkk2Pl/LDz+WDnJuMSze7h60gni+BLDPU+nuKrk7UW4iELifN3bH4va4OSiCHZkAz6vnc6gIU6KMBDGf3U3sucZkbtiBQJaVPaVhhwNfebAAMJ4E4VScqv/tsRr3olFPlUgDpIsJECc41RXc/OY+PAiQbFNoRYV4jZLmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756763225; c=relaxed/simple;
	bh=+NY02T3EKXc/p3Ldv7PZSvRzUT4MNdBvJAIeMcl80GM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HxI4oLiNPBa0NOj08S2xIsgAGgpMcb6+lC23vXLcArtFDGnapb1b5Lw5nwt7nVtAL8TAAVAIJhO4dsgM9RLXH7zyxHUXvurEvdw9TLMzfR3j0GKM/KmbNNe+3KwkFqQ2cFxlg8d8fqtwpWPz633msZaA0Sqq1XbqQGYpufQMtII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUUf3YHF; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUUf3YHF"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24abf0215e8so14001945ad.1
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 01 Sep 2025 14:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756763223; x=1757368023; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OlsE2WeMOlyP3bzmlKQubQNSIzHK7RKjbs8UIIIjOHk=;
        b=PUUf3YHFCISWl4d+uT0j94eZFLoVPfkQ18NippzBdXQhE2NSsSTDe2eEq0IUdj5O5/
         1ZVe5Du96t5RxLCe4E3oZPq/CDoNZ7UPHpI+oXYzGtvyVBohqLdnhivzW2N77HNrE0Fb
         MNMk+p8IMxLI8+0Ju4K0kC2SjLtQtp+/yGXvVMMlv+1RAfGBBJWehDASllOfsOzSf4Fr
         QVsx4GqXqKWhwBo42UDSP5hUnemOneIm4TwBgEbijVjm6MS0/MxfjMaqVSZoGOP+sxm+
         PMnOOAHVHOC3qA2c5dwhatwjxvnr3WuLA1GRb8ihg11EfBbBoC/PoKmzCHYkUF0RhPZH
         YIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756763223; x=1757368023;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OlsE2WeMOlyP3bzmlKQubQNSIzHK7RKjbs8UIIIjOHk=;
        b=dtpr1wURwigDpBD5bJb+U5Xi27A59AHc1EPaCi4JCeX02tjn8wQhFauFQSJWgzKKNC
         VJgMoYhgEgspz6MuZ16AvAxzp8nu2q5CR1GeiGE/ZmPNUFF2Nthn7qO4kbdvTO3mqovR
         8sCpBkgaU1oy9SpsZDsI0jc4XGTZnZwhy/aIcP/ljvOfXWKkw3eBDx+TOWShu1/7tl3V
         BYGQKjbZv6CK8Rnp6UhbheYyGKch+RdAYxvpqgpHiMToaQ1J3lg0HDKiQ1/95JExI/zZ
         NCS4fCjBgK+LgaeQrDrpvLs18zfvKmJfVFKdXN0IhRWzT0/I7W4/AHxlZQmp2S5jq6hQ
         qA8g==
X-Forwarded-Encrypted: i=1; AJvYcCWAvPGam+ju1N6SKvRvOypTeC/lghebozSARe1vIPKdG0I8g4IrZMIt44ixMA6jflKNHoji/UIGcykOOzOygwEnGS3rtw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfcM77V8oJtRJFOeCp9Dyz7kY56Jz204VOapPUHuyCKahAU2qo
	oPv1n9MhRjvYCT7XW2mcA96RWKqERux7DD4SKiH9RoTNXP/KVIKej8J7
X-Gm-Gg: ASbGncsUIrOS3qwrr7yfiqQLByQCKKpFGXaqoiYUwjBuLHYV7SUPVfhhLZjcaB4JJZ+
	Q5E3MUHkTt5vfilbyMuJWX3+mpSF2v8uv7FptQbCW/5z1FNu/rNtP2Z12G6653HNR2Wbhk5qzwP
	jfx6dKOrbiJ3MSJffzJKntf/8EnoRGsBhy8vbORMg+fqEO1QiK8sDrIy+rlEUmFOMv+lNG6KzqP
	vF8xjJt/WeO0RQgREE1gsiX7w/lo57xb8kshyRCpVMxTzvKF10qAqLmLMkS6HyXeYuzLPw5XCe2
	MtOLUMfPwNfQaKPULqw+6UznUtUT73kyGYXGbrVmASoypwzr80aCefa+kR/DCdX7COfWETh+RCt
	3sCd9HquZ0V5b1a81SzqGyXGmctfXNQhJdII+ORsh4iSFgX4=
X-Google-Smtp-Source: AGHT+IGJ+VbL+KkwAJkiu3byzjAamHyXWU/kRNAZj/DaRKztP3TxkmdmFFWUola7Qz5AGr90A4KQ/Q==
X-Received: by 2002:a17:902:f608:b0:24a:ad42:3559 with SMTP id d9443c01a7336-24aad4237ddmr89121605ad.56.1756763223308;
        Mon, 01 Sep 2025 14:47:03 -0700 (PDT)
Received: from [192.168.0.69] ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490373a3a9sm112563485ad.50.2025.09.01.14.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 14:47:02 -0700 (PDT)
Message-ID: <7d71d5d3c708451372d2cd0580951997ccc4b883.camel@gmail.com>
Subject: Re: [PATCH] net/tls: allow limiting maximum record size
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: chuck.lever@oracle.com, kernel-tls-handshake@lists.linux.dev, "David S .
 Miller" <davem@davemloft.net>, donald.hunter@gmail.com,
 edumazet@google.com, hare@kernel.org,  Jakub Kicinski	 <kuba@kernel.org>,
 john.fastabend@gmail.com, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, Hannes Reinecke <hare@suse.de>
Date: Tue, 02 Sep 2025 07:46:55 +1000
In-Reply-To: <20250901164355.GM15473@horms.kernel.org>
References: <20250901053618.103198-2-wilfred.opensource@gmail.com>
	 <20250901164355.GM15473@horms.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2025-09-01 at 17:44 +0100, Simon Horman wrote:
>=20
[snip]
>=20
> > diff --git a/Documentation/netlink/specs/handshake.yaml
> > b/Documentation/netlink/specs/handshake.yaml
> > index 95c3fade7a8d..0dbe5d0c8507 100644
> > --- a/Documentation/netlink/specs/handshake.yaml
> > +++ b/Documentation/netlink/specs/handshake.yaml
> > @@ -87,6 +87,9 @@ attribute-sets:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name: remote-auth
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type: u32
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 multi-attr: true
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name: record-si=
ze-limit
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type: u32
>=20
> nit: This indentation is not consistent with the existing spec.
>=20
> > =C2=A0
> > =C2=A0operations:
> > =C2=A0=C2=A0 list:
>=20
> And I believe you are missing the following hunk:
>=20
> @@ -126,6 +126,7 @@ operations:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
- status
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
- sockfd
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
- remote-auth
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - rec=
ord-size-limit
>=20
> =C2=A0mcast-groups:
> =C2=A0=C2=A0 list:
>=20
> ...
Ah good catch thanks!
>=20
> > diff --git a/net/handshake/genl.c b/net/handshake/genl.c
> > index f55d14d7b726..fb8962ae7131 100644
> > --- a/net/handshake/genl.c
> > +++ b/net/handshake/genl.c
> > @@ -16,10 +16,11 @@ static const struct nla_policy
> > handshake_accept_nl_policy[HANDSHAKE_A_ACCEPT_HAN
> > =C2=A0};
> > =C2=A0
> > =C2=A0/* HANDSHAKE_CMD_DONE - do */
> > -static const struct nla_policy
> > handshake_done_nl_policy[HANDSHAKE_A_DONE_REMOTE_AUTH + 1] =3D {
> > +static const struct nla_policy
> > handshake_done_nl_policy[__HANDSHAKE_A_DONE_MAX] =3D {
>=20
> Although it's necessary to update this file in patches,
> it is automatically generated using: make -C tools/net/ynl/
>=20
> Accordingly, although the meaning is the same, the line above should
> be:
>=20
> static const struct nla_policy
> handshake_done_nl_policy[HANDSHAKE_A_DONE_RECORD_SIZE_LIMIT + 1] =3D {
>=20
> > =C2=A0	[HANDSHAKE_A_DONE_STATUS] =3D { .type =3D NLA_U32, },
> > =C2=A0	[HANDSHAKE_A_DONE_SOCKFD] =3D { .type =3D NLA_S32, },
> > =C2=A0	[HANDSHAKE_A_DONE_REMOTE_AUTH] =3D { .type =3D NLA_U32, },
> > +	[HANDSHAKE_A_DONE_RECORD_SIZE_LIMIT] =3D { .type =3D NLA_U32,
> > },
> > =C2=A0};
> > =C2=A0
> > =C2=A0/* Ops table for handshake */
> > @@ -35,7 +36,7 @@ static const struct genl_split_ops
> > handshake_nl_ops[] =3D {
> > =C2=A0		.cmd		=3D HANDSHAKE_CMD_DONE,
> > =C2=A0		.doit		=3D handshake_nl_done_doit,
> > =C2=A0		.policy		=3D
> > handshake_done_nl_policy,
> > -		.maxattr	=3D HANDSHAKE_A_DONE_REMOTE_AUTH,
> > +		.maxattr	=3D HANDSHAKE_A_DONE_MAX,
>=20
> And this one should be:
>=20
> 		.maxattr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D
> HANDSHAKE_A_DONE_RECORD_SIZE_LIMIT,
>=20
> > =C2=A0		.flags		=3D GENL_CMD_CAP_DO,
> > =C2=A0	},
> > =C2=A0};
Okay did not know I could "make -C tools/net/ynl/" to generate this.
Will use that going forward. Thanks for the feedback!

Regards,
Wilfred


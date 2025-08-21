Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C4E253B64
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 21 Aug 2025 06:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755757118; cv=none; b=KvkuHMDWTvsG3CQ6KOlr1+REf0L2rgeXtTqT/mTIDpA4vRrudia79KiqZGX49TUYlhp0dUh+bM+6yNLBBNV7M7ckPM/vV9UV7fSA0QqpoHs1fjQdfoKNTi4KGSC6Cjdl6S/U0WnXNsakm7ZUleWMKcafE9FIs5quux3SZSeqAXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755757118; c=relaxed/simple;
	bh=Bi1fwnl9yUGn7Fca+mMWIkXWwgXtyoTjKasK8Wa5i+U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GBCjs2WiewHjXSZyWhn235fHlQycvpDTBLqpxtwgTNtQ5QI6GaClqkzkKjvoIuzAuOEEYS2ML96j585n0g/RKsURgrcNP+9m7qlUW9rRM6Q7rpOLtRUAkTHu9mcMOwpCZ+sJYBbsGKMJYr/emeMtF73HrQkCPWnC+eQQikU7Y8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEd899Dz; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEd899Dz"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76e93370ab8so699954b3a.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 20 Aug 2025 23:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755757114; x=1756361914; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zztoWmaSBvqb0v836T63J5CDKtmGeRpJXnzAG/6LZ58=;
        b=FEd899DzlTB4bJbCYbIhhO9s/dM8VLKb4AW1nxlLOQPv+3Dl8/1GZX4YvW52ChDxO8
         VT+t2wL/THMbCqgugpqiz9r6FmOvP78IKy9/JsLpMXU0ZRjPBmQbzUgjvqsqJMYWCorM
         fLi9vjum1lmpwNW7BlL00AMdPMU6Zb2DEMNnmWK100wCfw7jyJDVC6fzS3ZtngnZEGzB
         fdX5sNUjyyTNEeSVP3WbW1e/2/ER/lB5mdt22EBUD3mhEcjjbkojLwYM3L00ApsMzYyl
         2MMMMtPLvmvpiKlj3kr7+Wq+pwdFKNB47L3T9vh7IiQmD+/CVKm8Y6D7ECKr0l6TAvy6
         /Z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755757114; x=1756361914;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zztoWmaSBvqb0v836T63J5CDKtmGeRpJXnzAG/6LZ58=;
        b=Zlg3Ds38k1vtPw6CaSiPKW+FtJsaa9vRD2+hpQDp085WWxB8Q9BuMGV2zEIlFB7ozA
         nmmrMrbpZQxFEYNy6ql2yUnky6g90bW8gcpY9eeD+5EzXXEXNlNNNudrOjhE2eGVp1Di
         lP6qCFhu6lKOQcJesZ7Y6ROcGtFhaFnSDONMyjdhgmwBroqN3oYGyeQxHmuVriUOKCTv
         0/h10JTQ1TsGZTsHt+GwynkQtPDqOOQxgZG8PV9soYDakh9zS5AJ36sMzneXqXjMr7dO
         V/K9uYtGeJBacmyDOPQC6wp9O+A3mFgklpXoPef5CHstYlRcDLAXk6cizyfyUxaJ2l19
         /1WA==
X-Forwarded-Encrypted: i=1; AJvYcCV4eU6GdIxDHUvZZFzHo8rnABfKDB2tc51/loBK1Eg4x8Pbw8a3PG1zamTyR5bS5ohz//Isv7M6iT2Eh3QXSOA52GJZJg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyXR4m6rXiKuKyBLoSzZ7VoHRxWUzql0lAbZUIjHdsqJPALaTD
	mPYk0XYhyBPzguJ8m22WpKduaktEU4++VNUc5um+nXm/YG+gSTw8jDt9
X-Gm-Gg: ASbGncun0GWWowVVu9G1/9Nxi1gl9ktLsHEzaorG1Ar9ptBDmXdrQrKZiPcUOWmV6k2
	8R4kAhUaaCoXA0bnzxJp+WgE3fwH6wy8ZGqDlZYN3mwdIt0yPE0cCg7FADZ7FRlXMfueE3Q8O4P
	8efUaX541RzmqHJMFLnGDeJGCjLe/tK7Tgvq9u4WhG5hq6IQU5ZYo0+LGvB1EZqphZoKHGvJ4TF
	GzBzgzllr6eY26TPW8gakpE+Ec8x2wVPNoCy9EtUz+VeXZ7RmrpHYdJArgTNJnWx4SfZ0ZbbtLt
	bzvTbeXo9VpRqqa/JIdGE8ugfoKquDq4sbyllJBteX/DSyfZbw0Q8F1IRodPdY4gsq3PXrlkocv
	I4mHo/FzKgJvVOwSkw1fYjQn6lEikANUWJd6q
X-Google-Smtp-Source: AGHT+IGs7MFSfbXvQy8Flp3Dq70Rfkp04rNwWT4c3+yfMUrn/wBHUprehQHinYmoPC+kH7sQIVsbmg==
X-Received: by 2002:a05:6a20:2586:b0:240:cd6:a91e with SMTP id adf61e73a8af0-2433089f7cfmr1826634637.20.1755757113567;
        Wed, 20 Aug 2025 23:18:33 -0700 (PDT)
Received: from [192.168.0.69] ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fba4cesm3900670a12.9.2025.08.20.23.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 23:18:33 -0700 (PDT)
Message-ID: <90cc9b71e356a94e593b66614bbb28a542ca204c.camel@gmail.com>
Subject: Re: [RFC v2 1/1] net/tls: allow limiting maximum record size
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Hannes Reinecke <hare@suse.de>, chuck.lever@oracle.com,
 davem@davemloft.net, 	edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, donald.hunter@gmail.com, 	borisp@nvidia.com,
 john.fastabend@gmail.com
Cc: alistair.francis@wdc.com, dlemoal@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 21 Aug 2025 16:18:25 +1000
In-Reply-To: <a9ea0abf-1f11-4760-80b8-6a688e020093@suse.de>
References: <20250808072358.254478-3-wilfred.opensource@gmail.com>
	 <20250808072358.254478-5-wilfred.opensource@gmail.com>
	 <a9ea0abf-1f11-4760-80b8-6a688e020093@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2025-08-18 at 08:31 +0200, Hannes Reinecke wrote:
>=20
[snip]
> > --- a/include/uapi/linux/handshake.h
> > +++ b/include/uapi/linux/handshake.h
> > @@ -54,6 +54,7 @@ enum {
> > =C2=A0=C2=A0	HANDSHAKE_A_DONE_STATUS =3D 1,
> > =C2=A0=C2=A0	HANDSHAKE_A_DONE_SOCKFD,
> > =C2=A0=C2=A0	HANDSHAKE_A_DONE_REMOTE_AUTH,
> > +	HANDSHAKE_A_DONE_RECORD_SIZE_LIMIT,
> > =C2=A0=20
> > =C2=A0=C2=A0	__HANDSHAKE_A_DONE_MAX,
> > =C2=A0=C2=A0	HANDSHAKE_A_DONE_MAX =3D (__HANDSHAKE_A_DONE_MAX - 1)
> > diff --git a/net/handshake/genl.c b/net/handshake/genl.c
> > index f55d14d7b726..44c43ce18361 100644
> > --- a/net/handshake/genl.c
> > +++ b/net/handshake/genl.c
> > @@ -16,10 +16,11 @@ static const struct nla_policy
> > handshake_accept_nl_policy[HANDSHAKE_A_ACCEPT_HAN
> > =C2=A0 };
> > =C2=A0=20
> > =C2=A0 /* HANDSHAKE_CMD_DONE - do */
> > -static const struct nla_policy
> > handshake_done_nl_policy[HANDSHAKE_A_DONE_REMOTE_AUTH + 1] =3D {
> > +static const struct nla_policy
> > handshake_done_nl_policy[HANDSHAKE_A_DONE_RECORD_SIZE_LIMIT + 1] =3D
> > {
>=20
Hey Hannes,

I did consider using HANDSHAKE_A_DONE_MAX, but wasn't sure if the
existing convention is there for some reason. But I can switch over if
you think that is best.

> Shouldn't that be 'HANDSHAKE_A_DONE_MAX'?
>=20
> > =C2=A0=C2=A0	[HANDSHAKE_A_DONE_STATUS] =3D { .type =3D NLA_U32, },
> > =C2=A0=C2=A0	[HANDSHAKE_A_DONE_SOCKFD] =3D { .type =3D NLA_S32, },
> > =C2=A0=C2=A0	[HANDSHAKE_A_DONE_REMOTE_AUTH] =3D { .type =3D NLA_U32, },
> > +	[HANDSHAKE_A_DONE_RECORD_SIZE_LIMIT] =3D { .type =3D NLA_U32,
> > },
> > =C2=A0 };
> > =C2=A0=20
> > =C2=A0 /* Ops table for handshake */
> > @@ -35,7 +36,7 @@ static const struct genl_split_ops
> > handshake_nl_ops[] =3D {
> > =C2=A0=C2=A0		.cmd		=3D HANDSHAKE_CMD_DONE,
> > =C2=A0=C2=A0		.doit		=3D handshake_nl_done_doit,
> > =C2=A0=C2=A0		.policy		=3D
> > handshake_done_nl_policy,
> > -		.maxattr	=3D HANDSHAKE_A_DONE_REMOTE_AUTH,
> > +		.maxattr	=3D
> > HANDSHAKE_A_DONE_RECORD_SIZE_LIMIT,
>=20
> HANDSHAKE_A_DONE_MAX - 1?

Shouldn't it be `HANDSHAKE_A_DONE_MAX`? Unless the existing
`HANDSHAKE_A_DONE_REMOTE_AUTH` is incorrect?

Thanks for the review!

Regards,
Wilfred
>=20

Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DD17E9
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  7 Aug 2025 00:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754525083; cv=none; b=dicgFdcHb6ukJKHsPV39b93c4XEeB3zttED0LCVI26JTV/ztCIjxPQ1cNSdS6veaKUpTVpnerLHfQBglL5+hUr8fwPL61avxKhITHZD1mYEQErj4VKVL4OWKdPusAIYBy4PwlX9XLG6meZoagBvgukUeC8m8R1905mOg3FOEisM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754525083; c=relaxed/simple;
	bh=rWSJADiT5YFucAiGDF6MjM9ePHCHYf61hCJW+WuXhyE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UCo3sWeiXD1LOxEtjN5p3D+UdBgr04Z7tnrbci566JHPGsKria8pIZDbAv5NqRW3HffYptp08RUuMhM0zOmxkxkUTtFOLo7RFkpuARFud9kxx0sVA8X4yOokHvUyFrrrLS0sVeSRNF1PzJzpqlCHT6HapeTMct8lEhMEixRuZ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaTcU4u8; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaTcU4u8"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-31ec651c2a1so444189a91.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 06 Aug 2025 17:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754525082; x=1755129882; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K/A9C8/bVgIC1L6UfQS08Wm98G+tK+gmaXMJoj3JOjM=;
        b=aaTcU4u8ox5/HTZYFAuwzvIlZPV+oTPpsZnSeUMh1g6iRDJ9ju+/pyzqpggtuKVRqn
         EMqybAqY0GblPaGYH5JpI4DuNgQM0JmA4ZrXWY383l3xdM9610odN+6Hbn986dCd3f+W
         Rd2upL6eu3BkC0iT//H+LoaHFWiNTVDdXmNJUvWTw2pCV7ey3FCktKJ3cPPoWy6KFWYL
         5JxlHUUj67zTMFkNYYyUucpOjxUe1NxMWFNqv/ryK3DZB6ja197Tpbjux0aXO4fQBycg
         t2WzwtpBOR7f8z7cH7QEAR7TlaTnG/J1rtPxqLkLS0p52eyYBOAZmMulLMsON5AM88k/
         a/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754525082; x=1755129882;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K/A9C8/bVgIC1L6UfQS08Wm98G+tK+gmaXMJoj3JOjM=;
        b=gVlcdMG8mQ5Th1Mp+4D1tvvc0SyXrV9gNoLcOC3Tc3Gx+zjdnchhWEZVBY5SXL7Djc
         ARyd+mSjoFRf9rqBTHfVAeWekQaHtIc4TOILIkuGn8fl5OF2wrv5x6XtGEdPFyeK0mQD
         lx9C6FTxb17u84lLZ+0k3sjuCEZ4yiRCsVHkJacQXUtdSMvM9N6HpB5jdNOcj/qYzSFH
         66PxMKHD/DyTRoBqV3H6VakHzDaCvMGkEmf1GSE1I37dxK80oDsyFwRkoeLs0OpVOfrp
         5JdMu23rYeT68wSJgZlKQNmRzl5tfg8huJDG9sntNx5+v1e1j0SdTvAb2QkXkbbeDU+N
         j8ug==
X-Forwarded-Encrypted: i=1; AJvYcCV8GwwiK4psK9oWjUFwEZM0FwX8jAncPOQGOxdgfNfp5AewOXrN1DJISJwjTK0EUzouQPmSjMGjdzpftoCE0xqgSwKjKw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5RYoWK6IxyTxoMottiRyrHumxbppmuQfzeVefKkcvzR5Y8rPx
	hv0h64XLgHwJ8RhYOOqbOFtU8vbHvo/pEufLtZewRCZt50Ygh37DEClJ
X-Gm-Gg: ASbGnctNsH1LMUAPFRE8NDdwSgXx5ITW2ScggIQ9olRKtJVHcNt5JseE5KWUnPV4RIS
	nla36U7J0eARsXYlXA1XPvtIX4gbV+Ao429/A1JJ3gxTpQlz5ohzSUaPjdWXqU/2hAxmbcI0bu6
	Fnl7nZdrCEka9ZXmlJci6w6OBA4AKbgie8EIz2Tlwl5zOHPZbICJNBr1OMtbkbdydUWc8LS/Ucn
	r6CgE+K5JmLcSNlNZn2qvILiPiz8m39qB/k+ExGzXupfuNFP8X617sFg1B+/sxIgS8RWWKl3nyE
	mLFb+GtFNJ4xyCgmCvR30pjRhQYQq4ThJtSN7+sR2YmnACMqLD/NRFKsKSYd9hvs3BNRPpydVPB
	32dUW6DRdYvQe0DPzpfm1cwSrB/tDFjx7tP5XVjS3vZ6iCYA=
X-Google-Smtp-Source: AGHT+IE8yf3mW+Zix4aWhzoVPQkRdDv26V46vDKBnE4qstNKDwz/t8jIdzc+kq2t00duIY4+nurXzw==
X-Received: by 2002:a17:90b:2d87:b0:313:f6fa:5bb5 with SMTP id 98e67ed59e1d1-3216752304fmr6652697a91.18.1754525081598;
        Wed, 06 Aug 2025 17:04:41 -0700 (PDT)
Received: from [192.168.0.69] ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32102a5be52sm10378051a91.1.2025.08.06.17.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 17:04:41 -0700 (PDT)
Message-ID: <aa5680f2974cb18e4a7d40266a85727ef43377c4.camel@gmail.com>
Subject: Re: [RFC 2/4] net/tls/tls_sw: use the record size limit specified
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, alistair.francis@wdc.com, 
	chuck.lever@oracle.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, 	pabeni@redhat.com, horms@kernel.org,
 donald.hunter@gmail.com, corbet@lwn.net, 	kbusch@kernel.org,
 axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	borisp@nvidia.com, john.fastabend@gmail.com, jlayton@kernel.org,
 neil@brown.name, 	okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com,
 trondmy@kernel.org, 	anna@kernel.org, kernel-tls-handshake@lists.linux.dev,
 netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org
Date: Thu, 07 Aug 2025 10:04:30 +1000
In-Reply-To: <8ce2c9ce-9636-4888-8d63-2169441addcb@kernel.org>
References: <20250729024150.222513-2-wilfred.opensource@gmail.com>
	 <20250729024150.222513-5-wilfred.opensource@gmail.com>
	 <8ce2c9ce-9636-4888-8d63-2169441addcb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2025-07-29 at 17:13 +0900, Damien Le Moal wrote:
> On 7/29/25 11:41, Wilfred Mallawa wrote:
> > From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> >=20
> > Currently, for tls_sw, the kernel uses the default 16K
> > TLS_MAX_PAYLOAD_SIZE for records. However, if an endpoint has
> > specified
> > a record size much lower than that, it is currently not respected.
>=20
> Remove "much". Lower is lower and we have to respect it, even if it
> is 1B.
>=20
> > This patch adds support to using the record size limit specified by
> > an
> > endpoint if it has been set.
>=20
> s/to using/for using
>=20
> >=20
> > Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>=20
> > @@ -1045,6 +1046,13 @@ static int tls_sw_sendmsg_locked(struct sock
> > *sk, struct msghdr *msg,
> > =C2=A0		}
> > =C2=A0	}
> > =C2=A0
> > +	if (tls_ctx->tls_record_size_limit > 0) {
> > +		tls_record_size_limit =3D min(tls_ctx-
> > >tls_record_size_limit,
> > +					=C2=A0=C2=A0=C2=A0 TLS_MAX_PAYLOAD_SIZE);
> > +	} else {
> > +		tls_record_size_limit =3D TLS_MAX_PAYLOAD_SIZE;
> > +	}
>=20
> You can simplify this with:
>=20
> 	tls_record_size_limit =3D
> 		min_not_zero(tls_ctx->tls_record_size_limit,
> 			=C2=A0=C2=A0=C2=A0=C2=A0 TLS_MAX_PAYLOAD_SIZE);
>=20
Hey Damien,

Thanks for the feedback! Will amend for V2.

Regards,
Wilfred
>=20
>=20

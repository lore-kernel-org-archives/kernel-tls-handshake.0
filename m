Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B64538B
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  7 Aug 2025 00:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754525009; cv=none; b=R5Od/fvr4MWjiJcU0g1f5YfAdxOCSCKpfqMDvOiXMxW81+gVco5rCXsilIPWECX7VSfZdUPyFbjJVmuwr3k28+tJxZNO5YCy5JDR0fNZsRGcylAKLDxYlaqiuOqCYfi7T3IctM9x8RtRsEqATl2svhyiVl4WAD5wctu6FVhtnZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754525009; c=relaxed/simple;
	bh=tDY9PLdL7KzBuSVPjaxM+AXpLClNtgGmFkXweb/RZUk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CxC6KDz0lHEmAqdT72Q3aJHpNB+15vqwVi2XB7RvI0QrGJS5R7F+i3vNU4NDH0suiFScwdzodHYVW/+12fXEpguabfY2gMSflmfND6th/1EuqmOR0mOOlyXF9KBh+lYNZJ/x9eh+HJRngwGXCgCSCe4R/Tj0KJwKHheHh/fSpX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXTloR7W; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXTloR7W"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31f28d0495fso585575a91.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 06 Aug 2025 17:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754525008; x=1755129808; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s2nIm9pR2VFff1R0Gt37lG+o36/Td6KpLeuI6lVGeTs=;
        b=OXTloR7WWoyxmrrlgjVXGD3ywBH6g/+ykpfMS9qDsF4Pmkdx7m8EvoN9nEUeYAxlR+
         hXxXxXA/GBfjGuJAUxY65AaLrrjmoc/1pyty/ryj7Hte7a95+t9z/RkRBBdwFyDEQ8j4
         m6zNeIc/s8pekp1yN2iQYnYBr2SAyJFMhB2SP8WrwBBqZffAiCljicLvYgSXrUIzpTUl
         P/ow2DqxYe+FpcLHlhpoF59sAVRV3mbaCt3KZAUjC3DdhgAjLHjsPbQP8/VhmQAeExXZ
         oxCVQ28PAj6s6Tx2r3WDKcPPWfJOyIPgvn7pbyLLPcw9+Ood2kC52m8j0H9dl9jw07Mg
         1OIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754525008; x=1755129808;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s2nIm9pR2VFff1R0Gt37lG+o36/Td6KpLeuI6lVGeTs=;
        b=OEg4dLkPHYOLNrhgMH8cMrAKj+b0oSMCHtE8I6z0sfhP+l41YJJLy+kEgwkLx0IKX1
         fY3I6U+fmnYynlRhdqtyAgjU3zv9nhMNgHlidFzQcERvDQI9bjlrXJcBX1plnJoFwloO
         2zfxMAzOu1rDIwrPRGslDXJjzlsnUybHCFu04Hf+LUn81D0mhIt39kztIpHz9/toi1eM
         mbWvLFtr8ooccEPRqeKc0yraXlMErtunhnV51URqB23HJX6xcKZixt6sDQti5Q2+Z7sM
         ryZwYPBn1A6HXjEfcrIIFHYxQn6K3nypTPa90RInEF/jFZAOfM4yIOYkLZn1bPzpxKik
         1HOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU65nIGycSHW2RMg/9xIDmqx/OA8XVCquULlMvOwCJcjEFUn1JfrOrQ3S5GCH2lghf/Xnf5LEr0Rxc1MQZJJDqlJc9ZXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyivAF/69+doMQskX4s/UL2eOm3vuQ2XKISz7uEw8SAf0JYAYgS
	ArNUIQZlFAajxQQHZGSLhP4RmKytFcgeQ0AWxe+mWx5fG+A3qYqR13zW
X-Gm-Gg: ASbGncsS66Avj2Ta5wSaE/2iDbRnmnwoDx8NL4j0r7RHFBldZ5mGgQV/5WWMzd5EDyD
	SOVcdHZ5o4LpDpmpnyoUIk3CO6lkcZ+tGbs0QWBH475zd2W9wSCLWFQ71nL8RPgMrN1BYVBSmBC
	0WSBtjex9Q2g0KkqQkn/3Pwk+hc+oVX3QIz0MtMi4UegXKQZK19loM2XeH290SEkRCiZyxm95fX
	8K9O/CCO0TQb+JIffODlVuian5VDIU5pqT9Tgjp/TugtHmg4yNap9djwUP8LHAaYYL27ixnlT9E
	1g/ymHI8cpC1LdiEK4kFWbjC37S2NtH5yVBZ9xTuepbwFMZJqdOS5AD6nBD8Oa1Dq9yEjo4pAFF
	K3HBbMIdeY+JenIuZ40KYSPYyKOOv/4P5YjI3
X-Google-Smtp-Source: AGHT+IHndIqzglD98iobqIfSre5A1Dz03NPUiXq1oQdA0qqIpiN9bEtefJ4HDNfGWlO3SOLnCSjtyw==
X-Received: by 2002:a17:90b:1c85:b0:31f:6f8c:6c92 with SMTP id 98e67ed59e1d1-32166c2b18emr6044750a91.11.1754525007434;
        Wed, 06 Aug 2025 17:03:27 -0700 (PDT)
Received: from [192.168.0.69] ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32102a559bdsm9223807a91.1.2025.08.06.17.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 17:03:26 -0700 (PDT)
Message-ID: <ad14410ef291af926e7185d5d95cb0c932135ee3.camel@gmail.com>
Subject: Re: [RFC 1/4] net/handshake: get negotiated tls record size limit
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Hannes Reinecke <hare@suse.de>, alistair.francis@wdc.com, 
	dlemoal@kernel.org, chuck.lever@oracle.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	donald.hunter@gmail.com, corbet@lwn.net, kbusch@kernel.org,
 axboe@kernel.dk, 	hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
 borisp@nvidia.com, 	john.fastabend@gmail.com, jlayton@kernel.org,
 neil@brown.name, okorniev@redhat.com, 	Dai.Ngo@oracle.com, tom@talpey.com,
 trondmy@kernel.org, anna@kernel.org, 	kernel-tls-handshake@lists.linux.dev,
 netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org
Date: Thu, 07 Aug 2025 10:03:14 +1000
In-Reply-To: <2a9c71e0-f29d-46b6-823d-a957b10b4858@suse.de>
References: <20250729024150.222513-2-wilfred.opensource@gmail.com>
	 <20250729024150.222513-4-wilfred.opensource@gmail.com>
	 <2a9c71e0-f29d-46b6-823d-a957b10b4858@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2025-07-29 at 10:12 +0200, Hannes Reinecke wrote:
>=20
[snip]...
> > diff --git a/Documentation/networking/tls-handshake.rst
> > b/Documentation/networking/tls-handshake.rst
> > index 6f5ea1646a47..cd984a137779 100644
> > --- a/Documentation/networking/tls-handshake.rst
> > +++ b/Documentation/networking/tls-handshake.rst
> > @@ -169,7 +169,8 @@ The synopsis of this function is:
> > =C2=A0 .. code-block:: c
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0 typedef void	(*tls_done_func_t)(void *data, int stat=
us,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key_serial_t p=
eerid);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key_serial_t p=
eerid,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t tls_rec=
ord_size_limit);
> > =C2=A0=20
> > =C2=A0 The consumer provides a cookie in the @ta_data field of the
> > =C2=A0 tls_handshake_args structure that is returned in the @data
> > parameter of
>=20
> Why is this exposed to the TLS handshake consumer?
> The TLS record size is surely required for handling and processing
> TLS
> streams in net/tls, but the consumer of that (eg NVMe-TCP, NFS)
> are blissfully unaware that there _are_ such things like TLS records.
> And they really should keep it that way.
>=20
> So I'd really _not_ expose that to any ULP and keep it internal to
> the TLS layer.
>=20
Hey Hannes,

Sorry for the delay in response, and thanks for the feedback! Yeah I
agree it was a bad approach from me. It definitely makes more sense to
keep things in the TLS layer. I will try to address this in V2.

Regards,
Wilfred

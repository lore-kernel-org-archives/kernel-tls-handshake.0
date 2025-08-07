Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E3E38B
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  7 Aug 2025 00:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754525668; cv=none; b=n015RUlxtliWtG3WwyDrpZhJDSEd4fc3wVZ4jY4VCfjcNxONJ3iApsjwZjOKdRYcisTfX+t8bc6lYzvnUFV10pibKx2wCwaTpjpM04pQ5iN/0eyhJ1zz20WwjxrcrmUOc4iAzegcaTCfcDQT6amC+NUnu7niqlHzvJBMWHKXH2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754525668; c=relaxed/simple;
	bh=Wn7+MLg+mx7R+loSOdJwKVEpmHzJFAcSmm3zYQYHZK0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eVH7BG+RtyMUi8WxKZZp8pTTNIy14nVN3JLPuPEPo6+gV1l8j3UHFtd40/69Ugg7KwhghkJrSqApOnssOV2zv5Of6ARidILAvCGc/m+07+mI3BhDlUWDzaaSGN9gI5qXJQ/nk8A7jZlnVMMq/pFJ95YEisfEp+KuQuuLhECXrCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+B8U7uI; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+B8U7uI"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76bdea88e12so490661b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 06 Aug 2025 17:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754525666; x=1755130466; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wn7+MLg+mx7R+loSOdJwKVEpmHzJFAcSmm3zYQYHZK0=;
        b=V+B8U7uINUR+COkPVAlvvttj3m9zJXY9yqKzqR5bTspIHX61E/IXh3xNwpCIEg+G/u
         M4cSN/ppXABmyqYUVrKCX+XUT1L6h8hWl2/O6C0O6+5t2DuL2pr0vGAkrGyxSlszXQM5
         bBpocgpectoJs2E+bxmc4mWMV45OdqfuwsuHhMjLQ5PQU/IC271q6MDFppQpWmLrCacT
         M38q0jOWrnTbmMmOYlriJqshirPKju3q+RZeExW8Uq0MFHtp0kJRruFl3rqAlvIyUFRk
         /Ptd8h9SUNtf7r3nnCOyCFzG28lZahN3EGVBrQ3g/cpVvSnftcvmDyQOjP5A7QRB6fUe
         qgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754525666; x=1755130466;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wn7+MLg+mx7R+loSOdJwKVEpmHzJFAcSmm3zYQYHZK0=;
        b=gtfvyo2r5Tc3YA9xneRZwJLL8pqRQ4Pj9AwaMZqqrElc6GlD5anIMDyZi1lmcG+kX2
         cE0WAqA9JXz1tF18+77tTwtkToQwndgwytO+vJTjvRew0zLG9sb7533+NWA6pAokuAmz
         RDJHpXBowqC2xkRVPWXvS09m4uMN97YjzbmvJiO4ZLEwLrna7OxTyRS4SXjcXdnDQHx9
         9CR0nK6XLUYl62Qu+Py2Q97HBkbAD4Hgra7yP88Drw5tps1wRyq0PY/EdRVB9KBN8ON2
         wNeiGJExq3X+OdVxVqXnVYEUae/Q50sCGQOUT1r9GyU2qYFeBZ2EYf8beiRqoV8d1PiQ
         2xcA==
X-Forwarded-Encrypted: i=1; AJvYcCVzeTNLn7q0qEHaxBNFYNbowZx9jkSPqvzAN3wbTzMfzPaJHEk7stZZ/g4otosGrQJxbOiv0VzBsNMVn2IPOEMxK8q9xA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9Y7veHMtYG8BhGVui0hvShGnprqcvqF/H0rj4itA86f5ik6jZ
	awJabkoSvfXdzoNf6N2GLiDk2uO0zlojr53yFcgwUmoU1kIdklIFUrCY
X-Gm-Gg: ASbGncsWoTOU1oUu4oW6ni5mqfRwJrthOPFqClrY+LneXxeT9XJi2CbbN5xb6MYhDtJ
	kkUUia8kCL3HJKKktsqhs4FzhfdiaHUopKKMfv2srrdQmPUTAm6ZRyOlkfzPPN/zZi+6KsFuztt
	ScQzRbS5Mp4U6hFhJxo2KdjgcGoSg4oU8Dpn0YxG6N+aMfFffYnyKfcfCWmYpi2WTKP+u7QMco3
	RJuiWlFb/ARaDXMyhTmy/7y9f6TODHBpwmAnA5so1iprYOyj11OUDoRCy3kfgTJFMzznLqRojyn
	GqI3DKvtWUuUlQ+bcCB9hfGdh4xiA3y0R1ErIJgou3UghZWvhk/+ktzIyacDFH7gZkS1Kx+PJVr
	gGwVG1asrtttwg5vDtz5rLTGWnaZ8gu9+szwg67DgeNTmS5o=
X-Google-Smtp-Source: AGHT+IFv3fICeSVNB66r1CGZa9K57JTbAU/G+cw8lORmFzP1zvxfL+ysyO4WBfOOvQ2rCC3Vekbzqg==
X-Received: by 2002:a05:6a00:2d26:b0:76b:c882:e0a with SMTP id d2e1a72fcca58-76c387f6269mr1193271b3a.5.1754525665892;
        Wed, 06 Aug 2025 17:14:25 -0700 (PDT)
Received: from [192.168.0.69] ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f911sm16602234b3a.47.2025.08.06.17.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 17:14:25 -0700 (PDT)
Message-ID: <7af292c6bb2c42cead77202a9034fcb6111b898c.camel@gmail.com>
Subject: Re: [RFC 0/4] net/tls: add support for the record size limit
 extension
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Chuck Lever <chuck.lever@oracle.com>, alistair.francis@wdc.com, 
	dlemoal@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, 	pabeni@redhat.com, horms@kernel.org,
 donald.hunter@gmail.com, corbet@lwn.net, 	kbusch@kernel.org,
 axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	borisp@nvidia.com, john.fastabend@gmail.com, jlayton@kernel.org,
 neil@brown.name, 	okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com,
 trondmy@kernel.org, 	anna@kernel.org, kernel-tls-handshake@lists.linux.dev,
 netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org
Date: Thu, 07 Aug 2025 10:14:14 +1000
In-Reply-To: <96ca4de7-d647-47ac-b42f-d76284394526@oracle.com>
References: <20250729024150.222513-2-wilfred.opensource@gmail.com>
	 <96ca4de7-d647-47ac-b42f-d76284394526@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hey Chuck,

On Tue, 2025-07-29 at 09:37 -0400, Chuck Lever wrote:
> Hi Wilfred -
>=20
> On 7/28/25 10:41 PM, Wilfred Mallawa wrote:
> > From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> >=20
> > During a tls handshake, an endpoint may specify a maximum record
> > size limit. As
> > specified by [1]. which allows peers to negotiate a maximum
> > plaintext record
> > size during the TLS handshake. If a TLS endpoint receives a record
> > larger
> > than its advertised limit, it must send a fatal "record_overflow"
> > alert [1].
> > Currently, this limit is not visble to the kernel, particularly in
> > the case
> > where userspace handles the handshake (tlshd/gnutls).
>=20
> This paragraph essentially says "The spec says we can, so I'm
> implementing it". Generally we don't implement spec features just
> because they are there.
>=20
> What we reviewers need instead is a problem statement. What is not
> working for you, and why is this the best way to solve it?
Thanks for the feedback.

Essentially, this is to support upcoming WD NVMe-TCP controller that
implements TLS support. These devices require record size negotiation
as they support a maximum record size less than the current kernel
default. I will add this to my V2 series in more detail.
>=20
>=20
> > This series in conjunction with the respective userspace changes
> > for tlshd [2]
> > and gnutls [3], adds support for the kernel the receive the
> > negotiated record
> > size limit through the existing netlink communication layer, and
> > use this
> > value to limit outgoing records to the size specified.
>=20
> As Hannes asked elsewhere, why is it up to the TLS consumer to be
> aware of this limit? Given the description here, it sounds to me
> like something that should be handled for all consumers by the TLS
> layer.
Yeah great point, I didn't think it through too well. I will address
this in V2 and have the record size limit implemented in the TLS layer
without involving ULPs.

Regards,
Wilfred


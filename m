Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8F21A9F91
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  7 Oct 2025 01:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759800178; cv=none; b=sTIPMU8tH4O9eGrMlKlqwOD3u6TbF+F5kLRW7yd0rnl5/0sAK/hrKBTAGP0ioI0emUY0ECM48djQIlj6xTzc6EBt+A1u/NlKvfPf4v5Aoh/WGgXzuobTJk1icr0ZzrpPhL+/qvBqYtYeN5VcNlET7GN9zh+V9LtDgXsxOQHd1gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759800178; c=relaxed/simple;
	bh=00hx5O89+8fvzy4PkP6xQKJCZLvcQoPJKp5vdlCLTCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=riEA9Kb/LPqRc3WmryLeE7y+aHxgEGLdYxBLhITeq7F1wjyzcFzbYeILIVImILGY7Zt4IMIQ0IotmQ+XlnVFSNAe7dekevq2SQJ3VIMsRhOqNkymrGUsOnJNGmknpDRUo+W+MpjKRfh/EB44GyaZBsQcN5qI1fD36G47GHLJNUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7+rA7SJ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7+rA7SJ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6364eb29e74so10825912a12.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 06 Oct 2025 18:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759800175; x=1760404975; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t47vpiwRUGgVZgrjR0ubmEzxDtialDVYBK5r+ezzR+E=;
        b=W7+rA7SJcOvhRbVZMeuq8a61tpive7PpPNWinFu4qUzMlQtVf43SrsJV017P3qPcBQ
         khYYrONIpwi76RjUqj7I3bewox8iS7jedqXtvBtTgsEqQTFlpi9bsdEvkj3kX/yZAIhT
         C8/6497vAPCTKP5V/DVYSlYip57a6uzGpNzIhpS/zCTH7/PcSoGqDafpJj3eK3TIF+U4
         IKnQrCM/7sDqNI8JdU1+BbvJwbIPatQmdlMbg0khNYODDX4FDJQnAY2cG4JFwHsNSYiA
         dFb40UHM/g4hxVswkxYm6rfCBcs8NH8y5ggGEDVuQ3BvOPnX9Fy8qVN+peKk0+BU0Lxo
         h0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759800175; x=1760404975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t47vpiwRUGgVZgrjR0ubmEzxDtialDVYBK5r+ezzR+E=;
        b=H8Nd7VuLCSA7Lzfz+weasCTB0phE6cyIgWocx0d7IHvT3I1tKq0T2EkqWgdTD3ODv9
         CMmHlYL7W0lidOyfTGCHkQYzrQPW9bzVcUaD+qbxyx/4B5RFKaOE9vgNIIhx0iWxcQDZ
         QGUE1Tz4sEp+pXS6daSdi8dtOyjgaW3yDBrhiM5sHvWLPyDcZT2BGqrW8/HSjab3nE+l
         1DQ9CQhKU9uAqzbN0dMRRy8j2cWhXF4L3P5yTkXj3FdvSJBNmRyXRQWwDNGt/FTnTrOL
         PlvnoigQ7r6fIsqE7X1MGoAPNZdzoPnvGgQw3lseUtdkU0jTbPHi3VsfDUPGVWbjPKCV
         OopA==
X-Forwarded-Encrypted: i=1; AJvYcCWmyR2fUUvpluBBASXMJKrQUq2B7aOY9nq/DJi+ZnQbV9uSB6QFoYdlfGmIfYX1mnEsP3j4BExGGi+Nun7ZwfJtgyUmHg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+udjDMYbjwV5Q+b7JSrnuWJCqvzff50dweQ5QdCgsDM8TBuCm
	Ef9f51tTnWQp8+qmaBUibDUByUKtXZFp8Df46VxXo1hJ2IPlTKx4BDWnhMrBcLENkPB1VGEtSRf
	8DBYmyVm0890+7UnMNMxuxS+tD3ci/wM=
X-Gm-Gg: ASbGncs1Q9l4r/NBDPBOw/oqf4x7ykJx9cDlNHBcAadEPsXdG8rALpVZH8b+w87R9L4
	oakLDYJlbDbju04jkE3P4wOs+ZM2Z8VBTerp0WK8q1Rs22f06oxwwi9Z0jZMoAHxd0vIy/cG1c6
	PGBLk0zfWHKFbXmaXkTHgvuMa9l++w21HrmbKhv42PaTjYmi9thrH6a0j4+BNz2F5o1iWt0R/Rg
	Yhfz5zFmp+JyUMU3GKPAdbdirNWFMqHZecLloB2PzbXqY2eEDz/lwGEPnhSvw==
X-Google-Smtp-Source: AGHT+IEqVioe1S+GxtMPUCva4kG5CmfdDTTGDPNdiniLUblABnKsGagheixLUyeC/Xqdz84Zg3zCalpzx4OwzsmlUYQ=
X-Received: by 2002:a05:6402:b0a:b0:638:d495:50a7 with SMTP id
 4fb4d7f45d1cf-639348fa973mr13226165a12.16.1759800175262; Mon, 06 Oct 2025
 18:22:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251003043140.1341958-1-alistair.francis@wdc.com>
 <20251003043140.1341958-4-alistair.francis@wdc.com> <05d7ba0e-fe39-4f86-9e46-7ba95fccdce9@suse.de>
In-Reply-To: <05d7ba0e-fe39-4f86-9e46-7ba95fccdce9@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 7 Oct 2025 11:22:29 +1000
X-Gm-Features: AS18NWA3ErD_gS2cWuFH4B1EU9R8Gp49Hxw1eP3L2D2MX2i73c7hEabcslLmzvQ
Message-ID: <CAKmqyKMRXKJTQciiqjPXYAFa6UUJ6xkTSdEfU+9HnyNTOx-BxA@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] net/handshake: Ensure the request is destructed on completion
To: Hannes Reinecke <hare@suse.de>
Cc: chuck.lever@oracle.com, hare@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org, kbusch@kernel.org, 
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 4:16=E2=80=AFPM Hannes Reinecke <hare@suse.de> wrote=
:
>
> On 10/3/25 06:31, alistair23@gmail.com wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > To avoid future handshake_req_hash_add() calls failing with EEXIST when
> > performing a KeyUpdate let's make sure the old request is destructed
> > as part of the completion.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> > v3:
> >   - New patch
> >
> >   net/handshake/request.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/net/handshake/request.c b/net/handshake/request.c
> > index 0d1c91c80478..194725a8aaca 100644
> > --- a/net/handshake/request.c
> > +++ b/net/handshake/request.c
> > @@ -311,6 +311,8 @@ void handshake_complete(struct handshake_req *req, =
unsigned int status,
> >               /* Handshake request is no longer pending */
> >               sock_put(sk);
> >       }
> > +
> > +     handshake_sk_destruct_req(sk);
> >   }
> >   EXPORT_SYMBOL_IF_KUNIT(handshake_complete);
> >
> Curious.
> Why do we need it now? We had been happily using the handshake mechanism
> for quite some time now, so who had been destroying the request without
> this patch?

Until now a handshake would only be destroyed on a failure or when a
sock is freed (via the sk_destruct function pointer).
handshake_complete() is only called on errors, not a successful
handshake so it doesn't remove the request.

Note that destroying is mostly just removing the entry from the hash
table with rhashtable_remove_fast(). Which is what we need to be able
to submit it again.

Alistair

>
> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), GF: I. Totev, A. McDonald, W. Knoblich

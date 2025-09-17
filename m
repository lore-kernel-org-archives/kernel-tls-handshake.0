Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A5B2D8763
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 17 Sep 2025 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758106634; cv=none; b=VRcDQG/B5DsuiPk1Gx68iA9v9jBKmOAYFbWQ8BV+cqqSca8l3HuFfac6PZo1l4mJpp9kTni1HYORPpnPSPIBeWVXzQr/dHpjDyPHqUQ8lPZtm3J/NPHRqqM1+uwSSj27bAw6l0KiiJ4R2EXVSihfif2QVuSea19pZ6bjJkMzngk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758106634; c=relaxed/simple;
	bh=QmYrtoWSI1kIy/nJzwXJBLHjj0jj0mabKB7oxUIrXJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUmk8vPG3+Mou0H89sAJO0bhkGzKxCsBROAky4coMu6gLedN386q/lHaE4X23CzsHN5BsIe+L4l/vLwGMZzkHxjaNLYb3EWCDRLgmX8dI0DrMc4p4Im99+BPR6y0mLUXlEIOfWQFpBXquAj6wTDBgpFN9QgMDwrfN5VWhtJ8jWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JT7uzSYe; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JT7uzSYe"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b07d4d24d09so508832066b.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 17 Sep 2025 03:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758106630; x=1758711430; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwxczvPwBg4Uyzbb2S+36YkOcrWK5ImeOLTlbGUhTaE=;
        b=JT7uzSYeAhWoSEhyih7ju99yh5C7/aTMPa5/uTYziWG0NISuRxJtBVvTdVcOCdRCjQ
         j2TooDkLhKPl1tH91CwZOHI/nTGUW1AK+bPxpjMcglX5SEgrsnhTjJ4On7GgBXwUCVqE
         4S+ON8ss4K5kYxkBiH69DiBTAn7YOkS4uCTKSxiR4S+H0mDPgfWS/STjYjwYNgqh/vpS
         IJmADhrVRUfG0RJGGsQ0G9CAqRD7n1+kA2ed13fKXlCuxtU+KSbUGED4LeJ4jmaJO8rg
         T4YF4dxwuVmQXEXazPMm2b3MIez+IwY6VXiJ0hYslv7hHJ34EaD2q8cTqWpDB3PddINX
         g7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758106630; x=1758711430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwxczvPwBg4Uyzbb2S+36YkOcrWK5ImeOLTlbGUhTaE=;
        b=ZRksGT8Z/mwm4BMWFQN7vVUWQUsBW2zdzvGMCnotUmTIzyx8E/w1dmNeOYDazogyk+
         clt7+wB9ot/94VT+kbEfC8EyenG708ytR3ugDtn4tUcceNPFnsJbjwUHW04bvxm5lVpK
         LC5bsIzE/7MqPvgRYh7wVZu1Tcc0HCJs+UkgmPAX2nUSq0TJIMEaiOBJgt+LZnWQwtqh
         bpjsfWmekIvyMtP6V8wf7Sav1h1EwMQ8d4/Qsn1UgNGGIekGuowQPBfyQoLGvaWW2fO6
         z3PGUxEg9m+slWCtZ9NQF9+09rI3T3ZAAd89jwrYOpWYf3+2MltJlaN+ngKJJKl60308
         blOg==
X-Forwarded-Encrypted: i=1; AJvYcCUeA7uC8JFx+2wHdTWBZ8miO5mOyhsaWwRGw3qBIe+Nh9J3bFPIlOTArRnc/nxuvdSmRRdwEml5uDJHoiSeXdzQ9CZ/nw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPcNikXkOfGXLj4QlbEw1OKmtivWyS8Yeel+wCGKrZz9+cdo4y
	8fx9s2iHjtWbWwotE6+Pu+UhS6B7Of82bSKlWncUjklodU0/lg+CWIkR8pja7pxgOZbURRbVaSe
	RoH2+KXBbY+YGFJqtUwXRnaEU5j3CtH0=
X-Gm-Gg: ASbGncvyGjF18EjE81Jg8D5dqobKw79FlPo1JxwLBgppx8Kd1jm0fjeamv3+QJT4uaL
	2/50nk1ZxdPqVs4Nq9kQg8T3n1t3x5WpS700F/8S69oBS5VmJokNymncKHLG3sy6v/b+b4CZrwu
	BzKOk70AQGZAy5DHQAoopj4ZLRr6opJgHckC7bHOx45SGqdeGTSv1JhWq0Z0KZvrXu3hGjMVTl/
	gxI/0bwt21fK5ES4Jrc5BXE6NsDthttwJ0Ssw==
X-Google-Smtp-Source: AGHT+IFRxj/9mtl/X+fIrakzsiy5Ocq5giy1UUqC3+OR/MDKcOd65B6+Mg4kPuXc5cy2Khkk6gzSVw2BB+E/UtAWaGo=
X-Received: by 2002:a17:907:3cc9:b0:b12:162:8347 with SMTP id
 a640c23a62f3a-b1bb2d0f441mr214182466b.16.1758106630039; Wed, 17 Sep 2025
 03:57:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250905024659.811386-1-alistair.francis@wdc.com>
 <20250905024659.811386-7-alistair.francis@wdc.com> <f1a7b0b5-65e3-4cd0-9c62-50bbb554e589@suse.de>
 <CAKmqyKM6_Fp9rc5Fz0qCsNq7yCGGb-o66XhycJez2nzcEs5GmA@mail.gmail.com> <e168255c-82a0-4b9a-b155-cb90e6162870@suse.de>
In-Reply-To: <e168255c-82a0-4b9a-b155-cb90e6162870@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 Sep 2025 20:56:42 +1000
X-Gm-Features: AS18NWCp6hE9_gHHY9RNWcNThlN_Ck6Xfvl_Pbkl6uhBvEylonTEL18YHTqIeJc
Message-ID: <CAKmqyKMLP7hOi4FNhBET9XfoNZv4MZ3OsSRA0=B42C3+Q7P1jA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] nvme-tcp: Support KeyUpdate
To: Hannes Reinecke <hare@suse.de>
Cc: chuck.lever@oracle.com, hare@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org, kbusch@kernel.org, 
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 8:12=E2=80=AFPM Hannes Reinecke <hare@suse.de> wrot=
e:
>
> On 9/17/25 05:14, Alistair Francis wrote:
> > On Tue, Sep 16, 2025 at 11:04=E2=80=AFPM Hannes Reinecke <hare@suse.de>=
 wrote:
> >>
> [ .. ]
> >> Oh bugger. Seems like gnutls is generating the KeyUpdate message
> >> itself, and we have to wait for that.
> >
> > Yes, we have gnutls generate the message.
> >
> >> So much for KeyUpdate being transparent without having to stop I/O...
> >>
> >> Can't we fix gnutls to make sending the KeyUpdate message and changing
> >> the IV parameters an atomic operation? That would be a far better
> >
> > I'm not sure I follow.
> >
> > ktls-utils will first restore the gnutls session. Then have gnutls
> > trigger a KeyUpdate.gnutls will send a KeyUpdate and then tell the
> > kernel the new keys. The kernel cannot send or encrypt any data after
> > the KeyUpdate has been sent until the keys are updated.
> >
> > I don't see how we could make it an atomic operation. We have to stop
> > the traffic between sending a KeyUpdate and updating the keys.
> > Otherwise we will send invalid data.
> >
> Fully agree with that.
> But thing is, the KeyUpdate message is a unidirectional thing.
> Host A initiating a KeyUpdate must only change the _sender_ side
> keys after sending a KeyUpdate message to host B; the receiver
> side keys on host A can only be update once it received the
> corresponding KeyUpdate from host B. If both keys on host A
> are modified at the same time we cannot receive the KeyUpdate
> message from host B as that will be encoded with the old
> keys ...

Correct

>
> I wonder how that can be modeled in gnutls; I only see
> gnutls_session_key_update() which apparently will update both
> keys at once.

gnutls_session_key_update() only updates our keys [1]. You can use the
GNUTLS_KU_PEER flag to set `request_update` to update all keys.

> Which would fit perfectly for host B receiving the initial KeyUpdate,
> (and is probably the reason why you did that side first :-)
> but what to do for host A?

Patch has been sent and reviewed, just hasn't been merged yet:

https://gitlab.com/gnutls/gnutls/-/merge_requests/1965

>
> Looking at the code gnutls seem to expect to read the handshake
> message from the socket, but that message is already processed by
> the in-kernel TLS socket.
> So either we need to patch gnutls or push a fake handshake
> message onto the socket for gnutls to read. Bah.

Correct, patch is pending (see above)

1: https://gitlab.com/gnutls/gnutls/-/blob/master/lib/tls13/key_update.c#L2=
45

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

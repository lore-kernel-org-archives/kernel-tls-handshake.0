Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5BD165F1A
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Oct 2025 01:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761008535; cv=none; b=Lo/E9xSFHGpouhTbdM96b6ja86EX9CF8yu7I/nZvNPeR6WEysw9lNmn5u19q17aKUbWiWrXAW0DtfllUwy1lVGFPq3ZXC8nZ/g9mOrhREU93baZHVkzOkztL3aXzAQTnu9v2Po2qWzmiDD/h+QWpREg5GzZR9aafFEs390fVvho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761008535; c=relaxed/simple;
	bh=qZLBj6arx9QOTLUUblWHZMf3JCAP1L/JUAsq+xSZU/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UxypRPzonIWh7/pv+m+2D7s0Rxg4fMH5ZSSzOdyOhiAaVl6K2CAziebL83jI0XZj337gA93WL+OFSTp9LKPyTrVlEi/DtkyLAwNorZOlnMRzPw7GIbHwVWbealeBSsJQpxIOrUMmQgkB3M7c4pFvbGrrI3eVb8Ep5CbO5EgkYrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=morBY5YY; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="morBY5YY"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b5e19810703so822545666b.2
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 20 Oct 2025 18:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761008531; x=1761613331; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdrgppHkZAyxxVFGpYMxDncigVmTn7Xgn5GmJmM4fFM=;
        b=morBY5YYQdkqQX6IHcjHXFveGaCvRljYBhqyNTsBKxp455mXdXRQT9Qnea5a1BTaaK
         TQNSaOfsfjhmFKMJNyMIBWFE+rOd9jpchyw5JdtxdLK+4R7WEP9fdgZjZZGx8t9FwEcY
         /Ky6TFQdfolY6jocdKPOWhAusy55GIwjE6d7WAcCRh84qfrVAD5cZZZsnoB6wZX3+GhN
         /AsmFz9T5EiwBXdrrp2nxFly4S4kybO+MPYbCQrelbO4eaYKEtm9NJm3DWNpFoDeNpv4
         +WFivDwFg99/jUFakVZ00X8sxi0l0BHERSvoR4RgY0Yc2+7eCK/RCdmeaaA7JMUGRxbd
         /rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761008531; x=1761613331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdrgppHkZAyxxVFGpYMxDncigVmTn7Xgn5GmJmM4fFM=;
        b=ooZEQzv2c2sUhbyBpMmVSUuNhfN5DNWReE5DUAm1mpOrTERH5bXGrae+ojBBej0Sft
         la0YCHC8FbfvuT/KIqC0dBSPXU2sicidszV0Jn288r+M/iVwMJTlqRC4WDZ1cso0cQMP
         WIvdnlcp8r0gCPlINaKxIag4ycHG7gSaLSwl2qsXzPTlsN+nC2IBVgvUvBQUus5zBXFS
         oG726+x8pk8bgexhP77SapGCaS7wygBifOgBli8PyM6qTmtGd6zGTiiqPS5uK/6LqA7R
         XBOZBp1rXz01yWyVBv2NNd6idATxmxk+yEuobuXA85pSAbuu4XuSlZOXy/X59K8X0DmG
         Ju7A==
X-Forwarded-Encrypted: i=1; AJvYcCVDHnPsg0RhB6aZ2R0yL2pVXDPGTw6c8SAtW6nA1i21cs+9Ck4fY4Q3hFwab+KGBNwXFJQwxum49ItcY8p9tMvr72to+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGAfcUmlIyr9LdvOlQPRrXcaxlXF1LKwATu+EPcDxxfjGNIJwR
	XveNqDjkMjUAqj0QLWclgpNoQG3jvV00xEuZCNUZG+YOsqdS6c/hnw13fV7vH3p96LKbtF9fd39
	LM8EYJkPapaHOBZ3VOpM5BjD+eqaunOQ=
X-Gm-Gg: ASbGncshpM8tpe6ESCCq6kGBHIsn0dC7csgc6QBDqqDVgCBs9y/F0zAsErcKyM5Y1QE
	+yE7w+yjdC5EC49eHDl8Dw8HLcI/rMHyImC9LzcbvTUktANt4r1HfM+6bRPslM2nTv/NUuc4tLA
	iMUVRK9DU9zMzKZHmb+KGr8g25ME/1Ry6hA+mfbRWbUoeJ8S43lsUYo3YXGIPgMp2HXzGL8n/BO
	PzazUJ1cbNgQtzAr5vX7cK4oJZWUGPeAY8y3nuhth57rZ8NcsalVtGnhBJ3jK7/JsVlIHtNwMAe
	wKQlThwKqfCRG/U=
X-Google-Smtp-Source: AGHT+IEKUvPReN1WIc8WWqIkjL1j43sIvxC4HgtgT3kVUG9Iyo7fRBo0aTHcqpyZOi9DM/GsvtqbZf+qS2DkcF9tE4g=
X-Received: by 2002:a17:907:a07:b0:b3b:f19:ac7c with SMTP id
 a640c23a62f3a-b647443cef7mr1691282766b.36.1761008531342; Mon, 20 Oct 2025
 18:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251017042312.1271322-1-alistair.francis@wdc.com> <fe16288e-e3f2-4de3-838e-181bbb0ce3ee@suse.de>
In-Reply-To: <fe16288e-e3f2-4de3-838e-181bbb0ce3ee@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Oct 2025 11:01:45 +1000
X-Gm-Features: AS18NWDiepjJ-jRwTWQwDakRt00NDvcpR1iprtqV_ILiMUcAXQFVJU3hWPRHcZA
Message-ID: <CAKmqyKP0eB_WTZtMqtaNELPE4Bs9Ln-0U+_Oqk8fuJXTay_DPg@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] nvme-tcp: Support receiving KeyUpdate requests
To: Hannes Reinecke <hare@suse.de>
Cc: chuck.lever@oracle.com, hare@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org, kbusch@kernel.org, 
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 3:46=E2=80=AFAM Hannes Reinecke <hare@suse.de> wrot=
e:
>
> On 10/17/25 06:23, alistair23@gmail.com wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > The TLS 1.3 specification allows the TLS client or server to send a
> > KeyUpdate. This is generally used when the sequence is about to
> > overflow or after a certain amount of bytes have been encrypted.
> >
> > The TLS spec doesn't mandate the conditions though, so a KeyUpdate
> > can be sent by the TLS client or server at any time. This includes
> > when running NVMe-OF over a TLS 1.3 connection.
> >
> > As such Linux should be able to handle a KeyUpdate event, as the
> > other NVMe side could initiate a KeyUpdate.
> >
> > Upcoming WD NVMe-TCP hardware controllers implement TLS support
> > and send KeyUpdate requests.
> >
> > This series builds on top of the existing TLS EKEYEXPIRED work,
> > which already detects a KeyUpdate request. We can now pass that
> > information up to the NVMe layer (target and host) and then pass
> > it up to userspace.
> >
> > Userspace (ktls-utils) will need to save the connection state
> > in the keyring during the initial handshake. The kernel then
> > provides the key serial back to userspace when handling a
> > KeyUpdate. Userspace can use this to restore the connection
> > information and then update the keys, this final process
> > is similar to the initial handshake.
> >
>
> I am rather sceptical at the current tlshd implementation.
> At which place do you update the sending keys?

The sending keys are updated as part of gnutls_session_key_update().

gnutls_session_key_update() calls update_sending_key() which updates
the sending keys.

The idea is that when the sequence number is about to overflow the
kernel will request userspace to update the sending keys via the
HANDSHAKE_KEY_UPDATE_TYPE_SEND key_update_type. Userspace updates the
keys and initiates a KeyUpdate.

> I'm only seeing a call to 'gnutls_handhake_update_receiving_key()'.
>
> But I haven't found the matching function
> 'gnutls_handshake_update_sending_key()' in current gnutls.
> So how does updating of the sending keys work?

gnutls_session_key_update() calls update_sending_key() which updates
the sending keys.

When updating the sending keys we want to send a KeyUpdate request,
which is why it's a different flow.

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

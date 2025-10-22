Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFAB199E9D
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Oct 2025 04:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761108002; cv=none; b=BSYTNq5ZMn8G/6rdi4D1M5IB/4R6gVfj/WQ4fPePbqFZGfcHT4W1n1K7ShHngnMAHgxoM+gXmFJ0kAbuop2c+Hy21SR29Esmpwi3Fa0Nfjwvo2j7fArNFyRVcwJhdYhdisrsc2RnMtpizf7E7rp+tT9gq07Ppl2qGiqBL6kQ2Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761108002; c=relaxed/simple;
	bh=ld3/eNFPLY60lt+IfJihL1BDtR0im6CUyfF2eWumV4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C8WqnYJzRf5QcNFjW/LhO7G060iypfkP4HFhqBoVkphqqqPG6jWQGDzNo5y16V0XpXM8+Zjs/hk4DKYdr3K4E4t5108LzWYO5EoZe2fTTjK60GoMPXY060PpBy5Cy8Wc8dNi3oKCWujKabZBabT00FI2k308F8jlazQxeL7AcBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLCjsO3w; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLCjsO3w"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63bf76fc9faso11690248a12.2
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Oct 2025 21:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761107999; x=1761712799; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gcIWpCfhJL6hBxoRz2avBVbdzuoekMr6bFmgI7HFrU=;
        b=eLCjsO3wLHBQ2CaupTxUBQCUgsOki2GPLCdx3SBZe4poh/dhoIJe2iOybsaCug837d
         c6lXDGxSecyvAU3b254cGsC9fQrM8onklRjsMmdMrRks0bCACK0R/jk43Zb9rZi5uejw
         +2u7LdQhiVLuEYana1Y/VzzlImtDEh0PXsnkwnJcRIpvmyZYSCrCCnUsE46V/eTR2cvR
         4ldoDXJuuUq0wS531B/l0YjNCNhxag6iU/kTncEZ8GmJCpFD4PJdilB64wMjP0uet3qL
         q4S/KNk0tb7fAGqgk50MyK6QQxbZGWSyXEAG093Aj1xBOTWW7AXdmYc2Xzj6O4jm3iMi
         pYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761107999; x=1761712799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gcIWpCfhJL6hBxoRz2avBVbdzuoekMr6bFmgI7HFrU=;
        b=hQ5ZGOQpGSYIHdO0cvSMAECu8C170eA2ei0nf7z4KogYOUWpwgYRp7WdV9MltuWrnN
         DPpY2B8oXERULImAZtnxcB+hjIl+ZdzbbhVk4PaPRENNlngOeSpgBRhNqcYs6YFKf4y/
         E1XGBSzBSlpSyLoHouhrIumRZF5L4BIw0T9PbcVoMlUhEQIQoZd+Gyahq2tOz7VBEBcf
         TSVPL41pq3cg5BTfCQFQKl4hAw6Rf2skZ53H8Qv+BObYT4WnTKrDGb4INEIWgYH4Wf+l
         d5CSAVq2kufAD0ditKa3PEqQpyEGsoJ2EqdmVhAZTHLG53vFMfqsufBZOnRr0AwmH5Xb
         7xkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcFuWYBnsO4NNtmxPJy2An76tuAMKRm+BO0KmCLrqtBdcMkVN4TnckeyyNWJYuF2HElFwCZMwSYy2I2phPNtawKFtBlw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlKs7Y/2DFuWn3+pAOq3upjx92sptlQF9FQGZbaZRLCHZPK7ig
	O/TxSJImblr7Z8dy8CzNJbBB1J50eV6AhFoPS48WWGXPP/ZmTno+XiDGCpNjtGi0RMim77MghTo
	HLAq5OysVmB2WrXg+k7yQyOjadB+HTyY=
X-Gm-Gg: ASbGncuSbRJTYLj0AH+EoCWkk4nGwN/mYli7F/OwUhxzijZDP8U/FO+pvfKKKzjhlj5
	9KDeInDYAVlHbGZ8m4a0YRdlAiDJfN15ldpk/U0gECa8RSn0xvxth67LzbeSDR+OW6IpV2WX0wx
	bVyzXM+GkgGYkA4M/1yp7pJ8UUF7pD17Ne6rpLkIa3A9oBFErKkxju+gjv5qkS2Zkl/m+JjmbPT
	mxkimZMx7/QajzeWkfhQFobt3BJ+315gT8EUUm5nt+nCra2ucWr746fmRthA6+vhpNGLIBPsaNx
	+EH1qDlRxRJOnZ8=
X-Google-Smtp-Source: AGHT+IHSd/93IEd4Mf8dHK30aphVlqAdJCT0S+NEWOivhVENBOPgJ3/RAW4iofRgxNakg4DSTQa1CtVepWHOJJL4c04=
X-Received: by 2002:a05:6402:1ed6:b0:637:dfb1:3395 with SMTP id
 4fb4d7f45d1cf-63c1f62ac10mr20025277a12.8.1761107998484; Tue, 21 Oct 2025
 21:39:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251017042312.1271322-1-alistair.francis@wdc.com>
 <fe16288e-e3f2-4de3-838e-181bbb0ce3ee@suse.de> <CAKmqyKP0eB_WTZtMqtaNELPE4Bs9Ln-0U+_Oqk8fuJXTay_DPg@mail.gmail.com>
 <ddadb1f6-d7e9-427d-baf7-814d2288a407@suse.de>
In-Reply-To: <ddadb1f6-d7e9-427d-baf7-814d2288a407@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 22 Oct 2025 14:39:32 +1000
X-Gm-Features: AS18NWAoKKDrp8EpUQELmqxYplrpYxne55FmSrIQzh7JZ6Y-E7isTMxYgqwoeZA
Message-ID: <CAKmqyKOcuUtiv_9g07+8fU7VdAdsKZ2ufAtgarSz=j9H1YP4dA@mail.gmail.com>
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

On Tue, Oct 21, 2025 at 4:40=E2=80=AFPM Hannes Reinecke <hare@suse.de> wrot=
e:
>
> On 10/21/25 03:01, Alistair Francis wrote:
> > On Tue, Oct 21, 2025 at 3:46=E2=80=AFAM Hannes Reinecke <hare@suse.de> =
wrote:
> >>
> >> On 10/17/25 06:23, alistair23@gmail.com wrote:
> >>> From: Alistair Francis <alistair.francis@wdc.com>
> >>>
> >>> The TLS 1.3 specification allows the TLS client or server to send a
> >>> KeyUpdate. This is generally used when the sequence is about to
> >>> overflow or after a certain amount of bytes have been encrypted.
> >>>
> >>> The TLS spec doesn't mandate the conditions though, so a KeyUpdate
> >>> can be sent by the TLS client or server at any time. This includes
> >>> when running NVMe-OF over a TLS 1.3 connection.
> >>>
> >>> As such Linux should be able to handle a KeyUpdate event, as the
> >>> other NVMe side could initiate a KeyUpdate.
> >>>
> >>> Upcoming WD NVMe-TCP hardware controllers implement TLS support
> >>> and send KeyUpdate requests.
> >>>
> >>> This series builds on top of the existing TLS EKEYEXPIRED work,
> >>> which already detects a KeyUpdate request. We can now pass that
> >>> information up to the NVMe layer (target and host) and then pass
> >>> it up to userspace.
> >>>
> >>> Userspace (ktls-utils) will need to save the connection state
> >>> in the keyring during the initial handshake. The kernel then
> >>> provides the key serial back to userspace when handling a
> >>> KeyUpdate. Userspace can use this to restore the connection
> >>> information and then update the keys, this final process
> >>> is similar to the initial handshake.
> >>>
> >>
> >> I am rather sceptical at the current tlshd implementation.
> >> At which place do you update the sending keys?
> >
> > The sending keys are updated as part of gnutls_session_key_update().
> >
> > gnutls_session_key_update() calls update_sending_key() which updates
> > the sending keys.
> >
> > The idea is that when the sequence number is about to overflow the
> > kernel will request userspace to update the sending keys via the
> > HANDSHAKE_KEY_UPDATE_TYPE_SEND key_update_type. Userspace updates the
> > keys and initiates a KeyUpdate.
> >
> That's also what the spec says.
> But in order to do that we would need to get hold of the sequence
> number, which currently is internal to gnutls.

The sequence number is in the kernel. After the handshake the kernel
takes over the TLS connection, so it's up to the kernel to detect a
sequence number overflow. My sending KeyUpdate patches do this, but
they aren't included in this series.

> Can we extract it from the session information?

gnutls can export the sequence number, but as above it doesn't
actually know the correct value (after the handshake).

> And can we display it in sysfs, to give users information
> whether a KeyUpdate had happened?

I don't think that's a good idea. Writing the sequence number to sysfs
seems like extra overhead in the TLS fast path. On top of that I don't
see why userspace cares or what it can do with the number

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

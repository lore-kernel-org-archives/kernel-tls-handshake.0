Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89799261B70
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Oct 2025 23:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761176887; cv=none; b=U6bALrgLNv46FXyr34u2VZgsHaKhMSaXvOvdV39W6eENZHIUDi6KxHFAkGwAUXslVFjFjDZHL2opwTLI3KAFSE5gJfz9iGmbvN3N+dySkTvPtEAdQK4QThxWg5Hg3u3KsyFK8oNaj8qFvyjgO5VUgjijGGhHd05Piiux5r87YAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761176887; c=relaxed/simple;
	bh=5WC3d0KpMF9e1+s5VMDuJD8IYrVBfMCqdA+27vs3t+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1yG6N8mlhde0LWtEkWBNKGFJvv6UxHa1gbemxrhVdz5PORaBRJUf7FR7NYMGS1yg/hiYyEPZAiiIgG0DMd8GgsnhPyNfXSSbrWSpfb8chegMn1H6HCHe3+UAovXUovsnmk1lmneZRyllEKCzhs8OiUA2EufU36kVqT4n7x1xdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFJlov6g; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFJlov6g"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-63b9da57cecso262219a12.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Oct 2025 16:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761176883; x=1761781683; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8mc7PEqKOdaKhhTWaiaacMdTM34oWGDw4sC0YwwFDk=;
        b=JFJlov6gROMo9O04h0ay+iQ9P1iRIxruohbNSwZPcK+sKKqhhbJGeS5LZrCZg7VZ33
         I4SI2br3nny9SKaVBl1w9YV15syePa9bhmupVYx8mSm+1qOCkdlGWVRZ6E89Q4mSY8k1
         WxEi7aclod67DejLxhlXJPUr7xJlRGJYInmnxjFKgBTfQzD2TX/FyQlJnnElGAYQRJnm
         qfeXiVJvj4nH3TKSgglL16PsKFo76+rzC9M0bHAi9xZh6xO7f8jFZRLLa4xPyIHUOVFH
         JzmJLi3DHvZs4/eZ/6yZ63V37k2/mCZiM08tjEBfr42XvUISy2PI83VBUngId5VIjQ36
         axig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761176883; x=1761781683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8mc7PEqKOdaKhhTWaiaacMdTM34oWGDw4sC0YwwFDk=;
        b=vvzYr1oQd4ptelBHl8mzYsW0LbvKzlfqPswdeT0KoKfhnKMMqmqYDCuEzSqDF2wr+5
         vSmnof2n6i2vkdP//c5EAx5ZGp5oUXPXnmNuQ2JXEAlMdbCBgtcusoIQlfOB86ni3f16
         QdnahXU+wJH+8wlhJWoT9gMSaHzCnnC5f6onOl4rUKgYLYnZRqGXuCCVeJO5mitUgOnF
         bwb+zcOlJ5BnKPjhivYjzozqsv8B2yyySswC2eL85v0bkBxrmdjTurm1OqBD8TI3RxC0
         W3fNFbru1svexD1e5r4ctKmr6AFnPtPpbH73lGIVgOGEWWBvqazJ3mHUgNJPXOf0sGX4
         AK+w==
X-Forwarded-Encrypted: i=1; AJvYcCVJNVvii0SjDUv1yQ6gbBfljN83rqH5JloMZDHmEe/FLEUi4Wva0LJ9ZGfjBGKiKmVxfEzgCQciH0yCLJuo8fV2t7UV9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHcOuqTF1mmp0ZYEo6sx83XOvnkI1Vg+JCJBoHQZp8FvLLhOta
	3gndd+oYEkxOIk9vi+FrdRDnzu6H+1bH1r8NL2GGcTQrApN8RuD4QFE/y2Xfh+nTUR3bbLq563e
	hexbgHfN2aBUurZ8CURjGXzmrLTriJKw=
X-Gm-Gg: ASbGncs8ZXkMw+0MOGYLWWlX+76v5WzVlJ8nUm7AMajSKe5weC7KqYkbG1s5/fRHTmp
	LfZAwgsZl6N8nhlI4ylL83LsdN9mbT+Cc1tQ3DEfT1rWXs4CNQd1dAsetze51OjLAI9b3+12C7L
	owX+NxFPosD8U1YcB9243OYpTcncg751YTpT44853U5CGrGzx4UTjnOGw/nem81hhUF6M4M4Rgg
	kpVyfGUkQSWywsvrdv65Y5/ouza+Pw6WooYVWevLksno3dIVSZshRWat89o8xo8Wi2wRtkuhSIX
	wFL4I3OFomER8tE=
X-Google-Smtp-Source: AGHT+IFPvjCt3lhgdIMR/r39w4zk8tY3v7Ryh/JdZW1xA1CBJlkaCdErToOC3Wg0Fzc0bAc9ofaTJC6DzyBMlI3b854=
X-Received: by 2002:aa7:c958:0:b0:636:a789:beb9 with SMTP id
 4fb4d7f45d1cf-63c1f6dc078mr15321500a12.37.1761176882672; Wed, 22 Oct 2025
 16:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251017042312.1271322-1-alistair.francis@wdc.com>
 <20251017042312.1271322-5-alistair.francis@wdc.com> <e7d46c17-5ffd-4816-acd2-2125ca259d20@suse.de>
 <CAKmqyKMsYUPLz9hVmM_rjXKSo52cMEtn8qVwbSs=UknxRWaQUw@mail.gmail.com>
 <CAKmqyKNSV1GdipOrOs3csyoTMKX1+mxTgxnOq9xnb3vmRN0RgA@mail.gmail.com> <7afb2fc0-0da5-4539-a1a4-87360186cf65@suse.de>
In-Reply-To: <7afb2fc0-0da5-4539-a1a4-87360186cf65@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 23 Oct 2025 09:47:36 +1000
X-Gm-Features: AS18NWAK6TMWNZNySx8pysumGySsDeNzwXFu97eObXc75NSy-iZ6pjnX1U1P9V0
Message-ID: <CAKmqyKPuESAp3nGJNDSw13_TnQLtfjSEAUdFyKrtww46ytJdEw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] net/handshake: Support KeyUpdate message types
To: Hannes Reinecke <hare@suse.de>
Cc: chuck.lever@oracle.com, hare@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org, kbusch@kernel.org, 
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 5:03=E2=80=AFPM Hannes Reinecke <hare@suse.de> wrot=
e:
>
> On 10/22/25 06:40, Alistair Francis wrote:
> > On Tue, Oct 21, 2025 at 1:19=E2=80=AFPM Alistair Francis <alistair23@gm=
ail.com> wrote:
> >>
> >> On Mon, Oct 20, 2025 at 4:09=E2=80=AFPM Hannes Reinecke <hare@suse.de>=
 wrote:
> >>>
> >>> On 10/17/25 06:23, alistair23@gmail.com wrote:
> >>>> From: Alistair Francis <alistair.francis@wdc.com>
> >>>>
> [ .. ]>>>> @@ -372,6 +384,44 @@ int tls_client_hello_psk(const struct
> tls_handshake_args *args, gfp_t flags)
> >>>>    }
> >>>>    EXPORT_SYMBOL(tls_client_hello_psk);
> >>>>
> >>>> +/**
> >>>> + * tls_client_keyupdate_psk - request a PSK-based TLS handshake on =
a socket
> >>>> + * @args: socket and handshake parameters for this request
> >>>> + * @flags: memory allocation control flags
> >>>> + * @keyupdate: specifies the type of KeyUpdate operation
> >>>> + *
> >>>> + * Return values:
> >>>> + *   %0: Handshake request enqueue; ->done will be called when comp=
lete
> >>>> + *   %-EINVAL: Wrong number of local peer IDs
> >>>> + *   %-ESRCH: No user agent is available
> >>>> + *   %-ENOMEM: Memory allocation failed
> >>>> + */
> >>>> +int tls_client_keyupdate_psk(const struct tls_handshake_args *args,=
 gfp_t flags,
> >>>> +                          handshake_key_update_type keyupdate)
> >>>> +{
> >>>> +     struct tls_handshake_req *treq;
> >>>> +     struct handshake_req *req;
> >>>> +     unsigned int i;
> >>>> +
> >>>> +     if (!args->ta_num_peerids ||
> >>>> +         args->ta_num_peerids > ARRAY_SIZE(treq->th_peerid))
> >>>> +             return -EINVAL;
> >>>> +
> >>>> +     req =3D handshake_req_alloc(&tls_handshake_proto, flags);
> >>>> +     if (!req)
> >>>> +             return -ENOMEM;
> >>>> +     treq =3D tls_handshake_req_init(req, args);
> >>>> +     treq->th_type =3D HANDSHAKE_MSG_TYPE_CLIENTKEYUPDATE;
> >>>> +     treq->th_key_update_request =3D keyupdate;
> >>>> +     treq->th_auth_mode =3D HANDSHAKE_AUTH_PSK;
> >>>> +     treq->th_num_peerids =3D args->ta_num_peerids;
> >>>> +     for (i =3D 0; i < args->ta_num_peerids; i++)
> >>>> +             treq->th_peerid[i] =3D args->ta_my_peerids[i];
> >>> Hmm?
> >>> Do we use the 'peerids'?
> >>
> >> We don't, this is just copied from the
> >> tls_client_hello_psk()/tls_server_hello_psk() to provide the same
> >> information to keep things more consistent.
> >>
> >> I can remove setting these
> >
> > Actually, ktls-utils (tlshd) expects these to be set, so I think we
> > should leave them as is
> >
>
> Can't we rather fix up tlshd?
> It feels really pointless, erroring out on values which are completely
> irrelevant for the operation...

It's not that simple.

For example when we call "done" for a handshake or KeyUpdate we call
tls_handshake_done() in the kernel, which calls
tls_handshake_remote_peerids(). So the kernel expects the remote
peerids to be set.

I think there's a lot of value in re-using the existing flows (as a
KeyUpdate is similar to a handshake), but the existing flows expect
remote peerids to be set. We could duplicate everything just to remove
that requirement, but I don't think that's the right approach.

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

Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338A52522A7
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 14 Nov 2025 03:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091889; cv=none; b=Tf8RO2CXBbFTRUR/Z15XgP0NbjOwi5dsLpVXRQiKyd5ZkOcUFROxPIAApy2XW69SEpRskq4dYfdTQhAgTEcQ8exv/x45jsHoh2IRqPidPrRubEUVT0KZan6GQGAyucnU6bZjS/iCSfXllItLaJYMq74V+R6XnK8L/zYQOsDWrQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091889; c=relaxed/simple;
	bh=HfUdRnYR5OSZGlucD4l0cXr2QpMS0rVTqK8miUgIcn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ow3oK4gBonb2n2HChJKtBBTSmailHF2iXl19nK8hWohhqB8SCgGjNaSja9TMeMPPhckLKzheMw0lmTumqLcITqcJ6vwZLlv4o2LbVxR0SH5b/gK9Bl9u4F6L1ABRtd8mMswP8tpeeCsNi4V/AUAaKmlL/2FyUqU6gGH0wtvMCec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/le305i; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/le305i"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b725ead5800so191069266b.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 13 Nov 2025 19:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763091885; x=1763696685; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6mtqdCrs5s13DdsY7nLARbcmjZ6uHESPgGUhdIcOCQ=;
        b=k/le305i6dcEM+AQcIE6xymu4QY+PPPJ6lkiu7fNvqLEW1BatyKi12t30z/3s7lIlH
         Fu2ySVYYFfRpB81kT9wAzDdk1GbktqwH0xdsrc4+qTLLzLvGChe6turaIn3NMBpobFqa
         3GoASrJqhfr6ZL/uv9GTFFcolMg55bdmjPK6dK4BsGJ9B1TA3Ecem/TgAqLeNJJN6GDM
         W5+fXxIMRcQpPuIairwGVQrj/LopxCjycysyKrQEVPUtjoTJXYVV3WOHWxp7DVvG+SIT
         nmg1r++memx0lC1TFwMG0RlDC6n1g4h2RNOH+cyOf765QjGUnPyNU/qHuaCKoRaUHRZH
         nQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091885; x=1763696685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W6mtqdCrs5s13DdsY7nLARbcmjZ6uHESPgGUhdIcOCQ=;
        b=tWkZkHquq5sf93A0NTNg1DzeGu+RGXrlf+N0CQBfhV6AS9Op3Y1KqdiR5kgL3iM+ml
         Zty2lY4rPXzoq64YogyofvOFg/LoE5QScOqee0XmhYhNUcBfpIRC/PVVRhHoXEQ42w3F
         9os9864J1CaKxje8J4AF/TBhOqV7/Vl6nVEwLQbF4t3OeKN25O+UAIfdI8c61pWAg60Q
         SDklSiG4QvSMi3mYns9fSe5OzYezFml3tUTtj/vQMBRhIQY22ldWshsajoSfT7WyRQ6x
         uiAoOYo4sRnxng9ABizdC8poOwk5eJWamcRBoKGQ+F3Pb0+7e1rfENQ2iaUSI8PawNtT
         cteg==
X-Forwarded-Encrypted: i=1; AJvYcCVAgobARJM1l8SJrv3pPLCBTlS+4+Qu7FhouwxdGDm5xhixCE2UzBDl+d497+stsA7PMtPIBKfBBSXigR2f69oz4y5lrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhFnGhk4wXhxKrN5vG6lJtk3iF6ujGgIT/CvRm60hoOQYJvAyr
	d2PfKY8GpCyQ5MwKJdYwmq+6Yg3d0CsewQ8DOkfqrKdJs1gHhcXmaLzordysFTNAPGi3M0/BhqO
	Fkforx1Playu3jW15aHYRrCP1AHXVC64=
X-Gm-Gg: ASbGnctfaiXPo5BzJjSljbttiy2TqJY4ztATrLM9sGEQ3Exbzx/Cpyn5yA4TMC1QNR+
	U6LzNyW2ye72JsFh3FeRv8SJL/3Pb3U2AH+ZFf0XePsdD+PbAzfDjViKziI8RCQNerDDpveiVRB
	OzC6dXG1KE9AwAkQU24X/Zx3KzE1lm9y7Vk2HPGsmlG01T5oTBV7lyBOU7RCMGjxCtOuPfrCrVk
	W8dMmIQxPaSUwKbKzwWt6jII3qQjz9aF+ksK+UU/U6iqJrhaWraY5Z8gb3H63kCE8hOlN86U+sx
	8iSlelEpH0J3OhY=
X-Google-Smtp-Source: AGHT+IFeY6ExbhnLix/V8V2HiLoJfg49zjUIkHAqrWQ16NjMplNdRqeUyyg/UCDy4n1WKY6+b/r4V6jK0pS5c2c7MTg=
X-Received: by 2002:a17:907:7fa9:b0:b70:7d61:b8a5 with SMTP id
 a640c23a62f3a-b7367b6f8afmr165505566b.62.1763091885372; Thu, 13 Nov 2025
 19:44:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251112042720.3695972-1-alistair.francis@wdc.com>
 <20251112042720.3695972-3-alistair.francis@wdc.com> <49bbe54a-4b55-48a7-bfb4-30a222cb7d4f@oracle.com>
 <CAKmqyKN4SN6DkjaRMe4st23Xnc3gb6DcqUGHi72UTgaiE9EqGw@mail.gmail.com>
 <0d77853e-7201-47c4-991c-bb492a12dd29@oracle.com> <13cf56a7-31fa-4903-9bc2-54f894fdc5ed@oracle.com>
In-Reply-To: <13cf56a7-31fa-4903-9bc2-54f894fdc5ed@oracle.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 14 Nov 2025 13:44:18 +1000
X-Gm-Features: AWmQ_bkh-hR1xTkgsN4bcSSt81jUJ1aCCzsHDAZD7xu3wz-1oUVwA9mDnPBItVQ
Message-ID: <CAKmqyKObzFKHoW3_wry6=8GuDBdJiKQPE6LWPOUHebwGOH2PJA@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] net/handshake: Define handshake_sk_destruct_req
To: Chuck Lever <chuck.lever@oracle.com>
Cc: hare@kernel.org, kernel-tls-handshake@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-nfs@vger.kernel.org, kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, 
	sagi@grimberg.me, kch@nvidia.com, hare@suse.de, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 12:37=E2=80=AFAM Chuck Lever <chuck.lever@oracle.co=
m> wrote:
>
> On 11/13/25 9:01 AM, Chuck Lever wrote:
> > On 11/13/25 5:19 AM, Alistair Francis wrote:
> >> On Thu, Nov 13, 2025 at 1:47=E2=80=AFAM Chuck Lever <chuck.lever@oracl=
e.com> wrote:
> >>>
> >>> On 11/11/25 11:27 PM, alistair23@gmail.com wrote:
> >>>> From: Alistair Francis <alistair.francis@wdc.com>
> >>>>
> >>>> Define a `handshake_sk_destruct_req()` function to allow the destruc=
tion
> >>>> of the handshake req.
> >>>>
> >>>> This is required to avoid hash conflicts when handshake_req_hash_add=
()
> >>>> is called as part of submitting the KeyUpdate request.
> >>>>
> >>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >>>> Reviewed-by: Hannes Reinecke <hare@suse.de>
> >>>> ---
> >>>> v5:
> >>>>  - No change
> >>>> v4:
> >>>>  - No change
> >>>> v3:
> >>>>  - New patch
> >>>>
> >>>>  net/handshake/request.c | 16 ++++++++++++++++
> >>>>  1 file changed, 16 insertions(+)
> >>>>
> >>>> diff --git a/net/handshake/request.c b/net/handshake/request.c
> >>>> index 274d2c89b6b2..0d1c91c80478 100644
> >>>> --- a/net/handshake/request.c
> >>>> +++ b/net/handshake/request.c
> >>>> @@ -98,6 +98,22 @@ static void handshake_sk_destruct(struct sock *sk=
)
> >>>>               sk_destruct(sk);
> >>>>  }
> >>>>
> >>>> +/**
> >>>> + * handshake_sk_destruct_req - destroy an existing request
> >>>> + * @sk: socket on which there is an existing request
> >>>
> >>> Generally the kdoc style is unnecessary for static helper functions,
> >>> especially functions with only a single caller.
> >>>
> >>> This all looks so much like handshake_sk_destruct(). Consider
> >>> eliminating the code duplication by splitting that function into a
> >>> couple of helpers instead of adding this one.
> >>>
> >>>
> >>>> + */
> >>>> +static void handshake_sk_destruct_req(struct sock *sk)
> >>>
> >>> Because this function is static, I imagine that the compiler will
> >>> bark about the addition of an unused function. Perhaps it would
> >>> be better to combine 2/6 and 3/6.
> >>>
> >>> That would also make it easier for reviewers to check the resource
> >>> accounting issues mentioned below.
> >>>
> >>>
> >>>> +{
> >>>> +     struct handshake_req *req;
> >>>> +
> >>>> +     req =3D handshake_req_hash_lookup(sk);
> >>>> +     if (!req)
> >>>> +             return;
> >>>> +
> >>>> +     trace_handshake_destruct(sock_net(sk), req, sk);
> >>>
> >>> Wondering if this function needs to preserve the socket's destructor
> >>> callback chain like so:
> >>>
> >>> +       void (sk_destruct)(struct sock sk);
> >>>
> >>>   ...
> >>>
> >>> +       sk_destruct =3D req->hr_odestruct;
> >>> +       sk->sk_destruct =3D sk_destruct;
> >>>
> >>> then:
> >>>
> >>>> +     handshake_req_destroy(req);
> >>>
> >>> Because of the current code organization and patch ordering, it's
> >>> difficult to confirm that sock_put() isn't necessary here.
> >>>
> >>>
> >>>> +}
> >>>> +
> >>>>  /**
> >>>>   * handshake_req_alloc - Allocate a handshake request
> >>>>   * @proto: security protocol
> >>>
> >>> There's no synchronization preventing concurrent handshake_req_cancel=
()
> >>> calls from accessing the request after it's freed during handshake
> >>> completion. That is one reason why handshake_complete() leaves comple=
ted
> >>> requests in the hash.
> >>
> >> Ah, so you are worried that free-ing the request will race with
> >> accessing the request after a handshake_req_hash_lookup().
> >>
> >> Ok, makes sense. It seems like one answer to that is to add synchronis=
ation
> >>
> >>>
> >>> So I'm thinking that removing requests like this is not going to work
> >>> out. Would it work better if handshake_req_hash_add() could recognize
> >>> that a KeyUpdate is going on, and allow replacement of a hashed
> >>> request? I haven't thought that through.
> >>
> >> I guess the idea would be to do something like this in
> >> handshake_req_hash_add() if the entry already exists?
> >>
> >>     if (test_and_set_bit(HANDSHAKE_F_REQ_COMPLETED, &req->hr_flags)) {
> >>         /* Request already completed */
> >>         rhashtable_replace_fast(...);
> >>     }
> >>
> >> I'm not sure that's better. That could possibly still race with
> >> something that hasn't yet set HANDSHAKE_F_REQ_COMPLETED and overwrite
> >> the request unexpectedly.
> >>
> >> What about adding synchronisation and keeping the current approach?
> >> From a quick look it should be enough to just edit
> >> handshake_sk_destruct() and handshake_req_cancel()
> >
> > Or make the KeyUpdate requests somehow distinctive so they do not
> > collide with initial handshake requests.

Hmmm... Then each KeyUpdate needs to be distinctive, which will
indefinitely grow the hash table

>
> Another thought: expand the current _req structure to also manage
> KeyUpdates. I think there can be only one upcall request pending
> at a time, right?

There should only be a single request pending per queue.

I'm not sure I see what we could do to expand the _req structure.

What about adding `HANDSHAKE_F_REQ_CANCEL` to `hr_flags_bits` and
using that to ensure we don't free something that is currently being
cancelled and the other way around?

Alistair

>
>
> --
> Chuck Lever

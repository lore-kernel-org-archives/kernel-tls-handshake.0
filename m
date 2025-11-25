Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFF81D90DD
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 25 Nov 2025 05:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764046853; cv=none; b=mJQ59oJ66y7tLgjjstOnW0fzsrmxWDso6ZOp3Njeu1+uPEVwkFBamLGt7FxmwvY0PacF8SQEpxSEkGFG6pdbqRcTzhJHMRlDbfN2GCHRwPisDm/T9taQAfb0THF8krf/3DzLSvkdAws2thg7p5RJ4x+BA59nsYQo4a3PJtwB1SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764046853; c=relaxed/simple;
	bh=UUrSmgHt6QsHAb4josEXRjRvT7n3oY+lZntIv7c98+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oX52P8Mj7sKjZGD4WNMYaVhgd+iBhZ76oEErVu6mN2I1ajNJDF1AGZScrneHGlu0CaNZJef3Iyj/Sahzk9Yjt/2Ar4MUhRqCmyGwJ8dVEeaEwDMTY7wiJ84eMjC2z4lKSbCwc9nmZPrv66N53Q5ykYf/sUdqD7E9HI/b1GkBem8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSaVauTh; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSaVauTh"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b73875aa527so807226266b.3
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 24 Nov 2025 21:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764046849; x=1764651649; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgkEIaYmSIgN/j0r5dDRltCfW2UohQiH4qvD0keignk=;
        b=nSaVauThbBJhOzJVFyXlcTEWmBd2NYjH6pHcZKyVzp2xrG4gU85MTxnfVTbrn9gT8G
         EnPS2wWnm6UvHNd2Q45rd5do7bRzt/0wZGSvvgGJ5GgNIdsCUwESKCwNZWWJiiTXX4He
         i+k9TZCKHunLwhuHeVNqrqlhICTT4rYXFbeAWuTTGbuBQ/sVzfjtbECsiW2tfNAdvsAl
         KTp2h9GqMx9qi9eF524xdZOzynbm1+iRyiDI1kr0c/0CXKDJ/FhdEq33D8w8oAsUPvEB
         sZnDmhNXGDZRfetnEhs8iIKP1TAQAAzZV3NWmSRgMMsisNG1V2yCR9O+97OTH6BCxkLb
         p1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764046849; x=1764651649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RgkEIaYmSIgN/j0r5dDRltCfW2UohQiH4qvD0keignk=;
        b=G3EjVOI1XH8tBc1gchSlDZ/9Xm+8wdYt6ZlSmM/DLWNed1/ELaFq/yuEVPm941wJMo
         zqD13qr61fr8PHF7NgzihViNd2PFo8787/E/GlWkcx0fOmgTMulrBFEVaXcu3+9gJF0j
         +IsYK8iD/39PGX4CGYCuGiL4m2nlwf4teer3E+kC9TL0li2AhuVY4AZ6337n31+XK8Yi
         JqViW2TrKId5xHWDgHQ/C5stOTpjINIqTwP1LwhMzQlxw/5mFzKRrPPeYTRuHfUr9YsE
         GJMu/edJDlR8MaByMXj9iGH7cM9JGR0AlcMVdzCihbE75XVdqp8TorrFlK9k6xhdKxXA
         Mx4g==
X-Forwarded-Encrypted: i=1; AJvYcCXdASui6vg/1xYOSCKtKc+BICBy55Mr4apVjsEED/R8QFvRddPlfZZgwl12h9tm1vaTeKvzUYQXxoPIzVxSaRAedBQEew==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5wxXbSq9hcVVa8hRYCc4+kH9rdL5y8XEjw+ax2jpAM39EhUO0
	Dopht9vaypzGfyEY4WJJftvlQ9o3jIO2CyO2cNOPM4wfHPHwhylyt3rPiDH5+gZ52ZhONi2h6Hm
	MRIW+Gjd2PdHQjhq9FWGwZcV0ElscQpY=
X-Gm-Gg: ASbGncv9EJdwZUC6PfpsDe96Eg0yP2F63syYi/zagBMY7bFNkcHgwaFl/atp4gt4s0g
	tDoYnnqyYyYru8RXHIhrHsv9WEEPCv+vsEAC9iaAsb3VQsSoJKa/Fmvu4sGsHR4c/yxNVC98guw
	MqhpSO+QL91cfmWrTz1qvx6t00F+URQAV0EQAMXSrGvgsY2rNXobNSjrSyB+aWDYIRDnAxEcWtD
	mcrSg1ZfL3EdkD9n7TJSOqna2ZY55RLcEFzyQtMZ/s/0GYUw9hJMnMVuC5qkVwSZ5WZYO5nKIka
	6qDUgSJDQMuPRlEC/ONyg6XB3kxrjjdoYcXu
X-Google-Smtp-Source: AGHT+IHlaXfGjOGCpgIzKRFn/PG3VXXHLz6/IwU5ZevNl3k4vvBiVkhNC4X8bL+NhWCjlFdBgdmMptIXWPYRrY2i67A=
X-Received: by 2002:a17:906:181b:b0:b76:bfa9:5ae7 with SMTP id
 a640c23a62f3a-b76bfa95b6amr192759466b.29.1764046848703; Mon, 24 Nov 2025
 21:00:48 -0800 (PST)
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
 <CAKmqyKObzFKHoW3_wry6=8GuDBdJiKQPE6LWPOUHebwGOH2PJA@mail.gmail.com>
 <1cc19e43-26b4-4c38-975e-ab29e0e52168@oracle.com> <CAKmqyKMjZWAvbc23JQ358kyWyJ0ZajHd8o0eFgF-i1eXX85-jA@mail.gmail.com>
 <14f4ee67-d1dc-4eb0-a677-9472a36ae3bc@oracle.com>
In-Reply-To: <14f4ee67-d1dc-4eb0-a677-9472a36ae3bc@oracle.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 25 Nov 2025 15:00:21 +1000
X-Gm-Features: AWmQ_bkgAASdqK_4byjwJ9DXTwVH0wYVdnA1PBPJyGs2R0SyTlWoIYyHqbjO9pk
Message-ID: <CAKmqyKNJ3BsooptPxMAhrhQZnCVaq_gnnhCrv66+eoTpWvpOww@mail.gmail.com>
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

On Thu, Nov 20, 2025 at 11:51=E2=80=AFPM Chuck Lever <chuck.lever@oracle.co=
m> wrote:
>
> On 11/18/25 7:45 PM, Alistair Francis wrote:
> > On Sat, Nov 15, 2025 at 12:14=E2=80=AFAM Chuck Lever <chuck.lever@oracl=
e.com> wrote:
> >>
> >> On 11/13/25 10:44 PM, Alistair Francis wrote:
> >>> On Fri, Nov 14, 2025 at 12:37=E2=80=AFAM Chuck Lever <chuck.lever@ora=
cle.com> wrote:
> >>>>
> >>>> On 11/13/25 9:01 AM, Chuck Lever wrote:
> >>>>> On 11/13/25 5:19 AM, Alistair Francis wrote:
> >>>>>> On Thu, Nov 13, 2025 at 1:47=E2=80=AFAM Chuck Lever <chuck.lever@o=
racle.com> wrote:
> >>>>>>>
> >>>>>>> On 11/11/25 11:27 PM, alistair23@gmail.com wrote:
> >>>>>>>> From: Alistair Francis <alistair.francis@wdc.com>
> >>>>>>>>
> >>>>>>>> Define a `handshake_sk_destruct_req()` function to allow the des=
truction
> >>>>>>>> of the handshake req.
> >>>>>>>>
> >>>>>>>> This is required to avoid hash conflicts when handshake_req_hash=
_add()
> >>>>>>>> is called as part of submitting the KeyUpdate request.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >>>>>>>> Reviewed-by: Hannes Reinecke <hare@suse.de>
> >>>>>>>> ---
> >>>>>>>> v5:
> >>>>>>>>  - No change
> >>>>>>>> v4:
> >>>>>>>>  - No change
> >>>>>>>> v3:
> >>>>>>>>  - New patch
> >>>>>>>>
> >>>>>>>>  net/handshake/request.c | 16 ++++++++++++++++
> >>>>>>>>  1 file changed, 16 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/net/handshake/request.c b/net/handshake/request.c
> >>>>>>>> index 274d2c89b6b2..0d1c91c80478 100644
> >>>>>>>> --- a/net/handshake/request.c
> >>>>>>>> +++ b/net/handshake/request.c
> >>>>>>>> @@ -98,6 +98,22 @@ static void handshake_sk_destruct(struct sock=
 *sk)
> >>>>>>>>               sk_destruct(sk);
> >>>>>>>>  }
> >>>>>>>>
> >>>>>>>> +/**
> >>>>>>>> + * handshake_sk_destruct_req - destroy an existing request
> >>>>>>>> + * @sk: socket on which there is an existing request
> >>>>>>>
> >>>>>>> Generally the kdoc style is unnecessary for static helper functio=
ns,
> >>>>>>> especially functions with only a single caller.
> >>>>>>>
> >>>>>>> This all looks so much like handshake_sk_destruct(). Consider
> >>>>>>> eliminating the code duplication by splitting that function into =
a
> >>>>>>> couple of helpers instead of adding this one.
> >>>>>>>
> >>>>>>>
> >>>>>>>> + */
> >>>>>>>> +static void handshake_sk_destruct_req(struct sock *sk)
> >>>>>>>
> >>>>>>> Because this function is static, I imagine that the compiler will
> >>>>>>> bark about the addition of an unused function. Perhaps it would
> >>>>>>> be better to combine 2/6 and 3/6.
> >>>>>>>
> >>>>>>> That would also make it easier for reviewers to check the resourc=
e
> >>>>>>> accounting issues mentioned below.
> >>>>>>>
> >>>>>>>
> >>>>>>>> +{
> >>>>>>>> +     struct handshake_req *req;
> >>>>>>>> +
> >>>>>>>> +     req =3D handshake_req_hash_lookup(sk);
> >>>>>>>> +     if (!req)
> >>>>>>>> +             return;
> >>>>>>>> +
> >>>>>>>> +     trace_handshake_destruct(sock_net(sk), req, sk);
> >>>>>>>
> >>>>>>> Wondering if this function needs to preserve the socket's destruc=
tor
> >>>>>>> callback chain like so:
> >>>>>>>
> >>>>>>> +       void (sk_destruct)(struct sock sk);
> >>>>>>>
> >>>>>>>   ...
> >>>>>>>
> >>>>>>> +       sk_destruct =3D req->hr_odestruct;
> >>>>>>> +       sk->sk_destruct =3D sk_destruct;
> >>>>>>>
> >>>>>>> then:
> >>>>>>>
> >>>>>>>> +     handshake_req_destroy(req);
> >>>>>>>
> >>>>>>> Because of the current code organization and patch ordering, it's
> >>>>>>> difficult to confirm that sock_put() isn't necessary here.
> >>>>>>>
> >>>>>>>
> >>>>>>>> +}
> >>>>>>>> +
> >>>>>>>>  /**
> >>>>>>>>   * handshake_req_alloc - Allocate a handshake request
> >>>>>>>>   * @proto: security protocol
> >>>>>>>
> >>>>>>> There's no synchronization preventing concurrent handshake_req_ca=
ncel()
> >>>>>>> calls from accessing the request after it's freed during handshak=
e
> >>>>>>> completion. That is one reason why handshake_complete() leaves co=
mpleted
> >>>>>>> requests in the hash.
> >>>>>>
> >>>>>> Ah, so you are worried that free-ing the request will race with
> >>>>>> accessing the request after a handshake_req_hash_lookup().
> >>>>>>
> >>>>>> Ok, makes sense. It seems like one answer to that is to add synchr=
onisation
> >>>>>>
> >>>>>>>
> >>>>>>> So I'm thinking that removing requests like this is not going to =
work
> >>>>>>> out. Would it work better if handshake_req_hash_add() could recog=
nize
> >>>>>>> that a KeyUpdate is going on, and allow replacement of a hashed
> >>>>>>> request? I haven't thought that through.
> >>>>>>
> >>>>>> I guess the idea would be to do something like this in
> >>>>>> handshake_req_hash_add() if the entry already exists?
> >>>>>>
> >>>>>>     if (test_and_set_bit(HANDSHAKE_F_REQ_COMPLETED, &req->hr_flags=
)) {
> >>>>>>         /* Request already completed */
> >>>>>>         rhashtable_replace_fast(...);
> >>>>>>     }
> >>>>>>
> >>>>>> I'm not sure that's better. That could possibly still race with
> >>>>>> something that hasn't yet set HANDSHAKE_F_REQ_COMPLETED and overwr=
ite
> >>>>>> the request unexpectedly.
> >>>>>>
> >>>>>> What about adding synchronisation and keeping the current approach=
?
> >>>>>> From a quick look it should be enough to just edit
> >>>>>> handshake_sk_destruct() and handshake_req_cancel()
> >>>>>
> >>>>> Or make the KeyUpdate requests somehow distinctive so they do not
> >>>>> collide with initial handshake requests.
> >>>
> >>> Hmmm... Then each KeyUpdate needs to be distinctive, which will
> >>> indefinitely grow the hash table
> >>
> >> Two random observations:
> >>
> >> 1. There is only zero or one KeyUpdate going on at a time. Certainly
> >> the KeyUpdate-related data structures don't need to stay around.
> >
> > That's the same as the original handshake req though, which you are
> > saying can't be freed
> >
> >>
> >> 2. Maybe a separate data structure to track KeyUpdates is appropriate.
> >>
> >>
> >>>> Another thought: expand the current _req structure to also manage
> >>>> KeyUpdates. I think there can be only one upcall request pending
> >>>> at a time, right?
> >>>
> >>> There should only be a single request pending per queue.
> >>>
> >>> I'm not sure I see what we could do to expand the _req structure.
> >>>
> >>> What about adding `HANDSHAKE_F_REQ_CANCEL` to `hr_flags_bits` and
> >>> using that to ensure we don't free something that is currently being
> >>> cancelled and the other way around?
> >>
> >> A CANCEL can happen at any time during the life of the session/socket,
> >> including long after the handshake was done. It's part of socket
> >> teardown. I don't think we can simply remove the req on handshake
> >> completion.
> >
> > Does that matter though? If a cancel is issued on a freed req we just
> > do nothing as there is nothing to cancel.
>
> I confess I've lost a bit of the plot.

Ha, we are in the weeds a bit.

>
> I still don't yet understand why the req has to be removed from the
> hash rather than re-using the socket's existing req for KeyUpdates.

Basically we want to call handshake_req_submit() to submit a KeyUpdate
request. That will fail if there is already a request in the hash
table, in this case the request has been completed but not destroyed.

This patch is deconstructing the request on completion so that when we
perform a KeyUpdate the request doesn't exist. Which to me seems like
the way to go as we are no longer using the request, so why keep it
around.

You said that might race with cancelling the request
(handshake_req_cancel()), which I'm trying to find a solution to. My
proposal is to add some atomic synchronisation to ensure we don't
cancel/free a request at the same time.

You are saying that we could instead add a new function similar to
handshake_req_submit() that reuses the existing request. I was
thinking that would also race with handshake_req_cancel(), but I guess
it won't as nothing is being freed.

So you would prefer changing handshake_req_submit() to just re-use an
existing completed request for KeyUpdate?

Alistair

>
>
> --
> Chuck Lever

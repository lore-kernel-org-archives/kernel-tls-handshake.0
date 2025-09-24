Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58271C8CE
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 24 Sep 2025 01:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758678030; cv=none; b=JfPe7ESlCIQbE3EeosOfEnNw8ga7QQnOnev8QGrIaYC0yEggUs/hKGlPcce4wfbb2UO0Wyxtaa895X5UIU7+IKCciyZ95lYotZRwQmd85Kq/jsdpem7krfYtars178bAQbn71/pKkHrNdZXsOWwuxvkD8/vEyqtlE1lcsS/3NQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758678030; c=relaxed/simple;
	bh=W9rAwgWcWkTbaXixa9pNVaHFJRiK476vwOqZl0wgsV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gg0qLctgPLJe8IBGpS+FnMi8NvlaU4vWae0NDzOZkM426EilhZ0R35qsfyV9blsxXtxXpzwW6LdrI0JQ6h8sR1lcFs6cYyRgfC8DZ0RhxJH6RyjbMbSH0bh1vLNbBfIuKa8WDlSmDjfkFjIFylrq9DurehkzCxo0M7qSi0NqeC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ox1kYajf; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ox1kYajf"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so6367083b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Sep 2025 18:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758678028; x=1759282828; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eew0/oHgBDTv/UzZws2mBpuOon8G7ptEhbnxPBVDQ0=;
        b=Ox1kYajfCesCRSBWvJ1l8kXJd+Ny7iVvqqWSQTW1dS9rdpCb5jtEBC4FCcR1yQMxVT
         ZL1D335RVDemZ5axH14rKHfc0rcThHaHHKPQHwEbUoul8AYS3YlHKqn8R3OW905/9O7B
         p63ODRmqZuwte3SIoBb5PrvSPyKYg7Mk8YnsNmFMFFVNZhIgRdRIDCaWTxYq1Jedt9Gf
         O63wuxUsf/QtbaYNgjI/b60fgcobNcJofNTKz2C2tQRvpaMtedca3P2wyvf4f/mnDCP0
         9xHHz1gFttszO3KuEyFHIRNKbNCpFEO4CPDzjzTbp3YMp+lqCqVTnzdHiifgDjF5INts
         O/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758678028; x=1759282828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eew0/oHgBDTv/UzZws2mBpuOon8G7ptEhbnxPBVDQ0=;
        b=hVRHtHd7BtRv/XhgVzwUFbFK4B1z0RvuxNPyWlKV7nrYXSKJAuABzsKwqhoOWD91fe
         zgQvCoT+WXMQG6XwtmGIpyBAYzVkgra8SC7FET/uzdTbVSycksI5h027gVwTUlQJfUYq
         bvR0Xr+V7ETCQWJX1Vlgrp1MxiBq/ZLgjUcBGOUi+guTSc2Kc4IcTKJw1Y/vOYPx0gea
         yrE4Lt7RWpq6OarYfDLjUvdA1lq3wX1r5IUu+P1GJJFraJsS6aymw9YR23YBf5nl3e0v
         G8s5pqN4lrMr/U0kWuvbZJDuZPvnXDNb/kZtO4PuH4Gg/rui7WF5UQALittKDx+VAmVW
         edJw==
X-Forwarded-Encrypted: i=1; AJvYcCWRp0Q0kU/EBQb+1OuMTP6YWWWgQj/6YfvJwcWiOxRQfe2Lz4OO/hbFuxZ/Dca7N1/6W/G7nA1m/wlwbqq5NqWlgvB+uQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOGuBdnWbpAT/5WHHxusJ2GMT7rlsK1SqYIZCIIdNk6/DEqGzs
	Fp6UjOO3nWiGJR2zdJK3THCxgc495JUIdFZI3cPhURjc2zSV2hQhjuwowwZhchZC67XGR5njSmS
	OhrxKj9K6CYGcXu0umByPo2XLNyYEdfV1pn4K
X-Gm-Gg: ASbGncuCJdvZtjM5wBGvALyh2LD9G8k9sLjS0BfneeKTSELvJTPg3v3kR/7caW8cfFi
	IxmH4GPEpQXrDGXFIGE8rGAypXR2Xz1L13klLK/3AS/O2bEcCWc1aDKZLPVDWk0aUJ7xEuzIwXo
	2nMyz+sSDDON5LJ+shAEi+E8ux5KLKOQyXdyY/k7YC613bj9VYSco6wwX51DkgbrfXoM58GVVXD
	WKHfhojBg==
X-Google-Smtp-Source: AGHT+IGEdAWwoDnyAgxzZOGnzJ7cm+oy1+6tdhhLuOhTTSldnNc0wFITAkJ6yMl3cPbJ0wBZM38EyoQKAI2uUHSqSEg=
X-Received: by 2002:a17:902:ecce:b0:248:7018:c739 with SMTP id
 d9443c01a7336-27cc5434d29mr50152835ad.28.1758678027664; Tue, 23 Sep 2025
 18:40:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250922220710.1255102-1-cel@kernel.org> <c23cfb52-70ab-4dd0-b0cc-c83e42af60f3@oracle.com>
 <CADvbK_eRuUQ9ra4udyZfJ=PTY2xFR0jTUE9stPkMZD1teeEcOg@mail.gmail.com>
 <a806e5a2-739e-4ed7-b764-95f89da09250@oracle.com> <CADvbK_ebg0gScVUPzK8VieUzL7pKubgf4YqEahTQmYF9ZTn-vw@mail.gmail.com>
 <b5ccdf3c-3821-4608-bbe7-1d690da2b70b@oracle.com> <CADvbK_cVUHwx16Q_uQAoae5rLRkTZSZenQjgiP=3Nn-LUkUCAg@mail.gmail.com>
 <875cb069-d762-454a-b01e-26344a16050e@oracle.com>
In-Reply-To: <875cb069-d762-454a-b01e-26344a16050e@oracle.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 23 Sep 2025 21:40:15 -0400
X-Gm-Features: AS18NWCCtnoOF6MkwG9Sj-dMQ2OAyZuxFULViT2v4wYQUZSKx6Hbr989iGs6nRo
Message-ID: <CADvbK_cR+Kzoef1JH6JwO5nT0vkwTEXbDmVw7_GqWrDYUefyyw@mail.gmail.com>
Subject: Re: [PATCH] tlshd: Return errnos from QUIC helper functions
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Benjamin Coddington <bcodding@redhat.com>, kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 8:05=E2=80=AFPM Chuck Lever <chuck.lever@oracle.com=
> wrote:
>
> On 9/23/25 5:00 PM, Xin Long wrote:
> > On Tue, Sep 23, 2025 at 7:05=E2=80=AFPM Chuck Lever <chuck.lever@oracle=
.com> wrote:
> >>
> >> On 9/23/25 3:41 PM, Xin Long wrote:
> >>> On Tue, Sep 23, 2025 at 5:02=E2=80=AFPM Chuck Lever <chuck.lever@orac=
le.com> wrote:
> >>>>
> >>>> On 9/23/25 1:27 PM, Xin Long wrote:
> >>>>> On Tue, Sep 23, 2025 at 3:18=E2=80=AFPM Chuck Lever <chuck.lever@or=
acle.com> wrote:
> >>>>>>
> >>>>>> On 9/22/25 3:07 PM, Chuck Lever wrote:
> >>>>>>> From: Chuck Lever <chuck.lever@oracle.com>
> >>>>>>>
> >>>>>>> Static analysis tools have noticed that
> >>>>>>> tlshd_quic_serverhello_handshake() expects its helper functions t=
o
> >>>>>>> return errno values, but two of them return GNUTLS_E_* values in
> >>>>>>> most cases. Convert those functions to always return errno values
> >>>>>>> or zero (on success).
> >>>>>>>
> >>>>>>> Cc: Xin Long <lucien.xin@gmail.com>
> >>>>>>> Fixes: 43a15fed2f33 ("tlshd: add support for quic handshake")
> >>>>>>> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> >>>>>>> ---
> >>>>>>>  src/tlshd/server.c | 54 +++++++++++++++++++++++++++-------------=
------
> >>>>>>>  1 file changed, 32 insertions(+), 22 deletions(-)
> >>>>>>
> >>>>>> Xin -
> >>>>>>
> >>>>>> Looks like src/tlshd/quic.c has the same issue with conn->errcode.
> >>>>>> Callers expect an errno, but internally the utility functions set =
that
> >>>>>> field to a GNUTLS_E_ value.
> >>>>>>
> >>>>>> Can you apply this patch, fix up quic.c as well, and then test bot=
h and
> >>>>>> post the fixes here?
> >>>>>>
> >>>>> Sure.
> >>>>>
> >>>>> But conn->errcode is used to pass the err to parms->session_status.
> >>>>> What does parms->session_status expect? errno or GNUTLS_E_ value?
> >>>>
> >>>> session_status contains a positive errno or zero.
> >>>>
> >>>>
> >>>>> looking at tlshd_start_tls_handshake():
> >>>>>                 /* Any errors here should default to blocking acces=
s: */
> >>>>>                 parms->session_status =3D EACCES; <---
> >>>>>                 switch (ret) {
> >>>>>                 case GNUTLS_E_CERTIFICATE_ERROR:
> >>>>>                 case GNUTLS_E_CERTIFICATE_VERIFICATION_ERROR:
> >>>>>                         tlshd_log_cert_verification_error(session);
> >>>>>                         break;
> >>>>>                 case -ETIMEDOUT:
> >>>>>                         tlshd_log_gnutls_error(ret);
> >>>>>                         parms->session_status =3D -ret; <----
> >>>>>         parms->session_status =3D tlshd_initialize_ktls(session);
> >>>>>
> >>>>> It also seems mixed, no?
> >>>>
> >>>> The -ETIMEDOUT arm sets session_status to -ret. ret always contains =
the
> >>>> value -ETIMEDOUT in that arm, so -ret is ETIMEDOUT.
> >>>>
> >>>> This code comes from commit b010190cfed2 ("tlshd: Pass ETIMEDOUT fro=
m
> >>>> gnutls to kernel"). Passing -ETIMEDOUT directly to
> >>>> tlshd_log_gnutls_error() does seem a little bogus.
> >>>>
> >>>
> >>> Got it. I'm trying to align the QUIC err process with tls13 code.
> >>>
> >>> - tlshd_tls13_client_x509_handshake()
> >>> - tlshd_tls13_client_psk_handshake()
> >>>
> >>> - tlshd_tls13_server_x509_handshake()
> >>> - tlshd_tls13_server_psk_handshake()
> >>>
> >>> It seems to me that: When gnutls_xxx() returns errs in these function=
s,
> >>> it only logs them, and doesn't set any value to parms->session_status=
,
> >>> but sets it until tlshd_start_tls_handshake().
> >>>
> >>> So my suggestion is: not touch these functions for QUIC code:
> >>>
> >>> - tlshd_quic_client_set_x509_session()
> >>> - tlshd_quic_client_set_psk_session()
> >>>
> >>> - tlshd_quic_server_set_x509_session()
> >>> - tlshd_quic_server_set_psk_session()
> >>>
> >>> but change their callers tlshd_quic_client/serverhello_handshake():
> >>>
> >>> @@ -601,14 +599,10 @@ void tlshd_quic_serverhello_handshake(struct
> >>> tlshd_handshake_parms *parms)
> >>>                 ret =3D -EINVAL;
> >>>                 tlshd_log_debug("Unrecognized auth mode (%d)",
> >>> parms->auth_mode);
> >>>         }
> >>> -       if (ret) {
> >>> -               conn->errcode =3D -ret;
> >>> -               goto out;
> >>> +       if (!ret) {
> >>
> >>    if (ret =3D=3D GNUTLS_E_SUCCESSS) {
> >>
> >> is preferred.
> >>
> >>
> >>> +               tlshd_quic_start_handshake(conn);
> >>> +               parms->session_status =3D conn->errcode;
> >>>         }
> >>> -
> >>> -       tlshd_quic_start_handshake(conn);
> >>> -out:
> >>> -       parms->session_status =3D conn->errcode;
> >>>         tlshd_quic_conn_destroy(conn);
> >>
> >> We usually express the return code checking as
> >>
> >>    do something
> >>    if (error) {
> >>       error flow
> >>    }
> >>
> >> That's why the goto is in there. But I'll leave it up to you in
> >> the quic code.
> >>
> >>
> >>> and then in tlshd_quic_start_handshake(), keep the code setting
> >>> conn->errcode =3D errno, but set conn->errcode =3D EACCES for all
> >>> GNUTLS_E_ places.
> >>>
> >>> What do you think?
> >>
> >> I think that still mixes the error return values for the internal
> >> functions?
> >>
> >> The reason I noticed this is I'm trying to add proper Doxygen
> >> comments in here. The internal functions need to be consistent about
> >> returning either only GNUTLS_E or errno. The documenting comments
> >> can't say "returns GNUTLS_E, negative errno, or zero", for example.
> >>
> > I see, how about if I do this in all GNUTLS_E returned functions?
> >
> > diff --git a/src/tlshd/server.c b/src/tlshd/server.c
> > index db5db31..0ee1157 100644
> > --- a/src/tlshd/server.c
> > +++ b/src/tlshd/server.c
> > @@ -538,7 +538,7 @@ err:
> >         tlshd_x509_server_put_privkey();
> >         tlshd_x509_server_put_certs();
> >         tlshd_log_gnutls_error(ret);
> > -       return ret;
> > +       return ret ? -EACCES : 0;
> >  }
> >
> > This way, we will not need to change their callers.
>
> IMHO we want to distinguish between a temporary memory allocation
> failure, invalid input, and a permanent access failure.
>
Yes, that will be nice.

However, the tlshd_tls13_* functions don=E2=80=99t currently convert GNUTLS=
_E
values into errno for parms->session_status; they only log them via
tlshd_log_gnutls_error(ret).

If we adopt your original patch (which kind of maps GNUTLS_E values to
errno and  assigns them to parms->session_status) for QUIC, it would make
the tlshd_quic_* functions diverge in behavior from the tlshd_tls13_*
functions.

Or you think we should make this change in quic first and align tls13 later=
?

Sorry for the confusion.

Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0B6303C88
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 24 Sep 2025 13:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758722222; cv=none; b=uustTHkTvXKE/uBzsedFRDI3yk2w/Ie5rb7Jpfqi+eH1elODP0xedhO2ycGmhQiRS3ayZHwarfujcJXtupPQ3lxV8/EVzUvmpfJJID6igZGTnpE7YnPSHBtDyyRHN+/w1YF/sP8P469xBPuGL1g8PNeM1w/5GHlsLOgb9um3Th8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758722222; c=relaxed/simple;
	bh=MExryHtG211/FkPBajOL0lTmjl6EhksftOGHiUMpGTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhwMMtoQudv0YXtB+dy28li/1JadeHmvTL+oaZ/UluyK8gxfcVm1PvEi3x5YEBAZ+HnyW9uV3Q+sfXeKhm71cwg5KUcSKRas7o9IlknRvLv40hnagq5W8yHE3yXz08rHtvYyysRjR0lKHbVjjNqqeWB+B4wt1tDfFV7rGTlh2a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt5vVyCf; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt5vVyCf"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-279e2554b5fso9367395ad.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 24 Sep 2025 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758722220; x=1759327020; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkEpGqXaRsLAgzg4//IZWYQDqpu1N/Aqc6ts0pNvhs8=;
        b=Vt5vVyCfRoaS2f6p0HcZ3xNuhWWFw6jmginoV6FyYRGGh4jKGT2JTA+G7YTa2mj6LQ
         e/2jafkgM3FoywDU4L+FTtEqGwosihm+53k+gnR8V8S/oVgfAsA82vZ03HCQQE2mNjRr
         zIyUbuNTu/x2vdV+m7SZz6p4NnJjp0S4yiUlCW9CfrzUzHDevQn4x5tgr7ClZImYSZpO
         BoKVcsjWDQQFo4qP8bafqkEmyxLePkgQPOFXNms4F3SsOZujIFlWPIkPKkeFzN/z7jt0
         mbWu4SQ8zdNKoHPvBJPp0xTi4tOV3hE4FkLDkg81R0ku5k+YIR9+8eYvH+LXSUQKwf7F
         giCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758722220; x=1759327020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkEpGqXaRsLAgzg4//IZWYQDqpu1N/Aqc6ts0pNvhs8=;
        b=ku7Jaw15nJmfo9100TwCOkP7XEmmYPF81LxCGc2Y3GEmIhcTXRCukv3FDWwaoiaFWm
         VKx7Fo67w24aNy+PFaq1kWD/Bbmf1JkNauezK/D4vG5CuD9G2JMQ46CQ6AO2BjWVldcl
         5PF5T3yv3tKi0/dsK05RlBMAvS84RK1vka40O0dX3mIKTcdVvhWi+lXJpNvoppIZJn1j
         zgRyU2G4P7sBlZgJ13tGdRrsKLxsrDxqUKk7xyBUEY2xxco3XEKM0KVYRLVEkCqCXHOl
         K91JYux/pa+K4IYV+ks2MGL7avEeS4+MVMPLwtY45QHj6RovuG3x7/RyDhrez3XtPg1J
         gmlw==
X-Forwarded-Encrypted: i=1; AJvYcCWn+1Tjxb/xS9byxjvHKTNtrQpb5mA/yhBcmPJBruR1izRLJ+NkFw61HFn/Up+r67tKGSFZqzj4GsC+nnQ2O7g8+3npSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ3LkgeaR5CeW2/ofnWH+KX0UNTc+g75cD+ciBEsU6lWFAnvQZ
	x0uS5Vpx/lb7c3bJKx2FjnnVqX4CJHmXJK6ougZV3OmnJEVeqagWLmaj//QpRVgxwjiJETiPo2G
	mW3ePMrQEaOeLLVoRJmabyPBqZhlvEJNkuwF1
X-Gm-Gg: ASbGncvnn0ZvT6GR8Vkz/gTeTEfGrkOV5S64aj4jfB4JPIQI+gGPDWAu5WeL/jp7AT9
	QtUPo+bfK7606Mt755GUkF78/qMqERJeOg+Pl7QRlkEpL19hEgmJaBAyx1qqU5IF80RnCvLF/ln
	pTpaSVZDtEx6JhNslnejXcgB+F3r271oO4h402ygys4hheoek/SI7HTLj3fG1fRXUxgRPmyiv/j
	EtdlGhflw==
X-Google-Smtp-Source: AGHT+IHAWPHrnEkNGn2IG5b98MipW0omZHOTr9qpM/0a6bsdkv4Qp7rMrjB9+P5Iaz5wUReg+oGIUbgdqaCCZQLwf0c=
X-Received: by 2002:a17:903:1983:b0:274:506d:7fcc with SMTP id
 d9443c01a7336-27ec104426cmr28878085ad.6.1758722219979; Wed, 24 Sep 2025
 06:56:59 -0700 (PDT)
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
 <875cb069-d762-454a-b01e-26344a16050e@oracle.com> <CADvbK_cR+Kzoef1JH6JwO5nT0vkwTEXbDmVw7_GqWrDYUefyyw@mail.gmail.com>
 <f6c4609f-62de-41ac-a84d-309b1e2edc9d@oracle.com>
In-Reply-To: <f6c4609f-62de-41ac-a84d-309b1e2edc9d@oracle.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 24 Sep 2025 09:56:47 -0400
X-Gm-Features: AS18NWDUqtNiCHN0lEeWaweBbDAcB6UhOjARL0HzHAXOMt5-o0mTH4iV7duy_KU
Message-ID: <CADvbK_fryGa64ze_E2ekU2oc23DBHSBdKGthZKTdfn3GTcsbsg@mail.gmail.com>
Subject: Re: [PATCH] tlshd: Return errnos from QUIC helper functions
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Benjamin Coddington <bcodding@redhat.com>, kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 9:47=E2=80=AFAM Chuck Lever <chuck.lever@oracle.com=
> wrote:
>
> On 9/23/25 6:40 PM, Xin Long wrote:
> > On Tue, Sep 23, 2025 at 8:05=E2=80=AFPM Chuck Lever <chuck.lever@oracle=
.com> wrote:
> >>
> >> On 9/23/25 5:00 PM, Xin Long wrote:
> >>> On Tue, Sep 23, 2025 at 7:05=E2=80=AFPM Chuck Lever <chuck.lever@orac=
le.com> wrote:
> >>>>
> >>>> On 9/23/25 3:41 PM, Xin Long wrote:
> >>>>> On Tue, Sep 23, 2025 at 5:02=E2=80=AFPM Chuck Lever <chuck.lever@or=
acle.com> wrote:
> >>>>>>
> >>>>>> On 9/23/25 1:27 PM, Xin Long wrote:
> >>>>>>> On Tue, Sep 23, 2025 at 3:18=E2=80=AFPM Chuck Lever <chuck.lever@=
oracle.com> wrote:
> >>>>>>>>
> >>>>>>>> On 9/22/25 3:07 PM, Chuck Lever wrote:
> >>>>>>>>> From: Chuck Lever <chuck.lever@oracle.com>
> >>>>>>>>>
> >>>>>>>>> Static analysis tools have noticed that
> >>>>>>>>> tlshd_quic_serverhello_handshake() expects its helper functions=
 to
> >>>>>>>>> return errno values, but two of them return GNUTLS_E_* values i=
n
> >>>>>>>>> most cases. Convert those functions to always return errno valu=
es
> >>>>>>>>> or zero (on success).
> >>>>>>>>>
> >>>>>>>>> Cc: Xin Long <lucien.xin@gmail.com>
> >>>>>>>>> Fixes: 43a15fed2f33 ("tlshd: add support for quic handshake")
> >>>>>>>>> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> >>>>>>>>> ---
> >>>>>>>>>  src/tlshd/server.c | 54 +++++++++++++++++++++++++++-----------=
--------
> >>>>>>>>>  1 file changed, 32 insertions(+), 22 deletions(-)
> >>>>>>>>
> >>>>>>>> Xin -
> >>>>>>>>
> >>>>>>>> Looks like src/tlshd/quic.c has the same issue with conn->errcod=
e.
> >>>>>>>> Callers expect an errno, but internally the utility functions se=
t that
> >>>>>>>> field to a GNUTLS_E_ value.
> >>>>>>>>
> >>>>>>>> Can you apply this patch, fix up quic.c as well, and then test b=
oth and
> >>>>>>>> post the fixes here?
> >>>>>>>>
> >>>>>>> Sure.
> >>>>>>>
> >>>>>>> But conn->errcode is used to pass the err to parms->session_statu=
s.
> >>>>>>> What does parms->session_status expect? errno or GNUTLS_E_ value?
> >>>>>>
> >>>>>> session_status contains a positive errno or zero.
> >>>>>>
> >>>>>>
> >>>>>>> looking at tlshd_start_tls_handshake():
> >>>>>>>                 /* Any errors here should default to blocking acc=
ess: */
> >>>>>>>                 parms->session_status =3D EACCES; <---
> >>>>>>>                 switch (ret) {
> >>>>>>>                 case GNUTLS_E_CERTIFICATE_ERROR:
> >>>>>>>                 case GNUTLS_E_CERTIFICATE_VERIFICATION_ERROR:
> >>>>>>>                         tlshd_log_cert_verification_error(session=
);
> >>>>>>>                         break;
> >>>>>>>                 case -ETIMEDOUT:
> >>>>>>>                         tlshd_log_gnutls_error(ret);
> >>>>>>>                         parms->session_status =3D -ret; <----
> >>>>>>>         parms->session_status =3D tlshd_initialize_ktls(session);
> >>>>>>>
> >>>>>>> It also seems mixed, no?
> >>>>>>
> >>>>>> The -ETIMEDOUT arm sets session_status to -ret. ret always contain=
s the
> >>>>>> value -ETIMEDOUT in that arm, so -ret is ETIMEDOUT.
> >>>>>>
> >>>>>> This code comes from commit b010190cfed2 ("tlshd: Pass ETIMEDOUT f=
rom
> >>>>>> gnutls to kernel"). Passing -ETIMEDOUT directly to
> >>>>>> tlshd_log_gnutls_error() does seem a little bogus.
> >>>>>>
> >>>>>
> >>>>> Got it. I'm trying to align the QUIC err process with tls13 code.
> >>>>>
> >>>>> - tlshd_tls13_client_x509_handshake()
> >>>>> - tlshd_tls13_client_psk_handshake()
> >>>>>
> >>>>> - tlshd_tls13_server_x509_handshake()
> >>>>> - tlshd_tls13_server_psk_handshake()
> >>>>>
> >>>>> It seems to me that: When gnutls_xxx() returns errs in these functi=
ons,
> >>>>> it only logs them, and doesn't set any value to parms->session_stat=
us,
> >>>>> but sets it until tlshd_start_tls_handshake().
> >>>>>
> >>>>> So my suggestion is: not touch these functions for QUIC code:
> >>>>>
> >>>>> - tlshd_quic_client_set_x509_session()
> >>>>> - tlshd_quic_client_set_psk_session()
> >>>>>
> >>>>> - tlshd_quic_server_set_x509_session()
> >>>>> - tlshd_quic_server_set_psk_session()
> >>>>>
> >>>>> but change their callers tlshd_quic_client/serverhello_handshake():
> >>>>>
> >>>>> @@ -601,14 +599,10 @@ void tlshd_quic_serverhello_handshake(struct
> >>>>> tlshd_handshake_parms *parms)
> >>>>>                 ret =3D -EINVAL;
> >>>>>                 tlshd_log_debug("Unrecognized auth mode (%d)",
> >>>>> parms->auth_mode);
> >>>>>         }
> >>>>> -       if (ret) {
> >>>>> -               conn->errcode =3D -ret;
> >>>>> -               goto out;
> >>>>> +       if (!ret) {
> >>>>
> >>>>    if (ret =3D=3D GNUTLS_E_SUCCESSS) {
> >>>>
> >>>> is preferred.
> >>>>
> >>>>
> >>>>> +               tlshd_quic_start_handshake(conn);
> >>>>> +               parms->session_status =3D conn->errcode;
> >>>>>         }
> >>>>> -
> >>>>> -       tlshd_quic_start_handshake(conn);
> >>>>> -out:
> >>>>> -       parms->session_status =3D conn->errcode;
> >>>>>         tlshd_quic_conn_destroy(conn);
> >>>>
> >>>> We usually express the return code checking as
> >>>>
> >>>>    do something
> >>>>    if (error) {
> >>>>       error flow
> >>>>    }
> >>>>
> >>>> That's why the goto is in there. But I'll leave it up to you in
> >>>> the quic code.
> >>>>
> >>>>
> >>>>> and then in tlshd_quic_start_handshake(), keep the code setting
> >>>>> conn->errcode =3D errno, but set conn->errcode =3D EACCES for all
> >>>>> GNUTLS_E_ places.
> >>>>>
> >>>>> What do you think?
> >>>>
> >>>> I think that still mixes the error return values for the internal
> >>>> functions?
> >>>>
> >>>> The reason I noticed this is I'm trying to add proper Doxygen
> >>>> comments in here. The internal functions need to be consistent about
> >>>> returning either only GNUTLS_E or errno. The documenting comments
> >>>> can't say "returns GNUTLS_E, negative errno, or zero", for example.
> >>>>
> >>> I see, how about if I do this in all GNUTLS_E returned functions?
> >>>
> >>> diff --git a/src/tlshd/server.c b/src/tlshd/server.c
> >>> index db5db31..0ee1157 100644
> >>> --- a/src/tlshd/server.c
> >>> +++ b/src/tlshd/server.c
> >>> @@ -538,7 +538,7 @@ err:
> >>>         tlshd_x509_server_put_privkey();
> >>>         tlshd_x509_server_put_certs();
> >>>         tlshd_log_gnutls_error(ret);
> >>> -       return ret;
> >>> +       return ret ? -EACCES : 0;
> >>>  }
> >>>
> >>> This way, we will not need to change their callers.
> >>
> >> IMHO we want to distinguish between a temporary memory allocation
> >> failure, invalid input, and a permanent access failure.
> >>
> > Yes, that will be nice.
>
> Perhaps all that matters here is the audit message -- the admin will
> want to know what kind of error it was. tlshd recovery is just clean
> up and exit for all three.
>
>
> > However, the tlshd_tls13_* functions don=E2=80=99t currently convert GN=
UTLS_E
> > values into errno for parms->session_status; they only log them via
> > tlshd_log_gnutls_error(ret).
>
> The tlshd_tls13_ helpers return void, IIRC, because the session_status
> field is initialized to EIO, and that gets cleared by
> tlshd_start_tls_handshake() when the handshake is successful.
>
> The quic helpers return an int... maybe they should return void as well?
Yes, that's also my thought.

>
>
> > If we adopt your original patch (which kind of maps GNUTLS_E values to
> > errno and  assigns them to parms->session_status) for QUIC, it would ma=
ke
> > the tlshd_quic_* functions diverge in behavior from the tlshd_tls13_*
> > functions.
> >
> > Or you think we should make this change in quic first and align tls13 l=
ater?
> >
> > Sorry for the confusion.
>
> Confusion is mostly because I don't remember how any of this works.
>
:D Thank you.

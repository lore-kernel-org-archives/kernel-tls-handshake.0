Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF5A15D1
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 24 Sep 2025 00:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758672023; cv=none; b=GAKoRBVJARS8bepFIxzpS+SB+s7++1n14q4Vvf5SgCs+GhWKGKrWryoTS5/joGDOYgqvfSWicvzB/Z3L5LLmw1jVnyZM3QKO0jkYLTYDqW5KvPSLGbGPkjmgJd3kpwxWfl/GHrV6C68dV4hRjoJDWuRo/oRFVcigMdiIVd/+E1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758672023; c=relaxed/simple;
	bh=lbCVizBT5CoGb2YA9nIgKMa3Ryn8GUldMsaRQHKz9x8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Liv4lqSPoFPiFA16Zqt+9rqYVmFYnqqJjvqNQtI2OiEkalScIjurSDwrvF06byP5TdooxVOOA2jjxPyQPknEVQXMhT+k/U+4Gov6CHFwIbIWDWq98/gPyeUpSjBysRtVdMSvicre0z5EgEE2Xy2/zSA1wUNQnHLLXUIid6boe7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxDH5Fr1; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxDH5Fr1"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77f2a62e44dso4441422b3a.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Sep 2025 17:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758672021; x=1759276821; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgDx0eU2j6v70tSKia9dPocG6AHd5PAuiaRfBl6m4hw=;
        b=GxDH5Fr1iGxdXH59rGOfObtRzQ2VEK0y9MqUW7BGonK+aIJHMJO2fMT0z2bfOQQgZI
         t26nw3L00Qg1Te1+BHqHTtlIf1KtJHSFieyp3CQDnw2EE3ZvEvGIiRqqJy+RTrAXVmfv
         L6EMb1wmrF5AywmjQj+UY+joaOhgbgLKb6NyfZYeKb1T1oUdew+adqXhE7nIcERqGDmt
         TUc75x7olO902FESHNk9Uvacw7XQIPypeJSJwErz+1aEDJgkGcR35njK2w20tc4ZefoB
         qnXm/y30VTONOI/K0Uxfmw7FQi5z4IdNhuDuRinSQyvlnJS5CFJPxGm/mMdqW8SI0oh2
         qocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758672021; x=1759276821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgDx0eU2j6v70tSKia9dPocG6AHd5PAuiaRfBl6m4hw=;
        b=cJtKTQtIECM+wEuBkZUjQybUXOGZKl7v32AKqnjLRpnVNmX2xln6OHMW0a38TBwo64
         NyaD5Pz2CWFT9lZ1bmMArUn/AGkiVjj+AHhjgAI0QWJ1ndfFmGFBZlk34Cjb7BxHbdj3
         iOQy1RBn215D7z75gGA33cmxuoJvQXcWObERwHn0Nhzfco8z0x6B4HLzJJA+n2HB0SFU
         zc4kgnPk7jJ8VPTAkTJ+RuyocpnL+cbUvJbF8NpZi2bRIKbx38XDtulUvkUh/XKdfUDz
         Ez0IeBdOYsM2m0rduwW3DPy+Mu5fmxGTlUpoaDLOJIBk6LnXSC39AryvDfet9sIO9LbI
         hPSg==
X-Forwarded-Encrypted: i=1; AJvYcCUybKjJwBdZwXUVYo9jLgk3fxQLGIQ1neCRvj4+nYGNcEBh9iuiXR5uSBvc3eiflOKYL+lKQwhD/9McAmBunCLSDPmLUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPPSv3f2cGj/RpBrnKeOuGOn2xzWT7Dn3Gso7Ap8pvrysY2uyD
	U3kxw+jASteGUL/cxl831fq+2O1/YVNok3fTCmWKkrqk1k19rcmdmmfrAR6YiGSBelGgkbenU1J
	/cvhxYxqq3J4qt17oAN2J80pmYUTECag=
X-Gm-Gg: ASbGncvDjHtax8yYz97e8Ym6H/x0KQdSdYTn9LD89n/sODS9oDgMTpB9lxU0Ch7eCXm
	4bRt/T8lAbMRZ3eh//2P2PO8GVRBbWzuZnkMYPg97KYcsItxNv6MQruT3c54cXdNK8uaEttNdnz
	21l3Bf2bDK9UgkpZiXmG0623rZRmSKbdD/QNR2g70YXKASfAygRhRJqKbz7wM4Qjt2jbNmaxPU7
	3ea71hniQ==
X-Google-Smtp-Source: AGHT+IEhSlqL168gOZqSumFebh0wtsHVKJDvWaJir8+CUTX+fwXLvA5Wi89UqK/DfXTH3QQ8aXutsEu1iqbRpNE6AKs=
X-Received: by 2002:a17:902:c945:b0:267:16ec:390 with SMTP id
 d9443c01a7336-27cc344fc51mr57318725ad.17.1758672020510; Tue, 23 Sep 2025
 17:00:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250922220710.1255102-1-cel@kernel.org> <c23cfb52-70ab-4dd0-b0cc-c83e42af60f3@oracle.com>
 <CADvbK_eRuUQ9ra4udyZfJ=PTY2xFR0jTUE9stPkMZD1teeEcOg@mail.gmail.com>
 <a806e5a2-739e-4ed7-b764-95f89da09250@oracle.com> <CADvbK_ebg0gScVUPzK8VieUzL7pKubgf4YqEahTQmYF9ZTn-vw@mail.gmail.com>
 <b5ccdf3c-3821-4608-bbe7-1d690da2b70b@oracle.com>
In-Reply-To: <b5ccdf3c-3821-4608-bbe7-1d690da2b70b@oracle.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 23 Sep 2025 20:00:07 -0400
X-Gm-Features: AS18NWDhsVLD_awBhzigPdEPW7WeHtiGZE-g1ZihxaPrQABPiho-W1Z5m10iGoo
Message-ID: <CADvbK_cVUHwx16Q_uQAoae5rLRkTZSZenQjgiP=3Nn-LUkUCAg@mail.gmail.com>
Subject: Re: [PATCH] tlshd: Return errnos from QUIC helper functions
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Benjamin Coddington <bcodding@redhat.com>, kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 7:05=E2=80=AFPM Chuck Lever <chuck.lever@oracle.com=
> wrote:
>
> On 9/23/25 3:41 PM, Xin Long wrote:
> > On Tue, Sep 23, 2025 at 5:02=E2=80=AFPM Chuck Lever <chuck.lever@oracle=
.com> wrote:
> >>
> >> On 9/23/25 1:27 PM, Xin Long wrote:
> >>> On Tue, Sep 23, 2025 at 3:18=E2=80=AFPM Chuck Lever <chuck.lever@orac=
le.com> wrote:
> >>>>
> >>>> On 9/22/25 3:07 PM, Chuck Lever wrote:
> >>>>> From: Chuck Lever <chuck.lever@oracle.com>
> >>>>>
> >>>>> Static analysis tools have noticed that
> >>>>> tlshd_quic_serverhello_handshake() expects its helper functions to
> >>>>> return errno values, but two of them return GNUTLS_E_* values in
> >>>>> most cases. Convert those functions to always return errno values
> >>>>> or zero (on success).
> >>>>>
> >>>>> Cc: Xin Long <lucien.xin@gmail.com>
> >>>>> Fixes: 43a15fed2f33 ("tlshd: add support for quic handshake")
> >>>>> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> >>>>> ---
> >>>>>  src/tlshd/server.c | 54 +++++++++++++++++++++++++++---------------=
----
> >>>>>  1 file changed, 32 insertions(+), 22 deletions(-)
> >>>>
> >>>> Xin -
> >>>>
> >>>> Looks like src/tlshd/quic.c has the same issue with conn->errcode.
> >>>> Callers expect an errno, but internally the utility functions set th=
at
> >>>> field to a GNUTLS_E_ value.
> >>>>
> >>>> Can you apply this patch, fix up quic.c as well, and then test both =
and
> >>>> post the fixes here?
> >>>>
> >>> Sure.
> >>>
> >>> But conn->errcode is used to pass the err to parms->session_status.
> >>> What does parms->session_status expect? errno or GNUTLS_E_ value?
> >>
> >> session_status contains a positive errno or zero.
> >>
> >>
> >>> looking at tlshd_start_tls_handshake():
> >>>                 /* Any errors here should default to blocking access:=
 */
> >>>                 parms->session_status =3D EACCES; <---
> >>>                 switch (ret) {
> >>>                 case GNUTLS_E_CERTIFICATE_ERROR:
> >>>                 case GNUTLS_E_CERTIFICATE_VERIFICATION_ERROR:
> >>>                         tlshd_log_cert_verification_error(session);
> >>>                         break;
> >>>                 case -ETIMEDOUT:
> >>>                         tlshd_log_gnutls_error(ret);
> >>>                         parms->session_status =3D -ret; <----
> >>>         parms->session_status =3D tlshd_initialize_ktls(session);
> >>>
> >>> It also seems mixed, no?
> >>
> >> The -ETIMEDOUT arm sets session_status to -ret. ret always contains th=
e
> >> value -ETIMEDOUT in that arm, so -ret is ETIMEDOUT.
> >>
> >> This code comes from commit b010190cfed2 ("tlshd: Pass ETIMEDOUT from
> >> gnutls to kernel"). Passing -ETIMEDOUT directly to
> >> tlshd_log_gnutls_error() does seem a little bogus.
> >>
> >
> > Got it. I'm trying to align the QUIC err process with tls13 code.
> >
> > - tlshd_tls13_client_x509_handshake()
> > - tlshd_tls13_client_psk_handshake()
> >
> > - tlshd_tls13_server_x509_handshake()
> > - tlshd_tls13_server_psk_handshake()
> >
> > It seems to me that: When gnutls_xxx() returns errs in these functions,
> > it only logs them, and doesn't set any value to parms->session_status,
> > but sets it until tlshd_start_tls_handshake().
> >
> > So my suggestion is: not touch these functions for QUIC code:
> >
> > - tlshd_quic_client_set_x509_session()
> > - tlshd_quic_client_set_psk_session()
> >
> > - tlshd_quic_server_set_x509_session()
> > - tlshd_quic_server_set_psk_session()
> >
> > but change their callers tlshd_quic_client/serverhello_handshake():
> >
> > @@ -601,14 +599,10 @@ void tlshd_quic_serverhello_handshake(struct
> > tlshd_handshake_parms *parms)
> >                 ret =3D -EINVAL;
> >                 tlshd_log_debug("Unrecognized auth mode (%d)",
> > parms->auth_mode);
> >         }
> > -       if (ret) {
> > -               conn->errcode =3D -ret;
> > -               goto out;
> > +       if (!ret) {
>
>    if (ret =3D=3D GNUTLS_E_SUCCESSS) {
>
> is preferred.
>
>
> > +               tlshd_quic_start_handshake(conn);
> > +               parms->session_status =3D conn->errcode;
> >         }
> > -
> > -       tlshd_quic_start_handshake(conn);
> > -out:
> > -       parms->session_status =3D conn->errcode;
> >         tlshd_quic_conn_destroy(conn);
>
> We usually express the return code checking as
>
>    do something
>    if (error) {
>       error flow
>    }
>
> That's why the goto is in there. But I'll leave it up to you in
> the quic code.
>
>
> > and then in tlshd_quic_start_handshake(), keep the code setting
> > conn->errcode =3D errno, but set conn->errcode =3D EACCES for all
> > GNUTLS_E_ places.
> >
> > What do you think?
>
> I think that still mixes the error return values for the internal
> functions?
>
> The reason I noticed this is I'm trying to add proper Doxygen
> comments in here. The internal functions need to be consistent about
> returning either only GNUTLS_E or errno. The documenting comments
> can't say "returns GNUTLS_E, negative errno, or zero", for example.
>
I see, how about if I do this in all GNUTLS_E returned functions?

diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index db5db31..0ee1157 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -538,7 +538,7 @@ err:
        tlshd_x509_server_put_privkey();
        tlshd_x509_server_put_certs();
        tlshd_log_gnutls_error(ret);
-       return ret;
+       return ret ? -EACCES : 0;
 }

This way, we will not need to change their callers.

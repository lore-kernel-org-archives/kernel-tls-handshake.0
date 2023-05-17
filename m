Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F5D111AD
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 17 May 2023 19:00:02 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ac8a9f7930so48921fa.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 17 May 2023 12:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684350001; x=1686942001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7H4dhBcXijaKNiwcTAdAmn0i9NRlcKFU0g0rKZGNlVw=;
        b=reE7BaqM5OdIiuU+2uttPpCuie7VuJcxNkejO0+3hronpNVg8IYNlvIlyz3Mhttelq
         Bse6OMHYKll4WITZ/oAezeqpElyT3op9mPuDYtuD1kOms1yn0FbimyFdRXFSbCJG57Ql
         y8MC3LkSLSCgVqoVFQRn+Zua2lAvXzLDcIqqb/tuOXbDimkTcPoq7pVF8XCAybiZA3H7
         87QzfVUtgVZXKjFamAZc4R/rnUIzUA67JjxLFjZMNB1osbHjzEG+VlNjbapwzUXikz+S
         kOBct5wKVRVkYPKb6VnsBe+fvQ+gyTto3Ozgude4VQhrX81yhkaF1B/YP2+889DzIOrC
         Jx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684350001; x=1686942001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7H4dhBcXijaKNiwcTAdAmn0i9NRlcKFU0g0rKZGNlVw=;
        b=f03mMVVYiAklI8qtbgP3FYxioJKzyAaNe3DTrOhxycA7+QUrR8z22JUBnbre+GF97u
         RzhBWVOFIAsqGYhe1jZoZwfI0vUG38ibSoIL5aSj0uI78nBK+seWu+R6wra8h4EwMo2z
         cgsg+WN3H0vJpznT6Yr+rFmmqRiOSvqhETTVzce313z8jOE3RjtgFo9gInkklXLmlNaf
         TSu6QgCLXTiadpMDpbdu/OseOLhXeKh3+5Kb+3ksL8nVijyc4VgozUQFv3yzkODdBaVG
         9E6JjRXZ4qTW0Xsi//dCGPH8+xNCPOE55jZ/1v8uhbGGfz6vX4dgIe2WOk272P1I0m4O
         1RKA==
X-Gm-Message-State: AC+VfDx8JeK02UWWl4r0D6FGi5cR2DJ7PeK6Yalay3tacWghhzvri+78
	CY1T9dBFvVJKjUnDFsiMtYs3dWpdT5v4j8N3a9k=
X-Google-Smtp-Source: ACHHUZ42hrjoNyr8PBkrETHQlWVbELx1rmAW/R8bgmi591VEeP4XJycvXfSNKNUqMz44yHT1g1DzjRcvBBKra3op328=
X-Received: by 2002:a05:651c:204a:b0:2ad:9d06:8c3d with SMTP id
 t10-20020a05651c204a00b002ad9d068c3dmr1038678ljo.3.1684350000461; Wed, 17 May
 2023 12:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230517161446.35825-1-olga.kornievskaia@gmail.com> <D032DEDF-98DE-40D2-88F9-A50E6A776895@oracle.com>
In-Reply-To: <D032DEDF-98DE-40D2-88F9-A50E6A776895@oracle.com>
From: Olga Kornievskaia <olga.kornievskaia@gmail.com>
Date: Wed, 17 May 2023 14:59:48 -0400
Message-ID: <CAN-5tyHLz3C4DHPytwn-x2zmpYm=bRxYu_njVKSmtq67bvnFUg@mail.gmail.com>
Subject: Re: [RFC PATCH] ktls-utils: Add minor error checking of gnutls functions
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2023 at 2:11=E2=80=AFPM Chuck Lever III <chuck.lever@oracle=
.com> wrote:
>
> Review comments:
>
> > On May 17, 2023, at 12:14 PM, Olga Kornievskaia <olga.kornievskaia@gmai=
l.com> wrote:
> >
> > From: Olga Kornievskaia <kolga@netapp.com>
> >
> > Add error checking to non void gnutls functions and log if we failed.
>
> It would be better if there were a few sentences that
> explained why this change is needed. For example, what
> errors are missed by the current code? Why should
> verification fail in these additional cases?

This was in the spirit of "always check the return code of the
function and handle appropriately". I don't have a failure case in
mind that I know would lead to problems. However, I speculate if for
whatever reason (something like memory allocation), we might want to
fail instead of having it fail later?

Also as you see it was RFC, as in if you think those checks are really
not needed then I defer to your judgement.

> > Signed-off-by: Olga Kornievskaia <kolga@netapp.com>
> > ---
> > src/tlshd/client.c | 20 +++++++++++++++++---
> > 1 file changed, 17 insertions(+), 3 deletions(-)
> >
> > diff --git a/src/tlshd/client.c b/src/tlshd/client.c
> > index 6a16263..5fcacfa 100644
> > --- a/src/tlshd/client.c
> > +++ b/src/tlshd/client.c
> > @@ -233,7 +233,13 @@ static int tlshd_client_x509_verify_function(gnutl=
s_session_t session)
> > gnutls_x509_crt_t cert;
> >
> > gnutls_x509_crt_init(&cert);
> > - gnutls_x509_crt_import(cert, &peercerts[i], GNUTLS_X509_FMT_DER);
> > + ret =3D gnutls_x509_crt_import(cert, &peercerts[i],
> > +     GNUTLS_X509_FMT_DER);
> > + if (ret !=3D GNUTLS_E_SUCCESS) {
> > + tlshd_log_gnutls_error(ret);
>
> I am wondering here, and below, if a more actionable message
> can be emitted. I can apply this as is, but we should review
> all the error reporting to see where it can be improved.

I could add either the name of the function which failed (or verbose
description like import of cert failed or set of DNS name failed),
would that be helpful? Otherwise those functions don't have a list of
possible error conditions listed to make the error more verbose.

> > + gnutls_x509_crt_deinit(cert);
> > + return GNUTLS_E_CERTIFICATE_ERROR;
> > + }
> > parms->remote_peerid[i] =3D
> > tlshd_keyring_create_cert(cert, parms->peername);
> > gnutls_x509_crt_deinit(cert);
> > @@ -278,9 +284,17 @@ static void tlshd_client_x509_handshake(struct tls=
hd_handshake_parms *parms)
> > gnutls_transport_set_int(session, parms->sockfd);
> > gnutls_session_set_ptr(session, parms);
> >
> > - gnutls_server_name_set(session, GNUTLS_NAME_DNS,
> > + ret =3D gnutls_server_name_set(session, GNUTLS_NAME_DNS,
> >       parms->peername, strlen(parms->peername));
> > - gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
> > + if (ret !=3D GNUTLS_E_SUCCESS) {
> > + tlshd_log_gnutls_error(ret);
> > + goto out_free_creds;
> > + }
> > + ret =3D gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred=
);
> > + if (ret !=3D GNUTLS_E_SUCCESS) {
> > + tlshd_log_gnutls_error(ret);
> > + goto out_free_creds;
> > + }
> > gnutls_certificate_set_verify_function(xcred,
> >       tlshd_client_x509_verify_function);
> >
> > --
> > 2.39.1
> >
> >
>
> --
> Chuck Lever
>
>

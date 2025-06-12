Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028462222A6
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 12 Jun 2025 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749738542; cv=none; b=mpypkWCFEvIGHIpYUR1gAsm96rCy4P+Tt29VsepqWNSGKFafKkMyFobUeHMcoSom1tBETs7qn2zy5h3eI5HpSrKWhh7BNevB6bikRIk7wwjeNzeaf8jPLW6hF3nZLGj2lBQg0DX5S67iphl2r3nNQDrUaMGloQZu8FUyTHRXxLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749738542; c=relaxed/simple;
	bh=5T4lwOwJbiqS+oyNoyiVRw1Zr++m5D8wtUMH3FG56Wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qLHdfzOdsGzPi2uSXP38efKX+lR+0YukxX9zmmvCdsPz+KoTvWmyxhsjWfdMGxpiqSCtSnB3tnJ7whkiR3eTyq77SwbBfk/YEytA0xl9IcVrTwfN9TJ4rDog1lwL5wp8EdfrfywV1snS2mx6cBHMF/wYizquzQzLKpy0ERn4Th0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fZ2h6a49; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fZ2h6a49"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749738539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WBAhTAaSHVqfY841BPY95AWyiFlJnZTmwItXmmpiyw4=;
	b=fZ2h6a49+19IT/exBaoy/AdCtCErkBVTyjM8FSEsgPCAMDQ030nialvyTie5X7+H/dlXzx
	n1UCKSnkYDddIklrRXJcgrnDsB0fW7w7L9zw7sbh3MUeeKWNnDf80WMLPdc7oTrEG0JICU
	kNOhtDCUKEOo2w93dNo3CKZO5vei0Ak=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-MeG7e0ZwM-CuKk3HoMSu_w-1; Thu, 12 Jun 2025 10:28:52 -0400
X-MC-Unique: MeG7e0ZwM-CuKk3HoMSu_w-1
X-Mimecast-MFC-AGG-ID: MeG7e0ZwM-CuKk3HoMSu_w_1749738532
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-478f78ff9beso30448651cf.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 12 Jun 2025 07:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749738532; x=1750343332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBAhTAaSHVqfY841BPY95AWyiFlJnZTmwItXmmpiyw4=;
        b=Tqzt3qB89XY1JiKqZ6CCzrkwp+TAs8G6Q8uEPhrK+pG6LdGBFUt29O7EnSceWEhCV+
         fRPF3oDjYltO4L9PlE74YmgdNgQBfaptL9HXHkY+1aV/8XbtlqRZ1hU4cq5WBOcC5V+V
         GwWurfa6fbwnPy3uoXnoSUhPBwo3kZ4bmVc+GuOoz9ETgMUsaQ1H6Jtr6xVkReufttv0
         XV6Vb75R361V9cZ1HdCdgcPOnHn8KCE1ndM9F/YaI4vrZUkYA/ZvT9R7QuMhLUtk9U2x
         hYm/eBaA5/WXWVp5yyuOr+KdLpeZG68f1ejE/iSI+fO7aFuOAuj06ivmX5i4jEuNuaxX
         G0Tw==
X-Gm-Message-State: AOJu0YzDC/EzLQjudIghLcpvxNCeF/rreKHLmKxJzDXrulzVomsJn2OY
	yp3yEK9cAVHGappL4Onu51elrowan3WZyTL6VzuSVdO6Wtha9JxnEIOnfkApYbJpiRsuwhOK5Uy
	GJ6kgSbA7HHf5t5I1lAhUJKIhjefwTtBhX3q/E0+YLYrIV1NjPwfVgo0Wlyx0W65e73AMC4QWIr
	Q6zRPj6OYCobJAmL3+SIYpM849e3hHlhWVHf00riNnpoMIVjaA6RU=
X-Gm-Gg: ASbGnctu8hu7ZLKvYK1jFGmIzogYf7wVUwu5U3tInzCJGT0pguUMSWSLUU/xCRHC3Db
	iLZTGFDOpBc1qivksFkbM6J7E2ckq8fwiXCcbikLSxhSDixFP7KIopa4lYrk8ACyBMX/+vMf2P7
	zV8IUSrw==
X-Received: by 2002:a05:622a:4a8a:b0:4a7:1460:33e9 with SMTP id d75a77b69052e-4a722a4fab2mr59278211cf.51.1749738531632;
        Thu, 12 Jun 2025 07:28:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHINuS1zw1zmBCIlSYRT8D3jL9ybEK6ya/tDsWSWjiq7vgkAN5O9m3vqotRl+K5w7E5TdAsQ3AvD809LGMYRg=
X-Received: by 2002:a05:622a:4a8a:b0:4a7:1460:33e9 with SMTP id
 d75a77b69052e-4a722a4fab2mr59277861cf.51.1749738531202; Thu, 12 Jun 2025
 07:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611070943.235087-1-Rik.Theys@gmail.com> <d4284f09-def6-4037-8685-f678fe9cfc69@oracle.com>
In-Reply-To: <d4284f09-def6-4037-8685-f678fe9cfc69@oracle.com>
From: Long Xin <lxin@redhat.com>
Date: Thu, 12 Jun 2025 10:28:15 -0400
X-Gm-Features: AX0GCFvEzHFXLBHEyl_b0pmIRA9Sg1zECjIBvtnQ-3nw56p7AtD310CJvLui-1s
Message-ID: <CAMApiK_EsvOXrdSYgG6Kfnd57AChBML9v7Wj=xwFvLFk1eeNKw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add CRL checking to server and client
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev, Rik Theys <rik.theys@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -KEBNfvrkU5iAmzcr7zBtvpNC-kG8JUqGBMnKxbW-ys_1749738532
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 9:49=E2=80=AFAM Chuck Lever <chuck.lever@oracle.com=
> wrote:
>
> On 6/11/25 3:09 AM, Rik Theys wrote:
> > These patches add CRL checking to the TLS client and server code.
> >
> > It introduces an x509.crl configuration option that specifies the
> > location of a CRL in PEM format.
> >
> > The CRL (certificate revocation list) can be used by an administrator
> > to block access to certificates that should no longer be trusted
> > for some reason.
> >
> > See https://github.com/oracle/ktls-utils/issues/103
> >
> > Rik Theys (3):
> >   Add server-side CRL checking
> >   Add client-side CRL checking
> >   Add x509.crl option to man page.
> >
> >  src/tlshd/client.c       | 28 +++++++++++++++++
> >  src/tlshd/config.c       | 66 ++++++++++++++++++++++++++++++++++++++++
> >  src/tlshd/server.c       | 14 +++++++++
> >  src/tlshd/tlshd.conf.man |  9 +++++-
> >  src/tlshd/tlshd.h        |  2 ++
> >  5 files changed, 118 insertions(+), 1 deletion(-)
> >
>
> Also note that this will need a similar code change to the QUIC paths,
> eventually.
>
Yes, there's no difference for the certificate credentials
configuration for QUIC.

I think it will be nice to have a function like:

static int tlshd_server_configure_credentials(gnutls_certificate_credential=
s_t
xcred)
{
        char *crlfile;
        char *cafile;
        int ret;

        if (tlshd_config_get_server_truststore(&cafile)) {
                ret =3D gnutls_certificate_set_x509_trust_file(xcred, cafil=
e,

GNUTLS_X509_FMT_PEM);
                free(cafile);
        } else
                ret =3D gnutls_certificate_set_x509_system_trust(xcred);
        if (ret < 0)
                return ret;
        tlshd_log_debug("System trust: Loaded %d certificate(s).", ret);

        if (tlshd_config_get_server_crl(&crlfile)) {
                ret =3D gnutls_certificate_set_x509_crl_file(xcred, crlfile=
,
                                                           GNUTLS_X509_FMT_=
PEM);
                free(crlfile);
                if (ret < 0 )
                        return ret;
                tlshd_log_debug("System CRL: Loaded %d CRL(s).", ret);
        } else {
                tlshd_log_debug("System CRL: No CRL file configured.");
        }

        gnutls_certificate_set_retrieve_function2(xcred,
                                                  tlshd_x509_retrieve_key_c=
b);
        return GNUTLS_E_SUCCESS;
}

then use it in both tlshd_tls13/quic_server_x509_handshake().
and do the same thing in client.c.

Thanks.


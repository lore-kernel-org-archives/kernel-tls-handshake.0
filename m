Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0DAB640
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  2 Oct 2025 00:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759364606; cv=none; b=IbsHc3FFPn6k38sRFZ/sUA5ZZLJmWe2H2hg8GlqOq3iBg/rInWz7Hwo/YEUDndFXMoRENZJLcNcjx3iVs7X57wHN2eomXBIHIMg1DlsUDh7QT18U9f5JmUZIx+kY1Zlpg/DR6a+M3S7f7C3oRAIGeKo3+/BNAu+RY/HSnTgp4VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759364606; c=relaxed/simple;
	bh=dtJ5R6A3ZLse4s3RrlDnvgvFBAxA6FDusOcrSj7mjmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BJsgs82C0JgDAstDL7NAbdu7ku2/vFL9KD6pNrQuy72Q+hDTMBqIVkIx/gB+pI4mqlXJCkCPUDBa5wryGwR16JK/Y9ehaO2bvRId7NvE+GEcE6zO12NV1O1bNzdrK9viVLMj3OEnCyx6mzOlNa+mNzTax7yK81DpT5b7kG11zqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+SNn29J; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+SNn29J"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3dbf11fa9eso88214266b.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 01 Oct 2025 17:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759364602; x=1759969402; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dP3KlK6HBoqq/H6/SHyIbnppVIsOAShm/Ly+/b5rayI=;
        b=c+SNn29JOHzsbwteW8bjxCZujcg3iSfxG86ZGVbJyL634qVljEyCf3AHjk89A3YFKG
         ivTY+Z9A7e7JdyyhRGt3Du1ljPmjDn7QSXL3zoZBhgrc3KNgc05xGdHM1VISpcGdpjLt
         yMqhxhnSVJElKF8yPRF6dFm7yCiOIKPmowhBGVLcWvNsZdjfgdV0JvjmuM2NIT9DsvNy
         hxGgpGERFp9VVHyc+8ujj0h7GdGjEcv3npvdLuav42lCegIHWglkbUnjWdtV9tmzT1y0
         chR4YxX2G41UY/YN6kwNR1Hi3PPK6FGxJdslbdSKyCA/X5Un37t2+zYYE4pEqpB6H7+d
         cNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759364602; x=1759969402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dP3KlK6HBoqq/H6/SHyIbnppVIsOAShm/Ly+/b5rayI=;
        b=Bb7Nnhf/jeG8ksOCQR/5ud4N2dmtZn/HPHgdqI5zufGBjiHAU5JumtwYSYNqLB0+yK
         3r/HcpnT3QaDUbkGJrXBrEpl/w8EyOBMlvGQuOXY6yRvivjwgCEujB/Eavxqt3BOdIHj
         pa+be5zXWZzzECj2hC736q+3nCDOqOdI1Ql8TKmUG0hFOuZajzcbASGeQ1807vZdBnCL
         WVQDYbJysdTTsQFygrBx033ur8Nqe8dDTW2sjySV3eUuhFODMgPtSsxh+dcsCeAsGCYE
         lD92awj0ptYaTFOzutegfXQZL0s7SECtbCMjpvKdEsByORQI66mii3hey9KJCd3Omv2O
         gAhA==
X-Forwarded-Encrypted: i=1; AJvYcCUUMXjWpVosihAaIA71v0yiReZOJCVF6pn8c6+MZiQZJpSoCKy9XYEjndXOPxeZ5kpv5Ab+AglsL2KkpQPQStneQlx28w==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe7Eg6fJBoXzQtGOQGbkYjl4B6OrRSGEs3FMb7vS6FjvlvIFCz
	dWbtO0lJn9ZTT86l6D9UE5I5ZMQr8bgLVYRU8V7n5DkYnXWO4zutUQ8eLE8poUY9VG/KFtR5yh4
	+MgII2e6epvTsRM/SCnLpsKgczPEdxSg=
X-Gm-Gg: ASbGncvBBLdbR+xCtP5DuW/brh9qhcVPIGAdvAY3L/p0F4o6Fu2bmzi/01DSA4Uw3w3
	tjNKUxwaLqdpB4+68U1rrqMoYoNAvsnqyvu+oa99E9DwbFuulobOgvXVRulBpP7Ocnlmp0mQFTf
	id4wWNZrGzF0Z85khfkszeWCnIraIaUJSvczqBdTz2UjIVqqs2H14MUvB3KFEsmvyLUkg5L7pJ2
	P//YR+fbjTzhqXXRQP2TgAobgDy8NqNcpJGu24nEJTeamaVzjKnpRVLhPLbIA==
X-Google-Smtp-Source: AGHT+IFfIQRLM+t6S4HhYWvy0aAQVlklgUB3UoA9RaJ1ol9pmT510Ejoko85+0gEtF0Ok2VHDxZg2sAJan6zsM1x2dg=
X-Received: by 2002:a17:906:c156:b0:b46:31be:e8ea with SMTP id
 a640c23a62f3a-b46dcef7a74mr632456366b.0.1759364602269; Wed, 01 Oct 2025
 17:23:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0c65e986-77d1-44b4-a4cb-c1a9c2213ba3@app.fastmail.com> <20251001233549.436746-1-smayhew@redhat.com>
In-Reply-To: <20251001233549.436746-1-smayhew@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Oct 2025 10:22:56 +1000
X-Gm-Features: AS18NWBuPDeZRlR07BqdT00dKjAmY-_zwrau3FStcvQqAzDGFaG-cft7DiWcXXU
Message-ID: <CAKmqyKMEJ1VMHHCnUb=hRMZ0V_Vq4x7PD31Ct612Oe08jB9YaQ@mail.gmail.com>
Subject: Re: [PATCH] tlshd: fix priority cache initialization
To: Scott Mayhew <smayhew@redhat.com>
Cc: alistair@alistair23.me, chuck.lever@oracle.com, 
	kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2025 at 9:38=E2=80=AFAM Scott Mayhew <smayhew@redhat.com> wr=
ote:
>
> Commit 9253f9d added the use of the @SYSTEM keyword as the initial
> keyword in the priority string used by tlshd.  Unfortunately @SYSTEM
> doesn't appear to work on systems that do not have a system-wide
> library configuration set up.
>
> Instead of trying to pick an initial keyword that will work on all
> systems, let's instead use gnutls_priority_init2() with the
> GNUTLS_PRIORITY_INIT_DEF_APPEND flag instead.  That will *append* our
> priority string to the default options.
>
> Fixes: 9253f9d ("tlshd: Fix priority string to allow PQC")
> Signed-off-by: Scott Mayhew <smayhew@redhat.com>

Awesome! Thanks for fixing this

Tested-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

> ---
>
> Alistair, can you try this patch and see if it fixes your issue?

Yep, fixes my issue

Alistair

>
>  src/tlshd/ktls.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/src/tlshd/ktls.c b/src/tlshd/ktls.c
> index 50381bf..bc75313 100644
> --- a/src/tlshd/ktls.c
> +++ b/src/tlshd/ktls.c
> @@ -357,7 +357,7 @@ static int tlshd_gnutls_priority_init_list(const unsi=
gned int *ciphers,
>         const char *errpos;
>         int ret, i;
>
> -       pstring =3D strdup("@SYSTEM:-COMP-ALL");
> +       pstring =3D strdup("-COMP-ALL");
>         if (!pstring)
>                 return -ENOMEM;
>
> @@ -425,7 +425,8 @@ static int tlshd_gnutls_priority_init_list(const unsi=
gned int *ciphers,
>         }
>
>         tlshd_log_debug("x.509 priority string: %s\n", pstring);
> -       ret =3D gnutls_priority_init(&tlshd_gnutls_priority_x509, pstring=
, &errpos);
> +       ret =3D gnutls_priority_init2(&tlshd_gnutls_priority_x509, pstrin=
g, &errpos,
> +                                   GNUTLS_PRIORITY_INIT_DEF_APPEND);
>         if (ret !=3D GNUTLS_E_SUCCESS) {
>                 free(pstring_sha256);
>                 free(pstring_sha384);
> @@ -442,7 +443,8 @@ static int tlshd_gnutls_priority_init_list(const unsi=
gned int *ciphers,
>         }
>
>         tlshd_log_debug("PSK priority string: %s\n", pstring);
> -       ret =3D gnutls_priority_init(&tlshd_gnutls_priority_psk, pstring,=
 &errpos);
> +       ret =3D gnutls_priority_init2(&tlshd_gnutls_priority_psk, pstring=
, &errpos,
> +                                   GNUTLS_PRIORITY_INIT_DEF_APPEND);
>         if (ret !=3D GNUTLS_E_SUCCESS) {
>                 free(pstring_sha256);
>                 free(pstring_sha384);
> @@ -461,8 +463,9 @@ static int tlshd_gnutls_priority_init_list(const unsi=
gned int *ciphers,
>         }
>
>         tlshd_log_debug("PSK SHA256 priority string: %s\n", pstring);
> -       ret =3D gnutls_priority_init(&tlshd_gnutls_priority_psk_sha256,
> -                                  pstring, &errpos);
> +       ret =3D gnutls_priority_init2(&tlshd_gnutls_priority_psk_sha256,
> +                                  pstring, &errpos,
> +                                  GNUTLS_PRIORITY_INIT_DEF_APPEND);
>         if (ret !=3D GNUTLS_E_SUCCESS) {
>                 free(pstring);
>                 free(pstring_sha384);
> @@ -482,8 +485,9 @@ static int tlshd_gnutls_priority_init_list(const unsi=
gned int *ciphers,
>         }
>
>         tlshd_log_debug("PSK SHA384 priority string: %s\n", pstring);
> -       ret =3D gnutls_priority_init(&tlshd_gnutls_priority_psk_sha384,
> -                                  pstring, &errpos);
> +       ret =3D gnutls_priority_init2(&tlshd_gnutls_priority_psk_sha384,
> +                                  pstring, &errpos,
> +                                  GNUTLS_PRIORITY_INIT_DEF_APPEND);
>         if (ret !=3D GNUTLS_E_SUCCESS) {
>                 free(pstring);
>                 gnutls_priority_deinit(tlshd_gnutls_priority_psk_sha256);
> --
> 2.51.0
>
>

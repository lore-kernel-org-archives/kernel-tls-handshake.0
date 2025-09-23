Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8712A30BF71
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Sep 2025 20:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758659288; cv=none; b=uNJfYyIvmFGptWYMucCwX3mQFvRB7pFBk0qYEN0kT9sEMtC+B599ItHKz68geeuECf9z9lqwTmFfQfmTeG2IzKT3qSzwbD1KuO8bxjByJia7PlWrLkV//yGHiLH+nvkSwHi/ywIAZUa/0XTOgoJGPAx4EL0N/dv1bLxzJuBRzFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758659288; c=relaxed/simple;
	bh=r09rLEP/NKgrcgwmNA+dWJv0EAcmZb0gI6/1ZeFH5VA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Onmr1p77L4NQAZDeIf74MqWPfpCWlpoZn3L8TyYljzxbmJaxakYUDDmErcQpAP23vZnSXyCX28SRZmVlvUEm6Ho4n8RCru/uGTd/4ed42ZsBHpMMEhWv1amT5O/fb35M15cdV3wSoyBL+5sdqgV5bw4fyvJSkQ0Gy7qrt73MoMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZ0wJotL; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZ0wJotL"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso5677028b3a.2
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Sep 2025 13:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758659286; x=1759264086; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrqMuL6Q5I2f+ObqtGSiwW8f9jgAa2qGkkj+QZFknTI=;
        b=SZ0wJotLGf4i6rrQVLd0blpp4huz3SLeILfvY5IB7H+gFmJ59u+Ez+nhuXxpn1nAQt
         8MwtX6+TqSse3/ri8MRLc5RNv4edBye4yeWfAZkweOz2phc08ZlTSkJOiMZ6PRj8fH8b
         TjJOYU8iJ2xglHahTN65F9f1gxBnajLKaJQrQMULUYUvbX2oeEYwzOxR1rhnu6FnOeLW
         FWc07751iF372uwR4AmoRUCi+4Fdb7ApRyDZ9gBq0rIIILBLXmKnuZpqYBLIm4L/88VK
         WwQuv8AVZI7e8+vYY3oWjabNM79NGIUrBE5vzm5o5jFnvixVu1Pznn/NSK7F/iNkgfQR
         ZIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758659286; x=1759264086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrqMuL6Q5I2f+ObqtGSiwW8f9jgAa2qGkkj+QZFknTI=;
        b=hjQAnfLWQFnXcI1l6sLqOd4eje0ZZRl8vVpUuuyDeQneAJRrL1/UZumOEmqqHRcYph
         lXsKN5UrNAonvViyFZkZyPKMg5gM+/xyn1+P8ttEVSTAtonEuswarZ12yir9KtGOpOjX
         52YL3hPrZjvIZ2o5VduUyW/RD0Buql1LebwDjP90dQJj4GxnilcL6MKm4UM8acEf/uan
         w3tzsrj62PYOU9s7Q4OgCl17oz2Os5saeaTYFhUCdonXABG7wxRMoKM4AbxaXkDTMLma
         9Y65/BVpSmo/8IHYr2pE/V0dkNj/iX3e8tADaXrj0TGcD15cR7em0rkhvnpQEyjz3ifz
         uKow==
X-Gm-Message-State: AOJu0YxbhEwo9uqKrZk4CtiA1foNbhPsKyXVfTgp2tByGx8DYVd+wlp5
	6abNDJk7wJK+d4cwRqGCpxIMi0EEt7n3AKf25+WLdWvpeDW3h92y2PiGQ5gy31xxfAvfXueL9ug
	48Nay4sVg8OrCg9FuUY7VSKaIP8egLnCWyQQ/
X-Gm-Gg: ASbGncvWn4ua/1m1D3vVsRhXh/0gP/o8j+5EkEy29rRqL0RzI3QgxtbtXEJMcJXOA3w
	3kq6GEMJeu4mhAAo0rMjrmrLXdBWei/pMVg3XcSoOakc8SwCmiElLmIMDwjg9TUcXV6LS4k/rVe
	YCar2KL1N0208HYGvdtz7lGBoFen0a7Ta3UpTBtHVzYgQTWUY1FWs7Qm8JwtIdm7+NuMVUOvWPc
	4rrK5q2rA==
X-Google-Smtp-Source: AGHT+IH0omua/3/0oyjAn0t5sztlt96CSCdoGiqWzg9oke34TfKB3MsapSLiV7Bxt/afcV2hbiV64jCFuOkLkju+Ckc=
X-Received: by 2002:a05:6a20:4a1e:b0:2da:f4be:c8d9 with SMTP id
 adf61e73a8af0-2daf4bed03dmr1279082637.37.1758659285750; Tue, 23 Sep 2025
 13:28:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250922220710.1255102-1-cel@kernel.org> <c23cfb52-70ab-4dd0-b0cc-c83e42af60f3@oracle.com>
In-Reply-To: <c23cfb52-70ab-4dd0-b0cc-c83e42af60f3@oracle.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 23 Sep 2025 16:27:52 -0400
X-Gm-Features: AS18NWBnqG9wVq2Zq30r0mkFiH3JYAxuuIMFR3w_0Z7ncDjIdoyJc1EwgKRNWF4
Message-ID: <CADvbK_eRuUQ9ra4udyZfJ=PTY2xFR0jTUE9stPkMZD1teeEcOg@mail.gmail.com>
Subject: Re: [PATCH] tlshd: Return errnos from QUIC helper functions
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 3:18=E2=80=AFPM Chuck Lever <chuck.lever@oracle.com=
> wrote:
>
> On 9/22/25 3:07 PM, Chuck Lever wrote:
> > From: Chuck Lever <chuck.lever@oracle.com>
> >
> > Static analysis tools have noticed that
> > tlshd_quic_serverhello_handshake() expects its helper functions to
> > return errno values, but two of them return GNUTLS_E_* values in
> > most cases. Convert those functions to always return errno values
> > or zero (on success).
> >
> > Cc: Xin Long <lucien.xin@gmail.com>
> > Fixes: 43a15fed2f33 ("tlshd: add support for quic handshake")
> > Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> > ---
> >  src/tlshd/server.c | 54 +++++++++++++++++++++++++++-------------------
> >  1 file changed, 32 insertions(+), 22 deletions(-)
>
> Xin -
>
> Looks like src/tlshd/quic.c has the same issue with conn->errcode.
> Callers expect an errno, but internally the utility functions set that
> field to a GNUTLS_E_ value.
>
> Can you apply this patch, fix up quic.c as well, and then test both and
> post the fixes here?
>
Sure.

But conn->errcode is used to pass the err to parms->session_status.
What does parms->session_status expect? errno or GNUTLS_E_ value?
looking at tlshd_start_tls_handshake():
                /* Any errors here should default to blocking access: */
                parms->session_status =3D EACCES; <---
                switch (ret) {
                case GNUTLS_E_CERTIFICATE_ERROR:
                case GNUTLS_E_CERTIFICATE_VERIFICATION_ERROR:
                        tlshd_log_cert_verification_error(session);
                        break;
                case -ETIMEDOUT:
                        tlshd_log_gnutls_error(ret);
                        parms->session_status =3D -ret; <----
        parms->session_status =3D tlshd_initialize_ktls(session);

It also seems mixed, no?

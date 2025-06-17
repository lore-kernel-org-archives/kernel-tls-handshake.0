Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC2CC2D1
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 17 Jun 2025 05:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750137745; cv=none; b=Upp5teRzrVZsAeTlRRgS/5VvIb0ELqNUMQ/ZoOvtFlT1cudsBSrN+8v0KVfNMZw03v+oyFJrKNf3fS+SqCqgM3WOR6LNSA5adyVRPkzvGacD7tdZCUY26wTVP+T9Pfvo7VvDGNHLLFwNL2EQE1z0R6CQiR88KwoqQgL3DNbcMwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750137745; c=relaxed/simple;
	bh=gDkkrmKYx7esslFvIs1PakSEjCMzWLRFbzZpSsSI15c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sjvjlQ0fjUQ/+S1frNoddZbmabcrIxKic1BH+AeD0aXXyZKbKu3S4Z3+gW0a6NpL9sTf+v72G93z0lpkKnALDVMkntx7izzSr0WDcFKZNN9GwCIwzRL6t/ZXtjpo6P9YTVNlJSFVC4FhdmgFouclhmTRfQgFLLzsQsOSGXXaIJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gobJQTQL; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gobJQTQL"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6097b404f58so1890535a12.3
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 16 Jun 2025 22:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750137742; x=1750742542; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iJVDDc2TZP0TEyxflV4CCdKu2FUfhz98+N6IwaT9uo=;
        b=gobJQTQLZxmvn2iQ3fdxVzfP6DUqaTf56wHJI2gzLtONUJcWwySdHOQXRAiGosxJHI
         7ZkJnBc8z3l/z7M5YNUkl/8IHN9RDxeGilD11aSBhKVylodQsjgGKomyQwoKl7YQVZJn
         xsU95vWcLtPLJm8LKZZw9iZ4Zdk5oXq/cxgVNjxld5SQVW7OiQzkt9IFNxiHQQe3kmFg
         z9+US8xAKvIZwSOJs3u1dV20ikTPxkdJggbivyIhnrJjWbPvqjizaRDC2NxG1uKNuQT3
         KK9Es7cf6cD4KYjhmWLqqDEyM9IizDP1GHnCHuoyj4HsoyZnAi29rdg3MBxlQS5loGt4
         ncUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750137742; x=1750742542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2iJVDDc2TZP0TEyxflV4CCdKu2FUfhz98+N6IwaT9uo=;
        b=CmBIxgcfY9qE9nO5kOYUt/9P8lWcEBOm1P9r9AogGV8PT+X3Gt3nMHl6k1ctcvpLmS
         lnEiorbxu97SN/LkAtXnAGdPc49LaW7o+KZSCF18VpW1P57PmEBeSQ/7mTgMWsMz1BfP
         eJf+suQ/GagfdT18VyPCKvWyhU64p2aVx95ijKL2hChSYhTueVyQ0s0BQUA40mzcejjR
         YhY8jRdboVFPVOdmRsw04el4yhkp4un+Op/rmCN8BbNQ5jvN+xHDeNegAfJk891+sdW8
         +cGvPPDPGemWgDNHrM2nAhWQQXwXo3og6dKVjXjezgiXPMQuelQQ1L3mNfB/LqrhTDrO
         ktpw==
X-Gm-Message-State: AOJu0YzKcsO+A46PkaCkSBgEGklC0mj4A3bFR952acFo7IzeCSAK0/c8
	mH5625D4y3Vz5NBSWBFGSJd0NSlW1aM97PhJv5LYwuYBHkRBUF9wXwOvwW+whF2rFTHoaWwfyYh
	Tz3Co1lGn7aKlGawJj2V3VcXKtE/n0kk=
X-Gm-Gg: ASbGncvS6KodAEqQMaUmyDnTuptKkWZhaor15+G4BwiPYDlTg0X/EGgob2RXunprgpv
	rfta6L/YtO7cCxjc53sh3gNfNGGsI6BlkZyJZQwxUaM30quXarbuSLUwngbCcS1nW9ZgS8Tky/u
	3jnD1vbN2qVdhHgdsFHexb1OMEMbzGHuwOSpt7G+6VRKC1G3eLoah4uTcnXw==
X-Google-Smtp-Source: AGHT+IHMDrawzKM+l6mxj98Yem5oKx5jbkzSbSLz5AE2yoeElYDTMJmPE7bCzrR7Z/abJI1fzIEXDN3zh2JbzzM0RXk=
X-Received: by 2002:a05:6402:350f:b0:607:2d3b:4827 with SMTP id
 4fb4d7f45d1cf-608d09ef402mr10884160a12.30.1750137741804; Mon, 16 Jun 2025
 22:22:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611070943.235087-1-Rik.Theys@gmail.com> <d4284f09-def6-4037-8685-f678fe9cfc69@oracle.com>
 <CAMApiK_EsvOXrdSYgG6Kfnd57AChBML9v7Wj=xwFvLFk1eeNKw@mail.gmail.com> <2e28a18d-145d-48eb-9111-65b5dfbfe818@oracle.com>
In-Reply-To: <2e28a18d-145d-48eb-9111-65b5dfbfe818@oracle.com>
From: Rik Theys <rik.theys@gmail.com>
Date: Tue, 17 Jun 2025 07:22:10 +0200
X-Gm-Features: AX0GCFsAC6SF7bgSJEUnrqfEHOKoS3d1P9Vt1fJRYFY_5jflUdPm-3XabIMbFXE
Message-ID: <CAPwv0JkNRFsDEqXnSO0JNm-7a5LmgUf-zi32T+Prkyyf_tt3Kg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add CRL checking to server and client
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev, Long Xin <lxin@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 16, 2025 at 4:40=E2=80=AFPM Chuck Lever <chuck.lever@oracle.com=
> wrote:
>
> On 6/12/25 10:28 AM, Long Xin wrote:
> > On Wed, Jun 11, 2025 at 9:49=E2=80=AFAM Chuck Lever <chuck.lever@oracle=
.com> wrote:
> >>
> >> On 6/11/25 3:09 AM, Rik Theys wrote:
> >>> These patches add CRL checking to the TLS client and server code.
> >>>
> >>> It introduces an x509.crl configuration option that specifies the
> >>> location of a CRL in PEM format.
> >>>
> >>> The CRL (certificate revocation list) can be used by an administrator
> >>> to block access to certificates that should no longer be trusted
> >>> for some reason.
> >>>
> >>> See https://github.com/oracle/ktls-utils/issues/103
> >>>
> >>> Rik Theys (3):
> >>>   Add server-side CRL checking
> >>>   Add client-side CRL checking
> >>>   Add x509.crl option to man page.
> >>>
> >>>  src/tlshd/client.c       | 28 +++++++++++++++++
> >>>  src/tlshd/config.c       | 66 ++++++++++++++++++++++++++++++++++++++=
++
> >>>  src/tlshd/server.c       | 14 +++++++++
> >>>  src/tlshd/tlshd.conf.man |  9 +++++-
> >>>  src/tlshd/tlshd.h        |  2 ++
> >>>  5 files changed, 118 insertions(+), 1 deletion(-)
> >>>
> >>
> >> Also note that this will need a similar code change to the QUIC paths,
> >> eventually.
> >>
> > Yes, there's no difference for the certificate credentials
> > configuration for QUIC.
> >
> > I think it will be nice to have a function like:
> >
> > static int tlshd_server_configure_credentials(gnutls_certificate_creden=
tials_t
> > xcred)
> > {
> >         char *crlfile;
> >         char *cafile;
> >         int ret;
> >
> >         if (tlshd_config_get_server_truststore(&cafile)) {
> >                 ret =3D gnutls_certificate_set_x509_trust_file(xcred, c=
afile,
> >
> > GNUTLS_X509_FMT_PEM);
> >                 free(cafile);
> >         } else
> >                 ret =3D gnutls_certificate_set_x509_system_trust(xcred)=
;
> >         if (ret < 0)
> >                 return ret;
> >         tlshd_log_debug("System trust: Loaded %d certificate(s).", ret)=
;
> >
> >         if (tlshd_config_get_server_crl(&crlfile)) {
> >                 ret =3D gnutls_certificate_set_x509_crl_file(xcred, crl=
file,
> >                                                            GNUTLS_X509_=
FMT_PEM);
> >                 free(crlfile);
> >                 if (ret < 0 )
> >                         return ret;
> >                 tlshd_log_debug("System CRL: Loaded %d CRL(s).", ret);
> >         } else {
> >                 tlshd_log_debug("System CRL: No CRL file configured.");
> >         }
> >
> >         gnutls_certificate_set_retrieve_function2(xcred,
> >                                                   tlshd_x509_retrieve_k=
ey_cb);
> >         return GNUTLS_E_SUCCESS;
> > }
> >
> > then use it in both tlshd_tls13/quic_server_x509_handshake().
> > and do the same thing in client.c.
> >
> > Thanks.
>
> Rik, do you want to take a crack at the suggested code re-organization,
> or do you want me to just take your series as-is and fix it up? Either
> way is fine with me.

This week is a very busy week for me. I can look into it next week.

Feel free to take the series and fix it up as you've suggested.

Regards,
Rik

Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F011B85653
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Apr 2024 18:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713898335; cv=none; b=grmlBO4sX3wndN9Pc4faqxnI2tIyibLVSGOKdWDAP1J3kYi4WsEt2avEyzNxCkmq6SE6ELhlnjBDHSrQP/KIId44fzZ5MXjkxFmbKSRnqjSs6wxDpBIieo885jJ1TpOMN8N6rDGm/WmTSGXU7U5excYj3To/EIhIM3x5ZdiAUww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713898335; c=relaxed/simple;
	bh=LhivqZbKB7Ey2bfljRJA2kiqEIkIKfsUGAmwJLPo94s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DB5nfMY7AxCxGfA+nOrs2ie0V4vjOsV+JKRCn3IhE8+jUGQifvPI3RNGW/jqk7fnBgoVYOcAskH2dGmpskiMZDvS3Cjs/ofVMgiIqsztil69SumjIYnvxJEtPyKZN8iJuPKHOpp2CBY24INf1HCGiCMF/lBweY5TyNNz5nx14Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=BfL2gAdp; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="BfL2gAdp"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2dd80401e81so2456641fa.3
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Apr 2024 11:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1713898332; x=1714503132; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4zQBZUwVDuZk6/HAaDyT6xWnUO7UJgfgSV+iNOUmss=;
        b=BfL2gAdpAKhqjlWwd20Nk5nBbhM7qxHgiVTYVpliJ5UH1Jr8dT9A5IG0pJoipq7xI0
         sdx1fjArP/UYW5ROphIPjt280FJ+mB7C67bq/OoHss4+AH6T+QwJHHx5nokLgfJN/nam
         p23m4DGg+rRLOGxYfi3GiTG5qhcQP6bH/OwTbKD8LCZprnQj3EwBs+74pslnWd/ywaha
         5IMCE5jX1Tv1aPGO/+uVxb+SBf7pent34WyzlTNnq2w+n2Od/OTBOCFzZ5Er35Ovn2TI
         84AC4zElPLV4n1IAFucI98ijDH2qMnF1jrUMn0uR2juvJGexJitMuDbl6JUQ45jkLKLb
         G5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713898332; x=1714503132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4zQBZUwVDuZk6/HAaDyT6xWnUO7UJgfgSV+iNOUmss=;
        b=CDiMH+f9S1YA4EAuZA9UwDN0NzyeXZnEawfaD0Okl6g0LF6Ro2cD/iWR/e+1r75yVB
         T7LrCUc+N44b2PEJlLIKDfT7dyjD3WqhYk9Qz/FHHuHiDlps9op3W3pBzG+XIqO+cv7R
         AOYEFYnfJk0W5VCiSRPTNJza20v+T2y2N5S/r/wDtfNMFCF0HyyZY/5s5eDcOygNt/wX
         yazGwswTd+wNdDZAm91GdirXIQd935OgxD8Rv1idjc+z3ofsXZdAXfmnIsc+naxAn4Qg
         SKyImzO9wq83twhtZH6q6ErKHmqjPbD5hS8kf0nL8zGkdPh84lR74xLW5Nk4hMHelaez
         HXjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpXnKwVhwaBANumbRSLKurCLxLeIrU+tDYYwlnlhSYTCMv/DXsrTDjkVcsSVlpzjFCwH6aXTeRF5J2VIyEcnI6GW0rgqg6q4ri70ta2uQw4D8i74M=
X-Gm-Message-State: AOJu0Yz/Bz4pvFA1PoWLoIu+v5hmpQl06Rvyq0qMsUcDPNQ/9f+O3V6F
	mDFf5Mf6JwUPLLQQQ86fpo2+q9/3OA9kWV5bE8FoQD2NfrIuQasVpf8iis1xPrtEyPjbgzPlIK9
	3aOtuc3qNFo7ejVCu71u6dJDZSJM=
X-Google-Smtp-Source: AGHT+IHKDqBUR++Obmn2PvDsa2V8fl77wQ0T3yTKfVGgHI/xtZzHCqO5nQ14VDgc/u3gmoOxUT86h0X/GYVTE/hhKr8=
X-Received: by 2002:a2e:9517:0:b0:2d4:64b1:25e4 with SMTP id
 f23-20020a2e9517000000b002d464b125e4mr69081ljh.3.1713898331821; Tue, 23 Apr
 2024 11:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <F55B5C06-82DF-4896-BBF6-EDF59ADC9693@oracle.com>
 <CAN-5tyEPHXXnCQZdnvsFvYENeCB=52afuebpfK323Goz+dHCXQ@mail.gmail.com>
 <AD446B51-7488-4F07-9637-39E8FD452D97@oracle.com> <ac997b67-ad82-4e98-81fd-ac01ea13159c@suse.de>
In-Reply-To: <ac997b67-ad82-4e98-81fd-ac01ea13159c@suse.de>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Tue, 23 Apr 2024 14:52:00 -0400
Message-ID: <CAN-5tyE6GAB7XTDGcbW-7EO_xiL67KjoFQsnEA4_4vvQnPUgBg@mail.gmail.com>
Subject: Re: ktls-utils PR needs review
To: Hannes Reinecke <hare@suse.de>
Cc: Chuck Lever III <chuck.lever@oracle.com>, 
	kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 2:53=E2=80=AFAM Hannes Reinecke <hare@suse.de> wrot=
e:
>
> On 4/22/24 17:59, Chuck Lever III wrote:
> >
> >
> >> On Apr 22, 2024, at 11:55=E2=80=AFAM, Olga Kornievskaia <aglo@umich.ed=
u> wrote:
> >>
> >> On Mon, Apr 22, 2024 at 11:16=E2=80=AFAM Chuck Lever III <chuck.lever@=
oracle.com> wrote:
> >>>
> >>> https://github.com/oracle/ktls-utils/pull/54
> >>>
> >>> I seem to recall a similar command line option that we
> >>> removed because it was insecure.
> >>>
> >>> At the very least this needs a man page update, but I'm
> >>> not convinced this setting should be allowed.
> >>
> >> I agree.
> >>
> >> Can we have this only available under some strict usage? Like it can
> >> only work started in the foreground (with some -d flag) and it=E2=80=
=99ll only
> >> run for 10mins and then it will exit=E2=80=A6 something like that woul=
d
> >> prevent somebody from using it on a permanent basis.
> >
> > Interesting idea, that would ensure it could be used only
> > for debugging.
> >
> > Reuben closed the PR because he is having trouble with the
> > OCA signing. But you could add that suggestion to the PR
> > and see what he thinks.
> >
> I am not sure if I agree with the argument; after all, openssl and
> gnutls both have a standard option disabling the certificate check, too.
> And you might be needing it under certain circumstances (Self-signed
> certificates? Initial deployment?).

But do browsers have an option to not verify certificates for https? I
think we need to look for real world applications that use TLS and see
if they have options to do no verification.

> What we could do is to delegate the functionality to be command-line
> only (and not via the config file). That way it'll be immediately
> obvious that this option is enabled, and we would avoid proliferation
> via a forgotten config option setting.
>
> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), GF: I. Totev, A. McDonald, W. Knoblich
>

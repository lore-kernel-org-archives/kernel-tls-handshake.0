Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFA76ADC
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 14 Apr 2023 21:16:05 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-63b5312bd4fso2704590b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 14 Apr 2023 14:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1681506965; x=1684098965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEKW2688c3tEbZ2tY6UUOtCRD68njGcOwr2fxmmT0O4=;
        b=K4mKJ2RxhnfCOWTLm6WwhXVQpLp0ZEEs+6ceJ4wnxMQbCpp+MEKL5PPAm7qz+6prpi
         KLXqnSuFz4KQVWLPuvccvm6AWi1+8XptGhAKa9aZn1zEsUELtleF/d++hwac4d3aYKtE
         8wkIwig2ExSE6dy012og41QTyFULeBmUj4lwUs3ttC5ln50nIpEnWrasc+UP5WO4abfk
         qyruKYyYeJyi8Nd8w/+89s1hcjbo35lOSfU+Ik/YrOX6QEPiExiOimwjBIDYA2EMYeaN
         paPEJmpQPBvLunNGYSFf32JFCGXT4PxeM1k/PF+KiUOtpIUy5A48S44kgWeLwAn5PH/+
         aGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681506965; x=1684098965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEKW2688c3tEbZ2tY6UUOtCRD68njGcOwr2fxmmT0O4=;
        b=fhlBEy2IyOjfKfi390Nahf6FuyvPsLmwtmHe0UoofXVww8Nmlh0T4pqgB4wa1Y/qWK
         PKPrczyFUILclLtjHrGun6DcoyM58CsVJHb6/GBSyXmE+EDRrvLVHbQzbsjMqW1Cx3lP
         YgNyPzwnKqjyCuIMTGCweBPP9YB9snjt1YFFhbT1h7qLvnu2gLW+hs/1lCMj7nvTWRhH
         bZ7NU1TfGB+k1mk37KcZKOBVFxbyojQmgA9DOesdKmw0yedagrRYdcjgPS216xvEMMgG
         AbjSHVICNU9snfSLNCv70OFmPfq2jGPmgWK+B1PyDHmWfrqlE15+sagrYbIe7gNKvebU
         dLpw==
X-Gm-Message-State: AAQBX9c8YeL6POLQrYaC1smC+2+UbVK2iE3/dRdhKW4fRs8ZGW1PVli8
	BKQJucDBS08xVeQsWWIZTuls/64O6//mD8Hx3g0=
X-Google-Smtp-Source: AKy350aZVFr/fzD7N0w2FyCayG5TCqM0E3f4Fg/jALHQ91Sk0TiTCiQ6J0s7gwDbuoGkT6m44BJBdOrNkXP3RuVR3QQ=
X-Received: by 2002:a05:6a00:2d89:b0:63b:7263:b8a7 with SMTP id
 fb9-20020a056a002d8900b0063b7263b8a7mr1317864pfb.0.1681506965096; Fri, 14 Apr
 2023 14:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAN-5tyFXD4JuGg-rjPSU0iHftrJM6Ypu=hhCK_s9qVi1Ld=FWA@mail.gmail.com>
 <5F137415-B46D-43A6-B6E8-5CB48378BE5F@oracle.com>
In-Reply-To: <5F137415-B46D-43A6-B6E8-5CB48378BE5F@oracle.com>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Fri, 14 Apr 2023 17:15:53 -0400
Message-ID: <CAN-5tyHjqnd8fXyJmsZ7E45JWYBgpczyu8AynyKKLYPXFEY1DA@mail.gmail.com>
Subject: Re: advice on kernel configs for NFS with TLS
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2023 at 4:42=E2=80=AFPM Chuck Lever III <chuck.lever@oracle=
.com> wrote:
>
>
>
> > On Apr 14, 2023, at 4:14 PM, Olga Kornievskaia <aglo@umich.edu> wrote:
> >
> > Hi folks,
> >
> > Do we have guidelines for how one were to build a kernel that would
> > support NFS with TLS? As in what kernel options are required to be
> > turned on (and what off)? I was under the impression that if one were
> > to start with a base RHEL9 kernel config that would be sufficient. But
> > I believe I'm wrong.
> >
> > For some reason when CONFIG_KUNIT is enabled it leads to a kernel
> > where the upcall doesn't happen. The kernel logs that it did
> > handshake_submit() but the tlshd never gets anything. I don't know why
> > this kernel options leads to this behavior as I'm at a loss how to
> > debug netlink upcall.
>
> handshake_genl_notify() is a no-op when CONFIG_KUNIT is enabled.
>
> Not suggesting that's the best long-term arrangement, but
> notification is disabled when KUNIT is running so that
> the Kunit tests don't depend on having a tlshd running.

Thank you for the explanation. Is it fair to say that to have NFS with
TLS CONFIG_KUNIT must be off? In that case, Jeff, what will RHEL do as
it defines it by default? Or does it mean that handshake_genl_notify()
needs to be reimplemented to make sure it's never a no-op?

>
>
> --
> Chuck Lever
>
>

Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C2A10A01
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  5 Jun 2024 14:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717599032; cv=none; b=YIfgliLJ0TC4IFLyOOZZqrV1dMpd6wcmtWDlVbO8PHIJYMQozb+TMBFyoxqR1bQVZ2OE9z9YG41z5JHirhBsb5pKemavdQf4fHBZ62nmC04VFwsSTACq2z9ouaiAm4wrzy37RvmKZV2RmrlcQmwZBlEfQ/lo82nvMY9xTbTeknQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717599032; c=relaxed/simple;
	bh=VMb4W2PGLS72s6+XBOXMtkPMP/inIO0o6vz1SZJf2MY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gc/JNgrV4PoLDCVZ9zY8NRpgoeBdx4WkxaHbKP9DHkxsC7ai7REruNnNnfiFFZluKBJkPaRTQB8ZcVUNLsLiLqtJ7jXzfrmoe7AflR2YeE4shfjrg9Ntm3mXZpm/gaVvyXzh9i+TJqY6nuit5cnWFE2wIMIp86n5LRCE0G/MnGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZ+ZPlnF; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZ+ZPlnF"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eace59a47aso331211fa.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 05 Jun 2024 07:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717599029; x=1718203829; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMb4W2PGLS72s6+XBOXMtkPMP/inIO0o6vz1SZJf2MY=;
        b=cZ+ZPlnFcCFEz1gOdFAVDl+dnkoAafX7TJLech1yDCqH+zrjotMOEG+KevDA8/L298
         ZsnOHqaUEHp6PmstUcVZGXiDD4xsoVu4bIgJ88ux7VPEsAdwNHJpPQ1MHgDWGXACd7oW
         uC0MGbgiUCwd5/sMdSr/J8cIoBOYWzAVJndZJP5YpX+Y0y7h3dv4mT7Jj4L/DtwvagLA
         4ciAsQHfv747ArLAc7EKThDhKJqE0WF4J6VVnOkhgIayJ5NNPd2W+5aLhH9uQWgXJKXA
         Dupvu32WbBmRHRfLrscmIWwRW77WBxomva2mv6OZrYvNcfW9s7Mszs4PyHtVkPHLxicv
         aYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717599029; x=1718203829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMb4W2PGLS72s6+XBOXMtkPMP/inIO0o6vz1SZJf2MY=;
        b=pWp3AHWr3btA0dQedFnJ+xzEX4c35y38tKSwn4E4refnf8LiUFAMiqrK4yO8XLQMre
         9N1MqUUizU1wkEzAtJ7U7NFMs79Ho8tMGKwMUQYVmjNWF9gUkPrOlKY8QlmDXp2lcgTi
         umPwxuwWpSIJQWi/M6Pk92hge3tsX8C8iLJhaetIFU6JJqPDg2GZWRWh2nVZrY1zHEPa
         mlT8jEaWsVA0i2kcx3307jwOAjCrlwYac8Mua9kj0bzypU2UPcZZ0rYUpf6SuvDmjeB7
         FRQUKje83iJ82Q3qSVyZAkWYbrwYApddDWLmk4w0zRg31qk4q2unwI4coLSoBEbkwNpv
         +mlw==
X-Forwarded-Encrypted: i=1; AJvYcCXwK/KBMfsJ0AuZYVK96AmkUAYd0484PFQedKLanmP3MBS5CySOlvSG1UgSAtsY4Nl4BcxOjx0iSTWoi/UGxDFfrfMbZsK/tKaNACLXpbGHFvvNE4M=
X-Gm-Message-State: AOJu0YwJcG3N3NeGc04CrK34C8lrU+gb+UwYDfckMdZY5wVZd4jtsWbg
	10vRH7zTFheq68cBnvxxKrNg0T6a7NNknIf1sk2i0IuwyKb3Vj1jk4uJfVt6KCpn3aZAKVRlwff
	CiDhn+vI12Ix6gKFFSrwck5LlM8E=
X-Google-Smtp-Source: AGHT+IGmtlBF29alJXI7UNEaFCXDV4hwlGENXuUevXKL1OvEnq02+MJ13obXYqmP3GERPf5gna0CZoGovs/yM2NOUaU=
X-Received: by 2002:a2e:8517:0:b0:2df:4bad:cb7f with SMTP id
 38308e7fff4ca-2eac7a13151mr13291411fa.2.1717599028362; Wed, 05 Jun 2024
 07:50:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAN-5tyGgNks+gwSScNpaBrf8ogAv5iLTQ3eCd857ULh6gn-b_Q@mail.gmail.com>
 <63F4681D-E7A0-4860-A4B8-0D7BA9818A62@oracle.com>
In-Reply-To: <63F4681D-E7A0-4860-A4B8-0D7BA9818A62@oracle.com>
From: Olga Kornievskaia <olga.kornievskaia@gmail.com>
Date: Wed, 5 Jun 2024 10:50:16 -0400
Message-ID: <CAN-5tyEP-+s_8LppBqos0+sWTbUq-nwL6+q-rSK7tz6Gzd2B-w@mail.gmail.com>
Subject: Re: tlshd.conf question
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: Olga Kornievskaia <kolga@netapp.com>, 
	kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 9:49=E2=80=AFAM Chuck Lever III <chuck.lever@oracle.=
com> wrote:
>
> [ Redirecting to gmail/netapp addresses ]
>
> Maybe <aglo@umich.edu> is not subscribed to kdevops@...?
>
>
> > On Jun 4, 2024, at 2:41=E2=80=AFPM, Olga Kornievskaia <aglo@umich.edu> =
wrote:
> >
> > Hi Chuck,
> >
> > Should "pathnames" in the "authentication" section ignore any spaces
> > that might be present in the same line after the name be ignored?
> >
> > It took me by surprise that they weren't and it took me too long to
> > realise that I had:
> > "x509.certificate=3D/root/server.crt " and not
> > "x509.certificate=3D/root/server.crt" in my config.
>
> Agreed, that's surprising behavior. tlshd uses a popular
> library to parse its config file... maybe there's an option
> to the library API that can get it to behave better.
>
> I would like to be able to support blanks inside of path
> names, but I'm not sure how that would work.
>
> Anyway, can you open an issue tracker ticket for this?

I have opened it.

I think as a first step, my initial suggestion is to update the man
page to highlight the fact that names shouldn't have any extra
characters appended. If that's acceptable I can take a stab at the man
page patch.

Don't we want to allow having spaces in the pathname? But I'm not sure
what real value is to have a legitimate name that ends on space or
tab. But if we do allow spaces in names, shouldn't there be rules such
that the name needs to be in double quotes? I would like to add I have
not experimented with creating and using such name in tlshd.conf, I'm
just speculating here. You mentioned that tlshd is using a popular
parsing library which perhaps lists somewhere what its syntax rules
are?

Regardless of what is decided about the spaces/tabs I feel like this
should be agreed by the community and then documented in the man page
as to the appropriate syntax to be used?


>
>
> --
> Chuck Lever
>
>

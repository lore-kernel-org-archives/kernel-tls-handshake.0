Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AC81BDEF
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  6 Jun 2024 21:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717707657; cv=none; b=WDRgZwN4FZxl5fw3FXaLpQ9XsjE6Yi1/EEfTM5Z/vtVNa+qHjuLpzaNt4qSTbp9bDPynUwuGETOM2Gn9RfdWUE7XrCGAAHCKUQ3+axHQSDDK/1zKvlJIkfQCq0ETMrf+QGd+PWa13hzVJgCxuhEGL+PMRkzH0+akBIJH2BwXSF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717707657; c=relaxed/simple;
	bh=EB4Vil5Y24ZwzlfAPD4mDDbT7dJ1qdsdgf7DA0pKCZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MBiV+7Ggrw+vgGadnV+hZumuNmX/w0qEFBzjx/yPjp2mnq57lPnUPQK+AGWvz2C9Qi+u8dE3+3/pki5Sj1iOwWchaG5myq2WoOeSLexC1yiyW8UAZQfEnaW6GLGs84ExAAkdsErTwYL+2kYq+RsrIZdI8il0FmEsiNaTvzaD9+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfQJXMaG; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfQJXMaG"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52b904713c6so268673e87.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 06 Jun 2024 14:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717707654; x=1718312454; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EB4Vil5Y24ZwzlfAPD4mDDbT7dJ1qdsdgf7DA0pKCZs=;
        b=SfQJXMaG18zLSmejgXjNh0iyjEbYVGgZy93yX0JreOIw7vpB9gZ+RPcDQhbMiDp6+V
         Z9U8qYKrOGXG1y3AHe0gFgrbG2Kp9+RX52pKLatWNWgerw8IIoEBMcsiIu67kAXuDb99
         izA3iMvjp7e04DT2Z5sOT95Xf6qDvyXhqi5zYDKa656YapfVqpONGKfs7Ar97XTjGUU7
         Nb+FjAdBt1nm2b1lncb+SoaKrEXkWHVBU28v6ZTJofqRtQjN8h0rCGRagR0gBJVdeokc
         GykcRzWQbUmBPVaD/kBZZO+39u/WiLGuyBGRMWOMwsVZGh49rd85SyuJc9Ejln6+wuH9
         P26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717707654; x=1718312454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EB4Vil5Y24ZwzlfAPD4mDDbT7dJ1qdsdgf7DA0pKCZs=;
        b=jTUuMvVXuV0DYFhFzvI1PtSK75siQXs6RL/r8RM+UzSeCA3MUbWRc0ShoSgg/iIBq7
         GOEDzM2z65MgXot4rCuvx8Vj12tEy87rQHlKS+z5rW8jCHIff8CwCok9yJ1uTBbYLLst
         Hshxjxs+OSSmxQNSQWNSFc1mHfbXe+iw8UhDlJ5v2vu2n+EGUA5iAwwVCAiqwitM1f4n
         bb1HwoHQrFkJ0iPIKqHR80k/B+J4zAkJdQRUxWLIPuxuKBS/3IgDq/QrIfptniHGJzmm
         stRL+t832fjXhrjFC/+wbJROYGG1lv1uujW5xbx74NVAKvXeh34yBLh41H0SUMOIS/zq
         puVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWDlvaR6g0IEFcrbR7D0O2OqDuH6yDIGHgP1aEmQUj6w5ZOgUZZmw7CMy20bQq1KuBbO5tdvXp6Rc7/eVM2mXUf1be30wyiXHjgnh2IPZZ30t+mKI=
X-Gm-Message-State: AOJu0YwfxsZtk/pQEFsBhmsvkm9mZvz1j7MTMoYRIYM/x301uzktOoy7
	rHLKASObYiW1AyCWZmPXOj9D7edkqIHjQS9jN+2rYTpwLFyz2j4YZ9G39zzIATb1zh9qdVfJY2p
	p9HePgqM8lHA/aveMOSXLO0gXfSY=
X-Google-Smtp-Source: AGHT+IEF6mtF1UC/ABHxR+sYXWdvtEhzdKSXuk1A4WOXvzg/4qWwFh5kfBm496jABEXVJEFlls1iVI9GSOBdq++lQkA=
X-Received: by 2002:a2e:2206:0:b0:2ea:9449:7713 with SMTP id
 38308e7fff4ca-2eadcb994d1mr4993591fa.0.1717707653576; Thu, 06 Jun 2024
 14:00:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAN-5tyGgNks+gwSScNpaBrf8ogAv5iLTQ3eCd857ULh6gn-b_Q@mail.gmail.com>
 <63F4681D-E7A0-4860-A4B8-0D7BA9818A62@oracle.com> <CAN-5tyEP-+s_8LppBqos0+sWTbUq-nwL6+q-rSK7tz6Gzd2B-w@mail.gmail.com>
 <2D1C791F-C5A1-4985-9BFF-DD2E5753071E@oracle.com>
In-Reply-To: <2D1C791F-C5A1-4985-9BFF-DD2E5753071E@oracle.com>
From: Olga Kornievskaia <olga.kornievskaia@gmail.com>
Date: Thu, 6 Jun 2024 17:00:41 -0400
Message-ID: <CAN-5tyHav3f1XOj1n=MAUm6N8oB6QgY_guav119LNEjiMrXcGw@mail.gmail.com>
Subject: Re: tlshd.conf question
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: Olga Kornievskaia <kolga@netapp.com>, 
	kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 1:59=E2=80=AFPM Chuck Lever III <chuck.lever@oracle.=
com> wrote:
>
>
>
> > On Jun 5, 2024, at 10:50=E2=80=AFAM, Olga Kornievskaia <olga.kornievska=
ia@gmail.com> wrote:
> >
> > On Wed, Jun 5, 2024 at 9:49=E2=80=AFAM Chuck Lever III <chuck.lever@ora=
cle.com> wrote:
> >>
> >> [ Redirecting to gmail/netapp addresses ]
> >>
> >> Maybe <aglo@umich.edu> is not subscribed to kdevops@...?
> >>
> >>
> >>> On Jun 4, 2024, at 2:41=E2=80=AFPM, Olga Kornievskaia <aglo@umich.edu=
> wrote:
> >>>
> >>> Hi Chuck,
> >>>
> >>> Should "pathnames" in the "authentication" section ignore any spaces
> >>> that might be present in the same line after the name be ignored?
> >>>
> >>> It took me by surprise that they weren't and it took me too long to
> >>> realise that I had:
> >>> "x509.certificate=3D/root/server.crt " and not
> >>> "x509.certificate=3D/root/server.crt" in my config.
> >>
> >> Agreed, that's surprising behavior. tlshd uses a popular
> >> library to parse its config file... maybe there's an option
> >> to the library API that can get it to behave better.
> >>
> >> I would like to be able to support blanks inside of path
> >> names, but I'm not sure how that would work.
> >>
> >> Anyway, can you open an issue tracker ticket for this?
> >
> > I have opened it.
> >
> > I think as a first step, my initial suggestion is to update the man
> > page to highlight the fact that names shouldn't have any extra
> > characters appended. If that's acceptable I can take a stab at the man
> > page patch.
> >
> > Don't we want to allow having spaces in the pathname? But I'm not sure
> > what real value is to have a legitimate name that ends on space or
> > tab. But if we do allow spaces in names, shouldn't there be rules such
> > that the name needs to be in double quotes? I would like to add I have
> > not experimented with creating and using such name in tlshd.conf, I'm
> > just speculating here. You mentioned that tlshd is using a popular
> > parsing library which perhaps lists somewhere what its syntax rules
> > are?
>
> It's Glib. The config file is treated as a raw key-value store.
> Have a look for documentation, but I haven't found anything that
> suggests it treats these blobs as anything else by an unprocessed
> UTF-8 string. If we want extra escaping, we'll have to add that
> explicitly to tlshd.
>
>
> > Regardless of what is decided about the spaces/tabs I feel like this
> > should be agreed by the community and then documented in the man page
> > as to the appropriate syntax to be used?
>
> Propose a man page patch here, I think, and we can discuss it.
>
> Note that I've been asked to cut ktls-utils 0.11 ASAP. Can we
> get this finished by next week?

I decided that if we modify the man page but then we would fix
handling pathnames the man page would need to be changed. So instead I
thought, I would have been happy if I had a meaningful error. So I'd
send out a patch at attempt at that. let me know what you think. I
added the checks for exists of a file. But I also found out that
config isn't read in the beginning but rather for an upcall. It would
have been great if at start up it would just notice that supplied
files didn't exist and exit with error messages.. Anyway. Patch to
follow.

>
>
> --
> Chuck Lever
>
>

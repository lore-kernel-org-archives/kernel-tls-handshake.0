Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1CC8BE0
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 14:50:59 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id h14so7354673pgj.7
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 07:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1680015058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/50MYgv8298mGd+YWlcl5/PFnAHtKvrN4jjt7LoXPU=;
        b=HoklWbT+6NAgddCp98/OFWrQw5Hxqa6XoBdxZ6LvF7/JU+Be3hk+Ved/wlxJJ3/Dl8
         G74PuoRT8HmsFmG7dihWdsEeynu9u76ym6P9ASyvWrlG+ubbOG/MpcX2nKxEfyj79rt4
         CRaIgRpCo3dj55TRVY8ZSTAJZtOS6pDmYTPwtrbphBj0ObqyoeOPcPuM053My/j5rxMk
         S78cm8dELBe2Y0DPl2TBtVMmUlaIbPVQD1IUqq+gTtTAEo7xBRbTpjtU4F7ib/ymdR1I
         U4CscdMMsqCvg3Od4mICJccHvDD8EG9OX5S4dxKhrP4w2e9ovTzEkd5Utl2nWENcAnjh
         tZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680015058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/50MYgv8298mGd+YWlcl5/PFnAHtKvrN4jjt7LoXPU=;
        b=EKDN8LkEMvQBSgKmqyhR720TQer7XMzEjRaFY/vsxRW9U6u/XizBmu5jz0i0XkFaqt
         zdGBsNP8ixlo5LytkNkgz6YLLmEt9Q1ldKFJM7niLOYAS5fyr4N9tqQaUqRzvfq51wkG
         HmbZxnycEY8jm1TyTF+z1kVaXLY2dbaEpZCo8DMsW2xmFT4JXzw2AVVdl5iSTBFhjkxP
         kLQFozgMLEqZ7+H7SUJHc5cS763mMMsFn2gLFn9O67JWYutJiaAMBiVY6nARfk1nDvGO
         IrgNl1rbOEPnU5AFIPclYrv99tCZq5z2fpfpqCY9OCIplw3Bj8nOlYiWnyhIw1HjfT56
         kqSg==
X-Gm-Message-State: AAQBX9cZghhPJKHrqmCWH0tQTrIBKpHBtnsP0e6bGOLbAL3H/l1wosxF
	iEb/q3hebsGwPBHpyYEUPJigadR9wcTOLuAo0CCLZAZs
X-Google-Smtp-Source: AKy350aCI6nU1RC5T6IJFbNsdyWF0X8yyCjEWY9gzqVx7hg+6gbiPMISN9QzhFNrvefT2fOLOmKEEM+sYjRuKLjfy18=
X-Received: by 2002:a05:6a00:1a8b:b0:627:d4fa:6a9c with SMTP id
 e11-20020a056a001a8b00b00627d4fa6a9cmr8533777pfv.6.1680015058315; Tue, 28 Mar
 2023 07:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
 <87fea8b7313b08e9c5cb6af0ad0ce3774848cce3.camel@kernel.org>
 <430FEF8D-0953-4A24-9DC6-D53CFE211C05@oracle.com> <5f624bc3a8e900dc967cea5dfada5f9a94fa14b1.camel@kernel.org>
 <CAN-5tyFo3zfqY93zNHRfEk_Uw91-TALk=nOX7WRe_jz-0Anx=g@mail.gmail.com> <9290DD53-B78F-4B95-A4A7-500BEAE35FDE@oracle.com>
In-Reply-To: <9290DD53-B78F-4B95-A4A7-500BEAE35FDE@oracle.com>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Tue, 28 Mar 2023 10:50:47 -0400
Message-ID: <CAN-5tyHCj4P7KP1PC1mFAYpAKCCVOLq_KJEtRscEz+QkBN3qXw@mail.gmail.com>
Subject: Re: problems getting rpc over tls to work
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: Jeff Layton <jlayton@kernel.org>, 
	"kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 10:45=E2=80=AFAM Chuck Lever III <chuck.lever@oracl=
e.com> wrote:
>
>
>
> > On Mar 28, 2023, at 10:39 AM, Olga Kornievskaia <aglo@umich.edu> wrote:
> >
> > On Tue, Mar 28, 2023 at 10:29=E2=80=AFAM Jeff Layton <jlayton@kernel.or=
g> wrote:
> >>
> >> It's true that it is less secure than having full chain-of-trust, but
> >> this seems like a case of "perfect being the enemy of good". If we don=
't
> >> allow for self-signed certificates, then we've created a rather large
> >> hurdle for anyone who wants to deploy this.
> >>
> >> One thing we could do is reinstate the tlshd option, but still allow i=
t
> >> to check the signature. Then it could log something if that check fail=
s
> >> but still allow the connection.
> >>
> >> We should of course document why using that option is not ideal, but
> >> ripping it out entirely seems rather draconian. That's just going to
> >> drive people to not use TLS at all because of the hassle factor.
> >
> > I would argue that "no verification" option should only be allowed in
> > some extreme cases. Like say having an option that explicitly says
> > it's running in a debug mode and say on the foreground only (-d -f
> > --noverify). Having such options might clearly state the intent is to
> > debug only and not run for any user usage.
> >
> > I also don't see a real reason for "noverify" option except to remove
> > frustrations during the setup.
>
> I might put it this way: we don't want to have customers installing
> something on their clients whose out-of-the-shrinkwrap configuration
> is less than secure. "no verification" is less than secure.
>
> My preference would be to have some kind of way to get self-signed
> certs working with no client-side configuration needed. If the
> client mounts with "xprtsec=3Dtls" it should work. Do we need to
> plumb that into our handshake upcall and make "anonymous"
> handshakes explicitly allow unrecognized signers?

My vote is not allow for insecure installs (ever).

Perhaps ktlsd install on the client can prompt the user asking for
location of either server's self-signed cert or server's CA and this
way it would have everything that's needed before using it?

>
> --
> Chuck Lever
>
>

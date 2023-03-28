Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49B68BE0
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 15:19:46 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id a16so11154561pjs.4
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 08:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1680016786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKPvaGyAPl0rQ1EJezdTC93aKyDCsT5XyCx/AQonRgE=;
        b=LtwEgtwwqIKLp7pNh74kAyELBrpP4Z23/cBjv6Jc7MRofr9CYn1gKO2eIH3NaxnN4t
         rVr8/r1fikdOkB+AXth9QgmEsoKjU5Z31EDx/wGW8FutTxcVNzXi5D+Bxs9KDQ2mY6au
         Ala5N2UihtbHkQBSbaWedO4DDPCQeJnKVqxCrIeuddNHPB5s0LazKYoMy79TYfWGgwlb
         nVBIzziU+/JJuFoatuQQTvMM+7kZjuKGJzs+I+tWwoJWtalOvGzICowotqZYsP+KwwNL
         IaXJweUh2ng7HPC5C7oylhkTMKvom6iPKmD62KVHCyuU69pmxsHEPNy2mQARDrKu5gm2
         /vZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680016786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKPvaGyAPl0rQ1EJezdTC93aKyDCsT5XyCx/AQonRgE=;
        b=ljSU3K5KF3BZhMxORGu7xNiTsS/BsOgT5Fd2s4tnmxhyzODP2fuClDiS9iHWtuvKni
         6LEW+DHlEn95DORKBhtx0VecLgabiRc9xd0ioxWoUKcIPyQ0K/ST1tjU5KwaW91Cb/1f
         89Odpph7LApQm75U+seA2Xkmurx7k1x7oacIixyS2s6FStFIRaSntqLUjbgvNFfr5f24
         vI4Wx1xhM8E0+gXBAevN1vxGxWhLhnCo7q2bIOai7h2umRk3LBfLRObcA7mToleKh+ie
         ByTN4x9Lm4rdObxH6hjdF144/sReHd0gynjECxoA8V4KiJVFg9js9n/BF6ER4u9LD6aZ
         kVvQ==
X-Gm-Message-State: AAQBX9fRkYgIcGspr6yGeP3l+IcBrYmBljF7HRcXTXj5hOV7xOUaOJ/j
	mc07KfGnbP5u3zOqBzZUiqdvI+ARbiHoEcWBzLQ=
X-Google-Smtp-Source: AKy350bhqBuwEwSIE26nbLt44KbIqlTj7I1hiCDvfiLqz/71w3Nb3BTpBSYU1c0uJnObXE++WTuzAFU6W35PxmmSxt8=
X-Received: by 2002:a17:902:7d81:b0:1a0:52f1:8ea7 with SMTP id
 a1-20020a1709027d8100b001a052f18ea7mr5661907plm.12.1680016786095; Tue, 28 Mar
 2023 08:19:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
 <87fea8b7313b08e9c5cb6af0ad0ce3774848cce3.camel@kernel.org>
 <430FEF8D-0953-4A24-9DC6-D53CFE211C05@oracle.com> <5f624bc3a8e900dc967cea5dfada5f9a94fa14b1.camel@kernel.org>
 <CAN-5tyFo3zfqY93zNHRfEk_Uw91-TALk=nOX7WRe_jz-0Anx=g@mail.gmail.com>
 <9290DD53-B78F-4B95-A4A7-500BEAE35FDE@oracle.com> <666c279c758f2d7acf6f9b82c267e91af510446b.camel@kernel.org>
 <0B1C934F-5A3B-43F6-A6A1-F02E27BC2609@oracle.com>
In-Reply-To: <0B1C934F-5A3B-43F6-A6A1-F02E27BC2609@oracle.com>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Tue, 28 Mar 2023 11:19:35 -0400
Message-ID: <CAN-5tyFS7zS-mfQqeaz7O1MvCpyeJ2uZBzHRNYgHzd_Qzy=7JQ@mail.gmail.com>
Subject: Re: problems getting rpc over tls to work
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: Jeff Layton <jlayton@kernel.org>, 
	"kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 11:06=E2=80=AFAM Chuck Lever III <chuck.lever@oracl=
e.com> wrote:
>
>
>
> > On Mar 28, 2023, at 11:03 AM, Jeff Layton <jlayton@kernel.org> wrote:
> >
> > On Tue, 2023-03-28 at 14:45 +0000, Chuck Lever III wrote:
> >>
> >>> On Mar 28, 2023, at 10:39 AM, Olga Kornievskaia <aglo@umich.edu> wrot=
e:
> >>>
> >>> On Tue, Mar 28, 2023 at 10:29=E2=80=AFAM Jeff Layton <jlayton@kernel.=
org> wrote:
> >>>>
> >>>> It's true that it is less secure than having full chain-of-trust, bu=
t
> >>>> this seems like a case of "perfect being the enemy of good". If we d=
on't
> >>>> allow for self-signed certificates, then we've created a rather larg=
e
> >>>> hurdle for anyone who wants to deploy this.
> >>>>
> >>>> One thing we could do is reinstate the tlshd option, but still allow=
 it
> >>>> to check the signature. Then it could log something if that check fa=
ils
> >>>> but still allow the connection.
> >>>>
> >>>> We should of course document why using that option is not ideal, but
> >>>> ripping it out entirely seems rather draconian. That's just going to
> >>>> drive people to not use TLS at all because of the hassle factor.
> >>>
> >>> I would argue that "no verification" option should only be allowed in
> >>> some extreme cases. Like say having an option that explicitly says
> >>> it's running in a debug mode and say on the foreground only (-d -f
> >>> --noverify). Having such options might clearly state the intent is to
> >>> debug only and not run for any user usage.
> >>>
> >>> I also don't see a real reason for "noverify" option except to remove
> >>> frustrations during the setup.
> >>
> >> I might put it this way: we don't want to have customers installing
> >> something on their clients whose out-of-the-shrinkwrap configuration
> >> is less than secure. "no verification" is less than secure.
> >>
> >> My preference would be to have some kind of way to get self-signed
> >> certs working with no client-side configuration needed. If the
> >> client mounts with "xprtsec=3Dtls" it should work. Do we need to
> >> plumb that into our handshake upcall and make "anonymous"
> >> handshakes explicitly allow unrecognized signers?
> >>
> >
> > Since the client is the side that's rejecting things, having a mount
> > option that allows you to relax that check seems like the right
> > approach.
> >
> > How about a new xprtsec=3D option? Maybe "xprtsec=3Dnvtls" (no verify T=
LS)?
> > That would allow things to work out of the box, but still leave
> > xprtsec=3Dtls as the more secure method.
>
> Nah. xprtsec=3Dtls is supposed to be less secure: no authentication,
> just encryption. The secure method is xprtsec=3Dmtls.

What's the point of "no authentication". I thought the server is
always authenticated.

> IMO xprtsec=3Dtls needs to skip the signer check. I think I can make
> tlshd do that.

I guess in that case, I (grudgingly) agree with something like
xprtsec=3Danonymous/nvtls".

>
>
> --
> Chuck Lever
>
>

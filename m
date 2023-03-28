Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B8F8BE0
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 15:30:59 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id o11so12053926ple.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 08:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1680017459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFD88WMpcGiAb5dEVmfudZtfvwUltdManNkpfPcYEVM=;
        b=rSved9r7qK5OPWIBO2Zhuuo0P2EDfLldI4b9kbuIByr+lVVw59g7jTAumO+JOTvABC
         /sPK/M5WEG3XhBcqw9/YBzplv5u5C7F9iqDoWKmzPiyr4h6GLitVclOuRJEmjrH6vVHZ
         WEKlNO39XbdEzz9y3xFm1B2blfD71FGrVj0QlqL2bqEeZtXOZJ8DEeaiGOkipPHDChCb
         gnWcxVUzmpLscCvs+W5mu3Hn2pNp/tzN5ealOVVBhgkmRM3vceCEUMbpp79xCvbHzM/1
         e26F0L8lwk0o7RNkoh+DEbPpWi+NZ1wVPc5++cx53EynZGwv9OGn5CN5erybqVQc1I+d
         TPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680017459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFD88WMpcGiAb5dEVmfudZtfvwUltdManNkpfPcYEVM=;
        b=aScMRupTNaVk6PztYKfpWWAAKQRV1zrzw4v8m91ew/vjM0ypMpib6mj7WB5/tH/ovJ
         DltqeV3wSdLzHmdWZTp9yorjb9Q5e9zxdW3ZR6AF038d8dAGNFAI5Gosh7z3ZoZ1CRm4
         8kqTBCZkVyQo4QbKpMt6GLO4WaNFozUA2JjqEDp6mDFuPCV6vT9lehssMITTeODXSr40
         Zyky2t+FU6LDXcQG3vPsR9Kbk0Kuqfh5T8oMT8/iSxl+0UWmp0qyVNoAJKeEv4qTBaDn
         zdfQg+m3EVn5cftAMTbBGIJEFbBLVKXD/8ZzeZIzsnGPfHyn0HyWzl3HI7QrM1+1+zO0
         tyBA==
X-Gm-Message-State: AAQBX9fp2FV/pfQU8CcgoBHEXaUkAS403XLaLokbfumqvrj+RooBzVua
	33KUaDnrt7fpZ5p6nIjDxD35+selyC+HdmwPRodediG0
X-Google-Smtp-Source: AKy350YoYyfTxgBtcm6dPS7ZdkiiA8oCxBC6qFR7gejq9Z/z5UBXjNHqUyoxXXrjdZRl9KeE8h9YyENLupHm2M5jGHI=
X-Received: by 2002:a17:902:c20c:b0:19f:3cc1:e3be with SMTP id
 12-20020a170902c20c00b0019f3cc1e3bemr5813163pll.12.1680017458886; Tue, 28 Mar
 2023 08:30:58 -0700 (PDT)
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
 <0B1C934F-5A3B-43F6-A6A1-F02E27BC2609@oracle.com> <CAN-5tyFS7zS-mfQqeaz7O1MvCpyeJ2uZBzHRNYgHzd_Qzy=7JQ@mail.gmail.com>
In-Reply-To: <CAN-5tyFS7zS-mfQqeaz7O1MvCpyeJ2uZBzHRNYgHzd_Qzy=7JQ@mail.gmail.com>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Tue, 28 Mar 2023 11:30:47 -0400
Message-ID: <CAN-5tyHsULqAt2L5m_F8tfJRfEkJvRP-6e=D9p5bdDiKhWMGqw@mail.gmail.com>
Subject: Re: problems getting rpc over tls to work
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: Jeff Layton <jlayton@kernel.org>, 
	"kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 11:19=E2=80=AFAM Olga Kornievskaia <aglo@umich.edu>=
 wrote:
>
> On Tue, Mar 28, 2023 at 11:06=E2=80=AFAM Chuck Lever III <chuck.lever@ora=
cle.com> wrote:
> >
> >
> >
> > > On Mar 28, 2023, at 11:03 AM, Jeff Layton <jlayton@kernel.org> wrote:
> > >
> > > On Tue, 2023-03-28 at 14:45 +0000, Chuck Lever III wrote:
> > >>
> > >>> On Mar 28, 2023, at 10:39 AM, Olga Kornievskaia <aglo@umich.edu> wr=
ote:
> > >>>
> > >>> On Tue, Mar 28, 2023 at 10:29=E2=80=AFAM Jeff Layton <jlayton@kerne=
l.org> wrote:
> > >>>>
> > >>>> It's true that it is less secure than having full chain-of-trust, =
but
> > >>>> this seems like a case of "perfect being the enemy of good". If we=
 don't
> > >>>> allow for self-signed certificates, then we've created a rather la=
rge
> > >>>> hurdle for anyone who wants to deploy this.
> > >>>>
> > >>>> One thing we could do is reinstate the tlshd option, but still all=
ow it
> > >>>> to check the signature. Then it could log something if that check =
fails
> > >>>> but still allow the connection.
> > >>>>
> > >>>> We should of course document why using that option is not ideal, b=
ut
> > >>>> ripping it out entirely seems rather draconian. That's just going =
to
> > >>>> drive people to not use TLS at all because of the hassle factor.
> > >>>
> > >>> I would argue that "no verification" option should only be allowed =
in
> > >>> some extreme cases. Like say having an option that explicitly says
> > >>> it's running in a debug mode and say on the foreground only (-d -f
> > >>> --noverify). Having such options might clearly state the intent is =
to
> > >>> debug only and not run for any user usage.
> > >>>
> > >>> I also don't see a real reason for "noverify" option except to remo=
ve
> > >>> frustrations during the setup.
> > >>
> > >> I might put it this way: we don't want to have customers installing
> > >> something on their clients whose out-of-the-shrinkwrap configuration
> > >> is less than secure. "no verification" is less than secure.
> > >>
> > >> My preference would be to have some kind of way to get self-signed
> > >> certs working with no client-side configuration needed. If the
> > >> client mounts with "xprtsec=3Dtls" it should work. Do we need to
> > >> plumb that into our handshake upcall and make "anonymous"
> > >> handshakes explicitly allow unrecognized signers?
> > >>
> > >
> > > Since the client is the side that's rejecting things, having a mount
> > > option that allows you to relax that check seems like the right
> > > approach.
> > >
> > > How about a new xprtsec=3D option? Maybe "xprtsec=3Dnvtls" (no verify=
 TLS)?
> > > That would allow things to work out of the box, but still leave
> > > xprtsec=3Dtls as the more secure method.
> >
> > Nah. xprtsec=3Dtls is supposed to be less secure: no authentication,
> > just encryption. The secure method is xprtsec=3Dmtls.
>
> What's the point of "no authentication". I thought the server is
> always authenticated.

Sorry Ok we are discussing no authentication. But my point was "TLS"
in its know doesn't mean less secure and always does server side
authentication. In the early days of TLS, you could choose to do pure
Diffie hellman and that was "no authentication" but that's no longer
an option.

HTTPS explicitly prompts that user to do manual verification (ie when
it couldn't verify using existing CAs). It never allows for "no
verification" which we are discussing here.

> > IMO xprtsec=3Dtls needs to skip the signer check. I think I can make
> > tlshd do that.
>
> I guess in that case, I (grudgingly) agree with something like
> xprtsec=3Danonymous/nvtls".
>
> >
> >
> > --
> > Chuck Lever
> >
> >

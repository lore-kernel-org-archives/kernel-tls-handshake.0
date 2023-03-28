Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078C633C5
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 14:39:12 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso15298211pjb.3
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1680014352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIQTojEGpJPvsXdIL6HtBv1A1u2QnecULinI3tqTsx0=;
        b=PRw01Zz7MgHXg8sI+mPgBY6GDcii0P5Dh9LatPYRYvRU/tm0ppArTjAuBn+Cts8tJ/
         E3oMstTRqyC0fVl+w61G7QUkDEUXllmDwA/sUKw1Q4WqM7wTtOwNzlvf31fh2gNcKPGe
         /LMjQooTys4lUHpggnb2lN1g7iCNUda52UugVBeniCa2GEh9ikpfEbfJDnuLZ3IexUUQ
         wv9Xcqvhnb5euyYugnMndXAPc0UPPINjVZhAMpeExtshmvZnI8NQMhdgwmjwr2w4TjrG
         oZHnZ8BQ6C7LML3M4uKmNxgKwtvXXoOzn0RpynxGRSqG0d+NGMmhWTO7KDyqhf873Wbq
         IPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680014352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIQTojEGpJPvsXdIL6HtBv1A1u2QnecULinI3tqTsx0=;
        b=0GWAoaIvNzKuhjSaKyoY9OLxUf6uyuAlz6Nd53BxploIAkZwHBkQNBxxUwCI8rb96f
         lfIyyHVZXSkdnyBt+0UBTD0Stkok9CpRBUHVRw7cG92XZ7/G1u9PErv50ZCKrGQlzQwy
         CLdIvSDsNoYbOCpA+dha1413CvdoYIqJiGOx5rHg75QJs0h5HyS0EUcdMA+6WQBv2pIL
         lIT2KTUc2atoRf0oKJZ+49yMzhQ9LC3P5J/CKIm4bmk52hiwKwVkv6UvaX2fb7QXPHxA
         zfAgib5wCoiaDyIEjuENnzAP7Uq1SZTwTHU+zObi1TPc/U0K/9i609FSuJ3Bw49tHYJG
         fr2Q==
X-Gm-Message-State: AAQBX9fXQZLAlLYk6DNMBgcckOYAfnlc95KdK7ke3icAd3h/WSRVyIMU
	yI/7UukvmeDmf1q1rmibqvAWBLlxBfI2U4XEsfeBQ0HO
X-Google-Smtp-Source: AKy350YWHwF/2l+JSwd9nLhhAqmq2tEbxVTY/q9ZhAQ9kZNC54KfBMYF5fH2ExFWiZmSc0M6tjmiKibfGB8ow2nLI1g=
X-Received: by 2002:a17:902:ecd2:b0:1a2:278d:1824 with SMTP id
 a18-20020a170902ecd200b001a2278d1824mr4740939plh.12.1680014352327; Tue, 28
 Mar 2023 07:39:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
 <87fea8b7313b08e9c5cb6af0ad0ce3774848cce3.camel@kernel.org>
 <430FEF8D-0953-4A24-9DC6-D53CFE211C05@oracle.com> <5f624bc3a8e900dc967cea5dfada5f9a94fa14b1.camel@kernel.org>
In-Reply-To: <5f624bc3a8e900dc967cea5dfada5f9a94fa14b1.camel@kernel.org>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Tue, 28 Mar 2023 10:39:01 -0400
Message-ID: <CAN-5tyFo3zfqY93zNHRfEk_Uw91-TALk=nOX7WRe_jz-0Anx=g@mail.gmail.com>
Subject: Re: problems getting rpc over tls to work
To: Jeff Layton <jlayton@kernel.org>
Cc: Chuck Lever III <chuck.lever@oracle.com>, 
	"kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 10:29=E2=80=AFAM Jeff Layton <jlayton@kernel.org> w=
rote:
>
> On Tue, 2023-03-28 at 14:04 +0000, Chuck Lever III wrote:
> >
> > > On Mar 28, 2023, at 8:55 AM, Jeff Layton <jlayton@kernel.org> wrote:
> > >
> > > I wonder...should we have the ktls-utils package install a self-signe=
d cert by default?
> >
> > So this idea is intriguing, I had some similar thoughts.
> >
> > I'm not sure what the security implications of all this are.
> > We'd first need to look at other certificate-based packages
> > in Fedora to see if they offer a similar quick-setup. The
> > cert would have to be created at install time.
> >
> >
>
> I think when apache is installed, a self-signed cert is created. You
> don't have to use it, but it's what gets initially installed.

The problem I see with the plan is that the client (which will be
installing ktlsd) needs the server's certificate (not its own). So
installing a self-signed certificate helps with having one but is far
from having a no hassle install. I think having clear steps about how
to get server's cert installed into the client's trusted CA chain in
the man page would go a long way.

> > > I created a self-signed
> > > cert and tried to use it, but the client rejects it with this:
> > >
> > >    Mar 28 09:01:20 nfsclnt tlshd[1092]: Certificate signer not found.
> > >
> > > Is there a way to make it not try to validate the cert chain?
> >
> > Olga also found that self-signed server certs are not
> > working as we'd like. tlshd had a mechanism to force the
> > clients not to check the signer, but it was removed
> > because it was deemed insecure.
> >
> > I'd like to find a way to make self-signed work seamlessly.
> >
>
> Ditto. A lot of people are going to want to use TLS opportunistically
> without deploying their own CA and issuing "real" certificates.
>
> It's true that it is less secure than having full chain-of-trust, but
> this seems like a case of "perfect being the enemy of good". If we don't
> allow for self-signed certificates, then we've created a rather large
> hurdle for anyone who wants to deploy this.
>
> One thing we could do is reinstate the tlshd option, but still allow it
> to check the signature. Then it could log something if that check fails
> but still allow the connection.
>
> We should of course document why using that option is not ideal, but
> ripping it out entirely seems rather draconian. That's just going to
> drive people to not use TLS at all because of the hassle factor.

I would argue that "no verification" option should only be allowed in
some extreme cases. Like say having an option that explicitly says
it's running in a debug mode and say on the foreground only (-d -f
--noverify). Having such options might clearly state the intent is to
debug only and not run for any user usage.

I also don't see a real reason for "noverify" option except to remove
frustrations during the setup.

> --
> Jeff Layton <jlayton@kernel.org>
>

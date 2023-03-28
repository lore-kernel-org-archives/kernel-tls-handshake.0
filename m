Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E2E8465
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 14:25:21 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id q102so10974069pjq.3
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 07:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1680013520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vR0eeZvBfCQ1TCe5mFml44m2ao7OZ7GmgkcGTKamzMU=;
        b=IVaH32PseI9S6R5Uxnsl2VmoTZaloKAN8NOLlwsEC1PhPr2WMk6vdSYXn3PCFWZaQF
         P/uu7HZTH2cMNoZrwnHP+AGjQ7gK/nZpxDz57jm9eAJcHEcBevoznQBzGlsb0OQhGVh2
         E6TUboERu4vcUIMYTZc+l3welgS9rKs5NqocTj/YiOSL7fkwU1h93ZRLLuOXEz97zkGG
         66Y/Z/qTLGavtx1WRqVK3oIhJ5B2Fz1etdT8vdnb7x7BT8iBT6goZuRyLmFIqc2l/fKR
         D3Yb2X8jVG3yjCIaWSfGF1J3cpMD0vFmexYkXRLEEohsi7BpwVA9PYnyWB9KIZdTrpd9
         7wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680013520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vR0eeZvBfCQ1TCe5mFml44m2ao7OZ7GmgkcGTKamzMU=;
        b=ZiZhMxR08U0aJw9G1aDuRxwsrhSrRD/3iliEU77QdcT/rfdborpTc99xaLsOf94c5h
         DTo4DrNK8ukDkURiaoqDooZPHlfZgaS0wkdnWrqmnjbDjC5q5deaJgteahtVJ3TxVznj
         oDvOoWSZNzNPEylFKOCvP2aZjfGYNZ4EYad8tOqM+0UjoAI3sj9FwsZEcRjXNOexkWuf
         lP80eQvjg0/V057E8xcNqLg2rnFON3gMw6/UhI9IdJ9bLnjViUjM8N8UQDjc3sJL7L6R
         g3YoSpvuHEuy5pNt0LU2wbN1wn+TyTmIuKvT8Wsm2MlHdqwVMMrjDEKSPxeSQQObXccn
         z49g==
X-Gm-Message-State: AAQBX9ewMdxhj2FKQfTTjVhLa52lnJKuRLdySlbSU1nMN4nctDA8FP0a
	SxDEpPUP7OVNEFuG6mYOxScrUBaW9yUnPUE98PM=
X-Google-Smtp-Source: AKy350YkebM1WUfKAwF6yfR23x95UWSkHZfagfOzOs962DQDT8fh6w/VnhsoSpNU73vCEEj+CNQD0DafJJmZKYbR4gA=
X-Received: by 2002:a17:90a:ac16:b0:234:e49:ba9f with SMTP id
 o22-20020a17090aac1600b002340e49ba9fmr4770556pjq.4.1680013520357; Tue, 28 Mar
 2023 07:25:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
 <D0679730-E679-4C96-BA7D-E17D307A4B8E@oracle.com> <FA6F7A64-0879-4FB2-9AC2-9EF541164706@oracle.com>
 <528666f219df6bf88dbf0bfbf48dd0902f67b9d9.camel@kernel.org>
In-Reply-To: <528666f219df6bf88dbf0bfbf48dd0902f67b9d9.camel@kernel.org>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Tue, 28 Mar 2023 10:25:09 -0400
Message-ID: <CAN-5tyGay1x_rPhk7uXtUCZjRt_tWh8+Zc-h0+rYXJGCbxw3hg@mail.gmail.com>
Subject: Re: problems getting rpc over tls to work
To: Jeff Layton <jlayton@kernel.org>
Cc: Chuck Lever III <chuck.lever@oracle.com>, 
	"kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 10:14=E2=80=AFAM Jeff Layton <jlayton@kernel.org> w=
rote:
>
> On Tue, 2023-03-28 at 13:55 +0000, Chuck Lever III wrote:
> >
> > > On Mar 28, 2023, at 9:29 AM, Chuck Lever III <chuck.lever@oracle.com>=
 wrote:
> > >
> > >
> > >
> > > > On Mar 28, 2023, at 8:27 AM, Jeff Layton <jlayton@kernel.org> wrote=
:
> > > >
> > > > Hi Chuck!
> > > >
> > > > I have started the packaging work for Fedora for ktls-utils:
> > > >
> > > >   https://bugzilla.redhat.com/show_bug.cgi?id=3D2182151
> > > >
> > > > I also built packages for this in copr:
> > > >
> > > >   https://copr.fedorainfracloud.org/coprs/jlayton/ktls-utils/
> > > >
> > > > ...and built some interim nfs-utils packages with the requisite exp=
ortfs
> > > > patches:
> > > >
> > > >   https://copr.fedorainfracloud.org/coprs/jlayton/nfs-utils/
> > >
> > > Note that the nfs-utils changes aren't necessary to support
> > > the kernel server in "opportunistic" mode -- the server will
> > > use RPC-with-TLS if a client requests it, but otherwise does
> > > not restrict access.
> > >
> > > Client side also has no nfs-utils requirements at this time,
> > > since the new mount options are handled by the kernel.
> >
> > In case I wasn't clear:
> >
> > This was meant as a suggestion. If you want to simplify your
> > test set-up a bit, the nfs-utils piece isn't needed at this
> > point. But feel free to include it if you like!
> >
>
> Understood. I needed to build it for the server side anyway, so I
> figured I might as well. Eventually I'd like to set up a Fedora COPR
> repo that has all of the packages we need to test this, but I need to
> sort through the certificate handling here first.
>
> Are there docs on how to administer gnutls? For instance, I guess I'll
> want to set up my own CA and issue client and server certs. How do I
> make gnutls trust a new CA?

Hi Jeff,

To get self-signed certificates to work you need to (on the client's
machine) copy your server's cert.pem file into
/etc/pki/ca-trust/source/anchors and then run the =E2=80=9Cupdate-ca-trust
extract=E2=80=9D.

> --
> Jeff Layton <jlayton@kernel.org>
>

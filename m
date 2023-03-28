Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F2F8474
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 14:44:33 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso15315383pjb.3
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1680014673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cT+pxEJcG0KLcrdlM94CSmlWMLa6Q1AxLwljL8LFQDs=;
        b=Rr2yG1d4oaRAAr3aKlj8biEpjfgccFtFsupQPZlmwtj+OMjFF5GlbyadzFSdzWXMJS
         v4fzhUnVqTbYTGyC0Z3/hgfj2IZYP5nrEJuvQ0JHMPcup5DGTCWU2J+/3cSmdp4RAt1E
         IaoSuNYw2uc9aOn/I0v1LAe4yB69TRI1gi4SD6uLYppxIpILC9TsumA6Gk7tNS+FOYvc
         7iFW5pNIEdmYGUFgwFCtzbQFR4l86a/wjqNLZQtyOkOQzpP8pGQ5yx2YajE5h0QRMm5q
         HvlDU0vkrRJIvV4DGPQcj2eRNllCZE/EFDN0yj1e4Ja0J7FavL2h1PbWT+61BAl4N8hV
         QR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680014673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cT+pxEJcG0KLcrdlM94CSmlWMLa6Q1AxLwljL8LFQDs=;
        b=IKC+bmDeBSIa85ZSQNIRoLYiHEvzvQFXrQhsFsdCaI02YeU4kQtmdYWl9uiz346uaO
         jCAFrMHGdnOIIkX4L2Dbj6tSPdTa9HxZ/ZyPcsasMmZDQ0phXXrxFCNellEjzDSbLOHP
         q4o41BGZhb1E503laSRBc1oHV+VvkWrQUYPtEvmJcfDBwCPg0B2/WmxIthPDGp6qaQVW
         /5Gavofk9IYk9EQfsvDVN9u4QhseUjjHWQd21OYp3BB63c3XCK2BtOWF9YP/fcdS5fcB
         CnTsDbKOQNtqPoJJFRgv8U2PDYiLjM2HGjMFIB4k6EEQhlaYj/HGspS4eoFsijn8ukHL
         iPyA==
X-Gm-Message-State: AAQBX9cWPEq18soplNo5ToUwxQp+YjbxmiSUOP44aCGGUbXDhEmyJfaF
	NhBsGnvmYLC5c86F22mydvyH2fSxcRERwxEeoVk=
X-Google-Smtp-Source: AKy350bQQpFbiq7qyCaSlINaKr1+p55nf7bKpCRj6/RkY39EyA/n73V1h6NnZbern+a9WXJ2nrkuRnsBZsOW9BSH5NI=
X-Received: by 2002:a17:90a:b881:b0:23d:2f4:af49 with SMTP id
 o1-20020a17090ab88100b0023d02f4af49mr4656806pjr.4.1680014673368; Tue, 28 Mar
 2023 07:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <7b48d02ed76350484ca53bd30cd2ba243559b41b.camel@kernel.org>
 <D0679730-E679-4C96-BA7D-E17D307A4B8E@oracle.com> <FA6F7A64-0879-4FB2-9AC2-9EF541164706@oracle.com>
 <528666f219df6bf88dbf0bfbf48dd0902f67b9d9.camel@kernel.org>
 <CAN-5tyGay1x_rPhk7uXtUCZjRt_tWh8+Zc-h0+rYXJGCbxw3hg@mail.gmail.com> <65bd19cbc1ac6ca1ddb7f521cd5272801cf14348.camel@kernel.org>
In-Reply-To: <65bd19cbc1ac6ca1ddb7f521cd5272801cf14348.camel@kernel.org>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Tue, 28 Mar 2023 10:44:22 -0400
Message-ID: <CAN-5tyHLRkhn6wiEMf-JfbSWR-ovi9GZ4THvP9bmTJxTENc8iA@mail.gmail.com>
Subject: Re: problems getting rpc over tls to work
To: Jeff Layton <jlayton@kernel.org>
Cc: Chuck Lever III <chuck.lever@oracle.com>, 
	"kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 10:38=E2=80=AFAM Jeff Layton <jlayton@kernel.org> w=
rote:
>
> On Tue, 2023-03-28 at 10:25 -0400, Olga Kornievskaia wrote:
> > On Tue, Mar 28, 2023 at 10:14=E2=80=AFAM Jeff Layton <jlayton@kernel.or=
g> wrote:
> > >
> > > On Tue, 2023-03-28 at 13:55 +0000, Chuck Lever III wrote:
> > > >
> > > > > On Mar 28, 2023, at 9:29 AM, Chuck Lever III <chuck.lever@oracle.=
com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > > On Mar 28, 2023, at 8:27 AM, Jeff Layton <jlayton@kernel.org> w=
rote:
> > > > > >
> > > > > > Hi Chuck!
> > > > > >
> > > > > > I have started the packaging work for Fedora for ktls-utils:
> > > > > >
> > > > > >   https://bugzilla.redhat.com/show_bug.cgi?id=3D2182151
> > > > > >
> > > > > > I also built packages for this in copr:
> > > > > >
> > > > > >   https://copr.fedorainfracloud.org/coprs/jlayton/ktls-utils/
> > > > > >
> > > > > > ...and built some interim nfs-utils packages with the requisite=
 exportfs
> > > > > > patches:
> > > > > >
> > > > > >   https://copr.fedorainfracloud.org/coprs/jlayton/nfs-utils/
> > > > >
> > > > > Note that the nfs-utils changes aren't necessary to support
> > > > > the kernel server in "opportunistic" mode -- the server will
> > > > > use RPC-with-TLS if a client requests it, but otherwise does
> > > > > not restrict access.
> > > > >
> > > > > Client side also has no nfs-utils requirements at this time,
> > > > > since the new mount options are handled by the kernel.
> > > >
> > > > In case I wasn't clear:
> > > >
> > > > This was meant as a suggestion. If you want to simplify your
> > > > test set-up a bit, the nfs-utils piece isn't needed at this
> > > > point. But feel free to include it if you like!
> > > >
> > >
> > > Understood. I needed to build it for the server side anyway, so I
> > > figured I might as well. Eventually I'd like to set up a Fedora COPR
> > > repo that has all of the packages we need to test this, but I need to
> > > sort through the certificate handling here first.
> > >
> > > Are there docs on how to administer gnutls? For instance, I guess I'l=
l
> > > want to set up my own CA and issue client and server certs. How do I
> > > make gnutls trust a new CA?
> >
> > Hi Jeff,
> >
> > To get self-signed certificates to work you need to (on the client's
> > machine) copy your server's cert.pem file into
> > /etc/pki/ca-trust/source/anchors and then run the =E2=80=9Cupdate-ca-tr=
ust
> > extract=E2=80=9D.
> >
> >
>
> Many thanks, Olga! That got me further:
>
>     Mar 28 10:35:05 nfsclnt tlshd[1498]: Handshake with nfsd.poochiereds.=
net (192.168.1.140) was successful
>
> The mount still isn't working yet, but I think I'm getting closer. I'll
> keep poking at it.

I went thru several iterations before I got that working. If you are
doing mutual authentication then the client's self-cert needs to be
added to the server's CA chain in the same manner.

My next stumble which Chuck helped me was that negotiated cipher was
ChaCha20Poly which I didn't have enabled in my kernel. So look that
you have CONFIG_CRYPTO_CHACHA20POLY1305  compiled in the kernel.

>
> Thanks!
> --
> Jeff Layton <jlayton@kernel.org>

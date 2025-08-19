Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A27A3101D5
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 19 Aug 2025 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755591055; cv=none; b=LypQ+Ds6g8i3gTFibM2xENcErrCMaU/N8eaqAKCp4OmG6/ZkIwRaPPGrItcA3WaroqnPwCzVC6bfvrbY2BXftY6Z4V5gooBec8JroBjaZFdEP5sKHHdh4kg43DVTBLfJvNPMquYTN9C5CVvArw9a+sD7BiEOGdghat5Y3iDNq1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755591055; c=relaxed/simple;
	bh=Mem68XA4CBvVrxnZFm9GLUSQPJOaH1jSUqJBHty3Mn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+INNlfxSftITQQNIEsJYp3J4XqqkDrteFykCMTArOQTsjoZniS4nL2oxLPMb1J4zceZSxcoSuEbyXFWiBfywAyXrEBtEdR7CqpMvd++HbQCTANv2qGZUdD4gARZOjR1BG0A0771xyMjFLPZpVy1xg8A72ftyngnAhPZiQQO948=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=paEjngKm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="paEjngKm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8991BC2BCB1
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 19 Aug 2025 08:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755591054;
	bh=Mem68XA4CBvVrxnZFm9GLUSQPJOaH1jSUqJBHty3Mn0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=paEjngKmnO+QwgqvaZr2brJHyXDS2VnA0YxVuRGCj7LPiO1i4TSii33GeECXpsTui
	 EzdiJ1ZooPBhluk6oLNUZ875Vpbd+jOzFsMGgPErlO8xvHn0zXuvC4wlhOoELs7MsQ
	 IdC5b81q0XbT3hD//gyua/9FkG2FckzfXHjcQQT0l0+e+2WMiqZpb+srOzHsV1zko0
	 KSagEqG6Q5X/ZxUfHajffiZ2mGq7ESMomiEH2T3xS1SrDzxAXcmgaqxhVqXT9hZ892
	 XDIxkyAmko3pULWCFNG8iXouomUyggSs68S2hyo0yK+lWkqgOUJlYhCDW8hGcru0m1
	 7/pCPyUI3d5Vw==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-618896b3ff9so9803477a12.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 19 Aug 2025 01:10:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpqHFpuzEOfuTHv8IHG7WoRNbGe+qew9byIxQFodRR/vsZFVbKz8QQhUEdv4m1Exr1ZXlWeIn9OWy1tk9EwYwStRABmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSyL+iPMiVidV+mEiGZEOAPRG0bHLTiuc8uBBjoqhR8AVWmaGl
	FPrqoEC6T27wfVpGCkbbyEHI9J0k3TZwb0kWc6PoFw9atXqsBTZhYtsMkpelYYSgFvq+mVUgLzo
	9uMjc+08n1irjeWYTaW+oxXJ16hZGlfk=
X-Google-Smtp-Source: AGHT+IEcZyfGsiOFie2luy3fEI8Nb2QlkZUgkU7UA/Gw2GUbUPFLs5+mV5Il1Iqad4pMkJpKq63kvsNonnx+HvDMfvA=
X-Received: by 2002:a05:6402:270b:b0:618:3502:80c9 with SMTP id
 4fb4d7f45d1cf-61a7fa6c1f5mr1422965a12.10.1755591052956; Tue, 19 Aug 2025
 01:10:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1755525878.git.lucien.xin@gmail.com> <50eb7a8c7f567f0a87b6e11d2ad835cdbb9546b4.1755525878.git.lucien.xin@gmail.com>
 <5d5ac074-1790-410e-acf9-0e559cb7eacb@samba.org>
In-Reply-To: <5d5ac074-1790-410e-acf9-0e559cb7eacb@samba.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 19 Aug 2025 17:10:40 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-L12tTQyMtTG9+8=XjWY0NDKbYybGXUjPrGin5yYtx3A@mail.gmail.com>
X-Gm-Features: Ac12FXyiQuPEOg9fCPvN1r6JfTMy5hj0Blb3dqMBqsD73rGciFUNEEgDAVfLZ14
Message-ID: <CAKYAXd-L12tTQyMtTG9+8=XjWY0NDKbYybGXUjPrGin5yYtx3A@mail.gmail.com>
Subject: Re: [PATCH net-next v2 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
To: Stefan Metzmacher <metze@samba.org>
Cc: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Moritz Buhl <mbuhl@openbsd.org>, 
	Tyler Fanelli <tfanelli@redhat.com>, Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, 
	kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>, 
	Jeff Layton <jlayton@kernel.org>, Benjamin Coddington <bcodding@redhat.com>, 
	Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, Alexander Aring <aahringo@redhat.com>, 
	David Howells <dhowells@redhat.com>, Cong Wang <xiyou.wangcong@gmail.com>, 
	"D . Wythe" <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>, 
	illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 11:31=E2=80=AFPM Stefan Metzmacher <metze@samba.org=
> wrote:
>
> Hi,
>
> > diff --git a/include/linux/socket.h b/include/linux/socket.h
> > index 3b262487ec06..a7c05b064583 100644
> > --- a/include/linux/socket.h
> > +++ b/include/linux/socket.h
> > @@ -386,6 +386,7 @@ struct ucred {
> >   #define SOL_MCTP    285
> >   #define SOL_SMC             286
> >   #define SOL_VSOCK   287
> > +#define SOL_QUIC     288
> >
> >   /* IPX options */
> >   #define IPX_TYPE    1
> > diff --git a/include/uapi/linux/in.h b/include/uapi/linux/in.h
> > index ced0fc3c3aa5..34becd90d3a6 100644
> > --- a/include/uapi/linux/in.h
> > +++ b/include/uapi/linux/in.h
> > @@ -85,6 +85,8 @@ enum {
> >   #define IPPROTO_RAW         IPPROTO_RAW
> >     IPPROTO_SMC =3D 256,                /* Shared Memory Communications=
         */
> >   #define IPPROTO_SMC         IPPROTO_SMC
> > +  IPPROTO_QUIC =3D 261,                /* A UDP-Based Multiplexed and =
Secure Transport */
> > +#define IPPROTO_QUIC         IPPROTO_QUIC
> >     IPPROTO_MPTCP =3D 262,              /* Multipath TCP connection    =
         */
> >   #define IPPROTO_MPTCP               IPPROTO_MPTCP
> >     IPPROTO_MAX
>
> Can these constants be accepted, soon?
>
> Samba 4.23.0 to be released early September will ship userspace code to
> use them. It would be good to have them correct when kernel's start to
> support this...
I'd like to test ksmbd with smbclient of samba, which includes quic support=
.
Which Samba branch should I use? How do I enable quic in Samba?
Do I need to update smb.conf?

Thanks.
>
> It would also mean less risk for conflicting projects with the need for s=
uch numbers.
>
> I think it's useful to use a value lower than IPPROTO_MAX, because it mea=
ns
> the kernel module can also be build against older kernels as out of tree =
module
> and still it would be transparent for userspace consumers like samba.
> There are hardcoded checks for IPPROTO_MAX in inet_create, inet6_create, =
inet_diag_register
> and the value of IPPROTO_MAX is 263 starting with commit
> d25a92ccae6bed02327b63d138e12e7806830f78 in 6.11.
>
> Thanks!
> metze

Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295731C758
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  2 Jun 2023 16:13:31 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b07762d292so2549891fa.0
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 02 Jun 2023 09:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1685722410; x=1688314410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAKpbgLrjTlgWjkergsjg6ZjPu/gadqcTc7sK1IVYRM=;
        b=LxV21Hr863zuwJG+qWnQ07+tRN1/t7cihJglN8vdHdesjgvs1hx6Q98KbMbVAmFgzg
         x2bDypFEUbJ2qPCSlvHzREz2aFyqmTBUOYAqRapaxSp/CNjlX4XBJWR6bfuNhWyjKq0N
         hLarJe71bqMG7gdzxJJGAewC7UiDdx6KE3BgrXepCQIzxyV1Ju2XZ5BgFSEBakT//zzd
         SIukL22++XRPaFmuTH8YaBq4OFuef9iAPd3kAK/ImkGX84lc9FVJZiyvtnPrArtnR0fM
         LfyqqJ9mMjBEtjnfl75vh4UZDysMxC2NQz4NlMrdDrWbZ4BUpCitLDY/Hqq5acmz+vWz
         uoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722410; x=1688314410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAKpbgLrjTlgWjkergsjg6ZjPu/gadqcTc7sK1IVYRM=;
        b=RTv7VOIBE5nBCoCcrv5j1vEJP9CjZunEWSgJFkAgVwfG11ssmCcaifqM716tIYqa2p
         mBJHPMHkDykEzYTV9sAsuEn9VSovG0eN5AqEQMdM7JNI76TH45rx+6B+PdWRYpFNxGKN
         fzlpZwLr6I3bYmigJmqVLcr8ch9DxumdkDxBnJpSZAe/LvNj6fXmTLvb5ZWsJOmSxH1i
         2yADAkmk3P/RXtJHf9tDpM2IkZJm6TQYDaVcKUJJ/QsfDsgWUj9vv4CZ3FsXGL4J0pJl
         8O2DkdrjVzOvHFYnjMLJBEnITqkpwPRomynf90V2zOB4B4zn1z2Y65NllJPYpVtm0vkF
         h9tw==
X-Gm-Message-State: AC+VfDxkYoYuIpeL8Dhm8TigJnFap1HW/VzwcZxLtqZJnlIlQpzeKyiy
	F6z2p+hN7ObGZW8rt82rPNSG57zJH3on5vY5WGQ=
X-Google-Smtp-Source: ACHHUZ6GH0DdAyN0rqi2bt2gUieQAs4ThaVurkerbyr+6KWJAG2lo8LD7H9CQxrne3cXzgD9q2dkCirGDxgmT8Tr1Kw=
X-Received: by 2002:a05:651c:b9b:b0:2af:15b8:1d06 with SMTP id
 bg27-20020a05651c0b9b00b002af15b81d06mr4526437ljb.0.1685722409565; Fri, 02
 Jun 2023 09:13:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAN-5tyHWWffysryy3Wx9gq4zAF7jbm3o13vEmOybPbXe85jCFA@mail.gmail.com>
 <1C127E22-3935-45E0-BB86-ECC883D19BA9@oracle.com> <CAN-5tyEmGk+vO7tT2GW2oxb7O33i275FmyUW88HOj82w_MQ=2Q@mail.gmail.com>
 <5C47C394-E83F-43D6-8466-544A71E17FE7@oracle.com> <CAN-5tyGw1GFMH2GnGsOF1aL=0Czq3yUVB5mO7BaWNRO6rvi9hA@mail.gmail.com>
 <F44356CE-9A7E-4D6D-ADC8-AF9407CBAD1F@oracle.com> <6BD3F10C-8859-42D3-9035-A23D8F3EB712@oracle.com>
 <193AAC9B-6455-4239-8A82-D71E4D02B883@oracle.com>
In-Reply-To: <193AAC9B-6455-4239-8A82-D71E4D02B883@oracle.com>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Fri, 2 Jun 2023 12:13:18 -0400
Message-ID: <CAN-5tyHC90BHufL-vApHpd1NYeC2px-Pm8CzS6wHcEE9Z1=4bA@mail.gmail.com>
Subject: Re: what should happen for proto=rdma,xprtsec=tls
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 2, 2023 at 10:11=E2=80=AFAM Chuck Lever III <chuck.lever@oracle=
.com> wrote:
>
>
> > On Jun 1, 2023, at 3:28 PM, Chuck Lever III <chuck.lever@oracle.com> wr=
ote:
> >
> >> On May 31, 2023, at 2:55 PM, Chuck Lever III <chuck.lever@oracle.com> =
wrote:
> >>
> >>> On May 31, 2023, at 10:38 AM, Olga Kornievskaia <aglo@umich.edu> wrot=
e:
> >>>
> >>> On Wed, May 31, 2023 at 10:03=E2=80=AFAM Chuck Lever III <chuck.lever=
@oracle.com> wrote:
> >>>>
> >>>>> On May 30, 2023, at 5:29 PM, Olga Kornievskaia <aglo@umich.edu> wro=
te:
> >>>>>
> >>>>> On Tue, May 30, 2023 at 5:10=E2=80=AFPM Chuck Lever III <chuck.leve=
r@oracle.com> wrote:
> >>>>>>
> >>>>>>> On May 30, 2023, at 5:08 PM, Olga Kornievskaia <aglo@umich.edu> w=
rote:
> >>>>>>>
> >>>>>>> Hi Chuck,
> >>>>>>>
> >>>>>>> I did
> >>>>>>> [aglo@unknown000c29dba616 ~]$ sudo mount -o
> >>>>>>> vers=3D4.2,sec=3Dsys,xprtsec=3Dtls,proto=3Drdma,port=3D20049
> >>>>>>> 192.168.1.106:/nfsshare /mnt
> >>>>>>> which succeeded and then I did "mount" which displays:
> >>>>>>> 192.168.1.106:/nfsshare on /mnt type nfs4
> >>>>>>> (rw,relatime,vers=3D4.2,rsize=3D262144,wsize=3D262144,namlen=3D25=
5,hard,proto=3Drdma,port=3D20049,timeo=3D600,retrans=3D2,sec=3Dsys,xprtsec=
=3Dtls,clientaddr=3D192.168.1.119,local_lock=3Dnone,addr=3D192.168.1.106)
> >>>>>>> Naturally no TLS happens for rdma but I'm not sure if this mount
> >>>>>>> should fail? or If the "mount" afterwards shouldn't display/claim=
 that
> >>>>>>> it's doing xprtsec=3Dtls?
> >>>>>>
> >>>>>> That mount request should have failed.
> >>>>>
> >>>>> So perhaps something like this:
> >>>>>
> >>>>> diff --git a/fs/nfs/fs_context.c b/fs/nfs/fs_context.c
> >>>>> index e49e3d18ef88..5fc229a7690b 100644
> >>>>> --- a/fs/nfs/fs_context.c
> >>>>> +++ b/fs/nfs/fs_context.c
> >>>>> @@ -334,7 +334,10 @@ static int nfs_validate_transport_protocol(str=
uct
> >>>>> fs_context *fc,
> >>>>>                     goto out_invalid_transport_udp;
> >>>>>             break;
> >>>>>     case XPRT_TRANSPORT_TCP:
> >>>>> +               break;
> >>>>>     case XPRT_TRANSPORT_RDMA:
> >>>>> +               if (ctx->xprtsec.policy !=3D RPC_XPRTSEC_NONE)
> >>>>> +                       goto out_invalid_transport_rdma;
> >>>>>             break;
> >>>>>     default:
> >>>>>             ctx->nfs_server.protocol =3D XPRT_TRANSPORT_TCP;
> >>>>> @@ -342,6 +345,8 @@ static int nfs_validate_transport_protocol(stru=
ct
> >>>>> fs_context *fc,
> >>>>>     return 0;
> >>>>> out_invalid_transport_udp:
> >>>>>     return nfs_invalf(fc, "NFS: Unsupported transport protocol udp"=
);
> >>>>> +out_invalid_transport_rdma:
> >>>>> +       return nfs_invalf(fc, "NFS: Unsupported xprtsec option for =
rdma");
> >>>>> }
> >>>>>
> >>>>> [aglo@unknown000c29dba616 ~]$sudo mount -o
> >>>>> vers=3D4.2,sec=3Dsys,xprtsec=3Dtls,proto=3Drdma,port=3D20049
> >>>>> 192.168.1.106:/nfsshare /mnt
> >>>>> mount.nfs: an incorrect mount option was specified
> >>>>>
> >>>>> I was expecting to see "NFS: Unsupported xprtsec option for rdma" n=
ot
> >>>>> the "an incorrect mount option was specified". But if I try to do
> >>>>> "proto=3Dudp" I don't see the "unsupported transport protocol udp" =
so
> >>>>> I'm not sure what this nfs_invalf() is supposed to do.
> >>>>
> >>>> Architecturally, the NFS client should pass these option
> >>>> settings down to RPC and let the transport tell it that
> >>>> TLS isn't available.
> >>>>
> >>>> I thought RDMA was missing the functions that marked it
> >>>> as supporting TLS, and so it should have failed the mount.
> >>>> I must have missed something.
> >>>
> >>> Ah, ok.
> >>>
> >>> So in that case here's another (failure) one for you --- mount over
> >>> UDP with xprtsec=3Dtls.
> >>>
> >>> [aglo@unknown000c29dba616 ~]$ sudo mount -o
> >>> vers=3D3,sec=3Dsys,proto=3Dudp,xprtsec=3Dtls 192.168.1.125:/vol1 /mnt
> >>>
> >>> 192.168.1.125:/vol1 on /mnt type nfs
> >>> (rw,relatime,vers=3D3,rsize=3D32768,wsize=3D32768,namlen=3D255,hard,p=
roto=3Dudp,timeo=3D11,retrans=3D3,sec=3Dsys,xprtsec=3Dtls,mountaddr=3D192.1=
68.1.125,mountvers=3D3,mountport=3D635,mountproto=3Dudp,local_lock=3Dnone,a=
ddr=3D192.168.1.125)
> >>
> >> If we ever add DTLS support, that should work. It won't today,
> >> though, and the mount should fail. If you ask for xprtsec=3Dtls
> >> and the transport cannot provide it, the mount needs to fail.
> >>
> >> I'm going to have to rewrite all of this due to Trond's most
> >> recent review comment, so I'll be sure to try the other
> >> transports before shipping the next version.
> >
> > To support using an xprt_class as Trond suggested, the NFS
> > client will have to check the specified combination of netid
> > and xprtsec policy, just as you suggested. Testing now.
>
> I've pushed an update to the topic-rpc-with-tls-upcall branch in:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git
>
> The update attempts to address Trond's request for a new
> xprt_class for RPC on TCP with TLS.
>
> Please try it out. I'd like to post v4 of this series next week.

Will do.

>
>
> --
> Chuck Lever
>
>

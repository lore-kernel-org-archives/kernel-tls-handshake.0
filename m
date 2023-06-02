Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAEA3330D
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  2 Jun 2023 19:08:35 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f60924944aso338595e87.0
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 02 Jun 2023 12:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1685732913; x=1688324913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OV1eMQ1NC9jmw4qg5NpLwpn59GlSTJ95Ml++gPhU6MI=;
        b=YeS7lTwI0Ov5ozantJbhIdGCoj7s0mn3q3mCpAiZnwjZGU4WrVVouUNvkLAd+hyRfz
         PhfueFF0x5g4iWsHXTQjtqJnjNtSsnN8BKPm2+lvMm2RfC34OwocG+GQHm8Y5FqsPKqK
         YaT2jJf1PD/r0sNPqZZ6J3W5xffABht0tATXh2HJoYPe6llA8JXDl7HyyqOYJKiW4tPD
         VKI9/Gq++BQbexq8egDTVwo4X0FGI/mYLusxhEILolGY166G17fx6FgbEt04BZ/3bJbU
         JulPtZ8WR7bQ4ye81kWZ0aqTlXcskE0AwDOHycyGIUz8tDkZcufacmyzJyVA+UMU4r9P
         2B6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685732913; x=1688324913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OV1eMQ1NC9jmw4qg5NpLwpn59GlSTJ95Ml++gPhU6MI=;
        b=TLMw3W8mzYluKjg0xVWFkh47Ecyh56CFysNjKS9pPbca5zV+L67/xThI5hyFgQlHDO
         H48YoeSv8LgaY1Z2GRMgQs5SQ6tvrEHOPV62S4tCoH9rr8O00tcemvZAMVljYNCnyIb1
         m8ngNLDFtfV9pS7iwqHqrkqq+bGXNpJsL/VKgd9BsmOChuKJ/Jw1SxqApUsDKX5ekf6d
         vsIbifgaoGQkdMpMEqvrLAcuCUKJwCYYJobHaaYnT6Tvm8g3cp9A1hYa58QQmjXRB05u
         zea3yR5HJ1DiMNsp5J2/S4o6QF6zoAm+W0c9ENbGqeuQX+jtDogLFY2RbqYUT2I2BaJ+
         WA9w==
X-Gm-Message-State: AC+VfDyaUDQ7+7THNWDMy0QzXmVkd/Dtuh3Jpi+eDg7ekeH8n3jX+rQi
	91HmqSUU5y8hAYH5OV1IWzD0juxBJ0cBKS1M1Bc=
X-Google-Smtp-Source: ACHHUZ6gvgq6OfIY8gCRrBloBqFWzXI0hVxksaQc/E6CMDGA+wLF3xLk6yUecQtHKSzj1V8zOn9qzuLwEIk18FmkWu4=
X-Received: by 2002:a05:651c:309:b0:2b1:b012:e126 with SMTP id
 a9-20020a05651c030900b002b1b012e126mr1091540ljp.3.1685732912891; Fri, 02 Jun
 2023 12:08:32 -0700 (PDT)
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
 <193AAC9B-6455-4239-8A82-D71E4D02B883@oracle.com> <CAN-5tyHC90BHufL-vApHpd1NYeC2px-Pm8CzS6wHcEE9Z1=4bA@mail.gmail.com>
In-Reply-To: <CAN-5tyHC90BHufL-vApHpd1NYeC2px-Pm8CzS6wHcEE9Z1=4bA@mail.gmail.com>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Fri, 2 Jun 2023 15:08:20 -0400
Message-ID: <CAN-5tyHAFwiAToHiKvXOpsm1WdtZuWkcnzboVhbyUaWcoSX-3A@mail.gmail.com>
Subject: Re: what should happen for proto=rdma,xprtsec=tls
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 2, 2023 at 12:13=E2=80=AFPM Olga Kornievskaia <aglo@umich.edu> =
wrote:
>
> On Fri, Jun 2, 2023 at 10:11=E2=80=AFAM Chuck Lever III <chuck.lever@orac=
le.com> wrote:
> >
> >
> > > On Jun 1, 2023, at 3:28 PM, Chuck Lever III <chuck.lever@oracle.com> =
wrote:
> > >
> > >> On May 31, 2023, at 2:55 PM, Chuck Lever III <chuck.lever@oracle.com=
> wrote:
> > >>
> > >>> On May 31, 2023, at 10:38 AM, Olga Kornievskaia <aglo@umich.edu> wr=
ote:
> > >>>
> > >>> On Wed, May 31, 2023 at 10:03=E2=80=AFAM Chuck Lever III <chuck.lev=
er@oracle.com> wrote:
> > >>>>
> > >>>>> On May 30, 2023, at 5:29 PM, Olga Kornievskaia <aglo@umich.edu> w=
rote:
> > >>>>>
> > >>>>> On Tue, May 30, 2023 at 5:10=E2=80=AFPM Chuck Lever III <chuck.le=
ver@oracle.com> wrote:
> > >>>>>>
> > >>>>>>> On May 30, 2023, at 5:08 PM, Olga Kornievskaia <aglo@umich.edu>=
 wrote:
> > >>>>>>>
> > >>>>>>> Hi Chuck,
> > >>>>>>>
> > >>>>>>> I did
> > >>>>>>> [aglo@unknown000c29dba616 ~]$ sudo mount -o
> > >>>>>>> vers=3D4.2,sec=3Dsys,xprtsec=3Dtls,proto=3Drdma,port=3D20049
> > >>>>>>> 192.168.1.106:/nfsshare /mnt
> > >>>>>>> which succeeded and then I did "mount" which displays:
> > >>>>>>> 192.168.1.106:/nfsshare on /mnt type nfs4
> > >>>>>>> (rw,relatime,vers=3D4.2,rsize=3D262144,wsize=3D262144,namlen=3D=
255,hard,proto=3Drdma,port=3D20049,timeo=3D600,retrans=3D2,sec=3Dsys,xprtse=
c=3Dtls,clientaddr=3D192.168.1.119,local_lock=3Dnone,addr=3D192.168.1.106)
> > >>>>>>> Naturally no TLS happens for rdma but I'm not sure if this moun=
t
> > >>>>>>> should fail? or If the "mount" afterwards shouldn't display/cla=
im that
> > >>>>>>> it's doing xprtsec=3Dtls?
> > >>>>>>
> > >>>>>> That mount request should have failed.
> > >>>>>
> > >>>>> So perhaps something like this:
> > >>>>>
> > >>>>> diff --git a/fs/nfs/fs_context.c b/fs/nfs/fs_context.c
> > >>>>> index e49e3d18ef88..5fc229a7690b 100644
> > >>>>> --- a/fs/nfs/fs_context.c
> > >>>>> +++ b/fs/nfs/fs_context.c
> > >>>>> @@ -334,7 +334,10 @@ static int nfs_validate_transport_protocol(s=
truct
> > >>>>> fs_context *fc,
> > >>>>>                     goto out_invalid_transport_udp;
> > >>>>>             break;
> > >>>>>     case XPRT_TRANSPORT_TCP:
> > >>>>> +               break;
> > >>>>>     case XPRT_TRANSPORT_RDMA:
> > >>>>> +               if (ctx->xprtsec.policy !=3D RPC_XPRTSEC_NONE)
> > >>>>> +                       goto out_invalid_transport_rdma;
> > >>>>>             break;
> > >>>>>     default:
> > >>>>>             ctx->nfs_server.protocol =3D XPRT_TRANSPORT_TCP;
> > >>>>> @@ -342,6 +345,8 @@ static int nfs_validate_transport_protocol(st=
ruct
> > >>>>> fs_context *fc,
> > >>>>>     return 0;
> > >>>>> out_invalid_transport_udp:
> > >>>>>     return nfs_invalf(fc, "NFS: Unsupported transport protocol ud=
p");
> > >>>>> +out_invalid_transport_rdma:
> > >>>>> +       return nfs_invalf(fc, "NFS: Unsupported xprtsec option fo=
r rdma");
> > >>>>> }
> > >>>>>
> > >>>>> [aglo@unknown000c29dba616 ~]$sudo mount -o
> > >>>>> vers=3D4.2,sec=3Dsys,xprtsec=3Dtls,proto=3Drdma,port=3D20049
> > >>>>> 192.168.1.106:/nfsshare /mnt
> > >>>>> mount.nfs: an incorrect mount option was specified
> > >>>>>
> > >>>>> I was expecting to see "NFS: Unsupported xprtsec option for rdma"=
 not
> > >>>>> the "an incorrect mount option was specified". But if I try to do
> > >>>>> "proto=3Dudp" I don't see the "unsupported transport protocol udp=
" so
> > >>>>> I'm not sure what this nfs_invalf() is supposed to do.
> > >>>>
> > >>>> Architecturally, the NFS client should pass these option
> > >>>> settings down to RPC and let the transport tell it that
> > >>>> TLS isn't available.
> > >>>>
> > >>>> I thought RDMA was missing the functions that marked it
> > >>>> as supporting TLS, and so it should have failed the mount.
> > >>>> I must have missed something.
> > >>>
> > >>> Ah, ok.
> > >>>
> > >>> So in that case here's another (failure) one for you --- mount over
> > >>> UDP with xprtsec=3Dtls.
> > >>>
> > >>> [aglo@unknown000c29dba616 ~]$ sudo mount -o
> > >>> vers=3D3,sec=3Dsys,proto=3Dudp,xprtsec=3Dtls 192.168.1.125:/vol1 /m=
nt
> > >>>
> > >>> 192.168.1.125:/vol1 on /mnt type nfs
> > >>> (rw,relatime,vers=3D3,rsize=3D32768,wsize=3D32768,namlen=3D255,hard=
,proto=3Dudp,timeo=3D11,retrans=3D3,sec=3Dsys,xprtsec=3Dtls,mountaddr=3D192=
.168.1.125,mountvers=3D3,mountport=3D635,mountproto=3Dudp,local_lock=3Dnone=
,addr=3D192.168.1.125)
> > >>
> > >> If we ever add DTLS support, that should work. It won't today,
> > >> though, and the mount should fail. If you ask for xprtsec=3Dtls
> > >> and the transport cannot provide it, the mount needs to fail.
> > >>
> > >> I'm going to have to rewrite all of this due to Trond's most
> > >> recent review comment, so I'll be sure to try the other
> > >> transports before shipping the next version.
> > >
> > > To support using an xprt_class as Trond suggested, the NFS
> > > client will have to check the specified combination of netid
> > > and xprtsec policy, just as you suggested. Testing now.
> >
> > I've pushed an update to the topic-rpc-with-tls-upcall branch in:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git
> >
> > The update attempts to address Trond's request for a new
> > xprt_class for RPC on TCP with TLS.
> >
> > Please try it out. I'd like to post v4 of this series next week.
>
> Will do.

I can confirm that mount with udp+tls and rdma+tls fail with
"mount.nfs: an incorrect mount option was specified".

> >
> >
> > --
> > Chuck Lever
> >
> >

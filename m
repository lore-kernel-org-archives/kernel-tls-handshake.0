Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7A114AAF
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 31 May 2023 14:39:05 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f3af42459bso978782e87.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 31 May 2023 07:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1685543944; x=1688135944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvaHRdsRapPXSOce0YD5mSyM6pB/MbvSZHOYD2TYPis=;
        b=e88msmW0IAqI6sywnaDqzQaila7FA7l83MqQvVxKF2yywL8O0QlkRbujiDuQTOl8yh
         Ute/40FeT00p3WljXUmB/mJfoyoi2z1JnSLjmWyiMVk1sEfzyKxWXcyULZ1SCfdRYjlK
         UTL8kczaVSknOnM9Cb3bqY5pmSc+UIVe/2IZrPI22p2uz17q9kfXDDNgO8BvPNYREDKF
         lTHap06Bv7JSuqg5FuHxO3HCu8hKr0gt/h0GBOwhSROOQyFgn3nudv7exXhkwo/4rwBD
         ASn234ScuMwsLh8szZZWZgt0XcGvWS5CRV6nQwMSUqjKTU5myEyJCx7Z9YxUyuB8Wdeo
         gSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685543944; x=1688135944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvaHRdsRapPXSOce0YD5mSyM6pB/MbvSZHOYD2TYPis=;
        b=HAUyaSsgidZU8DKiSaXo8OmRiu5QESOo1+Kjtvpikzj8SSwzyhMMKciORqmSBbTckr
         fCKqJ4BBXIl47g96pwPJEhR1Y4zhoh3oO0wBymvWsc5a60puZo5b2hX3okUkF5BQth7j
         k8eQQFMDmex/ebUwBpFtZY8Eari8SOad0rGhzqBUSV9aJrLLZZZ6hrSwenI3/LUmCTyc
         aRn1ydQlJtK3kwP+yttrujAZnJO8O130NVdWMeeqn8oLQ5eIFve9KkxhGNJSaebrDit1
         g6eePu/YSywFqSQWKYeaJ0u0ldAJ9FIbdbbKKmgn+9GAsjhJcAS0I4oxfYCbHnJ9emdE
         mxbw==
X-Gm-Message-State: AC+VfDxGo7oxVZuEqnlNx1JWdzfQKeGNNEdSA6yTE2Gm9Zkpz8Ok1AdJ
	19VDpWuCW6dhFDw5n3n07lf05d8SSoat9UdL0ffzVw+1Z/U=
X-Google-Smtp-Source: ACHHUZ7q6nxaK39fFLKZNCP8bf4y1izplbRLVPJt5OjAmWO7Xvm4WRt6g67A9riPA8pRqbgnsLrMpPcY30l1jJOeGA4=
X-Received: by 2002:a2e:b532:0:b0:2b0:2214:f806 with SMTP id
 z18-20020a2eb532000000b002b02214f806mr926752ljm.5.1685543943355; Wed, 31 May
 2023 07:39:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAN-5tyHWWffysryy3Wx9gq4zAF7jbm3o13vEmOybPbXe85jCFA@mail.gmail.com>
 <1C127E22-3935-45E0-BB86-ECC883D19BA9@oracle.com> <CAN-5tyEmGk+vO7tT2GW2oxb7O33i275FmyUW88HOj82w_MQ=2Q@mail.gmail.com>
 <5C47C394-E83F-43D6-8466-544A71E17FE7@oracle.com>
In-Reply-To: <5C47C394-E83F-43D6-8466-544A71E17FE7@oracle.com>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Wed, 31 May 2023 10:38:51 -0400
Message-ID: <CAN-5tyGw1GFMH2GnGsOF1aL=0Czq3yUVB5mO7BaWNRO6rvi9hA@mail.gmail.com>
Subject: Re: what should happen for proto=rdma,xprtsec=tls
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2023 at 10:03=E2=80=AFAM Chuck Lever III <chuck.lever@oracl=
e.com> wrote:
>
>
>
> > On May 30, 2023, at 5:29 PM, Olga Kornievskaia <aglo@umich.edu> wrote:
> >
> > On Tue, May 30, 2023 at 5:10=E2=80=AFPM Chuck Lever III <chuck.lever@or=
acle.com> wrote:
> >>
> >>
> >>
> >>> On May 30, 2023, at 5:08 PM, Olga Kornievskaia <aglo@umich.edu> wrote=
:
> >>>
> >>> Hi Chuck,
> >>>
> >>> I did
> >>> [aglo@unknown000c29dba616 ~]$ sudo mount -o
> >>> vers=3D4.2,sec=3Dsys,xprtsec=3Dtls,proto=3Drdma,port=3D20049
> >>> 192.168.1.106:/nfsshare /mnt
> >>> which succeeded and then I did "mount" which displays:
> >>> 192.168.1.106:/nfsshare on /mnt type nfs4
> >>> (rw,relatime,vers=3D4.2,rsize=3D262144,wsize=3D262144,namlen=3D255,ha=
rd,proto=3Drdma,port=3D20049,timeo=3D600,retrans=3D2,sec=3Dsys,xprtsec=3Dtl=
s,clientaddr=3D192.168.1.119,local_lock=3Dnone,addr=3D192.168.1.106)
> >>> Naturally no TLS happens for rdma but I'm not sure if this mount
> >>> should fail? or If the "mount" afterwards shouldn't display/claim tha=
t
> >>> it's doing xprtsec=3Dtls?
> >>
> >> That mount request should have failed.
> >
> > So perhaps something like this:
> >
> > diff --git a/fs/nfs/fs_context.c b/fs/nfs/fs_context.c
> > index e49e3d18ef88..5fc229a7690b 100644
> > --- a/fs/nfs/fs_context.c
> > +++ b/fs/nfs/fs_context.c
> > @@ -334,7 +334,10 @@ static int nfs_validate_transport_protocol(struct
> > fs_context *fc,
> >                        goto out_invalid_transport_udp;
> >                break;
> >        case XPRT_TRANSPORT_TCP:
> > +               break;
> >        case XPRT_TRANSPORT_RDMA:
> > +               if (ctx->xprtsec.policy !=3D RPC_XPRTSEC_NONE)
> > +                       goto out_invalid_transport_rdma;
> >                break;
> >        default:
> >                ctx->nfs_server.protocol =3D XPRT_TRANSPORT_TCP;
> > @@ -342,6 +345,8 @@ static int nfs_validate_transport_protocol(struct
> > fs_context *fc,
> >        return 0;
> > out_invalid_transport_udp:
> >        return nfs_invalf(fc, "NFS: Unsupported transport protocol udp")=
;
> > +out_invalid_transport_rdma:
> > +       return nfs_invalf(fc, "NFS: Unsupported xprtsec option for rdma=
");
> > }
> >
> > [aglo@unknown000c29dba616 ~]$sudo mount -o
> > vers=3D4.2,sec=3Dsys,xprtsec=3Dtls,proto=3Drdma,port=3D20049
> > 192.168.1.106:/nfsshare /mnt
> > mount.nfs: an incorrect mount option was specified
> >
> > I was expecting to see "NFS: Unsupported xprtsec option for rdma" not
> > the "an incorrect mount option was specified". But if I try to do
> > "proto=3Dudp" I don't see the "unsupported transport protocol udp" so
> > I'm not sure what this nfs_invalf() is supposed to do.
>
> Architecturally, the NFS client should pass these option
> settings down to RPC and let the transport tell it that
> TLS isn't available.
>
> I thought RDMA was missing the functions that marked it
> as supporting TLS, and so it should have failed the mount.
> I must have missed something.

Ah, ok.

So in that case here's another (failure) one for you --- mount over
UDP with xprtsec=3Dtls.

[aglo@unknown000c29dba616 ~]$ sudo mount -o
vers=3D3,sec=3Dsys,proto=3Dudp,xprtsec=3Dtls 192.168.1.125:/vol1 /mnt

192.168.1.125:/vol1 on /mnt type nfs
(rw,relatime,vers=3D3,rsize=3D32768,wsize=3D32768,namlen=3D255,hard,proto=
=3Dudp,timeo=3D11,retrans=3D3,sec=3Dsys,xprtsec=3Dtls,mountaddr=3D192.168.1=
.125,mountvers=3D3,mountport=3D635,mountproto=3Dudp,local_lock=3Dnone,addr=
=3D192.168.1.125)

>
> --
> Chuck Lever
>
>

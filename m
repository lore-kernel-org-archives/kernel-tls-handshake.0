Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2855C200BC
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 30 May 2023 21:30:06 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b072753301so7287191fa.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 30 May 2023 14:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1685482204; x=1688074204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6DQuHksjn5bthYslWnaGQpBOQlSEAU0KmcRB27Y7s0=;
        b=MiltH6q9SeuZVNyJ2dx38Zu+uxs7ynYqE9KS8WndBVfaORiq2Mgv8xIN74i+IO62ME
         j6K5YQpgupxbLXGfLVrQ/RQAKltidYEK12CXZbogOihf/DQSeWu4hQVig7xb0Bqw/Dye
         Nyg7TxOaGDvk0q/VQxJr8t3OluSEdzGeWawWjrzU1XLHmev0VgSPvzuD0u3qHUKnU3Fa
         dSaqWkfaDXEWadB+9PqZAi3Uy9FzDZJB12ZM9LpM2c9UBM7q3EMHTwum/hG/IeDBDx0R
         Kh5SWju0FgcnsL42TvdFx0eun1ZJGLxZEqjRKiAwvCGxvMeO8Ktb351mx2iVBUDOEnbb
         yb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685482204; x=1688074204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6DQuHksjn5bthYslWnaGQpBOQlSEAU0KmcRB27Y7s0=;
        b=ldnAuaem2eHk8DKkASY+qiWqTaGUUTU+Sz/QKvvUP3O0qFUsSR6PIuaUmGrRfYWz3z
         W8QGqJ1KkXPlVrYIHSllqLiTwGdSRoUUgRdZIsVSATlE0zTRO1IEa9KjdGjqHjug6d49
         YAYLiS5ShzETbqdFZnjLewV90TcSphXXjv3E7evpyhCdGS/+UsVune6nicq7dFxF4HuU
         zBR0YgjYQlM0G7ckOPr2JMIotExKmf2ZbqOevvnbDFNpLipYcYWTzpK9asOYixATdNk8
         M4wRQQa//pdbtRwQWVxGkiIKe6eaOgLHcpRvbJDCjLdcB4/ICbFDn8Poh4q7VprEshiI
         QduA==
X-Gm-Message-State: AC+VfDzASuyWltQFlw/X6BX68RwHrWCIM9jm0Qmz7WBm3pQQROczWivN
	68UIJ/jKGIAqfFs4YxQcZ/zQcV0wjlg4L5fqI/3Q/62j9t4=
X-Google-Smtp-Source: ACHHUZ6xvseOMxQ16ZzgKaB63Znco8Xn/yCkxwiMoQf7xfzNTHsRHerMEhvf7GOcvf9VdWENE3NkWeQDicnD/fLxFIw=
X-Received: by 2002:a2e:b5b7:0:b0:2b0:6792:c6d9 with SMTP id
 f23-20020a2eb5b7000000b002b06792c6d9mr145035ljn.4.1685482203877; Tue, 30 May
 2023 14:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAN-5tyHWWffysryy3Wx9gq4zAF7jbm3o13vEmOybPbXe85jCFA@mail.gmail.com>
 <1C127E22-3935-45E0-BB86-ECC883D19BA9@oracle.com>
In-Reply-To: <1C127E22-3935-45E0-BB86-ECC883D19BA9@oracle.com>
From: Olga Kornievskaia <aglo@umich.edu>
Date: Tue, 30 May 2023 17:29:52 -0400
Message-ID: <CAN-5tyEmGk+vO7tT2GW2oxb7O33i275FmyUW88HOj82w_MQ=2Q@mail.gmail.com>
Subject: Re: what should happen for proto=rdma,xprtsec=tls
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 5:10=E2=80=AFPM Chuck Lever III <chuck.lever@oracle=
.com> wrote:
>
>
>
> > On May 30, 2023, at 5:08 PM, Olga Kornievskaia <aglo@umich.edu> wrote:
> >
> > Hi Chuck,
> >
> > I did
> > [aglo@unknown000c29dba616 ~]$ sudo mount -o
> > vers=3D4.2,sec=3Dsys,xprtsec=3Dtls,proto=3Drdma,port=3D20049
> > 192.168.1.106:/nfsshare /mnt
> > which succeeded and then I did "mount" which displays:
> > 192.168.1.106:/nfsshare on /mnt type nfs4
> > (rw,relatime,vers=3D4.2,rsize=3D262144,wsize=3D262144,namlen=3D255,hard=
,proto=3Drdma,port=3D20049,timeo=3D600,retrans=3D2,sec=3Dsys,xprtsec=3Dtls,=
clientaddr=3D192.168.1.119,local_lock=3Dnone,addr=3D192.168.1.106)
> > Naturally no TLS happens for rdma but I'm not sure if this mount
> > should fail? or If the "mount" afterwards shouldn't display/claim that
> > it's doing xprtsec=3Dtls?
>
> That mount request should have failed.

So perhaps something like this:

diff --git a/fs/nfs/fs_context.c b/fs/nfs/fs_context.c
index e49e3d18ef88..5fc229a7690b 100644
--- a/fs/nfs/fs_context.c
+++ b/fs/nfs/fs_context.c
@@ -334,7 +334,10 @@ static int nfs_validate_transport_protocol(struct
fs_context *fc,
                        goto out_invalid_transport_udp;
                break;
        case XPRT_TRANSPORT_TCP:
+               break;
        case XPRT_TRANSPORT_RDMA:
+               if (ctx->xprtsec.policy !=3D RPC_XPRTSEC_NONE)
+                       goto out_invalid_transport_rdma;
                break;
        default:
                ctx->nfs_server.protocol =3D XPRT_TRANSPORT_TCP;
@@ -342,6 +345,8 @@ static int nfs_validate_transport_protocol(struct
fs_context *fc,
        return 0;
 out_invalid_transport_udp:
        return nfs_invalf(fc, "NFS: Unsupported transport protocol udp");
+out_invalid_transport_rdma:
+       return nfs_invalf(fc, "NFS: Unsupported xprtsec option for rdma");
 }

[aglo@unknown000c29dba616 ~]$sudo mount -o
vers=3D4.2,sec=3Dsys,xprtsec=3Dtls,proto=3Drdma,port=3D20049
192.168.1.106:/nfsshare /mnt
mount.nfs: an incorrect mount option was specified

I was expecting to see "NFS: Unsupported xprtsec option for rdma" not
the "an incorrect mount option was specified". But if I try to do
"proto=3Dudp" I don't see the "unsupported transport protocol udp" so
I'm not sure what this nfs_invalf() is supposed to do.
I
>
>
> --
> Chuck Lever
>
>

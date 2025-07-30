Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444171EF09B
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 30 Jul 2025 21:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753911421; cv=none; b=BHAN3A+qBLFkaLL2nzmi0FHcITzrZMuRBkhJeGuB09MRAwkkcJL2HgW6o6kaeGP/DJACmlb1fd/qX2D97I8OmAfvM8yPNVHHix0ShiNGdBrsBXMrrtGjSbd1euVQjpCmKhSpNwF20C3GDLvW18o+8pIWmUTtjZgsP3N4qOZfZDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753911421; c=relaxed/simple;
	bh=zp9B5nGHIG+i+kh7j9Ga7LG98BNxe4q96gRJnuj4yvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KVM55VZ+fDF9nCNmhJgi39bOnTBAGDmtg9ycsmpvYep5esv9UZ/veAj/XZ4QUJatcVzOZmGesjGR4LSCF8eJcdsHffLUAl+qbQmkx8KDxZUE0M8mx9hlOUVz0iUpy5cFS29IFdK165tD54f07Afm5IeQATeSBcGmDdEyOjy+SK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M4LgVWGa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M4LgVWGa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753911418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pUVJK/b8xtvanBoj9VS0jS/GGMLzTsUc4wyzInBkEHc=;
	b=M4LgVWGaTPntJgiUrTv4IU8eGa++3xH1iMc3PxTS4ymX44rvl/Iyj17NvySlWT91XmVgj2
	cO0LYMe5VelsBCtPzR0Ovob3AMISsz8jR/AWB+CJGT/gJm7DJqaGKlvlWIGymmrmX3fTt/
	gUYmX9PSW2zjxVx+r+nM2o3tLQzVZX8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-EtQZWbeSPI2LQJy8qXmI-w-1; Wed, 30 Jul 2025 17:36:55 -0400
X-MC-Unique: EtQZWbeSPI2LQJy8qXmI-w-1
X-Mimecast-MFC-AGG-ID: EtQZWbeSPI2LQJy8qXmI-w_1753911414
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ae9bf1c5947so188479266b.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 30 Jul 2025 14:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753911414; x=1754516214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUVJK/b8xtvanBoj9VS0jS/GGMLzTsUc4wyzInBkEHc=;
        b=vdMR4gU/5W8f896thKpvfkyjr4r/9oijPeuX55WTui0/iSuKMfpj/BPQPD3xSCQuHR
         evvkA86su2n13ck2K9BZlo7L79nZ1C8d73jVRviq2wHl620jY7zGLjIwC4UBwusR+drI
         f+BwkPdLjQtomuROHFa4mIpOfY8qwTGSJNQVVX2PULaLxvYZeH9fJLakRZl50Hl0b2nO
         667Mln1FcBvst1CvW+KgtIAAsRe9VUag4qCYJGKivYwDsLgQmz3V9JYIHAp5IB5QgDfl
         MgLu8Xu+2DcgVajw7SfA2j9esvV4UXTNTXrZa+8WdA5uH4fst4uAgielOMpsU4x/pw7G
         LJxA==
X-Forwarded-Encrypted: i=1; AJvYcCXKNGNc+BLhheaRMLHlbXGwiq8qwQ/47nP/Psxd/iWkAhKuVwRQP/k6z+fO9L6rE8uIH0ETcECrn1exTu6hgiqOF8djzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTgKyebAfcGAl0NyDq551XWdmTU+TVZAnX4rmP8WXI03srgdjD
	202v7fD4H5StpAECNUe2gTt+lXFDqGhRc4O8g7m2u9Cg2tsQsW1uTTpYo+sTPHj/cPpN/4Z1kPH
	HyYQ2J9ikVoCgqZds37DMHbLa9ooXfvKz1SnQsIhGt/7wH4gXmw/pNTziP+3zhJCqH8wKDIaYxf
	OZ/DLUGWNyht/RSFKybRxeyhB6gG8mVUDoclV1iVYYymDXAWCbEGA=
X-Gm-Gg: ASbGncvsvLWVngVzH/6Oh9Cty0YFKn4U0gnxpAa/6tS/UZ9P95mAE4gHnTxnjHb5ibN
	cMGFoo1UY8jORu74H5CYNKMpxIvKmc5umyM673/MOKzOZVcakYX8readzJurjo94t/pgq553Nv5
	J4GEpUe92JHzesU95hLm48kqYiuEgkXUaWOZySvwhbepH+Vu+9ZtE5Zl8=
X-Received: by 2002:a17:907:1b08:b0:ae0:c092:ee12 with SMTP id a640c23a62f3a-af8fd335d47mr514414466b.22.1753911414053;
        Wed, 30 Jul 2025 14:36:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU+UNzcVLnhtqdg3k8t4IZaqUNYX6eJdTyw40q+0juwL6H+y4IHc+PTci+/T9eOlrpvi9mA3LhywAXgNGp8fI=
X-Received: by 2002:a17:907:1b08:b0:ae0:c092:ee12 with SMTP id
 a640c23a62f3a-af8fd335d47mr514411766b.22.1753911413545; Wed, 30 Jul 2025
 14:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730200835.80605-1-okorniev@redhat.com> <20250730200835.80605-2-okorniev@redhat.com>
 <8753ffaf-0146-45c6-9189-bd8ea3e74e71@oracle.com>
In-Reply-To: <8753ffaf-0146-45c6-9189-bd8ea3e74e71@oracle.com>
From: Olga Kornievskaia <okorniev@redhat.com>
Date: Wed, 30 Jul 2025 17:36:42 -0400
X-Gm-Features: Ac12FXzVg6SWdNfy3Rt77NF_wjgPRdWJbcLlHUN8fnoRnafWxUNAbvZ2xJMzMYU
Message-ID: <CACSpFtB2guwTKbt_kC57BKU2DKWu58Dxhn0Y-eVzXWmCnMUWkw@mail.gmail.com>
Subject: Re: [PATCH 1/4] sunrpc: fix handling of server side tls alerts
To: Chuck Lever <chuck.lever@oracle.com>
Cc: jlayton@kernel.org, trondmy@hammerspace.com, anna.schumaker@oracle.com, 
	hch@lst.de, sagi@grimberg.me, kch@nvidia.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux-nfs@vger.kernel.org, linux-nvme@lists.infradead.org, 
	netdev@vger.kernel.org, kernel-tls-handshake@lists.linux.dev, neil@brown.name, 
	Dai.Ngo@oracle.com, tom@talpey.com, hare@suse.de, horms@kernel.org, 
	kbusch@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pmotVsfPloYLtCg9mF-MZQzdPJZL5mc8A_0LUEgBn9w_1753911414
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 4:59=E2=80=AFPM Chuck Lever <chuck.lever@oracle.com=
> wrote:
>
> On 7/30/25 4:08 PM, Olga Kornievskaia wrote:
> > Scott Mayhew discovered a security exploit in NFS over TLS in
> > tls_alert_recv() due to its assumption it can read data from
> > the msg iterator's kvec..
> >
> > kTLS implementation splits TLS non-data record payload between
> > the control message buffer (which includes the type such as TLS
> > aler or TLS cipher change) and the rest of the payload (say TLS
> > alert's level/description) which goes into the msg payload buffer.
> >
> > This patch proposes to rework how control messages are setup and
> > used by sock_recvmsg().
> >
> > If no control message structure is setup, kTLS layer will read and
> > process TLS data record types. As soon as it encounters a TLS control
> > message, it would return an error. At that point, NFS can setup a
> > kvec backed msg buffer and read in the control message such as a
> > TLS alert. Scott found that msg iterator can advance the kvec
> > pointer as a part of the copy process thus we need to revert the
> > iterator before calling into the tls_alert_recv.
> >
> > Reported-by: Scott Mayhew <smayhew@redhat.com>
> > Fixes: 5e052dda121e ("SUNRPC: Recognize control messages in server-side=
 TCP socket code")
> > Suggested-by: Trond Myklebust <trondmy@hammerspace.com>
> > Suggested-by: Scott Mayhew <smayhew@redhat.com>
> > Signed-off-by: Olga Kornievskaia <okorniev@redhat.com>
> > ---
> >  net/sunrpc/svcsock.c | 43 +++++++++++++++++++++++++++++++++++--------
> >  1 file changed, 35 insertions(+), 8 deletions(-)
> >
> > diff --git a/net/sunrpc/svcsock.c b/net/sunrpc/svcsock.c
> > index 46c156b121db..e2c5e0e626f9 100644
> > --- a/net/sunrpc/svcsock.c
> > +++ b/net/sunrpc/svcsock.c
> > @@ -257,20 +257,47 @@ svc_tcp_sock_process_cmsg(struct socket *sock, st=
ruct msghdr *msg,
> >  }
> >
> >  static int
> > -svc_tcp_sock_recv_cmsg(struct svc_sock *svsk, struct msghdr *msg)
> > +svc_tcp_sock_recv_cmsg(struct socket *sock, unsigned int *msg_flags)
> >  {
> >       union {
> >               struct cmsghdr  cmsg;
> >               u8              buf[CMSG_SPACE(sizeof(u8))];
> >       } u;
> > -     struct socket *sock =3D svsk->sk_sock;
> > +     u8 alert[2];
> > +     struct kvec alert_kvec =3D {
> > +             .iov_base =3D alert,
> > +             .iov_len =3D sizeof(alert),
> > +     };
> > +     struct msghdr msg =3D {
> > +             .msg_flags =3D *msg_flags,
> > +             .msg_control =3D &u,
> > +             .msg_controllen =3D sizeof(u),
> > +     };
> > +     int ret;
> > +
> > +     iov_iter_kvec(&msg.msg_iter, ITER_DEST, &alert_kvec, 1,
> > +                   alert_kvec.iov_len);
> > +     ret =3D sock_recvmsg(sock, &msg, MSG_DONTWAIT);
> > +     if (ret > 0 &&
> > +         tls_get_record_type(sock->sk, &u.cmsg) =3D=3D TLS_RECORD_TYPE=
_ALERT) {
> > +             iov_iter_revert(&msg.msg_iter, ret);
> > +             ret =3D svc_tcp_sock_process_cmsg(sock, &msg, &u.cmsg, -E=
AGAIN);
> > +     }
> > +     return ret;
> > +}
> > +
> > +static int
> > +svc_tcp_sock_recvmsg(struct svc_sock *svsk, struct msghdr *msg)
> > +{
> >       int ret;
> > +     struct socket *sock =3D svsk->sk_sock;
> >
> > -     msg->msg_control =3D &u;
> > -     msg->msg_controllen =3D sizeof(u);
> >       ret =3D sock_recvmsg(sock, msg, MSG_DONTWAIT);
> > -     if (unlikely(msg->msg_controllen !=3D sizeof(u)))
> > -             ret =3D svc_tcp_sock_process_cmsg(sock, msg, &u.cmsg, ret=
);
> > +     if (msg->msg_flags & MSG_CTRUNC) {
> > +             msg->msg_flags &=3D ~(MSG_CTRUNC | MSG_EOR);
> > +             if (ret =3D=3D 0 || ret =3D=3D -EIO)
> > +                     ret =3D svc_tcp_sock_recv_cmsg(sock, &msg->msg_fl=
ags);
> > +     }
> >       return ret;
> >  }
> >
> > @@ -321,7 +348,7 @@ static ssize_t svc_tcp_read_msg(struct svc_rqst *rq=
stp, size_t buflen,
> >               iov_iter_advance(&msg.msg_iter, seek);
> >               buflen -=3D seek;
> >       }
> > -     len =3D svc_tcp_sock_recv_cmsg(svsk, &msg);
> > +     len =3D svc_tcp_sock_recvmsg(svsk, &msg);
> >       if (len > 0)
> >               svc_flush_bvec(bvec, len, seek);
> >
> > @@ -1018,7 +1045,7 @@ static ssize_t svc_tcp_read_marker(struct svc_soc=
k *svsk,
> >               iov.iov_base =3D ((char *)&svsk->sk_marker) + svsk->sk_tc=
plen;
> >               iov.iov_len  =3D want;
> >               iov_iter_kvec(&msg.msg_iter, ITER_DEST, &iov, 1, want);
> > -             len =3D svc_tcp_sock_recv_cmsg(svsk, &msg);
> > +             len =3D svc_tcp_sock_recvmsg(svsk, &msg);
> >               if (len < 0)
> >                       return len;
> >               svsk->sk_tcplen +=3D len;
>
> Fwiw, I've already pulled 1/4 into nfsd-testing. But 4/4 might not apply
> until the others are in the tree. We might want these to go through a
> single tree.
>
> Or, can we delay 4/4 until 6.18 ?

Delaying 4/4 until 6.18 sounds fine to me.

>
>
> --
> Chuck Lever
>


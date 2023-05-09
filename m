Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA71A33D1
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  9 May 2023 07:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683615889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KLKimmPNwCp11rCXqZKJJTcKqRna14kMObZ17X1sciI=;
	b=E2zAp5nlpJ7AiaAZfdPOp8FwlgW/PTEpiqwZ3qVdhFyZMAiZmDMy6eZ7TrskFTuPMP/mWa
	FeBlL6WQ3YY6RsLA5pM9Oyj3RYycc5vSSDznfXUOpVK/i1wzjCFcxbhTsIUarpou4bB3T6
	s3y3Hvt5TDmxi6CgdkI2x7kyH1I6Y7w=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-xpvz5BgoMMCrAjaZJWbrJQ-1; Tue, 09 May 2023 03:04:48 -0400
X-MC-Unique: xpvz5BgoMMCrAjaZJWbrJQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-5ef4d54d84cso10170416d6.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 09 May 2023 00:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615888; x=1686207888;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+PavQnsDrQ3Ziaclav5kottbUNlilAfnc2SUG1Hbbs=;
        b=afEyydb+Jk36UXjJ3HLouC39n24Mk05dxj2UuNxFuhmtv/FhnOTfyHhU0Fd9iZGfiP
         tSmxPiQAZFmbDbxn2FO3zMgXgSaa00sxcyBwOU6EQL4U0tX4mtHjYW8c13V8jqzWUpIH
         1CA2nJtX9/oVsUFfkdkXGSIFwDbvQ7JtxmdnmCQkiiaEJtjq7AyqTDi2NK54eiZB8DV1
         cexT72a9HH3hPKMeru79xw1Qgl0uL/58XhY3qypEdIknSxH3mE4BtcLmIqAB0ZB26Q6T
         WoGv6DmUhfk/Ie9VrvN9BHzFcP5zaWuDaYyPlvO2H6c/ryhaMHZUVq/tdqru0sdIqXyw
         eXEA==
X-Gm-Message-State: AC+VfDxxpBQ4zuxAm9ScX/MsQIAg5PS7RFhja2tOwpUSB7+Ngoa9zxpl
	jOTb86qitX7x9s9NIK5XoldQGz/52afO4KdarzpEGb7UbI2jEFU+9DYTDLyELX8X+xusx7LYdiG
	EmV5d3XSNNtepJgzLfFm/nWTAO4tbYMULU6k=
X-Received: by 2002:a05:6214:5290:b0:61b:7115:55a9 with SMTP id kj16-20020a056214529000b0061b711555a9mr17505924qvb.0.1683615888270;
        Tue, 09 May 2023 00:04:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7xcooT/xK5gavWdwem56NjI42j7fRg+aB9WVumPKuESVRQojNiPJ/4T05I173D0VVw7nSfzA==
X-Received: by 2002:a05:6214:5290:b0:61b:7115:55a9 with SMTP id kj16-20020a056214529000b0061b711555a9mr17505911qvb.0.1683615887961;
        Tue, 09 May 2023 00:04:47 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-255-65.dyn.eolo.it. [146.241.255.65])
        by smtp.gmail.com with ESMTPSA id g14-20020a0ce4ce000000b005ef608dc422sm572876qvm.41.2023.05.09.00.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:04:47 -0700 (PDT)
Message-ID: <80ebc863cd77158a964698f7a887b15dc88e4631.camel@redhat.com>
Subject: Re: [PATCH v2 2/6] net/handshake: Fix handshake_dup() ref counting
From: Paolo Abeni <pabeni@redhat.com>
To: Leon Romanovsky <leon@kernel.org>, Chuck Lever <cel@kernel.org>
Cc: kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	dan.carpenter@linaro.org
Date: Tue, 09 May 2023 09:04:39 +0200
In-Reply-To: <20230507082556.GG525452@unreal>
References: <168333373851.7813.11884763481187785511.stgit@oracle-102.nfsv4bat.org>
	 <168333395123.7813.7077088598355438510.stgit@oracle-102.nfsv4bat.org>
	 <20230507082556.GG525452@unreal>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2023-05-07 at 11:25 +0300, Leon Romanovsky wrote:
> On Fri, May 05, 2023 at 08:46:01PM -0400, Chuck Lever wrote:
> > From: Chuck Lever <chuck.lever@oracle.com>
> >=20
> > If get_unused_fd_flags() fails, we ended up calling fput(sock->file)
> > twice.
> >=20
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Fixes: 3b3009ea8abb ("net/handshake: Create a NETLINK service for handl=
ing handshake requests")
> > Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> > ---
> >  net/handshake/netlink.c |    4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >=20
> > diff --git a/net/handshake/netlink.c b/net/handshake/netlink.c
> > index 7ec8a76c3c8a..032d96152e2f 100644
> > --- a/net/handshake/netlink.c
> > +++ b/net/handshake/netlink.c
> > @@ -101,10 +101,8 @@ static int handshake_dup(struct socket *sock)
> > =20
> >  =09file =3D get_file(sock->file);
> >  =09newfd =3D get_unused_fd_flags(O_CLOEXEC);
> > -=09if (newfd < 0) {
> > -=09=09fput(file);
> > +=09if (newfd < 0)
> >  =09=09return newfd;
>=20
> IMHO, the better way to fix it is to change handshake_nl_accept_doit()
> do not call to fput(sock->file) in error case. It is not right thing
> to have a call to handshake_dup() and rely on elevated get_file()
> for failure too as it will be problematic for future extension of
> handshake_dup().

I agree with the above: I think a failing helper should leave the
larger scope status unmodified. In this case a failing handshake_dup()
should not touch file refcount, and handshake_nl_accept_doit() should
be modified accordingly, something alike:

---
diff --git a/net/handshake/netlink.c b/net/handshake/netlink.c
index e865fcf68433..8897a17189ad 100644
--- a/net/handshake/netlink.c
+++ b/net/handshake/netlink.c
@@ -138,14 +138,15 @@ int handshake_nl_accept_doit(struct sk_buff *skb, str=
uct genl_info *info)
 =09}
 =09err =3D req->hr_proto->hp_accept(req, info, fd);
 =09if (err)
-=09=09goto out_complete;
+=09=09goto out_put;
=20
 =09trace_handshake_cmd_accept(net, req, req->hr_sk, fd);
 =09return 0;
=20
+out_put:
+=09fput(sock->file);
 out_complete:
 =09handshake_complete(req, -EIO, NULL);
-=09fput(sock->file);
 out_status:
 =09trace_handshake_cmd_accept_err(net, req, NULL, err);
 =09return err;
---

Somewhat related: handshake_nl_done_doit() releases the file refcount
even if the req lookup fails. If that is caused by a concurrent
req_cancel - not sure if possible at all, possibly syzkaller could
guess if instructed about the API - such refcount will underflow, as it
is rightfully decremented by req_cancel, too.

I think it should be safer adding a chunk like:

---
diff --git a/net/handshake/netlink.c b/net/handshake/netlink.c
index e865fcf68433..3e3e849f302a 100644
--- a/net/handshake/netlink.c
+++ b/net/handshake/netlink.c
@@ -172,7 +173,6 @@ int handshake_nl_done_doit(struct sk_buff *skb, struct =
genl_info *info)
 =09req =3D handshake_req_hash_lookup(sock->sk);
 =09if (!req) {
 =09=09err =3D -EBUSY;
-=09=09fput(sock->file);
 =09=09goto out_status;
 =09}
---

Possibly explicitly documenting the used ownership rules for the file
refcount in the relevant functions could help with future maintenance.

Finally it's not clear to me if we agreed to a target tree or not ;) I
see no replies so my suggestion.

Thanks!

Paolo


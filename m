Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D4A23AD
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 09:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679475805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WdEWwL51ZkiGuS5kFF5PkjZVQVANqxT2a0QBXyVpkrk=;
	b=RSWNpjmpV76LxtlR0UputGFt5mxNpmOeEr/QCAIxXKlj2qWDFAYN9FkWqYO6AEcZXm0Mst
	/SDOmVTheHgZkvd4qDE9vPftXcDliljO532eo1T7oUmrFtFmQE1Tk6iI9+pQquh9TDY/Sv
	q8Qj6BC21rxY6IWj4ufQewcLLKGW/pk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-prdXSfcZMAWtbTHSvabuww-1; Wed, 22 Mar 2023 05:03:24 -0400
X-MC-Unique: prdXSfcZMAWtbTHSvabuww-1
Received: by mail-qv1-f70.google.com with SMTP id e11-20020ad4536b000000b005a9292e8c2bso8992963qvv.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 02:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679475804;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/zm6fHynkBFWZGfQdf0VUoXVF9x4NZeMNqBI588ZQLQ=;
        b=SdfWJAsVx38HpTbg/EzkJuzEHvMzJx2Dwz9iJaRHne53gBFcpH3w5Jms2bXuKCuNdt
         1pPXkSiTvd5/cklonpP9bByM3Hw4XXecFUHxN5I6iAf5NNnqhHZ4sSE/hQFYxtOjWO8/
         6chBa3xAoGWzpL/6KkOBFz4GL7TQbwcBItqcVNfnvcZ7PxrlyeQvMCniNiqtdAJCWf8g
         R6z6HwdDXkmViv508yY+iM3j7gm/gpbHpQ3gC2OnWgIoR3X8OqullLXBWhZvkbvKPCgu
         hI7d6ZC1y/oZeLoCTEY+PZMZO17XO0SyPXXwmogE7oCzESu8IVTB4/WSIOglx1ynpKVP
         ixBA==
X-Gm-Message-State: AO0yUKW9/DaqJtyHec3J354Od0bObTRMOpNFkYSvCiZM5CrnOHZqVgcy
	e5+onhTx/lEi/ESzFU3gWESW7ev0bRjNe0q6v/TWtDapU+nnVTyCFcU88yoq3ib+Sn9fuMGvKMu
	DadrawBgLUp4HeHVnnae1EjsLhjwA/+YZ+Ps=
X-Received: by 2002:a05:6214:300f:b0:5a8:a090:59c8 with SMTP id ke15-20020a056214300f00b005a8a09059c8mr8584051qvb.4.1679475803784;
        Wed, 22 Mar 2023 02:03:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set+/51KpdCOsu3NLy3CjzKOj3PT56zaQDyi5tZEdyg3IM69is8V7UTLNw1gT/lxHLhoA2L/TmA==
X-Received: by 2002:a05:6214:300f:b0:5a8:a090:59c8 with SMTP id ke15-20020a056214300f00b005a8a09059c8mr8584024qvb.4.1679475803460;
        Wed, 22 Mar 2023 02:03:23 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-244-168.dyn.eolo.it. [146.241.244.168])
        by smtp.gmail.com with ESMTPSA id a4-20020ae9e804000000b007467f8b76f0sm6409594qkg.41.2023.03.22.02.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 02:03:22 -0700 (PDT)
Message-ID: <dc32e3654de0bee5d8c6cf64375fa491b89d655f.camel@redhat.com>
Subject: Re: [PATCH v7 1/2] net/handshake: Create a NETLINK service for
 handling handshake requests
From: Paolo Abeni <pabeni@redhat.com>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: Chuck Lever <cel@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>, "open list:NETWORKING [GENERAL]"
 <netdev@vger.kernel.org>,  "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>, John Haxby <john.haxby@oracle.com>
Date: Wed, 22 Mar 2023 10:03:19 +0100
In-Reply-To: <674AEE9C-BDB7-440E-902E-73918D6E2370@oracle.com>
References: <167915594811.91792.15722842400657376706.stgit@manet.1015granger.net>
	 <167915629953.91792.17220269709156129944.stgit@manet.1015granger.net>
	 <3dc6b9290984bc07ae5ac9c5a9fba01742b64f84.camel@redhat.com>
	 <674AEE9C-BDB7-440E-902E-73918D6E2370@oracle.com>
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

On Tue, 2023-03-21 at 13:58 +0000, Chuck Lever III wrote:
>=20
> > On Mar 21, 2023, at 7:27 AM, Paolo Abeni <pabeni@redhat.com> wrote:
> >=20
> > On Sat, 2023-03-18 at 12:18 -0400, Chuck Lever wrote:
> > > +/**
> > > + * handshake_req_alloc - consumer API to allocate a request
> > > + * @sock: open socket on which to perform a handshake
> > > + * @proto: security protocol
> > > + * @flags: memory allocation flags
> > > + *
> > > + * Returns an initialized handshake_req or NULL.
> > > + */
> > > +struct handshake_req *handshake_req_alloc(struct socket *sock,
> > > +=09=09=09=09=09  const struct handshake_proto *proto,
> > > +=09=09=09=09=09  gfp_t flags)
> > > +{
> > > +=09struct sock *sk =3D sock->sk;
> > > +=09struct net *net =3D sock_net(sk);
> > > +=09struct handshake_net *hn =3D handshake_pernet(net);
> > > +=09struct handshake_req *req;
> > > +
> > > +=09if (!hn)
> > > +=09=09return NULL;
> > > +
> > > +=09req =3D kzalloc(struct_size(req, hr_priv, proto->hp_privsize), fl=
ags);
> > > +=09if (!req)
> > > +=09=09return NULL;
> > > +
> > > +=09sock_hold(sk);
> >=20
> > The hr_sk reference counting is unclear to me. It looks like
> > handshake_req retain a reference to such socket, but
> > handshake_req_destroy()/handshake_sk_destruct() do not release it.
>=20
> If we rely on sk_destruct to release the final reference count,
> it will never get invoked.
>=20
>=20
> > Perhaps is better moving such sock_hold() into handshake_req_submit(),
> > once that the request is successful?
>=20
> I will do that.
>=20
> Personally, I find it more clear to bump a reference count when
> saving a copy of the object's pointer, as is done in _alloc. But if
> others find it easier the other way, I have no problem changing
> it to suit community preferences.

I made the above suggestion because it looks like the sk reference is
not released in the handshake_req_submit() error path, but anything
addressing that would be good enough for me.

[...]

> >=20
> > > +/**
> > > + * handshake_req_cancel - consumer API to cancel an in-progress hand=
shake
> > > + * @sock: socket on which there is an ongoing handshake
> > > + *
> > > + * XXX: Perhaps killing the user space agent might also be necessary=
?
> > > + *
> > > + * Request cancellation races with request completion. To determine
> > > + * who won, callers examine the return value from this function.
> > > + *
> > > + * Return values:
> > > + *   %true - Uncompleted handshake request was canceled or not found
> > > + *   %false - Handshake request already completed
> > > + */
> > > +bool handshake_req_cancel(struct socket *sock)
> > > +{
> > > +=09struct handshake_req *req;
> > > +=09struct handshake_net *hn;
> > > +=09struct sock *sk;
> > > +=09struct net *net;
> > > +
> > > +=09sk =3D sock->sk;
> > > +=09net =3D sock_net(sk);
> > > +=09req =3D handshake_req_hash_lookup(sk);
> > > +=09if (!req) {
> > > +=09=09trace_handshake_cancel_none(net, req, sk);
> > > +=09=09return true;
> > > +=09}
> > > +
> > > +=09hn =3D handshake_pernet(net);
> > > +=09if (hn && remove_pending(hn, req)) {
> > > +=09=09/* Request hadn't been accepted */
> > > +=09=09trace_handshake_cancel(net, req, sk);
> > > +=09=09return true;
> > > +=09}
> > > +=09if (test_and_set_bit(HANDSHAKE_F_REQ_COMPLETED, &req->hr_flags)) =
{
> > > +=09=09/* Request already completed */
> > > +=09=09trace_handshake_cancel_busy(net, req, sk);
> > > +=09=09return false;
> > > +=09}
> > > +
> > > +=09__sock_put(sk);
> >=20
> > Same here.
>=20
> I'll move the sock_hold() to _submit, and cook up a comment or two.

In such comments please also explain why sock_put() is not needed here
(and above). e.g. who is retaining the extra sk ref.

>=20
>=20
> > Side note, I think at this point some tests could surface here? If
> > user-space-based self-tests are too cumbersome and/or do not offer
> > adequate coverage perhaps you could consider using kunit?
>=20
> I'm comfortable with Kunit, having just added a bunch of tests
> for the kernel's SunRPC GSS Kerberos implementation.
>=20
> There, however, I had clearly defined test cases to add, thanks
> to the RFCs. I guess I'm a little unclear on what specific tests
> would be necessary or valuable here. Suggestions and existing
> examples are very welcome.

I *think* that a good start would be exercising the expected code
paths:

handshake_req_alloc, handshake_req_submit, handshake_complete
handshake_req_alloc, handshake_req_submit, handshake_cancel
or even
tls_*_hello_*, tls_handshake_accept, tls_handshake_done
tls_*_hello_*, tls_handshake_accept, tls_handshake_cancel

plus explicitly triggering some errors path e.g.=C2=A0

hn_pending_max+1 consecutive submit with no accept
handshake_cancel after handshake_complete
multiple handshake_complete on the same req
multiple handshake_cancel on the same req

Cheers,

Paolo


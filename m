Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD818C04
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 11:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679398081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qUe3QY7sz1eCkEPrAWkh9A/T04jxGjwU9CrCjHrs4Vc=;
	b=OLft9uY42Q33q1zOezpevuFjL73Sf5nDEcJK1NYry/U+CZ1TopsuH8B8VlomQkcRjBADLj
	MwOca1TuRWA4DLZ6bR08NrIn5uY+AniUPpARXiOupLSxbKADGJrszvjD2OVyY4J1Zpfd6v
	iYM0K1JgVjuHOPMh33zofrNfK4e5Qzk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-3_nXQJLNPEaefPZM1ag8uw-1; Tue, 21 Mar 2023 07:27:59 -0400
X-MC-Unique: 3_nXQJLNPEaefPZM1ag8uw-1
Received: by mail-qk1-f198.google.com with SMTP id oo24-20020a05620a531800b00745d671f9afso6765661qkn.12
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 04:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679398079; x=1681990079;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+B4rMqiSRrSDakxwNYnZA7cpTxZeGPnc7W9SoaJsONg=;
        b=aTR6hO6renIx72r9abUFqnxMDJ5XlRxKKl7/OHPTI6yN5YOxNJKJe/MpLXyqcH3i5T
         rEuizAQATVR/PutbZwLoio2jgiC38SYpPiw3XH3hI6RCVTjGIjsoYPUwrZ0mRRCzdkEc
         rSybS7dmUF4Gs8VOTZBXbUSlnCKvmDvOw8Sx9jCnGve6Tq9TH9DR5l6cP5cC+FvjiJwR
         5TdchhtzoYcqWkgs4DG7uAMXeNJJ6OmdIh05ZVOr9NBEm2UBCWIPsnppMeMCwbulZbpC
         LIpPLwQLkHxb948fn7+SxeePXwzERfTU72T75Q6eds77B6QPBReRIbRNT6txMZ3YjQ7k
         CDVw==
X-Gm-Message-State: AO0yUKW3gK0RMCsKkiyqXWb/+EC+oAM/nBHTj6bDhNdHUR4vW9wyqvRl
	uFag+vFFHZ8o5du1vBEE1w/T96PWJ7BmS2gA8TccaZoFykp7xxoG7vU70frGVbTSMiMiWTI7get
	oJTuFaBWj40/6KjYU4L1RLi1yzLYVAxVZaf0=
X-Received: by 2002:ac8:5a8a:0:b0:3d9:56ce:a8cd with SMTP id c10-20020ac85a8a000000b003d956cea8cdmr3872069qtc.6.1679398078724;
        Tue, 21 Mar 2023 04:27:58 -0700 (PDT)
X-Google-Smtp-Source: AK7set/qs44tf9EmPAUX6k4hyFZGMAHX3228WcE9qb8ip9x81q0WUSqW89xNIieWZL36v22I69+lvQ==
X-Received: by 2002:ac8:5a8a:0:b0:3d9:56ce:a8cd with SMTP id c10-20020ac85a8a000000b003d956cea8cdmr3872042qtc.6.1679398078330;
        Tue, 21 Mar 2023 04:27:58 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-244-19.dyn.eolo.it. [146.241.244.19])
        by smtp.gmail.com with ESMTPSA id b17-20020ac86791000000b003b9bb59543fsm7868795qtp.61.2023.03.21.04.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 04:27:57 -0700 (PDT)
Message-ID: <3dc6b9290984bc07ae5ac9c5a9fba01742b64f84.camel@redhat.com>
Subject: Re: [PATCH v7 1/2] net/handshake: Create a NETLINK service for
 handling handshake requests
From: Paolo Abeni <pabeni@redhat.com>
To: Chuck Lever <cel@kernel.org>, kuba@kernel.org, edumazet@google.com
Cc: netdev@vger.kernel.org, kernel-tls-handshake@lists.linux.dev, 
	john.haxby@oracle.com
Date: Tue, 21 Mar 2023 12:27:54 +0100
In-Reply-To: <167915629953.91792.17220269709156129944.stgit@manet.1015granger.net>
References: <167915594811.91792.15722842400657376706.stgit@manet.1015granger.net>
	 <167915629953.91792.17220269709156129944.stgit@manet.1015granger.net>
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

On Sat, 2023-03-18 at 12:18 -0400, Chuck Lever wrote:
> +/**
> + * handshake_req_alloc - consumer API to allocate a request
> + * @sock: open socket on which to perform a handshake
> + * @proto: security protocol
> + * @flags: memory allocation flags
> + *
> + * Returns an initialized handshake_req or NULL.
> + */
> +struct handshake_req *handshake_req_alloc(struct socket *sock,
> +=09=09=09=09=09  const struct handshake_proto *proto,
> +=09=09=09=09=09  gfp_t flags)
> +{
> +=09struct sock *sk =3D sock->sk;
> +=09struct net *net =3D sock_net(sk);
> +=09struct handshake_net *hn =3D handshake_pernet(net);
> +=09struct handshake_req *req;
> +
> +=09if (!hn)
> +=09=09return NULL;
> +
> +=09req =3D kzalloc(struct_size(req, hr_priv, proto->hp_privsize), flags)=
;
> +=09if (!req)
> +=09=09return NULL;
> +
> +=09sock_hold(sk);

The hr_sk reference counting is unclear to me. It looks like
handshake_req retain a reference to such socket, but
handshake_req_destroy()/handshake_sk_destruct() do not release it.

Perhaps is better moving such sock_hold() into handshake_req_submit(),
once that the request is successful?

> +
> +=09INIT_LIST_HEAD(&req->hr_list);
> +=09req->hr_sk =3D sk;
> +=09req->hr_proto =3D proto;
> +=09return req;
> +}
> +EXPORT_SYMBOL(handshake_req_alloc);
> +
> +/**
> + * handshake_req_private - consumer API to return per-handshake private =
data
> + * @req: handshake arguments
> + *
> + */
> +void *handshake_req_private(struct handshake_req *req)
> +{
> +=09return (void *)&req->hr_priv;
> +}
> +EXPORT_SYMBOL(handshake_req_private);
> +
> +static bool __add_pending_locked(struct handshake_net *hn,
> +=09=09=09=09 struct handshake_req *req)
> +{
> +=09if (!list_empty(&req->hr_list))
> +=09=09return false;
> +=09hn->hn_pending++;
> +=09list_add_tail(&req->hr_list, &hn->hn_requests);
> +=09return true;
> +}
> +
> +void __remove_pending_locked(struct handshake_net *hn,
> +=09=09=09     struct handshake_req *req)
> +{
> +=09hn->hn_pending--;
> +=09list_del_init(&req->hr_list);
> +}
> +
> +/*
> + * Returns %true if the request was found on @net's pending list,
> + * otherwise %false.
> + *
> + * If @req was on a pending list, it has not yet been accepted.
> + */
> +static bool remove_pending(struct handshake_net *hn, struct handshake_re=
q *req)
> +{
> +=09bool ret;
> +
> +=09ret =3D false;

Nit: merge the initialization and the declaration

> +
> +=09spin_lock(&hn->hn_lock);
> +=09if (!list_empty(&req->hr_list)) {
> +=09=09__remove_pending_locked(hn, req);
> +=09=09ret =3D true;
> +=09}
> +=09spin_unlock(&hn->hn_lock);
> +
> +=09return ret;
> +}
> +
> +/**
> + * handshake_req_submit - consumer API to submit a handshake request
> + * @req: handshake arguments
> + * @flags: memory allocation flags
> + *
> + * Return values:
> + *   %0: Request queued
> + *   %-EBUSY: A handshake is already under way for this socket
> + *   %-ESRCH: No handshake agent is available
> + *   %-EAGAIN: Too many pending handshake requests
> + *   %-ENOMEM: Failed to allocate memory
> + *   %-EMSGSIZE: Failed to construct notification message
> + *   %-EOPNOTSUPP: Handshake module not initialized
> + *
> + * A zero return value from handshake_request() means that
> + * exactly one subsequent completion callback is guaranteed.
> + *
> + * A negative return value from handshake_request() means that
> + * no completion callback will be done and that @req has been
> + * destroyed.
> + */
> +int handshake_req_submit(struct handshake_req *req, gfp_t flags)
> +{
> +=09struct sock *sk =3D req->hr_sk;
> +=09struct net *net =3D sock_net(sk);
> +=09struct handshake_net *hn =3D handshake_pernet(net);
> +=09int ret;

Nit: reverse xmas tree. In this case you have to split declaration and
initialization ;)

> +
> +=09if (!hn)
> +=09=09return -EOPNOTSUPP;
> +
> +=09ret =3D -EAGAIN;
> +=09if (READ_ONCE(hn->hn_pending) >=3D hn->hn_pending_max)
> +=09=09goto out_err;
> +
> +=09req->hr_odestruct =3D sk->sk_destruct;
> +=09sk->sk_destruct =3D handshake_sk_destruct;
> +=09spin_lock(&hn->hn_lock);
> +=09ret =3D -EOPNOTSUPP;
> +=09if (test_bit(HANDSHAKE_F_NET_DRAINING, &hn->hn_flags))
> +=09=09goto out_unlock;
> +=09ret =3D -EBUSY;
> +=09if (!handshake_req_hash_add(req))
> +=09=09goto out_unlock;
> +=09if (!__add_pending_locked(hn, req))
> +=09=09goto out_unlock;
> +=09spin_unlock(&hn->hn_lock);
> +
> +=09ret =3D handshake_genl_notify(net, req->hr_proto->hp_handler_class,
> +=09=09=09=09    flags);
> +=09if (ret) {
> +=09=09trace_handshake_notify_err(net, req, sk, ret);
> +=09=09if (remove_pending(hn, req))
> +=09=09=09goto out_err;
> +=09}
> +
> +=09trace_handshake_submit(net, req, sk);
> +=09return 0;
> +
> +out_unlock:
> +=09spin_unlock(&hn->hn_lock);
> +out_err:
> +=09trace_handshake_submit_err(net, req, sk, ret);
> +=09handshake_req_destroy(req);
> +=09return ret;
> +}
> +EXPORT_SYMBOL(handshake_req_submit);
> +
> +void handshake_complete(struct handshake_req *req, unsigned int status,
> +=09=09=09struct genl_info *info)
> +{
> +=09struct sock *sk =3D req->hr_sk;
> +=09struct net *net =3D sock_net(sk);
> +
> +=09if (!test_and_set_bit(HANDSHAKE_F_REQ_COMPLETED, &req->hr_flags)) {
> +=09=09trace_handshake_complete(net, req, sk, status);
> +=09=09req->hr_proto->hp_done(req, status, info);
> +=09=09__sock_put(sk);

Is unclear to me who acquired the reference released above?!? If that
is the reference acquire by handshake_req_alloc(), I think it's cleaner
moving the sock_put() in handshake_req_destroy() or
handshake_req_destroy()

> +=09}
> +}
> +
> +/**
> + * handshake_req_cancel - consumer API to cancel an in-progress handshak=
e
> + * @sock: socket on which there is an ongoing handshake
> + *
> + * XXX: Perhaps killing the user space agent might also be necessary?
> + *
> + * Request cancellation races with request completion. To determine
> + * who won, callers examine the return value from this function.
> + *
> + * Return values:
> + *   %true - Uncompleted handshake request was canceled or not found
> + *   %false - Handshake request already completed
> + */
> +bool handshake_req_cancel(struct socket *sock)
> +{
> +=09struct handshake_req *req;
> +=09struct handshake_net *hn;
> +=09struct sock *sk;
> +=09struct net *net;
> +
> +=09sk =3D sock->sk;
> +=09net =3D sock_net(sk);
> +=09req =3D handshake_req_hash_lookup(sk);
> +=09if (!req) {
> +=09=09trace_handshake_cancel_none(net, req, sk);
> +=09=09return true;
> +=09}
> +
> +=09hn =3D handshake_pernet(net);
> +=09if (hn && remove_pending(hn, req)) {
> +=09=09/* Request hadn't been accepted */
> +=09=09trace_handshake_cancel(net, req, sk);
> +=09=09return true;
> +=09}
> +=09if (test_and_set_bit(HANDSHAKE_F_REQ_COMPLETED, &req->hr_flags)) {
> +=09=09/* Request already completed */
> +=09=09trace_handshake_cancel_busy(net, req, sk);
> +=09=09return false;
> +=09}
> +
> +=09__sock_put(sk);

Same here.

Side note, I think at this point some tests could surface here? If
user-space-based self-tests are too cumbersome and/or do not offer
adequate coverage perhaps you could consider using kunit?

Cheers,

Paolo


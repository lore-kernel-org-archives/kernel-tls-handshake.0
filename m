Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1273AD30
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 18:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680027305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Krl4qQ0eWNe3qf7O6tLgKKkRaINe43O++y9YmtPOtg=;
	b=GsxL/cjDOceNlThIs9oHRrySEk19w9EbnWgzWYtMW+CJoj8vgBaqVR9fWFQNE5fmlv/D03
	UIlLCtqososEX2I+gVcA8LnlPaiJ9s6mPHD8S5IbiCOxr0xlr+bxDY402DFjcmw2pcTqj+
	OSg03YPRHflIU42tlMBh37sFOGTxvOw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-tnXJI9xrPDWijpPkSGG1-w-1; Tue, 28 Mar 2023 14:15:02 -0400
X-MC-Unique: tnXJI9xrPDWijpPkSGG1-w-1
Received: by mail-qt1-f197.google.com with SMTP id l2-20020ac87242000000b003bfecc6d046so8728499qtp.17
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 11:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680027301;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B1a4zDEm255hUUkHx34kF1cE8zmhdi4LYKOYzj4waOc=;
        b=C8XLqYrPqfHbAD0GaBo//1ELp0FjZr+3bnCcalLizpC5wKsV3VdIT8hK8jAdW2TPqF
         ng2aIoYtFSMhhGEcPWNFVWO4hPtVOiRh24TAAo9g3aclm2i73nZf4FE73yfPhyo3XfUp
         ssI+ZKNfMq5U7ceaCJ7D9XG0iiegXVwW1AkvLcuuPfnLKmB2nE9wvnHwHfVQ1qjfy2MM
         rpiW7UtBT9n3mOqwaufrisf6uyk1nVcW5Bkmb2VqT1cn3Yt6/tHHdBJxIsvN/66R3Wir
         J9Ao8j22WJNluGbZeUnP1v7NMx3siiOMYmZDkmJyw9wTRdUmu3Mr3/AWOVyBU2elx70c
         8JRA==
X-Gm-Message-State: AAQBX9fNxXErISbU65JHVK27CdN39BwJ2oC4AODYznQ9D9iI2env+iti
	BMN2JeokeBbGzqt0I+YPOncFAEIuKw4ndYdbF5YnHJWbzSxAFg8c+Aw4ab9dmbqRZc67OfoUHdI
	bhk6UQ3Qy0JUET7hkcNP3FS+o43m/kaKHX/A=
X-Received: by 2002:a05:622a:311:b0:3e4:eb8f:8a7b with SMTP id q17-20020a05622a031100b003e4eb8f8a7bmr9528406qtw.29.1680027301650;
        Tue, 28 Mar 2023 11:15:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350aTfW+UvczbaVczSvCGmR8Iw2qUyTJJ8632ZqTYt+ngsALZZGyfxxo94Ck9ik+1flz68u7T5A==
X-Received: by 2002:a05:622a:311:b0:3e4:eb8f:8a7b with SMTP id q17-20020a05622a031100b003e4eb8f8a7bmr9528368qtw.29.1680027301277;
        Tue, 28 Mar 2023 11:15:01 -0700 (PDT)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net. [68.20.15.154])
        by smtp.gmail.com with ESMTPSA id bn5-20020a05620a2ac500b00748448d9a7dsm3990150qkb.106.2023.03.28.11.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 11:15:00 -0700 (PDT)
Message-ID: <3e4e33c19a9c608be863d2d7207f5a9cb7db795f.camel@redhat.com>
Subject: Re: [PATCH v7 1/2] net/handshake: Create a NETLINK service for
 handling handshake requests
From: Jeff Layton <jlayton@redhat.com>
To: Chuck Lever <cel@kernel.org>, kuba@kernel.org, pabeni@redhat.com, 
	edumazet@google.com
Cc: netdev@vger.kernel.org, kernel-tls-handshake@lists.linux.dev, 
	john.haxby@oracle.com
Date: Tue, 28 Mar 2023 14:14:59 -0400
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
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Sat, 2023-03-18 at 12:18 -0400, Chuck Lever wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
>=20
> When a kernel consumer needs a transport layer security session, it
> first needs a handshake to negotiate and establish a session. This
> negotiation can be done in user space via one of the several
> existing library implementations, or it can be done in the kernel.
>=20
> No in-kernel handshake implementations yet exist. In their absence,
> we add a netlink service that can:
>=20
> a. Notify a user space daemon that a handshake is needed.
>=20
> b. Once notified, the daemon calls the kernel back via this
>    netlink service to get the handshake parameters, including an
>    open socket on which to establish the session.
>=20
> c. Once the handshake is complete, the daemon reports the
>    session status and other information via a second netlink
>    operation. This operation marks that it is safe for the
>    kernel to use the open socket and the security session
>    established there.
>=20
> The notification service uses a multicast group. Each handshake
> mechanism (eg, tlshd) adopts its own group number so that the
> handshake services are completely independent of one another. The
> kernel can then tell via netlink_has_listeners() whether a handshake
> service is active and prepared to handle a handshake request.
>=20
> A new netlink operation, ACCEPT, acts like accept(2) in that it
> instantiates a file descriptor in the user space daemon's fd table.
> If this operation is successful, the reply carries the fd number,
> which can be treated as an open and ready file descriptor.
>=20
> While user space is performing the handshake, the kernel keeps its
> muddy paws off the open socket. A second new netlink operation,
> DONE, indicates that the user space daemon is finished with the
> socket and it is safe for the kernel to use again. The operation
> also indicates whether a session was established successfully.
>=20
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> ---
>  Documentation/netlink/specs/handshake.yaml |  122 +++++++++++
>  MAINTAINERS                                |    8 +
>  include/trace/events/handshake.h           |  159 ++++++++++++++
>  include/uapi/linux/handshake.h             |   70 ++++++
>  net/Kconfig                                |    5=20
>  net/Makefile                               |    1=20
>  net/handshake/Makefile                     |   11 +
>  net/handshake/genl.c                       |   57 +++++
>  net/handshake/genl.h                       |   23 ++
>  net/handshake/handshake.h                  |   82 +++++++
>  net/handshake/netlink.c                    |  316 ++++++++++++++++++++++=
++++++
>  net/handshake/request.c                    |  307 ++++++++++++++++++++++=
+++++
>  net/handshake/trace.c                      |   20 ++
>  13 files changed, 1181 insertions(+)
>  create mode 100644 Documentation/netlink/specs/handshake.yaml
>  create mode 100644 include/trace/events/handshake.h
>  create mode 100644 include/uapi/linux/handshake.h
>  create mode 100644 net/handshake/Makefile
>  create mode 100644 net/handshake/genl.c
>  create mode 100644 net/handshake/genl.h
>  create mode 100644 net/handshake/handshake.h
>  create mode 100644 net/handshake/netlink.c
>  create mode 100644 net/handshake/request.c
>  create mode 100644 net/handshake/trace.c
>=20
>=20

[...]

> diff --git a/net/handshake/request.c b/net/handshake/request.c
> new file mode 100644
> index 000000000000..3f8ae9e990d2
> --- /dev/null
> +++ b/net/handshake/request.c
> @@ -0,0 +1,307 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Handshake request lifetime events
> + *
> + * Author: Chuck Lever <chuck.lever@oracle.com>
> + *
> + * Copyright (c) 2023, Oracle and/or its affiliates.
> + */
> +
> +#include <linux/types.h>
> +#include <linux/socket.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/skbuff.h>
> +#include <linux/inet.h>
> +#include <linux/fdtable.h>
> +#include <linux/rhashtable.h>
> +
> +#include <net/sock.h>
> +#include <net/genetlink.h>
> +#include <net/netns/generic.h>
> +
> +#include <uapi/linux/handshake.h>
> +#include "handshake.h"
> +
> +#include <trace/events/handshake.h>
> +
> +/*
> + * We need both a handshake_req -> sock mapping, and a sock ->
> + * handshake_req mapping. Both are one-to-one.
> + *
> + * To avoid adding another pointer field to struct sock, net/handshake
> + * maintains a hash table, indexed by the memory address of @sock, to
> + * find the struct handshake_req outstanding for that socket. The
> + * reverse direction uses a simple pointer field in the handshake_req
> + * struct.
> + */
> +
> +static struct rhashtable handshake_rhashtbl ____cacheline_aligned_in_smp=
;
> +
> +static const struct rhashtable_params handshake_rhash_params =3D {
> +=09.key_len=09=09=3D sizeof_field(struct handshake_req, hr_sk),
> +=09.key_offset=09=09=3D offsetof(struct handshake_req, hr_sk),
> +=09.head_offset=09=09=3D offsetof(struct handshake_req, hr_rhash),
> +=09.automatic_shrinking=09=3D true,
> +};
> +
> +int handshake_req_hash_init(void)
> +{
> +=09return rhashtable_init(&handshake_rhashtbl, &handshake_rhash_params);
> +}
> +
> +void handshake_req_hash_destroy(void)
> +{
> +=09rhashtable_destroy(&handshake_rhashtbl);
> +}
> +
> +struct handshake_req *handshake_req_hash_lookup(struct sock *sk)
> +{
> +=09return rhashtable_lookup_fast(&handshake_rhashtbl, &sk,

Is this correct? It seems like we should be searching for the struct
sock pointer value, not on the pointer to the pointer (which will be a
stack var), right?

> +=09=09=09=09      handshake_rhash_params);
> +}
> +
> +static noinline bool handshake_req_hash_add(struct handshake_req *req)
> +{
> +=09int ret;
> +
> +=09ret =3D rhashtable_lookup_insert_fast(&handshake_rhashtbl,
> +=09=09=09=09=09    &req->hr_rhash,
> +=09=09=09=09=09    handshake_rhash_params);
> +=09return ret =3D=3D 0;
> +}
> +
> +static noinline void handshake_req_destroy(struct handshake_req *req)
> +{
> +=09if (req->hr_proto->hp_destroy)
> +=09=09req->hr_proto->hp_destroy(req);
> +=09rhashtable_remove_fast(&handshake_rhashtbl, &req->hr_rhash,
> +=09=09=09       handshake_rhash_params);
> +=09kfree(req);
> +}
> +
> +static void handshake_sk_destruct(struct sock *sk)
> +{
> +=09void (*sk_destruct)(struct sock *sk);
> +=09struct handshake_req *req;
> +
> +=09req =3D handshake_req_hash_lookup(sk);
> +=09if (!req)
> +=09=09return;
> +
> +=09trace_handshake_destruct(sock_net(sk), req, sk);
> +=09sk_destruct =3D req->hr_odestruct;
> +=09handshake_req_destroy(req);
> +=09if (sk_destruct)
> +=09=09sk_destruct(sk);
> +}
> +
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
> +=09trace_handshake_cancel(net, req, sk);
> +=09return true;
> +}
> +EXPORT_SYMBOL(handshake_req_cancel);
> diff --git a/net/handshake/trace.c b/net/handshake/trace.c
> new file mode 100644
> index 000000000000..1c4d8e27e17a
> --- /dev/null
> +++ b/net/handshake/trace.c
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Trace points for transport security layer handshakes.
> + *
> + * Author: Chuck Lever <chuck.lever@oracle.com>
> + *
> + * Copyright (c) 2023, Oracle and/or its affiliates.
> + */
> +
> +#include <linux/types.h>
> +
> +#include <net/sock.h>
> +#include <net/netlink.h>
> +#include <net/genetlink.h>
> +
> +#include "handshake.h"
> +
> +#define CREATE_TRACE_POINTS
> +
> +#include <trace/events/handshake.h>
>=20
>=20
>=20

--=20
Jeff Layton <jlayton@redhat.com>


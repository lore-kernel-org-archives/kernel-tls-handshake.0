Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DA331AAA3
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Jan 2026 15:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923287; cv=pass; b=XGb7FQHdRbV+TbXlPJ8xnyaMPTb/QnbK65NpPirdAQLl+To8rZlVenlUN8UzPF2hr4CON0C1SIe/PvcE2HUoenRBVX8WGsY4crZObqMYPlc/UNAQp/wHSLl+DMjbalop//76KtXVBcc2GT27Gpc/z5XEmGhgB29KekFWN9LDKZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923287; c=relaxed/simple;
	bh=1yN6HAEO40QcoyUmpcQZqYl18nEWpx0GzR2VbJpP/3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqVGBovO5cQ9Y+WUWISA4EFCYd6AXmFGDr1EaUq1c4R/lGNS7Y9N47eSoS9yhX1swiI9F8szd/Pu3ALYOXlRg30YFD/Qim6tpTZRqzcP87L7qY7UCpsFFuhClUOTd8ICvQPX/JSeCFKNDlBBFdSeNQRXuy9qu2eAXWEw0qH4xqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdW5UVya; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdW5UVya"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81f47610542so3126858b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Jan 2026 07:34:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768923284; cv=none;
        d=google.com; s=arc-20240605;
        b=JlsqmnP5T/leMJVqAlEviweuTlCv7A3q22FY3aTJvdbNHr89yPTgb8Mb8pttTvB6Fg
         Npp2ritXa6nDHBULKzvLLd0qivvId53OgiWJ5RL/0SpkbKdgE0mtomi0WVN4ugHtO4DK
         evKSppUdVvbCRXDQzPtiuaVIGeRNu8aMyR5GJkwfNI2DvRM58Xxww2/mfDf9KjHFsFzE
         GnS98X/5QRJ2fzl4N1fNwfI+NmR+HfPPa17Du5JRtznnz/jnRNdMedfLEnPXKpkWtEYY
         A/3dW5jKXCwJqUv6kLosCEy3EBqyz24XGDJOqWl1UThuIlZd6NzcwOlKXvlmREsT0hVN
         mJBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T2NmNela4GRw6AQkwyD5Rk7RKIpCKu04jdsKYK8kc2M=;
        fh=s81bG4+NiJbYuqMKtg6ZhHcYbJZkcy/Wekk7/EM3v7g=;
        b=dsiuxcqwlZbP9c2XVsR4DoH8HJhP4SV9+n5R6atPJCj+L5Pzfro82TnzY2YY7WIDjK
         XBHnI46sbfdSgiFEWtxIOVE+esEavFAtiDs4+3Fc3XiJnigWtfPAMGfSeOCzWctUw4f/
         0HCz9iqRLk6/a8nI+PkbDzLV28I1aTWkBuB3BayCgVuuQnM+Kup4XVqQJV8YbHFyLCpA
         EJyw0K9r8tc6TnVKFyWSG+Z1wrW8lMsXdj6+MCWKuxhxxvDMsgxNDete6pcKC9N50Bv3
         hUneZe5MtYFfKPUdt6x9VIYL6F2Ydja2HMYJVWZJwP0nL8maxf+k4GxMJ4EoM/xn4H6W
         T3Bg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768923284; x=1769528084; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2NmNela4GRw6AQkwyD5Rk7RKIpCKu04jdsKYK8kc2M=;
        b=DdW5UVyaQ9de/heiBj4o5PD+vI0/c8pZujLfd/pq617bqPBxVliuiqMblk2wvpjibv
         beR0MEnTPD5sF7ByKBn+Kv6oZuQgBGqSe6QM8Ffiy4k0TvIy6Vcvllvem1zfM2l271KG
         H/Kl34t2fkFyvgzdrFYwslZUjRaGU7CUn7oYftFnVCcNfi8aWQ0KayQBqnPhlqD3mAk1
         KLmFukQMDsNSbd6N5U4/o2LzVlgv/h+bGT0J/F9ca9buwlHm3xdZeLS38fhcFg5Ft//F
         gnl/n741LQJ+38QCtw0NMx4Vd/mTrVjQYFyGtv7bxsi+yf2buZ2m/D+tiQqGzktFG0u3
         B/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768923284; x=1769528084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T2NmNela4GRw6AQkwyD5Rk7RKIpCKu04jdsKYK8kc2M=;
        b=q9YajE9NMidteBsnUh4rw19RF9exrLpnsn5xYklmigswDj/3HKTTj94b1ra2knVmbI
         NLyCApECVIBugNY1s3KzTGdZNAUn9AIq1zEq9b3b3s0x732EgubMqesfpBwHbInyeZ+N
         KPyJMPBUXo2nZepF6U0S1loBaGiEe8sdOEFBek1FgxZxSbIAmZzzSHfjPNMsPL3DNvrh
         OxhtA/uYHYVKW0atubjN/rrCTIVbaSwI0bJQYp03X6kLXwXrSArImNMok0jyOao3fyJA
         0ves2STw82w56Czjia0HDZO70A7Pr3OyW8R/AFmHP125iY/WXy4waZ1WQDbaxsGeTJSS
         g5rw==
X-Forwarded-Encrypted: i=1; AJvYcCW2X7aCllhUpabnbbD9GknkZEoSOaAzGYJkKKZSXvmw7ZR5ABnWcHl9crysI3XMREsXiGBnAZqAK+1u9D72YCBMmSAxEA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAHj1e9X3R4Al++TVIGV4TFtFiHiymBrxVfXkKgLCDYVe1nU8E
	ohXjwKcJtQdJIzsLvKl81WC4yXGlKhxAcnrcZ2xVqlz5psoR5uAQBWP2HpSP6D78zDqgWlD2vAS
	fymOQlsqqE3u8+qy5imY20EPnCStijY4=
X-Gm-Gg: AZuq6aIu7D10umdyaEPYIZLtTXXHh1jDNKHWKYFDaxE2XGWHxdjLxoVzXMYjlK91QtL
	btS5nzf8GtNLJ4beHJl8oD4GljvOUFf2wbJ9Kf+t/h5ou9/wP18VAXc4L2NhXvB3R6h3MSMYztZ
	jYYAjd7/X5T1MWVtf6JrKu20cplKP2KXGJZyIMh5VrVPYiJYF85CeAeGM9lCCmD0v1SQS06GaZV
	KS6+Na4GBPEMw9lHZG0LWEQ/TrPuJF47FY9FgsKuOwIw1e9izd7EUkHB5llQxYRP1VZmyurtWnt
	lZ5tV4gJv19qHXmkwK/nFz3adkA4
X-Received: by 2002:a05:6a00:138d:b0:81f:9907:e503 with SMTP id
 d2e1a72fcca58-81f9f6ab90emr15585317b3a.16.1768923284205; Tue, 20 Jan 2026
 07:34:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1768489876.git.lucien.xin@gmail.com> <3771dfc211626a9f0c603c90113e38f325ceb456.1768489876.git.lucien.xin@gmail.com>
 <71705484-46fc-469f-9357-07a076ee0e73@redhat.com>
In-Reply-To: <71705484-46fc-469f-9357-07a076ee0e73@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 20 Jan 2026 10:34:32 -0500
X-Gm-Features: AZwV_Qh1cQDFjcFB0vVqm1_VmBk3f4OEQi8_hpHzwrIYtAE_UmESsrIJnbspVXo
Message-ID: <CADvbK_dYbMa-nVi_8M-XS1QcVUw25t4CZdvcq_HcACx38bH86g@mail.gmail.com>
Subject: Re: [PATCH net-next v7 08/16] quic: add path management
To: Paolo Abeni <pabeni@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, Alexander Aring <aahringo@redhat.com>, 
	David Howells <dhowells@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, 
	John Ericson <mail@johnericson.me>, Cong Wang <xiyou.wangcong@gmail.com>, 
	"D . Wythe" <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>, 
	illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 9:13=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 1/15/26 4:11 PM, Xin Long wrote:
> > @@ -0,0 +1,524 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/* QUIC kernel implementation
> > + * (C) Copyright Red Hat Corp. 2023
> > + *
> > + * This file is part of the QUIC kernel implementation
> > + *
> > + * Initialization/cleanup for QUIC protocol support.
> > + *
> > + * Written or modified by:
> > + *    Xin Long <lucien.xin@gmail.com>
> > + */
> > +
> > +#include <net/udp_tunnel.h>
> > +#include <linux/quic.h>
> > +
> > +#include "common.h"
> > +#include "family.h"
> > +#include "path.h"
> > +
> > +static int (*quic_path_rcv)(struct sock *sk, struct sk_buff *skb, u8 e=
rr);
>
> It's unclear why an indirect call is needed here. At least some
> explanation is needed in the commit message, possibly you could call
> directly a static function.
>
This patchset makes the path subcomponent more independent from the core
implementation. Aside from a few shared helper functions, it doesn't
rely on code outside the subcomponent, in particular socket.c and
packet.c.

Other subcomponents, such as stream, connid, pnspace, cong,
crypto, common, and family follow the same approach. They expose
APIs to the core QUIC logic and don=E2=80=99t see the main process.

Will leave an explanation here.

> > +
> > +static int quic_udp_rcv(struct sock *sk, struct sk_buff *skb)
> > +{
> > +     memset(skb->cb, 0, sizeof(skb->cb));
> > +     QUIC_SKB_CB(skb)->seqno =3D -1;
> > +     QUIC_SKB_CB(skb)->time =3D quic_ktime_get_us();
> > +
> > +     skb_pull(skb, sizeof(struct udphdr));
> > +     skb_dst_force(skb);
> > +     quic_path_rcv(sk, skb, 0);
> > +     return 0;
>
> Why not:
>         return quic_path_rcv(sk, skb, 0);
> ?
I checked the udp tunnel users:

- bareudp: bareudp_udp_encap_recv()
- vxlan: vxlan_rcv()
- geneve: geneve_udp_encap_recv()
- tipc: tipc_udp_recv()
- sctp: sctp_udp_rcv()

they all are returning 0 in .encap_udp(), I think because they all
take care of the
skb freeing in their err path already.

is it safe to return error to UDP stack if the skb is already freed?
Do you know?

>
> > +static struct quic_udp_sock *quic_udp_sock_create(struct sock *sk, uni=
on quic_addr *a)
> > +{
> > +     struct udp_tunnel_sock_cfg tuncfg =3D {};
> > +     struct udp_port_cfg udp_conf =3D {};
> > +     struct net *net =3D sock_net(sk);
> > +     struct quic_uhash_head *head;
> > +     struct quic_udp_sock *us;
> > +     struct socket *sock;
> > +
> > +     us =3D kzalloc(sizeof(*us), GFP_KERNEL);
> > +     if (!us)
> > +             return NULL;
> > +
> > +     quic_udp_conf_init(sk, &udp_conf, a);
> > +     if (udp_sock_create(net, &udp_conf, &sock)) {
> > +             pr_debug("%s: failed to create udp sock\n", __func__);
> > +             kfree(us);
> > +             return NULL;
> > +     }
> > +
> > +     tuncfg.encap_type =3D 1;
> > +     tuncfg.encap_rcv =3D quic_udp_rcv;
> > +     tuncfg.encap_err_lookup =3D quic_udp_err;
> > +     setup_udp_tunnel_sock(net, sock, &tuncfg);
> > +
> > +     refcount_set(&us->refcnt, 1);
> > +     us->sk =3D sock->sk;
> > +     memcpy(&us->addr, a, sizeof(*a));
> > +     us->bind_ifindex =3D sk->sk_bound_dev_if;
> > +
> > +     head =3D quic_udp_sock_head(net, ntohs(a->v4.sin_port));
> > +     hlist_add_head(&us->node, &head->head);
> > +     INIT_WORK(&us->work, quic_udp_sock_put_work);
> > +
> > +     return us;
> > +}
> > +
> > +static bool quic_udp_sock_get(struct quic_udp_sock *us)
> > +{
> > +     return refcount_inc_not_zero(&us->refcnt);
> > +}
> > +
> > +static void quic_udp_sock_put(struct quic_udp_sock *us)
> > +{
> > +     if (refcount_dec_and_test(&us->refcnt))
> > +             queue_work(quic_wq, &us->work);
>
> Why using a workqueue here? AFAICS all the caller are in process
> context. Is that to break a possible deadlock due to nested mutex?
> Likely a comment on the refcount/locking scheme would help.
>
quic_udp_sock_put() will also be called in the RX path via
quic_path_unbind() for the connection migration (after changing
to a new path.), which is in the patchset-2.

I will leave a comment for an explanation here.

Thanks.

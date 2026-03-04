Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55D638642C
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  4 Mar 2026 21:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772659563; cv=pass; b=HLEnYCwwLoY7NRhU1yqAIICH5BqsvxtKBj19gZWXil5Vxuvcr+Nrb4hSUXEMPhxpSHhBbdQxdHhgyEXQExKWP/eBjpqk1WMXH09E/E49CbJZdtIrhWHKDHPDav1M/9HYaJkSi2MTPIO9LHWfBpz/F6Art0cOi2yY6cD/DG1ak9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772659563; c=relaxed/simple;
	bh=KLXKEYtmB4SEqI4A4FSyQZAfj2jvvWR0iwdwG84js9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TwW77ltkVxle1YQk7V7aMYOVdm23toWiKdelZaGTQeYZMf7jesd+D0baHeNri+wPMwbdvhXnq9Pbfqa9a3cTtM6Qj8V7umXxidO+bsvBo7M+4LYqA6AYObmsHRS8zD0KqNrUoVdCHC9CFLJfc5ldQAH1LU5J1Oaavg4rH6xLTK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2RVyI73; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2RVyI73"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8296dabef74so1294764b3a.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 04 Mar 2026 13:26:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772659561; cv=none;
        d=google.com; s=arc-20240605;
        b=D9Uk2btpdxjv5SpfSRnZ3cX2jL4CJLenEu0Fa7OeYOaZA80oLqStCa0NDSUiz+43le
         5EUSL6GI56qUzJ376MAOHARVTvsCg7KQCsqHBPyM/Rgx+OJanIlyJczHc+/AM0lqigDE
         88MKHbDcb2x9wMu5/c1YGvy1UrseI7m87UrD7vnOdlWseLUmVzOZNB87Yj0fOwBWqwUH
         glp+R/ZrszBNAY+0FPzU53fav2tug/KhORSZTf/TS/RFDgjZC54TfF0b4SnuKdm8aktU
         YDndoKHqfEmY+8HkDjHOOsirzi6vcEiBo0kuUXWHEJnzacPRPa+hab9R31Z3XA45U7wb
         FKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yL8TME+Vn0JkBONxs9K32ojI9vGSbFL0WZFBDJPwgpg=;
        fh=qzM5Y2kuIToApms9m9d+40596hIMZc7xJW7dS4A67zE=;
        b=L/GmmSz9TbYo3+N4869/eyK6EiE4l7YtHH6j3IGL/KYX81837tmiI4VCoKKeR8xBKx
         aRdZjKC4riEJVuBfS/C9P6m5zkilP+8AaFnx9nazu36QMkA8BgGCLcJ0pEh50vWhp9na
         nw74ibKAUkDT1nZ0HnUGHG5ZWMiHX+kZwzpnq33fJtL2ryx1L9CIfYipWC6gYHh1qUrR
         bTlnBcpzfKT+CdrRDJEKpATz+2c1JthWAUWB9X7rR1YcW3/pF0tb9iyCiwMunXgz2yee
         67h+IakMMg5S8PBwdE2HH/vOmzLCEOKhBY1Oqi1LERLA/Y4qDTvZ1LdR1sHZgOxYThem
         rVkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772659561; x=1773264361; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yL8TME+Vn0JkBONxs9K32ojI9vGSbFL0WZFBDJPwgpg=;
        b=l2RVyI73urpkzDG+lsy+UrbXw4PVh1fMhOV4XYYD98huIo9Hemtnn9t8piGg02sqcs
         Nje/rGtSP/mSos+ureogMf0l0BdTjY2BUWNY/W46Bz3lIEeQrTdhJuAp46OKRelRwgqT
         qtZeXW92Bs5qvKZaBGvAP0QniueeJcuhsoFRRLpYyfKML3bzKk4HZhJkSGbmuvz6Pwfk
         hp0XFD+MY61kiwLFyzCJlH6WCP07TlFTFXY7YFGNAr3lFMVTx1UjkS+5LBSRk3u/FAfs
         Ex2/kSZpb+PG/uOj8vftVSHY/GJ2Ku2+3P61qpfPPph62Y4RRScgYlm/f9eCYnK1RRxW
         tC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772659561; x=1773264361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yL8TME+Vn0JkBONxs9K32ojI9vGSbFL0WZFBDJPwgpg=;
        b=b5F8+eJzHLO8K2PVRf870HTDUag7m2nTNGA9u/9S0PTuzgKRUBXtn4o3d2msRB8zK+
         XjfQZ4gdK+SuwXyIA+WhtLiMrm+GEwTwBPNWbbe1XHEGxI9+w2w1g/07XBYcUVVNVTPu
         2+SqAvD2WThu08J5ufMhLEfvZc8B05IZh+4R07SamPCpN0JVh8GE2uEjKqWPkzxYSKck
         Lq2TeaoPLU5JPwrgDbYu1V8fEqa1iIA8oZU0CkeQcHCgN4m+Bt/ESV9wH/XAE4rmnQyv
         LqMCVTUI1v0Hi4GZBYPEZhqGHQuEvW/XhG5yZj8eJq94kAxMuK9V2sGJRdU3QCTAauGE
         06JQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5oP6+zzu3RP0uRiFdXoVKR8fn1P7IhjP/GsHwhZ81/Ju5r5igkGdRsd2eoVoGz/iTQvPAJb6WU7poXPHhcjUGx7fehA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKEerpMRwRtM0+k2HsF8FNoODWIf7wB/MRFZsDwzulXWO23Gou
	/AczXKnHIJSg4cpNclRY5ElURGJkMkVacgAt+/5J0bcH9a7fN+b7Aw5FVGzBJi7sgfbwia51RZL
	boa5CshY3a1Sl6tEvUHgXvzLfdDYpMEc=
X-Gm-Gg: ATEYQzyXGOgFfXMpEsQ3/1FBdxPmi0KV2Igce3VuIm9ESz1UXpnMaaugHGks1hrWyj+
	SQ5GHlTHtrfwJqt626tVYPOcMR5Mh0GpgA9poc5eKYA+vgcL+5BJ9X8P0Bn9mvOuiAsPwiBwVGt
	kRUnlLofmiqrTT9Kx7RTr1FPp7vrw0JKGT/ijupj1dDh+/0DWgqoQQyZNOqhkMWPvVBidLl41IK
	jMjlr+6sJuxz2I5jqdGQTCx872I4eyQZxait4wlIdKZmPHe0woYPnOX+1QsZjRit+Ls8l0VZOQF
	WUtiOzQMTZ2KMI5gE4V4yVCP/UEUpQBAvWJuSjPo4UwMNAKbGCsRBRrxBxll4ZMYbP9hP8arU4w
	Bn6juhXCr/WVvsyc+Z5ZnWBHfKRU7uaTpye9pFkTc
X-Received: by 2002:a05:6a21:44c8:b0:38b:e9eb:b12c with SMTP id
 adf61e73a8af0-3982defa8fdmr3188341637.31.1772659561307; Wed, 04 Mar 2026
 13:26:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1771986861.git.lucien.xin@gmail.com> <4e03deebdc944d9c963b0732abe8ba631893d82e.1771986861.git.lucien.xin@gmail.com>
 <CAF6piC+W=QKU53vix1f8JxxFhRKCcMvXaX1NKBT3kcZLfCydEA@mail.gmail.com>
In-Reply-To: <CAF6piC+W=QKU53vix1f8JxxFhRKCcMvXaX1NKBT3kcZLfCydEA@mail.gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 4 Mar 2026 16:25:50 -0500
X-Gm-Features: AaiRm50sq6Q3ttOp0vRNqW0uaev0YqHa-ggFkCiWTmshlDbHcjOdnyr83v7j-LI
Message-ID: <CADvbK_f84jwQPRq-xztO9mN+m_NWXaf6Q+9Ao-YtDiGQfmudLw@mail.gmail.com>
Subject: Re: [PATCH net-next v10 08/15] quic: add path management
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
	Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	"Marc E . Fiuczynski" <marc@fiuczynski.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 3:23=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 2/25/26 3:34 AM, Xin Long wrote:
> > +/* Binds a QUIC path to a local port and sets up a UDP socket. */
> > +int quic_path_bind(struct sock *sk, struct quic_path_group *paths, u8 =
path)
> > +{
> > +     union quic_addr *a =3D quic_path_saddr(paths, path);
> > +     int rover, low, high, remaining;
> > +     struct net *net =3D sock_net(sk);
> > +     struct quic_uhash_head *head;
> > +     struct quic_udp_sock *us;
> > +     u16 port;
> > +
> > +     port =3D ntohs(a->v4.sin_port);
> > +     if (port) {
> > +             head =3D quic_udp_sock_head(net, port);
> > +             mutex_lock(&head->lock);
> > +             us =3D quic_udp_sock_lookup(sk, a, port);
> > +             if (us) {
>
> When the quick socket is already bound to a local port, reusing an
> existing udp tunnel sock is allowed, but when the quick socket is not
> bound, UDP tunnel sock reused is prevented. This looks confusing and not
> documented, please clarify the behavior and/or make it consistent.
>
Yes,

/* Reuse of an existing UDP tunnel socket is allowed,
* but if it is currently being freed asynchronously by the workqueue,
* it cannot be used now =E2=80=94 retry later.
*/

Let me know if it's still not clear.
>
> > +                     if (!quic_udp_sock_get(us)) { /* Releasing in wor=
kqueue; retry later. */
> > +                             mutex_unlock(&head->lock);
> > +                             return -EAGAIN;
>
> Why not -EADDRINUSE here?
Because in this case, the us is being released in workqueue, a retry
will likely succeed.

>
> > +                     }
> > +             } else {
> > +                     us =3D quic_udp_sock_create(sk, a);
> > +                     if (!us) {
> > +                             mutex_unlock(&head->lock);
> > +                             return -EINVAL;
>
> It's probably better to propagate an error code (PTR_ERR) from
> quic_udp_sock_create(), or use -ENOMEM
>
Changing to PTR_ERR looks better.

> [...]
> > @@ -332,6 +333,12 @@ static __init int quic_init(void)
> >       if (err)
> >               goto err_hash;
> >
> > +     quic_wq =3D create_workqueue("quic_workqueue");
> > +     if (!quic_wq) {
> > +             err =3D -ENOMEM;
> > +             goto err_wq;
> > +     }
>
> AI review noted that:
>
> This isn't a bug, but create_workqueue() is a legacy API marked with
> __WQ_LEGACY in include/linux/workqueue.h. Should new subsystem code use
> alloc_workqueue() with explicit flags instead?
>
> Looking at include/linux/workqueue.h, create_workqueue() implicitly sets
> WQ_PERCPU, creating per-CPU worker threads. Since quic_wq only handles
> infrequent UDP socket cleanup via quic_udp_sock_put_work() in path.c, is
> per-CPU allocation necessary here? Would alloc_workqueue("quic_workqueue"=
,
> WQ_MEM_RECLAIM, 0) be more appropriate, or could this simply use system_w=
q
> if memory reclaim safety is not required?
>
This workqueue is also used for processing some backlog packets, which requ=
ires
process context.

I will move the infrequent UDP socket cleanup to system_wq as the AI sugges=
ts,
and leave this workqueue for the backlog packets processing only.
Then the allocation becomes:

quic_wq =3D alloc_workqueue("quic_workqueue", WQ_PERCPU, 0);

Thanks.

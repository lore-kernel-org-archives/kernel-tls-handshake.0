Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90438319858
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  3 Mar 2026 08:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772526191; cv=none; b=G01Oz/TVCjNxe0+aUEIb8kBiSE0C9qXOMits+/drupK0T00J5ICKl7N5OEenvTJcGnhnugmaD5NujZHpCx6g0W36YTb/3HZdzcWiDtKhAzyLnV0yqL6rucXg8PVWPAfrTU1SpoSo5+aHYCZXwiFiQDBq4l6izV+atH9sUL/fVM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772526191; c=relaxed/simple;
	bh=FIcra+QdGWbVK7dEeENktNZZV+zMM40tLcIz85kVF4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tA3aLXRlkzwgESRurAkZ2PhHBnH16p5yge+BDH6Tr9EXjHx2W4f4yPQCv7A9XPMNRDw/XHp9vPlmM3KUmR6PHyDG1rQ6xdiAxzJ0xV12pQ4aq6L0QcYqqCO0kYhhvjCkQYBfz+3NfZFSEGv3CfqYoDcjQ3cADjKiTLECyt2PqfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J+0ZMgXD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J+0ZMgXD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772526188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bNVvSG62xl9Jk3X2cnvC9Xwc7/DlqVbGbtIj6kzPkCk=;
	b=J+0ZMgXDEEcYvs7FQCr1kSPOKz23PH/ZKwrpuEWRWMzI6Gzq3/dLoPacSiJbLzHc9vZX8o
	lnM423gd7MytN9Gc9LIaL1jTe45Q6/dVAkYm6QE+YAG3FTOjUF3PybF6n2YrAwVFWGM6fi
	9Giea5dxIJWtrI8S9S6nvmHXNRKn4tc=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-XLWU2AmuPVGiBlk8hh-vAg-1; Tue, 03 Mar 2026 03:23:05 -0500
X-MC-Unique: XLWU2AmuPVGiBlk8hh-vAg-1
X-Mimecast-MFC-AGG-ID: XLWU2AmuPVGiBlk8hh-vAg_1772526185
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7965223b026so66865907b3.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 03 Mar 2026 00:23:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772526185; x=1773130985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNVvSG62xl9Jk3X2cnvC9Xwc7/DlqVbGbtIj6kzPkCk=;
        b=FeT+C3HiHus4ZgQUKj4yrcEdKKTuQj32V0z0lZ9NtF4mfymJsHPO1B111zR0zVfaX3
         1we35wJ8DfIwTqLOSy5u7SQOo7IVuSozWH/I/5TEfeEGLswbRLQiYFhlEQahL5O+9Veb
         opKL2pf2XMw22X2viqpAeNDbq++941wDEjch8hlkhQUxtobxqQoGV/7DqQOlCyZTv28y
         Jvpuy1P4ARm8avsyyZG+/YH7X9b2P1rSR1LVSp97OLmhIYRsDS4VNLmOzB2y3weP0Z5J
         3KF7qZrQDCoTag4EglUPZzBy9hn0GsWj2Wnz7DlIiEC9Qi8+r2nixDemwOFeKzOjkg6x
         Pssw==
X-Forwarded-Encrypted: i=1; AJvYcCXz5HadsLSwBaw/M6oCAlf0Z94zvnGGAyKis0QOWLS9jOBzfRFuW/QVGjSreXyhBcA4ICNglHtt14dcgZHaPvv1VpFs/g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2WdQsdrFdEkmSLwt4eA7EtpafM3rkgL/B3D7omLc5qdqDW+ZN
	mN+eQFh8p+X2tFLwmZo5umr2vwgcxVsiVfcrFvQ/wIOl9Sq+TunnfbP7RLZJRokeMgErs/dQjdc
	n3TTXB0ICMsSeqPov39uTotJgo9P7yVBi71hLomnLr10s3XOTwVpFt7UhVBE8k44RzEby0XcflR
	WaROGSv9c7zLSR5ZaLk5A/4ig77R0o5xtYNQXiqqXZOOTtTEirjPc=
X-Gm-Gg: ATEYQzxBEYuVmz79KepLsVr7FTaVIFDyD+LE+XbRDVXSGiSREhrxMegVKqQadwEqMD2
	saCXnaGMWrRV68mOYeOLBIxStNZFL3BTmrooZLXLFRDw0/x0sh1Xd88THS2PYTWOugUwua+HdTV
	gAEL2eEEVi7gW7pXVElj5K9dTEHZpFVJkzro/fRCSTSwiD7oWtqVFHsMnzjLTOPTuaRpXzvysLu
	ndQvRg=
X-Received: by 2002:a05:690c:4b01:b0:797:a162:f7c1 with SMTP id 00721157ae682-7988547cfe9mr125761037b3.16.1772526185025;
        Tue, 03 Mar 2026 00:23:05 -0800 (PST)
X-Received: by 2002:a05:690c:4b01:b0:797:a162:f7c1 with SMTP id
 00721157ae682-7988547cfe9mr125760857b3.16.1772526184694; Tue, 03 Mar 2026
 00:23:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1771986861.git.lucien.xin@gmail.com> <4e03deebdc944d9c963b0732abe8ba631893d82e.1771986861.git.lucien.xin@gmail.com>
In-Reply-To: <4e03deebdc944d9c963b0732abe8ba631893d82e.1771986861.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Date: Tue, 3 Mar 2026 09:22:53 +0100
X-Gm-Features: AaiRm53wLfsp6dwR6Y3kD8_sIr5QwiEb9N3a51XBSB8vMJnsYCaEYRcNMDa3ON8
Message-ID: <CAF6piC+W=QKU53vix1f8JxxFhRKCcMvXaX1NKBT3kcZLfCydEA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 08/15] quic: add path management
To: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>, quic@lists.linux.dev
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>, 
	Simon Horman <horms@kernel.org>, Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, 
	Tyler Fanelli <tfanelli@redhat.com>, Pengtao He <hepengtao@xiaomi.com>, 
	Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1Ppx7rT8bmxC217_ptbETB7mq4qo1CrrnyIAFGtgERQ_1772526185
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On 2/25/26 3:34 AM, Xin Long wrote:
> +/* Binds a QUIC path to a local port and sets up a UDP socket. */
> +int quic_path_bind(struct sock *sk, struct quic_path_group *paths, u8 path)
> +{
> +     union quic_addr *a = quic_path_saddr(paths, path);
> +     int rover, low, high, remaining;
> +     struct net *net = sock_net(sk);
> +     struct quic_uhash_head *head;
> +     struct quic_udp_sock *us;
> +     u16 port;
> +
> +     port = ntohs(a->v4.sin_port);
> +     if (port) {
> +             head = quic_udp_sock_head(net, port);
> +             mutex_lock(&head->lock);
> +             us = quic_udp_sock_lookup(sk, a, port);
> +             if (us) {

When the quick socket is already bound to a local port, reusing an
existing udp tunnel sock is allowed, but when the quick socket is not
bound, UDP tunnel sock reused is prevented. This looks confusing and not
documented, please clarify the behavior and/or make it consistent.


> +                     if (!quic_udp_sock_get(us)) { /* Releasing in workqueue; retry later. */
> +                             mutex_unlock(&head->lock);
> +                             return -EAGAIN;

Why not -EADDRINUSE here?

> +                     }
> +             } else {
> +                     us = quic_udp_sock_create(sk, a);
> +                     if (!us) {
> +                             mutex_unlock(&head->lock);
> +                             return -EINVAL;

It's probably better to propagate an error code (PTR_ERR) from
quic_udp_sock_create(), or use -ENOMEM

[...]
> @@ -332,6 +333,12 @@ static __init int quic_init(void)
>       if (err)
>               goto err_hash;
>
> +     quic_wq = create_workqueue("quic_workqueue");
> +     if (!quic_wq) {
> +             err = -ENOMEM;
> +             goto err_wq;
> +     }

AI review noted that:

This isn't a bug, but create_workqueue() is a legacy API marked with
__WQ_LEGACY in include/linux/workqueue.h. Should new subsystem code use
alloc_workqueue() with explicit flags instead?

Looking at include/linux/workqueue.h, create_workqueue() implicitly sets
WQ_PERCPU, creating per-CPU worker threads. Since quic_wq only handles
infrequent UDP socket cleanup via quic_udp_sock_put_work() in path.c, is
per-CPU allocation necessary here? Would alloc_workqueue("quic_workqueue",
WQ_MEM_RECLAIM, 0) be more appropriate, or could this simply use system_wq
if memory reclaim safety is not required?


/P


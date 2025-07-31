Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B377719ABAC
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 31 Jul 2025 15:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753975818; cv=none; b=Hb5oEfJSWbZ+ML6wUia1utyh1d7yXUoQD1pOiWhYPGLtsQ7aI8ft7oGlpGrI6ByGVSJDur2CRjVFZxQpmC1nAHhrg2Q5FDMw4m/W4AQHsfky315b6nKiOdyE156XiXFQO821YEHFWaa0wd9Ztf/ndrrpeSF2BgzBcVBY4C8658Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753975818; c=relaxed/simple;
	bh=8jmN7HSIprpvchOA3h5PYxRrb3kV7jr1wO++TShAHRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtCKkYSa7it5hI752hHD7uxktQimSN9tZewrUITYWSTc1VNhJZ92Zzf8hMqMYPvlLGrBRvfRsCLWe+PtPsV0fGGkGIv8ZWBTEiD02vRvW+xIf6G4NhmAXx1/mJbnlLnaqYHG4p0TpuxEYHrAIkHo7FshTzSN0Vx74pa08qDmyBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YnzqK7Jg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YnzqK7Jg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753975815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=efGuZE+wy/IQW6vpAnhNn2yJPMeIDc4VvmD3tdcVmA0=;
	b=YnzqK7Jg772LZ9BKj9Njue3WI5Fy/55sTUGKddS9XUb0c6TMRXd0g+TrbRSLIY4r7Qr7Tb
	uBJUlFQ5UIhx2YAHPu4N9Bk7rKjSp3DM8fRBaiTcPw8mYVTNmbTuwTrtB0qVNffYFWkIx+
	BEt5CJyzR67G04kFDFWZfUdujVQihLg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-x9GGqlr0PoudWFunZG755A-1; Thu, 31 Jul 2025 11:30:14 -0400
X-MC-Unique: x9GGqlr0PoudWFunZG755A-1
X-Mimecast-MFC-AGG-ID: x9GGqlr0PoudWFunZG755A_1753975813
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ae9bf1c5947so263495066b.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 31 Jul 2025 08:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753975811; x=1754580611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efGuZE+wy/IQW6vpAnhNn2yJPMeIDc4VvmD3tdcVmA0=;
        b=pM2zsf2dkysz/ss5wZXNqBCFYPDRA7wC9Gn8ZflkUI/he+SaU+kjgWzhnaw5npmVgS
         KqcOR31nm16F+OSqkiiyRbod5WpsXsg3XIDmTd6JfGup8FWK8FArt34pqgOXHCEX4aJt
         Y28TVXdoo9tZTrYSOqLL9RUhPjVaYWZgQfqqag+jkqkOX27xzNUkmS+KVgfaTuLALtOe
         G+gDgoelwLj3+XkxlHbeth+dTE2Z/2jWTzynthU/KfjQoB7Cnpwrjq6yB4QyM+pmnBcV
         rkg4Vkr3no6eJeotivvxSEKzYcw8PEjwFeGZkxjvOdcwdoyNguVAo1RUofFGwfvS2BOU
         EH/g==
X-Forwarded-Encrypted: i=1; AJvYcCXRFFOIAv5CWtFPmt9suBS0ELo4ntpq/dRZ+CxwWRss0xdGBN6aYmzijEXQy4Zr7c0axHPHzXJ7GwkMkbE17H4+Iz/vfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQatdyFm2ten2/5xIN+q73G+voO1oDo17O0kaKYJKY5fXVvaCd
	mG5tF6Me0jGGuFbjNcJX/GXGpFylhwl7QgxdUY/Pwk84H93TxqeHaJEbp20resSzzp3A9470p7H
	WOrDWcCAC6uwU/UnljvgnqfZJwyeJe36JjRJi9zdKfEMnr87s9Gc69HO+fPra6a+RK6CAZCcbXO
	9JHCWGTa4ijKEIqhVpLqZbDNVJT8u/F4b+5q5WkGvINFcbnPu6miE=
X-Gm-Gg: ASbGncvyegTdMg/lOPpv4D0mr3XyeARZiXyvESMin9q9X5KPVTnNLa+ljRL0iZfJLuu
	W8A/2xCwf+DIJto1ZJ675608u1lb1oW8+dvNk4byeIU/7GN7QfwP5JV09z9rHLcXwHSdLmrSdAu
	U4ud05lB1lkpztp1JT+DeiVUDWM7MqwiRo9/E+Oiw766VjAaqbayTKLw==
X-Received: by 2002:a17:906:fe02:b0:ae6:c334:af3a with SMTP id a640c23a62f3a-af91bbff55emr339554766b.6.1753975811000;
        Thu, 31 Jul 2025 08:30:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5c9yIisVqfaFsfCitspiLklBi+v8OwNwd+81HnIxrh0XVGF7Bd2GCjIVQsJ7OLqh9uU8xi9NdthF8zdbYdEE=
X-Received: by 2002:a17:906:fe02:b0:ae6:c334:af3a with SMTP id
 a640c23a62f3a-af91bbff55emr339550366b.6.1753975810480; Thu, 31 Jul 2025
 08:30:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730200835.80605-1-okorniev@redhat.com> <20250730200835.80605-4-okorniev@redhat.com>
 <cdeb5e12-5c61-4a95-8e31-c56a3a90d6a3@suse.de>
In-Reply-To: <cdeb5e12-5c61-4a95-8e31-c56a3a90d6a3@suse.de>
From: Olga Kornievskaia <okorniev@redhat.com>
Date: Thu, 31 Jul 2025 11:29:58 -0400
X-Gm-Features: Ac12FXyu4ke7AXpdJWvJjWBL1u_s87jJMDfrMGmbaMXP6xuZW7P6B3nrHVs7sWU
Message-ID: <CACSpFtCu+it5n2z=OXRARznR02aU4d3r2z7Sok6WzGt24C6-NQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] nvmet-tcp: fix handling of tls alerts
To: Hannes Reinecke <hare@suse.de>
Cc: chuck.lever@oracle.com, jlayton@kernel.org, trondmy@hammerspace.com, 
	anna.schumaker@oracle.com, hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux-nfs@vger.kernel.org, linux-nvme@lists.infradead.org, 
	netdev@vger.kernel.org, kernel-tls-handshake@lists.linux.dev, neil@brown.name, 
	Dai.Ngo@oracle.com, tom@talpey.com, horms@kernel.org, kbusch@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9Bm8-56jz41pkVWygEPYdQ56tn7TypVPVt82rKYHFHI_1753975813
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 2:10=E2=80=AFAM Hannes Reinecke <hare@suse.de> wrot=
e:
>
> On 7/30/25 22:08, Olga Kornievskaia wrote:
> > Revert kvec msg iterator before trying to process a TLS alert
> > when possible.
> >
> > In nvmet_tcp_try_recv_data(), it's assumed that no msg control
> > message buffer is set prior to sock_recvmsg(). Hannes suggested
> > that upon detecting that TLS control message is received log a
> > message and error out. Left comments in the code for the future
> > improvements.
> >
> > Fixes: a1c5dd8355b1 ("nvmet-tcp: control messages for recvmsg()")
> > Suggested-by: Hannes Reinecke <hare@suse.de>
> > Reviewed-by: Hannes Reinecky <hare@susu.de>
> > Signed-off-by: Olga Kornievskaia <okorniev@redhat.com>
> > ---
> >   drivers/nvme/target/tcp.c | 30 +++++++++++++++++++-----------
> >   1 file changed, 19 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
> > index 688033b88d38..055e420d3f2e 100644
> > --- a/drivers/nvme/target/tcp.c
> > +++ b/drivers/nvme/target/tcp.c
> > @@ -1161,6 +1161,7 @@ static int nvmet_tcp_try_recv_pdu(struct nvmet_tc=
p_queue *queue)
> >       if (unlikely(len < 0))
> >               return len;
> >       if (queue->tls_pskid) {
> > +             iov_iter_revert(&msg.msg_iter, len);
> >               ret =3D nvmet_tcp_tls_record_ok(queue, &msg, cbuf);
> >               if (ret < 0)
> >                       return ret;
> > @@ -1217,19 +1218,28 @@ static void nvmet_tcp_prep_recv_ddgst(struct nv=
met_tcp_cmd *cmd)
> >   static int nvmet_tcp_try_recv_data(struct nvmet_tcp_queue *queue)
> >   {
> >       struct nvmet_tcp_cmd  *cmd =3D queue->cmd;
> > -     int len, ret;
> > +     int len;
> >
> >       while (msg_data_left(&cmd->recv_msg)) {
> > +             /* to detect that we received a TlS alert, we assumed tha=
t
> > +              * cmg->recv_msg's control buffer is not setup. kTLS will
> > +              * return an error when no control buffer is set and
> > +              * non-tls-data payload is received.
> > +              */
> >               len =3D sock_recvmsg(cmd->queue->sock, &cmd->recv_msg,
> >                       cmd->recv_msg.msg_flags);
> > +             if (cmd->recv_msg.msg_flags & MSG_CTRUNC) {
> > +                     if (len =3D=3D 0 || len =3D=3D -EIO) {
> > +                             pr_err("queue %d: unhandled control messa=
ge\n",
> > +                                    queue->idx);
> > +                             /* note that unconsumed TLS control messa=
ge such
> > +                              * as TLS alert is still on the socket.
> > +                              */
>
> Hmm. Will it get cleared when we close the socket?

If the socket is closed then any data on that socket would be freed.

> Or shouldn't we rather introduce proper cmsg handling?

That would be what I have originally proposed (I know that was on the
private list). But yes, we can setup a dedicated kvec to receive the
TLS control message once its been detected and then call
nvme_tcp_tls_record_ok().

Let me know if proper cmsg handling is what's desired for this patch.

> (If we do, we'll need it to do on the host side, too)

I can see that the host doesn't have any TLS alert handling now. If
the only place where (TLS) traffic is read from is in host/tcp.c
nvme_tcp_init_connection(), then that's seems like an easy case
because it uses a kvec to back the kernel_recvmsg() msg structure. If
the ctype is tls alert, you can call tls_alert_recv() and pass in the
"iov".  -- assuming patch#4 already went in by that time)

>
> > +                             return -EAGAIN;
> > +                     }
> > +             }
> >               if (len <=3D 0)
> >                       return len;
> > -             if (queue->tls_pskid) {
> > -                     ret =3D nvmet_tcp_tls_record_ok(cmd->queue,
> > -                                     &cmd->recv_msg, cmd->recv_cbuf);
> > -                     if (ret < 0)
> > -                             return ret;
> > -             }
> >
> >               cmd->pdu_recv +=3D len;
> >               cmd->rbytes_done +=3D len;
> > @@ -1267,6 +1277,7 @@ static int nvmet_tcp_try_recv_ddgst(struct nvmet_=
tcp_queue *queue)
> >       if (unlikely(len < 0))
> >               return len;
> >       if (queue->tls_pskid) {
> > +             iov_iter_revert(&msg.msg_iter, len);
> >               ret =3D nvmet_tcp_tls_record_ok(queue, &msg, cbuf);
> >               if (ret < 0)
> >                       return ret;
> > @@ -1453,10 +1464,6 @@ static int nvmet_tcp_alloc_cmd(struct nvmet_tcp_=
queue *queue,
> >       if (!c->r2t_pdu)
> >               goto out_free_data;
> >
> > -     if (queue->state =3D=3D NVMET_TCP_Q_TLS_HANDSHAKE) {
> > -             c->recv_msg.msg_control =3D c->recv_cbuf;
> > -             c->recv_msg.msg_controllen =3D sizeof(c->recv_cbuf);
> > -     }
>
> As you delete this you can also remove the definition of 'recv_msg'
> from nvmet_tcp_cmd structure.

You mean 'recv_cbuf', right? recv_msg would still be needed by the code.

I can send v2 with that change. Whether or not cmsg handling is needed
in v2 I'd need a confirmation on. Given I'm working on compile only
mode, I'd rather keep changes to minimal.

> >       c->recv_msg.msg_flags =3D MSG_DONTWAIT | MSG_NOSIGNAL;
> >
> >       list_add_tail(&c->entry, &queue->free_list);
> > @@ -1736,6 +1743,7 @@ static int nvmet_tcp_try_peek_pdu(struct nvmet_tc=
p_queue *queue)
> >               return len;
> >       }
> >
> > +     iov_iter_revert(&msg.msg_iter, len);
> >       ret =3D nvmet_tcp_tls_record_ok(queue, &msg, cbuf);
> >       if (ret < 0)
> >               return ret;
>
> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), GF: I. Totev, A. McDonald, W. Knoblich
>


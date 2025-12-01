Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1269623B61B
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  1 Dec 2025 23:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764631665; cv=none; b=qva6fo7lW3gN7UINOA5jmBfM0tOJN/z0/EycDrJkUpH+d1GqM11/URmavZ3LWX/FIBSq4Z8ewR4/ZeHfZqDE6SXiwt8AYcQ6GS3saRRrRbjsE3sEDpIxbTCyvgDTEqeJNRgJNCaZif7xYhKEAYm+fWNjwIr07KxtioYZD+k5Gf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764631665; c=relaxed/simple;
	bh=2v7PUt3zWp+C6C2zHvV/eYFuT92dPOAzdkMDCQL1GT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rQaoNgWwQdbivuc7Decy0IT3+LXpmCJAaRogxn/koTsPT4NBZnb4EPT50y887LzR/PhrwIg/ZHZrYxYOUIOlkdU1LD5ZxeCdOjf25MTCYncIXo+HoGDtf43cp/wqh+94CHDlhUu7Bz+R5c5xf1ZilMz5wnikWmir6A+pacneAz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEog2cua; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEog2cua"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b728a43e410so820800866b.1
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 01 Dec 2025 15:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764631662; x=1765236462; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5v1/VXYzTJjMPpWg21e/KcaL7VxnGFLf4XvfhndU1c=;
        b=MEog2cuaqNuiKhVD5rfVMm5a1HobEGBAflScB70BKX6AKeJ0pbfoNgaIVy39hwsD+w
         67mx6RpXV7SZ8pg0ViBfeDbM48Ye9Oi9uKAAzM9Tyj/tdEXcfGvxhBL0Yms6f9zLmIP5
         hNsW60FvWEVGvraKOfejSKl7iT6Rg2oC+qtQHAJjvaLpUnmFmQ+j9cLVWG+lN1yw3G22
         5e6s2rfvP4sd/rgn8eimImEm/wyau1HNGWr0ou4doucsksZ8z34qkingz53NXEQxdzpd
         cv+dJPrMi4V7Ycd0p8nlEUAPyCPnY9A2aQvSvvGssUPlKuXNkwRZ70/whpy8evFSgeTk
         HxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764631662; x=1765236462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I5v1/VXYzTJjMPpWg21e/KcaL7VxnGFLf4XvfhndU1c=;
        b=bHRa2K0KNfbeSFeaM+g7QwFfg9wDfJ2TdRkTaeLJHB7gUf9zhM3BP/WVg2oKPGs898
         4FVxxII9S45HA6VNwMqZ/9TGNVNU5cW/uFIANmzGTeCoECCKYHzThtIkB67MRlayLT9b
         FU40NmhP/gfCcapob+WfUY+hzgC3E6b9d/2WjP/E9f/1+DbhtfhCUFBTRx0A8f85AzxI
         FLDfHa8fQVssW41SzybMM/6o8Zy9fQh59MOvfCjM9TUzHbrN0+MG9JGwIeHfC76CrrN3
         iKrB13A2LxKpjzlYs+mqs0dDTWZbWTUAEig9QEjAseOnugHOEpe1CypMCz7qLjzMxI/L
         AQvg==
X-Forwarded-Encrypted: i=1; AJvYcCUpWXLJlcUaqTuqBg0Mvvtj8vcUvGPO3mnkAZ0mkYm1t+oend2oZUhOZBIKXWzLME9H8jnJ2ZOjEx4DTVdCGFA/gHzszw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPex7vuLpOC/xDdZ4hcqeE+BNNDzHrMV5oNIL/tFGKL2eN5AXe
	1gmNq1ebP/EW97yB0RQJsoluICfI37G2jl+AepIJKgjIRK8Sj7UDuFBML92XNyKwa2gEH/1hpyQ
	xum8S1oPnu6GKiRKWM9mwjEefnN+zkN4=
X-Gm-Gg: ASbGncsWLCgNtxFagq7ihz4OXToSBFAoPSICH5c2BUaxYN0w58RI1vBX0f2ejLBqAgz
	RpaoINUv3ZXccwiTUzFFYytzhvz1zlHGuh98H2pmTJi0GXyolNQdXN60Gg+tPZsjuwFvLRMZQuB
	W3I8TKTIzuZX23lvjdeH1g0ZZAtAX8tCFkrykMdB7BG0ndYCcZxGbrRmW5TFv67H7VQ/I7jlCum
	6uJsq5b+wzeczcNpZoidEMhCwqWOeitbE7yZXGfcFAtw1IBijC78Q6jZ5tnTX/lzZWG2cnpL0zv
	GYt6FU/f66RLLVH21uAyz3p5Zw==
X-Google-Smtp-Source: AGHT+IF9jmZyoLWFSx4hBdg0tZdsiQqccPSCxC9NjkJhrPQdxcaCTCtSHGJiP4lrMAOk35kCgFsaz5zURXiOG0ANOnM=
X-Received: by 2002:a17:907:1b28:b0:b73:6f8c:612b with SMTP id
 a640c23a62f3a-b76715653d5mr4425120366b.16.1764631662278; Mon, 01 Dec 2025
 15:27:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251112042720.3695972-1-alistair.francis@wdc.com>
 <20251112042720.3695972-6-alistair.francis@wdc.com> <1184961b-5488-4150-b647-29ed363e2276@grimberg.me>
In-Reply-To: <1184961b-5488-4150-b647-29ed363e2276@grimberg.me>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 2 Dec 2025 09:27:15 +1000
X-Gm-Features: AWmQ_bk8CEM-2dviwMQHZxPcd6nv4bajHpJYpbv7ORWXtEq1tzS6ym3A8-DNYFg
Message-ID: <CAKmqyKPe_o8Yaa0uNd-PeGgT1GONwuLxjATRHW9a-6DV7c=4nA@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] nvme-tcp: Support KeyUpdate
To: Sagi Grimberg <sagi@grimberg.me>
Cc: chuck.lever@oracle.com, hare@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org, kbusch@kernel.org, 
	axboe@kernel.dk, hch@lst.de, kch@nvidia.com, hare@suse.de, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 8:31=E2=80=AFAM Sagi Grimberg <sagi@grimberg.me> wro=
te:
>
>
>
> On 12/11/2025 6:27, alistair23@gmail.com wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > If the nvme_tcp_try_send() or nvme_tcp_try_recv() functions return
> > EKEYEXPIRED then the underlying TLS keys need to be updated. This occur=
s
> > on an KeyUpdate event as described in RFC8446
> > https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3.
> >
> > If the NVMe Target (TLS server) initiates a KeyUpdate this patch will
> > allow the NVMe layer to process the KeyUpdate request and forward the
> > request to userspace. Userspace must then update the key to keep the
> > connection alive.
> >
> > This patch allows us to handle the NVMe target sending a KeyUpdate
> > request without aborting the connection. At this time we don't support
> > initiating a KeyUpdate.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
>
> I see this is on top of Hannes recvmsg patch. Worth noting in the patch
> here at least.
>
> > v5:
> >   - Cleanup code flow
> >   - Check for MSG_CTRUNC in the msg_flags return from recvmsg
> >     and use that to determine if it's a control message
> > v4:
> >   - Remove all support for initiating KeyUpdate
> >   - Don't call cancel_work() when updating keys
> > v3:
> >   - Don't cancel existing handshake requests
> > v2:
> >   - Don't change the state
> >   - Use a helper function for KeyUpdates
> >   - Continue sending in nvme_tcp_send_all() after a KeyUpdate
> >   - Remove command message using recvmsg
> >
> >   drivers/nvme/host/tcp.c | 85 +++++++++++++++++++++++++++++++++-------=
-
> >   1 file changed, 70 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> > index 4797a4532b0d..5cec5a974bbf 100644
> > --- a/drivers/nvme/host/tcp.c
> > +++ b/drivers/nvme/host/tcp.c
> > @@ -172,6 +172,7 @@ struct nvme_tcp_queue {
> >       bool                    tls_enabled;
> >       u32                     rcv_crc;
> >       u32                     snd_crc;
> > +     key_serial_t            handshake_session_id;
> >       __le32                  exp_ddgst;
> >       __le32                  recv_ddgst;
> >       struct completion       tls_complete;
> > @@ -858,7 +859,10 @@ static void nvme_tcp_handle_c2h_term(struct nvme_t=
cp_queue *queue,
> >   static int nvme_tcp_recvmsg_pdu(struct nvme_tcp_queue *queue)
> >   {
> >       char *pdu =3D queue->pdu;
> > +     char cbuf[CMSG_LEN(sizeof(char))] =3D {};
> >       struct msghdr msg =3D {
> > +             .msg_control =3D cbuf,
> > +             .msg_controllen =3D sizeof(cbuf),
> >               .msg_flags =3D MSG_DONTWAIT,
> >       };
> >       struct kvec iov =3D {
> > @@ -873,12 +877,17 @@ static int nvme_tcp_recvmsg_pdu(struct nvme_tcp_q=
ueue *queue)
> >       if (ret <=3D 0)
> >               return ret;
> >
> > +     hdr =3D queue->pdu;
> > +     if (hdr->type =3D=3D TLS_HANDSHAKE_KEYUPDATE) {
> > +             dev_err(queue->ctrl->ctrl.device, "KeyUpdate message\n");
> > +             return 1;
> > +     }
> > +
> >       queue->pdu_remaining -=3D ret;
> >       queue->pdu_offset +=3D ret;
> >       if (queue->pdu_remaining)
> >               return 0;
> >
> > -     hdr =3D queue->pdu;
> >       if (unlikely(hdr->hlen !=3D sizeof(struct nvme_tcp_rsp_pdu))) {
> >               if (!nvme_tcp_recv_pdu_supported(hdr->type))
> >                       goto unsupported_pdu;
> > @@ -944,6 +953,7 @@ static int nvme_tcp_recvmsg_data(struct nvme_tcp_qu=
eue *queue)
> >       struct request *rq =3D
> >               nvme_cid_to_rq(nvme_tcp_tagset(queue), pdu->command_id);
> >       struct nvme_tcp_request *req =3D blk_mq_rq_to_pdu(rq);
> > +     char cbuf[CMSG_LEN(sizeof(char))] =3D {};
> >
> >       if (nvme_tcp_recv_state(queue) !=3D NVME_TCP_RECV_DATA)
> >               return 0;
> > @@ -976,10 +986,26 @@ static int nvme_tcp_recvmsg_data(struct nvme_tcp_=
queue *queue)
> >
> >               ret =3D sock_recvmsg(queue->sock, &msg, msg.msg_flags);
> >               if (ret < 0) {
> > -                     dev_err(queue->ctrl->ctrl.device,
> > -                             "queue %d failed to receive request %#x d=
ata",
> > -                             nvme_tcp_queue_id(queue), rq->tag);
> > -                     return ret;
> > +                     /* If MSG_CTRUNC is set, it's a control message,
> > +                      * so let's read the control message.
> > +                      */
> > +                     if (msg.msg_flags & MSG_CTRUNC) {
> > +                             memset(&msg, 0, sizeof(msg));
> > +                             msg.msg_flags =3D MSG_DONTWAIT;
> > +                             msg.msg_control =3D cbuf;
> > +                             msg.msg_controllen =3D sizeof(cbuf);
> > +
> > +                             ret =3D sock_recvmsg(queue->sock, &msg, m=
sg.msg_flags);
> > +                     }
> > +
> > +                     if (ret < 0) {
> > +                             dev_dbg(queue->ctrl->ctrl.device,
> > +                                     "queue %d failed to receive reque=
st %#x data, %d",
> > +                                     nvme_tcp_queue_id(queue), rq->tag=
, ret);
> > +                             return ret;
> > +                     }
> > +
> > +                     return 0;
> >               }
> >               if (queue->data_digest)
> >                       nvme_tcp_ddgst_calc(req, &queue->rcv_crc, ret);
> > @@ -1384,15 +1410,39 @@ static int nvme_tcp_try_recvmsg(struct nvme_tcp=
_queue *queue)
> >               }
> >       } while (result >=3D 0);
> >
> > -     if (result < 0 && result !=3D -EAGAIN) {
> > -             dev_err(queue->ctrl->ctrl.device,
> > -                     "receive failed:  %d\n", result);
> > -             queue->rd_enabled =3D false;
> > -             nvme_tcp_error_recovery(&queue->ctrl->ctrl);
> > -     } else if (result =3D=3D -EAGAIN)
> > -             result =3D 0;
> > +     if (result < 0) {
> > +             if (result !=3D -EKEYEXPIRED && result !=3D -EAGAIN) {
> > +                     dev_err(queue->ctrl->ctrl.device,
> > +                             "receive failed:  %d\n", result);
> > +                     queue->rd_enabled =3D false;
> > +                     nvme_tcp_error_recovery(&queue->ctrl->ctrl);
> > +             }
> > +             return result;
> > +     }
> > +
> > +     queue->nr_cqe =3D nr_cqe;
> > +     return nr_cqe;
> > +}
> > +
> > +static void update_tls_keys(struct nvme_tcp_queue *queue)
> > +{
> > +     int qid =3D nvme_tcp_queue_id(queue);
> > +     int ret;
> > +
> > +     dev_dbg(queue->ctrl->ctrl.device,
> > +             "updating key for queue %d\n", qid);
> >
> > -     return result < 0 ? result : (queue->nr_cqe =3D nr_cqe);
> > +     flush_work(&(queue->ctrl->ctrl).async_event_work);
> > +
> > +     ret =3D nvme_tcp_start_tls(&(queue->ctrl->ctrl),
> > +                              queue, queue->ctrl->ctrl.tls_pskid,
> > +                              HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED);
>
> No need to quiesce the queue or anything like that? everything continues
> as usual?

Everything just continues as usual. Besides a drop in throughput
waiting for the KeyUpdate you don't notice it. For testing I trigger
an update every 30 packets, it's slow but works

> Why are you flushing async_event_work?

I think that's just leftover from earlier, I'll remove it

Alistair

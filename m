Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CC714A4F9
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  1 Dec 2025 04:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764562719; cv=none; b=QjfKRkdbwxTIQdIjUSX3S1HHlOeppPk9te+ZXVs1fJeQJECEqHX/hVRZ0GM25gk3mj4NygfYxT+PD2b2jyccnaYvoD9vlK3zpNC5trtmtdX65xMr69oht/7Kestr9feB4h1ojU9jRtn5aVBOG4oQqXadLeSm2XjmDy0mXvJosiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764562719; c=relaxed/simple;
	bh=jkPMD6GHsCXWpn7rUP9jQrqa/c4UKeSxDfKF/9lJTB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pkg2Pbz3/H/vVaVUq4OA/BrZxdEq0e8nk0CpP1VgFKVnxsr0UYtf8TT9MzaoEVDvIvQ1REtMiwKDRohBCFBJAvGmTLGMjEK/r+073bgzkNjGQxwUR89WLQbyiY8su8UPE4isUIMEuy5sP/8C+Ml28QPasVlx7Nht00U8DHWT4DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+dWeEhF; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+dWeEhF"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b735b89501fso462501366b.0
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 30 Nov 2025 20:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764562716; x=1765167516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMVbFQJwrtDT4Z0LvdOkvQwxkH7n3jhJLvQGPrvBilI=;
        b=e+dWeEhFDzWZYtMPylOSj9ZQKJlsOER/7MfLbE8r5gPYZsXZ0R033g9mtCV1dNoKpB
         hZlLYehxKM8P9HmbmvyYHDJ+Wob7FmhUSqY6LOu2NMg7rjMBhxKw2KCG7ZV+bK3xl3w7
         voIGpVsHGRnJosFAvqFkeYBKiRa+c4mAioTArbf00XdV6XdEMO76GLUivwzeUMvL/PRt
         XCPD5DTAGKwJIcoYcHyWvcrVReylRa8RJR56lRNqe3kVW9loEEHv8tPHHR2g8ui/B/UU
         7UXysf+ycGIgMT+WUCy665/9NuaKDNthbsRw75Ui1ORwtLdoyG1B4D3S8BDVljxEL/MZ
         +yHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764562716; x=1765167516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AMVbFQJwrtDT4Z0LvdOkvQwxkH7n3jhJLvQGPrvBilI=;
        b=rZ2cLos6OXMePxStR7hpS0Yu7utMLckpU8L6Ie/1xFt7Pm7No9MAQQf6Uco86cOBSY
         J/LW4jyhQIYN99pdd03fr8R512V7pvfvBFfMiFpTak3ZWo4BHv7VBTjLBMLLTmMTymHA
         udjkxVFQ6RpeLw7Xj7jPuRTCT7QK/XzP0Z6MQwgBN8z5OUq3DQzUbUR178BDMdbHb/sK
         PLFsUFWJ8xrXytl62UQw4ioQ2Pmkkh9PynlsMEQqki29G+kjbLF2pnoSy7HuFE5aRkH7
         P0w53F96soDuAJPmW260ZXMCfFUBVFSXX9rB5BQiPiIOgir+OgqxYZIWp9WmfNMs5/M3
         pIng==
X-Forwarded-Encrypted: i=1; AJvYcCUCdxa+Hyh0Bq67x1N7kxRzi0gpHNzTT51LZLkf/+Lq6kQyhGLRhKawVLkeNvb85aZDa3hZMcd0+dIcYf6+/KiCECJ4DQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSZu3hgQZ+FFdkY4ZdhqkmwUbhL3cuIdoRVstze4NuSvhL3hD1
	44sKXgf0pN+ilP6UUa2kJwkuL00CYG943XUj/w7/JMU+eKRRutLesy0EgBUHlsMTNf3Zj6hFwz1
	xmeQtwOvSdCCl7fPodqpMIKxBVKXnISw=
X-Gm-Gg: ASbGnctt2w6w6KYtFGNflhOmHy1uprebU21y6sNaOorIQElPYac064sVr1F31fHVDut
	3YGAEuwrgg+rlUTgrP/+3VT6c1ql12g5UWCeYPoNq5z7rNoIiFsNpjEaUSGZyC51lCONV/D0Ets
	yCAjnVkNzfOSh1H2dUHAvjSg5gdAMPsic+58HlH4EsoyFgP8uafxVbiJNbBBYB2lonS7ZJw6cAc
	9jxhbv0ZNm8nusJRrYqU1Y5ZPxwkf9iE90f81nkMz49a39s9JFJ3G/peA9ERzwEoKnSh3BBQNT9
	eYXIe2eFWJcrcpOvJskDPY/xxgstxsNTZMGM
X-Google-Smtp-Source: AGHT+IEeTiNhj2dkL9zHMBWy2MWadxfl3ORIHTFpBD3euUzlvLmeTWg5W0jv/zpi7B8w/lH1Tab+xDdjnzwufYN3YuM=
X-Received: by 2002:a17:907:3c96:b0:b73:9368:ad5e with SMTP id
 a640c23a62f3a-b76c5515082mr2667474566b.34.1764562715362; Sun, 30 Nov 2025
 20:18:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251112042720.3695972-1-alistair.francis@wdc.com>
 <20251112042720.3695972-6-alistair.francis@wdc.com> <f7a91a49-9f82-492a-8bf9-520ee1c832ba@suse.de>
In-Reply-To: <f7a91a49-9f82-492a-8bf9-520ee1c832ba@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Dec 2025 14:18:08 +1000
X-Gm-Features: AWmQ_bnRvWBaRf_AYOX9GVK2GmdKNpGnJ5WeFBVDhtY-flit1CL2pb-FbNx9lsA
Message-ID: <CAKmqyKPU2w2GrzdMtMn1rO8auOpDCTovQH04P8RxptA45Oy6XQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] nvme-tcp: Support KeyUpdate
To: Hannes Reinecke <hare@suse.de>
Cc: chuck.lever@oracle.com, hare@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org, kbusch@kernel.org, 
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 11:31=E2=80=AFPM Hannes Reinecke <hare@suse.de> wro=
te:
>
> On 11/12/25 05:27, alistair23@gmail.com wrote:
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
>
> Errm. 'hdr' is of type 'struct nvme_tcp_hdr', and that most certainly
> does not define TLS_HANDSHAKE_KEYUPDATE. I think you should evaluate the
> cmsg type here.
>
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
> This is not correct; reading the control message implies a kernel
> memory allocation as message buffer, not an interator (as it's the
> case here).

I don't follow what you mean

Alistair

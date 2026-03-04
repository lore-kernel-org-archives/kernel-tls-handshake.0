Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3CC3537CE
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  4 Mar 2026 11:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624273; cv=pass; b=nafOM9tM3s6TWP9aOXvQKF74sbWj3od6eOC7bp8SHnPy/KD5HmknfvqCl+NE+H8rJurBAOwG5ZAkIrQdLfQ/094ZOgneKlswHJEYu545ot8mD7Bx9FV+MdPrLn+/9j5AGbgWsx72EhtU7L81CvukQy0zc0996PKp/0h00VAQQ18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624273; c=relaxed/simple;
	bh=ZaTX/5xZCLp8jX/BNqqW109CaVTKhBe9/NvQKJFvKx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DY0bYZND01L1R+IomUOMCHGbc6bF51qrseYCGMCpiDGHIMEE6ADg6P96AgqNfqzE3dqHRL1nEwNa/7TkbKtKgQNFYjJE85p5LObxJxYjmJelWMDt6Yu++HoVwmmNkH9qOCkkIiXSKBDs99KDhXCHQjAe02qhEUdLjYylg5OJhZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ta/WAUIU; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ta/WAUIU"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-660fb578f8eso735596a12.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 04 Mar 2026 03:37:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772624269; cv=none;
        d=google.com; s=arc-20240605;
        b=XZxVBxKRJgnINPybk8ORq+oXWc5lNbk/NsQvVkDxPcb73e+j6RzVI5XKqa3tIPZssX
         8zGfoS57Kahvm4jSjExI4ST93HV4vpPAfgkxViswE6uOwJVnjUJlvojyPB1GcjbvcSrL
         34i1m/KUlaIyoZBbElF94GCnSemM13CdeewBILBdF/qh293yjJ0JSesQFR5i49f+B4w+
         QtGRCYnmQ/5eSLiyVdTXbnwbfiDhehqvRksd4pJkc+Sh/hArXqb0A27JAtPPgLCRZo8Q
         X+7nLspKfOf5HR1bWhrzWWUtYHN/odEAguBJDE6mxZhR+RdrQKro31s4hn3/y10MVrWG
         Hqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lDZKotLArOoGPbmGkSbdB3knGUn3d/x5zVLs33GH6ak=;
        fh=ktYtjpNu9EUgXZjf+7Og3fTTaVRW99u1jKxtwdwlHj4=;
        b=KE63PmdjvsGsqrBBhPjWOR9rTzjxkEivzW00SySr0vkkl/x2WDK9/YD2cGJjyD333l
         ZnLNn3saZdm4wnUL+gwQN91eg9qYWf43NQJoeMVi229k0faRBLdcvTxVXcfSUZmGGCkU
         uYnPc2Mz6s65EiV9Ih5hANLGMjDOAVHTNb8m7qxTd17/oAZ+5S0+AlOOYk9ZuxU9fJHp
         bB2s+WGZq7K5C+awOFt6Q3o0gPXBbgSnyrXuRP7zIJtYy3JsHdV1EKovoCt/L6owhSTG
         UrGTValCWYUisjizAjl/DuozRcy3CiRtVpHs9Te2JoUvoSnUyUCV1eyja6gm2U5eY+kN
         rjsg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772624269; x=1773229069; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDZKotLArOoGPbmGkSbdB3knGUn3d/x5zVLs33GH6ak=;
        b=Ta/WAUIUvQjYnZToIp7add2j/sBC4Dd4SVYu70m35jc6p2E2Wll41iU2sSibJLRlHJ
         moxRXmmbteTToQh8xywP8betwDWoyG3Y8HtLaUbeIEqg0KkWmKzi+Ph+vQUHGb3D0lRb
         lMKsjeMHNicNj3FDqmrh4x9VElDd8iFosv5hILeYjtMf8ZtPLkEVbyXBUhrZTAZ+3sOn
         +xectrqyktSfW0pNPPcUgE+ky1yU4cJhx3BoYPgQxOZlSRKATvrdBQjbZAWAmDww2oZI
         ZENn0MZpwKPo8Bbh29+CRaloC9nodfQ6NX6jgKg4dc1RQJNQrKSM5u6XkRDWBgtFtZwB
         CO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772624269; x=1773229069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lDZKotLArOoGPbmGkSbdB3knGUn3d/x5zVLs33GH6ak=;
        b=eEeK2NH/lt68JDwhPnVRZovDLVCel2QyyTqEKO7XfSlyybw48d6TlqYJykDkALCvkW
         3ugQXXrGu+INgS8JYrx2gNS5bVLGMb31yZKPVI41arttNGj21qZtkggRmfrl1XoieLFo
         EE/CDCGcA5/qlSWjfxHQmRAsGNfoa1H2s3kBBSN1lgoZbDKMz0qxeRG7efiSbiiYgEtX
         FOSIXg1e59fBBh4UEhpdNIs1+dzeLY1I5+8/xfl/Xrc0vfTIWQfl0pontPlOBr5E8Zkk
         DRmeNDVPHcMaW1YxsKJxvlDpXZ2YTtu0J4lxoavtOEm/YTVfoGLQoOkZL/qCj9H5/ZSg
         U5Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWV923ttsbCUBGoI6v9qZlr7b/yqyHYsOOnW7oJYcXA7thspH9Jqn/B2pjRKv01oXH8i2VULsH40w4SnfrI1vZtiDv+oQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr5zIKK5EWfhSnjSgPtFsgGi2uKa8AeiBqVfR7yF9nwTIUbq04
	3u3K83gc9JkRkgQY4Lt7t7cft5nhOyCBzqI2FmZTjLMgmbGhNk1w/3kxB/K1aNQVN+dqAdBk+CI
	hRJ7yczAIgVhXrf3C6Txcmkolie+EuJc=
X-Gm-Gg: ATEYQzyPs7jbxHB4fJcY/5p2ZoJHJRep6iOc073dfwnKGyqQqvATkb51JcP42QwoBx/
	RovrzLtF4wQg2l19yjuZFKqmyaYBFDTxJE5PttStxQF5k7cJB3acMNaAsx7b/44ZKJxH3lsHp7k
	lhcpTnp+6J8d9DIFmfk869ntAHayuasW/iXHa2quZmJMWOImYq3VBPXDwL6xaCJuxDow8mbTZCB
	WGdfs9meiZSOubx3184TO2Z8sFPoETTEyBsYZuGlFb48XwfhcW36a2BB7iqjSMuCPYu75uiK2VA
	CHqjgopulbV+04NwpYFbwTNf2XPXkg3QNIxaPQ==
X-Received: by 2002:a05:6402:34c9:b0:65f:80cc:a47a with SMTP id
 4fb4d7f45d1cf-660ef7797f6mr858539a12.1.1772624269071; Wed, 04 Mar 2026
 03:37:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260304053500.590630-1-alistair.francis@wdc.com>
 <20260304053500.590630-5-alistair.francis@wdc.com> <103c958f-d5f9-47d3-9be8-dd7225368fd5@suse.de>
In-Reply-To: <103c958f-d5f9-47d3-9be8-dd7225368fd5@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 4 Mar 2026 21:37:22 +1000
X-Gm-Features: AaiRm53Rc8hKqaLsyJSSxrm4evktnm3D1AOZXCuqV_7q51qatQHTgMljJH9bALQ
Message-ID: <CAKmqyKPdJ2bgT2JaXi_38obyFTjRQ_rR5EdGmP81so8MEJNRVw@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] nvme-tcp: Support KeyUpdate
To: Hannes Reinecke <hare@suse.de>
Cc: chuck.lever@oracle.com, hare@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org, kbusch@kernel.org, 
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 5:40=E2=80=AFPM Hannes Reinecke <hare@suse.de> wrote=
:
>
> On 3/4/26 06:34, alistair23@gmail.com wrote:
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
> > v7:
> >   - Use read_sock_cmsg instead of recvmsg() to handle KeyUpdate
> > v6:
> >   - Don't use `struct nvme_tcp_hdr` to determine TLS_HANDSHAKE_KEYUPDAT=
E,
> >     instead look at the cmsg fields.
> >   - Don't flush async_event_work
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
> >   drivers/nvme/host/tcp.c | 59 ++++++++++++++++++++++++++++++++++++++++=
-
> >   1 file changed, 58 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> > index 8b6172dd1c0f..ade11d2ac9ef 100644
> > --- a/drivers/nvme/host/tcp.c
> > +++ b/drivers/nvme/host/tcp.c
> > @@ -171,6 +171,7 @@ struct nvme_tcp_queue {
> >       bool                    tls_enabled;
> >       u32                     rcv_crc;
> >       u32                     snd_crc;
> > +     key_serial_t            handshake_session_id;
> >       __le32                  exp_ddgst;
> >       __le32                  recv_ddgst;
> >       struct completion       tls_complete;
> > @@ -1361,6 +1362,59 @@ static int nvme_tcp_try_send(struct nvme_tcp_que=
ue *queue)
> >       return ret;
> >   }
> >
> > +static void update_tls_keys(struct nvme_tcp_queue *queue)
> > +{
> > +     int qid =3D nvme_tcp_queue_id(queue);
> > +     int ret;
> > +
> > +     dev_dbg(queue->ctrl->ctrl.device,
> > +             "updating key for queue %d\n", qid);
> > +
> > +     ret =3D nvme_tcp_start_tls(&(queue->ctrl->ctrl),
> > +                              queue, queue->ctrl->ctrl.tls_pskid,
> > +                              HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED);
> > +
> > +     if (ret < 0) {
> > +             dev_err(queue->ctrl->ctrl.device,
> > +                     "failed to update the keys %d\n", ret);
> > +             nvme_tcp_fail_request(queue->request);
> > +     }
> > +}
> > +
> > +static int nvme_tcp_recv_cmsg(read_descriptor_t *desc,
> > +                           struct sk_buff *skb,
> > +                           unsigned int offset, size_t len,
> > +                           u8 content_type)
> > +{
> > +     struct nvme_tcp_queue *queue =3D desc->arg.data;
> > +     struct socket *sock =3D queue->sock;
> > +     struct sock *sk =3D sock->sk;
> > +
> > +     switch (content_type) {
> > +     case TLS_RECORD_TYPE_HANDSHAKE:
> > +             if (len =3D=3D 5) {
> > +                     u8 header[5];
> > +
> > +                     if (!skb_copy_bits(skb, offset, header,
> > +                                        sizeof(header))) {
> > +                             if (header[0] =3D=3D TLS_HANDSHAKE_KEYUPD=
ATE) {
> > +                                     dev_err(queue->ctrl->ctrl.device,=
 "KeyUpdate message\n");
> > +                                     release_sock(sk);
> > +                                     update_tls_keys(queue);
> > +                                     lock_sock(sk);
> > +                                     return 0;
> > +                             }
> > +                     }
> > +             }
> > +
> > +             break;
> > +     default:
> > +             break;
> > +     }
>
> I think a simple 'if' condition would be sufficient here, or do you have
> handling of other TLS record types queued somewhere?
> And we should log unhandled TLS records.

I like this approach as it makes it really easy to handle more types
in the future. I don't have any more record types queued anywhere so I
can change it to an if statement.

Good point about logging unhandled records

Alistair

>
> > +
> > +     return -EAGAIN;
> > +}
> > +
> >   static int nvme_tcp_try_recv(struct nvme_tcp_queue *queue)
> >   {
> >       struct socket *sock =3D queue->sock;
> > @@ -1372,7 +1426,8 @@ static int nvme_tcp_try_recv(struct nvme_tcp_queu=
e *queue)
> >       rd_desc.count =3D 1;
> >       lock_sock(sk);
> >       queue->nr_cqe =3D 0;
> > -     consumed =3D sock->ops->read_sock(sk, &rd_desc, nvme_tcp_recv_skb=
);
> > +     consumed =3D sock->ops->read_sock_cmsg(sk, &rd_desc, nvme_tcp_rec=
v_skb,
> > +                                          nvme_tcp_recv_cmsg);
> >       release_sock(sk);
> >       return consumed =3D=3D -EAGAIN ? 0 : consumed;
> >   }
> > @@ -1708,6 +1763,7 @@ static void nvme_tcp_tls_done(void *data, int sta=
tus, key_serial_t pskid,
> >                       ctrl->ctrl.tls_pskid =3D key_serial(tls_key);
> >               key_put(tls_key);
> >               queue->tls_err =3D 0;
> > +             queue->handshake_session_id =3D handshake_session_id;
> >       }
> >
> >   out_complete:
> > @@ -1737,6 +1793,7 @@ static int nvme_tcp_start_tls(struct nvme_ctrl *n=
ctrl,
> >               keyring =3D key_serial(nctrl->opts->keyring);
> >       args.ta_keyring =3D keyring;
> >       args.ta_timeout_ms =3D tls_handshake_timeout * 1000;
> > +     args.ta_handshake_session_id =3D queue->handshake_session_id;
> >       queue->tls_err =3D -EOPNOTSUPP;
> >       init_completion(&queue->tls_complete);
> >       if (keyupdate =3D=3D HANDSHAKE_KEY_UPDATE_TYPE_UNSPEC)
>
> Otherwise looks good.
>
> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), GF: I. Totev, A. McDonald, W. Knoblich

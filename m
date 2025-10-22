Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A972D73A8
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Oct 2025 04:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761108086; cv=none; b=XxqJWH1Nz3+j3iay4i8iNNVN9vxUq/S9HaBH9tujx11Q/BRFbTO5z83r/Z1MFyr4etdyvrMIFxSZMo+VshpwIGj/SzQUAO2/vtuu3hFZ5Hr6b5Lix4ENPa10UgSL+O+f1qw+R1/98YOnUSmcnr7glBYqYLx1NJqFUAnmuDlddRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761108086; c=relaxed/simple;
	bh=YI9XdeSqNw1PtqUxfjdv8/RUjGXVOhxD/W87lZ+RgMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmxFV3UnvVI95w/MCenvlbJusT50SHb04iQJT9doCJrZvhnYPSgr3vGm2XpUot6tNukXQQtbFIU30CRg+GaYsvpANwoN4fOlXtDqMfUjyELmVaTmlB7fWQjpHKU8zj99Vwhs5fUYXN1i6GS54nkel0AuXh4u2fTGMCUnbq9BhqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzIfu8tQ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzIfu8tQ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63c11011e01so10480843a12.2
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Oct 2025 21:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761108082; x=1761712882; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzIhtTke8e+w0UvoNy02RNiPIBjkvjFYUBf5hqrPq1k=;
        b=ZzIfu8tQ2+xLtJwL6b7Bv86V4eCzO+s/n8IhbQVu4Xh5gVHlB9A9335CCws+v6wrGe
         Mhui23hAFJK/YL1Yntl7Q8K0mOwHknUEukut6GmcD4bkEfRlPz9BsTNTnmRIHeJtZgcD
         q2/p2eAaT3HbXlvaSeurmooFADN+LTG+bMlV685t25JozZe89eviubUGs/FUShuFZkg6
         4xm59b/rhnfGILU4dkR3ee3dLW4aSdCdKVfWSzJ5gXF2oIDTD5XTFRC4MzE3YddRW8b5
         CRQrZ7pup75Tsih4Bv9+ilT4idhURdEHdXVZiMDaKr+w79ERvLZ1RYVo5uL3K1Ri9ftz
         zHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761108082; x=1761712882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzIhtTke8e+w0UvoNy02RNiPIBjkvjFYUBf5hqrPq1k=;
        b=rQEcrl+TkUZz6Pucgf/nWO9m7on/3wRAMnu34t3Ju+1AQT74TC8Np+b28ZDSulA1W7
         guk8lmvNE2cOFLOPf2o+DSl8/OLeJyyRfdzcfaOxQ7MzObQKM4CaGso7DEhNyvorxbi2
         +u/cTM3MtrYDA+A5d6U6wDJIRDxIdND8U0hQuCnFGBnjQN/ClBuHoFhxJd3k5cgcCZFk
         rG3esIddLJ/WfruM0WRJC8nH4qm8ia0H7jmbvZT3DuaE3wZA4Nw/vLDHvRER1pxAhlrh
         GjEhz3FjRDSPHLIMzqyje8yGJrdw29OUbEleykTtNAQzDhGh2pW5qHjZMU8Hvb9earh8
         Tyxg==
X-Forwarded-Encrypted: i=1; AJvYcCVX5yvWeOhkDsW7EN/GIUz16YoXsJOqXlIn1YF7fzBKqzuCo2uf2TdMm+lJP8JIPXuL68kDj3a0cNNfg3EU3YXNn0LTNA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+Rta22nv42W4QouEM6OMbQ6burzFNP+bXm/pE6gM/8AIOBiZJ
	KJczDk9vdwr0pUi/fHH3B7WUSazpUcX03W+7bnUuOwy7ei1aa3k45h8WBN9Io9Re8G8/bDqhIQX
	yjCLU/tcJf5+w6E9NeKtKJPHp3VQIJsY=
X-Gm-Gg: ASbGncsrYzjcGIc5L7E55kf7Gn9ZNn0pdJVHJCp24Mh3fbA4F+CI14cXOEvjQGGO7tU
	aWjtXZ3Ek9odoOOvmJqj7V70Pu0vrSp0ZrYPWol3b8sU8a8vtTx+SmTJyWgROed7TrtfAYUmo4v
	cWc8JYor8Wyogvt9OZCTJammRYwCM2aDEz42mpWc5gIbVNWO8O+tBoVQCwZAn7CPjEjbOmZQ8Ze
	0XJU2vLzYZileBuWNnZPZRmc0HuRd6MsZzBNllDCvAz8hB+AQ+YxqTDglpp2cUmgYz37TObCAt4
	sBm/Cdj1SevmRnA=
X-Google-Smtp-Source: AGHT+IFM79I+L2aLcKhyvnpbYsGDy6QnZNFX/8jnRvok9XdbcEQbMrJ8J6bVZm0CtpL1WBrjXN82qfUU0k6ZqC9LrEg=
X-Received: by 2002:a05:6402:5191:b0:63c:4f1e:6d82 with SMTP id
 4fb4d7f45d1cf-63c4f1e73acmr14921626a12.24.1761108082359; Tue, 21 Oct 2025
 21:41:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251017042312.1271322-1-alistair.francis@wdc.com>
 <20251017042312.1271322-5-alistair.francis@wdc.com> <e7d46c17-5ffd-4816-acd2-2125ca259d20@suse.de>
 <CAKmqyKMsYUPLz9hVmM_rjXKSo52cMEtn8qVwbSs=UknxRWaQUw@mail.gmail.com>
In-Reply-To: <CAKmqyKMsYUPLz9hVmM_rjXKSo52cMEtn8qVwbSs=UknxRWaQUw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 22 Oct 2025 14:40:55 +1000
X-Gm-Features: AS18NWDxX_HGaPlhwMFef4VjzTwZPMCk6IUmYygfFRuAXSRtLQyX_g3NHGGD5kk
Message-ID: <CAKmqyKNSV1GdipOrOs3csyoTMKX1+mxTgxnOq9xnb3vmRN0RgA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] net/handshake: Support KeyUpdate message types
To: Hannes Reinecke <hare@suse.de>
Cc: chuck.lever@oracle.com, hare@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org, kbusch@kernel.org, 
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 1:19=E2=80=AFPM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> On Mon, Oct 20, 2025 at 4:09=E2=80=AFPM Hannes Reinecke <hare@suse.de> wr=
ote:
> >
> > On 10/17/25 06:23, alistair23@gmail.com wrote:
> > > From: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > When reporting the msg-type to userspace let's also support reporting
> > > KeyUpdate events. This supports reporting a client/server event and i=
f
> > > the other side requested a KeyUpdateRequest.
> > >
> > > Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > > v4:
> > >   - Don't overload existing functions, instead create new ones
> > > v3:
> > >   - Fixup yamllint and kernel-doc failures
> > >
> > >   Documentation/netlink/specs/handshake.yaml | 16 ++++-
> > >   drivers/nvme/host/tcp.c                    | 15 +++-
> > >   drivers/nvme/target/tcp.c                  | 10 ++-
> > >   include/net/handshake.h                    |  8 +++
> > >   include/uapi/linux/handshake.h             | 13 ++++
> > >   net/handshake/tlshd.c                      | 83 +++++++++++++++++++=
++-
> > >   6 files changed, 137 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/Documentation/netlink/specs/handshake.yaml b/Documentati=
on/netlink/specs/handshake.yaml
> > > index a273bc74d26f..c72ec8fa7d7a 100644
> > > --- a/Documentation/netlink/specs/handshake.yaml
> > > +++ b/Documentation/netlink/specs/handshake.yaml
> > > @@ -21,12 +21,18 @@ definitions:
> > >       type: enum
> > >       name: msg-type
> > >       value-start: 0
> > > -    entries: [unspec, clienthello, serverhello]
> > > +    entries: [unspec, clienthello, serverhello, clientkeyupdate,
> > > +              clientkeyupdaterequest, serverkeyupdate, serverkeyupda=
terequest]
> > >     -
> >
> > Why do we need the 'keyupdate' and 'keyupdaterequest' types?
>
> msg-type indicates if it's a client or server and hello or keyupdate,
> the idea being
>
> client:
>  - Hello
>  - KeyUpdate
>
> server:
>  - Hello
>  - KeyUpdate
>
> I'll drop clientkeyupdaterequest and serverkeyupdaterequest
>
> > Isn't the 'keyupdate' type enough, and can we specify anything
> > else via the update type?
>
> Once we know if it's a client or server KeyUpdate we need to know if
> we are receiving one, sending one or receiving one with the
> request_update flag set, hence key-update-type
>
> >
> > >       type: enum
> > >       name: auth
> > >       value-start: 0
> > >       entries: [unspec, unauth, psk, x509]
> > > +  -
> > > +    type: enum
> > > +    name: key-update-type
> > > +    value-start: 0
> > > +    entries: [unspec, send, received, received_request_update]
> >
> > See above.
> >
> > >
> > >   attribute-sets:
> > >     -
> > > @@ -74,6 +80,13 @@ attribute-sets:
> > >         -
> > >           name: keyring
> > >           type: u32
> > > +      -
> > > +        name: key-update-request
> > > +        type: u32
> > > +        enum: key-update-type
> > > +      -
> > > +        name: key-serial
> > > +        type: u32
> >
> > Not sure if I like key-serial. Yes, it is a key serial number,
> > but it's not the serial number of the updated key (rather the serial
> > number of the key holding the session information).
> > Maybe 'key-update-serial' ?
> >
> > >     -
> > >       name: done
> > >       attributes:
> > > @@ -116,6 +129,7 @@ operations:
> > >               - certificate
> > >               - peername
> > >               - keyring
> > > +            - key-serial
> > >       -
> > >         name: done
> > >         doc: Handler reports handshake completion
> > > diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> > > index 611be56f8013..2696bf97dfac 100644
> > > --- a/drivers/nvme/host/tcp.c
> > > +++ b/drivers/nvme/host/tcp.c
> > > @@ -20,6 +20,7 @@
> > >   #include <linux/iov_iter.h>
> > >   #include <net/busy_poll.h>
> > >   #include <trace/events/sock.h>
> > > +#include <uapi/linux/handshake.h>
> > >
> > >   #include "nvme.h"
> > >   #include "fabrics.h"
> > > @@ -206,6 +207,10 @@ static struct workqueue_struct *nvme_tcp_wq;
> > >   static const struct blk_mq_ops nvme_tcp_mq_ops;
> > >   static const struct blk_mq_ops nvme_tcp_admin_mq_ops;
> > >   static int nvme_tcp_try_send(struct nvme_tcp_queue *queue);
> > > +static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
> > > +                           struct nvme_tcp_queue *queue,
> > > +                           key_serial_t pskid,
> > > +                           handshake_key_update_type keyupdate);
> > >
> > >   static inline struct nvme_tcp_ctrl *to_tcp_ctrl(struct nvme_ctrl *c=
trl)
> > >   {
> > > @@ -1726,7 +1731,8 @@ static void nvme_tcp_tls_done(void *data, int s=
tatus, key_serial_t pskid,
> > >
> > >   static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
> > >                             struct nvme_tcp_queue *queue,
> > > -                           key_serial_t pskid)
> > > +                           key_serial_t pskid,
> > > +                           handshake_key_update_type keyupdate)
> > >   {
> > >       int qid =3D nvme_tcp_queue_id(queue);
> > >       int ret;
> > > @@ -1748,7 +1754,10 @@ static int nvme_tcp_start_tls(struct nvme_ctrl=
 *nctrl,
> > >       args.ta_timeout_ms =3D tls_handshake_timeout * 1000;
> > >       queue->tls_err =3D -EOPNOTSUPP;
> > >       init_completion(&queue->tls_complete);
> > > -     ret =3D tls_client_hello_psk(&args, GFP_KERNEL);
> > > +     if (keyupdate =3D=3D HANDSHAKE_KEY_UPDATE_TYPE_UNSPEC)
> > > +             ret =3D tls_client_hello_psk(&args, GFP_KERNEL);
> > > +     else
> > > +             ret =3D tls_client_keyupdate_psk(&args, GFP_KERNEL, key=
update);
> > >       if (ret) {
> > >               dev_err(nctrl->device, "queue %d: failed to start TLS: =
%d\n",
> > >                       qid, ret);
> > > @@ -1898,7 +1907,7 @@ static int nvme_tcp_alloc_queue(struct nvme_ctr=
l *nctrl, int qid,
> > >
> > >       /* If PSKs are configured try to start TLS */
> > >       if (nvme_tcp_tls_configured(nctrl) && pskid) {
> > > -             ret =3D nvme_tcp_start_tls(nctrl, queue, pskid);
> > > +             ret =3D nvme_tcp_start_tls(nctrl, queue, pskid, HANDSHA=
KE_KEY_UPDATE_TYPE_UNSPEC);
> > >               if (ret)
> > >                       goto err_init_connect;
> > >       }
> > > diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
> > > index 4ef4dd140ada..8aeec4a7f136 100644
> > > --- a/drivers/nvme/target/tcp.c
> > > +++ b/drivers/nvme/target/tcp.c
> > > @@ -1833,7 +1833,8 @@ static void nvmet_tcp_tls_handshake_timeout(str=
uct work_struct *w)
> > >       kref_put(&queue->kref, nvmet_tcp_release_queue);
> > >   }
> > >
> > > -static int nvmet_tcp_tls_handshake(struct nvmet_tcp_queue *queue)
> > > +static int nvmet_tcp_tls_handshake(struct nvmet_tcp_queue *queue,
> > > +     handshake_key_update_type keyupdate)
> > >   {
> > >       int ret =3D -EOPNOTSUPP;
> > >       struct tls_handshake_args args;
> > > @@ -1852,7 +1853,10 @@ static int nvmet_tcp_tls_handshake(struct nvme=
t_tcp_queue *queue)
> > >       args.ta_keyring =3D key_serial(queue->port->nport->keyring);
> > >       args.ta_timeout_ms =3D tls_handshake_timeout * 1000;
> > >
> > > -     ret =3D tls_server_hello_psk(&args, GFP_KERNEL);
> > > +     if (keyupdate =3D=3D HANDSHAKE_KEY_UPDATE_TYPE_UNSPEC)
> > > +             ret =3D tls_server_hello_psk(&args, GFP_KERNEL);
> > > +     else
> > > +             ret =3D tls_server_keyupdate_psk(&args, GFP_KERNEL, key=
update);
> > >       if (ret) {
> > >               kref_put(&queue->kref, nvmet_tcp_release_queue);
> > >               pr_err("failed to start TLS, err=3D%d\n", ret);
> > > @@ -1934,7 +1938,7 @@ static void nvmet_tcp_alloc_queue(struct nvmet_=
tcp_port *port,
> > >               sk->sk_data_ready =3D port->data_ready;
> > >               write_unlock_bh(&sk->sk_callback_lock);
> > >               if (!nvmet_tcp_try_peek_pdu(queue)) {
> > > -                     if (!nvmet_tcp_tls_handshake(queue))
> > > +                     if (!nvmet_tcp_tls_handshake(queue, HANDSHAKE_K=
EY_UPDATE_TYPE_UNSPEC))
> > >                               return;
> > >                       /* TLS handshake failed, terminate the connecti=
on */
> > >                       goto out_destroy_sq;
> > > diff --git a/include/net/handshake.h b/include/net/handshake.h
> > > index dc2222fd6d99..084c92a20b68 100644
> > > --- a/include/net/handshake.h
> > > +++ b/include/net/handshake.h
> > > @@ -10,6 +10,10 @@
> > >   #ifndef _NET_HANDSHAKE_H
> > >   #define _NET_HANDSHAKE_H
> > >
> > > +#include <uapi/linux/handshake.h>
> > > +
> > > +#define handshake_key_update_type u32
> > > +
> > Huh?
> > You define it as 'u32' here
> >
> > >   enum {
> > >       TLS_NO_KEYRING =3D 0,
> > >       TLS_NO_PEERID =3D 0,
> > > @@ -38,8 +42,12 @@ struct tls_handshake_args {
> > >   int tls_client_hello_anon(const struct tls_handshake_args *args, gf=
p_t flags);
> > >   int tls_client_hello_x509(const struct tls_handshake_args *args, gf=
p_t flags);
> > >   int tls_client_hello_psk(const struct tls_handshake_args *args, gfp=
_t flags);
> > > +int tls_client_keyupdate_psk(const struct tls_handshake_args *args, =
gfp_t flags,
> > > +                          handshake_key_update_type keyupdate);
> > >   int tls_server_hello_x509(const struct tls_handshake_args *args, gf=
p_t flags);
> > >   int tls_server_hello_psk(const struct tls_handshake_args *args, gfp=
_t flags);
> > > +int tls_server_keyupdate_psk(const struct tls_handshake_args *args, =
gfp_t flags,
> > > +                          handshake_key_update_type keyupdate);
> > >
> > >   bool tls_handshake_cancel(struct sock *sk);
> > >   void tls_handshake_close(struct socket *sock);
> > > diff --git a/include/uapi/linux/handshake.h b/include/uapi/linux/hand=
shake.h
> > > index b68ffbaa5f31..b691530073c6 100644
> > > --- a/include/uapi/linux/handshake.h
> > > +++ b/include/uapi/linux/handshake.h
> > > @@ -19,6 +19,10 @@ enum handshake_msg_type {
> > >       HANDSHAKE_MSG_TYPE_UNSPEC,
> > >       HANDSHAKE_MSG_TYPE_CLIENTHELLO,
> > >       HANDSHAKE_MSG_TYPE_SERVERHELLO,
> > > +     HANDSHAKE_MSG_TYPE_CLIENTKEYUPDATE,
> > > +     HANDSHAKE_MSG_TYPE_CLIENTKEYUPDATEREQUEST,
> > > +     HANDSHAKE_MSG_TYPE_SERVERKEYUPDATE,
> > > +     HANDSHAKE_MSG_TYPE_SERVERKEYUPDATEREQUEST,
> > >   };
> > >
> > >   enum handshake_auth {
> > > @@ -28,6 +32,13 @@ enum handshake_auth {
> > >       HANDSHAKE_AUTH_X509,
> > >   };
> > >
> > > +enum handshake_key_update_type {
> > > +     HANDSHAKE_KEY_UPDATE_TYPE_UNSPEC,
> > > +     HANDSHAKE_KEY_UPDATE_TYPE_SEND,
> > > +     HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED,
> > > +     HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED_REQUEST_UPDATE,
> > > +};
> > > +
> >
> > and here it's an enum. Please kill the first declaration.
> >
> > >   enum {
> > >       HANDSHAKE_A_X509_CERT =3D 1,
> > >       HANDSHAKE_A_X509_PRIVKEY,
> > > @@ -46,6 +57,8 @@ enum {
> > >       HANDSHAKE_A_ACCEPT_CERTIFICATE,
> > >       HANDSHAKE_A_ACCEPT_PEERNAME,
> > >       HANDSHAKE_A_ACCEPT_KEYRING,
> > > +     HANDSHAKE_A_ACCEPT_KEY_UPDATE_REQUEST,
> > > +     HANDSHAKE_A_ACCEPT_KEY_SERIAL,
> > >
> > >       __HANDSHAKE_A_ACCEPT_MAX,
> > >       HANDSHAKE_A_ACCEPT_MAX =3D (__HANDSHAKE_A_ACCEPT_MAX - 1)
> > > diff --git a/net/handshake/tlshd.c b/net/handshake/tlshd.c
> > > index 2549c5dbccd8..c40839977ab9 100644
> > > --- a/net/handshake/tlshd.c
> > > +++ b/net/handshake/tlshd.c
> > > @@ -41,6 +41,7 @@ struct tls_handshake_req {
> > >       unsigned int            th_num_peerids;
> > >       key_serial_t            th_peerid[5];
> > >
> > > +     int                     th_key_update_request;
> > >       key_serial_t            user_session_id;
> > >   };
> > >
> > Why 'int' ? Can it be negative?
> > If not please make it an 'unsigned int'
> >
> > > @@ -58,7 +59,8 @@ tls_handshake_req_init(struct handshake_req *req,
> > >       treq->th_num_peerids =3D 0;
> > >       treq->th_certificate =3D TLS_NO_CERT;
> > >       treq->th_privkey =3D TLS_NO_PRIVKEY;
> > > -     treq->user_session_id =3D TLS_NO_PRIVKEY;
> > > +     treq->user_session_id =3D args->user_session_id;
> > > +
> > >       return treq;
> > >   }
> > >
> > > @@ -265,6 +267,16 @@ static int tls_handshake_accept(struct handshake=
_req *req,
> > >               break;
> > >       }
> > >
> > > +     ret =3D nla_put_u32(msg, HANDSHAKE_A_ACCEPT_KEY_SERIAL,
> > > +                       treq->user_session_id);
> > > +     if (ret < 0)
> > > +             goto out_cancel;
> > > +
> > > +     ret =3D nla_put_u32(msg, HANDSHAKE_A_ACCEPT_KEY_UPDATE_REQUEST,
> > > +                       treq->th_key_update_request);
> > > +     if (ret < 0)
> > > +             goto out_cancel;
> > > +
> > >       genlmsg_end(msg, hdr);
> > >       return genlmsg_reply(msg, info);
> > >
> > > @@ -372,6 +384,44 @@ int tls_client_hello_psk(const struct tls_handsh=
ake_args *args, gfp_t flags)
> > >   }
> > >   EXPORT_SYMBOL(tls_client_hello_psk);
> > >
> > > +/**
> > > + * tls_client_keyupdate_psk - request a PSK-based TLS handshake on a=
 socket
> > > + * @args: socket and handshake parameters for this request
> > > + * @flags: memory allocation control flags
> > > + * @keyupdate: specifies the type of KeyUpdate operation
> > > + *
> > > + * Return values:
> > > + *   %0: Handshake request enqueue; ->done will be called when compl=
ete
> > > + *   %-EINVAL: Wrong number of local peer IDs
> > > + *   %-ESRCH: No user agent is available
> > > + *   %-ENOMEM: Memory allocation failed
> > > + */
> > > +int tls_client_keyupdate_psk(const struct tls_handshake_args *args, =
gfp_t flags,
> > > +                          handshake_key_update_type keyupdate)
> > > +{
> > > +     struct tls_handshake_req *treq;
> > > +     struct handshake_req *req;
> > > +     unsigned int i;
> > > +
> > > +     if (!args->ta_num_peerids ||
> > > +         args->ta_num_peerids > ARRAY_SIZE(treq->th_peerid))
> > > +             return -EINVAL;
> > > +
> > > +     req =3D handshake_req_alloc(&tls_handshake_proto, flags);
> > > +     if (!req)
> > > +             return -ENOMEM;
> > > +     treq =3D tls_handshake_req_init(req, args);
> > > +     treq->th_type =3D HANDSHAKE_MSG_TYPE_CLIENTKEYUPDATE;
> > > +     treq->th_key_update_request =3D keyupdate;
> > > +     treq->th_auth_mode =3D HANDSHAKE_AUTH_PSK;
> > > +     treq->th_num_peerids =3D args->ta_num_peerids;
> > > +     for (i =3D 0; i < args->ta_num_peerids; i++)
> > > +             treq->th_peerid[i] =3D args->ta_my_peerids[i];
> > Hmm?
> > Do we use the 'peerids'?
>
> We don't, this is just copied from the
> tls_client_hello_psk()/tls_server_hello_psk() to provide the same
> information to keep things more consistent.
>
> I can remove setting these

Actually, ktls-utils (tlshd) expects these to be set, so I think we
should leave them as is

Alistair

>
> > I thought that the information was encoded in the session, ie
> > the 'user_session_id' ?
> >
> > > +
> > > +     return handshake_req_submit(args->ta_sock, req, flags);
> > > +}
> > > +EXPORT_SYMBOL(tls_client_keyupdate_psk);
> > > +
> > >   /**
> > >    * tls_server_hello_x509 - request a server TLS handshake on a sock=
et
> > >    * @args: socket and handshake parameters for this request
> > > @@ -428,6 +478,37 @@ int tls_server_hello_psk(const struct tls_handsh=
ake_args *args, gfp_t flags)
> > >   }
> > >   EXPORT_SYMBOL(tls_server_hello_psk);
> > >
> > > +/**
> > > + * tls_server_keyupdate_psk - request a server TLS KeyUpdate on a so=
cket
> > > + * @args: socket and handshake parameters for this request
> > > + * @flags: memory allocation control flags
> > > + * @keyupdate: specifies the type of KeyUpdate operation
> > > + *
> > > + * Return values:
> > > + *   %0: Handshake request enqueue; ->done will be called when compl=
ete
> > > + *   %-ESRCH: No user agent is available
> > > + *   %-ENOMEM: Memory allocation failed
> > > + */
> > > +int tls_server_keyupdate_psk(const struct tls_handshake_args *args, =
gfp_t flags,
> > > +                          handshake_key_update_type keyupdate)
> > > +{
> > > +     struct tls_handshake_req *treq;
> > > +     struct handshake_req *req;
> > > +
> > > +     req =3D handshake_req_alloc(&tls_handshake_proto, flags);
> > > +     if (!req)
> > > +             return -ENOMEM;
> > > +     treq =3D tls_handshake_req_init(req, args);
> > > +     treq->th_type =3D HANDSHAKE_MSG_TYPE_SERVERKEYUPDATE;
> > > +     treq->th_key_update_request =3D keyupdate;
> > > +     treq->th_auth_mode =3D HANDSHAKE_AUTH_PSK;
> > > +     treq->th_num_peerids =3D 1;
> > > +     treq->th_peerid[0] =3D args->ta_my_peerids[0];
> >
> > Same here. Why do we need to set 'peerid'?
> >
> > > +
> > > +     return handshake_req_submit(args->ta_sock, req, flags);
> > > +}
> > > +EXPORT_SYMBOL(tls_server_keyupdate_psk);
> > > +
> > >   /**
> > >    * tls_handshake_cancel - cancel a pending handshake
> > >    * @sk: socket on which there is an ongoing handshake
> > Nit: we _could_ overload 'peerid' with the user_session_id,then we
> > wouldn't need to specify a new field in the handshake
> > request.
> > But that's arguably quite hackish.
>
> Oh no! Let's not do that. That just seems prone to confusion
>
> Alistair
>
> >
> > Cheers,
> >
> > Hannes
> > --
> > Dr. Hannes Reinecke                  Kernel Storage Architect
> > hare@suse.de                                +49 911 74053 688
> > SUSE Software Solutions GmbH, Frankenstr. 146, 90461 N=C3=BCrnberg
> > HRB 36809 (AG N=C3=BCrnberg), GF: I. Totev, A. McDonald, W. Knoblich

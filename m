Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDC32E88B3
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 23 Aug 2025 17:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755969306; cv=none; b=oUY8UCp2N7+ytsIYnJklquxrPWs/1W9OokBQu8g7tRmOM89hh/tcwsABWVQCLDJO65X7batg9+2Z/cVpOVpzhdpekOXnE0KsiFhlfnjKc0pTxi02RF2uPVLSPipRcKSVn4hPZHO71QO3o7tBo5e50eh+0HiEl06P0VcBhgvCGv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755969306; c=relaxed/simple;
	bh=yDe7hDySMaZGpv1baBEFaoWjOj3aJqWGkq3a+aCG+I0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qo2mBGZTxN0UvyeTIdifrFY82gsvN4gvoSCZHma7Q6B1oYYDwjlfPhtqZ2ssY3RzpQM3Ji/ivjSWuK/CTBiTry5hbSaKoGlnhIIPuENEDfA9qp89ngvs73mx9iFLIrSVvzEC+z+3ZXs7mqeJ4Ssl15SLE5Esq9ii34NGVALNR9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnmioMct; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnmioMct"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-88432d8fdd6so131035339f.1
        for <kernel-tls-handshake@lists.linux.dev>; Sat, 23 Aug 2025 10:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755969303; x=1756574103; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJ6tl0HRZGVw+DtKJ88xepQUFkA4pPwirEcrrHApF1A=;
        b=LnmioMctwrwwraGx3ilSwZhvI262AnyoVMBX6zZTMTOm3HR2TuZmVvRnj51M4Uedfu
         FjmqKjmT9g6A6kAMLtagD2iLiyfwmatOdVa7XisU3mIlAoCAe+GCQMPnaqkypsQO7G22
         K4oiSYWlAdNEDxXZ2Nn2qDNyNyilf290JZ0eJQIlzSq3vbjEUHiWoXVX6qNFEs32jxwD
         p0g684WyzJobteUSLKfwaJosRazw/BnEN+Cd9Cn5Q9KlGe6E82+Y6Bxe+2jVpbmpxvMT
         VcZZRPPy/bKaeSoZ4huQWXRtEToOuFuE0vARHUx68+gtFS+SQQaoNPV04y2H8k+48O18
         jrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755969303; x=1756574103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJ6tl0HRZGVw+DtKJ88xepQUFkA4pPwirEcrrHApF1A=;
        b=ha/LLezEDikC/3EhFfTBVER3B8YcUjxMcYOHJMzNiZz45Cbbj5hzp1ij6wLXVhr/Hg
         7Y5kK1XcivjglmeFVjdWoh+HhUeFm3NhaVSAtbFlwUdhftpLQQrPAisDboSJhHFGmEaF
         echY/Ys4e9AcIGiV/zJIYFXDsrDEKfJ3yl3Lu4tR65fOVeXzwUP1Ae2GxvGbu7onASuO
         g35pbPXtxgqS74o3mUrZeK0jJpgKYupz/Emib04NQHDD3Kwnq/I/oqw7Z2AO//f7msxS
         g0P3+TW3uD6XWSVJv7j+1cxjNPs9DWlmxlu+J/IrzVLgTdxevwU3oI3Ny3ceC8MtLNMl
         lNvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuYl8zwwUDcpRTz0E1wgFENrgCDOJZBOXxNrMsHgle0/gGE5syBdl6RwWvIPrDt0URCptVy0sijYs0JUur7738VW5JJg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSMXWtqC3fIpHOcGC44QUQqGsVRynXS664dSFFpX985EPYbCIp
	I5G/Z1xGG7g28MMOGq5gRFZkK4gYtXcXApA7fYcCm7lgKFeKv9uFTPpAQcYu61ncNEq5ng/C6Xv
	JUYD7KsaACBYNAofMel25tFHQ+uHvQx8=
X-Gm-Gg: ASbGncvssvVkaRwqQaYGTT7uakutr4zTtouC6ytJzjaGqTTcS1B4W+1eQC/Gf7lnK0w
	QV0w7tBXc49R8LSw7Gc68Gk/iI5yvnr3++Eo5jcjvujwCLqW+y6lbsnWi/PSyom7KZ4Sv7YMjh0
	cgxLk1Wu2sWxq81QT7mPrLULT6zS7gWw/NvZyWpmh0xaklJBSLty4M1ciZX7un71WZGhJn3sCHS
	+ItlIH42A==
X-Google-Smtp-Source: AGHT+IGWe3biqACxNyBEasEPIdZ9WjwnV54hW61yc7tli7uVlkQwhK/yX89E5v1l8gwXb0ZUomqDYX3PjWoqHn3k/ds=
X-Received: by 2002:a05:6602:2c0b:b0:884:e57:9f1 with SMTP id
 ca18e2360f4ac-886bd11876cmr1023225339f.2.1755969303277; Sat, 23 Aug 2025
 10:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1755525878.git.lucien.xin@gmail.com> <a2cd3192c7f301a7370c223d23c9deefecda8a22.1755525878.git.lucien.xin@gmail.com>
 <a79bfa8b-657f-4358-99f3-2774eb65d49f@redhat.com>
In-Reply-To: <a79bfa8b-657f-4358-99f3-2774eb65d49f@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Sat, 23 Aug 2025 13:14:52 -0400
X-Gm-Features: Ac12FXy36JbwqXuESZTY9ZKPcKijvmgAIDoPn_vP0QzuMZE9XYz3yJsKX2AKM0s
Message-ID: <CADvbK_dJoCa5t3OA61gJtMkq1uG7C77MEMwz9XXm_HLc4FgHWA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 06/15] quic: add stream management
To: Paolo Abeni <pabeni@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, davem@davemloft.net, kuba@kernel.org, 
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Benjamin Coddington <bcodding@redhat.com>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 9:43=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 8/18/25 4:04 PM, Xin Long wrote:
> > +/* Check if a stream ID is valid for sending. */
> > +static bool quic_stream_id_send(s64 stream_id, bool is_serv)
> > +{
> > +     u8 type =3D (stream_id & QUIC_STREAM_TYPE_MASK);
> > +
> > +     if (is_serv) {
> > +             if (type =3D=3D QUIC_STREAM_TYPE_CLIENT_UNI)
> > +                     return false;
> > +     } else if (type =3D=3D QUIC_STREAM_TYPE_SERVER_UNI) {
> > +             return false;
> > +     }
> > +     return true;
> > +}
> > +
> > +/* Check if a stream ID is valid for receiving. */
> > +static bool quic_stream_id_recv(s64 stream_id, bool is_serv)
> > +{
> > +     u8 type =3D (stream_id & QUIC_STREAM_TYPE_MASK);
> > +
> > +     if (is_serv) {
> > +             if (type =3D=3D QUIC_STREAM_TYPE_SERVER_UNI)
> > +                     return false;
> > +     } else if (type =3D=3D QUIC_STREAM_TYPE_CLIENT_UNI) {
> > +             return false;
> > +     }
> > +     return true;
> > +}
>
> The above two functions could be implemented using a common helper
> saving some code duplication.
Not yet sure if it's worth a helper, I need to think about it.

>
> > +/* Create and register new streams for sending. */
> > +static struct quic_stream *quic_stream_send_create(struct quic_stream_=
table *streams,
> > +                                                s64 max_stream_id, u8 =
is_serv)
> > +{
> > +     struct quic_stream *stream;
> > +     s64 stream_id;
> > +
> > +     stream_id =3D streams->send.next_bidi_stream_id;
> > +     if (quic_stream_id_uni(max_stream_id))
> > +             stream_id =3D streams->send.next_uni_stream_id;
> > +
> > +     /* rfc9000#section-2.1: A stream ID that is used out of order res=
ults in all streams
> > +      * of that type with lower-numbered stream IDs also being opened.
> > +      */
> > +     while (stream_id <=3D max_stream_id) {
>
> Is wrap around thererically possible?
> Who provided `max_stream_id`, the user-space? or a remote pear? what if
> max_stream_id - stream_id is say 1M ?
There are two values limiting this:

1. streams->send.max_uni/bidi_stream_id:
the max_uni/bidi_stream_id that peer informs to be open.

2. streams->send.max_streams_uni/bidi (max value: QUIC_MAX_STREAMS(4096)):
to limit the number of the existing streams.

>
> [...]
> > +/* Check if a receive stream ID is already closed. */
> > +static bool quic_stream_id_recv_closed(struct quic_stream_table *strea=
ms, s64 stream_id)
> > +{
> > +     if (quic_stream_id_uni(stream_id)) {
> > +             if (stream_id < streams->recv.next_uni_stream_id)
> > +                     return true;
> > +     } else {
> > +             if (stream_id < streams->recv.next_bidi_stream_id)
> > +                     return true;
> > +     }
> > +     return false;
> > +}
>
> I guess the above answer my previous questions, but I think that memory
> accounting for stream allocation is still deserverd.
>
I can give it a try. sk_r/wmem_schedule() should be used for this I suppose=
.

> > +
> > +/* Check if a receive stream ID exceeds would exceed local's limits. *=
/
> > +static bool quic_stream_id_recv_exceeds(struct quic_stream_table *stre=
ams, s64 stream_id)
> > +{
> > +     if (quic_stream_id_uni(stream_id)) {
> > +             if (stream_id > streams->recv.max_uni_stream_id)
> > +                     return true;
> > +     } else {
> > +             if (stream_id > streams->recv.max_bidi_stream_id)
> > +                     return true;
> > +     }
> > +     return false;
> > +}
> > +
> > +/* Check if a send stream ID would exceed peer's limits. */
> > +bool quic_stream_id_send_exceeds(struct quic_stream_table *streams, s6=
4 stream_id)
> > +{
> > +     u64 nstreams;
> > +
> > +     if (quic_stream_id_uni(stream_id)) {
> > +             if (stream_id > streams->send.max_uni_stream_id)
> > +                     return true;
> > +     } else {
> > +             if (stream_id > streams->send.max_bidi_stream_id)
> > +                     return true;
> > +     }
> > +
> > +     if (quic_stream_id_uni(stream_id)) {
> > +             stream_id -=3D streams->send.next_uni_stream_id;
> > +             nstreams =3D quic_stream_id_to_streams(stream_id);
> > +             if (nstreams + streams->send.streams_uni > streams->send.=
max_streams_uni)
> > +                     return true;
> > +     } else {
> > +             stream_id -=3D streams->send.next_bidi_stream_id;
> > +             nstreams =3D quic_stream_id_to_streams(stream_id);
> > +             if (nstreams + streams->send.streams_bidi > streams->send=
.max_streams_bidi)
> > +                     return true;
> > +     }
> > +     return false;
> > +}
> > +
> > +/* Get or create a send stream by ID. */
> > +struct quic_stream *quic_stream_send_get(struct quic_stream_table *str=
eams, s64 stream_id,
> > +                                      u32 flags, bool is_serv)
> > +{
> > +     struct quic_stream *stream;
> > +
> > +     if (!quic_stream_id_send(stream_id, is_serv))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     stream =3D quic_stream_find(streams, stream_id);
> > +     if (stream) {
> > +             if ((flags & MSG_STREAM_NEW) &&
> > +                 stream->send.state !=3D QUIC_STREAM_SEND_STATE_READY)
> > +                     return ERR_PTR(-EINVAL);
> > +             return stream;
> > +     }
> > +
> > +     if (quic_stream_id_send_closed(streams, stream_id))
> > +             return ERR_PTR(-ENOSTR);
> > +
> > +     if (!(flags & MSG_STREAM_NEW))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     if (quic_stream_id_send_exceeds(streams, stream_id))
> > +             return ERR_PTR(-EAGAIN);
> > +
> > +     stream =3D quic_stream_send_create(streams, stream_id, is_serv);
> > +     if (!stream)
> > +             return ERR_PTR(-ENOSTR);
> > +     streams->send.active_stream_id =3D stream_id;
> > +     return stream;
>
> There is no locking at all in lookup/add/remove. Lacking the caller of
> such functions is hard to say if that is safe. You should add some info
> about that in the commit message (or lock here ;)
>
stream_hashtable is per connection/socket, it's always protected by
sock lock, I will add information into the commit message.

Thanks.

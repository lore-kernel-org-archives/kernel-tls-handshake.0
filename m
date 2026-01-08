Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D773F32F766
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  8 Jan 2026 20:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767904213; cv=none; b=NzZYAfsarJ+OvySU7AMtKH2Hb9FALimrgZuadNBuxubPIRS1VdPvrtuK1w/KYm8pbD2gA7HO6inJSLmio5mGTlu+Hj1SpNlQotRDsAvhinl8FpHYGGIoAnI8Mz8T1H882k3v3QNtOKjCX2sfz9E+pzYu0dqIXiqkGVEYkOXmgkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767904213; c=relaxed/simple;
	bh=+Qeg4iwRnJhGshuLoQ0hip2kddvArBWryH2l+yXMfDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZjjl262BAuUWSKnxB2LRjBWUqwZXmArXiXqnYV0r8UOMeRBc0LiKmVzdK6/F48auov+42W3qXuKP7+B8u/GG+d6ZYrEOWa7NkWO78j9yCzYCy/lUtl5rmzLDzjNneSpe5YznyqU7SmPqNMN9t9BbsxwG2uRcdQD2zxLe7VxDIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5ze7N80; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5ze7N80"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34c21417781so2595180a91.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 08 Jan 2026 12:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767904211; x=1768509011; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7f5sQo5jTkvuwoFmDFJSpZOLtNbc84M3KHSphocTY2A=;
        b=D5ze7N80vdNvb/xTetFH2tg6OL4SqbnkU6lzWqHkC+t7zLNVBWyAVCE9NpkfPmpBoi
         e+/FxcLISnTERAg/ojTG11GygAeuZ1LKMoH7kLlaNNh4KGTx/DVcl/nfQoMlFP5WyAsa
         Qmaz8gu8QAWDCM24Qh1KkmuVtqFMWtKgk7Kh7tO3/DyBqda4EpYBndM4ZXHkB4SMtDUg
         lzuh79VAa8YeKoFeik/oy0yd9Ch5lZxAPwctWRjI7lJsuQ1b4wFDT8v0aNnq14soXYmG
         G4jFAO7QI5A+inWh/M6wSrsDIr6JbcUWC3Q2zIaVdRLO/M9mkilnmjqhQuiZ/maXhS34
         uCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767904211; x=1768509011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7f5sQo5jTkvuwoFmDFJSpZOLtNbc84M3KHSphocTY2A=;
        b=bb9EfwqwW3e/Zg83DxXgrHmalVJveJxmL09nmaUrOvwG01efLYsjVXJQVI9s4ljjsa
         2UfhdEoVFvDh1O3V1g4Pxcl1ISlxK65R8NvdhoMN+00twHwJxxt/6pOdx9QcKHOz118S
         fkmXcE3xF+16onSV3iwv0xhkQ7a4jLraj/y5TRUhwqEUhjCwpvplrviSh0af4Ns/8XB4
         RfbAHNijLLQgRY0c3EFDsd0maPaznS3HBfOrZNJDE2Hqht87e0+iFxDmUgy/2/zfeysW
         J5hjrVEGuUfYNy/au4Ow+T5yLbyqbR+JaWA6EibuDgADK5yWBwlm1OeyoiwLMRfie1B6
         2/EA==
X-Forwarded-Encrypted: i=1; AJvYcCVl9jPjtIcpBuyMU48OQpkDZI33PoqwBrOXhdqUClBSnQmgprz9j9xgkvWVQhULZiuC74TxSlXsD4Tdi7fDDej++S5hHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzQEvKNw2Efw+WrPe/+diMMLH25giKb3ZN/cuMUaF+0lG/cba1
	NxkeSpPxaS4yrGWVvTF419IN/rsG940joWKg901vnfiiDe0uws3v71XSS27jSJyrUXcFwH2O7G1
	3dRLCOwn0dS+S/5InJzJ1360+tX6LWxc=
X-Gm-Gg: AY/fxX5fAZYWcVEMvPa3dLI0exWWaueoyc3ctG0n3AYOu2kl4nqx4Kv0pn/ywmMNAup
	IPoyFvSjMlphShKEDG8UhV3l0p4yCA1P8z5bIg1x4CM9fJam1GNPvhfyAyFLjjAy/5phnyZWHP+
	Sa7QAsFJRSFn1FYuyCOeIG3u3Z5wyPqh+/ASf8Y6O5Jeg2GsvqUORKb6SY1BSAS+OpAJLfHO1z/
	Q1S67PT0veBg7mwUsZBbeKSTTgKKGialC9wGdzl0PRCp2sT/g+iYnXOh4kL9/lTZunK1XY0TX16
	5PgCsJ5ngR59XbYzxfCTWaLX+rM9
X-Google-Smtp-Source: AGHT+IGbLC6cx1ApwiDReFzbSLNdOW7A6lCncS1m6eFQ/DG8qnCS8rcADr1cTXrjHejrOMh422vV1hu2v3pKca8FjV0=
X-Received: by 2002:a17:90b:2783:b0:340:c179:3666 with SMTP id
 98e67ed59e1d1-34f68c023dfmr6806900a91.8.1767904211135; Thu, 08 Jan 2026
 12:30:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1767621882.git.lucien.xin@gmail.com> <1e642f7c65ec53934bb05f95c5cf206648c7de9f.1767621882.git.lucien.xin@gmail.com>
 <5cb27e9f-ec01-4b50-b22c-dc8b027827bc@redhat.com>
In-Reply-To: <5cb27e9f-ec01-4b50-b22c-dc8b027827bc@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 8 Jan 2026 15:29:58 -0500
X-Gm-Features: AQt7F2piM-am5p0y4zg8EECj2AGre5rp6pGr0YwXe5OEXXnGdYkID72_rNecvvk
Message-ID: <CADvbK_eXRpT8n1B7p2-1T6eAZZ=4p7gQgJtMGBBQrHa036nyxw@mail.gmail.com>
Subject: Re: [PATCH net-next v6 06/16] quic: add stream management
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

On Thu, Jan 8, 2026 at 10:36=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 1/5/26 3:04 PM, Xin Long wrote:
> > +/* Create and register new streams for sending or receiving. */
> > +static struct quic_stream *quic_stream_create(struct quic_stream_table=
 *streams,
> > +                                           s64 max_stream_id, bool sen=
d, bool is_serv)
> > +{
> > +     struct quic_stream_limits *limits =3D &streams->send;
> > +     struct quic_stream *stream =3D NULL;
> > +     gfp_t gfp =3D GFP_KERNEL_ACCOUNT;
> > +     s64 stream_id;
> > +
> > +     if (!send) {
> > +             limits =3D &streams->recv;
> > +             gfp =3D GFP_ATOMIC | __GFP_ACCOUNT;
> > +     }
> > +     stream_id =3D limits->next_bidi_stream_id;
> > +     if (quic_stream_id_uni(max_stream_id))
> > +             stream_id =3D limits->next_uni_stream_id;
> > +
> > +     /* rfc9000#section-2.1: A stream ID that is used out of order res=
ults in all streams
> > +      * of that type with lower-numbered stream IDs also being opened.
> > +      */
> > +     while (stream_id <=3D max_stream_id) {
> > +             stream =3D kzalloc(sizeof(*stream), gfp);
> > +             if (!stream)
> > +                     return NULL;
>
> Do you need to release the allocated ids in case of failure? It would be
> sourprising to find some ids allocated when this call fails/returns NULL.
I was aware of this, but didn't change it. As the streams are always opened
sequentially, I think it's fine just to leave them without causing problems
when users assume these streams are not yet open.

>
> > +
> > +             stream->id =3D stream_id;
> > +             if (quic_stream_id_uni(stream_id)) {
> > +                     if (send) {
> > +                             stream->send.max_bytes =3D limits->max_st=
ream_data_uni;
> > +                     } else {
> > +                             stream->recv.max_bytes =3D limits->max_st=
ream_data_uni;
> > +                             stream->recv.window =3D stream->recv.max_=
bytes;
> > +                     }
> > +                     /* Streams must be opened sequentially. Update th=
e next stream ID so the
> > +                      * correct starting point is known if an out-of-o=
rder open is requested.
> > +                      */
> > +                     limits->next_uni_stream_id =3D stream_id + QUIC_S=
TREAM_ID_STEP;
> > +                     limits->streams_uni++;
> > +
> > +                     quic_stream_add(streams, stream);
> > +                     stream_id +=3D QUIC_STREAM_ID_STEP;
> > +                     continue;
> > +             }
> > +
> > +             if (quic_stream_id_local(stream_id, is_serv)) {
> > +                     stream->send.max_bytes =3D streams->send.max_stre=
am_data_bidi_remote;
> > +                     stream->recv.max_bytes =3D streams->recv.max_stre=
am_data_bidi_local;
> > +             } else {
> > +                     stream->send.max_bytes =3D streams->send.max_stre=
am_data_bidi_local;
> > +                     stream->recv.max_bytes =3D streams->recv.max_stre=
am_data_bidi_remote;
> > +             }
> > +             stream->recv.window =3D stream->recv.max_bytes;
> > +
> > +             limits->next_bidi_stream_id =3D stream_id + QUIC_STREAM_I=
D_STEP;
> > +             limits->streams_bidi++;
> > +
> > +             quic_stream_add(streams, stream);
> > +             stream_id +=3D QUIC_STREAM_ID_STEP;
> > +     }
> > +     return stream;
> > +}
> > +
> > +/* Check if a send or receive stream ID is already closed. */
> > +static bool quic_stream_id_closed(struct quic_stream_table *streams, s=
64 stream_id, bool send)
> > +{
> > +     struct quic_stream_limits *limits =3D send ? &streams->send : &st=
reams->recv;
> > +
> > +     if (quic_stream_id_uni(stream_id))
> > +             return stream_id < limits->next_uni_stream_id;
> > +     return stream_id < limits->next_bidi_stream_id;
>
> I can't recall if I mentioned the following in a past review... it looks
> like the above assumes wrap around are not possible, which is realistic
> given the u64 counters - it would require > 100y on a server allocating
> 4G ids per second.
>
> But it would be nice to explcitly document such assumption somewhere.
>
How about I add a simple comment in quic_stream_create() right above
the next_uni_stream_id/streams_uni increases, like

"Note overflow of next_uni_stream_id/streams_uni is impossible with u64."

> > +}
> > +
> > +/* Check if a stream ID would exceed local (recv) or peer (send) limit=
s. */
> > +bool quic_stream_id_exceeds(struct quic_stream_table *streams, s64 str=
eam_id, bool send)
> > +{
> > +     u64 nstreams;
> > +
> > +     if (!send) {
> > +             if (quic_stream_id_uni(stream_id))
> > +                     return stream_id > streams->recv.max_uni_stream_i=
d;
> > +             return stream_id > streams->recv.max_bidi_stream_id;
> > +     }
> > +
> > +     if (quic_stream_id_uni(stream_id)) {
> > +             if (stream_id > streams->send.max_uni_stream_id)
> > +                     return true;
> > +             stream_id -=3D streams->send.next_uni_stream_id;
> > +             nstreams =3D quic_stream_id_to_streams(stream_id);
>
> It's not clear to me why send streams only have this additional check.
This is a good question.

For recv.max_uni_stream_id, it changes based on next_uni/bidi_stream_id,
max_streams_uni/bidi and streams_uni/bidi in quic_stream_max_streams_update=
(),
there's no need to check them again. (maybe I should leave a comment here)

But for send.max_uni_stream_id, it was updated simply from the peer's updat=
ed
recv.max_uni_stream_id announcement, it must check its local counts and
limits as well.

>
> > +             return nstreams + streams->send.streams_uni > streams->se=
nd./;
>
> Possibly it would be more consistent
>
> max_uni_stream_id -> max_stream_ids_uni
>
> (no strong preferences)
I actually got the variable name from
https://datatracker.ietf.org/doc/html/rfc9000.

>
> > +     }
> > +
> > +     if (stream_id > streams->send.max_bidi_stream_id)
> > +             return true;
> > +     stream_id -=3D streams->send.next_bidi_stream_id;
> > +     nstreams =3D quic_stream_id_to_streams(stream_id);
> > +     return nstreams + streams->send.streams_bidi > streams->send.max_=
streams_bidi;
> > +}
>
> [...]
> > +/* Get or create a receive stream by ID. Requires sock lock held. */
> > +struct quic_stream *quic_stream_recv_get(struct quic_stream_table *str=
eams, s64 stream_id,
> > +                                      bool is_serv)
> > +{
> > +     struct quic_stream *stream;
> > +
> > +     if (!quic_stream_id_valid(stream_id, is_serv, false))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     stream =3D quic_stream_find(streams, stream_id);
> > +     if (stream)
> > +             return stream;
> > +
> > +     if (quic_stream_id_local(stream_id, is_serv)) {
> > +             if (quic_stream_id_closed(streams, stream_id, true))
> > +                     return ERR_PTR(-ENOSTR);
> > +             return ERR_PTR(-EINVAL);
> > +     }
> > +
> > +     if (quic_stream_id_closed(streams, stream_id, false))
> > +             return ERR_PTR(-ENOSTR);
> > +
> > +     if (quic_stream_id_exceeds(streams, stream_id, false))
> > +             return ERR_PTR(-EAGAIN);
> > +
> > +     stream =3D quic_stream_create(streams, stream_id, false, is_serv)=
;
> > +     if (!stream)
> > +             return ERR_PTR(-ENOSTR);
> > +     if (quic_stream_id_valid(stream_id, is_serv, true))
> > +             streams->send.active_stream_id =3D stream_id;
>
> This function is really similar to quic_stream_send_get(), I think it
> should be easy factor out a common helper (and possibly use directly
> such helper with no send/recv wrapper).
>
I will factor out a common helper quic_stream_get() but keep
quic_stream_send_get/put() as:

struct quic_stream *quic_stream_send_get(...)
{
        return quic_stream_get(streams, stream_id, is_serv, true);
}

struct quic_stream *quic_stream_recv_get(...)
{
        return quic_stream_get(streams, stream_id, is_serv, false);
}

Thanks.

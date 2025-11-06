Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30232221FC6
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  6 Nov 2025 01:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762392453; cv=none; b=tZuVY2mQOcFBneE2e4mt/E+C1pz+ecENmxl2eWOU4HuWCRbatE6PMQUF8sgIg7apBtTixjoKrzD/rDtN80gHuEkfbi/dNI9E7dxeHp40eoPLv/aJpFJXSmJgGS2E0crbvAxCMJ+mTuR7wEd8aIR/APoyFM25PEK7XA9V30wz5fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762392453; c=relaxed/simple;
	bh=t60zMj6AWLwj7HgOB0A7xpTTFg8o/CZtcJVhujdSvcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XgPnvBXukOkJT7JJzptWPLvJaYUZpWgpiEfQNp1tHUp6DzZWd9cGfDppLydr2d118y3TLXE31kSBEPzkLzuSAcbyfy512pNAmC9sSfnvm6ZzHESGSAQqrqKruUyEvwlvHcPCmx3NXwlUCqlP0JPYYCVtJNmeJ86Q7mRFAJw4xVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mv0MVWIk; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mv0MVWIk"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-295df6ad56cso4370385ad.3
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 05 Nov 2025 17:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762392451; x=1762997251; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GwwiIcMYovTSyVyU+Jxg0bj+TG8JnyKSh+6k6o5rzk=;
        b=mv0MVWIkj4EKDdvAhPOG0pyELowo4awR+Az6ntXiu4IRbZ16U9c51G5fX0sIHKnnWn
         RWx6q3xxtDsoVQAdl4YdWi6ylfJkghdhU4bzC8uQ5FRhVsg1otAj3XMxz8GwzXep87lh
         zfCmWWrCQuc9rh+Q32zaY0JS4hkUr3fDYtGXcFF3KvFP6z8TZk4QTmWMwld1D1D4AGL5
         9jcbM6gpw+IRuFhUQqBxbMaKLqcy3WrOWmgQ6yiC7gLdZtNe1oO+uzXlXoozV0rWeVsu
         0+GkzFr9INHf3ANlEpsYpMIrDs/7dVtMvGIXrATa3SMwiqV0bad5fgDHu4bzdKZroXx8
         v2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762392451; x=1762997251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GwwiIcMYovTSyVyU+Jxg0bj+TG8JnyKSh+6k6o5rzk=;
        b=AsJDVAmlrVNPMhYcoD56PXsJ7rHm6nIZEiCl9cqTXTmpwy8gfUifGC+4yhiVUvN4yD
         jz9Nn28dJDETqRqEeWRUzBxxHkv4SwoAgb20T/7uhMuoReEAY8BGkKLMOUUUS8wutFcv
         o4aYnSAQTXhynTpWspLSy2WFQR5VvJUJXZ6PeM1LcMNBwaoHHPD4NfYbMVS6FlWH3fzc
         KG5tk1+nptzYk1zE4IUB7dTRK0qzv7jBMjCXrDJXGbaOVcIJUGt+Ah+CPubsM0Vq+tLt
         HJ7wTb1nRcwXv+M4mjhJh6F41LvTnbovl8SRbyth5zfbWvzHknG0G4K/v48E8P8IQeRJ
         04XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJcKkQ8IBVxubmcuHxelJdpk+QT5xlEr4aSQHvZ/UthRWDNnuE2DzYL4tOuOuMyrsa0JeUh/A7xWmyaQrzphubLkssPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbvoiMl0MsiRBJv/t3GjcbwS9zMVtlg6Qv90bIUufzuTiNBuV6
	MJvzO1dsXc7bnGeZYvWcJxtLIBtSGdLfTewgcGkSwE23RuonOl9hyestj5pdHuMusr6RJeVMyhZ
	/zP+JH5GEsEh9HFSxM2Ao8qqNOpBOoKI=
X-Gm-Gg: ASbGnctWBgM/3v4LwSFrRzMAQsEspTKtWlBh6OK5EGRBoiJ8SkXkZjK9F4sFwFhh4Z/
	I+GmF4TR4eXuD5LwQ32E6qOpQZyO2h/IUDbYt2OalWlYTtKhkLjwOP11A3b49eU1g2yyuuvCfCt
	QWi1URKz2+1IhmiZl/s7O4sMnlkMdlCMdIYrP1rTNCBJk883XdHDXc82VTvbEbnpk9dKcWzXTUW
	iq2SgfLoXm+FYBUCZ18ubrmtkCGHt43i03+tFkmWPS4BBlYlgHVXpUurtwDYuI277Y5lqzEhrS9
	FqkvqGacphDLls7IpwzbowCgJ7Jl8w==
X-Google-Smtp-Source: AGHT+IEzD+tqyOmDzE3XR4ftp/ZOL8by3E1PDBskCSVrVqTbY8VKDZvRDoZ/eqVszzlKIFXIpdbX6Pm0ZRSiYQaCG2s=
X-Received: by 2002:a17:902:d48f:b0:295:9627:8cbd with SMTP id
 d9443c01a7336-2962ae4c0f7mr75584625ad.33.1762392451271; Wed, 05 Nov 2025
 17:27:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <6b527b669fe05f9743e37d9f584f7cd492a7649b.1761748557.git.lucien.xin@gmail.com>
 <ad38f56b-5c53-408e-abcc-4b061c2097a3@redhat.com>
In-Reply-To: <ad38f56b-5c53-408e-abcc-4b061c2097a3@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 5 Nov 2025 20:27:19 -0500
X-Gm-Features: AWmQ_bmNnDe_hsT8TvS5HcTf9ajaXRhEmkLS-oaBBIClV9aPqqDfCkFPtdMoPkc
Message-ID: <CADvbK_c2gUNyDNYfgVrQ+Cm9rL6P_n+s0LJsrAPz0VK9FDDxyg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 06/15] quic: add stream management
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

On Tue, Nov 4, 2025 at 6:05=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 10/29/25 3:35 PM, Xin Long wrote:
> +/* Create and register new streams for sending. */
> > +static struct quic_stream *quic_stream_send_create(struct quic_stream_=
table *streams,
> > +                                                s64 max_stream_id, u8 =
is_serv)
> > +{
> > +     struct quic_stream *stream =3D NULL;
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
> > +             stream =3D kzalloc(sizeof(*stream), GFP_KERNEL_ACCOUNT);
> > +             if (!stream)
> > +                     return NULL;
> > +
> > +             stream->id =3D stream_id;
> > +             if (quic_stream_id_uni(stream_id)) {
> > +                     stream->send.max_bytes =3D streams->send.max_stre=
am_data_uni;
> > +
> > +                     if (streams->send.next_uni_stream_id < stream_id =
+ QUIC_STREAM_ID_STEP)
> > +                             streams->send.next_uni_stream_id =3D stre=
am_id + QUIC_STREAM_ID_STEP;
>
> It's unclear to me the goal the above 2 statements. Dealing with id
> wrap-arounds? If 'streams->send.next_uni_stream_id < stream_id +
> QUIC_STREAM_ID_STEP' is not true the next quic_stream_send_create() will
> reuse the same stream_id.
>
> I moving the above in a separate helper with some comments would help.
>
I will add a macro for this:

#define quic_stream_id_next_update(limits, type, id)    \
do {                                                    \
        if ((limits)->next_##type##_stream_id < (id) +
QUIC_STREAM_ID_STEP)     \
                (limits)->next_##type##_stream_id =3D (id) +
QUIC_STREAM_ID_STEP; \
        (limits)->streams_##type++;
         \
} while (0)

So that we can use it to update both next_uni_stream_id and next_bidi_strea=
m_id.

>
> > +                     streams->send.streams_uni++;
> > +
> > +                     quic_stream_add(streams, stream);
> > +                     stream_id +=3D QUIC_STREAM_ID_STEP;
> > +                     continue;
> > +             }
> > +
> > +             if (streams->send.next_bidi_stream_id < stream_id + QUIC_=
STREAM_ID_STEP)
> > +                     streams->send.next_bidi_stream_id =3D stream_id +=
 QUIC_STREAM_ID_STEP;
> > +             streams->send.streams_bidi++;
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
> > +             quic_stream_add(streams, stream);
> > +             stream_id +=3D QUIC_STREAM_ID_STEP;
> > +     }
> > +     return stream;
> > +}
> > +
> > +/* Create and register new streams for receiving. */
> > +static struct quic_stream *quic_stream_recv_create(struct quic_stream_=
table *streams,
> > +                                                s64 max_stream_id, u8 =
is_serv)
> > +{
> > +     struct quic_stream *stream =3D NULL;
> > +     s64 stream_id;
> > +
> > +     stream_id =3D streams->recv.next_bidi_stream_id;
> > +     if (quic_stream_id_uni(max_stream_id))
> > +             stream_id =3D streams->recv.next_uni_stream_id;
> > +
> > +     /* rfc9000#section-2.1: A stream ID that is used out of order res=
ults in all streams
> > +      * of that type with lower-numbered stream IDs also being opened.
> > +      */
> > +     while (stream_id <=3D max_stream_id) {
> > +             stream =3D kzalloc(sizeof(*stream), GFP_ATOMIC | __GFP_AC=
COUNT);
> > +             if (!stream)
> > +                     return NULL;
> > +
> > +             stream->id =3D stream_id;
> > +             if (quic_stream_id_uni(stream_id)) {
> > +                     stream->recv.window =3D streams->recv.max_stream_=
data_uni;
> > +                     stream->recv.max_bytes =3D stream->recv.window;
> > +
> > +                     if (streams->recv.next_uni_stream_id < stream_id =
+ QUIC_STREAM_ID_STEP)
> > +                             streams->recv.next_uni_stream_id =3D stre=
am_id + QUIC_STREAM_ID_STEP;
> > +                     streams->recv.streams_uni++;
> > +
> > +                     quic_stream_add(streams, stream);
> > +                     stream_id +=3D QUIC_STREAM_ID_STEP;
> > +                     continue;
> > +             }
> > +
> > +             if (streams->recv.next_bidi_stream_id < stream_id + QUIC_=
STREAM_ID_STEP)
> > +                     streams->recv.next_bidi_stream_id =3D stream_id +=
 QUIC_STREAM_ID_STEP;
> > +             streams->recv.streams_bidi++;
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
> > +             quic_stream_add(streams, stream);
> > +             stream_id +=3D QUIC_STREAM_ID_STEP;
> > +     }
> > +     return stream;
> > +}
>
> The above 2 functions has a lot of code in common. I think you could
> deduplicate it by:
> - defining a named type for quic_stream_table.{send,recv}
> - define a generic /() helper using an additonal
> argument for the relevant table.{send,recv}
> - replace the above 2 functions with a single invocation to such helper.
This is a very smart idea!

It will dedup not only quic_stream_recv_create(), but also
quic_stream_get_param() and quic_stream_set_param().

I will define a type named 'struct quic_stream_limits'.
Note that, since we must pass 'bool send' to quic_stream_create() for
setting the fields in a single 'stream' .

        if (quic_stream_id_uni(stream_id)) {
                if (send) {
                        stream->send.max_bytes =3D limits->max_stream_data_=
uni;
                } else {
                        stream->recv.max_bytes =3D limits->max_stream_data_=
uni;
                        stream->recv.window =3D stream->recv.max_bytes;
                }

I'm planning not to pass additional argument of table.{send,recv},
but do this in quic_stream_create():
        struct quic_stream_limits *limits =3D &streams->send;
        gfp_t gfp =3D GFP_KERNEL_ACCOUNT;

        if (!send) {
                limits =3D &streams->recv;
                gfp =3D GFP_ATOMIC | __GFP_ACCOUNT;
        }

>
> It looks like there are more de-dup opportunity below.
>
Yes, the difference is only the variable name _uni_ and _bidi_.
I'm planning to de-dup them with macros like:

#define quic_stream_id_below_next(streams, type, id, send)        \
    ((send) ? ((id) < (streams)->send.next_##type##_stream_id) :    \
          ((id) < (streams)->recv.next_##type##_stream_id))

/* Check if a send or receive stream ID is already closed. */
static bool quic_stream_id_closed(struct quic_stream_table *streams,
s64 stream_id, bool send)
{
    if (quic_stream_id_uni(stream_id))
        return quic_stream_id_below_next(streams, uni, stream_id, send);
    return quic_stream_id_below_next(streams, bidi, stream_id, send);
}

#define quic_stream_id_above_max(streams, type, id)            \
    (((id) > (streams)->send.max_##type##_stream_id) ? true :    \
        (quic_stream_id_to_streams((id) -
(streams)->send.next_##type##_stream_id) +    \
            (streams)->send.streams_##type >
(streams)->send.max_streams_##type))

/* Check if a stream ID would exceed local (recv) or peer (send) limits. */
bool quic_stream_id_exceeds(struct quic_stream_table *streams, s64
stream_id, bool send)
{
    if (!send) {
        if (quic_stream_id_uni(stream_id))
            return stream_id > streams->recv.max_uni_stream_id;
        return stream_id > streams->recv.max_bidi_stream_id;
    }

    if (quic_stream_id_uni(stream_id))
        return quic_stream_id_above_max(streams, uni, stream_id);
    return quic_stream_id_above_max(streams, bidi, stream_id);
}

Do you think it's worth it?

> > +
> > +/* Check if a send or receive stream ID is already closed. */
> > +static bool quic_stream_id_closed(struct quic_stream_table *streams, s=
64 stream_id, bool send)
> > +{
> > +     if (quic_stream_id_uni(stream_id)) {
> > +             if (send)
> > +                     return stream_id < streams->send.next_uni_stream_=
id;
> > +             return stream_id < streams->recv.next_uni_stream_id;
> > +     }
> > +     if (send)
> > +             return stream_id < streams->send.next_bidi_stream_id;
> > +     return stream_id < streams->recv.next_bidi_stream_id;
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
> > +             return nstreams + streams->send.streams_uni > streams->se=
nd.max_streams_uni;
> > +     }
> > +
> > +     if (stream_id > streams->send.max_bidi_stream_id)
> > +             return true;
> > +     stream_id -=3D streams->send.next_bidi_stream_id;
> > +     nstreams =3D quic_stream_id_to_streams(stream_id);
> > +     return nstreams + streams->send.streams_bidi > streams->send.max_=
streams_bidi;
> > +}
> > +
> > +/* Get or create a send stream by ID. */
> > +struct quic_stream *quic_stream_send_get(struct quic_stream_table *str=
eams, s64 stream_id,
> > +                                      u32 flags, bool is_serv)
> > +{
> > +     struct quic_stream *stream;
> > +
> > +     if (!quic_stream_id_valid(stream_id, is_serv, true))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     stream =3D quic_stream_find(streams, stream_id);
> > +     if (stream) {
>
> You should add some comments and possibly lockdep annotation/static
> check about the expected locking for the whole stream lifecycle.
>
sk is not seen in this file, so I will add some comments to describe this
will also be called under the sock lock.

Thanks.

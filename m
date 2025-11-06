Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DB6324B31
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  6 Nov 2025 16:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762446162; cv=none; b=T+JWFfdK/isRCTuwYUDZEZeCLBJEtB28MKmhFg8HORbDc4SS+zQiKcp/s54ZxZJFLpdFORWYW66tVDbiU7/qmbRk1VA7Wxf+Q33O+a//WnzYPRAIf/uR1rHViERoPJwG83MPXj1fPcPQxlJbIH/kq61aJm8EaDYv6wUxfZjI9vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762446162; c=relaxed/simple;
	bh=GHcYkdH+maGhSbqjgaMTYgrHBWp7Ejjef9/G9SDesw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fSndpYmXhzxd74JLlQdNf1s+xOyHGno/1zb2eStOCzALEXFBq+2yOcS5UyKd8SDRKmL0Vcmbtm62bW/aCcQGbKMClRnKtfbvrRVLUN7fbVkUKfzO6q4LnSwltkeATTWctqWY2WasluLgiFdpd20EK1UBLame44BvEDa1aB7UwnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfSUAXO3; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfSUAXO3"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-340564186e0so1191627a91.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 06 Nov 2025 08:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762446160; x=1763050960; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5kRvv90EQ+Dd8ei0fhEQuPjFn53nDjcX5P5hFZGW24=;
        b=RfSUAXO3AXQZ078GueiJfPCqDwntWnLc6n5KKQBHPMkEbh5bfckuLz1m0M3mu5HaBi
         8HwKdp4NTRIAgcm/QepblmBOBp5/DPvtOEjTEBXrd81hT94KzBnRwcRadin3/APEUVCk
         D2Niq2Lb3ncb23XJOMac7R7nynrBSDlcDpzSIfB7tuWhBCjV9VPc7HLap8YS8Q91SONE
         G4M6qZeochtXmb1whvTGWUWD+fqCw09+P8bV5JUCIuepney1aZJQYC0gcW3i/XV8yhh+
         xIlR1Vu1HLsrkzeabUMKqNO9OfWpgIc43IQhZr3771ngOd/N8/UuICPgNa4SwUAnGHBQ
         CtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446160; x=1763050960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5kRvv90EQ+Dd8ei0fhEQuPjFn53nDjcX5P5hFZGW24=;
        b=p8/Eb+/HO2EQyucnfAwRk7LgkgXdw8LRgSHKFRUZ3lZTVg+AG+855yj/LeAPvgReEC
         2KadF5XpLn/05xpdmqs1HdnlAzZm/OsPfA7x/3zOYMfp/muQQ1RC35Vv/Bt9cB5rL7hz
         F1GGF5CVHlpO8b+GD1zaRKuotBNf7M90tx0A5ibL0VJjTFBy0nxoKtGg0dnlof+5QbKe
         HADksl3jgGlXue2wIjlPHCmF+6nzK/kh4e4kIv+Wvy9D1EdVAQnPyTgHHT/PrYypsy3+
         //ZDCA9M/dx+2V6FbhlAmRu8YP7rxMZ2anBIPg7BfsGOEpo68OUTSd6sz6nx/irQdGm1
         gQzw==
X-Forwarded-Encrypted: i=1; AJvYcCXkLsKAFqsRii4bGOELJm2+PLANifpqeko0eXCsAhhk9VHhR/5SaxbzmR9AaOaEAgjjjlqcav1zPSNq9ZXvn8ODVR+IvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFswdDdkefagb9w71cFEd5DykzLRVrlTbr+FotjW4yK4zaRm0p
	X56HcgIxwLBiXcRMrRxWaPgL1vSZ9dO91BgMoW4R61KLzkXt3RTAyzYrcS1bNK3XX4KnT9onL+h
	31kSvy+0E1yxaJd3eEmyL5nP1yscTGH0=
X-Gm-Gg: ASbGncs8KT9673yAnNy41rMYpbgVJCLA5pnA3Ms21WrNhcDMYNxi2tG0hZaoyKBbp8U
	v2xVanfVtEjyJ/S3VARJVCaxOBY5giqnwywNeBF5hBuZqKo3We6vo/IPo9/vGVNBvHlglsUG3tL
	4UTfD3grc6StuDCYb9Dqq/18srHpZ5skC5Ttf7RDlW1ZGtf/V31qgwt3I/MHJeZpWo6uuk770Bc
	ppEFZAU5UcLgc3faiVZBzu97qAq2wPkr7WJN55tOtA/O3cXdiIYk+Amy0VcGUXEzZfBC/bmk0Pt
	UVn03mIuaaStK2/XZVo=
X-Google-Smtp-Source: AGHT+IFoQ8kGpMaSLOf9Chd76nE7JZtndg7rd7Lyk62CBGgDgQsLB1TXYepHJiHyGg2ArQIQINT5oR2oXIcboX3kVmc=
X-Received: by 2002:a17:90b:350d:b0:32d:e07f:3236 with SMTP id
 98e67ed59e1d1-341a6dc59b0mr8442491a91.22.1762446160232; Thu, 06 Nov 2025
 08:22:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <6b527b669fe05f9743e37d9f584f7cd492a7649b.1761748557.git.lucien.xin@gmail.com>
 <ad38f56b-5c53-408e-abcc-4b061c2097a3@redhat.com> <CADvbK_c2gUNyDNYfgVrQ+Cm9rL6P_n+s0LJsrAPz0VK9FDDxyg@mail.gmail.com>
 <24cee5fb-1710-4d1e-a1af-793fb99fc9c7@redhat.com>
In-Reply-To: <24cee5fb-1710-4d1e-a1af-793fb99fc9c7@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 6 Nov 2025 11:22:28 -0500
X-Gm-Features: AWmQ_bkUId-Zt8FoGRunxLcq_8eQS3aDbzvyyAAaLIOnKiFTr4a4r8IDb7hpyfw
Message-ID: <CADvbK_cJxGaam4gLCBg0EpNRWfAVyOTLZmD09LB=okWKr3prew@mail.gmail.com>
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

On Thu, Nov 6, 2025 at 3:52=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 11/6/25 2:27 AM, Xin Long wrote:
> > On Tue, Nov 4, 2025 at 6:05=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> =
wrote:
> >>
> >> On 10/29/25 3:35 PM, Xin Long wrote:
> >> +/* Create and register new streams for sending. */
> >>> +static struct quic_stream *quic_stream_send_create(struct quic_strea=
m_table *streams,
> >>> +                                                s64 max_stream_id, u=
8 is_serv)
> >>> +{
> >>> +     struct quic_stream *stream =3D NULL;
> >>> +     s64 stream_id;
> >>> +
> >>> +     stream_id =3D streams->send.next_bidi_stream_id;
> >>> +     if (quic_stream_id_uni(max_stream_id))
> >>> +             stream_id =3D streams->send.next_uni_stream_id;
> >>> +
> >>> +     /* rfc9000#section-2.1: A stream ID that is used out of order r=
esults in all streams
> >>> +      * of that type with lower-numbered stream IDs also being opene=
d.
> >>> +      */
> >>> +     while (stream_id <=3D max_stream_id) {
> >>> +             stream =3D kzalloc(sizeof(*stream), GFP_KERNEL_ACCOUNT)=
;
> >>> +             if (!stream)
> >>> +                     return NULL;
> >>> +
> >>> +             stream->id =3D stream_id;
> >>> +             if (quic_stream_id_uni(stream_id)) {
> >>> +                     stream->send.max_bytes =3D streams->send.max_st=
ream_data_uni;
> >>> +
> >>> +                     if (streams->send.next_uni_stream_id < stream_i=
d + QUIC_STREAM_ID_STEP)
> >>> +                             streams->send.next_uni_stream_id =3D st=
ream_id + QUIC_STREAM_ID_STEP;
> >>
> >> It's unclear to me the goal the above 2 statements. Dealing with id
> >> wrap-arounds? If 'streams->send.next_uni_stream_id < stream_id +
> >> QUIC_STREAM_ID_STEP' is not true the next quic_stream_send_create() wi=
ll
> >> reuse the same stream_id.
> >>
> >> I moving the above in a separate helper with some comments would help.
> >>
> > I will add a macro for this:
> >
> > #define quic_stream_id_next_update(limits, type, id)    \
> > do {                                                    \
> >         if ((limits)->next_##type##_stream_id < (id) +
> > QUIC_STREAM_ID_STEP)     \
> >                 (limits)->next_##type##_stream_id =3D (id) +
> > QUIC_STREAM_ID_STEP; \
> >         (limits)->streams_##type++;
> >          \
> > } while (0)
> >
> > So that we can use it to update both next_uni_stream_id and next_bidi_s=
tream_id.
>
> A function would be better tacking the next_id value as an argument.
> More importantly please document the goal here which is still unclear to =
me.
>
The if check may not be needed, I will double confirm:
if (limits->next_uni_stream_id < stream_id + QUIC_STREAM_ID_STEP)

If it's just one line below, maybe I just add a comment like in here?

/* Streams must be opened sequentially. Update the next stream ID so the
 * correct starting point is known if an out-of-order open is requested.
 */
limits->next_uni_stream_id =3D stream_id + QUIC_STREAM_ID_STEP;

> >> The above 2 functions has a lot of code in common. I think you could
> >> deduplicate it by:
> >> - defining a named type for quic_stream_table.{send,recv}
> >> - define a generic /() helper using an additonal
> >> argument for the relevant table.{send,recv}
> >> - replace the above 2 functions with a single invocation to such helpe=
r.
> > This is a very smart idea!
> >
> > It will dedup not only quic_stream_recv_create(), but also
> > quic_stream_get_param() and quic_stream_set_param().
> >
> > I will define a type named 'struct quic_stream_limits'.
> > Note that, since we must pass 'bool send' to quic_stream_create() for
> > setting the fields in a single 'stream' .
> >
> >         if (quic_stream_id_uni(stream_id)) {
> >                 if (send) {
> >                         stream->send.max_bytes =3D limits->max_stream_d=
ata_uni;
> >                 } else {
> >                         stream->recv.max_bytes =3D limits->max_stream_d=
ata_uni;
> >                         stream->recv.window =3D stream->recv.max_bytes;
> >                 }
> >
> > I'm planning not to pass additional argument of table.{send,recv},
> > but do this in quic_stream_create():
> >         struct quic_stream_limits *limits =3D &streams->send;
> >         gfp_t gfp =3D GFP_KERNEL_ACCOUNT;
> >
> >         if (!send) {
> >                 limits =3D &streams->recv;
> >                 gfp =3D GFP_ATOMIC | __GFP_ACCOUNT;
> >         }
> >
> >>
> >> It looks like there are more de-dup opportunity below.
> >>
> > Yes, the difference is only the variable name _uni_ and _bidi_.
> > I'm planning to de-dup them with macros like:
> >
> > #define quic_stream_id_below_next(streams, type, id, send)        \
> >     ((send) ? ((id) < (streams)->send.next_##type##_stream_id) :    \
> >           ((id) < (streams)->recv.next_##type##_stream_id))
> >
> > /* Check if a send or receive stream ID is already closed. */
> > static bool quic_stream_id_closed(struct quic_stream_table *streams,
> > s64 stream_id, bool send)
> > {
> >     if (quic_stream_id_uni(stream_id))
> >         return quic_stream_id_below_next(streams, uni, stream_id, send)=
;
> >     return quic_stream_id_below_next(streams, bidi, stream_id, send);
> > }
> >
> > #define quic_stream_id_above_max(streams, type, id)            \
> >     (((id) > (streams)->send.max_##type##_stream_id) ? true :    \
> >         (quic_stream_id_to_streams((id) -
> > (streams)->send.next_##type##_stream_id) +    \
> >             (streams)->send.streams_##type >
> > (streams)->send.max_streams_##type))
>
> Uhmm... with "more de-dup opportunity below" I intended
> quic_stream_get_param() and quic_stream_set_param(). I would refrain
> from adding macros. I think the above idea ('struct quic_stream_limits')
> would not need that?!?
>
Ah okay, that makes sense now, I don't like such macros either.
The above idea won't involve any new macros.

Thanks.

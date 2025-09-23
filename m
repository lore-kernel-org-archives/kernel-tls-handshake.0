Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C9825DAFF
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Sep 2025 17:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758648634; cv=none; b=sWp/aj4Wf/MOec00Y75LO32L6WRrXn3mDgJmEztGRw69dKf1h7TOBhdazMB1flCkY115svIygoEg5Vh3ZFdKYf8V09R7c1DTscDbCKuJiJ81JDNG9zdVSm+saLzuzlr6O9ndd6jpCfRSOfooZFXYbaS8UmvIabgXV3weJ0owP/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758648634; c=relaxed/simple;
	bh=hghWyqMLEkBfQ6eizevoRvpGAa/9gRmG+OWcHoOGofk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVWbe7HDCC8wZpYgqlvNJ25+QOayThn+y82305tCFl0HW0QJjX3HfaIMOPi6iVlSdE59yv0zgxPh1Ck7+oXzkvQzat4W7UjL9kufJqGWPza+TXH6R+uObQACeBwXxh/LP0Tfjr2U16DUJPEiUGku2pb4Lhn95ptRpS/q2EBgphE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMhFDABd; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMhFDABd"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77f358c7b8fso72697b3a.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Sep 2025 10:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758648631; x=1759253431; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otSvr9lp4hjuRht1Ui7CukSWsccNU1CrkcBBZa9JT28=;
        b=jMhFDABd8+FEhwzmrGEqWVe0ZNUNZub7GaofzJM5CK1Fhz09RAa6MJ6/kIKPCIZDBj
         crgzgLhwMG168Rvp7KRWbRNbWUudgt2g/dXv5FxLvnP+UQl5LiL9jqRDUCAt+kipfbkW
         VgeOdOZ4Rh83qKztU85t6Tq9zZLpZwnfcnUoBrWRkym1nG7zxuJDVi3pjQX+filRMtUc
         8tcsKk2PKzgmyzMtAb+PI2nRkf/2sW3/tvQgWMKLSlC7GcA96jVlvBcyXVhGpKTWFzUQ
         UZyYjgLeVpcfzzAhVSrJqs5W7jwobM9qSECuW4uTyb5f6X875mkXqZAZH9Xx42WrZ7Il
         0zDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758648631; x=1759253431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otSvr9lp4hjuRht1Ui7CukSWsccNU1CrkcBBZa9JT28=;
        b=r5mdmU6EbvZPE6V+HDeTbDk1Fnm91uqcmwkgvJvtv6OGtxIgMXMvFp+lkDu89G1qzQ
         8uQTUPdCxy8DGN7npnx8QL7suOROOyi+EcCanGjFH0XtGQn5N73A7bHJKEahe4fR9MeP
         r7yqfJwb3B0zkTaCvOSjqIazJNrlkQA5T5Q3MeOKBtJsJD+hwRBW0+cOXFoEm7jhR6DN
         lN4P55Twox+JxAU7XrUPg65Kx1tSEq23PCoSD4tdym6VsgfCEF8lSgk1dC3OR95BDmHm
         oOcnTQyp2yRaBEvSKouHK+a8GQEaxotbJek92i4lZXl4fs8ISSAYBIlWVYDBGZMwV7xh
         6KKw==
X-Forwarded-Encrypted: i=1; AJvYcCUjGZD2gwwMhkW29gmKjZV8WBZkovqaVmRvovmlZIpy0AUjMDe48q4jSXRZwtqnjvHO6Xv2CuB0qsixwPUtvlpeGAtK6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOsYdR3o0PtlPnxw5YA7eaFKk/GRkinSX6pa7Z141GMdBe9a+Z
	tvDk4STC6OyQiPWJZNBcCLiXgJ185pWT5iIctNwcmJZ3hNDoURfxBKrsFiRxTFCcI7iDz6e4PUO
	BdyVPzVG0v3Ep4ccdqkn7Q90bVIynSz4=
X-Gm-Gg: ASbGncv0B9ZfnSmQPlehqqqzELeKlJfsFZzCh9hmYBh2jxZ+gaWE2kBg7P8ir/pwL4T
	GQk9i8qj2ng3sPsY/63nm/bMW5t+WXHzTcJdoQbLfgOV7DdtIZaoVeNooX6grrw3lPaZ2vG3PR0
	9xG9y4Kum6MjMD4DycqElX2RTuaybwdMGXkxdOd/yUbd9fI3QC3WQDwu6/tySBEfLJqiKfxv31V
	3ekCiuh0A==
X-Google-Smtp-Source: AGHT+IHb7FTPS0aqNTQzQxRJZ7PGJRzwxQRu5Dd0GpM/MUJTuLqqFTKwQpdKNuhZ2pSdZPeFP657nduMMphE8QtkB48=
X-Received: by 2002:a17:902:fc8d:b0:26b:3cb5:a906 with SMTP id
 d9443c01a7336-27cdaa73d2amr41672395ad.16.1758648631008; Tue, 23 Sep 2025
 10:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1758234904.git.lucien.xin@gmail.com> <5d71a793a5f6e85160748ed30539b98d2629c5ac.1758234904.git.lucien.xin@gmail.com>
 <20250923090951.GF836419@horms.kernel.org>
In-Reply-To: <20250923090951.GF836419@horms.kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 23 Sep 2025 13:30:19 -0400
X-Gm-Features: AS18NWC9LYwbDwlF4C91L7kgoi_08hlFtRBrmqddeIKr75MWVxTZmLpz7q1S7tQ
Message-ID: <CADvbK_fCEr+oRvbtomrN8=cJc9nLFLioAXATJsU6_r24r3WOtw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 06/15] quic: add stream management
To: Simon Horman <horms@kernel.org>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Benjamin Coddington <bcodding@redhat.com>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 5:09=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> On Thu, Sep 18, 2025 at 06:34:55PM -0400, Xin Long wrote:
>
> ...
>
> > diff --git a/net/quic/stream.c b/net/quic/stream.c
>
> ...
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
> > +             stream =3D kzalloc(sizeof(*stream), GFP_KERNEL);
> > +             if (!stream)
> > +                     return NULL;
>
> ...
>
> > +     }
> > +     return stream;
>
> Hi Xin,
>
> I'm unsure if can happen - actually I doubt it can - but
> if the loop above iterates zero times then stream will be used
> uninitialised here.
This can't happen.

But it's better to initialize it to NULL. Othersize, it always looks
like a potential issue.

Thanks.



>
> Likewise in quic_stream_recv_create().
>
> Flagged by Smatch
>
> ...

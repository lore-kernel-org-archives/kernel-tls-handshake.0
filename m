Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D8D2E336F
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Sep 2025 16:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758643615; cv=none; b=jiggsQMeuYgMFgeV0d55p+lFbo72ZvUqoaevE2Sg5Ds3+YKyfYvMNymQr9hLEfffxYuMsizNZoMEwIJmuRK9PNEyrLgaFz8O7QLzoy05Wez2DEcGlwwM9f3Wsko+wKm/iFMj7LyzZ0I9b6ON1+1evdpJszQj84TdTN9onWt/yPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758643615; c=relaxed/simple;
	bh=LSZaSxvgiNpblG6l7iGMnvMkhnGQyUdC6rYhgCCt/B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=al3kWsaO1iOGacVVP9eBKFPfvMN7Den1EEO/Ex084EVbaLh+KMyyl3XplA8SjT0+E1qtCYsw1fnR70M0JEVAN59AsV8r/MUh/JblJaNJTb/UMsScgyb192QuxLEUZz72j9mfLtXd3G97r8I5tuXNXFMPgnszb026xRI9cnvyUXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzWEk7e6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzWEk7e6"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24456ce0b96so508825ad.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Sep 2025 09:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758643614; x=1759248414; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfZwWS5AXjSjh47+jujhHs0PNbVVMWVBOW1GeBhi9ZA=;
        b=EzWEk7e6OpbmiW63Mblj31jlOYZQ8lyGo4I5efrvwQpiciYh/Abl+TKkPcZEv3QKJT
         izlxzoh4AFinAC3/sR8xHaGVCOX6EPc6JX8WZlOoVJY4PTCoxHOQ9md1AOQPFxGL5s5W
         9XPrbdI/HegWJLOyWSx5KiffW5s/iXfLYX1eYQTT+3GJcFH7ErXTdP2GDFOmn5oZqGlb
         E+OKxwYJcViQEHPSZUyigLJ9+rIFxTDYnj9Ey6uE/3AwOBKbycKAGwMubkHjmEy/tQ8I
         e4CpCV3410dgWgkp8veSzYid946ACJ3qH+UB1jqITfZnhZelSQGvKbJG3zdX9SVFqv1M
         srfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758643614; x=1759248414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfZwWS5AXjSjh47+jujhHs0PNbVVMWVBOW1GeBhi9ZA=;
        b=viydj124BY9jr/b1548JMlDRPzQlCWnqL00n10Rp967t6FHr8HkqU9QwBGOTolkV8D
         VMD92F02UQ5XCxQdvxkjDjFDp3O2D4ABMHialHnYvgOun34OflBbnmC+rCOYKc5HZpHW
         A/Qb9POZUB7YNM/hrHpCLQ5PLMl0TDdCsqgxGWeM3IpdBRUWs6uBI6qt7iE/j4fQAKzk
         eL7LWVC5vqbUZZBd53PT/t0pUnYcI3foSlXNU8r4vRyEaVs7rDLGuFD2HOPQEV5TrpyH
         jJ/qbqTW6WhpgywPkSAPY1kl5FvrATpOvltHWV9UQce5jQqV4Nippq502tbxtbD3Uivk
         TVpw==
X-Forwarded-Encrypted: i=1; AJvYcCV4MV9y+XCSAgDOVQH9Z3g86nimf4rweosBLxTV0rjZokwgp14iMQHvXnWi7U7iWT1w7EoyoeASJ0T3bM0QZUdSJyfqqw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1Y5exHhnEsBKFtTMaTMhlDeFd0ndJK9YZiz89RWKXTKECmR/W
	gWQneiOv+x7qlh50TuI/i1lcACVgA9Kq7qaQtMx8UDlivWXACnwR2ASkNhgeC0lbUZSD8eMeASZ
	BKeJGAckXVtMQWPvJn0mO1n70zADdRm0=
X-Gm-Gg: ASbGncuXHF54mKPEweOYpVqfDWWFc4IjzqkHoWDVRcoxoVJiPqYDhdoSaShLMgg1hf+
	Wjz9SmJFq+66jVdB1v7r/MgpOXJeXGF/R6ninSMAGYH3mQxVSVkzEV8UaP7N5uymW3yKZ2jLBht
	9PjEqEWJT7tK3gHPphHxutciZaR4MdASoKCO/Wc59ACjt3Cv1yXIqE1+7dL8AwjJq4TN8TfkwSk
	9Gcw8JPddHtnzzMz7f/MbsiBYGJGH+qcj2p4mOK7g==
X-Google-Smtp-Source: AGHT+IElrnbiPc11xcIlgx/7eLp17j7KN5c1/0biJ0i/uJUb0MwRHW0VDJc6A4N7uhdDkUSkX1wG1aPAZnUI5GY+570=
X-Received: by 2002:a17:903:2447:b0:266:3f63:3500 with SMTP id
 d9443c01a7336-27cd7a31339mr34522615ad.12.1758643613364; Tue, 23 Sep 2025
 09:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1758234904.git.lucien.xin@gmail.com> <a7fb75136c7c2e51b7081d3bff421e01b435288f.1758234904.git.lucien.xin@gmail.com>
 <871ed254-c3d8-49aa-9aac-eeb72e82f55d@redhat.com>
In-Reply-To: <871ed254-c3d8-49aa-9aac-eeb72e82f55d@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 23 Sep 2025 12:06:41 -0400
X-Gm-Features: AS18NWD1Po0NumxImO775C_7VSP655cJIPbmA0dWx2wuT8JxABkrL-E_ndi5lAw
Message-ID: <CADvbK_e20TrcgprXmnZzvoEO6yzoo4Zx7B0qFS0kQPT8Sf63LQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 03/15] quic: provide common utilities and data structures
To: Paolo Abeni <pabeni@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, 
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

On Tue, Sep 23, 2025 at 7:21=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 9/19/25 12:34 AM, Xin Long wrote:
> > This patch provides foundational data structures and utilities used
> > throughout the QUIC stack.
> >
> > It introduces packet header types, connection ID support, and address
> > handling. Hash tables are added to manage socket lookup and connection
> > ID mapping.
> >
> > A flexible binary data type is provided, along with helpers for parsing=
,
> > matching, and memory management. Helpers for encoding and decoding
> > transport parameters and frames are also included.
> >
> > Signed-off-by: Xin Long <lucien.xin@gmail.com>
> > ---
> > v3:
> >   - Rework hashtables: split into two types and size them based on
> >     totalram_pages(), similar to SCTP (reported by Paolo).
> >   - struct quic_shash_table: use rwlock instead of spinlock.
>
> Why? rwlock usage should be avoided in networking (as it's unfair, see
> the many refactors replacing rwlock with rcu/plain spinlock)
Interesting, I thought rwlock works better than spinlock in this case.
I will change back to spinlock.

>
> [...]
> > +
> > +static int quic_uhash_table_init(struct quic_uhash_table *ht, u32 max_=
size, int order)
> > +{
> > +     int i, max_order, size;
> > +
> > +     /* Same sizing logic as in quic_shash_table_init(). */
> > +     max_order =3D get_order(max_size * sizeof(struct quic_uhash_head)=
);
> > +     order =3D min(order, max_order);
> > +     do {
> > +             ht->hash =3D (struct quic_uhash_head *)
> > +                     __get_free_pages(GFP_KERNEL | __GFP_NOWARN, order=
);
> > +     } while (!ht->hash && --order > 0);
>
> You can avoid a little complexity, and see more consistent behaviour,
> using plain vmalloc() or alloc_large_system_hash() with no fallback.
>
I wanted to use alloc_large_system_hash(), but the memory allocated
by it is usually NOT meant to be freed at runtime. I don't see a free_
function to do it either.

If QUIC works as a kernel module, what should I do with this memory
in module_exit()?

>
> > +/* rfc9000#section-a.3: DecodePacketNumber()
> > + *
> > + * Reconstructs the full packet number from a truncated one.
> > + */
> > +s64 quic_get_num(s64 max_pkt_num, s64 pkt_num, u32 n)
> > +{
> > +     s64 expected =3D max_pkt_num + 1;
> > +     s64 win =3D BIT_ULL(n * 8);
> > +     s64 hwin =3D win / 2;
> > +     s64 mask =3D win - 1;
> > +     s64 cand;
> > +
> > +     cand =3D (expected & ~mask) | pkt_num;
> > +     if (cand <=3D expected - hwin && cand < (1ULL << 62) - win)
> > +             return cand + win;
> > +     if (cand > expected + hwin && cand >=3D win)
> > +             return cand - win;
> > +     return cand;
>
> The above is a bit obscure to me; replacing magic nubers (62) with macro
> could help. Some more comments also would do.
>
The code is exactly from the commented doc:
/* rfc9000#section-a.3: DecodePacketNumber()

See:
https://datatracker.ietf.org/doc/html/rfc9000#section-a.3

I will bring some comments from there.

Thanks.

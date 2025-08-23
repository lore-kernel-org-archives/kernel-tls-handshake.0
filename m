Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD72A74C14
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 23 Aug 2025 18:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755972973; cv=none; b=CG4fdg/hHOnDXJr3Z1NhCQSJrkQpJ+0h14uB4gQYTr4yb1D2KafkYYks6KOf2BXXZNcAlhOyToC7CMJ62Y5kIsEIwUUKwiCaPQucBCNinax3bfEv6MCEbEu5uikjBgDYgKGMh4YyHNheeupsju6hdCjBHuU7xesO+N7covdM47c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755972973; c=relaxed/simple;
	bh=njSLvwIt8LiAq10rNFQp6mYMq/wOxOCeSrjPbSwxDqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRpT5nvZofCvJYlQv7ftXhaX8U5S9czfRZZU1g/hKBrZNwdiwowlmD8hi1QeBa1Jb0t3yAbD2PuYMudzI2Mgwpj7RiE/oE2G5qLgzZAQoikb46SkCnpHmL/8NAB3IllU/7r8pDLCVP23hmv4NJh8x0nqcBM+wNeknW9RMOjyflA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYZ8R6cz; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYZ8R6cz"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3e67e6a1cc8so18129865ab.1
        for <kernel-tls-handshake@lists.linux.dev>; Sat, 23 Aug 2025 11:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755972970; x=1756577770; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sg2L8ubuEXpnhwtGksuVh66eJv1X6jJCQin96Spl1OI=;
        b=kYZ8R6czyW9KDg3V2qqQ99py2kUi5Ic9LoR08RRxSQxSKd0re3UKzpQ0t/cPfDHByC
         FZ5q4ce7cHAaY0vZ+hBDi7y635fip2Y+hgxsITTn+vTKBtXyMNZJb7x0TUJGhpa/JfF+
         qjTlKvCYnQ48MY/OvpOpuSHT5C8LHUgHC54Pfp+nOImBASIYM0ZnKm3UDTv9TxDQ1ocQ
         FjldC5im1YM2aEqY6lzJtcjFEyGQs4381RCVUYnZrkiz0CbiqbwjNJSoYe0SFNljCvu5
         zywIzS+PdcBh8O+gvyHJStj+pwjmIdOv8uCr3Fx203GC4WTefkU5NgMLK5z0kREY8wtd
         KL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755972970; x=1756577770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sg2L8ubuEXpnhwtGksuVh66eJv1X6jJCQin96Spl1OI=;
        b=gsRAHY8kYD4aJKq5yZGkucUswNbiNfSXZah/ObK+ZRFwvFC/dqfB3o9ylTJaPH2ghT
         B5ccLwkc0QPQdVPpPGEebtVC2BBJQ3PTpUMUrlBp+xYs8S/vNnXgARwfmx/i1PeQ7POv
         P+hYoK8LWL54MuqMzOh5fAZ2kKns3gld2avPJAficyaJ40K44Id55qTtfBZYjHDC4Qcg
         oLcTwi8mB4Hvm9oDshkKEG82o9KUkuCVCSzVNwOvvG1FtEVv7lycmyE61yP3EUrzt4Yf
         WkCPk03xWEvgjcvWtyKkX2c1L9k7JTjfSHE8vhbb1bnY4jyxk3N6vjx6MDLhUQB2gTBD
         yJ0w==
X-Forwarded-Encrypted: i=1; AJvYcCXClAAw4ulK7X8ZTYxpHdYa855bVzKu6DFI2nalQicpXL1eMwvk+aWwhIJDMrPbHMWyExJtZWaQFNSWjdREQsxlLt478w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiPj4dRSy/SOU9Fqp2ThqqxemUnSzHexsI2adk2I6heh5Z37xX
	AR3LqCAqaGL8sC/3OgQwZ0bQ7OHzDmWHfoTof+zbWoc8Mf0xIIQIsiXr0tKA0Q3L1by+2hV4N+/
	gJOnMW7z8cII9BtyxdUTqSqa4mEtVS+o=
X-Gm-Gg: ASbGncv1E425AEt4IcPN7Us8xAcvV2G2H7shAmyFnzy2v9x/i5l6zTzHvIJVA5xCQwX
	R3bfpCX+D8wqOac5mUO8M0CHqQkCU9EYlduZrIwBWC5B+5p125iEQavE18cZm8WIhqek/4LfgFs
	fAQTCY3fo//GEqMmtIECymLqV71T3YZp5sBX8diRR0x4k36d2lNViXLsVcZEb2ZE8dNZ0wqZFNV
	b8FmqOm4z2SoO/53wUi
X-Google-Smtp-Source: AGHT+IEsgK/H0gyqBtqG9vpi3Iq1De6iE9KkdVlqWS5KyCYd33nd2HrGTegNdtikqERSb7XLsM7bvadHfWDP7iqnBCY=
X-Received: by 2002:a05:6e02:1709:b0:3e6:7151:a895 with SMTP id
 e9e14a558f8ab-3e91d393a49mr102597415ab.0.1755972969699; Sat, 23 Aug 2025
 11:16:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1755525878.git.lucien.xin@gmail.com> <7788ed89d491aa40183572a444b91dfdb28f20c4.1755525878.git.lucien.xin@gmail.com>
 <c06ff3eb-f69d-4bd8-b81a-a28b8b69ba52@redhat.com>
In-Reply-To: <c06ff3eb-f69d-4bd8-b81a-a28b8b69ba52@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Sat, 23 Aug 2025 14:15:58 -0400
X-Gm-Features: Ac12FXwqN5JfN3XpNwS7ROWPGnRJsuMytXn7hIk2yr-_xDtZWIh6E6fyFkzoCKE
Message-ID: <CADvbK_e4=-JjYiVFWN-Uuroog-+AxCzgDsFg5OQqHND+RPw1Ow@mail.gmail.com>
Subject: Re: [PATCH net-next v2 03/15] quic: provide common utilities and data structures
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

On Thu, Aug 21, 2025 at 8:58=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 8/18/25 4:04 PM, Xin Long wrote:
> [...]
> > +void quic_hash_tables_destroy(void)
> > +{
> > +     struct quic_hash_table *ht;
> > +     int table;
> > +
> > +     for (table =3D 0; table < QUIC_HT_MAX_TABLES; table++) {
> > +             ht =3D &quic_hash_tables[table];
> > +             ht->size =3D QUIC_HT_SIZE;
>
> Why?
>
> > +             kfree(ht->hash);
> > +     }
> > +}
> > +
> > +int quic_hash_tables_init(void)
> > +{
> > +     struct quic_hash_head *head;
> > +     struct quic_hash_table *ht;
> > +     int table, i;
> > +
> > +     for (table =3D 0; table < QUIC_HT_MAX_TABLES; table++) {
> > +             ht =3D &quic_hash_tables[table];
> > +             ht->size =3D QUIC_HT_SIZE;
>
> AFAICS the hash table size is always QUIC_HT_SIZE, which feels like too
> small for connection and possibly quick sockets.
indeed.

>
> Do yoi need to differentiate the size among the different hash types?
Yes, I will change to use alloc_large_system_hash() for these
hashtables, align with TCP:

- source connection IDs hashtable -> tcp_hashinfo.ehash
For Data receiving
- QUIC listening sockets hashtable -> tcp_hashinfo.lhash2
For New connections
- UDP tunnel sockets hashtable -> tcp_hashinfo.bhash
For binding
- QUIC sockets hashtable -> tcp_hashinfo.bhash
For some rare special cases, like receiving a stateless reset.

>
> > +             head =3D kmalloc_array(ht->size, sizeof(*head), GFP_KERNE=
L);
>
> If so, possibly you should resort to kvmalloc_array here.
>
> > +             if (!head) {
> > +                     quic_hash_tables_destroy();
> > +                     return -ENOMEM;
> > +             }
> > +             for (i =3D 0; i < ht->size; i++) {
> > +                     INIT_HLIST_HEAD(&head[i].head);
> > +                     if (table =3D=3D QUIC_HT_UDP_SOCK) {
> > +                             mutex_init(&head[i].m_lock);
> > +                             continue;
> > +                     }
> > +                     spin_lock_init(&head[i].s_lock);
>
> Doh, I missed the union mutex/spinlock. IMHO it would be cleaner to use
> separate hash types.
Yeah, I will separate them. :D

>
> [...]
> > +/* Parse a comma-separated string into a 'quic_data' list format.
> > + *
> > + * Each comma-separated token is turned into a length-prefixed element=
. The
> > + * first byte of each element stores the length (minus one). Elements =
are
> > + * stored in 'to->data', and 'to->len' is updated.
> > + */
> > +void quic_data_from_string(struct quic_data *to, u8 *from, u32 len)
> > +{
> > +     struct quic_data d;
> > +     u8 *p =3D to->data;
> > +
> > +     to->len =3D 0;
> > +     while (len) {
> > +             d.data =3D p++;
> > +             d.len  =3D 1;
> > +             while (len && *from =3D=3D ' ') {
> > +                     from++;
> > +                     len--;
> > +             }
> > +             while (len) {
> > +                     if (*from =3D=3D ',') {
> > +                             from++;
> > +                             len--;
> > +                             break;
> > +                     }
> > +                     *p++ =3D *from++;
> > +                     len--;
> > +                     d.len++;
> > +             }
> > +             *d.data =3D (u8)(d.len - 1);
> > +             to->len +=3D d.len;
> > +     }
>
> The above does not perform any bound checking vs the destination buffer,
> it feels fragile.
>
 This function needs two checks:

1. len < U8_MAX
2. to->data memory len >=3D len + 1.

Although the caller like quic_sock_set_alpn() ensures that, I guess they
should still be done in this function as a common helper.

Thanks.

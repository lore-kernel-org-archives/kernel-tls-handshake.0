Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5800A2ED143
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 23 Aug 2025 15:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755964690; cv=none; b=F1SuoCNgmOHMIuGSdRUHwXKbv70LqjAsviiPxWDRxoB7HbIq1tRKlDAVkGTCfL10T5fPKhgYFouL8nWMEUGIsB0Xfr+BNoxnqpLtO8pB/DgrOkOL+3hzLl5u0Y3nneTkVLJCDXgsLf3GjhY1JTfPqUXOY4ubIFcAZ9WEcF/V/f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755964690; c=relaxed/simple;
	bh=CEss89D4rBcDaOXEtNPRHdQhEDfgyqGuolIWnEOZN24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8Ad0+yI8uTv2Fu6mcwUKI4HxVY67cxZMCk+194y/L9iS8lsMLe7OIJHRwExzWsJZ3yhNfWjtGOGG1oYUz1MYDxZ6hfDdfCtidD3pIU0rZuRCIx3BW3atESdhqqRw62NJ/irKHiM7Whn9wuDPCIsvHEx1PfBgQD//l/t9mRoUjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y34i74Zn; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y34i74Zn"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3e668360ec7so20032315ab.1
        for <kernel-tls-handshake@lists.linux.dev>; Sat, 23 Aug 2025 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755964687; x=1756569487; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uOB/+tg1Dp4KQdja5HyNTCSLbeGrw8GP5vJj1HJRJ4=;
        b=Y34i74ZnwC2ZY6XNf8TqGeiTMxIWuUM6By+JJAhTHNVf26GxMkEMqjpwtyOH+9S+rZ
         5vXs9s7kgMBxNnwUm6e179O7rj0E/gHYRaffHDTSyGJ9DwShBeXUmOC6Qg3S9paVuzQD
         izYtwO8BWsT+rBI68twwgZ8a2KJwACSkoYl4scvmILGi5ooSKWg+/gLRfgXr2RsEpCDZ
         2Q6WMz/Xfhiho9TLE4c+7D+B9ZjmZkD/AZUrAMq3ASLzzli7g8ihKLojQyN+P7nMzQ3W
         V4wxnDf7ug247A8w2fMRnLBUGeA5dRFbxeWVjJG8AdtIPjgYxZaUP1l7kFGuVJMmntP6
         LZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755964687; x=1756569487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uOB/+tg1Dp4KQdja5HyNTCSLbeGrw8GP5vJj1HJRJ4=;
        b=naeEnRuwsqBc7B10u2uh2zMBHdkkaBuLT1f3bYKAD/IJx2H3bhedo97gAD+greY00Q
         HjbaY8YqhfPKhjHpigsTTg5KvuW7dA9r25Erp6eivgvHBzaIl/ngJntBRWndWw7sRkp9
         sGsj4Ag2vkv2oFNZHDF6x2WJ8PsnEzec/m00t3UXJe90bIYpIFV19vc7TZS//crKKCzk
         Ec/c1zgdCpkcPGP2d2VkbOAwJ2TbNFfuU28zsAqjHCCqtYpuPNzeLlBpYO5hsBW/r1d1
         nVXo6MnYoVJJA7w2ya1W//V+H+TKhksizPnyqeez2VsJTUM/o0woqcD4P+a2N04qMK01
         eUSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV687jZXBZ7GU307JkUU4ydytOSGC+QpP1CQ8ymdlnfbWwkiM88xqO2CMKol24CykS0iZJrOx49Y/9BisYuf7SCgZOoeA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoUmhUAS2EXZ8r8aRow5x+pqKkCqs+Gc16jSmJ+c4lMAVKyAeb
	KA294erT1eF9rqFHGX6J6oAkg7ZjMW6kLM5npw787Xtsk7EjXs1UCslcX0w2YoFVLszQi6Irtq1
	r20fspDUN/BAghlFOg1JBMmKp9R3PSqg=
X-Gm-Gg: ASbGncvO3VxrlyANlr5g0DYFk5AXU2UCtJkUBlt8EskUfhp6KYIT1aQfy3N7SHLeZgf
	ciFoTm07ENIa0Vqj/VAo7rKkvmUuSTzAXDWOfgenbqFSksylCNtP+4i0Qd9VFWt04ugxW7M0k8C
	TmydWbTIdsA+O2tZxqyjqrrR/gNJbLK3Co4Qe1lGl7U8wGlo6toX5uQY9sKLsJOO4Qj8A86iA3D
	etxIfNndA==
X-Google-Smtp-Source: AGHT+IF7DvIt1E0z/6wT3rwFB77I1aID7CBLWX3CGdHH8OwOrHIkXssQnxHCXzuBMqbZLo+ZAHWp7pyACv5yRG02Iw0=
X-Received: by 2002:a05:6e02:2604:b0:3e6:6f40:ccfd with SMTP id
 e9e14a558f8ab-3e6d7479749mr141369325ab.5.1755964687293; Sat, 23 Aug 2025
 08:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1755525878.git.lucien.xin@gmail.com> <e7d5e3954c0d779e999dc50a9b03d9f7ed94dbd2.1755525878.git.lucien.xin@gmail.com>
 <1cf31726-bfb9-4909-a077-6c2c45e0720a@redhat.com>
In-Reply-To: <1cf31726-bfb9-4909-a077-6c2c45e0720a@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Sat, 23 Aug 2025 11:57:56 -0400
X-Gm-Features: Ac12FXxwa94_Bx2cdn5RolEYeYrrVdm5JXgdGyE99iwZrdO0j4BDHWfh7nVrIGc
Message-ID: <CADvbK_fLKuUaB1_M4DyLC6V==7ThXt+4heyZykBrLM5nL28DYw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 07/15] quic: add connection id management
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

On Thu, Aug 21, 2025 at 9:55=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 8/18/25 4:04 PM, Xin Long wrote:
> > This patch introduces 'struct quic_conn_id_set' for managing Connection
> > IDs (CIDs), which are represented by 'struct quic_source_conn_id'
> > and 'struct quic_dest_conn_id'.
> >
> > It provides helpers to add and remove CIDs from the set, and handles
> > insertion of source CIDs into the global connection ID hash table
> > when necessary.
> >
> > - quic_conn_id_add(): Add a new Connection ID to the set, and inserts
> >   it to conn_id hash table if it is a source conn_id.
> >
> > - quic_conn_id_remove(): Remove connection IDs the set with sequence
> >   numbers less than or equal to a number.
>
> It's unclear how many connections are expected to be contained in each
> set. If more than an handful you should consider using RB-tree instead
> of lists.
>
We limit the max number of issued CIDs to 8 per connection, and the CID
per connection traversal is not on the data path, so it's fine to use
lists here.

Note that one connection/sk has one source CID set which contains a
couple of CIDs used for connection migration, and one dest CID set
to saving peer's CIDs.

> [...]
> > +static void quic_source_conn_id_free(struct quic_source_conn_id *s_con=
n_id)
> > +{
> > +     u8 *data =3D s_conn_id->common.id.data;
> > +     struct quic_hash_head *head;
> > +
> > +     if (!hlist_unhashed(&s_conn_id->node)) {
> > +             head =3D quic_source_conn_id_head(sock_net(s_conn_id->sk)=
, data);
> > +             spin_lock_bh(&head->s_lock);
> > +             hlist_del_init(&s_conn_id->node);
> > +             spin_unlock_bh(&head->s_lock);
> > +     }
> > +
> > +     /* Freeing is deferred via RCU to avoid use-after-free during con=
current lookups. */
> > +     call_rcu(&s_conn_id->rcu, quic_source_conn_id_free_rcu);
> > +}
> > +
> > +static void quic_conn_id_del(struct quic_common_conn_id *common)
> > +{
> > +     list_del(&common->list);
> > +     if (!common->hashed) {
> > +             kfree(common);
> > +             return;
> > +     }
> > +     quic_source_conn_id_free((struct quic_source_conn_id *)common);
>
> It looks like the above cast is not needed.
there will be a compiling error:

/root/quic/modules/net/quic/connid.c:68:66: note: expected =E2=80=98struct
quic_source_conn_id *=E2=80=99 but argument is of type =E2=80=98struct
quic_common_conn_id *=E2=80=99
   68 | static void quic_source_conn_id_free(struct
quic_source_conn_id *s_conn_id)

Or you mean change the parameter type of quic_source_conn_id_free() to:

static void quic_source_conn_id_free(struct quic_common_conn_id *common)

>
> > +}
> > +
> > +/* Add a connection ID with sequence number and associated private dat=
a to the connection ID set. */
> > +int quic_conn_id_add(struct quic_conn_id_set *id_set,
> > +                  struct quic_conn_id *conn_id, u32 number, void *data=
)
> > +{
> > +     struct quic_source_conn_id *s_conn_id;
> > +     struct quic_dest_conn_id *d_conn_id;
> > +     struct quic_common_conn_id *common;
> > +     struct quic_hash_head *head;
> > +     struct list_head *list;
> > +
> > +     /* Locate insertion point to keep list ordered by number. */
> > +     list =3D &id_set->head;
> > +     list_for_each_entry(common, list, list) {
> > +             if (number =3D=3D common->number)
> > +                     return 0; /* Ignore if it is already exists on th=
e list. */
> > +             if (number < common->number) {
> > +                     list =3D &common->list;
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (conn_id->len > QUIC_CONN_ID_MAX_LEN)
> > +             return -EINVAL;
> > +     common =3D kzalloc(id_set->entry_size, GFP_ATOMIC);
> > +     if (!common)
> > +             return -ENOMEM;
> > +     common->id =3D *conn_id;
> > +     common->number =3D number;
> > +     if (id_set->entry_size =3D=3D sizeof(struct quic_dest_conn_id)) {
> > +             /* For destination connection IDs, copy the stateless res=
et token if available. */
> > +             if (data) {
> > +                     d_conn_id =3D (struct quic_dest_conn_id *)common;
> > +                     memcpy(d_conn_id->token, data, QUIC_CONN_ID_TOKEN=
_LEN);
> > +             }
> > +     } else {
> > +             /* For source connection IDs, mark as hashed and insert i=
nto the global source
> > +              * connection ID hashtable.
> > +              */
> > +             common->hashed =3D 1;
> > +             s_conn_id =3D (struct quic_source_conn_id *)common;
> > +             s_conn_id->sk =3D data;
> > +
> > +             head =3D quic_source_conn_id_head(sock_net(s_conn_id->sk)=
, common->id.data);
> > +             spin_lock_bh(&head->s_lock);
> > +             hlist_add_head(&s_conn_id->node, &head->head);
> > +             spin_unlock_bh(&head->s_lock);
> > +     }
> > +     list_add_tail(&common->list, list);
>
> It's unclear if/how id_set->list is protected vs concurrent accesses.
>
id_set is per connection/socket, it's always protected by sock lock.
I will leave an annotation in the description of the function for that.

Thanks.

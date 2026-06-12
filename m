Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908693ACF11
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jun 2026 20:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781294577; cv=pass; b=UOEKUYoVWpJi7gcM99IaoWjhlJzh6rSkhQBnQipnN69RNkec2B3YhOG7nuckg1YWJzQSS2kHWGfi6aYYt1jtkphTW6YYR+bOojahr1RNINhzLadFQw04DFfFfn85G/WuMRUQVNfzAFFCjJixqdZImZaLrIHzT1DtYtLb/McPERA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781294577; c=relaxed/simple;
	bh=eBM9QSHnNg0yWihYVzLeuUCGsIulxfJM0tYOquM7h3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1721GZViVEs9568ni/Zefpkxt7hf7f19u51rs1X9E7Dfn8pcOiqis8J65JUm3wOYZjfgEbjyJzUBEliz7TJ6U68ejda2QQYcYu1O0vcmZ3/ht14rrs0Oh5xFzvzmxLRXNR2mb0jkLFFqS5tBKuaCWTJAhze1zPwSSQ5+J8crdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qqTPW6ku; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qqTPW6ku"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c858b5de728so869501a12.0
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jun 2026 13:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781294574; cv=none;
        d=google.com; s=arc-20240605;
        b=HTxwySiS9lUTXLIkz6Hjl8avcVZma2bCl50kM/aZ2E3nnFyMK0ur37KwbBNOVnkK1p
         7/C/+pph8GA1m65/qsHFhEerapWU30OcbkJaOXp6irxg08TJA490Pq+LN1wM0L3+8v9O
         d6QfLhDgSuvMAsHA3OFB1ILJoEYzEip/k9TUYB4TX+145YSvaJl9OudUJMP7KQltFRg7
         uLwsbhXcFzRC/rr43PxBxBsZCaVKmhl6lQL9LzOAyNIXZXPP+OCP+jk0hLctvxeOrecy
         5T/qmYhxx2WzmBbf8seED2mXV0BJAywCe8k621FkRjMd2N8ghwLLCqbjwG0E2rSZX8jD
         YLig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/3ckXfoM94ds90NzKWwX8bgBQKTOJG1riGpLfhC5Wz8=;
        fh=tRscQ7TU9vJTggvxMz1aXeSqFNQFcyUgeJlvVtcVBxs=;
        b=h1FweGREufBbEWSYh/1Kaoq7OCG5tCtN63Qj03xxKxK0FbqcG5Htp+WCKuQEpmSL9f
         TmIeaUc5rSSUYLZxsKrJTLRZmevuc7XR8v8COTfOqc28zcDpzxVe8DkJoI7+MmoiRa2b
         NwEWx6oPDlIYzPPgCWwJl8yv6SwiRUqzcUZQMLOyo7Ay2NNOZ7Fhoqp2Nq637SF5ze3o
         c6d9GAYaGKxhSpKlkcowjpZ7fo1jYaYmOuiB2FvQd8dO6hnbdKYdBjIh6hBR3OuDW2gW
         5kR+nT8+YFOfor21lkMOg2qHMSKjmJhRly2I+C4SgHJNpMRIJ0Kh//HbqqbTmhL/X3rm
         6gxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781294574; x=1781899374; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3ckXfoM94ds90NzKWwX8bgBQKTOJG1riGpLfhC5Wz8=;
        b=qqTPW6kuQYpHaROSSVN2yl3gCcCVFxCA+ddVqaGI782e44X2snMDwIFz9lq4WPFBti
         q9CYz7Hc5AjsHC0wnt+H9bfET6Nx7fQwWfjJoVdM1lHfsXTq2RDMAsbOcBKshfuXYflf
         MM/XZLcBP1J+T6n8f8eCcCeCuh9r3uRADTnP0q6izn0c12YYc0a8brClCDte1ri9A5QS
         v7DDhWrUPe2Lw4a9Rk8ZySAZE59UVAieUgBWuyMfYtBJTLvEivCmrYb9YvOVdhm58rW5
         h7HBg5cdtT9zx0S6SNwiK5sfbfW9QScrlozzL/Nze8LN+pnqGtU5OIX7JkqPBD96Gh1x
         RXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781294574; x=1781899374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/3ckXfoM94ds90NzKWwX8bgBQKTOJG1riGpLfhC5Wz8=;
        b=AqdgulKZK4xwsbzdb6dxlL7hyg1KudHgVq0x3L8sfiadsc2eQofee/t+OGOHXNpMag
         tDlP16ZsvMwEH0DrxV5Ou6mewcQVcXNIqs2HKyearDEsnGMsvMO5z1BKHhnbvvOXt8HS
         FmHTPP/pisuvMs23Xv1YJ0psZSV4pX7fw6NnGtiEOZDp0ugtNF6Vr8df9CfaBM1Rbr6S
         Gz55IBsSq6mug36yB1lscGrXun3Jey3cxa/V1HGdHnC5IN8c3S34Oiwig1KrIzfRMVq7
         9KnuuG9xArTHfKSrNsDGn8NQCPMTyRM5/nuhWClQwKdd97441EB7Oqa1Y8+zOzzngsw2
         HUJA==
X-Forwarded-Encrypted: i=1; AFNElJ9B+EfyY7Rz+acuH7YmuElI3OrwW//4mCus5jKD1MWm/Bwz2COJq3ZzsT2qOsmqxie7/JXKIMaazLDb4XrSRBfZuPwyvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqHuxVYPr6dYQ4AW9KX5iO8ifgpm2/1TrkuDOVZtuWaFZrHADZ
	rlPXQ+Or59YDkotuNC75uxbLRjfX6/u3YyC2yyGglnj26CO3cZP+41Jr4xeNajPKik+3mUoSWzY
	TEyt06Azn09tC4cyh2m/GY1W6p1sZeDc=
X-Gm-Gg: Acq92OH0iKCqYPTvYDKKIgv7HE2Dn3T7VTm//uOWaAfjtJ0V/40aB0BBpz8LNPyjCvD
	lw4NdIOkbaJxPC9LezJchCNLvdxIcWYbqr5+5azZA8Ot5QDqep4Ka0JbgudBB0rHDxcNNDTP5ap
	fFt/w2y5zjkXhhIry8lcwJKaNoo8KfkgxDjV5XVEEa9+N39jWfng0yhrK1Gj/fDzqFuV8Wd84S5
	j2Pn/XRAabwQTbB9efotGnK96JNryxDohl3BBsSQkAW46ymwdWGW12ZZ/Cfdg+JuD7ftwS41gpF
	lLXyqv3FRS4Y+PK5nYdPyxPjq6M28RHlF5MYwsRCuKpuIBatKOO155Q3fzIBQLWZ7jiJoP92Lyy
	gyZbqLA==
X-Received: by 2002:a05:6a00:3e26:b0:82f:3828:a009 with SMTP id
 d2e1a72fcca58-844e1939ff5mr1193301b3a.3.1781294573804; Fri, 12 Jun 2026
 13:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0565988e6b54dac937fa00cdb3b09adef9650be6.1780855297.git.lucien.xin@gmail.com>
 <20260611081928.137149-1-pabeni@redhat.com>
In-Reply-To: <20260611081928.137149-1-pabeni@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 12 Jun 2026 16:02:40 -0400
X-Gm-Features: AVVi8Cfml8mlE4tV34oK4_w8pEjk-qeT6RUnEUAlc7Ph7rvhFYhaxjVtMLJiDiY
Message-ID: <CADvbK_efGf9t4HxtJtLVo2LBKM_N_mNQS_vLVadwk=o16X3jUA@mail.gmail.com>
Subject: Re: [PATCH net-next v13 07/15] quic: add connection id management
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, edumazet@google.com, horms@kernel.org, metze@samba.org, 
	mbuhl@openbsd.org, tfanelli@redhat.com, hepengtao@xiaomi.com, 
	dreibh@simula.no, linux-cifs@vger.kernel.org, smfrench@gmail.com, 
	linkinjeon@kernel.org, tom@talpey.com, kernel-tls-handshake@lists.linux.dev, 
	chuck.lever@oracle.com, jlayton@kernel.org, steved@redhat.com, hare@suse.de, 
	aahringo@redhat.com, dhowells@redhat.com, matttbe@kernel.org, 
	mail@johnericson.me, xiyou.wangcong@gmail.com, alibuda@linux.alibaba.com, 
	jbaron@akamai.com, illiliti@protonmail.com, sd@queasysnail.net, 
	marcelo.leitner@gmail.com, daniel@haxx.se, andrew.gospodarek@broadcom.com, 
	mef@scarletmail.rutgers.edu, paul@jakma.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 4:19=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> From: AI Reviewer <ai@example.com>
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://netdev-ai.bots.linux.dev/sashiko/
> ---
> Now I have enough information to produce the report.
>
> commit e00266d0eea858a744fd827548eb8ebc6868f92c
> Author: Xin Long <lucien.xin@gmail.com>
>
> quic: add connection id management
>
> This commit introduces struct quic_conn_id_set for managing QUIC
> Connection IDs along with helpers to add, remove, and look up source
> and destination CIDs, including a global hash table for source CID
> lookup on the RX path.
>
> > diff --git a/net/quic/connid.c b/net/quic/connid.c
> > new file mode 100644
> > index 000000000000..b1a39feb827e
> > --- /dev/null
> > +++ b/net/quic/connid.c
> > @@ -0,0 +1,256 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/* QUIC kernel implementation
> > + * (C) Copyright Red Hat Corp. 2023
> > + *
> > + * This file is part of the QUIC kernel implementation
> > + *
> > + * Initialization/cleanup for QUIC protocol support.
> > + *
> > + * Written or modified by:
> > + *    Xin Long <lucien.xin@gmail.com>
> > + */
> > +
> > +#include <linux/quic.h>
> > +#include <net/sock.h>
> > +
> > +#include "common.h"
> > +#include "connid.h"
> > +
> > +/* Lookup a source connection ID (scid) in the global source connectio=
n ID hash
> > + * table.
> > + */
> > +struct quic_conn_id *quic_conn_id_lookup(struct net *net, u8 *scid, u3=
2 len)
> > +{
> > +     struct quic_shash_head *head =3D quic_source_conn_id_head(net, sc=
id, len);
> > +     struct quic_source_conn_id *s_conn_id;
> > +     struct quic_conn_id *conn_id =3D NULL;
> > +     struct hlist_nulls_node *node;
> > +
> > +     hlist_nulls_for_each_entry_rcu(s_conn_id, node, &head->head, node=
) {
> > +             if (net !=3D sock_net(s_conn_id->sk))
> > +                     continue;
> > +             if (s_conn_id->common.id.len !=3D len ||
> > +                 memcmp(scid, &s_conn_id->common.id.data, len))
> > +                     continue;
> > +             if (likely(refcount_inc_not_zero(&s_conn_id->sk->sk_refcn=
t)))
> > +                     conn_id =3D &s_conn_id->common.id;
> > +             break;
> > +     }
>
> [Critical]
> Can s_conn_id->sk be freed while this RCU walk is running?  The
> s_conn_id itself is freed via call_rcu() in quic_source_conn_id_free(),
> but the struct sock it points to does not appear to be RCU-protected.
>
> A grep across this series for SOCK_RCU_FREE and SLAB_TYPESAFE_BY_RCU
> under net/quic returns no matches, and quic_init_sock() does not call
> sock_set_flag(sk, SOCK_RCU_FREE), so sk_destruct() will free the sock
> synchronously rather than after a grace period.
>
> Consider this sequence:
>
>   CPU0 (RX path, rcu_read_lock held)        CPU1 (close path)
>   hlist_nulls_for_each_entry_rcu(..)
>     /* sees s_conn_id still linked */
>                                             sk_destruct()
>                                               quic_destroy_sock()
>                                                 quic_conn_id_set_free()
>                                                   /* unhash + call_rcu
>                                                      defers s_conn_id
>                                                      free, but not sk */
>                                               sk_prot_free()  /* sk gone =
*/
>     sock_net(s_conn_id->sk)         /* UAF read of freed sock */
>     refcount_inc_not_zero(
>         &s_conn_id->sk->sk_refcnt)  /* UAF refcount op */
>
> Once quic_packet_get_sock() (in the later 'quic: add packet parser
> base' patch) wires this lookup into every short- and long-header
> packet, an incoming packet racing with close() on the matching socket
> would dereference freed sock memory.
>
> Would setting SOCK_RCU_FREE on the QUIC sockets, switching the proto
> slabs to SLAB_TYPESAFE_BY_RCU, taking sock_hold() when the sk pointer
> is stored in s_conn_id, or otherwise gating the sk free behind an RCU
> grace period address this?
>

This is not an issue, as sock_set_flag(sk, SOCK_RCU_FREE) will be called
in quic_hash(), which will be added in the patchset-2.


> > +
> > +/* Check if a given stateless reset token exists in any connection ID =
in the
> > + * connection ID set.
> > + */
> > +bool quic_conn_id_token_exists(struct quic_conn_id_set *id_set, u8 *to=
ken)
> > +{
> > +     struct quic_common_conn_id *common;
> > +     struct quic_dest_conn_id *dcid;
> > +
> > +     dcid =3D (struct quic_dest_conn_id *)id_set->active;
> > +     if (memchr_inv(dcid->token, 0, QUIC_CONN_ID_TOKEN_LEN) &&
> > +         !memcmp(dcid->token, token, QUIC_CONN_ID_TOKEN_LEN))
> > +             return true; /* Fast path. */
> > +
> > +     list_for_each_entry(common, &id_set->head, list) {
> > +             dcid =3D (struct quic_dest_conn_id *)common;
> > +             if (common =3D=3D id_set->active)
> > +                     continue;
> > +             if (memchr_inv(dcid->token, 0, QUIC_CONN_ID_TOKEN_LEN) &&
> > +                 !memcmp(dcid->token, token, QUIC_CONN_ID_TOKEN_LEN))
> > +                     return true;
> > +     }
> > +     return false;
> > +}
>
> [Medium]
> Is memcmp() the right comparison primitive for the stateless reset
> token here?  RFC 9000 section 10.3 treats the token as a secret that
> authorises tearing down a connection, and the commit message states
> this helper is used during stateless reset processing on incoming
> packets.
>
> lib/string.c's memcmp() returns at the first differing byte (and
> performs unaligned word-sized loads on architectures that allow it),
> so the time taken to return false leaks how many leading bytes of the
> supplied token match a stored token.  Would crypto_memneq() from
> <crypto/algapi.h>, which is constant-time, be more appropriate for
> comparing the token bytes?
>

OK, will change to crypto_memneq() and replace 4 similar places.

> > +
> [ ... ]
> > +/* Add a connection ID with sequence number and associated private dat=
a to the
> > + * connection ID set.
> > + */
> > +int quic_conn_id_add(struct quic_conn_id_set *id_set,
> > +                  struct quic_conn_id *conn_id, u32 number, void *data=
)
> > +{
> [ ... ]
> > +     /* Locate insertion point to keep list ordered by number. */
> > +     list =3D &id_set->head;
> > +     list_for_each_entry(common, list, list) {
> > +             if (number =3D=3D common->number)
> > +                     return 0; /* Ignore if it already exists on the l=
ist. */
> > +             if (number < common->number) {
> > +                     list =3D &common->list;
> > +                     break;
> > +             }
> > +     }
> [ ... ]
> > +     list_add_tail(&common->list, list);
> > +
> > +     if (number =3D=3D quic_conn_id_last_number(id_set) + 1) {
> > +             if (!id_set->active)
> > +                     id_set->active =3D common;
> > +             id_set->count++;
> > +
> > +             /* Increment count for consecutive following IDs. */
> > +             list_for_each_entry_continue(common, &id_set->head, list)=
 {
> > +                     if (common->number !=3D ++number)
> > +                             break;
> > +                     id_set->count++;
> > +             }
> > +     }
> > +     return 0;
> > +}
>
> [Medium]
> Does this function correctly maintain id_set->count when a CID is
> inserted before all existing entries?  The loop above explicitly
> handles the "number < common->number" case, suggesting out-of-order
> insertion is intended to be supported.
>
> Consider starting from list=3D[5], count=3D1 (so first=3D5, last=3D5) and
> calling quic_conn_id_add(..., number=3D3, ...):
>
>   - The location loop sets list =3D &common(5)->list and breaks.
>   - list_add_tail() inserts common(3) before common(5),
>     yielding list=3D[3, 5].
>   - The post-insert check evaluates:
>         quic_conn_id_last_number(id_set)
>             =3D quic_conn_id_first_number(id_set) + count - 1
>             =3D 3 + 1 - 1
>             =3D 3
>     so the test "number =3D=3D last + 1" becomes "3 =3D=3D 4" and the cou=
nt
>     update branch is skipped.
>
> The end state is list=3D[3, 5] with count still 1, so entry 5 is
> silently uncounted.
This is expected, count only count contiguous connection IDs.

> A subsequent quic_conn_id_remove(id_set, 3)
> then trips the WARN_ON_ONCE(number >=3D last_number) because
> last_number reads as 3.
>

This will never happen, the callers will prevent passing the last
seqno to quic_conn_id_remove().

Thanks.

> Should the count adjustment also handle the case where the inserted
> CID lowers first_number?
>
> > +
> > +/* Remove consecutive connection IDs from the set with sequence number=
s less
> > + * than or equal to a number.
> > + */
> > +void quic_conn_id_remove(struct quic_conn_id_set *id_set, u32 number)
> [ ... ]
> --
> This is an AI-generated review.
>

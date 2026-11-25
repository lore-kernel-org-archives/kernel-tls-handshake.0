Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795622977;
	b=P5pWHmxGk6O8d7n4B9i/Wq2W+guz9bPaeb5n2Kb0jTxtY7PknhFMEH+Dg+plEJcoH8Hb
	 g3odLu40uueyUKoChh289SdAL5abaBAwk12wkT5YmHzDd0Pubz3vOsqm6hNscmJm9QY7l
	 xibRWExMmHIqjUVS4ssrQnjTyNwQL7d0lYP5lrr/dA1KfszKjMhZj9fH/SwYEiPQbiM9e
	 /HGNek7D3nSIOWsP9FqszVSnIFE+U00DLlKiDX6jThK+PXKiIqqlUjWvhNv9PEZ5D3Eyl
	 pAi0BF1bcDtnA3seV28WERaZoYBkGu/s1lcRACLEwIOtUBPlJpPBH4+TvLpS1O/8QlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u8edI8FeQSZp9/9wYopp3WXqEDb0aEYd4PyW+vHqD04=;
	b=cwdIb1CmXKN09ZQSCyg3UjhcGCfXYfq0gPsPssHwjLIS40Uvf70Ia3hotDIrofSiJuiH
	 Y5G/mWxTXtBTiFzKUp6UQg/K/RkHJOf33OG12hRPrOyEFl05MF6yrK7dpXvChewahHakM
	 XCRFJiNK3Xqxr3sD83G/buv3P8K8awaKwA4CZYFbHl2moZUq+iHBo8YdYTXlnFJDoGEwz
	 4xOADzTiVIBV0ftwovI8Ph1eBGkydQ6/kvnaBtU2aUrtiXxXdxYmQs68w8YQl20xxLWgI
	 BW78Hb5D6j6RDYHbjHjlXw3FGa0BuIV76IVHVhV3wqn2Qt0elH7rn2pHFida6WbdZAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCtdA38Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5548606A31E
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 25 Nov 2026 16:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5548606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCtdA38Y
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so3148922b3a.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 25 Nov 2026 08:09:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795622976; cv=none;
        d=google.com; s=arc-20260327;
        b=ou+PIUgq6YkUyVuSkOexXmpk9mVCeOFC5M6YC9sDS0VL0Jfwxa2GpUO3lxQLEqkghf
         EznIW1MaUoIrRFAmIT+5CgCL6ch+GIxPgxyUz7Heb3WWTjNQpkYVC3YHygaAOFU7tEhE
         em8EGdkG3Ogeh+Bagg51ilGlKobGodDi4FsXuYETLj7RJXjp/lhIExuuuHr84aFNMaFQ
         Q7VFCYb2dUtAnGzSrrUX9A7/Y0a9KhfCzyYjleT65HXExTRQhFMoF7nplQI5eyhenA4l
         rRWIbhBR+dG4Q5G5FHLdEt2FFz16zpwQdv2Yv0YXoHek/YFmfILai9j8EN6JLWH8dTUN
         0Zdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u8edI8FeQSZp9/9wYopp3WXqEDb0aEYd4PyW+vHqD04=;
        fh=tYZN6jk2eWwGH4hg+WraMsyipvwqPayyBtWhC9gT068=;
        b=CsWo83OF/HhjYnehwY2Xxl4bEcXTgyPRGBKb1qXbIaxym8+Ix3MsS4B+jT9y3m00kJ
         3pcQULT0LdBfryvD6fgF5sE6/fzIbA96v/DO+mFZJPCo2KMo5pEoVzjS/ANF1igwZh0v
         ELu8LRClLizv7EThWqvKrCG363xkeQ3mrwkixKuXAymbuzSFddSV0V03fGjOPDht+4Bs
         FCCKkR70FhyP9y8DvxgWzXhr9Q7KMCpSs7h1LI9mY01bwA1CS3B7FHzLeB3/K8dR+htc
         6JJ4DFqQRRQhvg6iw8+aRJMAgyHTUCeYh7i1E4vIqYJm1jOkQDAf3WeFPkAbX6v6OfHQ
         D80Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795622976; x=1796227776; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u8edI8FeQSZp9/9wYopp3WXqEDb0aEYd4PyW+vHqD04=;
        b=SCtdA38YH5vhcg+QqdTWTZ1N/HUORY1UgH6wPhf09H7g6UvXP+7T3T3Ewe9KrTR13E
         rECN1xktXtL40wSh1DTSwMi2EsC1EF0ShK4pg5K94iYcWZQKC2ZBUntTyv0JWKRj6lpV
         ot05ik2457SCQcpMDcgdbRD1RVplMGWpVQkXdj2t7SYn88rwBPc4m76bOMQLf4IIhM9z
         krgJRG3AOXHCOeYO+kK/lFs9xnYRM3lwS89Bm9lTYOUEK+RT/BSmaOOwEGJkYm9OnsZY
         25hsU8qKY41zCE5m+0PauhNW6JvkMw3Shlzvaa2Sl3oUIMIc+72LXs00FIv8eNyIDmIi
         h/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622976; x=1796227776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8edI8FeQSZp9/9wYopp3WXqEDb0aEYd4PyW+vHqD04=;
        b=aNVx/8nuhExJvVYW3SRvtoZv4Mnge/QA1lJ8wD04Ev/HcVyGWn7aJUTd0uYvQRPQA5
         cwO0J3Nkx5zDrlv+u705PDNHieZ1tFbPidf8SASpBsyfnHvnyKEy5ygkJpcWNXm2pu8k
         KrpIhv58KszfvmfWBje00v7bxmCSDOEQG8bZ0vQ992evby7L/muWJG4JkRP+1ln44p/c
         zHtbVdKsPLVo326zaABT5OhIYsl5rMiVgmWhod4rsKWrcCFIB+pitt3M8j+jAq8v1ova
         MbBUfsvgsr+mgJdn0n2iwOTtwDxrVRP3mhCaJhMuS/wNyX3irPtndyzhB9HgD+zr5F/n
         xjHw==
X-Forwarded-Encrypted: i=1; AL+hErGjC+4JVIQyrYF2PkAvZV9ns3qm+nriy+Lv82QeASsaNS6ofJ600fhKaRFAJe+9wYrJBrxWU5vxFqhC1882o9dpP1RyAQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8piCKO6apVwXr4WzZRELOgg1ycX80q9Ujr4bMgbD7xM1fJBWlH
	oftWbrpKkSycT9D2rIVzn4zMWgx/WdGQfUEHFHbxCK2PoXAUAWgAIDUYQJ6Mtj2NcTavxdyv0mk
	pxP4FfjRtyTpMfCugUVNH5bW2iRDDGsk=
X-Gm-Gg: AZFdTZci9vorykygMQJpfqJdrw+/4Cpah40sJ//IdWf8s9TDROwE+BvbsNt5poEW4Wa
	kRH5GCIZsV5WVoSygs8fDHrrDnHeDJnfnZgZ8R2uKDZby0qrfm8TlOY7OmskDMENHYztqyeWFmu
	lVAlS48S9PJnKa9sJAd9vaUH6tu//1r1BiVA8oqsc2S0RGa5IzxSe87AgcsVuNhUxsoMzTawkRn
	XDP+wNOOhmu+z+26kNPQgw8MruujPuwEwsUSsFseFPi0cJjWH3o9l2jMj6xMVIR8KoF2Tyk+yjq
	+hZddyUgZVo+N/vvFNdBOXAmTM53AJhsKmLiih+QOJYRmj83WSq7NpDz4sCU9pxKR6fdUyVotec
	AK8Zzpz+ypHujm7Uti1DAcahdXO30ZXKwZEBSKYmivcuMy7OGv7L01GhZWrx+Ctin/Podigjtdp
	5dwyi4rxKtiwP5ozsxRecLPsYF7j7K6kGL/tYUY3lb8rm4p8Ek5q9FUas/2Z5D7vUBckD6
X-Received: by 2002:a05:6a00:ad05:b0:8a0:70ff:ab28 with SMTP id
 d2e1a72fcca58-8c87daf37damr15090565b3a.60.1795622976032; Wed, 25 Nov 2026
 08:09:36 -0800 (PST)
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <a0b0796446aa6da7e62134343e27abb459c3e4cf.1795393691.git.lucien.xin@gmail.com>
 <179548327264.3135.6491698928014688203@kernel.org>
In-Reply-To: <179548327264.3135.6491698928014688203@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 25 Nov 2026 11:09:24 -0500
X-Gm-Features: Aa3M54rOBsjgMkrX6FiWjub5OGP-lBrvCJFM9rh8E12fgXwHp5rULcB25ZvsU6o
Message-ID: <CADvbK_f42EbbC0fgn1a_HkrgAbqgmtGExogvNq6CZa892tz_cQ@mail.gmail.com>
Subject: Re: [PATCH net-next v19 07/15] quic: add connection id management
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	metze@samba.org, mbuhl@openbsd.org, tfanelli@redhat.com, hepengtao@xiaomi.com, 
	dreibh@simula.no, jamie.bainbridge@gmail.com, linux-cifs@vger.kernel.org, 
	pc@manguebit.org, linkinjeon@kernel.org, tom@talpey.com, 
	kernel-tls-handshake@lists.linux.dev, cel@kernel.org, jlayton@kernel.org, 
	steved@redhat.com, hare@suse.de, aahringo@redhat.com, dhowells@redhat.com, 
	matttbe@kernel.org, mail@johnericson.me, xiyou.wangcong@gmail.com, 
	alibuda@linux.alibaba.com, jbaron@akamai.com, illiliti@protonmail.com, 
	sd@queasysnail.net, marcelo.leitner@gmail.com, daniel@haxx.se, 
	andrew.gospodarek@broadcom.com, mef@scarletmail.rutgers.edu, paul@jakma.org, 
	kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:21=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] quic_conn_id_retire() (net/quic/connid.c) handles 'retire the
>   last live consecutive CID' with `if (WARN_ON_ONCE(id_set->use_count <=
=3D=E2=80=A6
>
> --
>
> quic: add connection id management
>
> This patch adds struct quic_conn_id_set to manage source and destination
> connection IDs. It provides helpers to add, retire, find and look up CIDs=
.
> Source CIDs are also inserted into a global RCU hash table, which the RX
> path uses to look up the socket.
>
> > diff --git a/net/quic/connid.c b/net/quic/connid.c
> > new file mode 100644
> > index 0000000000000..1ddf8bc9b7910
> > --- /dev/null
> > +++ b/net/quic/connid.c
> > @@ -0,0 +1,313 @@
>
> [ ... ]
>
> > +/* Retire a connection ID by marking it dead, then remove consecutive =
dead
> > + * entries from the head of the list. The caller must ensure the numbe=
r falls
> > + * within the consecutive range [first_number, last_number].
> > + */
> > +void quic_conn_id_retire(struct quic_conn_id_set *id_set, u32 number)
> > +{
> > +     struct quic_common_conn_id *common, *tmp, *retired =3D NULL;
> > +     struct list_head *list;
> > +
> > +     list =3D &id_set->head;
> > +     list_for_each_entry(common, list, list) {
> > +             if (common->number > number)
> > +                     break;
> > +             if (common->number =3D=3D number) {
> > +                     if (common->dead)
> > +                             return;
> > +                     retired =3D common;
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (!retired)
> > +             return;
> > +
> > +     if (WARN_ON_ONCE(id_set->use_count <=3D 1))
> > +             return;
>
> [Severity: Medium]
> Can a peer reach this WARN_ON_ONCE() using only its own
> RETIRE_CONNECTION_ID frames?
>
> For the source set, number comes from the peer. The v19 changelog moved
> this guard below the duplicate-retire check so duplicates would not hit
> the WARN, which suggests peer-chosen numbers are expected to get here.
>
> A retired source CID that is not at the head of the list is only marked
> dead. It stays on the list and stays hashed. quic_conn_id_lookup() does
> not check ->dead:
>
>         hlist_nulls_for_each_entry_rcu(s_conn_id, node, &head->head, node=
) {
>                 if (net !=3D sock_net(s_conn_id->sk))
>                         continue;
>                 if (s_conn_id->common.id.len !=3D len ||
>                     memcmp(scid, &s_conn_id->common.id.data, len))
>                         continue;
>
> Later in the series, quic_packet_get_sock() in net/quic/packet.c uses
> this lookup to route the packet to the socket and set cb->seqno. It does
> not check the dead flag either.
>
> Take a source set {0, 1, 2}, all live, use_count =3D 3, with the peer
> using CID 0:
>
>   peer sends RETIRE(1), then RETIRE(2)
>     -> use_count =3D 1, CIDs 1 and 2 are dead but still hashed
>   no replacement CID is issued (count still includes the dead middle
>   entries, so max_count or QUIC_CONN_ID_LIMIT may already be reached)
>   peer sends a packet with DCID =3D CID 1 carrying RETIRE(0)
>     -> quic_conn_id_lookup() still finds CID 1
>     -> quic_conn_id_retire(id_set, 0)
>     -> WARN_ON_ONCE(id_set->use_count <=3D 1)
>
> RFC 9000 Section 19.16 allows RETIRE(0) in that packet, since sequence
> number 0 is not the DCID of the packet carrying the frame.
>
> On panic_on_warn systems this would be a panic the peer can trigger
> remotely. Without panic_on_warn, the retirement is silently dropped.
>
> quic_conn_id_retire() returns void, so the caller cannot tell a refused
> retirement from a successful one. That means it cannot turn this case
> into a PROTOCOL_VIOLATION.
>
> Would it make sense to return an error here instead of warning? Or to
> reject packets addressed to dead source CIDs?
>
> No caller of quic_conn_id_retire() exists in this series yet. Whether
> this fires depends on how the RETIRE_CONNECTION_ID handler in the
> follow-up patchset checks the number before calling it.
>
False.

The WARN_ON_ONCE is a defensive invariant for catching programming errors,
not a peer-reachable path. The RETIRE_CONNECTION_ID handler in the next
patchset validates the sequence number before calling this function and
ensures replacement CIDs are issued before use_count drops too low.

> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1795393690.git.lucien.xin%40gmail.com

Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9727B308F32
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571919; cv=pass; b=XhZHvnMZu+OCvsJs+0GjBqfvZP6j2IRff44FhPwcXTaLXDaE1bQI0kfL3Q8ZLmjWMrMQGw6g6Rk3JVeEO498bWIseXMmrYgpuL03EfahDLSJQTh1wh0YOhKJbrrY/wCJBGmwe7a5f8voUgb1AgWR88w/QthohXElAMFPWVFeyv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571919; c=relaxed/simple;
	bh=Dj+80PpyFtuTTPI24RANQuQHDc3eXfflbc+ICFvzogo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fL8x+Me2CjD00WP4CAJ10eaT9s+AXa8MtfLnwM8Rcdh7s7oXUO1C16H9sgikQukDLioLEOGjT4KX9PBa2fBd9t21SEjAQ0uw4BIHywPUtE4PcxZm0KtkL3prvEynzyxgHE5zW58lbXG98kGKrc1rHRpR/zIfVB2UMMKnd+YPSN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p4RWE+yL; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4RWE+yL"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85a4329731cso784077b3a.3
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 08:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789571916; cv=none;
        d=google.com; s=arc-20260327;
        b=K9RIFXoIOui7V8nO75L5YB+lWfIawhJ3r2lOnFmQ4U9SCsb6f3LKWs+yETxZRDhkuM
         JY8D1MLlDKIsTKTTsc8CB0ijpnDXG+rihPpkKeN0sOAKabsWC7nkrG9BLBZqiEa/yVlj
         6PddblzBJkvfFUlwZOFsV8laBDCD2UorF2KcwJiGxBCMDNhXQD6lxE5WJZ/foLwcy9Ld
         j3A7zyCQtxj9WcC8XBWcG9WQ3DAkK73O2D/rjpHE/w9yJ3f+TygbaHwln+TVZ5ARs6mh
         9def3/pqaGDxn5vXV6mQFcNjVoESUHcXniZEcJxuTkt3XG4KWCOKBZEnv5bX7jnswEjy
         SAIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BhkqwMNKc8zR/oVQWFJv9edBfd9F+9BsRk6J/+nHhu0=;
        fh=C9zxP77o3Qtd9ZVIIhta38eR080I8Ck+OEauGuYfFts=;
        b=P0BZMpe7tWrEkBFFKydBjtEiWS0B3lxzhPf3XCrR9ZW3vhjF8EcybivXJe/O/gjEg5
         MGVFa/v1zKfFZWEcUNzgWfG51uNDYwEwPSDeaWqkeymQQvAcNzxRFggh2XsHuuvkYqdE
         8wMke296XxS8gwOzoikbxRENnWNT4n5WuNcN+ZmhAZQXpf/VIuwKk+UYJ6X+feBdAKRw
         ydFStuk1SkPXrZ+bYDrzuW5ZcGnoVcH2n/sx9MiFtZSpzXKy364HD2umS1dRm7t2Ekbp
         VKPWjSqVpJBdtdXlaskv9rjjnmLkmYijLstXfh4iI6usGknUItx0eAOVFmbQvQ0U6hmC
         6mRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789571916; x=1790176716; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BhkqwMNKc8zR/oVQWFJv9edBfd9F+9BsRk6J/+nHhu0=;
        b=p4RWE+yLVV+sOe6aAUje3ANq+TVlh3WFQmrpA/zs7IM9un968nYEjppCd1T6WADAJ3
         p+IIiC0xeso7Pp0BSSeYUlU1n/0emfnWbt0HUcZebTvvSEu0Wz9K+U0gcDcu/FOUzngG
         TZ8+PxD2mJy+j+b+J/0hhqcs7Kjku2bOVoZurjR9lAvriw+EtYziEBK20LlVaNr2NVBC
         uXQ2jIN5ZAjKMiAFVICkbTg/ZkpVw8hm/OCB/0QPskkXvzLIES3hBkmTmdiBzYLjhDbJ
         TF/f8cpjAYOopKu+Vn9miIcEqxFZdB95/oUm7mV8EpcnAqEpk7HJheSVSTcgdECuuvmI
         LJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789571916; x=1790176716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BhkqwMNKc8zR/oVQWFJv9edBfd9F+9BsRk6J/+nHhu0=;
        b=KjPwNEpYuprtphjXRq42+ENV7Xfs7lmdGDihgEKMTBdHDIxc7pPRjckxr9CHf/NwOB
         bkURpb8efNZgovMlgssp1VDzgikVSxxcRTgQc410Aj48voq8HRkGynULTPLc3adO8OSq
         BbTAXEDGJh2vviozgsm8ciJUzTcZdW3derfnYtgAmnTPjJRRYJlY5xDyfUHi1hdVMQWZ
         xOtzHNHWG5O9AYrRj2KYmOmeXM1XFljtF6Pj/+gzlae2P2T+AFuKKff47w8OKTw03aFl
         RTbon5JnSzg9p4lFmvyV0p4WlaEct9oq4ocvvdGyr52Q7litr344RrAIzyVbLMT1GZHU
         xPeg==
X-Forwarded-Encrypted: i=1; AKwUvBznkcQQ6usKuKTNSL1vtySAKdqSVUkWIJ9AIliMAC15j99S58dQeqYiQNlRpGhmKNyHXIRKYdOGH8sB3f4AB/Z6tOT6IQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mfoifr/7RRmbOULNx+0O/K43pmBDCWcv6jDVK0+6zLbN2PYyGn
	p/bFh2qT6mvczJOptgUU4YanDFUyi8aDaI3AyDqZweyERMB/+teMVNB0qFXdAzWn6A5oWm+iAiK
	9iqgpvueu6PIwntfHxk7r7fWXj6pV3Ps=
X-Gm-Gg: AYBFou19CzbPQ/GgKj+1xWj/G0mKiui2ccO7okbGoQS8XFcuRnDfpujJKBopqhPfkBp
	st3uHKJa11yjqAjqYDlUxuWMNxD8Eo4D0zCSKfbsTDb63Xx4B/vEVUOtwTtm0fDtNTEpSKppY+z
	4K/y6qT4/6aapeQmUG6TnStI4XUb4YrkQQ9WwC2OW0pzmpi1p3b7RB73+1nIudqsk54Y4UG4Sgw
	PUcFkf68kDLujEjazJyfMojmCDEZGaQvxqmZrgk/jx7XZ+/X8XpNHJGZ+Rn0G1n9ihKJMRcoVNx
	8KHFGRTrcNCS36fFAYM3tg/PYexevIunvkSzD7kOhMGe0ZVvVeLErF/B/8GQ8P4PSbUdHKptHm5
	NVgwn1WHv7Uv+WS+msoVjJIht+Lr4fQoDKKhsm6HIOmOqJYj37kZT/QwE9np00cbJVFk=
X-Received: by 2002:a05:6a00:c481:b0:872:6004:f117 with SMTP id
 d2e1a72fcca58-8726004f36dmr4040074b3a.24.1789571915717; Wed, 16 Sep 2026
 08:18:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1cf83a4eb178197cd842e34468f4e357f42b9c28.1789393775.git.lucien.xin@gmail.com>
 <178950182306.22033.14152384539754204368@kernel.org>
In-Reply-To: <178950182306.22033.14152384539754204368@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 16 Sep 2026 11:18:23 -0400
X-Gm-Features: AcwNN1UEOUO9io4IO0BxkvntuRVWDPeW_lFsEE-noRtB4rxUETC2sWqvf53BLHc
Message-ID: <CADvbK_ejURHE3C6BPv+b=Qnu8jPAcWDHMmqYOyEQ324_qsgknA@mail.gmail.com>
Subject: Re: [PATCH net-next v15 03/15] quic: provide common utilities and
 data structures
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, edumazet@google.com, pabeni@redhat.com, horms@kernel.org, 
	metze@samba.org, mbuhl@openbsd.org, tfanelli@redhat.com, hepengtao@xiaomi.com, 
	dreibh@simula.no, linux-cifs@vger.kernel.org, pc@manguebit.org, 
	linkinjeon@kernel.org, tom@talpey.com, kernel-tls-handshake@lists.linux.dev, 
	chuck.lever@oracle.com, jlayton@kernel.org, steved@redhat.com, hare@suse.de, 
	aahringo@redhat.com, dhowells@redhat.com, matttbe@kernel.org, 
	mail@johnericson.me, xiyou.wangcong@gmail.com, alibuda@linux.alibaba.com, 
	jbaron@akamai.com, illiliti@protonmail.com, sd@queasysnail.net, 
	marcelo.leitner@gmail.com, daniel@haxx.se, andrew.gospodarek@broadcom.com, 
	mef@scarletmail.rutgers.edu, paul@jakma.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 3:50=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> - [Medium] Weak hash seeding in the new QUIC hash helpers:
>   `quic_sock_hash()` (net/quic/common.c:40-53) reduces IPv6 addresses to=
=E2=80=A6
>
> --
>
> quic: provide common utilities and data structures
>
> This patch adds net/quic/common.c and net/quic/common.h with the QUIC
> packet header types, connection ID and address helpers, the socket and
> connection ID hash tables, and the varint/transport-parameter encoding
> helpers. quic_init() now initializes and tears down the hash tables.
>
> One question below about the hash helpers.
>
> > diff --git a/net/quic/common.c b/net/quic/common.c
> > new file mode 100644
> > index 0000000000000..51d71b6733c7d
> > --- /dev/null
> > +++ b/net/quic/common.c
> > @@ -0,0 +1,565 @@
>
> [ ... ]
>
> > +u32 quic_sock_hash(struct net *net, union quic_addr *s, union quic_add=
r *d)
> > +{
> > +     u32 ports =3D ((__force u32)s->v4.sin_port) << 16 |
> > +                 (__force u32)d->v4.sin_port;
> > +     u32 saddr =3D (s->sa.sa_family =3D=3D AF_INET6) ?
> > +                 jhash(&s->v6.sin6_addr, 16, 0) :
> > +                 (__force u32)s->v4.sin_addr.s_addr;
> > +     u32 daddr =3D (d->sa.sa_family =3D=3D AF_INET6) ?
> > +                 jhash(&d->v6.sin6_addr, 16, 0) :
> > +                 (__force u32)d->v4.sin_addr.s_addr;
> > +     u32 hash =3D jhash_3words(saddr, daddr, ports, net_hash_mix(net))=
;
> > +
> > +     return hash & (quic_sock_hash_size() - 1);
> > +}
>
> [Severity: Medium]
> Should the inner IPv6 fold in quic_sock_hash() be seeded?
>
> The per-netns secret is only mixed in the outer jhash_3words() call, whil=
e
> the 128-bit address is first reduced to 32 bits with jhash(..., 0). Since
> jhash_3words(a, b, c, initval) is a pure function of its inputs, two peer
> addresses whose unseeded 32-bit fold is equal produce identical (saddr,
> daddr, ports) triples and therefore the same bucket for every value of
> net_hash_mix(net).
>
> Does that let a peer controlling an IPv6 prefix pick colliding source
> addresses offline, without knowing the secret, and collapse many
> connections into one chain of quic_hashinfo.chash (capped at 16K buckets)
> that the per-packet lookup then walks?
>
> Compare with sctp_hashfn() in net/sctp/input.c, which the commit message
> cites as the model and which passes the seed into the inner fold:
>
>         if (paddr->sa.sa_family =3D=3D AF_INET6)
>                 addr =3D jhash(&paddr->v6.sin6_addr, 16, seed);
>         else
>                 addr =3D (__force __u32)paddr->v4.sin_addr.s_addr;
>
>         return  jhash_3words(addr, ((__force __u32)paddr->v4.sin_port) <<=
 16 |
>                              (__force __u32)lport, net_hash_mix(net), see=
d);
>
> Would jhash(&s->v6.sin6_addr, 16, net_hash_mix(net)) here be equivalent i=
n
> cost?
>
> [ ... ]
>
> > +struct quic_shash_head *quic_source_conn_id_head(struct net *net, u8 *=
scid,
> > +                                              u32 len)
> > +{
> > +     u32 hash =3D jhash_1word(jhash(scid, len, 0), net_hash_mix(net));
> > +     struct quic_shash_table *ht =3D &quic_hashinfo.shash;
> > +
> > +     return &ht->hash[hash & (ht->size - 1)];
> > +}
>
> [Severity: Medium]
> Same pattern here: the connection ID bytes are folded with jhash(scid, le=
n,
> 0) before the secret is applied, so any two connection IDs colliding in
> that unseeded fold share a bucket for any secret. Would passing
> net_hash_mix(net) as the initval of the inner jhash() be preferable?
>
> Note the connection IDs inserted in this series come from
> quic_conn_id_generate() using get_random_bytes(), so the practical exposu=
re
> is smaller than for the connection socket table.
>
> > +u32 quic_addr_hash(struct net *net, union quic_addr *a)
> > +{
> > +     u32 addr =3D (a->sa.sa_family =3D=3D AF_INET6) ?
> > +                jhash(&a->v6.sin6_addr, 16, 0) :
> > +                (__force u32)a->v4.sin_addr.s_addr;
> > +
> > +     return jhash_2words(addr, (__force u32)a->v4.sin_port,
> > +                         net_hash_mix(net));
> > +}
>
> [Severity: Medium]
> And the same unseeded sin6_addr fold appears in quic_addr_hash(), so
> address-keyed hashing inherits the same property. Should all three helper=
s
> be updated together?
>
False:

Not necessary. The per-netns net_hash_mix(net) is already used as the seed
of the final jhash_3words()/jhash_2words() call.

Thanks.

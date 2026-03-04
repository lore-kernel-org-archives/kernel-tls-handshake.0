Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E769B36B045
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  4 Mar 2026 23:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772666819; cv=pass; b=fu7w+Dafin4YQf0HddZCsjom69k/9QXg/VNOHgfZfB8EUm78QpbvcWDXPU4RIDJKd+c0ubVkG9pYOfMpr2tYu10Ce2/XKQOhDYz9ckwT05o/zqho5eMM3C7C6zEuE0lwWrskQtS/viADR6qGwXhq9lyg5tbnLJVB3TXJXNslWQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772666819; c=relaxed/simple;
	bh=mNEKFaRMnDHfe0orczkAXGRlU1VB7gl1INEnkvG/KwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iI3GdHd9q6lgdvgebq6ymguf6QYgdEC0d52rm0zIyhJ6zZ9FJhzY8Ueo+uYBmVNQHR7K9Mz2JMaCuN88uXvifWkXwsowC5gGJBggUMvxYb9FvXsCAUCFjiopRlUcwJZz2JnWmhy6WPr+sNPdVdHWFlreaEw/n+SaE/dM4/y/q4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3+lLNbh; arc=pass smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3+lLNbh"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56a9076813bso3008341e0c.3
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 04 Mar 2026 15:26:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772666817; cv=none;
        d=google.com; s=arc-20240605;
        b=fyNLUGnPuYxwj4HIp4TmuYqtD2yLmQGrOSB9/mhPR3sZ4D64UdEMDXIlNI5UrnFnX6
         U/Yr4vIVtraq+eBDBpetn3Y+rE7wMNSi+D+WD/iwLA5idg1HU0GvSjBWtYukSyvil4Wa
         GSvQdmfgz/JemeO//IaG+kgqTySqLAsxpxtsrXFsplE70pveX3C007W84RfvzT9Ly/fz
         E7TOQxiU2o7OGW/YwZDDdHSGAQjfn8bsRYkJMx4f6+ok6rlWgv7RG+qT9XSfONXP1xjj
         LJMF+uLPlt6T5xlUQX+3Qbfha1NknB5xRoshZZl/WdFghdyr1CO1zaYaP23yrhhMtIws
         1y+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cTFDYsqZ964fQZj00eGDb1NQ/WjjGh2BRCQyhHEgw9o=;
        fh=p8CXSKI5IOCqQ6SG+6Tb9lv216LqQ213rNB2COoljW8=;
        b=ODemr5qn9JA/MUSvaYo7MUGvrnj+rLmtZHrHjl2d3u5HhcmmzmMugrNYPY66hJw8YH
         iPagVLd8db9sjt9gkOVw2SLZjzuz7muu6ytD/Puxtr3TJnRzpOY1rcQYPIe964tlbtfp
         eHC6+mPY5Bo2FT6m5wDdkt2Ffw/0p4rLk1vKoDwv+6z6oxv6H3gnZdgHp4IF19qU2/e+
         aR81aTWjET7d4WayKwNSuQCWNIcB+FM3bD47Kz2T3/dufFsy5xEJARM/oxY0uH935qb3
         rH5vxHMC2/CHgfTgPIGUZeEUvIgw78wtV+rDMOwGI9tXYjNeJk+za9hGcgSlWF2gKRvH
         ZLzQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772666817; x=1773271617; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTFDYsqZ964fQZj00eGDb1NQ/WjjGh2BRCQyhHEgw9o=;
        b=V3+lLNbhnU1K3E+yHod45QAYU4T6iy9Ab4O1cX5nIWOsnFMzQ/13fqWT7tCMp8tg3M
         LTwjRqC2IJ9eTKGhrOx7kZJwCMRdV6dH78YND1boWvesmpr7pkoUMPJ9ksnOGmIzd76b
         AV1SOR+3aVUu1r29U/Zx+nhQ/wEtsgWcJ3I+CzLsR1lAd9zCjaMVMAtnqFZGxN/QIqMM
         bUqsQKWV+HxyLCvG2wHP/MFqqGU8a9jlI6kB29HNXU0x5S12L0RzUkSMsUmRwOoIPW0r
         ZVZny6WqnYTmXNlYyOHB6dBotlc+MQYXjJF3MvhvxAb8AsKEMKXe/CPw6OZUNmZJlJ25
         4v5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772666817; x=1773271617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cTFDYsqZ964fQZj00eGDb1NQ/WjjGh2BRCQyhHEgw9o=;
        b=WWcw21cb9hlNudCiEWP3PirGBZOCRfPgyIyZ2SuTlDEfV6CCmVUczDWRm0zo6fzCym
         Duze4uwSSYbRamlAaiCBCmpWtrb3QYcplz/Q/lHipfC/Za5pnnhxX9GecrasZiaf2Vuf
         Y1ByjEgxIW4DZm7KT553qXpSqYMmlqZ3y9INGQ9+8vSkbhyPLsj6v3tT8KOAXsX/YS8o
         Vw8BhJehDz44U9gMY1nH0cEDNbZog3tcTRCVaQdFqcfr5Q75/3vHtjlQtATqhnxkrcP0
         /sjc3lV+XxZ9iqIJjI83HZUm/uwKBhFqGM+6+zSbHKpYoEB4M0HVSmHU1JMc7iFFYwiR
         eqGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXenCccmHONqx0CbVcTjK13iJmF5kN2WQuuAi0srlO6e5LsPIw6KD9M57x17DepskYwA4Svpj6NML9AgEr8tIcy94TLkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1yaN7W+Yh0x+U8q/UXlYFHCYmBZJn6xzrVP3CIjOEGDR7rZKR
	swSvpnag34l/OLlXGjGYPj/qHEOmIWclZsHsi6pqix65zlXJ/iFNCo38Jad6w2kZZ6d/EKoGOSp
	z7Ne6/UBvrYJag9ymqmiGTSf5mwBwdHk=
X-Gm-Gg: ATEYQzxYwdaLzXLOVPcsh1fnNRWQFU14PbWZSlbmJG/cXUY9hUAzqcxf7sy3/IhvVGT
	ttATw4yae5tNAq/Tmhy0wLGo4rtHh3c/8dwKEo1oC4WyUABKSmmjnfpFrGV8NC+vqGlJK78oRNP
	8hqUsi5RtwpqviOJyf/LCqtCfw2IcjkaJXRK3lyFpn4UXxRqaJQDBrHGSR2KiwxJu8Inhik4gKr
	9ozI1aUOs22aO6YLd8F5ot1ZdyXqvE9qCRRxvxRnrn3P+GOcftGBRY4cL8El3cbQrcFkvsmbQCh
	8htNVLoLOC/H3xVp/SEM5sEdg+Ud4+lVw9Ph+M8Gk6w+wEJOn4870TbUAkHmoVaxDPzeZSnM03M
	ZkKilS8dT/p/VcIZU
X-Received: by 2002:a05:6102:6106:20b0:5ff:b684:f796 with SMTP id
 ada2fe7eead31-5ffb684fcb5mr841879137.13.1772666816783; Wed, 04 Mar 2026
 15:26:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1771986861.git.lucien.xin@gmail.com> <e49a24b97a25a9c25bd33411b8212978dd566bd3.1771986861.git.lucien.xin@gmail.com>
 <CAF6piCJDWjOmgkspuk28qAF8+9xj_o-zTXkUdB+3_waZqaMXBA@mail.gmail.com>
In-Reply-To: <CAF6piCJDWjOmgkspuk28qAF8+9xj_o-zTXkUdB+3_waZqaMXBA@mail.gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 4 Mar 2026 18:26:43 -0500
X-Gm-Features: AaiRm51sN3852302sTemIODlyAcPk2eG-uFfqRRmkPhePbFyqTDKIq6vNte4qKM
Message-ID: <CADvbK_djqHEaj1nO1mAR0h9qpkTUX1cXGMPEjrswySM_1bXNvw@mail.gmail.com>
Subject: Re: [PATCH net-next v10 14/15] quic: add packet builder base
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
	Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	"Marc E . Fiuczynski" <marc@fiuczynski.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 4:19=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 2/25/26 3:34 AM, Xin Long wrote:
> > +/* Transmit a QUIC packet, possibly encrypting and bundling it. */
> > +int quic_packet_xmit(struct sock *sk, struct sk_buff *skb)
> > +{
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +     struct quic_skb_cb *cb =3D QUIC_SKB_CB(skb);
> > +     struct net *net =3D sock_net(sk);
> > +     int err;
> > +
> > +     /* Skip encryption if taglen =3D=3D 0 (e.g., disable_1rtt_encrypt=
ion). */
> > +     if (!packet->taglen[quic_hdr(skb)->form])
> > +             goto xmit;
> > +
> > +     cb->crypto_done =3D quic_packet_encrypt_done;
> > +     /* Associate skb with sk to ensure sk is valid during async encry=
ption completion. */
> > +     WARN_ON(!skb_set_owner_sk_safe(skb, sk));
>
> This is the TX path, how can sk refcout be 0 here? Possibly use
> skb_set_owner_r() directly? At least use the WARN_ON_ONCE() variant and
> add a comment documenting why is needed,
>
skb_set_owner_r() will do memory account with the skb->truesize, which
is not what it wants here. skb_set_owner_sk_safe() is used to keep the
sk not released during async encryption completion, as the comment
above says.

I don't see another set_owner_sk helper for this. Please let me know if
you have a better way for this.

For now I will change from WARN_ON() to WARN_ON_ONCE(), but still keep
skb_set_owner_sk_safe().

> > +     err =3D quic_crypto_encrypt(quic_crypto(sk, packet->level), skb);
> > +     if (err) {
> > +             if (err !=3D -EINPROGRESS) {
> > +                     QUIC_INC_STATS(net, QUIC_MIB_PKT_ENCDROP);
> > +                     kfree_skb(skb);
> > +                     return err;
> > +             }
> > +             QUIC_INC_STATS(net, QUIC_MIB_PKT_ENCBACKLOGS);
> > +             return err;
> > +     }
> > +     if (!cb->resume) /* Encryption completes synchronously. */
> > +             QUIC_INC_STATS(net, QUIC_MIB_PKT_ENCFASTPATHS);
> > +
> > +xmit:
> > +     if (quic_packet_bundle(sk, skb))
> > +             quic_packet_flush(sk);
> > +     return 0;
> > +}
> > +
> > +/* Create and transmit a new QUIC packet. */
> > +int quic_packet_create_and_xmit(struct sock *sk)
> > +{
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +     struct sk_buff *skb;
> > +     int err;
> > +
> > +     err =3D quic_packet_number_check(sk);
> > +     if (err)
> > +             goto err;
> > +
> > +     if (packet->level)
> > +             skb =3D quic_packet_handshake_create(sk);
> > +     else
> > +             skb =3D quic_packet_app_create(sk);
> > +     if (!skb) {
> > +             err =3D -ENOMEM;
> > +             goto err;
> > +     }
> > +
> > +     err =3D quic_packet_xmit(sk, skb);
> > +     if (err && err !=3D -EINPROGRESS)
> > +             goto err;
> > +
> > +     /* Return 1 if at least one ACK-eliciting (non-PING) frame was se=
nt. */
> > +     return !!packet->frames;
> > +err:
> > +     pr_debug("%s: err: %d\n", __func__, err);
> > +     return 0;
> > +}
> > +
> > +/* Flush any coalesced/bundled QUIC packets. */
> > +void quic_packet_flush(struct sock *sk)
> > +{
> > +     struct quic_path_group *paths =3D quic_paths(sk);
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +
> > +     if (packet->head) {
> > +             quic_lower_xmit(sk, packet->head,
> > +                             quic_path_daddr(paths, packet->path), &pa=
ths->fl);
> > +             packet->head =3D NULL;
> > +     }
> > +}
> > +
> > +void quic_packet_init(struct sock *sk)
> > +{
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +
> > +     INIT_LIST_HEAD(&packet->frame_list);
> > +     packet->taglen[0] =3D QUIC_TAG_LEN;
> > +     packet->taglen[1] =3D QUIC_TAG_LEN;
> > +     packet->mss[0] =3D QUIC_MIN_UDP_PAYLOAD;
> > +     packet->mss[1] =3D QUIC_MIN_UDP_PAYLOAD;
>
> The magic number above looks quite obscure, and AFAICS looking at struct
> quick_packet comments have different meaning. Please use some macro inste=
ad.
>
Sure.

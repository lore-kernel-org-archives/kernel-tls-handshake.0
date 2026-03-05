Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A677D288B8
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  5 Mar 2026 00:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772669697; cv=pass; b=j1dbFtp8EB8hAkn09zdPQGvGLPwjXRhD+UzKZHk5ptGopBMt27/2Q4xmK6b9OHgJ9n1uFpzJ7X5ZF/UGbvSfjrXYBwo8cCoxqsy0D/Ov9t3toqULxpGDqjFgxKH4/jByv++e8zavCMxj118UmxDhxj+o7her44nwjBgoNLXb6Ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772669697; c=relaxed/simple;
	bh=SNH6I/hhPmgSL35V+oZOn5ErlBAd3yoW65QFOWZVpMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LgTXRPqpFYXj2IL/gZc7QtPxY3LR1+GqoBnIErzviZKbbfZ54+kyD5evwOpwWW2nKdZNMrZs308J6yNVfMBd2qzXvVLT4wfFqGfAX9deedp1ysypwmr+n2mLlIq3KsVmUIc400uaFOO0s+ePEO74ESLC0Q+kRoL/usvFWQSKfSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFJr8a9S; arc=pass smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFJr8a9S"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94e578a0fa5so682524241.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 04 Mar 2026 16:14:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772669695; cv=none;
        d=google.com; s=arc-20240605;
        b=Pm2XzmL8NfXAaGhCb8AHDEDIBAEvMi0tlFOhMuQHjcNTb2PNKpU1sk9BiNYa4HNR8Z
         Al9lHCOi/oDMkWeEHhS7sP0MKb3q9O9dERNYckHhle6/jD+urIgQlUFnGPCrdy/+5F9l
         9pcWR0HCfDnXXbVrZbUyQXKfXBjszHxFezevcoldwePGoiQv/qWsC7SgJTsXyz9EK8Rz
         LTharAraZyTP2MGVpI06QLUbt9CgXCZQnWwECgmYVixFtr89H9pMc8l5RoW1pps8voSl
         j4b2xJJW119ZDcXyLfYIeiGTJEAw30hBmTFMt25QOtGmBg0OiU9iyBAhZBZLUX1INTTq
         6SUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HSyN+e/bXp99YEHDDoss7T3ytoS/JigyhF1102UzIKE=;
        fh=tW+1aY163dn16tx+3GM3GCVmyyBj1TpSTnCBRpkuInQ=;
        b=UgDroDi49hHjHj8hXyXJamDnUsRXOyiPSMwdqnNmOMeXtT+sIgCzxubH6KN2TdUpJT
         hDL1SpSEn+WYxyHxfvVaCjZp04FhlfY+j/hK7RZsrscjhujGQ+xardZSyK/YvhiLTaFQ
         hkdLwWai6DGtReDbxQ8fSpP+ioF+R16loGjehZmn05G43nAKRRs/fa7+8jABZRVhcaD+
         N7Nk6LjBP9nRBWx+8UQkVZN/h7J9GMRNHhOMWxRfym0dJ+wW/uM5NDJIVROdZGDNnIXB
         3yNupmb4OwB18qn+YiLvP3kqgcpER4+0NO2VVUQsQhox68pmrLfa1UMz+VbyoTG0Q3MP
         9P4A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772669695; x=1773274495; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSyN+e/bXp99YEHDDoss7T3ytoS/JigyhF1102UzIKE=;
        b=DFJr8a9SloLlhPPQ2j/MTVi4RIgEGAYD6NAUqVC4PBe8+Egn0wd6Kps7rM3YP32WFt
         9n+eKU6nniQ0AJBCsXdgKWmEpR3iuGBKwyhnUSWR616Umr2ExhNtaWEymGBNrJznEmRB
         q/SzRVSfjSDSbNrYvKD/goHmEsB/4zlGSRexzx67IbjM6Ra0op/8uVbTVitYiaAeyc9I
         gZbu7PDUNOqCNsQHNqWALuoX5Kk/S1Mn3D9HnPj4RuafjV6cytBuiG5RvPuO3LEtopnn
         OED0jFPP+tkyJtjWw2z6EWKv8hwYl9gS29cfXTSnyGjtHKzxfK42ZSsE5ITkeNCbvERL
         Obqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772669695; x=1773274495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HSyN+e/bXp99YEHDDoss7T3ytoS/JigyhF1102UzIKE=;
        b=wkIznVrrCNvLwmDLOHwiOVfSFjNSvGqvyONLgDCNiIduZakXg97jnP4Gx39nBcVyZL
         8OlYa6jGU4vQA9Zgo5t/DErsO1JpAvk6aMBBaNuOPp1Vdl8NVXEb6pHnCK2ON8iyR9pr
         Fz+eYBonRDYpV4PTMBh+HrOT75Qim/EO2gmmj9m/Rz4pnWOE7XtMpVEIFZ8+QqtiOra2
         V4MPNoujD2gyfGsm8tS7bqk3urT0sGlFU8jAa5WuNgXfIYas2dP2OalRxx8L+K6JDG1S
         KBOwTIEiYWQ8DX7ifkuAzL1SFI0TMma7TE9IP1ONET/TPWCLvEaRg1Tbr0OlLOonUraU
         XObg==
X-Forwarded-Encrypted: i=1; AJvYcCXTI8CmmlTvXPhseFzVQ6vWK+TPK19vAMkT5ILnybW0h6+7rJeGTefgYwF+aDq4JXyvJalByFvR/zpynvzohpS7KkwICw==@lists.linux.dev
X-Gm-Message-State: AOJu0YytyvCtAyx6Af1idDA0zT50s2n0kFHjvwAZkJnjKctTDgYjbRlH
	JMjwfonRX59bVxNriScJQKQKKy6TtGAo5iCNCnvtQrhiO+n5XTH0iwXSfoy+hPy7Y3Oh2gD2szn
	anowHUDmF7epgSfsN7O5NXS5gxQGhWC8=
X-Gm-Gg: ATEYQzyeF+CC9gv3Dh7g2xL397Zkd4I2icdsJi2+TM5+W5qyGA9M2pecOX5xS7x3ErZ
	OYrOkbKRRITtLQHjK5d/HwSFiaGKrcd5zIOF47YiYHjCHo4DLdLwrBVfHIDLAsh1kYYGZCrQSJc
	Out2lJKHY3yZIIf4QEvw+/FaqxMv4sxPrF2zxwbHZEZIspB5Q8Cfj3ziwSNXAznejVxfjkGnCaM
	6asbyQM/Xsi6P7Iz/aKu+yVJlugkudyZj27BQ3aktN/w2Kt7I5AyRzVrRk0+7UideZgZMZiZTDa
	xPTor52QaGaYLxUgAbq6IIhfYDTIF1WE9OGDFOLjKklW0qQ+1pIhXVC2PV66Z2CbL+xoVfej4VS
	AZ4OMyA==
X-Received: by 2002:a05:6102:2ace:b0:5ff:8b8:9f8c with SMTP id
 ada2fe7eead31-5ffaaf4b3bemr1900512137.26.1772669695494; Wed, 04 Mar 2026
 16:14:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1771986861.git.lucien.xin@gmail.com> <08a63705058aff77dd54fb388870f0bca6036c95.1771986861.git.lucien.xin@gmail.com>
 <CAF6piCKOiwMz9Le2vBV4_W3R0NR3TW_je+ow4SCm5eX867awyg@mail.gmail.com>
In-Reply-To: <CAF6piCKOiwMz9Le2vBV4_W3R0NR3TW_je+ow4SCm5eX867awyg@mail.gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 4 Mar 2026 19:14:43 -0500
X-Gm-Features: AaiRm50hxZ3LZQ8rWfNDJR5FazO0dRJs8u8F_F7HjgEpz5HRVEpNVToAMcIZlRk
Message-ID: <CADvbK_dhG7LZaRnz9JihHtboQmTLmudptGF1P+w5gyi=6Ls_2g@mail.gmail.com>
Subject: Re: [PATCH net-next v10 15/15] quic: add packet parser base
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

On Tue, Mar 3, 2026 at 4:16=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 2/25/26 3:34 AM, Xin Long wrote:
> > +/* Find the listening QUIC socket for an incoming packet.
> > + *
> > + * This function searches the QUIC socket table for a listening socket=
 that matches the dest
> > + * address and port, and the ALPN(s) if presented in the ClientHello. =
 If multiple listening
> > + * sockets are bound to the same address, port, and ALPN(s) (e.g., via=
 SO_REUSEPORT), this
> > + * function selects a socket from the reuseport group.
> > + *
> > + * Return: A pointer to the matching listening socket, or NULL if no m=
atch is found.
> > + */
> > +struct sock *quic_listen_sock_lookup(struct sk_buff *skb, union quic_a=
ddr *sa, union quic_addr *da,
> > +                                  struct quic_data *alpns)
> > +{
> > +     struct net *net =3D sock_net(skb->sk);
> > +     struct hlist_nulls_node *node;
> > +     struct sock *sk =3D NULL, *tmp;
> > +     struct quic_shash_head *head;
> > +     struct quic_data alpn;
> > +     union quic_addr *a;
> > +     u32 hash, len;
> > +     u64 length;
> > +     u8 *p;
> > +
> > +     hash =3D quic_listen_sock_hash(net, ntohs(sa->v4.sin_port));
> > +     head =3D quic_listen_sock_head(hash);
> > +
> > +     rcu_read_lock();
> > +begin:
> > +     if (!alpns->len) { /* No ALPN entries present or failed to parse =
the ALPNs. */
> > +             sk_nulls_for_each_rcu(tmp, node, &head->head) {
> > +                     /* If alpns->data !=3D NULL, TLS parsing succeede=
d but no ALPN was found.
> > +                      * In this case, only match sockets that have no =
ALPN set.
> > +                      */
> > +                     a =3D quic_path_saddr(quic_paths(tmp), 0);
> > +                     if (net =3D=3D sock_net(tmp) && quic_cmp_sk_addr(=
tmp, a, sa) &&
> > +                         quic_path_usock(quic_paths(tmp), 0) =3D=3D sk=
b->sk &&
> > +                         (!alpns->data || !quic_alpn(tmp)->len)) {
> > +                             sk =3D tmp;
> > +                             if (!quic_is_any_addr(a)) /* Prefer speci=
fic address match. */
> > +                                     break;
> > +                     }
> > +             }
> > +             goto out;
> > +     }
> > +
> > +     /* ALPN present: loop through each ALPN entry. */
> > +     for (p =3D alpns->data, len =3D alpns->len; len; len -=3D length,=
 p +=3D length) {
> > +             quic_get_int(&p, &len, &length, 1);
> > +             quic_data(&alpn, p, length);
> > +             sk_nulls_for_each_rcu(tmp, node, &head->head) {
> > +                     a =3D quic_path_saddr(quic_paths(tmp), 0);
> > +                     if (net =3D=3D sock_net(tmp) && quic_cmp_sk_addr(=
tmp, a, sa) &&
> > +                         quic_path_usock(quic_paths(tmp), 0) =3D=3D sk=
b->sk &&
> > +                         quic_data_has(quic_alpn(tmp), &alpn)) {
> > +                             sk =3D tmp;
> > +                             if (!quic_is_any_addr(a))
> > +                                     break;
> > +                     }
> > +             }
> > +             if (sk)
> > +                     break;
> > +     }
> > +out:
> > +     /* If the nulls value we got at the end of the iteration is diffe=
rent from the expected
> > +      * one, we must restart the lookup as the list was modified concu=
rrently.
> > +      */
> > +     if (!sk && get_nulls_value(node) !=3D hash)
> > +             goto begin;
> > +
> > +     if (sk && sk->sk_reuseport)
> > +             sk =3D reuseport_select_sock(sk, quic_addr_hash(net, da),=
 skb, 1);
> > +
> > +     if (sk && unlikely(!refcount_inc_not_zero(&sk->sk_refcnt)))
> > +             sk =3D NULL;
>
> Note that you could avoid the refcount if you keep using the sk in an
> RCU critical section. i.e. plain UDP does that. Same consideration for
> established lookup.
>
Doesn't seem easy to adjust the code for this, I will leave it as it is for=
 now.

Thanks.

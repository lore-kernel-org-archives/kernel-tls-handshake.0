Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A91D2E889F
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 23 Aug 2025 15:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755963665; cv=none; b=MzyWDPcCmbXmgeQ+zEB14G7n/vZGU3NLFo8fc+i3tMale7pPA8iD78wMmQvTF+kmzvbMf3NhCWdEeVyGwcpKUEmVZcfUQlujBzGFWSzuPENHkWsFNsJShlLKJIZdlj/YM3EhJ+UCxdgI2zyZPJ7qb24aX5c4ZpTIhuYemgXfPy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755963665; c=relaxed/simple;
	bh=6iU2aynSLSee+E5Dopkej0Rgy69kifMRkgq2/0PXcH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SuXcBxlYGy2jcKuaYlbMwiBln7fwd1/iLfdJo7IuBAXI79OG4ToXL6ogbpZUWptJKHtnJzFUdqu+e25audmHytpmcAstyD84Hv/TKSQvwr5rjDKNGDe74mM3oma/U7WXvnFuYdjjKHzEuxSRSW+4Gpo3yJse+3BJbiVidzDGStU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMLgxNBq; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMLgxNBq"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3e67d83ee4bso15191635ab.1
        for <kernel-tls-handshake@lists.linux.dev>; Sat, 23 Aug 2025 08:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755963663; x=1756568463; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GK970f6W8v3dUSj26yOJRFemswkS/yBYwR0vBetrEbo=;
        b=WMLgxNBq208LvxRVJSYS4lYKtC3RRdzKXadaHmcI70bUFpDGQ/gomp54lmlbrQS4WL
         9k/8SvPNSncbgJP9w3y544ZpLTv3D+M7WLapX3MUgLN1SJ96SRItW6P6ZS7/Ux3I6+vD
         69DjAkTEjyUH7/SPxDBBIbVeCW0MiFzq0xd2Zxrj6XlVQMqybtDT3X3Zf5Vd4kBsA/IK
         ToSumOoUU0OM7hbJj6mDwfeKlibNuVKpzrF5G2pGvQlMXXU/B80B2JSESP+BogDLyhqz
         MHDwT9HShEeDaX3RLHM9wagpOvRmMpIAfO2B5+RKFOCHw0RS9lE6Nh+F80b1urrpzNO9
         hqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755963663; x=1756568463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GK970f6W8v3dUSj26yOJRFemswkS/yBYwR0vBetrEbo=;
        b=dV7Ya5aZWBjNyeze5AIHHSWT/DmcR+QCULCM16xhMtFM1gHmYQ6xGl+uXdtSEK+H5E
         d5qXQdX2p2iZSenwt0oiN7vzQ+f0F/aQW5LVQp3ZGHd8V9xd2JT531uL8Rs98sjYBbla
         5RhdWG8nRD621/I4nH4Vm7nKSMSoNsBXP6EjgRjmcM8PfSWlZypiSplyxpHMqWvYnb9i
         dPFQvUn8hVvLIT33rF7JzKrw6VQ9l3F+qmymZiWjpm2J30QZw6zqrAJmwMq8/5+Tpgpt
         Rn1rQ+2tESHnLvPhXsWbJqPF2g+5R8xLn/nZdV7LhJwuDHpIik3O3/tLoBqjw2Wve4AZ
         Q2gg==
X-Forwarded-Encrypted: i=1; AJvYcCX/LtkZ0wXFaxd2CWaDozZhEDjwCsAQbbZIP+1c2omFqQOg8leT2LhT/koTozGXfLX2IilubQILVB7aNeVf28tsD7kGdg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxN3NwbAJAcOEgQI4d9DBgh26YCXrDLx4XgDXBCt02JQ6bDEYTk
	WnR65iVILG/pqcnq6xaOVQGbldqvRc/DbNBOlbS1cwYlTn5Rvy5HFKIiHxhBHDtl7MBNZoNh3SC
	wY7SsX+VK45YvSBwdfqk/kRVt6kmhlIE51w==
X-Gm-Gg: ASbGncuFBTFd2jgBD6d5oyhnMNzmXNkpotY+4FQTe6gi+mz2/6EoqnyfViB7qhBGy15
	lb3L0JdCaF6fz6QPklteIO7t/7PO6/6BKQtee6NsbTStyQ6+fHzStvH5YGomOrQEbgccCZTX+Sj
	byftTaFkF5F8cWWxr85U2EXOk2LxpVLjOo3LdeV0y84IOuMaWuJ2Di03oR9o8fdJv5jXU/9bGHL
	8Zj1BSrAQ==
X-Google-Smtp-Source: AGHT+IESYRh8i7xlc71145sLwSk6o7jgXXpkeEyxFOYt+GdWSWEwp55HWkwzH5gnJnP9Y4VANKPEMbZ8VhasRb2Fw20=
X-Received: by 2002:a05:6e02:1541:b0:3ea:9da1:b653 with SMTP id
 e9e14a558f8ab-3ea9da1bb37mr37217535ab.16.1755963663223; Sat, 23 Aug 2025
 08:41:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1755525878.git.lucien.xin@gmail.com> <507c85525538f0dc64e536f7ccdd7862b542a227.1755525878.git.lucien.xin@gmail.com>
 <a45ba272-685f-41dd-8582-6bbc5bc086bb@redhat.com>
In-Reply-To: <a45ba272-685f-41dd-8582-6bbc5bc086bb@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Sat, 23 Aug 2025 11:40:52 -0400
X-Gm-Features: Ac12FXzb4OuOZTD0SjAL8bodcf6jguLEYM91QZYQC9_n7a90QBtcGXoJbtIyI_M
Message-ID: <CADvbK_eLTAQkFPNF58fBRqeZzRycBX0EeNk-P=HPc+Z-__JU9g@mail.gmail.com>
Subject: Re: [PATCH net-next v2 08/15] quic: add path management
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

On Thu, Aug 21, 2025 at 10:18=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 8/18/25 4:04 PM, Xin Long wrote:
> > +/* Lookup a quic_udp_sock in the global hash table. If not found, crea=
tes and returns a new one
> > + * associated with the given kernel socket.
> > + */
> > +static struct quic_udp_sock *quic_udp_sock_lookup(struct sock *sk, uni=
on quic_addr *a, u16 port)
> > +{
> > +     struct net *net =3D sock_net(sk);
> > +     struct quic_hash_head *head;
> > +     struct quic_udp_sock *us;
> > +
> > +     head =3D quic_udp_sock_head(net, port);
> > +     hlist_for_each_entry(us, &head->head, node) {
> > +             if (net !=3D sock_net(us->sk))
> > +                     continue;
> > +             if (a) {
> > +                     if (quic_cmp_sk_addr(us->sk, &us->addr, a) &&
> > +                         (!us->bind_ifindex || !sk->sk_bound_dev_if ||
> > +                          us->bind_ifindex =3D=3D sk->sk_bound_dev_if)=
)
> > +                             return us;
> > +                     continue;
> > +             }
> > +             if (ntohs(us->addr.v4.sin_port) =3D=3D port)
> > +                     return us;
> > +     }
> > +     return NULL;
> > +}
>
> The function description does not match the actual function implementatio=
n.
Right, I forgot to update the description after moving the creation out.

>
> > +
> > +/* Binds a QUIC path to a local port and sets up a UDP socket. */
> > +int quic_path_bind(struct sock *sk, struct quic_path_group *paths, u8 =
path)
> > +{
> > +     union quic_addr *a =3D quic_path_saddr(paths, path);
> > +     int rover, low, high, remaining;
> > +     struct net *net =3D sock_net(sk);
> > +     struct quic_hash_head *head;
> > +     struct quic_udp_sock *us;
> > +     u16 port;
> > +
> > +     port =3D ntohs(a->v4.sin_port);
> > +     if (port) {
> > +             head =3D quic_udp_sock_head(net, port);
> > +             mutex_lock(&head->m_lock);
> > +             us =3D quic_udp_sock_lookup(sk, a, port);
> > +             if (!quic_udp_sock_get(us)) {
> > +                     us =3D quic_udp_sock_create(sk, a);
> > +                     if (!us) {
> > +                             mutex_unlock(&head->m_lock);
> > +                             return -EINVAL;
> > +                     }
> > +             }
> > +             mutex_unlock(&head->m_lock);
> > +
> > +             quic_udp_sock_put(paths->path[path].udp_sk);
> > +             paths->path[path].udp_sk =3D us;
> > +             return 0;
> > +     }
> > +
> > +     inet_get_local_port_range(net, &low, &high);
>
> you could/should use inet_sk_get_local_port_range().
>
True, will update.

Thanks.

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792529759;
	b=lnlMYHM7gGBjclemuLnDp6A2rkTSJ2CujUmshIPmetqp2sSsL+b/eq053uTd1YNp5fo8
	 8TCKzplKNQgLoHVq1lMcoqRamMBVm0myIfOZymnaICQsGnY25Z2S5Y1tMdwid7AvXpAQy
	 7D9F3WhDXPL9r7vO/XbL/r6l9TYHeBTdEo34DUy10F8i0GHg102CZi5xQbiTiK7OjM9wu
	 rd6O6YWP156zHxatNzwKNx0wGh2o9UcGyiNbviGMN6mRYfgaY90zOmoju8hqued51QtYA
	 IeIP+9FVavG0hpdd3azhzjs3XuxSgAW5mUQxmqBr4G9ObcZz5vVeT1QfuLrT9DE+3lA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9va69Z70VDBET6RC2fy59u2Ycvr0LSmJxWPH1bvD2co=;
	b=z823mdiYkUad1JnIiwqjcZE5N1idZZkfo3JB3Vlz7CEorKR1vzwThC9IE5i0np9kIqP6
	 wbLeBCRwLUxaA4Mu1/+usTkguzc4/uhXtfhYK9hIBaTKZPJE4r3kfdfQZ89Bld8awmOuw
	 T/TlvpJ4tqCDJo9TUfpvukcOhpiphX2v/nudEHAxc5A0pGmJKn58bbgIf5SGem2ShtZ+z
	 sGiQsJJbrcM4pB7lvJRjqQtksc9KaBvVvwTqsIwFfuu5gVgwp5hmxvWEFefMIB3emGWzh
	 dZ1VvhGzgia0BbQnjYz7y7Ph4OqMgas9ixNqJvQmZFZ13MGMS0nUSwTkOfjfGdB+JiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PDEXopoO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814A3606A31C
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Oct 2026 20:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 814A3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PDEXopoO
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a06210b29fso16487b3a.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Oct 2026 13:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792529758; cv=none;
        d=google.com; s=arc-20260327;
        b=jbJgakSNtOZ1YMDXnnqCoxYMZOnxIPF3bdeXrrJL1oX/Q4HIoMcrozLvCZvzhZDKQS
         +yQWqqbUbqMM8R7OJxQZW15nahpmGhNkzcOcJe3UX8VLy13KJ0B2T7ctWJCw6AwGWQD7
         JySpolSvJKrIULpD11KcLx1dyKNJzCwWCfvLxWUgPnCGiS6RgcAC48Gl/GOlHKKGzY/A
         to+tciZFXZAg0f7LUorasOWuQu2ikyuZFWFGFo5H2eJhpf2NoqcwxDQ/L14sUYCuiMo5
         /nZRsBtjEBDSkJsiKNGNMzQqubpOgE/M+bAklgTs8GILlPBrzvzJ3EshDBua4YwqJpSX
         TgPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9va69Z70VDBET6RC2fy59u2Ycvr0LSmJxWPH1bvD2co=;
        fh=gSjKF3uA336BXqFVwkX8ouca5P73DVgWlvZl8tpnSK0=;
        b=Aclb47GkKZgRQdSN3z0iQkHX4sKcyC9oIB76dWOVvmsV2Fk/LCD9ey17wNd0oPWEvD
         CRktELSIaIiUKic2UY70rx1LyPH/mllpgSLgye0CtUaAuM4yy3x81dCY0sm2LgV0uyCK
         QQ+rOentoV5IpJ2MulTxcOpRf1JWABPVb+QekZbgcedWP1lGEVf/GWp1/CqlI3T5rs9S
         iN3y4OXUhHH86a71Td/xrxewNTghHvOHfgRUWoTlQ1lQkFImwsUDeMrDAyS3ZwBUIAIM
         5Ft3K9MzIhwfF7UrqnQ1LYxCHokitmHzc9QncSh3M6d6gqgL233KnUr1s2hbwgb/HySu
         T7vQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792529758; x=1793134558; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9va69Z70VDBET6RC2fy59u2Ycvr0LSmJxWPH1bvD2co=;
        b=PDEXopoOQZvlNMysAWJAISCMzUjoaMLPQZTXDk6FzA15mcpjCXZqZY6HbhQMt7c5pP
         RX6QzsOLjBR3zgmObVdqujNbzlDIAz5gP+04rHBkNe5nhIUSCGHJaOKsNdcyNpv+e/+c
         MxknR2nK/VAl6mbAmMQHbIalUjl2a6cKBH81B7IyZDyUK01XdWSY4sP5qLg15nqgbdLP
         7LHYoo9ss4Bi6JGjmu3cFjjP1+sCV7cDPThHp5hnllR4jxPaSmGa5Cdyry6+dNWifHfz
         mpf5yfHjsFG5xzIruDs/ajAhBVnkHbxvI1l0Z8E/7ejmUqzEl2inL2Ox3l0MN4uys2RH
         GPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529758; x=1793134558;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9va69Z70VDBET6RC2fy59u2Ycvr0LSmJxWPH1bvD2co=;
        b=vvD6cuiyaHqTo7WLhFz7GBXexTzeLF+HqfXIi0vra0YTNN1/zqOx4Ce4kqCZCKk3pK
         4Hg07sZB6rApXJzTPVOuMZR8PJRZRBsQGO1s3bMVdcdt4GYd1c/erKSMTfc/N7IsnitL
         xrb0LEwD7Sva62p+jIl+FqpymkI/9wqtn6Xigxs0izSdxJsOWusDZ2DcfrM16MKZkp+n
         6f8LO1abRpeTGy0Ud8xWUXLOBwqw5y7hXf/bo6WiM7ObnCNbSUdbQU4ianiWGY1XSse2
         KTnkIzDISbHyWNut58R/Q1GA/hGDEKTNo5HqssM2zvIotNPw5X3xffN8zhXJm/bBE+CS
         U9FQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQaR1tV8s7HHCaq+x9Q3mg2Rs5+PuRuxM1vPsZi/Kxmml4Fx4UXtlRzmWWHP9q6wBKaOt7WF2GJHW6kR36p63mvJ7/pA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLG2Anj725PcE4sTr//qHIWOrkoa4O5B50n+4U4oEqEsT5p3+l+
	KLZTKgjPj7yc5MpHQ7Ydy5iUNBOPmo2wK/oKhVV1RQGdIyQorSmHpVr19c4EtMdpKH0JwP+1zvG
	jhiF9ruGdt15Ls3Os17beK9XE+6t5cr4=
X-Gm-Gg: AYBFou0j8Woktfd0QtGsDfK2cxgXBiFsDzsniFiNfnvAqs/aUeI6ouds0Gi80xjE5ej
	6xL0Z6J76NsKbxkmX7fCdEDE+ECVHTh2FjE9Jn4KZOm+SbdwFk39tfLQVzLz6dW4zL3XyC5n+F8
	kowvCp2R9wKOi/QfpUjzzqYIzyAFwO0/5IQTRlIuNOVn+UuZGQLsc7kIa3kRHBWW77UGKN77Sle
	rWf14tBAoTzkpIZ/AUETjIhqsZeNsSj9WfuRdOuP60U3LAIFklVbXkj4mJJcv24EaQjz3YIZY3+
	ecAc8s1p3H1VjB1VT08Wpd2ytX+57OS2tVOLvq4bp98dwZjBnA8FRkBmzg2cCnSSNhw8EC4s5GK
	LV4QVuLo9RWjXrKYxkVh7NCI6qdoZoX3lc7KL7fHc1XDgHDCDkjFeIzSBWlmk0wRosOF/tA5Psa
	wfGO6IBFCFFKhD8w==
X-Received: by 2002:a05:6a00:4c92:b0:89e:261c:447a with SMTP id
 d2e1a72fcca58-8a089d8f4cdmr110909b3a.7.1792529757792; Tue, 20 Oct 2026
 13:55:57 -0700 (PDT)
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <1da72318e969eb252977ccf5d8e3e506c2fa2e69.1792164438.git.lucien.xin@gmail.com>
 <179244540463.3135.17132817693152829356@kernel.org>
In-Reply-To: <179244540463.3135.17132817693152829356@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 20 Oct 2026 16:55:46 -0400
X-Gm-Features: AclHuK_xypNF_3ZupZmQ5gCHrMwwp4u_9BbDfwJ9qW_3NU4_ksSvUmCEVd-BZ04
Message-ID: <CADvbK_d=J7Oq8VQFRYzoxX0YPs26tnJvxE7wMa4hyoe_M5n39A@mail.gmail.com>
Subject: Re: [PATCH net-next v17 11/15] quic: add crypto key derivation and installation
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
	mef@scarletmail.rutgers.edu, paul@jakma.org, kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:30=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] quic_init_sock() (net/quic/socket.c:58) sets sk->sk_destruct =3D
>   quic_sock_destruct.
>
> --
>
> quic: add crypto key derivation and installation
>
> This patch adds quic_crypto, which derives and installs QUIC packet
> protection keys for the Initial, Handshake, 0-RTT and 1-RTT levels. It
> handles key updates and stateless reset token generation. It also adds a
> quic_sock_destruct() callback that frees the per-level crypto transforms
> when the last socket reference goes away.
>
> > diff --git a/net/quic/socket.c b/net/quic/socket.c
> > index 12f0817c8b55f..9b1106a9f5e73 100644
> > --- a/net/quic/socket.c
> > +++ b/net/quic/socket.c
> > @@ -40,10 +40,22 @@ static void quic_write_space(struct sock *sk)
> >       rcu_read_unlock();
> >  }
> >
> > +static void quic_sock_destruct(struct sock *sk)
> > +{
> > +     u8 i;
> > +
> > +     /* Deferred crypto free for async encryption/decryption. */
> > +     for (i =3D 0; i < QUIC_CRYPTO_MAX; i++)
> > +             quic_crypto_free(quic_crypto(sk, i));
>
> [Severity: High]
> Is it safe to free the crypto transforms from sk_destruct, given the
> context it can run in?
>
> sk_destruct runs in whatever context drops the last socket reference.
> Later in this series, several of those contexts are softirq:
>
>   quic_packet_rcv() (UDP encap receive) ends with sock_put(sk)
>   quic_timer_timeout() ends with sock_put(sk)
>   quic_packet_rcv_err() drops its reference with sock_put()
>   quic_packet_xmit() takes a reference per TX skb through
>     skb_set_owner_sk_safe(); sock_efree() releases it on TX completion,
>     usually in NAPI
>
> If the user has already closed the socket, any of these can end up as:
>
>   sock_put()
>     __sk_destruct()
>       quic_sock_destruct()
>         quic_crypto_free()
>           crypto_free_aead()
>             crypto_destroy_tfm()
>               alg->cra_exit()
>
> The AEADs come from crypto_alloc_aead(cipher->aead, 0, 0), so an async
> hardware implementation can be selected. hisi_sec2, for example, register=
s
> both "gcm(aes)" and "ccm(aes)". Its sec_aead_exit() calls
> dma_free_coherent(). Behind an IOMMU that leads to __iommu_dma_free() and
> then vunmap(), which begins with:
>
> mm/vmalloc.c:vunmap() {
>         ...
>         BUG_ON(in_interrupt());
>         ...
> }
>
> Can this hit that BUG when a QUIC socket is destroyed from softirq?
> Listen sockets already hold AEAD transforms in this series, via
> quic_packet_get_alpn()->quic_crypto_initial_keys_install().
>
> macsec hit the same crash and fixed it in commit 6624bba469a3 ("macsec:
> use rcu_work to defer RX SA crypto cleanup out of softirq").
>
> The note about in-flight async requests holding a socket reference covers
> the lifetime of the transforms. It does not cover the context in which
> the free runs.
>
> Would it work to defer the tfm teardown to process context, for example
> with a work item or rcu_work queued from quic_sock_destruct()?
>
True.

Didn't know crypto_free_aead() must be called in process context
due to the async hardware crypto implementation.

I will  defer crypto cleanup to a work thread like quic_udp_sock.

Thanks.

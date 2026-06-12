Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD43C322749
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jun 2026 20:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781297329; cv=pass; b=qcnP7vIocDcgSF5Y5lBBxI+mnDuXsXDWlnFBIdHG3giEhGEysc5EXrqjI7or3nvodgp6NB3jQU6ZL8gq+Up1GQVPxJ0Fz72xuk6p9bKwp9qSSSOqP8BAE/BPt+disJoQhSXgeDcZkBsog8kDP6xJasRklEFoWmxkTUdCh4vKpbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781297329; c=relaxed/simple;
	bh=/Fphz4AEg7VLjRCOZxlhmLxXkJAlQQIuOqqXUfYvmhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JcHD4fYA5iSreNTo9RAgLgy8It0y1BMTT0+LhG5DQvJSBAQaD7nwWvJObjPsTcJkmbN2L3/lpanVh65GLB8NXAteFsJ2sW9eDR+v6m7nN5wQp/jvhGV95qTjOl2/q2Zglfr4zis74eLWZBZ/Rgk4MuyLbdaz8j5tFp7p8jUDUH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTI40QaY; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTI40QaY"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84347ad88edso958952b3a.1
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jun 2026 13:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781297327; cv=none;
        d=google.com; s=arc-20240605;
        b=X/Kt1V+g1/QBagUGdUnXYKHImrYLkOvxQCPJuEew/8r4uKn2beB9SGFyVbfGvf3Q8N
         NaorO9bjjMoKXzVkMdUIPCrVg8L1O/z6AlrYDe5O99Vm/3jDON6TC2JAfwimAoJ5YlxQ
         KQMVV0GmbQ+eb7QDN1AHsvMlyqi63EcDa01IosbIGllZDXs1n+jbafz9GvUUSRgBzwFy
         ogwwi0+Mt8stxf+Yc4Lsc8l50OTvdpIJ4hUYBgZE0lO/RcaIUACllvvEnAmadg16St2i
         MCOFlyXqB8BirkmyZTQ38d3w54Ti1uGqPtrutcCdgWBda+fPxhA7zqjwyC+lmt9uXYZz
         Ga5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c8b+p6IKKfS6Vat52avOATunY8iF7eAXvlismBPMZXo=;
        fh=AHAJ+ysevrx//t8OzVi2pfpHrZ5fbowXQlc3gXBeRDc=;
        b=PufORCzlUy1DGm3jpCAaxAuObT+FulIRHf6QCpD9JdYos47HLR7Ie2ImswTh13dGhP
         zb12vaLIDwwh/y7iOqdrMtN2Z5Q4uBLzEG62eRUlo4AYEAJfF4GgTQmTGYTiUm592oBe
         /k/CEXe42g+zUw4bBT5rNpneO48E7uJ7Gijghf2O1Oo7T+nvpB0J9MBeMgpEM7D52H+m
         Y6C3igQjM/7kbzpWaArsFgVkFLbJEuWZ9/pP4kzZ3cbPzvblc8vA/W8Cj6QqG05wRCtQ
         1hwcxHQYzCb5N7Addb+pOwoc+VPuiO+znoA2tDTbGp10yqaHyeagxnNlYQ/piRNzo8Lt
         lpRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781297327; x=1781902127; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8b+p6IKKfS6Vat52avOATunY8iF7eAXvlismBPMZXo=;
        b=bTI40QaYyEogVla2b3REqxM+8Z1R+NBvpdkkR6hFbnuR4f7IuxXrAteZ3qFZJHDX3l
         SIA9RoONZKfr/yNEagqezDFuYgn0m6HQnFKVhOWeVY9gGN6LdNBHOx3xPEKP6M6hwHXo
         I6EX3QqjB/h5STjZyzhHmvFTUCKI1g+NYh47CtL76JCiRaWDHChq2UFmkC7O7AQm9CBJ
         YG74VTdQrEu5z3D/k6DnQIDeU7tU16nV9sfo/fG15pAav9PAaJoswaU8gEKyuoSbM9XN
         6TcSkeQDaR+CABEIWwa+kEKq5lBJquCAvD0DW9b463dlmA0GN8uTX7iFULruaTnAwVkM
         Pubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781297327; x=1781902127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c8b+p6IKKfS6Vat52avOATunY8iF7eAXvlismBPMZXo=;
        b=ljm0BzBMs8YgpLtQ8AVnGjBiJI3zF+ON381k+B97Szpyg18/lBul76kwZmM/uDHFIm
         Ssxocl9aLebBKF/34Mld8ZaiOhXGsBiwZETsdCQY5Jl0a+ggJ5DiqoU5XSfppzklie2p
         R0Ve2tl9SD6R8KlQLqlIovcKdaMD8yDpmSO7IGuF5dei5EXAdQiTTEhxVVOg0Xcq+ODS
         VUrMARsimcUi/mnyQVEJMoE27yLrHhlTYVRfnq9aTF097vjumiBcNjAufxqO5IaKfZxG
         FAON9KfjOThf8hbB20UqeV2ZGkD6dXRL2lqEFyExrK10j9NpC3p6Jr27kp2vtec9brGZ
         uTKg==
X-Forwarded-Encrypted: i=1; AFNElJ/Jajz53xpRbvSpYg+M6041PO0Ef/gqF1IiHRLOdA8UCNBN9cLEelacVCuQMDZ3eScvJJPNjVzkYJ9vIeIipTTH8KOQSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YykLmSr+h1LkgfkB0fiKi3qLkCVrhB70mQOtLHpxMJn0EtzYz15
	+BXw9lF6R7C8QJhTnMF0ExiHzHwwxL0149BlAFAZaQRIDwoO9kmoLvyPI9RIFvbeYPyni7q+gzY
	AuU2IvmuGgEaPtDUV6Z8Y9qeHfmreCTY=
X-Gm-Gg: Acq92OFuKaszVUhCbrB+8rbDHgMvhHX3aDOyLc8uDn1iX4o1Lf0T47Mmy4s5z58xMU+
	79KAbCXW5lOsTvyTcQ4sKcIQ3VpBSbphRJ5DdSF1A+d1iPgmkd3iI4DmFIr3J0ROM3oT6JA8CvV
	dX7d3wHmEM3fvLvCYQYoyWCYVV8hszAaN/zmH1A/ueKTTJc4G5ouBWP2qtBghV5af9RYuTtiGnr
	45saPE8F1zhMucXDiqHWEgEKwsKb0JqgVMcdx463L2WSqLhsG+477yWQ0V31vFBZz7ccMGimTFV
	clLooK0Hdj1CzJP107rWBYLVnUr4INCVn7OV/kF3gCS1fbjlm6DxZ3R0OSYQ8uPwenDvE1Vo81m
	fMw/iWA==
X-Received: by 2002:a05:6a00:2351:b0:841:69e4:f21b with SMTP id
 d2e1a72fcca58-8434ce6b56dmr5081219b3a.39.1781297326992; Fri, 12 Jun 2026
 13:48:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0b03854cabaac243a0cdf42375c66cd033750bd0.1780855297.git.lucien.xin@gmail.com>
 <20260611082008.138377-1-pabeni@redhat.com>
In-Reply-To: <20260611082008.138377-1-pabeni@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 12 Jun 2026 16:48:34 -0400
X-Gm-Features: AVVi8CfE7HTOI2SzE8B2TbKR1nN28BzQl7R5aNYkEsfQb-6dW-l_TEr2rNPdIw4
Message-ID: <CADvbK_eHGSu3Epj-oGudVmjWwas-goF2rFGb-J-vYOvW+L9Npw@mail.gmail.com>
Subject: Re: [PATCH net-next v13 15/15] quic: add packet parser base
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

On Thu, Jun 11, 2026 at 4:20=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> From: AI Reviewer <ai@example.com>
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://netdev-ai.bots.linux.dev/sashiko/
> ---
> quic: add packet parser base
>
> This patch adds the QUIC packet RX parser, including ALPN extraction
> from the Client Initial to demux to the right listener, an ICMP-driven
> PMTU update path, and a per-net backlog/work for deferred parsing.
>
> > diff --git a/net/quic/packet.c b/net/quic/packet.c
> > index ba5204aceda6..430fc06d0012 100644
> > --- a/net/quic/packet.c
> > +++ b/net/quic/packet.c
>
> [ ... ]
>
> > +static int quic_packet_get_alpn(struct quic_data *alpn, u8 *p, u32 len=
)
> > +{
> > +     int err =3D -EINVAL, found =3D 0, exts =3D 0;
> > +     u64 length, type;
> > +
>
> [ ... ]
>
> > +     while (len >=3D 4) { /* Scan extensions for ALPN (TLS_EXT_alpn). =
*/
> > +             if (!quic_get_int(&p, &len, &type, 2))
> > +                     break;
> > +             if (!quic_get_int(&p, &len, &length, 2))
> > +                     break;
> > +             if (len < (u32)length) /* Incomplete TLS extensions. */
> > +                     return 0;
>
> [Medium]
> Should this branch be treated as a parse failure rather than a success?
>

The rest of the TLS extensions could be in the CRYPTO frame of
the next initial packet.

Returning error will cause packets to be dropped in the callers.

> The other length-bound checks in this same function return err (-EINVAL)
> when a declared length exceeds the remaining buffer, but this one returns
> 0 without populating alpn.

The splitted TLS CLIENT_HELLO messages are very rare.
The ones I saw from some QUIC implementations are splitted from these
TLS EXT points. I will improve it when seeing more different split points.

> The callers initialise alpn as
>
>         struct quic_data alpns =3D {};
>
> and quic_listen_sock_lookup() then takes the no-ALPN branch:
>
>     if (!alpns->len) { /* No ALPNs or parse failed */
>         sk_nulls_for_each_rcu(tmp, node, &head->head) {
>             ...
>             if (... && (!alpns->data || !quic_alpn(tmp)->len)) {
>
> Because alpns->data is still NULL, the match collapses to true and any
> listener bound to the address/port will match, including ones that
> registered a specific ALPN list. Can a peer reach an ALPN-restricted
> listener by sending a Client Initial with one extension whose declared
> length is larger than what is left in the ClientHello?
>
> Would returning err here (or always assigning alpn->data before
> returning) match the comment in quic_listen_sock_lookup() that
> distinguishes "TLS parsing succeeded but no ALPN was found" from "parse
> failed"?
>
ALPN demux is a feature trying its best to dispatch the first initial
to the right process. If it goes to the "incorrect" because the peer
doesn't provide proper ALPNs, the userspace handshake will reject it.

It's kind of the peer responsibility if it wants to get processed in the
right process, send with the right ALPNs then.

> > +             if (type =3D=3D TLS_EXT_alpn) { /* Found ALPN extension. =
*/
> > +                     if (length > QUIC_ALPN_MAX_LEN)
> > +                             return err;
> > +                     len =3D length;
> > +                     found =3D 1;
> > +                     break;
> > +             }
> > +             /* Skip non-ALPN extensions. */
> > +             p +=3D length;
> > +             len -=3D length;
> > +             if (exts++ >=3D TLS_MAX_EXTENSIONS)
> > +                     return err;
>
> [Low]
> Is the post-increment intended here? With TLS_MAX_EXTENSIONS =3D=3D 128, =
the
> check (exts++ >=3D 128) first becomes true when exts has already reached
> 129, so 129 extensions are consumed before bail-out even though the
> constant name suggests a cap of 128. Would
>
>         if (++exts > TLS_MAX_EXTENSIONS)
>                 return err;
>
> (or moving the check to the loop top) better reflect the intended limit?
>

will change to ++exts.

> > +     }
>
> [ ... ]
>
> > +static int quic_packet_parse_alpn(struct sk_buff *skb, struct quic_dat=
a *alpn)
>
> [ ... ]
>
> > diff --git a/net/quic/socket.c b/net/quic/socket.c
> > index 8f348d7c678b..19b164baf55d 100644
> > --- a/net/quic/socket.c
> > +++ b/net/quic/socket.c
>
> [ ... ]
>
> > +struct sock *quic_sock_lookup(struct sk_buff *skb, union quic_addr *sa=
,
> > +                           union quic_addr *da, struct sock *usk,
> > +                           struct quic_conn_id *dcid)
> > +{
>
> [ ... ]
>
> > +     rcu_read_lock();
> > +begin:
> > +     sk_nulls_for_each_rcu(tmp, node, &head->head) {
> > +             if (net !=3D sock_net(tmp))
> > +                     continue;
> > +             paths =3D quic_paths(tmp);
> > +             odcid =3D quic_path_orig_dcid(paths);
> > +             if (quic_cmp_sk_addr(tmp, quic_path_saddr(paths, 0), sa) =
&&
> > +                 quic_cmp_sk_addr(tmp, quic_path_daddr(paths, 0), da) =
&&
> > +                 quic_path_usock(paths, 0) =3D=3D usk &&
> > +                 (!dcid || !quic_conn_id_cmp(odcid, dcid))) {
> > +                     sk =3D tmp;
> > +                     break;
> > +             }
> > +     }
>
> [High]
> Is the sk memory itself RCU-protected here? sk_nulls_for_each_rcu()
> dereferences fields of tmp (sock_net(tmp), quic_paths(tmp),
> quic_path_saddr(...), etc.) before any reference is taken. That is only
> safe when the sk allocation is freed via RCU.
>
> quic_init_sock() does not call sock_set_flag(sk, SOCK_RCU_FREE), and
> neither quic_prot nor quicv6_prot sets slab_flags to SLAB_TYPESAFE_BY_RCU=
,
> so sk_destruct() (and quic_sock_destruct()) runs synchronously on the
> last sock_put(). Can a parallel close on tmp free the sock between
> sk_nulls_for_each_rcu() exposing it and the field dereferences above?
>
> The same shape appears in quic_listen_sock_lookup() further down, where
> quic_alpn(tmp)->len is read inside the RCU walk before
> refcount_inc_not_zero().
>

SOCK_RCU_FREE will be set in the patchset-2 via quic_hash().

> > +     if (sk && unlikely(!refcount_inc_not_zero(&sk->sk_refcnt)))
> > +             sk =3D NULL;
> > +     rcu_read_unlock();
> > +     return sk;
> > +}
>
> [ ... ]
>
> > +struct sock *quic_listen_sock_lookup(struct sk_buff *skb, union quic_a=
ddr *sa,
> > +                                  union quic_addr *da,
> > +                                  struct quic_data *alpns)
> > +{
>
> [ ... ]
>
> > +     rcu_read_lock();
> > +     if (!alpns->len) { /* No ALPNs or parse failed */
> > +             sk_nulls_for_each_rcu(tmp, node, &head->head) {
>
> [ ... ]
>
> > +                     a =3D quic_path_saddr(quic_paths(tmp), 0);
> > +                     if (net =3D=3D sock_net(tmp) &&
> > +                         quic_cmp_sk_addr(tmp, a, sa) &&
> > +                         quic_path_usock(quic_paths(tmp), 0) =3D=3D sk=
b->sk &&
> > +                         (!alpns->data || !quic_alpn(tmp)->len)) {
>
> [ ... ]
>
> > @@ -48,6 +196,9 @@ static void quic_sock_destruct(struct sock *sk)
> >       for (i =3D 0; i < QUIC_CRYPTO_MAX; i++)
> >               quic_crypto_free(quic_crypto(sk, i));
> >
> > +     /* Deferred ALPN free for RCU readers in quic_listen_sock_lookup(=
). */
> > +     quic_data_free(quic_alpn(sk));
> > +
>
> Without SOCK_RCU_FREE or SLAB_TYPESAFE_BY_RCU on quic_prot/quicv6_prot,
> does moving the alpn free into the destruct callback actually defer it
> past an RCU grace period? quic_sock_destruct() is invoked from
> sk_destruct() on the final sock_put() and is not itself an RCU callback,
> so the comment's "Deferred ALPN free for RCU readers" assumption seems to
> rely on a guarantee that is not configured on this protocol. Should this
> patch also set sock_set_flag(sk, SOCK_RCU_FREE) in quic_init_sock(), or
> alternatively take refcount_inc_not_zero() in the lookup helpers before
> touching any fields of tmp?
>

SOCK_RCU_FREE will be set in the patchset-2 via quic_hash().

> >       quic_sk_destruct(sk);
> >  }
> >
>
> [ ... ]
> --
> This is an AI-generated review.
>

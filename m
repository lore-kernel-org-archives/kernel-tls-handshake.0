Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246AA3911C6
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jun 2026 20:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781295825; cv=pass; b=QVKBcTk7/T+LQTJzJ0WaoVOTdbDdvlEavagNd2VUZZZQ8vv7nOoRm/wdcffu9i2Lq9sdxg6ibXL4UDNIV8i6s05soyouX4Aq0ZKIDyNJ8S93pAXujOAinAyAoImvPqIeFauGzJLsKhaPgzSJeO14hyQAoAz9KUqq0cY3NmwCO+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781295825; c=relaxed/simple;
	bh=j+Tw/DqvrvyTXJQnCqEunpYlqcUp4PdtpY9B1mt+aCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzHcPVfhz5oYRzCH1jcxUn11Z2g6RfQ/AywgtdPZL+jTAAVolQL2Q8z0EJfGI+mSlblBOgIqErd3szl+OiwxSHaNaHlVYFL2ad9fZqwgdXL1VnkPXaUxEfvlsmOIOIWSR83qWsur3aRjAEFvi/EIPyi0OaKc2nD4wULn9pROqYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxsHDY2O; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxsHDY2O"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-842848fd613so1424821b3a.3
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jun 2026 13:23:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781295823; cv=none;
        d=google.com; s=arc-20240605;
        b=ItVzOIdTc+khycL7Jt7oK5vk8wSSjNwkb33FrKmZARe2VjYMsVZYCv6NlCdFLyCM/i
         ZLDublQ6ImHFNMuDFUGWUllarH6V7DhJLKcACWZXSc6xIQOFvr+SZIxDE0pTFzUSxyO4
         gen030OxWAsy1DQj/hAdxfB2R/ddCSIiHV/2XtEzq2qZkTeFm43GuWoN4Ldodx6e1LeT
         LuhsCU/FU5Ed8VxubJXP4XDUhfMROPpw15CJYKIu391cQ1SG/9evA+82Z+/sl8BmDi9C
         SK18mgyY4B9v7IFt8XAgBSgELhec0B95dmC1HPsAKuyj1YzwtrbBu+ThJXsGZGSA6P4n
         uRhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=axLJGxYQXY76T7E7LoVtvtvjy73/TjaCst9TPiXrWdM=;
        fh=WkP9SGCcrCfGoW4DzgvQenk1hYK6rFTeyRbXwjiQHqU=;
        b=b+unPZj6HWJedlpJk38W+e2mWb9C+dz1K3CfmT3Gno42Mio8IqeOLl10GyUpAOQ8Cs
         zgCOKrNjikwprrAG+z3v6QawaDFOlZpOlMOtvVHM9lQv7Adz5/RUF5ZvJZubgGXPTkMB
         g14y9s5FMpVGgjklRFDl2vwE0PWZi+IC0JW+o+DwHWZ490tvv4Re830AxYi64TVQHaKc
         sNbYT/XIroqJ9Mv1Ctq54mxtE9+7RMSBWxJWNZmS3TPMFwGImUZE8YmFKF5+bF5LxGYy
         PSrS0ISFDCIvmg21QtK2zseZXP3GZWbWa02tT6YdZ6ku55O0iUxoGZhOMOa0Eq0wdRlk
         7l4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781295823; x=1781900623; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axLJGxYQXY76T7E7LoVtvtvjy73/TjaCst9TPiXrWdM=;
        b=nxsHDY2On5M2+k+gaYTUZHky3iUzhjmzLgMnyRYUiiS1eJyOZDrE4EUuqOIlB0zvKn
         zF9SeSzTYZwbgkl+tPFF6PDAU/nAw6wJJW7aFo+0tdgMiwJdHlWxAYA5lakgSn8D/8YC
         XMENHNysFHXm47M2KN1mTzjSCu0Rx2XdEMy/FPeXOMr8trW4zPvj3TJ5fC+/HwFBxAVU
         7KjQgrfiDeKZUIZtE2F5R+dLb6zLfFElKk9X6HKyFRFMFeTVd+zYGJJHXkw8VXalx50r
         yUqoJPN/MO2j3eNSS65qzHIt66Lc2h/DDaZJ02xMmaDiKdjElgi7ma7QavGuNAeMVSJT
         GO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781295823; x=1781900623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=axLJGxYQXY76T7E7LoVtvtvjy73/TjaCst9TPiXrWdM=;
        b=LbqtxPkU5wCthfxJ8vUJgrN0bkhGQVhRcM/6Y6tZbo959EpfUZhLXcTzb9kqxGFnym
         3XiQzHXqzzKX7YJ+BbAbQahniU4U0+y+i4x+jvM8i2rX6rVj6rf6eG1GhyHi/exnZFZW
         Q3/vP9/5l3ZysNDCvbMFXIYFtvWyynPk/zlgqgT6fiQ/nECvgOtDeQy/IW2cdwGQ0x/6
         uYLYtVmRibjCPnM8teMDlc07hPhdKyATCC1bbTulP1oz69UenIlpwE+JM99G+hw6FJVV
         NZyIu7fgx38mcnAOltJQNzjJjmuFOCf3EEr7e7rCTMAlkGdQ9v53LJRvFx7VIwlUtz1A
         ONoA==
X-Forwarded-Encrypted: i=1; AFNElJ9j7kv9uKaE0Hp42qelUeXvCtuFi0+K2XEombWImEwHYvM8WDVWhRwIkZAx3PpGU/VmuXFjZG8jhtICuh3yLm7+4N9C4w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEJ8q82/Tg1OyoJ/HhO4FyxI1RpTSbRRj255fgA9TbZQFfKbZX
	vrXEKh+ipw5drL8QUm0mTYwQijW155uaa+bPkfKpUh4J87HNE0OfgwIqx+C2OcgMwpOAWyRy2nF
	vZ6vGQHLJLVU9Cfdh4kBUVOBcacjj5g0=
X-Gm-Gg: Acq92OExV9cdX9CvFvGedjY55AhEx7BDQ6HqieUHarTNFCrn1wcj2bsF6Fzhop4oAcf
	ecgHisXubhPQL727Pu45a4MLtvPOFGkQVfzObrPRsgGZ02z0nShzrP05f9wbH4PGKv3JRkOvZOF
	p1wOiRLIMd/UAvyIaYexhjqEih0twW8Y/tenwmd59Nwmt65R9oHHPJkprVma6EFtLU5J1bOwGaJ
	bTei+YOBz8WMggRGYzQfqjgi2dfXjpbVy4LZzAgI2E72tdwxgF9JZHY7HVwCfGoZ9Oz8jS/bDkd
	+DOvjJp9dKf2fSqoYjQ6FTFrTLvjrs8GtgkxCdiVqChqRtn6764RogXvuscZlxlc1OVz9gCrYyt
	rnWcWjfCjQFu1NPAs
X-Received: by 2002:a05:6a00:94c3:b0:842:614e:cc97 with SMTP id
 d2e1a72fcca58-8434d07afcemr4940308b3a.23.1781295823460; Fri, 12 Jun 2026
 13:23:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <287e6b7dd877836e08b9bcb6727f547fe80f6459.1780855297.git.lucien.xin@gmail.com>
 <20260611081948.137325-1-pabeni@redhat.com>
In-Reply-To: <20260611081948.137325-1-pabeni@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 12 Jun 2026 16:23:31 -0400
X-Gm-Features: AVVi8CezbNK4UF3r3lp5uUhw4KnTH33E-BGYuPbz2M3O-qwCLN8CyhZyYdcGzpo
Message-ID: <CADvbK_dAvqBC1j-f4Ft_HkLzVOzP-z9cwVR2B36zbxjSB44atg@mail.gmail.com>
Subject: Re: [PATCH net-next v13 12/15] quic: add crypto packet encryption and decryption
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
> quic: add crypto packet encryption and decryption
>
> This patch adds AEAD-based packet encryption/decryption helpers, QUIC
> header protection, and Retry/address-validation token generation and
> verification primitives.
>
> > diff --git a/net/quic/crypto.c b/net/quic/crypto.c
> > index c68a0b570c72..77e633096c2a 100644
> > --- a/net/quic/crypto.c
> > +++ b/net/quic/crypto.c
>
> [ ... ]
>
> > +/* Retry Packet Integrity. */
> > +int quic_crypto_get_retry_tag(struct quic_crypto *crypto, struct sk_bu=
ff *skb,
> > +                           struct quic_conn_id *odcid, u32 version, u8=
 *tag)
> > +{
> > +     /* Reuse RX AEAD (phase 1) in Initial crypto. */
> > +     struct crypto_aead *tfm =3D crypto->rx_tfm[1];
> > +     u8 *pseudo_retry, *p, *iv, *key;
> > +     DECLARE_CRYPTO_WAIT(wait);
> > +     struct aead_request *req;
> > +     struct scatterlist *sg;
> > +     u32 plen;
> > +     int err;
> > +
> > +     if (skb->len < QUIC_TAG_LEN)
> > +             return -EINVAL;
>
> [Low]
> The guard rejects skb->len < QUIC_TAG_LEN, but a later comment in the
> same function says:
>
> > +     /* The caller must ensure skb->len > QUIC_TAG_LEN. */
> > +     plen =3D 1 + odcid->len + skb->len - QUIC_TAG_LEN;
>
> Should the check be <=3D QUIC_TAG_LEN, or should the comment say >=3D to
> match the strict-less-than test?
>
> In the boundary case where skb->len =3D=3D QUIC_TAG_LEN, plen becomes
> 1 + odcid->len, and quic_put_data(p, skb->data, skb->len - QUIC_TAG_LEN)
> copies zero bytes, so the integrity tag would be computed over a
> pseudo-packet containing only the ODCID length and ODCID with no actual
> Retry header bytes.  Is that intended?
>
The callers will make sure skb->len > QUIC_TAG_LEN, and the check
(skb->len < QUIC_TAG_LEN) was added to make the last AI happy.

I will change (skb->len <=3D QUIC_TAG_LEN) to match the comment.


> [ ... ]
>
> > +/* Derives a key and IV using HKDF, configures the AEAD transform and =
performs
> > + * AEAD encryption/decryption for the provided token.
> > + */
> > +static int quic_crypto_token_protect(struct quic_crypto *crypto, u8 *t=
oken,
> > +                                  u32 len, u32 adlen, bool enc)
> > +{
> > +     u8 key[TLS_CIPHER_AES_GCM_128_KEY_SIZE], iv[QUIC_IV_LEN], *tiv;
> > +     /* Reuse TX AEAD (phase 1) in Initial crypto. */
> > +     struct crypto_aead *tfm =3D crypto->tx_tfm[1];
> > +     u32 extra =3D enc ? QUIC_TAG_LEN : 0;
> > +     struct quic_data srt =3D {}, k, i;
> > +     DECLARE_CRYPTO_WAIT(wait);
> > +     struct aead_request *req;
> > +     struct scatterlist *sg;
> > +     void *ctx =3D NULL;
> > +     int err;
> > +
> > +     quic_data(&srt, quic_random_data, QUIC_RANDOM_DATA_LEN);
> > +     quic_data(&k, key, TLS_CIPHER_AES_GCM_128_KEY_SIZE);
> > +     quic_data(&i, iv, QUIC_IV_LEN);
> > +     err =3D quic_crypto_keys_derive(crypto->secret_tfm, &srt, &k, &i,=
 NULL,
> > +                                   QUIC_VERSION_V1);
>
> [Critical]
> Can this lead to AES-GCM nonce reuse across all generated tokens?
>
> quic_random_data is a module-global buffer initialized once in
> quic_crypto_init() via get_random_bytes() and never refreshed:
>
>     static u8 quic_random_data[QUIC_RANDOM_DATA_LEN] __read_mostly;
>
> quic_crypto_keys_derive() runs HKDF-Expand-Label over that constant
> secret with constant labels "quic key" and "quic iv", so both the
> derived key and the derived IV are deterministic and identical on every
> invocation of quic_crypto_token_protect().
>
> > +     if (err)
> > +             goto out;
> > +     err =3D crypto_aead_setauthsize(tfm, QUIC_TAG_LEN);
> > +     if (err)
> > +             goto out;
> > +     err =3D crypto_aead_setkey(tfm, key, TLS_CIPHER_AES_GCM_128_KEY_S=
IZE);
> > +     if (err)
> > +             goto out;
> > +     ctx =3D quic_crypto_aead_mem_alloc(tfm, 0, &tiv, &req, &sg, 1);
> > +     if (!ctx) {
> > +             err =3D -ENOMEM;
> > +             goto out;
> > +     }
> > +     memcpy(tiv, iv, QUIC_IV_LEN);
> > +
> > +     sg_init_one(sg, token, len);
> > +     aead_request_set_tfm(req, tfm);
> > +     aead_request_set_ad(req, adlen);
> > +     aead_request_set_crypt(req, sg, sg, len - adlen - extra, tiv);
>
> Every call ends up using the same (K, N) pair under AES-GCM, with no
> per-token random prefix and no packet-number XOR like
> quic_crypto_payload_protect() does via cb->number.
>
> NIST SP 800-38D forbids reuse of (K, N) under GCM; from two valid
> ciphertexts an attacker can recover the GHASH authentication subkey H
> and forge tokens for arbitrary client addresses, which would defeat
> the address validation in quic_crypto_verify_token() and the
> anti-amplification protections in RFC 9000 section 8.
>
> Could a unique per-token nonce be derived (for example from a random
> prefix stored in the token itself), or a nonce-misuse-resistant AEAD
> be used here instead?
>

I currently don't have a better solution for this. we can't have it in the
socket, as even after the socket closes, this quic_random_data is still
needed to validate tokens.

Thanks.

> > +     aead_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG,
> > +                               crypto_req_done, &wait);
> > +     err =3D enc ? crypto_aead_encrypt(req) : crypto_aead_decrypt(req)=
;
> > +     if (err =3D=3D -EINPROGRESS || err =3D=3D -EBUSY)
> > +             err =3D crypto_wait_req(err, &wait);
> > +
> > +out:
> > +     memzero_explicit(key, sizeof(key));
> > +     memzero_explicit(iv, sizeof(iv));
> > +     kfree_sensitive(ctx);
> > +     return err;
> > +}
>
> [ ... ]
> --
> This is an AI-generated review.
>

Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFB239A046
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  4 Mar 2026 22:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772663534; cv=pass; b=jJs1zHD/LwAPIBXTOYie/1zeYZXn3lk150pYOeX4pnv1fi5yxmcsdF5AOYr7h6vn1vG62HjUAouNw294NDsPUidRM3NUpbJ+zFAyP5gmqz/bSF7uV0Fsor7GgEV92x/u9i6s+PHKnPOlPOsOT/IIoFg4Bptflc8oy72r0T8Pogs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772663534; c=relaxed/simple;
	bh=KXu//3EBPLrBvO/MghuctSsCjd474Oji/fve+ps6wFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2KfqI+Go50OZPWIHsbRqldC7An0bC5cBlAP2fGbTxp8jenfli4I566tL3PFuQKMrMnvATiurfjFDU9AL0/uNfS4cJNWc5wIgEuRIZEZy0duNLduq1UbTFisjvMBXoIabu4gub0X6q0ANIpmt75+JitqLOXjvkmBI6CY3qNm4KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ul/EFpuV; arc=pass smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ul/EFpuV"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94dd687e040so1744815241.3
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 04 Mar 2026 14:32:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772663531; cv=none;
        d=google.com; s=arc-20240605;
        b=B9TFwK5dUCP94gMcZomBcCEOU8fpTW1cEIkfjZAuxAzHL/Sgp5EytXpaVEQIOb3v8c
         XD1sV0U+8kW2VbF/mKlbfh45XuLcM8B/nuAiaI6qDtOtShaVi+EsHnPwtMH63ciSJynX
         foYQ3g1gLXe2CNBko6VaiEFPqT5yHtKCL8ovJrvO5Pg7q7KZX+7Z+a/S8XR4F+4Ppxw4
         ZoJwo2T06g/xhTZebkVfPlL8GZuNK2Atrz6jsl4J3PseWszjVYrmmUvI4LO24lce77lC
         f7KEb5SAVf1mO7DsofaJf+2jj6PxTz2O9ivHLReSFJsT2OWhHFIDXeMsf0R4/ZFkoy2R
         682g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z/QRphmRzy8FO2fkKgVz78bs8tUVjsFCxQ1wuKvg3pk=;
        fh=+AKc5/KAdNY4kIjWp5tA3AU7zjddabcxgwh/NFNa8Y8=;
        b=D7pY4fQXQLJT9h5D0UJyCaRWo19vsSCm465GqS9yNfcg02gZEbfFwJjpKD9WhIsS/t
         9EgA+iSJ1rEg0CPnR7B0H2JzwMVdUmoGlqvltsMvh5GR4HN4fIODhHYzrh8AdHO2y4zH
         aIhg6k/JYuY2LXUj3QDZVRENEtgAbTwkrooZENdgl3d4VblCRSdI6dcvOUlr3+ch8Mwk
         g2LmsZDfBjUfwQs1JapuN61ReE0ioVv+OrDBA2YHl0G1HZY0nqVkQh4BS/9y2YHvfqcq
         EEwIffqcNgz/l4E046/DGeOZ1Zb1BVKAj28kcrq7p4gn9RCOz4kCh+g7Kiq00AZNNcoS
         5cwA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772663531; x=1773268331; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/QRphmRzy8FO2fkKgVz78bs8tUVjsFCxQ1wuKvg3pk=;
        b=Ul/EFpuVnZ6zTJ2sgvdqiTXgo523TS6VD+ujhJ4rXnyUxHthwOuBaqI6tLwheQ9KLC
         0qNGJiXe8fuXOZpOH4vMjbJ+Y+mjlqfwKGuE6dWYg8E7hfwL40mVkS5UceUUm7Hk8Y7E
         PRBhn88EH6k4cFgDLaU1XLT8eJu5ldJenOn4cTZQi7zs2mwLDLLUJk8B2ybgGeBAf+9z
         94wSZRH8NmNuZXpccFHy9FNBEfmsOqohPwm0CdGvr3kggO/Q0h738/ibQeoCp0mdn+K7
         lUvAs0JqLSXTFx2REZbZLBOwL8vrNIrXHdZn6j6juyOcw56nh6ZSg2mdRKtTVmWHmkWi
         dBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772663531; x=1773268331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z/QRphmRzy8FO2fkKgVz78bs8tUVjsFCxQ1wuKvg3pk=;
        b=qjHO8yado8TN70+XF5Aqz14s3wX+Jmm6Wz7sNEFQ+eeWnfYfVo7Ehf87JxVlC0NPKK
         Fw9smYfWO2siAY4JfqvLqkns3C6Qq9WmHuMgRB49iMrWVMpzLuBzPqYcsoAuN+IwQ6LV
         PTvbv4/pNb3Y08guvTTMp/7LluIIJdVeERExC/pgcI2NYeA5DAt/Dpbma2in9Sp/vWLB
         NBNMvJwW1M33DqDVBxoDVzbz1s1pn9s9O1ty0ZMCBFkRkbzm+AQK7WBqZ1TL8evPoBL5
         f0T25/lLZzXrywk2ihXpjeHn4fEx5SFtyeZuGhYkBnDKvf9Bf6wDB+eCy0JASq3f+a9t
         AURw==
X-Forwarded-Encrypted: i=1; AJvYcCVH3uESc8alXxrTgCi4a2nqEWJlg4JFplU/48PFzisO+mq9jCZDU7VyxSsKEiyCiN9bqQH3lhDXtXkauqu+bhkFB8wnZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIplBHLNdPCfqE3QRuNreSiuic9EGy6X7uUvFp7thsm7wrmp/F
	rTcgoHj7EaiVZ4aP0T5/F8gActzpF/EG7+chwZ+Uf8vvlRZjIWaBd1/x9/mZ0PmWY2wCKmGNBRi
	RCq86XhkHbyL1kTlqD01MNTbkgXT9iU0=
X-Gm-Gg: ATEYQzxIyllenysPVu5FtSul/d+CHVRzfRKzR8RC9DqrGegnZR53TCxtWk6ybzJLr3p
	0gxUD0iFlVyLYNpH5AdSiwjdjzkEnmXLT/JpjPJUCxiiGU6wFj8xyoqPnWaEnL+94R3IjYU8ssQ
	+1GgOx+47Ta/E6BSqhOpxbzyOF7/b88gpvua1Efdc6qh3wRf5vdYhARWzmrOqUiz80aEoso/04a
	D+Kb2wCO+urrVPKYbWq+FoiyBCmld6FDruu7woS12loPk84BlCqcVjMMdRabd2AQwwP56aGDA5m
	0ifzVHTaaEXJXVDdplSB5h4rx7CtlE8fdiaLXDeLJG28F47Uz3vubUx482undBSDhmdr+Ywxl5Y
	X3xCTvA==
X-Received: by 2002:a05:6102:b0d:b0:5f8:e2c7:a3f2 with SMTP id
 ada2fe7eead31-5ffaa6f6c3bmr1576946137.0.1772663530592; Wed, 04 Mar 2026
 14:32:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3c6ae7299c2fff0fa689d4dcd43ef916e5697d65.1771986861.git.lucien.xin@gmail.com>
 <20260303083255.35354-1-pabeni@redhat.com>
In-Reply-To: <20260303083255.35354-1-pabeni@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 4 Mar 2026 17:31:57 -0500
X-Gm-Features: AaiRm51Y186obU2AYuGIwk5fISUHhxMUkh7jtjQG4bgQBZwaKmERG0jYjFiCfpA
Message-ID: <CADvbK_fHhrCh-5zPDY1sh16TEKhJTWhZcUS4-pw=49krocV3SA@mail.gmail.com>
Subject: Re: [net-next,v10,12/15] quic: add crypto packet encryption and decryption
To: Paolo Abeni <pabeni@redhat.com>
Cc: hepengtao@xiaomi.com, kuba@kernel.org, jlayton@kernel.org, metze@samba.org, 
	davem@davemloft.net, kernel-tls-handshake@lists.linux.dev, horms@kernel.org, 
	hare@suse.de, aahringo@redhat.com, tfanelli@redhat.com, mail@johnericson.me, 
	andrew.gospodarek@broadcom.com, linkinjeon@kernel.org, dhowells@redhat.com, 
	matttbe@kernel.org, xiyou.wangcong@gmail.com, dreibh@simula.no, 
	jbaron@akamai.com, quic@lists.linux.dev, pc@manguebit.com, 
	marc@fiuczynski.com, edumazet@google.com, alibuda@linux.alibaba.com, 
	steved@redhat.com, illiliti@protonmail.com, tom@talpey.com, 
	marcelo.leitner@gmail.com, sd@queasysnail.net, linux-cifs@vger.kernel.org, 
	netdev@vger.kernel.org, mbuhl@openbsd.org, smfrench@gmail.com, 
	chuck.lever@oracle.com, daniel@haxx.se
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 3:33=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-loca=
l.html
> ---
> quic: add crypto packet encryption and decryption
>
> This patch adds core support for packet-level encryption and decryption
> using AEAD, including both payload protection and QUIC header protection.
> It introduces helpers to encrypt and decrypt packets for secure QUIC
> packet exchange and address validation.
>
> > diff --git a/net/quic/crypto.c b/net/quic/crypto.c
> > index a9de418e604e..a84fd8d7bf93 100644
> > --- a/net/quic/crypto.c
> > +++ b/net/quic/crypto.c
>
> [ ... ]
>
> > @@ -231,6 +562,137 @@ static struct quic_cipher ciphers[QUIC_CIPHER_MAX=
 + 1 - QUIC_CIPHER_MIN] =3D {
>
> [ ... ]
>
> > +/* Encrypts a QUIC packet before transmission.  This function performs=
 AEAD encryption of
> > + * the packet payload and applies header protection. It handles key ph=
ase tracking and key
> > + * update timing.
> > + *
> > + * Return: 0 on success, or a negative error code.
> > + */
> > +int quic_crypto_encrypt(struct quic_crypto *crypto, struct sk_buff *sk=
b)
> > +{
> > +     u8 *iv, cha, ccm, phase =3D crypto->key_phase;
> > +     struct quic_skb_cb *cb =3D QUIC_SKB_CB(skb);
> > +     int err;
> > +
> > +     cb->key_phase =3D phase;
> > +     iv =3D crypto->tx_iv[phase];
> > +     /* Packet payload is already encrypted (e.g., resumed from async)=
, proceed to header
> > +      * protection only.
> > +      */
> > +     if (cb->resume)
> > +             goto out;
> > +
> > +     /* If a key update is pending and this is the first packet using =
the new key, save the
> > +      * current time. Later used to clear old keys after some time has=
 passed (see
> > +      * quic_crypto_decrypt()).
> > +      */
> > +     if (crypto->key_pending && !crypto->key_update_send_time)
> > +             crypto->key_update_send_time =3D quic_ktime_get_us();
> > +
> > +     ccm =3D quic_crypto_is_cipher_ccm(crypto);
> > +     err =3D quic_crypto_payload_encrypt(crypto->tx_tfm[phase], skb, i=
v, ccm);
> > +     if (err)
> > +             return err;
> > +out:
> > +     cha =3D quic_crypto_is_cipher_chacha(crypto);
> > +     return quic_crypto_header_encrypt(crypto->tx_hp_tfm, skb, cha);
> > +}
>
> This function calls quic_crypto_payload_encrypt(). Looking at that
> function:
>
> > +/* AEAD Usage. */
> > +static int quic_crypto_payload_encrypt(struct crypto_aead *tfm, struct=
 sk_buff *skb,
> > +                                    u8 *tx_iv, bool ccm)
> > +{
> > +     struct quic_skb_cb *cb =3D QUIC_SKB_CB(skb);
> > +     u8 *iv, i, nonce[QUIC_IV_LEN];
> > +     struct aead_request *req;
> > +     struct sk_buff *trailer;
> > +     struct scatterlist *sg;
> > +     struct quichdr *hdr;
> > +     u32 nsg, hlen, len;
> > +     void *ctx;
> > +     __be64 n;
> > +     int err;
> > +
> > +     len =3D skb->len;
> > +     err =3D skb_cow_data(skb, QUIC_TAG_LEN, &trailer);
> > +     if (err < 0)
> > +             return err;
> > +     nsg =3D (u32)err;
> > +     pskb_put(skb, trailer, QUIC_TAG_LEN);
> > +     hdr =3D quic_hdr(skb);
> > +     hdr->key =3D cb->key_phase;
> > +
> > +     ctx =3D quic_crypto_aead_mem_alloc(tfm, 0, &iv, &req, &sg, nsg);
> > +     if (!ctx)
> > +             return -ENOMEM;
>
> If the kzalloc(GFP_ATOMIC) inside quic_crypto_aead_mem_alloc() fails,
> this returns -ENOMEM without rolling back the SKB modifications. The
> SKB is now permanently enlarged by QUIC_TAG_LEN (16 bytes) with a
> modified hdr->key.
>
> Compare with quic_crypto_payload_decrypt():
>
> > +static int quic_crypto_payload_decrypt(struct crypto_aead *tfm, struct=
 sk_buff *skb,
> > +                                    u8 *rx_iv, bool ccm)
> > +{
> > +     struct quic_skb_cb *cb =3D QUIC_SKB_CB(skb);
> > +     u8 *iv, i, nonce[QUIC_IV_LEN];
> > +     struct aead_request *req;
> > +     int nsg, hlen, len, err;
> > +     struct scatterlist *sg;
> > +     void *ctx;
> > +     __be64 n;
> > +
> > +     len =3D cb->length + cb->number_offset;
> > +     hlen =3D cb->number_offset + cb->number_len;
> > +     if (len - hlen < QUIC_TAG_LEN)
> > +             return -EINVAL;
> > +     nsg =3D 1; /* skb is already linearized in quic_packet_rcv(). */
> > +     ctx =3D quic_crypto_aead_mem_alloc(tfm, 0, &iv, &req, &sg, nsg);
> > +     if (!ctx)
> > +             return -ENOMEM;
> > +
> > +     sg_init_table(sg, nsg);
> > +     err =3D skb_to_sgvec(skb, sg, 0, len);
>
> In the decrypt path, quic_crypto_aead_mem_alloc() is called before any
> SKB modifications. Should quic_crypto_payload_encrypt() do the same to
> avoid leaving the SKB in a modified state if allocation fails?
>
This is not true.

- firstly, on RX or Decrypt path, skb_cow_data() is called in
quic_crypto_header_decrypt(), which is called before
quic_crypto_payload_decrypt() in quic_crypto_decrypt(), so
skb_cow_data() is called before mem_alloc for both places.

- secondly, even if the mem_alloc is failed, the skb will be dropped,
no issue could be caused.

> [ ... ]
>
> > +     /* Similar logic to quic_crypto_payload_encrypt(). */
> > +     memcpy(nonce, rx_iv, QUIC_IV_LEN);
> > +     n =3D cpu_to_be64(cb->number);
> > +     for (i =3D 0; i < sizeof(n); i++)
> > +             nonce[QUIC_IV_LEN - sizeof(n) + i] ^=3D ((u8 *)&n)[i];
>
> This isn't a bug, but there's duplicated logic between
> quic_crypto_payload_encrypt() and quic_crypto_payload_decrypt(). The
> AEAD nonce construction sequence (memcpy nonce from IV, XOR with be64
> packet number, set CCM byte) appears in both functions.
>
> In quic_crypto_payload_encrypt():
>
> > +     hlen =3D cb->number_offset + cb->number_len;
> > +     memcpy(nonce, tx_iv, QUIC_IV_LEN);
> > +     n =3D cpu_to_be64(cb->number);
> > +     for (i =3D 0; i < sizeof(n); i++)
> > +             nonce[QUIC_IV_LEN - sizeof(n) + i] ^=3D ((u8 *)&n)[i];
> > +
> > +     /* For CCM based ciphers, first byte of IV is a constant. */
> > +     iv[0] =3D TLS_AES_CCM_IV_B0_BYTE;
> > +     memcpy(&iv[ccm], nonce, QUIC_IV_LEN);
>
> And in quic_crypto_payload_decrypt():
>
> > +     /* Similar logic to quic_crypto_payload_encrypt(). */
> > +     memcpy(nonce, rx_iv, QUIC_IV_LEN);
> > +     n =3D cpu_to_be64(cb->number);
> > +     for (i =3D 0; i < sizeof(n); i++)
> > +             nonce[QUIC_IV_LEN - sizeof(n) + i] ^=3D ((u8 *)&n)[i];
> > +
> > +     iv[0] =3D TLS_AES_CCM_IV_B0_BYTE;
> > +     memcpy(&iv[ccm], nonce, QUIC_IV_LEN);
>
> The AEAD request teardown pattern (EINPROGRESS check, kfree_sensitive,
> memzero_explicit) is also duplicated. Would a shared static helper for
> nonce construction reduce the risk of the two copies diverging during
> maintenance?
>
I will see what I can do to dedup a bit for this.

Thanks.

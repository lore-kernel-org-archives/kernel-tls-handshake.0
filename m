Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0C3371CEA
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  4 Mar 2026 21:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772661497; cv=pass; b=OprQ59gVvw1dWGCtq8vsATMyi4ZUBqv3HXchPSfDCQTWnsNz9uouyvI9Tlmyy8j2H97Z96Zpjsk1SZW3z7RztWwYLCDeUgm5DVIryXdGP9oXPWQdorVeACqiQ7qh32m5MaNVfD5sbG3OrkOG1GfQ2mROPq3K2lG8Q9QrZA8rWBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772661497; c=relaxed/simple;
	bh=uCVtAulQYUleILEJ6PEjL9aQkaLSkuY4rEkEB5Iccc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JDPqtODr1AN11IfuSOwj3HdOgUyDuX0IYMc7wlTewFfd7KqDJLgXBasYCUf5UgZejp7URILcV4WIBHaUT6VIXtrcA4O5b87YX61qfKNlCO+dhsJSUs664dGwTXSsdTREE/vkWTM7fM+8RBSt59grxUyzGBBcby1k/CqWbcTe02I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTqXrQCm; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTqXrQCm"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ff196450c6so2218772137.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 04 Mar 2026 13:58:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772661495; cv=none;
        d=google.com; s=arc-20240605;
        b=e7gXNM4qoT1Su51fpXZgmsNm71ViK27g0tXtCzZuCRFMBBLilrbEz0UnTfs76saQ/I
         SKrSd7djR0SoiLm9uto0WBKSzayzHo/EqtiNjjm8XGh15ZkkoDuATF82gKe7fiqPlAkn
         bKOScNaFAdpnW56hzk3Q2yq2MYN14aTf/HYNXnYrUTvROdCNOIpszwjuKy2/08XW82Aw
         JC08pAGQQEnFIZ3RUWwU1gKh3Ao2EUOb4IqUWOmtUO16iotr0RrMabZwQ3z92iyrcVDG
         0lU+TzP3NzzJmcpMHv9SVqQzoyQ+V5Ov8Fe0Su/w/S19cmmJMvtTq0MhsxIaPACIHCz9
         j2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QKWCkXz0n+kEHmLabX5g1II5xKBH3YQOX4ZTihzPz58=;
        fh=GwHZmRIGOtMY5rcuMA2pN4xifyQLwTCTY5qm2+pWsFg=;
        b=LHrjfoXHJy4cYlnUElAgoe/Wby/rm87v32Lpyk/8F/fDPCj3fgrFtgnK//LhraRuTF
         7ZqCs/1PYrr65hxecCmdz7fNRDqx6gjIQjP6BgonnP40ALKTdtzbo0RwQUZVi5k6SSzF
         CjdVT5OY5JiokgAuGkIyQcTYcuMe02UI9PrmpiYSdvgPw+OApfqywLvS/AGa8maOxPbm
         deE2NVutw5ydV0npsb5OfRo5z1EwLPX1esGO+lAGdN91haFdUIGcuQ8druucIkHxt50W
         JJkvGnZ4JPzjhLFBZkckA4+9Zp/QAuRqBoqpBFkVV9Jf1d+pg+tFudZkWVl/0Jwrx5BF
         zuqA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772661495; x=1773266295; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKWCkXz0n+kEHmLabX5g1II5xKBH3YQOX4ZTihzPz58=;
        b=jTqXrQCmzbehAFRNzzjisLtWiiKoHphe1i96/pKMpyAkeGs9bA84eg+8QaCAKb5msv
         tKHM8qh3S4K0GitbTmDr/kqR79DmIhpw8Fvvtq+TC7bNGDgcLnTTQNN3cBQu3r/vPCDG
         D4LDxuhS6DOXIvUgmBTql1yWT/4RVP6oMavT5WKHcralJKq46LnxZjWR4dezuVgMCMDD
         AYIvjpE8Anc9B3NK0qajUFTgfw8XhmTS0r/JFa5FBVkxJVVUJpY3lKXRJEv6WcqS494D
         lLc8z96Gm1N9jXQbP3cGMJ8BK1WUJwa/af42RzGH/uKAN4TafgGEhIjGBQ94fR8olBy6
         0dxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772661495; x=1773266295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QKWCkXz0n+kEHmLabX5g1II5xKBH3YQOX4ZTihzPz58=;
        b=ZYLCvNr0Ezyqv2bDHuxW0duAW2h2nEBj1BMpP0dII52UuOHZzN9JQI1O0bPmZnIz+6
         XUW09daclxUo7s+HTmFfSbLhB+GPNDXkpqNjGS52yewBwbtCVeEyOK7IThgglq+Dy6zi
         +nUsdcyWE/c7E7pLRV9go5F8+2MKMLk2fzBuSC56YBgDLiftc6r72NKLjNJXleXjNmDo
         csdisnk/zgnO/wDXcBYEnkQ1c+BmAS6721bV5zCxArsokR+ITKS7uEHQO/2j2KdQj8AE
         pEus9WRHVWqbQ43FhMZHqkDmpALkeTMC9ebjuVhA1ryzLobtQ3RVX9p5pRYObpEKDubg
         nHOA==
X-Forwarded-Encrypted: i=1; AJvYcCX1XCnbfPrEx81cV7ctltQLwBqqyFRFyPt2umA8F0ItSqLI8+4JJFOM2nEqBQUbLNM0FL39mkmCk1aqAt3W6h+Ces/BSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgqwvpVK1++PYTkG8HRdS3aGNtpd1mDq29HMh3uBovkSfxuTmT
	g6G59aeY6EUQWqv8uPqf4hjOElszznom6Q6UZ3frutITgogJjMbISxnrN7QxRfmM25lg6WCdCVg
	kDhMbAUK1KJP6s4haU1j1sr+XwWS3l3c=
X-Gm-Gg: ATEYQzzQ0XnFIX1n0wi+FFitjquuPLkT+RoiiWSXxyjP1uxBg0+MhEM/bdws2SozS1d
	E5wi7Cmu38eRdbyZw46+zRagu4YNbbpuKrKnbqc4mI9VbCbw7uSQiuvamK85ulwOdM/DR0mE/RA
	E9WGObc6dXATsslrMCfTVF2XOInlOvMDUiemidP0fzMHKicLRPuGk7bDwV4UCRAL6gkvvropCQN
	0aLQVIbVs8knNmXoSk7vY8j8/Xd56U6vD6Tbpxcn7g6Zh1DlsnTkovdEW5rMFJiEFxxXTe2aUvI
	E3cdSmxA+Coaer1uEZ7BBGkHfX+pk6wZCDfmbQjlHe2q2zjAropUYqwadhFVdtPoA2Xjg3kWaCr
	Z1upfgUPMxQmRE5EOdQVXsRZ9RLRd8Jxu7G4sAaXq
X-Received: by 2002:a05:6102:3f43:b0:5fd:fc84:4b0 with SMTP id
 ada2fe7eead31-5ffaaffd485mr1677319137.35.1772661495041; Wed, 04 Mar 2026
 13:58:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <323138c6deed2652a09aa38dfbe322642b6ad150.1771986861.git.lucien.xin@gmail.com>
 <20260303083233.34650-1-pabeni@redhat.com>
In-Reply-To: <20260303083233.34650-1-pabeni@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 4 Mar 2026 16:58:01 -0500
X-Gm-Features: AaiRm50J6ffZdZLFUmhSXQoVur0S3uDqiz0HfuAqGi8QNmmBNRW9dW8AvLSff9M
Message-ID: <CADvbK_cWP-S1VdsfZJCc_iTxaeVnGTbrXrNsVdWTgYjdqLjwaA@mail.gmail.com>
Subject: Re: [net-next,v10,11/15] quic: add crypto key derivation and installation
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
> quic: add crypto key derivation and installation
>
> This patch introduces 'quic_crypto', a component responsible for QUIC
> encryption key derivation and installation across the various key
> levels: Initial, Handshake, 0-RTT (Early), and 1-RTT (Application).
> It provides helpers to derive and install initial secrets, set traffic
> secrets and install the corresponding keys, and perform key updates to
> enable forward secrecy.
>
> > diff --git a/net/quic/Makefile b/net/quic/Makefile
> > index 9d8e18297911..58bb18f7926d 100644
> > --- a/net/quic/Makefile
> > +++ b/net/quic/Makefile
> > @@ -6,4 +6,4 @@
> >  obj-$(CONFIG_IP_QUIC) +=3D quic.o
> >
> >  quic-y :=3D common.o family.o protocol.o socket.o stream.o connid.o pa=
th.o \
> > -       cong.o pnspace.o
> > +       cong.o pnspace.o crypto.o
> > diff --git a/net/quic/crypto.c b/net/quic/crypto.c
> > new file mode 100644
> > index 000000000000..a9de418e604e
> > --- /dev/null
> > +++ b/net/quic/crypto.c
>
> [ ... ]
>
> > +/* Initial Secrets. */
> > +int quic_crypto_initial_keys_install(struct quic_crypto *crypto, struc=
t quic_conn_id *conn_id,
> > +                                  u32 version, bool is_serv)
> > +{
> > +     u8 secret[TLS_CIPHER_AES_GCM_128_SECRET_SIZE];
> > +     struct quic_data salt, s, k, l, dcid, z =3D {};
> > +     struct quic_crypto_secret srt =3D {};
> > +     char *tl, *rl, *sal;
> > +     int err;
> > +
> > +     if (is_serv) {
> > +             rl =3D "client in";
> > +             tl =3D "server in";
> > +     } else {
> > +             tl =3D "client in";
> > +             rl =3D "server in";
> > +     }
> > +     sal =3D QUIC_INITIAL_SALT_V1;
> > +     if (version =3D=3D QUIC_VERSION_V2)
> > +             sal =3D QUIC_INITIAL_SALT_V2;
> > +     quic_data(&salt, sal, QUIC_INITIAL_SALT_LEN);
> > +     quic_data(&dcid, conn_id->data, conn_id->len);
> > +     quic_data(&s, secret, TLS_CIPHER_AES_GCM_128_SECRET_SIZE);
> > +     err =3D quic_crypto_hkdf_extract(crypto->secret_tfm, &salt, &dcid=
, &s);
>
> Is crypto->secret_tfm guaranteed to be initialized at this point?
>
> Looking at the function flow, this line uses crypto->secret_tfm before
> quic_crypto_set_secret() below gets a chance to initialize the cipher:
>
> quic_crypto_initial_keys_install() {
>         err =3D quic_crypto_hkdf_extract(crypto->secret_tfm, ...); /* lin=
e 490 */
>         ...
>         err =3D quic_crypto_set_secret(crypto, &srt, version, 0);  /* lin=
e 497 */
> }
>
> If quic_crypto_set_cipher() hasn't been called on this struct quic_crypto
> yet, crypto->secret_tfm is NULL.
>
> This contrasts with quic_crypto_set_secret(), which has lazy initializati=
on:
>
> quic_crypto_set_secret() {
>         if (!crypto->cipher) {
>                 err =3D quic_crypto_set_cipher(crypto, srt->type, flag);
>                 if (err)
>                         return err;
>         }
>         ...
> }
>
> Without this initialization, quic_crypto_hkdf_extract() flows through
> hkdf_extract() -> crypto_shash_setkey(NULL, ...), causing a NULL pointer
> dereference.
>
> Would it make sense to call quic_crypto_set_cipher() before using
> secret_tfm, or to reorder the function so quic_crypto_set_secret() is
> called first?
>
secret_tfm will always set in quic_connect(), quic_accept() and
quic_inet_listen(),
quic_crypto_initial_keys_install() will be only called after one of
these 3 functions
is called.

The patchset-2 (the following series) will give you this completeness.

> > +     if (err)
> > +             goto out;
> > +
> > +     quic_data(&l, tl, strlen(tl));
> > +     quic_data(&k, srt.secret, TLS_CIPHER_AES_GCM_128_SECRET_SIZE);
> > +     srt.type =3D TLS_CIPHER_AES_GCM_128;
> > +     srt.send =3D 1;
> > +     err =3D quic_crypto_hkdf_expand(crypto->secret_tfm, &s, &l, &z, &=
k);
> > +     if (err)
> > +             goto out;
> > +     err =3D quic_crypto_set_secret(crypto, &srt, version, 0);
> > +     if (err)
> > +             goto out;
> > +
> > +     quic_data(&l, rl, strlen(rl));
> > +     quic_data(&k, srt.secret, TLS_CIPHER_AES_GCM_128_SECRET_SIZE);
> > +     srt.type =3D TLS_CIPHER_AES_GCM_128;
> > +     srt.send =3D 0;
> > +     err =3D quic_crypto_hkdf_expand(crypto->secret_tfm, &s, &l, &z, &=
k);
> > +     if (err)
> > +             goto out;
> > +     err =3D quic_crypto_set_secret(crypto, &srt, version, 0);
> > +out:
> > +     memzero_explicit(secret, sizeof(secret));
> > +     memzero_explicit(&srt, sizeof(srt));
> > +     return err;
> > +}
>
> [ ... ]
>
> > +/* Derive and install transmission (TX) packet protection keys for the=
 current key phase.
> > + * This involves generating AEAD encryption key, IV, and optionally he=
ader protection key.
> > + */
> > +static int quic_crypto_tx_keys_derive_and_install(struct quic_crypto *=
crypto)
> > +{
> > +     struct quic_data srt =3D {}, k, iv, hp_k =3D {}, *hp =3D NULL;
> > +     u8 tx_key[QUIC_KEY_LEN], tx_hp_key[QUIC_KEY_LEN] =3D {};
> > +     int err, phase =3D crypto->key_phase;
> > +     u32 keylen, ivlen =3D QUIC_IV_LEN;
> > +
> > +     keylen =3D crypto->cipher->keylen;
> > +     quic_data(&srt, crypto->tx_secret, crypto->cipher->secretlen);
> > +     quic_data(&k, tx_key, keylen);
> > +     quic_data(&iv, crypto->tx_iv[phase], ivlen);
> > +     /* Only derive header protection key when not in key update. */
> > +     if (!crypto->key_pending)
> > +             hp =3D quic_data(&hp_k, tx_hp_key, keylen);
> > +     err =3D quic_crypto_keys_derive(crypto->secret_tfm, &srt, &k, &iv=
, hp, crypto->version);
> > +     if (err)
> > +             goto out;
> > +     err =3D crypto_aead_setauthsize(crypto->tx_tfm[phase], QUIC_TAG_L=
EN);
> > +     if (err)
> > +             goto out;
> > +     err =3D crypto_aead_setkey(crypto->tx_tfm[phase], tx_key, keylen)=
;
> > +     if (err)
> > +             goto out;
> > +     if (hp) {
> > +             err =3D crypto_skcipher_setkey(crypto->tx_hp_tfm, tx_hp_k=
ey, keylen);
> > +             if (err)
> > +                     goto out;
> > +     }
> > +     pr_debug("%s: k: %16phN, iv: %12phN, hp_k:%16phN\n", __func__, k.=
data, iv.data, tx_hp_key);
> > +out:
> > +     memzero_explicit(tx_key, sizeof(tx_key));
> > +     memzero_explicit(tx_hp_key, sizeof(tx_hp_key));
> > +     return err;
> > +}
> > +
> > +/* Derive and install reception (RX) packet protection keys for the cu=
rrent key phase.
> > + * This installs AEAD decryption key, IV, and optionally header protec=
tion key.
> > + */
> > +static int quic_crypto_rx_keys_derive_and_install(struct quic_crypto *=
crypto)
> > +{
> > +     struct quic_data srt =3D {}, k, iv, hp_k =3D {}, *hp =3D NULL;
> > +     u8 rx_key[QUIC_KEY_LEN], rx_hp_key[QUIC_KEY_LEN] =3D {};
> > +     int err, phase =3D crypto->key_phase;
> > +     u32 keylen, ivlen =3D QUIC_IV_LEN;
> > +
> > +     keylen =3D crypto->cipher->keylen;
> > +     quic_data(&srt, crypto->rx_secret, crypto->cipher->secretlen);
> > +     quic_data(&k, rx_key, keylen);
> > +     quic_data(&iv, crypto->rx_iv[phase], ivlen);
> > +     /* Only derive header protection key when not in key update. */
> > +     if (!crypto->key_pending)
> > +             hp =3D quic_data(&hp_k, rx_hp_key, keylen);
> > +     err =3D quic_crypto_keys_derive(crypto->secret_tfm, &srt, &k, &iv=
, hp, crypto->version);
> > +     if (err)
> > +             goto out;
> > +     err =3D crypto_aead_setauthsize(crypto->rx_tfm[phase], QUIC_TAG_L=
EN);
> > +     if (err)
> > +             goto out;
> > +     err =3D crypto_aead_setkey(crypto->rx_tfm[phase], rx_key, keylen)=
;
> > +     if (err)
> > +             goto out;
> > +     if (hp) {
> > +             err =3D crypto_skcipher_setkey(crypto->rx_hp_tfm, rx_hp_k=
ey, keylen);
> > +             if (err)
> > +                     goto out;
> > +     }
> > +     pr_debug("%s: k: %16phN, iv: %12phN, hp_k:%16phN\n", __func__, k.=
data, iv.data, rx_hp_key);
> > +out:
> > +     memzero_explicit(rx_key, sizeof(rx_key));
> > +     memzero_explicit(rx_hp_key, sizeof(rx_hp_key));
> > +     return err;
> > +}
>
> This isn't a bug, but these two functions are nearly identical.
>
> quic_crypto_tx_keys_derive_and_install() and
> quic_crypto_rx_keys_derive_and_install() share the same structure: derive
> keys via quic_crypto_keys_derive(), set AEAD auth size and key,
> conditionally set the HP skcipher key, pr_debug, and memzero_explicit the
> temporaries.
>
> The only differences are the member names accessed (tx_secret vs
> rx_secret, tx_iv vs rx_iv, tx_tfm vs rx_tfm, tx_hp_tfm vs rx_hp_tfm).
>
> Could these be unified into a single static helper that takes
> direction-specific pointers as parameters?
>
Looks possible, and I will give it a try.

Thanks.

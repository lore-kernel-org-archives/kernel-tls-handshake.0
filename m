Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817424D7966
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 15:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573934; cv=pass; b=iET8fM4rAZJ2rZmb/WHvL5ly34Dx73GpdsxzaK/PgQU1VHUgSUSd1GpSaIlmzAEzT8J2TzAqy3rvlJMNVHMGz1I4gXodb0MuC1HzfrksbQ4zWRPouBX2mmw0Rg1iJ7TkSIhwEKRdmQFOGpw6kx9UmziHFCl8UA1AEi9Khbh//VQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573934; c=relaxed/simple;
	bh=95yWInc3f+wvYQiaDhRAR54L526l6o9/CFXKuqW3YLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPlGcEZkI53/AVGrTTcNR5D/plH7ISOPefxYlYdHGSvkwBif37LFVJ6FMomkyIXJvR7SYF/HGqRHIKKQChpMwTjUUV7Eb6c/6YHtd78BoGLCRX0NVQvJeDAVf7ttK1GfUVZ9aDEmbAVB+MNWLrVxaxPurlqrhQC2ZK2QwaWvv1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltyP9yE7; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltyP9yE7"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85a4329731cso819077b3a.3
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 08:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789573928; cv=none;
        d=google.com; s=arc-20260327;
        b=L5YzvhLVA5BrRFJ9QwaE9mm55YnhifhcIgKiQck5iFsVEKcFv6wDxkYDtcU0XJLPX7
         vk/+wEstGKvOKvGFFd5m6rI770w13WbcH2XTG0R0bwopxUQnfLLLoLH31So1QXnZxZSQ
         LZxfea0JmJAitoCXyt8ELamHNF/ft4qlno/4qsu0kQri+aiuubNNrbC65GwBSLzJYZVX
         fS75Idh+By8OD0BdSV8+TqRnJCbrpOJADuHkbeTkgFaj9LHj3WwCZzIPX4gELpMOU6iw
         IcWUOw+PzUXJrgDHc2iDOBRvZgQfue+Zrr2dUeNis8OOpMLqIYEYiWoLs1spTRpcwfWe
         LUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r5EyfF2xmjvND7Ej5BcVBP3F4zIxnNANBeziUA4WJEI=;
        fh=SwRcnQ3Sx3Xvl430g8d9jV2nRs9fC/NsiV2OEX4eTZY=;
        b=mVGO4G9/HgWjY2NnPTu3+wrdkAJb/hDbuwiCt7SqxmyKK6+tgAIL4U3V+n/ArtlpfA
         /iRlLLs6rRhTCx1b1Y9mJcuQ30/a0WDOXBaS11CyJUsipr15h2Cahde/gZSkUvjtzfsk
         WhsdDTJGYjeUWTCPkivMwIldjz/xoinIamiLn9ZaTT3u93nD/B8gn0bMW7UUF9eAWumf
         h1dGRfbYMjn4rCPVjXmDier47xQdGQzjMPWWuo01b0HWOuHn3PaOql3sNP0c9Qt/BuvI
         yXIulL+nhU+Nq4w1Jcpy5q43gJVdJIK/Pd7BdGcyQ6Jd+A6opKgTxvYxpD0UYVoDGh89
         b6ZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789573928; x=1790178728; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r5EyfF2xmjvND7Ej5BcVBP3F4zIxnNANBeziUA4WJEI=;
        b=ltyP9yE75+u1VPlLwWKcr1EQVbJDRBVeN4Hjg+VCNps+ahICo7Iqjl8djg482BblgN
         mflUPxdJVTcAUwttN6UkVmoDgeT/oCmTZ2ZLnxvKa7G49RBc0RJxcX7UZvsnE+XpwXHm
         +S/Oou90jpbrg8xSCDfohH7FgeWHxV83Hv5g3UTBxMEPXMnXfFo5hvP3glbw88xBKWXT
         Ugv1nMysL/Rvt4svZtl4LaSdymq+iyLhLz1j82SRUTFiLiSVKrk/bE90vzuGi8JgOedr
         O7tzI2jb4/DQWlZGgK99/8W7g3iVGasDinJZYtk+6+9KtPSh1OlwBWtZ2tH35LjS9vH9
         Ln/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573928; x=1790178728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5EyfF2xmjvND7Ej5BcVBP3F4zIxnNANBeziUA4WJEI=;
        b=et0t0H/f+ZhFlDeUr4TPHsdhq7ViPHm9P929TL0o/wJ3mmE3gj8XzDr/RvGLcPhIB4
         pXOavb7n9GT1sM8sGs5SD0cvVg0uxm/LQ9by/O2ytjGYEvJ8E0/jA7HjGxfLnkIxSfzS
         pMRlfY0tm6EvTdQ7RwsPVjaehMd9ocS+ighIg8GBm/+qvZ+5qCz2aItPwIR94PTW4iJT
         0+X5cfF4jfz4rYgOieGCXd0H/pgFUXDFHSkxKFQIIPWPweSQjSroHSm+pkEXL+nBiwDG
         jTMpifebJRy+EsX8CywEaSMeIBoK63YmW+k1EZVp/ONDq9z1wEiAUdeAWHEQQfXZMAWk
         XSZw==
X-Forwarded-Encrypted: i=1; AKwUvBz7E8WxWrdlZ+efW0I8t9+eSgme8aIyf7OYk/FIzQPasVRZcwNfz/+98lmDrKVWJFc4t9YhP2/yaF2xCUuqegGz1uF0hw==@lists.linux.dev
X-Gm-Message-State: AFuF++kzQiVvjWOb5goC+Od2M6pX55v8r/moaVPiDfIQ8HP4MeCA/zrW
	3QwPL3CccuaYT8ejn7Gt372OGl0g0DlvUJLPAwqY4rQc2JveOQT5nUbylPhmqs3Adzak/ygCuIT
	IXXnnzzTejCc0Mor4Cg3WUwYr+vBqQd4=
X-Gm-Gg: AYBFou3QJqxA9Oin8Sulz8rAeB1hlsSo6vVVP7I7llGRg4NYJNPokAXLFuwJ6KSFOoe
	Cg9oM7oKCC44aimYhUkPHsWIY9kNQL4lE1fCoufBt3sVxxVrhfeXpVk4e3kOlsI4e1XCwHRf7HK
	LZWCFxZ0JkeO/XyhYguOBv6Wp5F7e4xOo8DyutHecEI701DqQDRvQN5bEu39PekIakbFHK3O+Gv
	cxpg9PaAfk2NIPhAGlt5PSyqHAEuTlNeu52yuEgnYsJh5hAmJH/pbV65BmCQVnrYakwwZuKk2bc
	akQIPBtennFOzZn/JfMxoltUXngb9GZA/5Hv1d0ZKwBJLtZN1XE0eOusvURBm0wQLCsS4SAoJfK
	/Qw5eA1I7ue+AmhuXXU0N5o5ReG0l0bwK9qGkq9MAu9ElbvYSrJLL4Bok
X-Received: by 2002:a05:6a00:4b0f:b0:857:7317:cff4 with SMTP id
 d2e1a72fcca58-8723a199a5amr6423934b3a.21.1789573927943; Wed, 16 Sep 2026
 08:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <f886c618bd560e42692c0ac3296bae4878755cc1.1789393775.git.lucien.xin@gmail.com>
 <178950185147.22033.10922498784930147476@kernel.org>
In-Reply-To: <178950185147.22033.10922498784930147476@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 16 Sep 2026 11:51:55 -0400
X-Gm-Features: AcwNN1UzfBxaJOMB6iv3Yg7aIgS3jN1akwkjx3YEKnt_lo6ALcoTP6dYS_KHoK0
Message-ID: <CADvbK_f8PF0uvQsULf2Z6ZO4Ln4b4=670EH8ixZZLjE_1uSM5g@mail.gmail.com>
Subject: Re: [PATCH net-next v15 11/15] quic: add crypto key derivation and installation
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
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> - [Medium] net/quic/Kconfig selects CRYPTO_HMAC but not a concrete digest
>   implementation, while every entry of the new ciphers[] table in=E2=80=
=A6
> - [Low] quic_crypto_set_secret() consumes the uAPI struct
>   quic_crypto_secret but never reads `level` or `reserved`, and honours=
=E2=80=A6
>
> --
>
> quic: add crypto key derivation and installation
>
> This adds net/quic/crypto.c with the QUIC key schedule: HKDF-Extract and
> HKDF-Expand-Label helpers, Initial secret derivation, traffic secret
> installation, key update, and stateless reset token derivation.  The new
> struct quic_crypto is embedded per encryption level in struct quic_sock a=
nd
> freed from the new quic_sock_destruct().
>
> > diff --git a/net/quic/crypto.c b/net/quic/crypto.c
> > new file mode 100644
> > index 0000000000000..910557b680524
> > --- /dev/null
> > +++ b/net/quic/crypto.c
> > @@ -0,0 +1,567 @@
>
> [ ... ]
>
> > +static const struct quic_cipher
> > +ciphers[QUIC_CIPHER_MAX + 1 - QUIC_CIPHER_MIN] =3D {
> > +     CIPHER_DESC(TLS_CIPHER_AES_GCM_128,
> > +                 "gcm(aes)", "ecb(aes)", "hmac(sha256)"),
> > +     CIPHER_DESC(TLS_CIPHER_AES_GCM_256,
> > +                 "gcm(aes)", "ecb(aes)", "hmac(sha384)"),
> > +     CIPHER_DESC(TLS_CIPHER_AES_CCM_128,
> > +                 "ccm(aes)", "ecb(aes)", "hmac(sha256)"),
> > +     CIPHER_DESC(TLS_CIPHER_CHACHA20_POLY1305,
> > +                 "rfc7539(chacha20,poly1305)", "chacha20", "hmac(sha25=
6)"),
> > +};
> > +
> > +int quic_crypto_set_cipher(struct quic_crypto *crypto, u32 type)
> > +{
> > +     const struct quic_cipher *cipher;
> > +     void *tfm;
> > +     int err;
> > +
> > +     if (type < QUIC_CIPHER_MIN || type > QUIC_CIPHER_MAX)
> > +             return -EINVAL;
> > +
> > +     cipher =3D &ciphers[type - QUIC_CIPHER_MIN];
> > +     tfm =3D crypto_alloc_shash(cipher->shash, 0, 0);
> > +     if (IS_ERR(tfm))
> > +             return PTR_ERR(tfm);
> > +     crypto->secret_tfm =3D tfm;
>
> [Severity: Medium]
>
> Every entry of ciphers[] requests either hmac(sha256) or hmac(sha384), bu=
t
> net/quic/Kconfig does not select a digest implementation:
>
>         select CRYPTO
>         select CRYPTO_HMAC
>         select CRYPTO_AES
>         select CRYPTO_GCM
>         select CRYPTO_CCM
>         select CRYPTO_CHACHA20POLY1305
>         select NET_UDP_TUNNEL
>
> CRYPTO_HMAC is only the template (it selects CRYPTO_HASH and
> CRYPTO_MANAGER), while CRYPTO_SHA256 and CRYPTO_SHA512 are independent
> tristates without default y.
>
> With IP_QUIC=3Dy/m and CRYPTO_SHA256=3Dn, does crypto_alloc_shash(cipher-=
>shash,
> 0, 0) in quic_crypto_set_cipher() fail with -ENOENT, so that
> quic_crypto_set_secret() and quic_crypto_initial_keys_install() can never
> install keys and no connection can be established?
>
> Should IP_QUIC also select CRYPTO_SHA256 and CRYPTO_SHA512 (the latter fo=
r
> the hmac(sha384) entry)?
>
True:

Verified that CRYPTO_SHA512 can be disabled while QUIC is enabled. I'll add
CRYPTO_SHA256 and CRYPTO_SHA512 to the select list.

Thanks.

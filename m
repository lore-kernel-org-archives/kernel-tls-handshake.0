Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8884AB3A5
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574488; cv=pass; b=Wi0nkwPzkaJEd5m69EM04iciTTdXniFRu47maHwlAkfVeWkcMSmLpyapZ9dFf3uU06zTawURo5TxaF1j3e4hFQjnv2jCY8E7Y0ERZeBFWhLaVak5BO4OpTE2p7BrfM5p3KHJn/gWr6eYB6k0m13QQjyfQ5HujXFC/5Pd90LkySQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574488; c=relaxed/simple;
	bh=KZzkhX7Yg9tq5VztU7UiOhKrR7TxsvCHoG9frYwd3EM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QxBZQZ8EXUra99uql7WTWmqrWtz0L3VMMemLZBxbWXSosIZhN6H3viZniogHIzwXUMQ/kVlII1I3CfknOGaPNE76YAsST3nKKmNG+GVKsVhAoC5rOpMCCVboMbOkhTfnQD69fGcJzGhN2fp2VUTpCOpiB+exUXSe0M7Oq/Hr4Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwlRZlaY; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwlRZlaY"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso2221183b3a.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 09:01:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789574484; cv=none;
        d=google.com; s=arc-20260327;
        b=dC++55Efn64P2hYhWcvWAJ4bscpi2L10GVtpcGsWB+gC3voTt24Ef5nubMTRIZTIod
         6wYwtuXMatSQQua1AQpi105D8GBP2scFQqXTeKiBgfbnr1UTCMmGRcjKyMUaIvM5IT6/
         dKfE6k3TbDtBZ0KvOsPPZjMopIpZj20Dx2mQrZYaHapEHrqITHsWoEFwoYeAksgB0SVK
         nedsDxReGFrjIhG4ipb8mWXGiKoW6Ae/6pTWCxu72S1ltRczc8e2zn9/s81lhBZGxF1y
         wr1EEkbbxOoiZIFJrhgiK6PpXdMsVzB1Aa33xdzu7hacPF34m3zY64zkCiBkmTlGx8R2
         /Z4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6dZUcimEc7wlnFEZ6ZQZ/uU5ugi4xLHu5NBwADbejVU=;
        fh=Jgdm9p9Gip72FzVyP0jBS9KFeNPWDWnYbjkewLIrup4=;
        b=o3vFiUFJT8lwbkky5PN3lv5zA8pu1tpboiW7aFJqk/GNMjjlUAtCTyevW9rTbp9gku
         b0vXbR1UdPn0b+D1MExy5jtnrnvsu1f781uBIVqVj3ZXgXYqvw8mi2jumtGmB4ofC6Vs
         rBdiSluAY90mkHslFqyAO5Qqd+I9paVMYnaND2VzASkDOPLFVLth8CkcWF89SKG2/yXu
         1A5bmTvbhorNtmShN3VniOwzEATXyo52WV+omwJe6fz66rqSgG8xQO4oM3SihNiaDcFf
         YXupgw92HjKhbX4it2rAK9UgRwrfgvTS+EmRVsi/lG+WmEuElCDk0DFdYkZi74wWBJd/
         d5ww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789574484; x=1790179284; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6dZUcimEc7wlnFEZ6ZQZ/uU5ugi4xLHu5NBwADbejVU=;
        b=bwlRZlaY5ZqUdP2Kp1Q+bUtaSmHq1nggSJ14ovz1fIQ3nmhcIPfR9C4c+oc98zIprh
         x0VYSulrRKCqflWTctUmCx5i7WWwJmHg58Hl+8RvZ988BaCOfe6Y6yOwRft8vwt0xFFr
         E0rGOLnPRbsqm39Uj2hSrH36fFT+6FidjuGEieY1uAKBPW9HVsmrBffD5NVZ654/txij
         jscud4ewi6Z0hzfSeVthGmaJjHVQI2y1oofsX0W7xirLW8cARCvf1+0LalXEo7uc16x2
         C/bJFP4dEnKV5BID4PybN05TyKSlRpcUWSKyFzvjLpoYZlhpMFzR+3nLSiIwsk2Pb1Ig
         d+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574484; x=1790179284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dZUcimEc7wlnFEZ6ZQZ/uU5ugi4xLHu5NBwADbejVU=;
        b=L+a7oJ/rp+IabAb6zCU/V5hiTZP/Iv01QJIlZVr/tqVGWyLfxVMv1Sn9k5/1T6nGMQ
         LTNdo6HJYihv1JaoXDai41t3aMuPXHOJhUsjnahG5tKCR1mlnqoW9M/k9RwW3+JWdGnn
         duL7b8jGcErPOY3igvb4Shw5BbcfWZmdXsYc/ERGJ53WiBxXhZbk/LzeHmTnE2uVhPdQ
         MgX6bCcPrd2WknmgyCwwOtN4xPXHFYSkIiJxlrpqrBbjP5GZX8Fk3dyXAnpZZ+Am91Zu
         lE3ueUuaPOeFY7YaUwe3usNDBqJ6O2VPCExZrPOjJLIDUDW/bIn/b+z4B39HI+3GRzDx
         OPUg==
X-Forwarded-Encrypted: i=1; AKwUvByzW5fiXitVfNcIXfAqikK2mTdv6buRJb9JABIjvLeN/60EYI2KlhnR2Z0zhYzuGvQjpoOyCbXRagVaWc6z93OGQeWFZg==@lists.linux.dev
X-Gm-Message-State: AFuF++kbQTwdZQs9Bo82kOTNxA7c4Wrq5R+mXfW78SipiR1PXqlZBrOD
	bYftALPOXSHLIHXgKde6mPa/i1IRD31d/37vswXqZns8SAFjrr8NGGHcza+mcz9PokNZAkC/K1x
	SQawgukM2aTBG15yDNIojuEYcbUZVD6s=
X-Gm-Gg: AYBFou3/TQMp+YBOgEE1xbA0HhkQ5T9p0x7Ok5nhWzLe07wfCXq0HskrlHceXL52VV/
	1BOKeDYJbfRhI/5oQgWHuvp8gpvho0F0rrdIfTKJGmxB/oHChSCf2KcPTLaZ7lMh68igmTZm/2M
	WcQq/mKz40KPd0TFgVXqtbDYK/sQnCCOuXmD5+lLdojVADfCeaZdY6SDxEAH2FN0WXwxEdTI2cx
	XicycwNcYk6EaqIocOXHdr7T0+JYlSEUKstvZpCBBLdqO54YPkBeppLS2nYpOXPcVn5YagEoRMg
	5gcWJ0QwfvUuHwctHneunFoBgSY4pxLknv8d2qwmjknw1o0s/JV0oo+MbO/dTGnYHnStIfb41Nf
	ND59Hy3AlRd0JPQmg+Yq5HWz5PsE3oln0BZUSKKy35RSTTv5L4N2xyHU9
X-Received: by 2002:a05:6a00:194d:b0:858:ea6a:4415 with SMTP id
 d2e1a72fcca58-87341085f89mr164645b3a.2.1789574484253; Wed, 16 Sep 2026
 09:01:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <06841ed60dda515dce3f3f16b4c3b31fdd7113fe.1789393775.git.lucien.xin@gmail.com>
 <178950185396.22033.4056258856263599395@kernel.org>
In-Reply-To: <178950185396.22033.4056258856263599395@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 16 Sep 2026 12:01:12 -0400
X-Gm-Features: AcwNN1Wlyl-Jb-pcM6ljfG1c-LlXoB2ud7xNxMc2wjUUg2Dsiy8bDgQmSGaxVHw
Message-ID: <CADvbK_d9-8y8uC09+Sqqxxs_7a_YaOZxhL6JXC-5PQZXGARN6w@mail.gmail.com>
Subject: Re: [PATCH net-next v15 12/15] quic: add crypto packet encryption and decryption
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
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 2
>
> - [Medium] quic_crypto_encrypt() records crypto->key_update_send_time =3D
>   quic_ktime_get_us() *before* attempting to protect the packet=E2=80=A6
> - [Medium] The new packet protection paths
>   (quic_crypto_encrypt()/quic_crypto_decrypt() ->=E2=80=A6
> - [Low] The comments on the new token helpers describe an earlier
>   revision of the code and are now wrong in three ways.
> - [Low] Reported concern: quic_crypto_generate_token() computes len =3D
>   sizeof(flag) + addrlen + sizeof(u64) + conn_id->len + QUIC_TAG_LEN and=
=E2=80=A6
>
> --
>
> quic: add crypto packet encryption and decryption
>
> This patch adds packet-level AEAD encryption and decryption for QUIC,
> including header protection and its removal, plus helpers for the Retry
> integrity tag and for generating and verifying address validation tokens.
>
> A few questions on the new code below.
>
> > diff --git a/net/quic/crypto.c b/net/quic/crypto.c
> > index 910557b680524..d62c6c4bea7de 100644
> > --- a/net/quic/crypto.c
> > +++ b/net/quic/crypto.c
>
> [ ... ]
>
> > @@ -252,6 +253,457 @@ ciphers[QUIC_CIPHER_MAX + 1 - QUIC_CIPHER_MIN] =
=3D {
> >                   "rfc7539(chacha20,poly1305)", "chacha20", "hmac(sha25=
6)"),
> >  };
> >
>
> [ ... ]
>
> > +/* AEAD Usage. */
> > +static int quic_crypto_payload_protect(struct quic_crypto *crypto,
> > +                                    struct sk_buff *skb, bool enc, gfp=
_t gfp)
> > +{
>
> [ ... ]
>
> > +     aead_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG,
> > +                               quic_crypto_done, skb);
> > +     *(struct quic_crypto **)ctx =3D crypto;
> > +     atomic_inc(&crypto->async_pending[phase]);
> > +     cb->crypto_ctx =3D ctx; /* Async free context for quic_crypto_don=
e() */
> > +     err =3D enc ? crypto_aead_encrypt(req) : crypto_aead_decrypt(req)=
;
>
> [Severity: Medium]
> This is the single place where every QUIC packet is protected or
> unprotected, so it looks like the natural home for the AEAD usage limits
> of rfc9001#section-6.6.  Are those limits enforced anywhere?
>
> struct quic_crypto in net/quic/crypto.h keeps secrets, IVs,
> async_pending[], the key update timestamps and the bit flags, but has no
> field for the number of packets protected with a key, nor for the number
> of packets that failed authentication, and a grep over net/quic at the en=
d
> of the series finds no confidentiality or integrity limit check.
>
> On the RX side quic_crypto_decrypt() just returns the AEAD error, so a
> peer can keep submitting forgery attempts against the same key without th=
e
> connection ever being closed, which rfc9001#section-6.6 requires once the
> integrity limit is reached:
>
>         err =3D quic_crypto_payload_protect(crypto, skb, false, gfp);
>         if (err) {
>                 if (err =3D=3D -EINPROGRESS)
>                         return err;
>                 ...
>                 return err;
>         }
>
> TLS_CIPHER_AES_CCM_128 is supported here (quic_crypto_is_cipher_ccm() and
> the "ccm(aes)" ciphers[] entry) and has the lowest integrity limit of the
> QUIC AEADs.  Is the intent to add the per-key counters and the limit chec=
ks
> in a later patch?
>
True:

This is a missing feature. I'll add per-key counters and the corresponding
limit checks.

> > +     if (err =3D=3D -EINPROGRESS || err =3D=3D -EBUSY) {
> > +             memzero_explicit(nonce, sizeof(nonce));
> > +             return -EINPROGRESS;
> > +     }
> > +     atomic_dec(&crypto->async_pending[phase]);
> > +     cb->crypto_ctx =3D NULL;
> > +
> > +out:
> > +     kfree_sensitive(ctx);
> > +     memzero_explicit(nonce, sizeof(nonce));
> > +     return err;
> > +}
> > +
> > +/* Encrypts a QUIC packet before transmission.  This function performs=
 AEAD
> > + * encryption of the packet payload and applies header protection. It =
handles
> > + * key phase tracking and key update timing.
> > + *
> > + * Return: 0 on success, or a negative error code.
> > + */
> > +int quic_crypto_encrypt(struct quic_crypto *crypto, struct sk_buff *sk=
b,
> > +                     gfp_t gfp)
> > +{
> > +     struct quic_skb_cb *cb =3D QUIC_SKB_CB(skb);
> > +     int err;
> > +
> > +     /* Packet payload is already encrypted (e.g., resumed from async)=
,
> > +      * proceed to header protection only.
> > +      */
> > +     if (cb->resume)
> > +             goto out;
> > +
> > +     cb->key_phase =3D crypto->key_phase;
> > +     /* If a key update is pending and this is the first packet using =
the
> > +      * new key, save the current time. Later used to clear old keys a=
fter
> > +      * some time has passed (see quic_crypto_decrypt()).
> > +      */
> > +     if (crypto->key_pending && !crypto->key_update_send_time)
> > +             crypto->key_update_send_time =3D quic_ktime_get_us();
> > +
> > +     err =3D quic_crypto_payload_protect(crypto, skb, true, gfp);
> > +     if (err)
> > +             return err;
>
> [Severity: Medium]
> Should key_update_send_time be committed only after the packet has actual=
ly
> been protected?
>
> Here the timestamp is stored before quic_crypto_payload_protect() runs, a=
nd
> neither this error return nor the header protection failure below restore=
s
> it.  If payload protection fails (skb_cow_data() returning -ENOMEM,
> quic_crypto_aead_mem_alloc() returning -ENOMEM, an skb_to_sgvec() error, =
or
> an AEAD error) the skb is dropped by the caller, but
> crypto->key_update_send_time now records a time at which nothing was sent=
.
>
> quic_crypto_decrypt() then uses that value as the start of the old key
> retention window:
>
>         if (crypto->key_pending && cb->key_phase =3D=3D crypto->key_phase=
) {
>                 time =3D crypto->key_update_send_time;
>                 if (time &&
>                     quic_ktime_get_us() - time >=3D crypto->key_update_ti=
me) {
>                         crypto->key_pending =3D 0;
>
> Can the window therefore already be expired when the first packet in the
> new phase is really received, so that key_pending is cleared immediately =
and
> a later reordered old-phase packet is treated as a fresh key update
> (phase !=3D crypto->key_phase && !crypto->key_pending), overwriting the o=
ld
> key slot before those packets can be decrypted?
>
True:

This is not a major issue in practice. I'll move setting
key_update_send_time to after payload protection succeeds.

Thanks.

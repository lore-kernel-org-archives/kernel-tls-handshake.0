Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792532334;
	b=qIeZGfscotjkRt5dLz14D5/UKtg4PXPsvEqBQS1sq7UERSVyrWxQILgbB+8U0eVlML1K
	 tDbQUz6exhukBt0vRCPJPGAsNB9kmQiCAA3+QJQLs0cqr+tim6aYaFtjyj6U998MEI0w4
	 +UC/d4YlDunwBPTHmnZ621usOFoTLpaBALfXXM7U+9NDkl8flbkjCrVBW6KZ0n1Qds6J0
	 tD6TOiqP67NHF1WmAl8pz9iGrSSG+K117c5WBrO31aB1nMuUfCLL7zRb4xxyNG4cxP3VU
	 IaNZjswMvHk6+p5LAnZi6sHd4HLlZAvX1FaQr3zwi8VShrT3UdpvkuY/b3mdGv2ZIfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T07kOSF9AnuZjBYq6sbm0WLv57Cp3iAwopu/k0yBEUo=;
	b=CtwtY3nmwjpZa7RHZW0y4z5WvlyNfm3Gu/5de+Kq6iDrNcBfUyWNJrgEowd4q8VfsXjV
	 FWGhLyKe2gi7l2wj74zY2gfJtZuD2yp4oD6p0fwByL03kbhuCHcZ3d2VMSLjkYMUspNBT
	 Xs9bNph1DRIf2jsdaXZ1X003Gsj0ruqQmSOdNUxhHjB1vhK+W87vmf0LuEZvVSV2ncWNK
	 O51MbHv7wxPAzhAp6W8SJKSBciI8jhTvTaXLwi2eFVg2DE7XFvaG9L8RB4vVBFFxD+n6z
	 zioA72J81LC96ZuNRb7cfS2n+9yStqul/eA9XrsBY8PDpbVmrwSsTtiZT2Uh8TM7HLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="RhCSg/It";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CE960A260E
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Oct 2026 21:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44CE960A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RhCSg/It
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5e9528732b4so33258e0c.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Oct 2026 14:38:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792532332; cv=none;
        d=google.com; s=arc-20260327;
        b=c7nCDIoqPw1+wyLw3+M9oZihBrkISDHlamntknuBvcUp9b9/N1ZAOKtJrycamr8ztm
         pUvTQZNPdF+wF0sAsMJcuP+4Tlb5pEJyn06EObiB5O3eo7AAQj0qOxL3VVoVmw9ZFqTM
         oFm6n+P5dpDyinhLsUXaY+45+oZOsB3dKjWY7z/Pt+M1AaK3S7bK/5GOoUv2SJcxGs2N
         9zkvTkZbG3fuXDci9YKA4nBDHQ+u+Nb143EsepVmFX2cvth520KnRFOyl2aHZC3YDOYW
         4vk0xiLvv/Xbrd+yTrvlPBZmbjhuGnSN4HtZGUUzY6liYaTt+S0k8vZkPaLLaA2obN1y
         J4ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T07kOSF9AnuZjBYq6sbm0WLv57Cp3iAwopu/k0yBEUo=;
        fh=YGMNzF0ps1cB+SI1wOuCWPhaXXW8GwOjg38WFnvci28=;
        b=hbMfsYCR4NgyvcpuCUilXaVEPqcleiE8dMhRusVdZHMH8hcfAbMKd4VLyz4f/1AIKf
         MADrmXR0be5x/b8qO3t8gDnvanpEx2aBsLc+7CMcm9leRWOzi2uo/dezy7Uap82kXeMC
         q1ZNbzjXA/icIAOWeYM2Z35zxuebWey8sxbSs7TgqxpLG37Z9yiyotRRlC3xHZAZuPAT
         ru5zuD/0ffAevE4iAbjVvCe0nIDawkKyfAWsWX8up8x8QZMb2xgNRSR6cdUJyNP00wVF
         Ct4pM6PJQ+Iy2Ju/0qntpNpeVsKEecE6WcgljVbn/NY5CyH7vMP9XrxNsA+eHGIp6Ndd
         Io1g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792532332; x=1793137132; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T07kOSF9AnuZjBYq6sbm0WLv57Cp3iAwopu/k0yBEUo=;
        b=RhCSg/It4/dw6rxRfz7FLdWvHdB9vUQNGEPh0t3XqEBgeMfa8ZKCX+L3toi+ju8ECG
         f0MlZzbQG+y1Bq12IIzf3cPEb4I4Q+PLyhRCCeihzPeCmHEFDZAs2TLpayMZ3oKD5mrx
         +GY25sGgxqrTGHBCOK2B72krRsYgFuAIF7cFq413px+Xz5qlY+m20sQ119r5rW2sdsws
         LxvaQfMsG1i2Tv5nO62WK5kmHP6Ms/Ta3rkUDJOczOgBrSgHgAnvd+6XuEi1Qid+Ot5+
         BJagj38qggH1YThVof/Y/DqaGqtYjWhQ9e1CdfWFYiHUXbzsau6OlXxjVQrJJR44ZDxF
         OVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792532332; x=1793137132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T07kOSF9AnuZjBYq6sbm0WLv57Cp3iAwopu/k0yBEUo=;
        b=YgDifhPMYjZgikzRttz0ml029Wm6LSY4rbUzoccgxppL9c6HkaBM4NIiLWNbjJ68yG
         vxMtuzrQcOK0409njS+sUt8UxuGQ63osClPXfgoAurnLa5FM/m3DTbCpZNmOH/ib46Zl
         aoe0tDclJAE+1WZupv+n9FouQYLh7ReIhPkf0kqOuFdpYnJuXyK0j1JDXWOpwx2aExYW
         241AE4kqkhaTG+ZuYuKFdagxKXl9yZRvLLUXVD7uaFuXjX8IH/7WEC/SWRV7OgmpBI3D
         hgBxKU3qAKsPZ2olEwS41yGNvyjmcvU2xntSt8l/41NNbIcjkltT4EADIUl1rxsANVbV
         DOiA==
X-Forwarded-Encrypted: i=1; AKwUvBxt0cMaOS1ipxG6y08woyV8HLiWKy7g2geF/8i8okoQ5lorv+w6jYYV20ewdjIERgl9W3E6O50KNVnZE8kK91cl2M3CiA==@lists.linux.dev
X-Gm-Message-State: AFq9FYL/qHJmQ22xoY7wM9x6yOljWldkv1X4oqHp2tiMvtyVahP4LH14
	p4zcSeB5IPjM7GoZ26czFMxyedEufI1C48bTLRAbpIpm7cjmwB/k5a6vvWJIbdJFWU/GJNYJr7B
	FguL6BKSQ3XJoCXpxw6c/VgzVyPHAEHs=
X-Gm-Gg: AYBFou1vUMg2VzBY8asokzb94DLmcgYLSgOb14kB/rj49e/hk8zHJUxeZHsSljl8q9Y
	YI2GPxCmo3wJ31nAkeTcJjU5P3Q4rGX7ZTnAD7ojUcsg1LrgYl2KDjUAb4zkUnStZGOKliwQW7x
	ArOKa5asjJoRJuDkLDNRzxGnAEKaiamL26pFDAB9/a9u9yyZk7D8no4TVw5a+SWl5B4Qtat9NXJ
	r0rAkbqgv1B5CxJqOBrC3U2HEu67dGSZX/TcPdfQs5dafpwikVHadW9NaOkRFMgtn0hCOy9kmTb
	0zFhptMaXgnM2cZQZB9AMjAU5qJZrQUSEEKhOIuZ5+fqeBT2qUHlmdmQTahbc99xTsoZmjihoDO
	OimSTc3hPQBhbXkC8S7CKLchwwV1ZlL0IMZGV7F958P50YWm945q3C4Elkf9UIKrlGRdJvaxR5e
	4bRt5qsPHMXrIp
X-Received: by 2002:a05:6122:f8f:b0:5c9:a60b:e5a2 with SMTP id
 71dfb90a1353d-5eaebe1fda5mr38131e0c.13.1792532332203; Tue, 20 Oct 2026
 14:38:52 -0700 (PDT)
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <25d5d63b6de931191e4c1bb0d99edf427facf1a6.1792164438.git.lucien.xin@gmail.com>
 <179244540755.3135.6629272689764365696@kernel.org>
In-Reply-To: <179244540755.3135.6629272689764365696@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 20 Oct 2026 17:38:39 -0400
X-Gm-Features: AclHuK_BijVex1bq8DNyjPV3DVLOPmzVNY4j7ByN2m0CAL1TjImhtpQ-k6hL3bE
Message-ID: <CADvbK_fJ1czV0OU_oTKAjKG+3807yhBbOTddkzJE0+Aqz3+u6A@mail.gmail.com>
Subject: Re: [PATCH net-next v17 12/15] quic: add crypto packet encryption and decryption
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
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The token timestamp is sent in cleartext, and the obfuscation
>   offset is too narrow to hide server uptime.
> - [Medium] NEW_TOKEN tokens can be linked to the connection that issued
>   them, which RFC 9000 Section 8.1.3 forbids.
> - [Low] quic_crypto_decrypt() adds every payload-stage failure to the
>   connection-wide integrity counter crypto->rx_fails, not just=E2=80=A6
> - [Low] When an old-key TX packet resumes after async encryption, it can
>   start the key-retention timer meant for the first new-key packet.
>
> --
>
> quic: add crypto packet encryption and decryption
>
> This patch adds AEAD payload protection and QUIC header protection for
> packets on TX and RX, along with key phase tracking and key update
> handling. It also adds helpers to compute the Retry integrity tag and to
> generate and verify Retry and address validation tokens.
>
> > diff --git a/net/quic/crypto.c b/net/quic/crypto.c
> > index 2b72a781493af..93fd4cdb055f2 100644
> > --- a/net/quic/crypto.c
> > +++ b/net/quic/crypto.c
>
> [ ... ]
>
> > @@ -269,6 +270,484 @@ ciphers[QUIC_CIPHER_MAX + 1 - QUIC_CIPHER_MIN] =
=3D {
>
> [ ... ]
>
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
> > +     if (cb->resume) {
> > +             err =3D cb->crypto_err;
> > +             if (err)
> > +                     return err;
> > +             goto out;
> > +     }
> > +
> > +     cb->key_phase =3D crypto->key_phase;
>
> [ ... ]
>
> > +out:
> > +     err =3D quic_crypto_header_protect(crypto, skb, true, gfp);
> > +     if (err)
> > +             return err;
> > +     /* If a key update is pending and this is the first packet using =
the
> > +      * new key, save the current time. Later used to clear old keys a=
fter
> > +      * some time has passed (see quic_crypto_decrypt()).
> > +      */
> > +     if (crypto->key_pending && !crypto->key_update_send_time)
> > +             crypto->key_update_send_time =3D quic_ktime_get_us();
>
> [Severity: Low]
>
> Can a packet protected with the old key start the old-key retention timer
> here when it resumes from async encryption?
>
> One possible sequence:
>
>   TX packet encrypted asynchronously with cb->key_phase =3D 0
>     (async_pending[0]++)
>
>   RX packet with key phase 1 arrives on the backlog
>     quic_crypto_decrypt()
>       async_pending[1] check passes
>       quic_crypto_key_update()
>       key_pending =3D 1, key_phase =3D 1, key_update_send_time still 0
>
>   Phase 0 TX packet resumes
>     quic_crypto_encrypt()
>       cb->resume -> goto out
>       key_update_send_time =3D quic_ktime_get_us()
>
> The comment says the timestamp is for "the first packet using the new
> key", but this packet used the old key.
>
> The next phase 1 RX packet in quic_crypto_decrypt() can then clear
> key_pending based on this earlier timestamp. A later reordered phase 0
> packet would then trigger a new key derivation instead of being decrypted
> with the retained old keys.
>
> Should this condition also require cb->key_phase =3D=3D crypto->key_phase=
?
>
> > +     return 0;
> > +}
>
> [ ... ]
>
> > +int quic_crypto_decrypt(struct quic_crypto *crypto, struct sk_buff *sk=
b,
> > +                     gfp_t gfp)
> > +{
>
> [ ... ]
>
> > +     err =3D quic_crypto_payload_protect(crypto, skb, false, gfp);
> > +     if (err) {
> > +             if (err =3D=3D -EINPROGRESS)
> > +                     return err;
>
> [ ... ]
>
> > +             goto err;
> > +     }
>
> [ ... ]
>
> > +     return 0;
> > +err:
> > +     if (++crypto->rx_fails >=3D crypto->cipher->rxlimit)
> > +             err =3D -EKEYEXPIRED;
>
> [Severity: Low]
>
> Should rx_fails only count authentication failures here?
>
> Every error that reaches the err label is counted. That includes -ENOMEM
> from quic_crypto_aead_mem_alloc() and negative returns from skb_to_sgvec(=
)
> in quic_crypto_payload_protect(). It also includes any non-authentication
> error a driver reports through cb->crypto_err on the resume path.
>
> RFC 9001 Section 6.6 defines the integrity limit in terms of packets that
> fail authentication. For AES-CCM the rxlimit is about 2^21.5. On a
> long-lived connection, repeated local allocation failures under memory
> pressure could eventually push it to -EKEYEXPIRED.
>
> Would it be more accurate to increment rx_fails only when
> err =3D=3D -EBADMSG?
>
> > +     return err;
> > +}
>
> [ ... ]
>
> > @@ -565,6 +1044,241 @@ int quic_crypto_initial_keys_install(struct quic=
_crypto *crypto,
>
> [ ... ]
>
> > +int quic_crypto_generate_token(struct quic_crypto *crypto, void *addr,
> > +                            u32 addrlen, struct quic_conn_id *conn_id,
> > +                            u8 *token, u32 *tlen)
> > +{
> > +     u64 ts =3D quic_ktime_get_us() - crypto->ts_off;
>
> [Severity: Medium]
>
> Does this offset hide the server uptime?
>
> quic_ktime_get_us() is the monotonic clock in microseconds, but ts_off is
> only 32 bits wide:
>
> net/quic/crypto.h:
>         u32 ts_off;      /* Random offset for token timestamps */
>
> net/quic/crypto.c:quic_crypto_set_token_secret() {
>     ...
>         if (!crypto->ts_off)
>                 get_random_bytes(&crypto->ts_off, sizeof(crypto->ts_off))=
;
>     ...
> }
>
> That caps the offset at 2^32 us, or about 71.6 minutes.
>
> The timestamp is also part of adlen in the quic_crypto_token_protect()
> call below. Bytes 1..8 of the token are therefore authenticated but not
> encrypted, and they go out in cleartext.
>
> Any client that receives a Retry or NEW_TOKEN token can read the server's
> monotonic uptime to within about 72 minutes. The v17 changelog says ts_of=
f
> is used "to prevent timestamps from directly revealing system uptime". Is
> that achieved with a 32-bit offset?
>
> quic_crypto_verify_token() already uses the wrap-safe age =3D (s64)(ts - =
t).
> Would a 64-bit random offset work here with no other changes?
>
True.

will move ts from AAD to the encrypted part of the token.

> > +     u8 *token_buf, *p, flag =3D *token;
> > +     u32 len, tslen =3D sizeof(ts);
> > +     int err;
> > +
> > +     len =3D sizeof(flag) + tslen + addrlen + conn_id->len + QUIC_TAG_=
LEN;
> > +     token_buf =3D kmalloc(len, GFP_KERNEL);
> > +     if (!token_buf)
> > +             return -ENOMEM;
> > +
> > +     p =3D token_buf;
> > +     p =3D quic_put_int(p, flag, sizeof(flag));
> > +     p =3D quic_put_int(p, ts, tslen);
> > +     p =3D quic_put_data(p, addr, addrlen);
> > +     quic_put_data(p, conn_id->data, conn_id->len);
> > +
> > +     err =3D quic_crypto_token_protect(crypto, token_buf, len,
> > +                                     sizeof(flag) + tslen, true);
>
> [Severity: Medium]
>
> Can an observer link a NEW_TOKEN token to the connection that issued it?
>
> With adlen =3D sizeof(flag) + tslen, the microsecond timestamp is associa=
ted
> data. The client later presents the token in the Token field of an Initia=
l
> packet, and the timestamp is readable there in cleartext.
>
> ts_off is set only once per crypto context. Tokens are generated and
> verified with the listener's initial crypto, so every token from a
> listener uses the same offset.
>
> An on-path observer could find that offset by requesting its own Retry
> token. It could then map the ts in any presented token to the microsecond
> it was issued and match that against the packet timing of the earlier
> connection, even across address changes.
>
> RFC 9000 Section 8.1.3 requires that a token issued with NEW_TOKEN must
> not include information that would allow an observer to link it to the
> connection on which it was issued.
>
> This appears to come from the v14 change that moved the timestamp from th=
e
> encrypted part into the AAD so it could be used to derive the nonce. Coul=
d
> the timestamp stay in the encrypted part, with the nonce built from
> something that does not reveal the issue time?
>
True.

will add a field (u64 random) in the AAD part in the token, and use
iv xor  random to generate the nonce for token encryption.

Thanks.
> > +     if (err)
> > +             goto out;
> > +
> > +     memcpy(token, token_buf, len);
> > +     *tlen =3D len;
> > +out:
> > +     kfree_sensitive(token_buf);
> > +     return err;
> > +}
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1792164438.git.lucien.xin%40gmail.com

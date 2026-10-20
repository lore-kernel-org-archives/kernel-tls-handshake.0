Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792503641;
	b=LRpkNg0L1x+m5/laSyf2QDXuz/ONmeHVgGncfPtbex7xo1EP99I/0bFjisjPSUDvEavi
	 BAiG2wf+k6FChOhwySsS+/cgDTrNKw46ZqLAoXvqY4c0NO+Cw7FPyPAz9V3k5jvNwPKc8
	 JSeN4Vi3RbRLO7dl7Gwof82RAU7Qr504eIcRhugmkoLnZkcFwpn9qfDQZy0K/LXNNw6yR
	 W9j7dp68vmrE/XfVtFnwoP7kmeZgpnoK8H9K5K/10Kko50i8dzl2WbbqzH3BJ2VjJR4hx
	 H+ZCLBWsyWy/1AmRFnKRf2HWJ69z72YkF6lvNElpSZ5pkh4gQSJcWESBAO0r3Q83hjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=voUF/+9lehUDPe5WaqksWKVtr/FASBVPuuXFqS0EBWw=;
	b=vi6bp28OQoWkKVcBU3RN5FX2wOWe657JlMgHeokc1WRbJwIRfILT3w3T1JzEFyL4sHLH
	 wn4cICfEUzooKG7J02sMj+lraabVCqlaAvsbLly1/GJku1pWIVWJV/rPKtcvNt5LM2nAc
	 AL+c2hG8csW8Fsa9Xk5K4i+yxIhImZK3dcxTZ0wJ1MKwVueF/2YlNsb/Q01RoV/6ut/BY
	 xQ06TYiR+XgRGSWjRKQXfzK7v2OcuibxBGr0RFeEUbMCBd8a4a8loU27Hwmra9SqsJu43
	 RmVtb0TRXWHM2BVD9bhcZ07DGMVo5SjkHs3iUdh45JVfFaD3xqRELsnELMaSkw4SRXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=sieberarens.com;
	spf=pass smtp.mailfrom=meyerpflug.com.br;
	dkim=pass header.d=sieberarens.com header.i=@sieberarens.com header.a=rsa-sha256 header.s=google header.b=TWYTPgCR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE4D606A31E
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Oct 2026 13:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCE4D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sieberarens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meyerpflug.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sieberarens.com header.i=@sieberarens.com header.a=rsa-sha256 header.s=google header.b=TWYTPgCR
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-676858d42f8so2662161d50.2
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Oct 2026 06:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792503638; cv=none;
        d=google.com; s=arc-20260327;
        b=Fld5aW7zfyDwf1+TjnfCQbhKyfpYgjwId/oui+7XikSp/IodUUty5cTs2i1D6DTfPL
         mfsSdPgAp+HtiZ5ry5NgWTbgQUzkeQgGKh5sLNk+RMHzp21FHpD56lgSkAzwnKz/0rEK
         QRrEGWtuz4OIXL/aRKobAcqpr10hAi/nBk0PXYZU0fLy/axQYXqIgj3tLINJxTogTHL3
         OOSUjkOczN/XG8IzLy+D0suZHGngP1RuqSlcdTe1nN+Vp1HcARfVZETgXiDzPsTIIGux
         VdrDQ6xz6xZa4U4gW3UQD/SlQapUliahdpiACBveZgzfzVB0le/9MSWJvHZDcAep2qAJ
         I1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=voUF/+9lehUDPe5WaqksWKVtr/FASBVPuuXFqS0EBWw=;
        fh=gNRAYY2GxYsTI38aBDHbv5/wJFoILZIyx/OqzJVqJqA=;
        b=DFjPWWiViklm2b1X0U6/+P2uL6ea1ETYychqtV64dDfZF4pce8USdhmH6UUv1Sieyp
         wJVp87o4IR8cbexW0tpgWzgBSYwjmr9Ia+5i8qw4mbWzjtDK/YWtlTc64B/Vw1Dh9qSE
         uc/MeooAa/UUTp+pSlcmht3eVNZgsoTlkOxhlXV40BI+q0VpfkacJkDnbM4fz2ZtmRjs
         Y/36SFxKpOu+Moqv9TBdD7neJoWVH1ZvHeX2AS5VFDGdomLzx3+/C7O2NcU8hKsgRAlh
         A9h/UNUBdiddhL8xyxO/UUm5e9ycjTOEgAD4ZUig8kdRf0Mx4ASNpAbBk797/ORVP04Y
         9kWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sieberarens.com; s=google; t=1792503638; x=1793108438; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voUF/+9lehUDPe5WaqksWKVtr/FASBVPuuXFqS0EBWw=;
        b=TWYTPgCRG8lTJQt+KxLpt6vvOF6mCcxmlTvMy6guLNH+Q1sKO3Inj70yU7AEUthrDd
         bsKOFiZVNRhZjzxNr5suv15i+sAny1GuQlu3F+/7CJrC+SOiKq7qHvApXXHB7qko9r9p
         6nDNCY7kP1+TPIv0JEoaCbgDw4aIFyd2cS+EEMcMFzTBGtqr6K7xdrjOrxcVMnk4Tfw0
         0ltuWGL59AHUOUeOremdcoOVns4+YpJTk6+BLOEAC6lmjZy187HC4nDIphI5c0XYd2kp
         3Vr93eU8MAs3lyR12Y9T2xyj75Y98V5ykDfGHPcec5hpMbnE82ZiZCYPBIUw4HljiguA
         1Hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503638; x=1793108438;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=voUF/+9lehUDPe5WaqksWKVtr/FASBVPuuXFqS0EBWw=;
        b=jfzImJR3vhRL3+QUL5vOmGAEPLp/N49rTm/oNPhb++2oZA4FDc/eUcOYPD6XDtXLBp
         t8ghQUWCkFW1LiPzkLOn4vGA6hZ3sRUHNTfBXvcEPetU8ATD4QYl4vs7Ax5CUSFQt9P+
         AM8nDytORSpLAsaiH8p56+Ox0LwKTom57lt231IllYy9Wcf7xeqPXlohUyXtxgBTLh0s
         QiT0yboDtfXHUlyAuWiAAOefzJOxPe1RsbfQ4Qx9lYdUuyPMzJEs1JtPp4bBjptfWP1y
         RvM6ytaghFMGCiEzEW5DZOg0daLhV+JBoKzvSXGAmnUzPRAlqHFliBS9TzrzCtJATaIq
         DbYQ==
X-Gm-Message-State: AFq9FYLhkpCKdXreLZnT3IsTCyee+0W3ZhHLEg9G10SC/mAPF/KFIZPJ
	hPaAkQedDycQXoa7ezUfERX9JXFquAoCYeVOjW8p3lOShO7FimacsX6z4SkVoGlPybIHuzgcERu
	cfDNqrxvzj7Hn/S9kf3qzlohcdct1P59VN0/Zw5RL
X-Gm-Gg: AYBFou3xnWDzm9NLFYJ9Wwvir0N8EHrfDgZAf0nW+enlRBbmw2fJHstxCUZ7+4w8iB5
	WJ5W/KykylPuQLIlXGIxhyhjn1JHEVaNXrLdPvhNVect/FvPA3uIZdXukOv0vHcxBTJQvVbASLn
	YnsFP6HrIMsANde3qNzZPmbz9japPRFUgV6BsaFH/Oq00eH2U5QOgf5+aK4ptwhSk5Xhn3aRDnU
	n7bj1YRvqD8/KD5znO3VNfP8AlLf2VsYB/nBkLsvCUXCBsNSfEPIzIAgCAOqh+V7IZha4otozz/
	cGPvQGgipp8pdfWdhdW2eCZqzVyUXRzJ7z5zxgvMCV5BRuRwcIVQ2LlV7cQblzwLYPeeqPGt7tb
	ny11kHbhFJFCC9j+kcTu134OVtzJ8b+YgxdeCeOSiecna/w==
X-Received: by 2002:a53:dc83:0:b0:675:34b8:78a2 with SMTP id
 956f58d0204a3-679ca8da995mr1599010d50.92.1792503638436; Tue, 20 Oct 2026
 06:40:38 -0700 (PDT)
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAKgHdsU+ksJNObVkhx_vzUFXDtHJWBiiXscBAckV_v-yvHO=5A@mail.gmail.com>
 <CADvbK_dbQ1ogx73TFhKNtHb-0TRBn3rfQ+C8C_TZ6sgf91zqTg@mail.gmail.com> <b2a3cec9-b0e3-41e0-9f44-908ebb1953b1@app.fastmail.com>
In-Reply-To: <b2a3cec9-b0e3-41e0-9f44-908ebb1953b1@app.fastmail.com>
From: Andre Sieber Arens <andre@sieberarens.com>
Date: Tue, 20 Oct 2026 10:40:27 -0300
X-Gm-Features: AclHuK_tRvGB8-DAuIBN1cieCeKiziYBA_UUaR2yhAAKWkGKhQBbsMVwkoBcVOo
Message-ID: <CAKgHdsUSHWHiQK64adk35Q9M=a_ERiVf-Bypw8yE99c-nEw_zg@mail.gmail.com>
Subject: Re: [PATCH] tlshd: Verify the server certificate on the anonymous
 QUIC client path
To: Chuck Lever <cel@kernel.org>
Cc: kernel-tls-handshake@lists.linux.dev, Xin Long <lucien.xin@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000a0f891065e45c6df"

--000000000000a0f891065e45c6df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chuck, hi Xin,

Thank you both for looking at this. This is my first contribution to
ktls-utils, and my first patch sent to a mailing list, so please bear
with me while I learn the process.

On Xin's first point, keeping the GNUTLS_VERIFY_ALLOW_SIGN_RSA_MD2/MD5
flags: agreed. v2 keeps that line, so the QUIC anonymous path sets the
same verify flags as tlshd_tls13_client_anon_handshake(). If you would
like those flags dropped from both anonymous paths, I can send that as
a separate follow-up patch.

On the second point, the patch not applying: sorry about that. My mail
client turned the tabs into spaces. The patch itself applies cleanly to
current main (e486e5fc4ba8) with git am. I will send v2 in reply to
this thread with git send-email, which should avoid the problem.

v2 builds with -Wall -Wextra -Werror on Fedora 45 (GnuTLS 3.8.13,
GCC 16.2.1) with HAVE_GNUTLS_QUIC and HAVE_DANE defined. The same check,
on a 1.4.0 base, has been running in our builds: the handshake is
refused when the server certificate comes from another CA or is issued
for another name, and a valid certificate still works.

Thanks again,
Andre

Em seg., 19 de out. de 2026 =C3=A0s 11:34, Chuck Lever <cel@kernel.org> esc=
reveu:
>
>
>
> On Mon, Oct 12, 2026, at 12:40 PM, Xin Long wrote:
> > On Sat, Oct 10, 2026 at 4:05=E2=80=AFPM Andre Sieber Arens
>
> >> @@ -760,14 +774,14 @@ static void tlshd_quic_client_set_x509_session(s=
truct tlshd_quic_conn *conn)
> >>
> >>   if (conn->cert_req =3D=3D TLSHD_QUIC_NO_CERT_AUTH) {
> >>   /*
> >> - * No verify callback runs on this path. Without this mark,
> >> - * the audit reports an authentication failure.
> >> + * The client presents no certificate, but the server is
> >> + * still authenticated, as on the TCP path: its chain must
> >> + * verify against the trust store and match the peer name.
> >>   */
> >> - tlshd_dane_record_unauth(parms);
> >> - gnutls_certificate_set_verify_flags(cred, GNUTLS_VERIFY_ALLOW_SIGN_R=
SA_MD2 |
> >> -  GNUTLS_VERIFY_ALLOW_SIGN_RSA_MD5);
> > Should we keep this line to align with tlshd_tls13_client_anon_handshak=
e()?
> >
> >>   gnutls_certificate_set_flags(cred, GNUTLS_CERTIFICATE_SKIP_KEY_CERT_=
MATCH |
> >>     GNUTLS_CERTIFICATE_SKIP_OCSP_RESPONSE_CHECK);
> >> + gnutls_certificate_set_verify_function(cred,
> >> +       tlshd_quic_client_anon_verify_function);
> >>   } else {
> >>   gnutls_certificate_set_verify_function(cred,
> >>         tlshd_quic_client_x509_verify_function);
> >>
> > The patch appears to fail to apply. Could you please double-check its f=
ormat?
>
> Sorry for the delay, Xin's email got swept into my Trash folder
> accidentally.
>
> Andre, can you respond to Xin's review comments?
>
>
> --
> Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)

--000000000000a0f891065e45c6df
Content-Type: application/octet-stream; name="v2.patch"
Content-Disposition: attachment; filename="v2.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mvgqdfg90>
X-Attachment-Id: f_mvgqdfg90

RnJvbSBmYzQwNzRlNjlhYWNhNGQzYjBkNTljNzMwYjhmNTEzYzhmYTQ0OGY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZSBTaWViZXIgQXJlbnMgPGFuZHJlQHNpZWJlcmFyZW5z
LmNvbT4KRGF0ZTogTW9uLCAxOSBPY3QgMjAyNiAxMjo1NDozNSAtMDMwMApTdWJqZWN0OiBbUEFU
Q0ggdjJdIHRsc2hkOiBWZXJpZnkgdGhlIHNlcnZlciBjZXJ0aWZpY2F0ZSBvbiB0aGUgYW5vbnlt
b3VzIFFVSUMKIGNsaWVudCBwYXRoClRvOiBrZXJuZWwtdGxzLWhhbmRzaGFrZUBsaXN0cy5saW51
eC5kZXYKQ2M6IFhpbiBMb25nIDxsdWNpZW4ueGluQGdtYWlsLmNvbT4sCiAgICBDaHVjayBMZXZl
ciA8Y2VsQGtlcm5lbC5vcmc+CgpXaGVuIHRoZSBrZXJuZWwgcmVxdWVzdHMgYW4gYW5vbnltb3Vz
IGNsaWVudCBoYW5kc2hha2UKKEhBTkRTSEFLRV9BVVRIX1VOQVVUSCkgb24gYSBRVUlDIHNvY2tl
dCwKdGxzaGRfcXVpY19jbGllbnRfc2V0X3g1MDlfc2Vzc2lvbigpIGxvYWRzIHRoZSBjbGllbnQg
dHJ1c3Qgc3RvcmUKYnV0IGluc3RhbGxzIG5vIHZlcmlmeSBjYWxsYmFjay4gR251VExTIGRvZXMg
bm90IHZlcmlmeSBhIHBlZXIKY2VydGlmaWNhdGUgb24gaXRzIG93biwgc28gdGhlIGhhbmRzaGFr
ZSBjb21wbGV0ZXMgd2l0aCBhbnkgc2VydmVyCmNlcnRpZmljYXRlOiBvbmUgZnJvbSBhbiB1bmtu
b3duIENBLCBhIHNlbGYtc2lnbmVkIG9uZSwgb3Igb25lCmlzc3VlZCBmb3IgYW5vdGhlciBuYW1l
LiBUaGUgcGVlciBuYW1lIGlzIHVzZWQgb25seSBmb3IgU05JLCBhbmQgdGhlCmtlcm5lbCBjb25z
dW1lciBpcyB0b2xkIHRoZSBoYW5kc2hha2Ugc3VjY2VlZGVkLgoKVGhlIFRDUCBhbm9ueW1vdXMg
cGF0aCBhdXRoZW50aWNhdGVzIHRoZSBzZXJ2ZXIgd2l0aAp0bHNoZF9jbGllbnRfdmVyaWZ5X3Bl
ZXIoKSwgYW5kIERvY3VtZW50YXRpb24vbmV0d29ya2luZy8KdGxzLWhhbmRzaGFrZS5yc3Qgc3Rh
dGVzIHRoYXQgYW4gYW5vbnltb3VzIGNsaWVudCBoYW5kc2hha2Ugc3RpbGwKcGVyZm9ybXMgc2Vy
dmVyIGF1dGhlbnRpY2F0aW9uLiBJbnN0YWxsIHRoZSBzYW1lIGNoZWNrIG9uIHRoZSBRVUlDCnBh
dGguCgpXaXRoIHZlcmlmaWNhdGlvbiBpbiBwbGFjZSwgc3RvcCBtYXJraW5nIHRoZSBoYW5kc2hh
a2UgYXMKdW5hdXRoZW50aWNhdGVkIGZvciB0aGUgREFORSBhdWRpdDogdGhlIHZlcmlmeSBjYWxs
YmFjayBub3cgcmVjb3Jkcwp0aGUgUEtJWCBvciBEQU5FIHJlc3VsdC4KCkZpeGVzOiA0M2ExNWZl
ZDJmMzMgKCJ0bHNoZDogYWRkIHN1cHBvcnQgZm9yIHF1aWMgaGFuZHNoYWtlIikKU2lnbmVkLW9m
Zi1ieTogQW5kcmUgU2llYmVyIEFyZW5zIDxhbmRyZUBzaWViZXJhcmVucy5jb20+Ci0tLQpDaGFu
Z2VzIHNpbmNlIHYxOgotIEtlZXAgdGhlIE1EMi9NRDUgdmVyaWZ5IGZsYWdzIG9uIHRoaXMgcGF0
aCwgYXMgdGhlIFRDUCBhbm9ueW1vdXMKICBoYW5kc2hha2UgZG9lcyAoWGluIExvbmcpLgotIFJl
YmFzZWQgb24gbWFpbiAoZTQ4NmU1ZmM0YmE4KS4KLSB2MSB3YXMgd2hpdGVzcGFjZS1kYW1hZ2Vk
IGJ5IG15IG1haWwgY2xpZW50OyB2MiBpcyBzZW50IHdpdGgKICBnaXQgc2VuZC1lbWFpbC4KCiBz
cmMvdGxzaGQvY2xpZW50LmMgfCAyMiArKysrKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zcmMv
dGxzaGQvY2xpZW50LmMgYi9zcmMvdGxzaGQvY2xpZW50LmMKaW5kZXggNmFlYmZjMy4uNjlhNzQ3
NiAxMDA2NDQKLS0tIGEvc3JjL3Rsc2hkL2NsaWVudC5jCisrKyBiL3NyYy90bHNoZC9jbGllbnQu
YwpAQCAtNzE5LDYgKzcxOSwyMCBAQCBzdGF0aWMgaW50IHRsc2hkX3F1aWNfY2xpZW50X3g1MDlf
dmVyaWZ5X2Z1bmN0aW9uKGdudXRsc19zZXNzaW9uX3Qgc2Vzc2lvbikKIAlyZXR1cm4gdGxzaGRf
Y2xpZW50X3g1MDlfdmVyaWZ5X2Z1bmN0aW9uKHNlc3Npb24sIGNvbm4tPnBhcm1zKTsKIH0KIAor
LyoqCisgKiBAYnJpZWYgVmVyaWZ5IHRoZSBzZXJ2ZXIncyB4LjUwOSBjZXJ0aWZpY2F0ZSAoUVVJ
QywgYW5vbnltb3VzIGNsaWVudCkKKyAqIEBwYXJhbVtpbl0gICAgIHNlc3Npb24gIHNlc3Npb24g
aW4gdGhlIG1pZHN0IG9mIGEgaGFuZHNoYWtlCisgKgorICogQHJldHZhbCBHTlVUTFNfRV9TVUND
RVNTICAgICAgICAgICAgQ2VydGlmaWNhdGUgaGFzIGJlZW4gc3VjY2Vzc2Z1bGx5IHZlcmlmaWVk
CisgKiBAcmV0dmFsIEdOVVRMU19FX0NFUlRJRklDQVRFX0VSUk9SICBDZXJ0aWZpY2F0ZSB2ZXJp
ZmljYXRpb24gZmFpbGVkCisgKi8KK3N0YXRpYyBpbnQgdGxzaGRfcXVpY19jbGllbnRfYW5vbl92
ZXJpZnlfZnVuY3Rpb24oZ251dGxzX3Nlc3Npb25fdCBzZXNzaW9uKQoreworCXN0cnVjdCB0bHNo
ZF9xdWljX2Nvbm4gKmNvbm4gPSBnbnV0bHNfc2Vzc2lvbl9nZXRfcHRyKHNlc3Npb24pOworCisJ
cmV0dXJuIHRsc2hkX2NsaWVudF92ZXJpZnlfcGVlcihzZXNzaW9uLCBjb25uLT5wYXJtcyk7Cit9
CisKICNkZWZpbmUgVExTSERfUVVJQ19OT19DRVJUX0FVVEgJMwogCiAvKioKQEAgLTc2MCwxNCAr
Nzc0LDE2IEBAIHN0YXRpYyB2b2lkIHRsc2hkX3F1aWNfY2xpZW50X3NldF94NTA5X3Nlc3Npb24o
c3RydWN0IHRsc2hkX3F1aWNfY29ubiAqY29ubikKIAogCWlmIChjb25uLT5jZXJ0X3JlcSA9PSBU
TFNIRF9RVUlDX05PX0NFUlRfQVVUSCkgewogCQkvKgotCQkgKiBObyB2ZXJpZnkgY2FsbGJhY2sg
cnVucyBvbiB0aGlzIHBhdGguIFdpdGhvdXQgdGhpcyBtYXJrLAotCQkgKiB0aGUgYXVkaXQgcmVw
b3J0cyBhbiBhdXRoZW50aWNhdGlvbiBmYWlsdXJlLgorCQkgKiBUaGUgY2xpZW50IHByZXNlbnRz
IG5vIGNlcnRpZmljYXRlLCBidXQgdGhlIHNlcnZlciBpcworCQkgKiBzdGlsbCBhdXRoZW50aWNh
dGVkLCBhcyBvbiB0aGUgVENQIHBhdGg6IGl0cyBjaGFpbiBtdXN0CisJCSAqIHZlcmlmeSBhZ2Fp
bnN0IHRoZSB0cnVzdCBzdG9yZSBhbmQgbWF0Y2ggdGhlIHBlZXIgbmFtZS4KIAkJICovCi0JCXRs
c2hkX2RhbmVfcmVjb3JkX3VuYXV0aChwYXJtcyk7CiAJCWdudXRsc19jZXJ0aWZpY2F0ZV9zZXRf
dmVyaWZ5X2ZsYWdzKGNyZWQsIEdOVVRMU19WRVJJRllfQUxMT1dfU0lHTl9SU0FfTUQyIHwKIAkJ
CQkJCQkgIEdOVVRMU19WRVJJRllfQUxMT1dfU0lHTl9SU0FfTUQ1KTsKIAkJZ251dGxzX2NlcnRp
ZmljYXRlX3NldF9mbGFncyhjcmVkLCBHTlVUTFNfQ0VSVElGSUNBVEVfU0tJUF9LRVlfQ0VSVF9N
QVRDSCB8CiAJCQkJCQkgICBHTlVUTFNfQ0VSVElGSUNBVEVfU0tJUF9PQ1NQX1JFU1BPTlNFX0NI
RUNLKTsKKwkJZ251dGxzX2NlcnRpZmljYXRlX3NldF92ZXJpZnlfZnVuY3Rpb24oY3JlZCwKKwkJ
CQkJCSAgICAgICB0bHNoZF9xdWljX2NsaWVudF9hbm9uX3ZlcmlmeV9mdW5jdGlvbik7CiAJfSBl
bHNlIHsKIAkJZ251dGxzX2NlcnRpZmljYXRlX3NldF92ZXJpZnlfZnVuY3Rpb24oY3JlZCwKIAkJ
CQkJCSAgICAgICB0bHNoZF9xdWljX2NsaWVudF94NTA5X3ZlcmlmeV9mdW5jdGlvbik7Ci0tIAoy
LjU2LjAud2luZG93cy4xCgo=
--000000000000a0f891065e45c6df--

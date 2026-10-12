Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7D54AB3C1
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 12 Oct 2026 16:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823223; cv=pass; b=IxYKVrBos06yl2sGtpk6+YSxP16+cOu6C5rg8dmqzwHOR/LSUzVVAiMs4XTGtVFBfZ9CnvFXG6zJOORJZ46z8rcMkys/NyTyf0DEQXMRGv1rrh7iCWEdZRhMmApoh+PH3S0BRw9Xyql26mmybhTvMuWKvWGtlgV4qGz1Ownw5P0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823223; c=relaxed/simple;
	bh=S4J21d8Ku8EMLFs2XXqxVHm69v7w7iDrpQ8p0zj7Jug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6P2cjjQgkJoFsjTn6pDm3W1/r3H5rHjgQ1bTdJN0icoP0XnxeJKeyLemgITfdCbmSdwU+f42QZhtsSphe2T5hpyFhmN5/6rLsURFSZ6QwUUzf+Kb0MsrXMyW7S2DBF4lBY6z3tAD33qH7t9BWcOmi3dPSAvDLfm+3/x5ypSbzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cz7/MkMA; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cz7/MkMA"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so1199755241.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 12 Oct 2026 09:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791823221; cv=none;
        d=google.com; s=arc-20260327;
        b=cMyIeVFPnrRGnIB0x61YsD5jkAN5zZIENVhI3L8kMlC7OBEQdmIfDnS59NoDBISkj8
         CwId8xN2XdcITUEMk+kD/YuueOHj82CEnsV1B0DkmVYURlIDWg6egcGf7SuRrTuXUTdf
         Qe8GxfPpyQLabO8YPW9BQbA4OwTl3OCA4DdiHhcDIcbz3/2DN74PwJcRTLJrrDjeRGUR
         fI1Ghe5tLL+M0D7NXsOBZdZzcFTT2KzlvtxdHTsguBY283XLodi02SdL8jHkFvCUpmoT
         fw5Hpq54Ma9NvjD2yNUPy0WPJWxEAdvrYZoagBD2p4JTKb8C3PSEou30gPMcEMBj+Zwf
         8pjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xNO+uLX8Unmf7uKN+ppAza67z6R5C6N11zYqGqWIex4=;
        fh=UW37wBBBJT3CAufJT9U2i62osCc4uYKuy22jmA6P2kM=;
        b=PBIGuvfQ/4U0xbi4KbseM+bxJNPfCIKw/vQAc84901YhR6LM7APyKoxuaPiALLQzSo
         5FeGZxEudgPW8ygCHIdkFY4d5SBc4dmzPpAQmnkKkhvJpbzWuBzLi+3IiPEquPReuwBv
         /9CBAPFP07bVLvcmu2Kj9SIwRI6rwA+o6g31gl6UQi9gj08b6pzC1vZl+WS2B7ygZyr7
         8z3owUm4r2b4G2oIz4GqY6bZ02GUnA9H/kbCJYNZotI/GEUDt1hQPcoAIDvssbhRGu26
         LZ0DUmGsrn3XOo1Q429h5QpC8YIXahGLkGfTpyqCGcbYL7JDR1cPSPKI+9zjkXAxbNpo
         9KEw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791823221; x=1792428021; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xNO+uLX8Unmf7uKN+ppAza67z6R5C6N11zYqGqWIex4=;
        b=cz7/MkMAblIs/bmqnaeJgUI7br+8D8PG5RIe+CEk2B4J3KZKTZfXntS9D0TLUklQ/n
         cf3r2OC53ZadAXmAbLPxzts+eLY5zFAf2SpZV5CIZfwHa2U2ztbtEDKJ04fRexcSDicI
         L0JkIvtBvqbpZaJEisBXDY/JDFG8A5PlFEGYhb4WTqd1/xI7AyBUGRyMQlnZAJCvc1xB
         mSvx6xyyUNn6XK4IiqSPgMwU3HjoYnzlZv8DjL4P1FOLa9mbfVqVSfPAG7VG5R23eRaa
         RwJq27cerCUzKshEfesheomZQaiYVlAS6Eqg1oB1ggJiGkQ59JBUuDVHN6MSG22pdC1g
         auRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823221; x=1792428021;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xNO+uLX8Unmf7uKN+ppAza67z6R5C6N11zYqGqWIex4=;
        b=fjSqqpjzY9cnLUQRaxv2yA5nWs+DRiQPBw0BAbJiJc3/x7ox6Q2XIX66WXwWx7tFcz
         /X+1CXc6pPVoydq/Csqxf3fIYZu1ct1ipwpdxs+tgU3XfJMT1qemTseQci/MAc3nXUjD
         IAFT4mUPlO3Ij/AXAa9iR+Uiy5ymkPaP7vR1HjvVlWhdHfBl7gN8Ynk7gL9f3SemI38m
         1tYr0YsclgUPQgU3acLYMIylqfI4jiRIzzNuu9P0nJLSOvVPgqku8ZfsAM+W2Dw+qjGU
         GeiM1DcrX/3yYNCYqyY25MC4QARNQv0efmkC0LicOscF3ToQiuwwAAKJKVG0loktKjqe
         1vEA==
X-Gm-Message-State: AFq9FYIytreQWBsaLxl2AOS3ol6ICY15u99cFG72IGATXma1UX0bnYlf
	FwDJoa+IUM04zpGRi5fCL6pBsurKFWHdsRCmleiyIZU9LNR/U9yTx6rlO8FklErwLzZfxc/lN8K
	XbJfGhSAkjMuIkLO7uP9MW5uf3O1hFHgdcRVl
X-Gm-Gg: AYBFou2UGP8U0V2ONEBbgyKol4U1/XYlR8rfog9JS7LgjbeWdZHWUWrjh7sObzvcqYD
	HYnxqUw83hW8DLxQRLOj/GDQXQWAlonryyOlybSKjy54Pgbb1WGxVVGPkdU6nKMft0wZpCW6KAy
	bNFrxVppgzLD6blLGAcP0QRTEBmPfPXRHWEMbs0ntaN4CaZ2hAVYGqc5KhHBSCX1EMSRhB8j9TA
	uIG5up4sMPaUTHrABarVQDLRs8qgdnrPl0nfIStOq2KrGFWH/BmaKLMXG8fhWR4SjD9f3s1udwy
	RdCsldIVl9tYXxXAuAqZHKKuwsTgcN+/Llt6Mib0wFdLgEAQQjQ8H6V97zP3H98zS7N2I3Z2yvj
	YGW7Pzw/Wlk837I6wKXHGa8OLVZtDDS584vWt3JLvNsTwo7pb3n31pyTn
X-Received: by 2002:a05:6102:6a83:b0:7c3:9982:67d7 with SMTP id
 ada2fe7eead31-7cb3729b303mr2958090137.16.1791823221205; Mon, 12 Oct 2026
 09:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKgHdsU+ksJNObVkhx_vzUFXDtHJWBiiXscBAckV_v-yvHO=5A@mail.gmail.com>
In-Reply-To: <CAKgHdsU+ksJNObVkhx_vzUFXDtHJWBiiXscBAckV_v-yvHO=5A@mail.gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Mon, 12 Oct 2026 12:40:07 -0400
X-Gm-Features: AclHuK_WilM1DXMmTiY59-yxOP8qngaAtsz7IWM9kPfpRASaGx6R4DAh2CUaZBY
Message-ID: <CADvbK_dbQ1ogx73TFhKNtHb-0TRBn3rfQ+C8C_TZ6sgf91zqTg@mail.gmail.com>
Subject: Re: [PATCH] tlshd: Verify the server certificate on the anonymous
 QUIC client path
To: andre@sieberarens.com
Cc: kernel-tls-handshake@lists.linux.dev, cel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 4:05=E2=80=AFPM Andre Sieber Arens
<andre@sieberarens.com> wrote:
>
> When the kernel requests an anonymous client handshake
> (HANDSHAKE_AUTH_UNAUTH) on a QUIC socket,
> tlshd_quic_client_set_x509_session() loads the client trust store
> but installs no verify callback. GnuTLS does not verify a peer
> certificate on its own, so the handshake completes with any server
> certificate: one from an unknown CA, a self-signed one, or one
> issued for another name. The peer name is used only for SNI, and the
> kernel consumer is told the handshake succeeded.
>
> The TCP anonymous path authenticates the server with
> tlshd_client_verify_peer(), and Documentation/networking/
> tls-handshake.rst states that an anonymous client handshake still
> performs server authentication. Install the same check on the QUIC
> path.
>
> With verification in place, also drop the MD2/MD5 signature
> allowance on this path, and stop marking the handshake as
> unauthenticated for the DANE audit: the verify callback now records
> the PKIX or DANE result.
>
> Fixes: 43a15fed2f33 ("tlshd: add support for quic handshake")
> Signed-off-by: Andre Sieber Arens <andre@sieberarens.com>
> ---
>  src/tlshd/client.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/src/tlshd/client.c b/src/tlshd/client.c
> index 6aebfc3..2f4b190 100644
> --- a/src/tlshd/client.c
> +++ b/src/tlshd/client.c
> @@ -719,6 +719,20 @@ static int tlshd_quic_client_x509_verify_function(gn=
utls_session_t session)
>   return tlshd_client_x509_verify_function(session, conn->parms);
>  }
>
> +/**
> + * @brief Verify the server's x.509 certificate (QUIC, anonymous client)
> + * @param[in]     session  session in the midst of a handshake
> + *
> + * @retval GNUTLS_E_SUCCESS            Certificate has been successfully=
 verified
> + * @retval GNUTLS_E_CERTIFICATE_ERROR  Certificate verification failed
> + */
> +static int tlshd_quic_client_anon_verify_function(gnutls_session_t sessi=
on)
> +{
> + struct tlshd_quic_conn *conn =3D gnutls_session_get_ptr(session);
> +
> + return tlshd_client_verify_peer(session, conn->parms);
> +}
> +
>  #define TLSHD_QUIC_NO_CERT_AUTH 3
>
>  /**
> @@ -760,14 +774,14 @@ static void tlshd_quic_client_set_x509_session(stru=
ct tlshd_quic_conn *conn)
>
>   if (conn->cert_req =3D=3D TLSHD_QUIC_NO_CERT_AUTH) {
>   /*
> - * No verify callback runs on this path. Without this mark,
> - * the audit reports an authentication failure.
> + * The client presents no certificate, but the server is
> + * still authenticated, as on the TCP path: its chain must
> + * verify against the trust store and match the peer name.
>   */
> - tlshd_dane_record_unauth(parms);
> - gnutls_certificate_set_verify_flags(cred, GNUTLS_VERIFY_ALLOW_SIGN_RSA_=
MD2 |
> -  GNUTLS_VERIFY_ALLOW_SIGN_RSA_MD5);
Should we keep this line to align with tlshd_tls13_client_anon_handshake()?

>   gnutls_certificate_set_flags(cred, GNUTLS_CERTIFICATE_SKIP_KEY_CERT_MAT=
CH |
>     GNUTLS_CERTIFICATE_SKIP_OCSP_RESPONSE_CHECK);
> + gnutls_certificate_set_verify_function(cred,
> +       tlshd_quic_client_anon_verify_function);
>   } else {
>   gnutls_certificate_set_verify_function(cred,
>         tlshd_quic_client_x509_verify_function);
>
The patch appears to fail to apply. Could you please double-check its forma=
t?

Hi Chuck, this repo seems inactive. Is there a new repo for ktls-utils?

  https://github.com/oracle/ktls-utils

Thanks.

> Kind regards,
>
>
> Andre Sieber Arens
> CEO
> https://thewonder.cloud
>
> "About WONDER
>
> WONDER is a desktop 100% in the cloud accessible from anywhere, anytime a=
nd from any device (notebook, tablet, smartphone) without having to install=
 anything. You can also purchase a WONDER terminal with 3G / 4G modem and d=
ata plan that works in more than 180 countries.
> And the best: all with an internet surfing experience at 10GB / s with ba=
ckup every 15 minutes, without risk of losing anything!
>
> WONDER functions as a giant computer shared by all its users. To access i=
t simply create your email and password and start using. The WONDER user ca=
n choose the performance of the operating system of his choice, has unlimit=
ed space to store all his emails and documents and still chooses a fixed nu=
mber to receive and make unlimited calls!
>
> ALL THAT PAY PER MINUTE!"

Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0EA37FF75
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 12 Mar 2026 04:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773290115; cv=pass; b=YPl3sF0b79qd2i/VuirAMmxeVYCGkKWxWG9E8uVzTTh0oCOgfnT7d3d6XbguIisnmHxiZ7gMnBlKAyJICAUHIMrOpIz3gkLDc2XiKi4gVL36PcrFkbTIqNh5+GbuflhLpTdGmNgW4fOwxrRBYZW/RcdfiqNHpZ85MiYgPfbmCy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773290115; c=relaxed/simple;
	bh=WGYrCyYt2kAAqLlt+MfZ2Of3vO50hCdd2Y65131itdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeRodlwvdB5ZjnPRVQso/4bP8x0FRD3+/lpeYFucF+KEr9eI9COVqWBbiOgAOel5XFhdTjKz/AYbZ/etSdFDBWxbjy9ycaoEeLOzxnPli5caIawOBsBgp1SG3FItJ0Hy/rnb9ohQCo9IDOrRM5WNkQ/vtV9eqdm4JhXaSygg1ME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/142mBb; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/142mBb"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6611f41eebcso679566a12.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 11 Mar 2026 21:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773290112; cv=none;
        d=google.com; s=arc-20240605;
        b=JaxjiZSFm3OtzAcvJ4VTYX2d7k3FMeP4gINeQh0CGzOFtrbElCXFsBZY34mxMisonb
         A5wOh/BzrPpfBRLMeF1KjVVjoEPAf9YKS7WnEGfrwzm0CYC9jEFgZHjmFibT5Q1Xb/By
         fVA/12xWbWZUkg56BJDgwhUFv3aPcfH3AO0zPK+FNw2w+OlCCHPBLCLupC0OlZpMy7MM
         Ephe99NSih6WLriaEQ95V56Gh6AsVl5dAiPCT8Bbsg9wk/e5nm69iOzNkvYrLaQ030Wp
         mEpv+iyBgnaDdbvnn2P//C6qYRaCOVrPWGvoaAYx3laJoVjlrV3+HMzuSYV+AoLa8/WP
         wQng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RNiTJvZ07+N6hJrE5XfRHdYlY1eJkpb+vUa8NDqe8Sg=;
        fh=+QV23lbBGAP0+QWWByqnUaNwsbJ5vsBWa+D9KkPqIFM=;
        b=byIx+glNrKl4hsPOa0mKPE5HYaQrTNdULdgftnsS2Wddpl+pCvmDB3ZdpF4CY76KzV
         +9gGWLKE8aHx2P44ccjyuIWA2X9C5GGxDeguOCpuV42dQB2Inviq9TTniXh/guurDNml
         vt+uSLgpc72XyFUbtL6GBo2MP+da/7HZAjJk2X81Q8V/sA9KgunSnDGTdPlWCbVSj1HQ
         pG0hu+RcbesUAajJG3Ym1Ftcjw9JteTsVQVsULdLahLe4rEezrVJiYDij1fFd6NsM+qa
         3jHvZHAebDH+hN1FXSP+dsEl+l7zXwjbE8wCOeB4KJ3q4iUU9dZ1Gemr4d6kMr/OJ+Ry
         DmjQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773290112; x=1773894912; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNiTJvZ07+N6hJrE5XfRHdYlY1eJkpb+vUa8NDqe8Sg=;
        b=g/142mBbJjoEcIZmWNbujcvbfvWxJfTmGpJR2yb427M2eiYFPufM1sLEu3ly2aKrxp
         ByBT4YSOQP8ieGSy17t3fEU87qVz79tF0n5JcZmJovXQQ+XMeJVhVM2gy4L1d4aDrkf/
         AJ0zTufm3lW703g6AjKgjWrfG/wVyyhb5nIJ+EzQ8GThI8wOygzREbFnEFhBVp5/jbL2
         u6qFFLJI3TOHtkUSkr4PJa+V6ThRHae3Dzx8ppmKzt69wyOIAfn7ar4Vclh41r8sC8zw
         A6zSrR/RLJolVxK2IlFuur5SZFP4tDTj0VLSFAycN5WQGfLWFslZUiJ/EtP7K/q/q0b9
         wFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773290112; x=1773894912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RNiTJvZ07+N6hJrE5XfRHdYlY1eJkpb+vUa8NDqe8Sg=;
        b=gUqjSvHcgDUjHtktJK+RD2zHcweoTFwsDP+ocZMH/knGlorj9v1jtbXuh7jHDBCkaw
         47GGE+BkmfzaPo5g/9BalFzfrev5Ic4EbZDPBUczQeUeQsIY88u+fkB8CxDUwt8KEidy
         pVHXpFLRZ7QShS/L/XPFDbSdCnXesbFF1GF+koZkaq2way87LI0Ds7+lCWahneGbnFRU
         9YljgCSJ8HTjzhjLWuQJYdv+eXemP5vHsn/5fvlyrHQ7gQlnxOE/jNB8hkfI6wNrxRgj
         hQMpskOfQ244tog875ScX/sfC5TyxKspacje10sj8aAu/SvrZYeA/pWfRreqRdTWirrc
         fp8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZTQQMGmuPex3PQb9WYP8kNGUU+pKi35i5JHHarNoxZQx3RxEG2AEr5ZJL2plav/OPQDfYkcWAySWCjZDjICRUXaUepQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwO7+0XXbX8FZ4Rc7MoM30wuA1JyEpzHAV5PehegrwFGyb+kc7M
	pfINlD1ZZAijgprnMrnypC28Y620B8hMachuewx1ZRn+BREbEFEARykIKaYJL8IUHOc8Bt78CkJ
	Doeth31Pucc/ltORZViDCjfA3lYRobxs=
X-Gm-Gg: ATEYQzwXrXRMGbtK/erxO9r6XjUz2/Dy0HeiV8mJ191qpCsK3HItlqmpLzCRXDtyz/H
	ws55yoPDPetqd4Lc8co+2AUbzFMGHlIPEJb6YrDr9UGErv+gQH6oGfqW6o1jnxIjaYixYu3wjWS
	HxS7j9Of13ofAmoZRDVbk2vziK1FzYM6gQ34ijmMOqDDWt/lq7iQi1wcMA3x2ZNz2Rt64Xbr6ha
	Nnqnvx4cg2tgaxRAVqW+PPQDYEH+Z1Alb1PrgmDnD5Pq5cr8RQBf4z8vatK+qP+FmjIlT7jrT3m
	JmfGdbTAJxWNuv8y5BjxHlOUHPU4uX/7Djkgfg==
X-Received: by 2002:a17:907:3fa1:b0:b96:d904:9616 with SMTP id
 a640c23a62f3a-b972e52c1e9mr274840666b.40.1773290111766; Wed, 11 Mar 2026
 21:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260312014804.5083-1-cel@kernel.org> <20260312014804.5083-2-cel@kernel.org>
In-Reply-To: <20260312014804.5083-2-cel@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 12 Mar 2026 14:34:45 +1000
X-Gm-Features: AaiRm50W2K1LrJ8G3PLJFkDBJsXtQZEZ0hLSfrLqWSA0X9QvKQc3Oh3vWepX1P0
Message-ID: <CAKmqyKPkCLUMtdu=Jk6FxE7a1AP6zRDhESvUGMGuL5tNBe7pEQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] tls: Factor tls_decrypt_async_drain() from recvmsg
To: Chuck Lever <cel@kernel.org>
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net, 
	netdev@vger.kernel.org, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 11:48=E2=80=AFAM Chuck Lever <cel@kernel.org> wrote=
:
>
> From: Chuck Lever <chuck.lever@oracle.com>
>
> The recvmsg path pairs tls_decrypt_async_wait() with
> __skb_queue_purge(&ctx->async_hold). Bundling the two into
> tls_decrypt_async_drain() gives later patches a single call for
> async teardown.
>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  net/tls/tls_sw.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index a656ce235758..cedcc82669db 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c
> @@ -249,6 +249,18 @@ static int tls_decrypt_async_wait(struct tls_sw_cont=
ext_rx *ctx)
>         return ctx->async_wait.err;
>  }
>
> +/* Collect all pending async AEAD completions and release the
> + * skbs held for them.  Returns the crypto error if any
> + * operation failed, zero otherwise.
> + */
> +static int tls_decrypt_async_drain(struct tls_sw_context_rx *ctx)
> +{
> +       int ret =3D tls_decrypt_async_wait(ctx);
> +
> +       __skb_queue_purge(&ctx->async_hold);
> +       return ret;
> +}
> +
>  static int tls_do_decryption(struct sock *sk,
>                              struct scatterlist *sgin,
>                              struct scatterlist *sgout,
> @@ -2223,8 +2235,7 @@ int tls_sw_recvmsg(struct sock *sk,
>                 int ret;
>
>                 /* Wait for all previously submitted records to be decryp=
ted */
> -               ret =3D tls_decrypt_async_wait(ctx);
> -               __skb_queue_purge(&ctx->async_hold);
> +               ret =3D tls_decrypt_async_drain(ctx);
>
>                 if (ret) {
>                         if (err >=3D 0 || err =3D=3D -EINPROGRESS)
> --
> 2.52.0
>
>

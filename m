Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61C035A3B9
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 12 Mar 2026 04:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773290184; cv=pass; b=uU5EbevJjuyiNnC/mTkdqNqqHYERbKLq2LZ4ySJT7aSRuKL73L+Mf+VIgV+6B4FWguCfLsZhkEx9OG37Im4CnW55kukhLFwqWjlZtU+WiJe9SLg1UD71yRfxINM8aa+GhpIXHqp1QUIJG8i9Qrn4j//+7HX3tvUzzC6eSODD+6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773290184; c=relaxed/simple;
	bh=r67LYn4BVEqa3wFpvM44svB0D4IlUD9XKYF0XBEHoqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ng9aG9Y/Y9jXfdiPeGDpWxVvy82vLt/skEBN/J69pS7NJBTq8KS7r3T8m6GltxQY3oJBn7ySHnAOiRL3jE45kFaWalCeqHnejlycXz6RouojcpduJgXD3sERwEnb6BRvlNaHWA9ARmb5CCuGwXmaU/RzIt/8MwozKNwelaf6hU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5N0sklc; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5N0sklc"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-661b16ac011so912060a12.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 11 Mar 2026 21:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773290181; cv=none;
        d=google.com; s=arc-20240605;
        b=Y5QVecFud5H/3Sm4cX0NRBkMdPqNXCWpk0sHB4Ct0gIRC8KEe4H+YHesFs0LWTflZ6
         qebIw3+AxBwfTisSlmKw7TD4GvWnXU038k7Od+vM7sVqsIAxDkwS2zdpcC0Z6Imv3bVj
         FG1KF2X6LoStycbyO4ig3UDVXn3f+ZBzZ5UBP89FF4NFcUCKjoOuGmgQSQ3Op1WaJERe
         +jRBWNn2T4lN5Q+YDK1KKX8c25sGwAd+gswnBK8TY90uTrINE0hBVH10R/nuhVqx3q0y
         LMe3FwEPw/2bnOpRr7AzEYDKU0A7nwNQTA4LxgvsPYPMQwl66V7DWb7oM7WbrUnuM+th
         fgpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jgU9UvY3lu44I+ej2GaFAalB2RjKnqqwQmuzGn2hqBA=;
        fh=rZixiTvSAfJzSlbhfWAv6IpMeyaUQYu7PdQvn5Nimo8=;
        b=bhe66DKwhsJMJHGh+cGbnvctJl+TTHW9BKrHVRmJsW1tdu3na2wrf4+HDeBWLamjJL
         w+EkBhhgSgRtSp0kw4KQa2mb33XcrJk6NZiTJOerocCFEjpC8mavmbEn5bQp35SBD4my
         F+/ZXHuw9bT9ll38Xpc61Jqq+3a2E6hj33IlFV9JY/esN6D5uJT+0m+BRTLReDFfHfeq
         9kS2R5DN0DI14WzjyNPVzCgXunNq1HXgpRHGQMazqHkn53JWnK5LpGKUT8RPHvulzyA3
         MVL1m4mLB/qZXs7cJHsaFgvY/KuVf3aUNAIkeaqOAvqcZioFFQnPSWUuBG8n12QuGsFK
         f4WQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773290181; x=1773894981; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgU9UvY3lu44I+ej2GaFAalB2RjKnqqwQmuzGn2hqBA=;
        b=E5N0sklch5JTmWwWF/iDMDzaDBOVE5NPukfLexp1IYHpA7pVfBTauWX17ccdWr259S
         MGatstQa4oim/5scph8oscG1hgtUB1dVqH9qgMdWuEBOOAZhQFvXXSne0/t9CyphGGHQ
         bqWEzv1pyLLiIvCkhHU8Ls0yqBKTWP7Azicjevke1MXhtF0HmDAlr4te12OVWcPYN5Yu
         w27lmvD9SgKdWzDoD29v2bbXz4EmDTEmvol37PawpoxMZv0urzUqXtN7flJnpxbGjAOC
         k2Lbe23ur+guQd5CZPD1BGGH51kltgC4q+5AGuGbLdgYRYm/sm8bOtT8IAi+TuwabrA7
         MvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773290181; x=1773894981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jgU9UvY3lu44I+ej2GaFAalB2RjKnqqwQmuzGn2hqBA=;
        b=gwKhXqvcGMb6xXl4XYL4vv90xWDFO5Po8/q0W6TLAjb4gGMWYnuZ5Ankg1UezMJkKW
         HbYdmoPfG5DnIiRlCRPbWqK6Q0urLahelwpP+JJvEdtKVdOiGR1j0YveZh+igaYyLGoY
         xFLFJJ+Pt/Q7BwxVPCfAE2I6FbwCYS2YNMT9E733nWHsk1CH2Gxo6YvcsmnZUlR/ElA2
         h76RHwYWxjfhOyVj6+ysH89vEqJWmM8f/xsc7g1LsoFkixlFYWym4cU3lsseWB5lGWSr
         KPKbmgGGcgfqBbkjDofGO+TrEKZ2weYFKInZx8qSssmdDDyH6aLqxnOrMBucH4x9l/7C
         o6YA==
X-Forwarded-Encrypted: i=1; AJvYcCWyzPj58c6eH4ctFUk+0lJ2cQUMbKSmrk08oqyTNKnOkurFRwE+IM7ceQHd5SbzrnhPO5twfI1wjmuXRtZatlfY5Nm8lw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhCodcS/Hjspzdx0AH5FT2wOIitayiVFANFsLSbN8JqxYHfCd2
	XamUOuB9msmbcQYrzzohblquOfuyGy8Qe5PF985fokBiJ22px8cB/BU7pobCT7ISfkrVQt0VXvK
	7IRSTmE5p+6ZNhdSM6W7kthi5MrLAtrU=
X-Gm-Gg: ATEYQzyiAT4LQFJdrQM0hEZJcobB/icscLT9Bq16IT8uz0rqadZSGb/zApqfSem/ryj
	C9ml/1hDB7BLwGQ5RupXpahmTq1GvG0TK5alYRxUxg3+7FXJtGuK6sghcqWVuFeyjwqbmr/+H+K
	ud18WvnzKd0+wOHSYNUbtHYWUa4OBY7I6M8XfBn5VVz4yDCJAz0kMeCuldjPk1r9DQjLefBa6t+
	daAFL/Ew2PSXn3jXySkWtHXhJ7sQ/8CNFwWRQh6aJFSRy0Wm0N4VB+QB6XwRBU47kdAKIgTPE2P
	MYgUC1ERYA2EHz12HvxZvynSmv//TkdeyBAYdzFQTfg3hczr
X-Received: by 2002:a17:907:747:b0:b94:2345:3e6a with SMTP id
 a640c23a62f3a-b972e58c7edmr279717466b.48.1773290180923; Wed, 11 Mar 2026
 21:36:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260312014804.5083-1-cel@kernel.org> <20260312014804.5083-3-cel@kernel.org>
In-Reply-To: <20260312014804.5083-3-cel@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 12 Mar 2026 14:35:53 +1000
X-Gm-Features: AaiRm50goo0thwPi9iRQE4KQ3LIpAI9ZnjrIB56iy3Lx0LeVrfHR2dcpQr9Qs-k
Message-ID: <CAKmqyKMLA6qBOdxTCayDzujDz4=4v3qcXGzHf5pwBH0by=O67Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] tls: Factor tls_rx_decrypt_record() helper
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
> recvmsg, read_sock, and splice_read each open-code the
> same sequence: zero-initialize the decrypt arguments, call
> tls_rx_one_record(), and abort the connection on failure.
>
> Extract tls_rx_decrypt_record() so each receive path shares
> a single decrypt-and-abort primitive. Each call site still
> initializes darg.inargs separately, since recvmsg sets zc
> and async between the memset and the decrypt call.
>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  net/tls/tls_sw.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index cedcc82669db..81e0e8aaa6f9 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c
> @@ -1832,6 +1832,17 @@ static int tls_rx_one_record(struct sock *sk, stru=
ct msghdr *msg,
>         return tls_check_pending_rekey(sk, tls_ctx, darg->skb);
>  }
>
> +/* Decrypt one record and abort the connection on failure. */
> +static int tls_rx_decrypt_record(struct sock *sk, struct msghdr *msg,
> +                                struct tls_decrypt_arg *darg)
> +{
> +       int err =3D tls_rx_one_record(sk, msg, darg);
> +
> +       if (err < 0)
> +               tls_err_abort(sk, -EBADMSG);
> +       return err;
> +}
> +
>  int decrypt_skb(struct sock *sk, struct scatterlist *sgout)
>  {
>         struct tls_decrypt_arg darg =3D { .zc =3D true, };
> @@ -2132,11 +2143,9 @@ int tls_sw_recvmsg(struct sock *sk,
>                 else
>                         darg.async =3D false;
>
> -               err =3D tls_rx_one_record(sk, msg, &darg);
> -               if (err < 0) {
> -                       tls_err_abort(sk, -EBADMSG);
> +               err =3D tls_rx_decrypt_record(sk, msg, &darg);
> +               if (err < 0)
>                         goto recv_end;
> -               }
>
>                 async |=3D darg.async;
>
> @@ -2294,11 +2303,9 @@ ssize_t tls_sw_splice_read(struct socket *sock,  l=
off_t *ppos,
>
>                 memset(&darg.inargs, 0, sizeof(darg.inargs));
>
> -               err =3D tls_rx_one_record(sk, NULL, &darg);
> -               if (err < 0) {
> -                       tls_err_abort(sk, -EBADMSG);
> +               err =3D tls_rx_decrypt_record(sk, NULL, &darg);
> +               if (err < 0)
>                         goto splice_read_end;
> -               }
>
>                 tls_rx_rec_done(ctx);
>                 skb =3D darg.skb;
> @@ -2380,11 +2387,9 @@ int tls_sw_read_sock(struct sock *sk, read_descrip=
tor_t *desc,
>
>                         memset(&darg.inargs, 0, sizeof(darg.inargs));
>
> -                       err =3D tls_rx_one_record(sk, NULL, &darg);
> -                       if (err < 0) {
> -                               tls_err_abort(sk, -EBADMSG);
> +                       err =3D tls_rx_decrypt_record(sk, NULL, &darg);
> +                       if (err < 0)
>                                 goto read_sock_end;
> -                       }
>
>                         released =3D tls_read_flush_backlog(sk, prot, INT=
_MAX,
>                                                           0, decrypted,
> --
> 2.52.0
>
>

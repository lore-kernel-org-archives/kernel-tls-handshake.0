Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8435327798
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  5 Feb 2026 19:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770320279; cv=pass; b=aIji9jTXoYle9SQoASKbEevAEqxOmO0Z24/jXsc5Kn57bj/jdlBj5ddQLoEyRTS1JpRa8Y8BN24AL8cv1hhCyaF46UxlKRGNlI0/1UMdpaRDs5hGjJKd1SVsGaudih4kckMWgQfcpzY02Ntx0tLj0ILVGriNt+VI5pPeDLGkBtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770320279; c=relaxed/simple;
	bh=sKPzMs6ZiMMSTfcnvFTaywQRGHtQmYcHtLPKvcXf5PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SwVPuckJiJ4xLI2zmQIWzO9+8HfM3ch95jv3D7vyAbf4TMp79NdAOCGQEONsUiCpxVdRTSSQTWGTWNA+ZBOJq/xAIKqLrIYIzQAos5IevBFI+GGYLR33v+NJTOXZbjPhbd8/RlL52jeg5bSOsQlj8sjQFsuGMWOivNiBAM7EREY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fwk8H25F; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fwk8H25F"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a09d981507so10966115ad.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 05 Feb 2026 11:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770320279; cv=none;
        d=google.com; s=arc-20240605;
        b=aj0lCKdDBy4HmV/dM+8gaakSsAadR7ptvWMoxJAF5iO8fooUBXSNHWI+up53K4V3HT
         dXjldUDlWrA6AfXfCElkZjQgEGn7F/uahu7Hno0xkexVRmO/2fdEpIm+xRB903lPS1Wl
         EsUVvH1+/FfZAfhweX3qN4h7FyxkzhgmBCrIyvRZICw2qxAN7BlSDj0tIT9zFu62Vv9g
         v3HETac18UOq7t+GZEVjttr40LgYkylYzJvoP1meauPfw9Y7dAf63v0ApUvYTYnRYGD7
         Gmo/AtM8aWW+inw61YIJK99QQbAIEtJon+KiWqw8uDv7efhmofT7JurN7O9RkyWd5dxa
         oV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dfrsfyhAmd8GwoduMxGfN4+1FY51xPnUMNNk+QbL/6k=;
        fh=ddR4zEypGm2F2MqlnvS4gUOsq46v8x7+ks2zE875KRU=;
        b=WIRnRDdSIzT6GZ6lRIprVdf9Qhy23VG3PgeY8xxzKm+JGc8b1+zZn603yhsaz2/bIz
         iCaVC6JtYBrxrwsciFQaNXUH+dtqSBFV6QdvPuUUNFlcwGpbRal5fLdcERjUnhmvyiOU
         IGH89kzbB2FukioF6v+UMitjIkQOjDWsfx2k06fm7A37Nk6IVhJO/mTlL4HyuIztBXQL
         wt2mKWCTZmifYJmvMsNvTFGk6yyaZIXORkgsJD8S2tdYgTkz8MX/C1iq8CGuUpwfTy7H
         29/ooSx08Tv5kBYoXWJZH2DAms9SFPKAlSNwACcPDCWGLM7WSsA92dSmTz4EueK8aIZZ
         09ew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770320279; x=1770925079; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfrsfyhAmd8GwoduMxGfN4+1FY51xPnUMNNk+QbL/6k=;
        b=Fwk8H25FJPkCQOgIde4hXlNkWY38UvNrzpbM9RX1+y1p14wRrPQz7Ll1nPLaqjXYVv
         X1/dhBDnbGigBkcBVjVeN6GigpFqHdqay/wHoVgI01EGCIP5i2/7O8qag9HNb+xnDLap
         QEofJ+RxMbNYMFpjiS+2p1ezLW3E+W4M93kA3fDT53wn9RNWBS2h3eJ6Xp1igBhkHekU
         gBLk8sQWJ6+Tl9uOfRtqR0Gre1Nf/2k15KK5qfW9AI9mViaqinml90eW7ael7YRdZ2yp
         nYukcAVUeD/GG4zql4ZsqAHaBDXc+xxD3Kle1NdnJe5qUbfpjgn+iBjDvCEj1ZpMfF5l
         FGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770320279; x=1770925079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dfrsfyhAmd8GwoduMxGfN4+1FY51xPnUMNNk+QbL/6k=;
        b=mYCn9Y1J5LuADqulHMChVeyM0ao/eJ0IN2f51T97MwXkHZOjP8RibNSarusQpzlj1s
         N9z2uyJY+nrB4dFaqEFBUB9/3erk6pFXB4Q71jN+on2D4rqnG2Picl+8bmeQt05xFxvL
         WqN6+Y9NO594/xnIrZp5RPZSlCRTN1PKtCEDRoOTzgV9Lsz9q02i5yq6/CwKfRx/UPVX
         Na2z6sKrDqGX+vwDhqTrw1wG5oyEbjeOuroW92MlMLiYt3mvABxCsCKA1jbm+fbdB1zi
         WtMQO8vhHKjbJWxs2FU/hgQvzGfbecFr2o4WLwCYzumhLAwqaCf2zLJ8qBDnAwYRSk96
         sKmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9pCWv4za2s64GSgq/SnRiq7q+58bE8db7yVOk7mGb42RcQ6Wlfv9m0QRl6BJUXz8pT5iU4/3giWluwilTr4PTyYJ4tw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzphdaVg0kYKNUgse1ms0rfumbCSzihECs+ixrrejYhFSAvo32y
	Z3vqWQwU+5JXga37gfmBYBi3+Ti6oaNuwZl7X7y4hXKqj8felXWQnOM1gnpKEwnjO3s1LYFM00q
	UFc5Bc/UjPg8fH6N9ckIR201UNvfz7yY=
X-Gm-Gg: AZuq6aLhLpt3oq2JkHdjP5HuGB6voQiChVJi0qKO7zRxJe0PkmVlAPpH0+8pALLwR34
	71YSNBmrdr0/QopeedBQtWsCCoTWta9t4ORxmOuD4Wc2r6M0NCu21MsCiPTuGUBf0pVty7xm1Of
	B0pATNpVY6dHqkvPYv30jSUpUwj3ecKTaix5XB9VN5/K+MJTFuOhSSetXIDRAc3g55dUYZKSXJ3
	/QZGCSO5/YZro1e9XYQlNAdtp7Rr76TBb/PZcoPDDjI6g3jTjkyWx3JMzcWGM+ONl9maRcW8TSP
	6qHSk0Ms/EIn6LUsmD8+QWOK3M9H
X-Received: by 2002:a17:903:3d0c:b0:2a0:b432:4a6 with SMTP id
 d9443c01a7336-2a951948829mr3889045ad.15.1770320278896; Thu, 05 Feb 2026
 11:37:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <b3e81a27cc3e4c03fa8357c2c77b238997e48610.1770042461.git.lucien.xin@gmail.com>
 <20260205115506.2195311-1-horms@kernel.org>
In-Reply-To: <20260205115506.2195311-1-horms@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 5 Feb 2026 14:37:47 -0500
X-Gm-Features: AZwV_QgKmhAvyahpdZdywI3F6DO1BC_0r2LG19n44OMuBxjTNkYftoQ43Qsj1cY
Message-ID: <CADvbK_eTE-eRDpUQ0bLcJOTyveEYusBSqGZTYBYuujuABvm6jw@mail.gmail.com>
Subject: Re: [net-next,v9,05/15] quic: provide quic.h header files for kernel
 and userspace
To: Simon Horman <horms@kernel.org>
Cc: steved@redhat.com, marcelo.leitner@gmail.com, aahringo@redhat.com, 
	alibuda@linux.alibaba.com, jbaron@akamai.com, hare@suse.de, kuba@kernel.org, 
	tom@talpey.com, linux-cifs@vger.kernel.org, daniel@haxx.se, 
	quic@lists.linux.dev, jlayton@kernel.org, tfanelli@redhat.com, 
	dhowells@redhat.com, linkinjeon@kernel.org, hepengtao@xiaomi.com, 
	pc@manguebit.com, kernel-tls-handshake@lists.linux.dev, 
	illiliti@protonmail.com, xiyou.wangcong@gmail.com, 
	andrew.gospodarek@broadcom.com, mail@johnericson.me, edumazet@google.com, 
	pabeni@redhat.com, matttbe@kernel.org, netdev@vger.kernel.org, 
	smfrench@gmail.com, metze@samba.org, mbuhl@openbsd.org, 
	chuck.lever@oracle.com, dreibh@simula.no, davem@davemloft.net, 
	sd@queasysnail.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 6:55=E2=80=AFAM Simon Horman <horms@kernel.org> wrot=
e:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-loca=
l.html
> ---
> quic: provide quic.h header files for kernel and userspace
>
> This commit adds quic.h header files in include/uapi/linux and
> include/linux to provide the necessary definitions for the QUIC
> socket API.
>
> > diff --git a/include/uapi/linux/quic.h b/include/uapi/linux/quic.h
> > --- /dev/null
> > +++ b/include/uapi/linux/quic.h
>
> [ ... ]
>
> > +enum quic_msg_flags {
> > +     /* flags for stream_flags */
> > +     MSG_QUIC_STREAM_NEW             =3D MSG_SYN,
> > +     MSG_QUIC_STREAM_FIN             =3D MSG_FIN,
> > +     MSG_QUIC_STREAM_UNI             =3D MSG_CONFIRM,
> > +     MSG_QUIC_STREAM_DONTWAIT        =3D MSG_WAITFORONE,
> > +     MSG_QUIC_STREAM_SNDBLOCK        =3D MSG_ERRQUEUE,
> > +
> > +     /* extented flags for msg_flags */
>
> This isn't a bug, but there's a typo: "extented" should be "extended".
Cool, I actually asked my local AI to find all typos but got nothing.

Thanks.

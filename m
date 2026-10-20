Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792505020;
	b=O6Jc6JF2LJbK9HgdnxXaA6xmXxo/wRAWc112GPG1k89zaOWyEeMeuQzZv7YfUaanPTEJ
	 0xwX4+RDzUtCdzKqumECmQ4JCQ3uwfvvYhlbbmpfd/9DlOO6BPaODzapM5A6+9z9TyhaU
	 6F64giAzFyeUZ6opT23BKZa327r9c7nfLZZ8RupL8KxdeT7dEmu6liNLQts/gDhp+v0bc
	 5ktYsaEOQXkXsFRSNrcsQ5RknriqG1Vv8En05VXQXwGoYH26HkfXFT8dl47tAaodpWM6Y
	 JWMDl6Ysj92DNlmkt9aRvoqGGna3Bwnvu758rQGvlWq+vcqGcpBXg/lz30IcRhUtUvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oKb2Sw8VN2P2SkIY3ZZ3Dep+6mwTIiJQAtJL672jWMk=;
	b=1NTtLP4B4kIJ63RtJrP2bKO4cG20r40MJ5OrelkZ8KwS69FpIfnl1MKg46dflHgInFj5
	 nHmeBmqUCor60PSEMNGq8Qq3RvTux+zjWHwqX037Y9n+rkQ+I5j36pTKj07Cw8q1ou7Dq
	 US/i+Lk84meSxuledU0efR17RgikePb5GAFrAa5bmb6Asm60P3n2NWmruMelg0CxxkSQr
	 xU7ComQxW3aXBFk1fnEVeVWI6MjDQOrDrMHcho7CdfxtcGUa5gAQgwqwbg9nqHPyGIdkq
	 99H1Y8k67PATqRvq/KqzBA/DOeaNSFbBBAwNQNozECkXviNfdVTFd567drHYXjBD3iA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QVQwmSK8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3255A606A321
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Oct 2026 14:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3255A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QVQwmSK8
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so1193714b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Oct 2026 07:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792505019; cv=none;
        d=google.com; s=arc-20260327;
        b=csderDl1bVtdu+S42FaNRRD/sshHvpOSGuN3OZRFAlAblbXUsJxcKOrsKW13m5fDQi
         CGBTQo+6kdeLYL+wiPY4ukz8Y+esrEwGV322uVWRiUwjM+iwBrtuhkA+cGQsYlr6ZiWr
         5YoR1yR4/Eg8cTiqNlgGVSxv2ghJMkpTEoHrP8i+u2W9xGxQA1/n2hE3fCiqdT8IybI9
         SYgJCmXCgyEejKflFqKIduEq8DxCE5x0RTEA2k91U4Yyi3Wyd5fuj0Z38W9sFCws7jjg
         gwxzu7CJxvw9E+zCiSCnV3wtdCRoJPf5MpwP3gl5NsWi8h9QyG5/yDcQ7CTCeDuh22kR
         Hblw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oKb2Sw8VN2P2SkIY3ZZ3Dep+6mwTIiJQAtJL672jWMk=;
        fh=Wycq0EpZwPmToA6GAn3XXMOGLtA0aMcx2XbXQxbC3m0=;
        b=kspt+FUCgHwK5O59XjtFjXyfUcVW+QRKMf0Apsyb2zOtv1tctYCnngRpUByNlCSKlY
         h1K77+dNYrVZAtR3PzcaJKXvYFcoJPPxU3APIU19VS5ntAmookQvknLG9daY2t5lHWRo
         wyIneceTZrzJt8yad3P9dRNdxvJG7FfsxSZMRCQDa78amMCqqe1vYHXiawSJXcEwZgVh
         pmLZVNh8zGdSHD8awgfkkEHqWUlzhH0RdgOud2awp24+hcfWhs7oa+kqKYVQ/e1Mm8Oe
         EQgwVE+07sdrcds6XQjNP/3VI/v9e1vpDAQhQZJL6rCYnNPjvduoMVJPkB9yJnPAlCOw
         S1uQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505019; x=1793109819; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oKb2Sw8VN2P2SkIY3ZZ3Dep+6mwTIiJQAtJL672jWMk=;
        b=QVQwmSK8W20meR0juLVTvFTtmgvzIW0xyrvcXVcNfTXZfNsrL2sIZU4H17s3xtLWhH
         rC1xV0b0aYxTcAAksVJK8EEDa71y1P3kVrxGdBziNRWX+iYk1vdSrYOrUs6k4Uu4v3FP
         g3vDU96yH3I10oS3CTiZKFoWC7h+AWW2yr1MftkT81JucN6NkkipZjOGOrpbimFYebCD
         FGZk8b7Ka8o8dKGycemRVEePl2BwEzAfA9O8/rGT08sk8/99X04bqGIf6e/OjS6ZpdrC
         VXqyaWQyMKZSwpwqGRK9RGxEc/XU60JuJHEVLcdEN3GT6Gvp44mL4d6hMeT6k+ZPRtVx
         V+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505019; x=1793109819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oKb2Sw8VN2P2SkIY3ZZ3Dep+6mwTIiJQAtJL672jWMk=;
        b=fjhC7RXPP8Nt5n7hNK+ekliq+yjezTs0djNgAgw4vTKtmgRUZeylvXwBM21OY9Nw+3
         P+lucaX6bAy50SUoEtjEdk6iYEg8sSAiKpal9rwUqiDT65nMBPotJhKsbQdmsqfzTuY4
         AAfY52VaQXAAPrk5DBYT3ezl+sGw5ODyqck1YHawUbilLISVRaDEyiepe69n14LFZ6pW
         PopXUeOlt0ADSeM/wc+IPXy9wUzf5P3vSJT+nUDRHB+fJOAfcGi05hff1O3vWzb/gCRk
         ZwMztsQrvJiO7Z0u6d+bvgeqV/S4E8tNXjKOHy9KlfFRtCWEp7fW2GVgbM1Ys1QfV/N+
         FVsA==
X-Forwarded-Encrypted: i=1; AKwUvBz5Abkf4CvZ2o12nRqf4apExruazYGeGA3GZZV70lVyJ6gF0qlj/wZu7R2/nvCK+xcMozSNOCSirZKPXqC0e791D/p+sQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKPkX23CAvj6JCCaugppwwOSFuZnFA0XdFQ/4d2G+1FMMk1chC0
	4WUsyrnnJyDAi6onR6Js9dDxKf6WldkyWKQZFwTTWgnwd5k7Be/bm4lcH6AVrB/z+EUz7K9sUAx
	JaCV2lKb4mOcttFF+y3UadVP+jPnyR7s=
X-Gm-Gg: AYBFou2z4SUgZQm8wYeDghe146eYro+6+WIKvGtEj+1b+PsYbi/drYsiNoPaQA3wGEi
	cbgr2Hx8jLAyOniMNorowfqIdUI79pDcKJEB3C2C0K3TPUasVoFiIlcHLX9Vt1jv2GasAyzEXBh
	45YxjfwpwvtSLm6IQWR0An4NWs7dIeevjISvRI/u/BqTBhQphhh+6Q/n/L3DBwN/1d5DVWAAKXz
	dZV4FYnjUBCdwlJsxled+gKFMn6/5WT/AWfqX3cpN9XUwS9so9Kpjy+o8YJ5Da+ZNBiSWVPG8HM
	BBKpc5IxgR6Rb3S3z+aPuXlqfvUW3/aOGnFi6DbFQQ+QgGVHFiV5ciOU8NO5whd2hxn8bAJ43iN
	b9vsESXK1baDTFpydHl/8Or9v+ggoYFd6iLbxe6Zx5xCD4OxDDRkIQlxb
X-Received: by 2002:a05:6a21:a38d:b0:3e2:729c:9bcb with SMTP id
 adf61e73a8af0-3e2729c9d88mr1695706637.65.1792505019435; Tue, 20 Oct 2026
 07:03:39 -0700 (PDT)
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
 <CADvbK_dbQ1ogx73TFhKNtHb-0TRBn3rfQ+C8C_TZ6sgf91zqTg@mail.gmail.com>
 <b2a3cec9-b0e3-41e0-9f44-908ebb1953b1@app.fastmail.com> <CAKgHdsUSHWHiQK64adk35Q9M=a_ERiVf-Bypw8yE99c-nEw_zg@mail.gmail.com>
In-Reply-To: <CAKgHdsUSHWHiQK64adk35Q9M=a_ERiVf-Bypw8yE99c-nEw_zg@mail.gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 20 Oct 2026 10:03:27 -0400
X-Gm-Features: AclHuK8sEc-yeGEOwTBbM00cPdjvzA_nuAji47OO_3nn1YXj1J9ENDpFbPGhYnE
Message-ID: <CADvbK_cmUWecya3hshFb6WqZWcqRsXY05X4YiQ11eDRm5hw87A@mail.gmail.com>
Subject: Re: [PATCH] tlshd: Verify the server certificate on the anonymous
 QUIC client path
To: Andre Sieber Arens <andre@sieberarens.com>
Cc: Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 9:40=E2=80=AFAM Andre Sieber Arens
<andre@sieberarens.com> wrote:
>
> Hi Chuck, hi Xin,
>
> Thank you both for looking at this. This is my first contribution to
> ktls-utils, and my first patch sent to a mailing list, so please bear
> with me while I learn the process.
>
> On Xin's first point, keeping the GNUTLS_VERIFY_ALLOW_SIGN_RSA_MD2/MD5
> flags: agreed. v2 keeps that line, so the QUIC anonymous path sets the
> same verify flags as tlshd_tls13_client_anon_handshake(). If you would
> like those flags dropped from both anonymous paths, I can send that as
> a separate follow-up patch.
>
> On the second point, the patch not applying: sorry about that. My mail
> client turned the tabs into spaces. The patch itself applies cleanly to
> current main (e486e5fc4ba8) with git am. I will send v2 in reply to
> this thread with git send-email, which should avoid the problem.
>
> v2 builds with -Wall -Wextra -Werror on Fedora 45 (GnuTLS 3.8.13,
> GCC 16.2.1) with HAVE_GNUTLS_QUIC and HAVE_DANE defined. The same check,
> on a 1.4.0 base, has been running in our builds: the handshake is
> refused when the server certificate comes from another CA or is issued
> for another name, and a valid certificate still works.
>

The v2 patch in the attachment looks good to me.

Thanks.

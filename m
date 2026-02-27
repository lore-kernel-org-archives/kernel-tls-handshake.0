Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF28913B5AE
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 27 Feb 2026 00:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772153438; cv=pass; b=pl7DGADUj4DmAmbg+2eUZlverqJb1xmrW5kXKE/Zg7aiZEbn5C7/zbzDpyfOV0obuB0KgbN4jgLs2tF9x0nQHtTCS3rxrFJ+OnvQfjEKqLWBMMkVhGky6c2J0WSmHlJNLBcvtXaPpqC6ygIx7YlKgw3EWyiMLBx0PEbduz5pOAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772153438; c=relaxed/simple;
	bh=Uf+sscOR+yuFgtYwpJVpmYCu25jcP+Fzfo2M5z6qkJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hxMG/Xnl60J1eZzT4dIe+2XGqqgugSyVNdGG3Yxn5XqeGLjGZdpqzv4WDK/aKlXInJ/qWAaIKEgTF/9jp9ySc+G5CxpwqTyK7Xxiua3c8N/cGJdoRwTi85MFTo5u3F5UjkxnWijtmtc5hUUQ8JBfiVoKhHMG8uvF++M2WREUyCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPQh3gYL; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPQh3gYL"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65f980cea07so2227064a12.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 26 Feb 2026 16:50:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772153435; cv=none;
        d=google.com; s=arc-20240605;
        b=bOs4rmENWoZXt1LK045MQG8XBSDLflJjDAgpcB5RRcaTC+S9W/vv0/eNcCBntureaW
         XFaj708LyWi4DkWj+dwlWzpngBiAuLoTMOXJFaTEKiBF9KBpWgI2qFEf43j5Q+K1tG9x
         VekDS0Quw1MqBuUsker//c4eP9b9W0LVuie0XCuJnNo3CSMMzdoX7vynboiVG0uPpqON
         8xQJjLci4xbvUS7hKDeki2JlH8/aVnvDXXmdaQzTiHOt0FY0fpTt2W4ep861Cs/XshRH
         Qcqkv8ut7ib9fM/M+JfsapO9Tk3Oa8GJ7pd7JQ4Zo9hBGAtf8T+NEAJjjMVT8k9w45bw
         8S5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XL+FmmWPFy+JjiNeiu6vxWROsh3ZKDuEY/7VIpcd5Cc=;
        fh=W0khojvZP/QXI5Jq4e4Dvno0XnZfdijjyI32BY0NjW8=;
        b=PyVt7Nrw4YTG+/m5KayWI9T96p5Rp+bRnqhSMNIHPLaWlyUp1vZSZu0AgiYLc9Vb4K
         DxhjiA8qhLuPQ8p0I6/3zxudsetAko1kr97F8VfarVcXsmUtB9/Yx5tK6fqlH5iR2Prr
         FVTS/SuaaYrjs1S4cVSHZvY/XqKyFr/zeRq80oDlf4WBYc5AH5dHBhX5m85+VZkQxyym
         ift60BrpBe/1lp6Z62yjdTRICNKndqWhZFXqDl978QJFZqAiCxWOnmyRjk8p93UupgYm
         26qmZuEPQuljaojd+fheZELQ/HufFCWBxti9pfrgjLyksU0RUXZrMBfE6lZo8spejCY6
         R0ZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772153435; x=1772758235; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XL+FmmWPFy+JjiNeiu6vxWROsh3ZKDuEY/7VIpcd5Cc=;
        b=EPQh3gYLpvMOb9uMrDBitAAS5qmUmT1tVgFF9cYoo0XJgsfFV3gKcfjW5hvQV2Fsin
         FagCtdncLcy9185IvVR8ltD05o6xx551coqBnLQLiaAVMEU1LSyPvdOCvXFpfvRHgt76
         7BVj6ula+s3Hr3A54K9cDdrt0Ye4IIDn+ROqYH3TJ68WGdlfuRHBi2maMEkMBj9tFOHT
         ve8Gsq2hD4/MrKza+SCPFQT5xIoTglMKecmNn1gFy3OXYxWsJ9fDHagwtb1ZsX+XT8de
         JCNDwHzIFWpKAnzhe00A31T2vIhDaL49l4/4qj96pF/jt0VxYcNAexR0yjCQ6yP4oF2y
         g5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772153435; x=1772758235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XL+FmmWPFy+JjiNeiu6vxWROsh3ZKDuEY/7VIpcd5Cc=;
        b=W1sioM9aVNMANyg1x9Uj5RtwthxLG1R3KdVaT49XbL3j9GRgg/MmZDaacTajkxVzko
         UoMh/GRFmOA1oDRU1EJ3SgqmbWuKRTz4nA020jAvxne/3eBKeGjonEuVsPSA/0MPDedY
         KSiO/3bcM02/npm2QUNNK2viGc3yefilvC4zpuClFAZSaDVEMwGp/kklxNugpNlXqzMb
         b4tHbyEL2JTIf2WA15I4/OM0imJlITwGT4opPe/3/che222XnPuZ9ILK7S6R5MQKVE7K
         Ff/IC9i+0bv1AEZ69oLYXXrCIXUKofTcXTcx1wEXoaVwrFYTvTU4JFjSyZTcJenU319q
         z/tg==
X-Forwarded-Encrypted: i=1; AJvYcCV2kwWPCNbddfoibzKFJjPmRRX39INsZeX8xyPCqkq8JHRuA+kawu5W2GmchPu/w4lzh067hClANhI3qROVG/RzTCiYPA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1+O5GOwcPHb746/qrT9OwAZE6au6eSYiC6qmpK8IqDYnwLQQd
	nTofrndw5bnRMYZM582MgOQ4ldG619mgRDbMM7qtyE4j+fk/y1OMnBJQFylXPumsrDfa+qMsDbC
	geqaERFbSzMXsF+jm88jvuNOiJAVXOHM=
X-Gm-Gg: ATEYQzyYsfouPTrnImdcq9/52kpGRbI5buDrtdCQiR3XXr4enCO4sN6rWoJ51A8V3qG
	bZd2/8bAv8NFWNvsue3m6qv7gk40QHsY77P85olpdBkz5iocGPLGWOKXTWK/lut4ExYEFN7nK/e
	tRIJ0pmfrRsDjIQwWjtFRKbKeh9oTSusQUvh7coPJqBBCVTVWygEpTGSe2qXpzGZnHEsfxyHzRW
	BHd7Qhd8khvy6yjXlhBk1O3sn5a0TmabhrWoaH+noOQuO1fbZ10Fi7bcqIs0Jg1SbNkorsWteOW
	7R9BBWx/wTeJgCl+zc4vW0X/glZgoHSKJn7xPw==
X-Received: by 2002:a05:6402:146f:b0:65f:a428:e008 with SMTP id
 4fb4d7f45d1cf-65fdd4cb0c4mr709096a12.5.1772153435063; Thu, 26 Feb 2026
 16:50:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260227001151.41610-1-leon.j.kral@protonmail.com>
In-Reply-To: <20260227001151.41610-1-leon.j.kral@protonmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 27 Feb 2026 10:50:08 +1000
X-Gm-Features: AaiRm50jOH2clR6j9tf_ctr7L0PK_VdWJqSq13o2tmjs5iaKJMGoWPOcsuwangw
Message-ID: <CAKmqyKMxnBkBeKwA0qevmNH2m9WOjOHRV6DiUOTjyz48SBwYtA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net/handshake: Fixed grammar mistake
To: Leon Kral <leon.j.kral@protonmail.com>
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net, 
	chuck.lever@oracle.com, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, netdev@vger.kernel.org, 
	kernel-tls-handshake@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 10:08=E2=80=AFAM Leon Kral <leon.j.kral@protonmail.=
com> wrote:
>
> The word "a" was used instead of "an" which is grammatically incorrect.
> Fixed by changing from "a" to "an". This improves readability of the
> documentation.
>
> Signed-off-by: Leon Kral <leon.j.kral@protonmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  Documentation/networking/tls-handshake.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/networking/tls-handshake.rst b/Documentation/n=
etworking/tls-handshake.rst
> index 6f5ea1646a47..4f7bc1087df9 100644
> --- a/Documentation/networking/tls-handshake.rst
> +++ b/Documentation/networking/tls-handshake.rst
> @@ -7,7 +7,7 @@ In-Kernel TLS Handshake
>  Overview
>  =3D=3D=3D=3D=3D=3D=3D=3D
>
> -Transport Layer Security (TLS) is a Upper Layer Protocol (ULP) that runs
> +Transport Layer Security (TLS) is an Upper Layer Protocol (ULP) that run=
s
>  over TCP. TLS provides end-to-end data integrity and confidentiality in
>  addition to peer authentication.
>
> --
> 2.53.0
> v2:
> v1: https://lore.kernel.org/netdev/20260226000915.27898-1-leon.j.kral@pro=
tonmail.com/
>
>

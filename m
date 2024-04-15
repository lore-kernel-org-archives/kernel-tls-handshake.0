Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A335DF05
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 15 Apr 2024 12:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182509; cv=none; b=sucgOelVhOPs2jEot367OKmOv9d38J0OSse1UiOmoJVkXlaAj/GYFdUSmSaVNiJE5IP0xHbwflAEqYa4U2pN4liuGIr9p9kHnXTmraXLiyuz8KrCi3f6aHsOt/8bdxDyqO9YvV596AUPVu+q6p6pFSowwJ5Jlwpg5+fJwdpwvBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182509; c=relaxed/simple;
	bh=U2+6Lr79GsLFHQ315u6tpD82JiM5TTUkPMj3699+nDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmxUYs/r9vvMo8qhn92vfIZy+nTwdEeoOxq843/eG3gcHnryXayOcqmHV7qYzzJ7jfwX1ndDjIPS9OmEacia6o/IFRnDZ5PRHM7lvY6pHoBxxmGIEkuYHuRK7H8+LhmvlHwlatG2vBCProWu6wzkKmhcTylAp48uvqTeQq0JmQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBcn3dDc; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBcn3dDc"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5701de9e971so1222524a12.1
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 15 Apr 2024 05:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713182506; x=1713787306; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2+6Lr79GsLFHQ315u6tpD82JiM5TTUkPMj3699+nDk=;
        b=DBcn3dDcLrcCdxWKZsxy2b+itb69dyAdLgsfE3u+VHLHBRC1ab0SMhHRuhvHDEC7Bp
         oJplDSDbYEReTHOpUsy6EfJF0c1vwejx4ltATPetCuDMDzcSNpqgnHBoWHbw8uYNR8P6
         WN7Q/bL+qZckwTOn0+o8STlvmTgxANhGD8a7pllXvCvhmypgk6J7RBvwInyOX+uNxtW8
         IRU47cV2g782cx1vDM1LMjRGNiMghJ5kJwrlRpPo3sxJkzzh95PvrTD5jKosDFKnv4fq
         UHImUyxB7U5KdptJ/YBAVQIrYvcnauKzYaiOA3pFFRBY3vEM33HTo6UNBUoqO5yIWs1Z
         Bw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713182506; x=1713787306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2+6Lr79GsLFHQ315u6tpD82JiM5TTUkPMj3699+nDk=;
        b=ISs3O8h161gKA4va2LM2yviwmECdEzCJozf8SXJIH8FT6eyLQJf/cBcKQ+UXDsql3K
         6TfNw3eJaZcdpZuv3j2rBzsBjWL5wq4f5jvSKeOgajWtPCassXDxrosnIeuQ+KcwGrmf
         +XIU319lk+Lz3pTX859mQHSJaP+YmYK7hSJU3niNhtvprS9Z9Ak65kAfaVajHgfArNuD
         Zzph5Fe0PYY4LABgBjtbK7ELfQdO4S2waQ6PZSQy+BfqeoQGQMHO9P2IHF5y+epsyjBz
         cWmy/On8ejOIQEJh7nq4BdEH7RpWQhJHz0KCh5tdw3rJCSpKo/kJPBr/Ebj0n9lFp0wK
         KMmg==
X-Forwarded-Encrypted: i=1; AJvYcCV60/z6noSg4VH3s72F729zABhcINAX7rxdV1+S28zJ+aeGy8NordHwA0cdD3MKq4R5mgLAHGZNjMZ8OPqm7ENr1cy5HrsYB5ema5sTTkY72XLzlOs=
X-Gm-Message-State: AOJu0YwAN0XSjMehbN5MGX4GOJ39vIIySEEM+rH1Svdaca58kzD8zMbu
	aV1o8o7N9RPxgFZAA4fDycpX8z+RkibTa6xodwyRxRRS29up4PiEw+3gbmkJdstOQ/FkHyE+pA7
	2V9CXE7gb6JdgYzxDi248t3BKXYU=
X-Google-Smtp-Source: AGHT+IGbhRTjcHd2K4ztbjm7oGGgtAEi1sZPmlLlZI6mWHz2v6XhYVkLuyaUclom/SQylPmkWyk1n/jJ4ZnyEo2KLtg=
X-Received: by 2002:a17:906:eec3:b0:a51:c84b:f17b with SMTP id
 wu3-20020a170906eec300b00a51c84bf17bmr7285354ejb.69.1713182506478; Mon, 15
 Apr 2024 05:01:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240415100713.483399-1-colin.i.king@gmail.com>
In-Reply-To: <20240415100713.483399-1-colin.i.king@gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 15 Apr 2024 20:01:09 +0800
Message-ID: <CAL+tcoBO2SPNYE+oRSkqk+YWRK0OiG5xj3uNZ448-AWMsG1A0g@mail.gmail.com>
Subject: Re: [PATCH][next] net/handshake: remove redundant assignment to
 variable ret
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Chuck Lever <chuck.lever@oracle.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 6:08=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> The variable is being assigned an value and then is being re-assigned
> a new value in the next statement. The assignment is redundant and can
> be removed.
>
> Cleans up clang scan build warning:
> net/handshake/tlshd.c:216:2: warning: Value stored to 'ret' is never
> read [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>

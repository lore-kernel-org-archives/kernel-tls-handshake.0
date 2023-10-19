Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8610139D
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 19 Oct 2023 13:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b="H6FTMP0p"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-7ab4c86eeb0so3055962241.2
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 19 Oct 2023 06:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1697722614; x=1698327414; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsFML12RHJnOHfkSBiU6dzKYQ/8Nst4lG6vD/F4MSTM=;
        b=H6FTMP0pWaM8cL1z2GbYOP0Ro6JE1GLG1aAqbNP8Mw9otqetKr6nF970IRycKVjfno
         2BjqBym0pQOcsq0axuXVyobNXsqyXNOUTJVOEb80PXTqf7dpBmZYuteAi9RDkOwXZ5Vs
         YsDeU4uwNimmh+WfG+Lo30FqRX/9OlvhEqU8eU8EvYPjrzMvKVbBxPhaZ71SlWs7f7Jk
         0zmQ0SPmTFjzOQZbuSC6jxPNqjOdWdsjUpZFRAbioHSHESXPlEqTpQ91U0IOcGTh63TV
         //G9EjE/jmMzYEnMSV+sG/GkgFKsUJbNnOo5YsQkSOOtawsc60zzL8A5h00RiaHMdRqR
         857w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697722614; x=1698327414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsFML12RHJnOHfkSBiU6dzKYQ/8Nst4lG6vD/F4MSTM=;
        b=Hq/hvQAOzjt4SdUF+kVohFaq6Y7HoM1FbwTczc6oFexUhjKuIMaR7drkjW3pyMaLvh
         iYhcaMcj0YJMucNc0iHGbOWSWmmFjuPAuopXnSokG4qtvxRam70d8J5EMQqDjJbljcbr
         MmowuPitOJ4JWR1JK339kxYlecVSPamGIpr2cSf3EwM91+WwwI4C9ojm0+bK5wEztrMx
         tiyW7hEi8xZ82uv3dPedpvyXgWtHGKjmD+jXYtEpKRXoA5hCsQONZSmuP4sdGpdukFkN
         lzX1Ucr0dpI9UVozLoW9mvD3FGjCPTrPSheJemje/CNowH+kkl6/N4RP5wj+3EZwU82v
         qnfQ==
X-Gm-Message-State: AOJu0YyZv9Jp5OfxjctocDfqYiGrLM1HX5pnVI/vxD0FABGCz/Q2JBy9
	gXSFWQOaTj4lBXVFINPhOBVEQFrTzthpB4B3V9pCqA==
X-Google-Smtp-Source: AGHT+IF9qEMTK3Cq0qn/2zsXc0jRLIf65Pa8o2bb6aXKmDlqkmaMThCy3c4XXGmo1fYPHHdp3TyySxIbp9Dctp6RrpM=
X-Received: by 2002:a67:b242:0:b0:452:6ac0:ed19 with SMTP id
 s2-20020a67b242000000b004526ac0ed19mr2125923vsh.31.1697722613710; Thu, 19 Oct
 2023 06:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231019125847.276443-1-moritz.wanzenboeck@linbit.com> <15f85fca-54bc-46c6-b016-0d1761052fe4@suse.de>
In-Reply-To: <15f85fca-54bc-46c6-b016-0d1761052fe4@suse.de>
From: =?UTF-8?Q?Moritz_Wanzenb=C3=B6ck?= <moritz.wanzenboeck@linbit.com>
Date: Thu, 19 Oct 2023 15:36:41 +0200
Message-ID: <CAKnz9xJzjpLgZLVZR+LVhrHFQn=utFoZRUrUyowZzKZ=YXhWbQ@mail.gmail.com>
Subject: Re: [PATCH] net/handshake: fix file ref count in handshake_nl_accept_doit()
To: Hannes Reinecke <hare@suse.de>
Cc: netdev@vger.kernel.org, kernel-tls-handshake@lists.linux.dev, 
	chuck.lever@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 3:06=E2=80=AFPM Hannes Reinecke <hare@suse.de> wrot=
e:
>
> ??
> You sure this works?
> With this patch 'fd' won't be available during the 'hp_accept' call,
> but I thought that we might want to read from the socket here.
> Hmm?

Yes, this works. 'hp_accept' only constructs the netlink message for
user space, so it only needs 'fd' for its integer value.

Regards,
Moritz

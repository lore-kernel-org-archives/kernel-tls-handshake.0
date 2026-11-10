Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794329881;
	b=0W5OWm5wDaa7kbFYdtPDGskwnGkSupjhChS9ypVh+N9gTwRufXCRr1eRxQjwhzGLqZmj
	 qs3UfJT8KXcHgpAJIDyUuJh8yvJek5oc9jUL8RfWmqIUxNOt+HAMAmQmnbKFfXs42Xigq
	 1jRHEGC2/uicnUUFDphiIEB8Qr3ROghToYzhQtney4gG6bqAjA8cPqGBKwayexWqDft2/
	 v/Lkjt98Qq9Ctr/e86AzT/d/HIbLXtBjysn+3sJlJCPB9v7ZuYS50VU+kHCIZiMiqIXFh
	 nr4ppHiQTEC3Zd3OyF3D07mjiywfEVCL0Ymw3Lc7sU68+eF7qUkuJsPLyuPOl201TBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1HlRMg2f8VT1EI4K27T8+cqMdE7ojzLtyN9VMRiohws=;
	b=BQGWZdh2r11y5lQM6ijJtnAzzji6xhHe+jQ+cfheuttmKho+HrhY1CAmchfv7PfOTEe2
	 Tw04t7axdo4UW+vtGQSE+m/saPQiiFHS7yrCD0sA5W6ABSLpSsYSabNXLyZgdyi4TaMum
	 etg9pxNR6J55ZvVIhXNo+x+McdipSvO/wdFqW9FjhvRTiIehXltoFVUB8y+jb6dtIyXqn
	 dFhh5qyKH1/ll33KGYwqWfq/ugmnBIoTUsZ5vH5jHbcUab9TYFqbQhHQEBDsMGTNNyOIf
	 h+J+rDZ0XIlsguvsRYU97losfYpFhrSl+/XhgIH9X7wtlk3olAi5gjeb2daWdC0ynsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nE5dO+oz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFE8606A9DA
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Nov 2026 16:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDFE8606A9DA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nE5dO+oz
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb684859cbso1316044a12.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Nov 2026 08:58:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794329880; cv=none;
        d=google.com; s=arc-20260327;
        b=AaKHCimdpQOZeswe6RR0uxmxFtNQEInBZDnGvWQlpzY3uMIHJB/ZAJtzTNOgWnxiCQ
         rrLZZUlivu8xirzcA8q6SnaPrO8kADSyYvwwdU4jaSeNZoXEV1C6nDxx5DGuHYgUtyA8
         867VW4/K3gFeDW8wPSpccsOegJwk/UHQJjbQrnKn+N2UZN6LABjdjK/x7FkoA69Q3pZo
         5yHADrgdNId2GMdzRp19OeDgZ8uTsaliIy42BmlCz7Z6AfUm+YkSHCKgu6nbY3BC93UT
         cZ3z/MUJS8IEJMSs+iE4BwkbKRKN37E7ak5x6SsSaexzwBR1VGcecNydBHNwY8rgRV3+
         OLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1HlRMg2f8VT1EI4K27T8+cqMdE7ojzLtyN9VMRiohws=;
        fh=yZOSJUpQks7qfQ1nyj9A7bVNQrn+7HuWRlg6j3WISSA=;
        b=HXeiNefqZOa/uctDxT+QwkMJ4oxJGuEaDFkdWygojSQCCBMVioG2S2s/MpzyzV1kMU
         hYTiRa0pezvkke5EJ2j+tuA4dNq6HJdtotea2JCci987b4K2oUpSR7oSjWhkGEdGT7Wy
         uQLkjOGBkRAwxDftM8NQXHhmGwvd11GeUc9fr5dkTh8pvBd5KKY4IflXIv8L0SVRBkls
         gv2qj1Go5xqAn/IRaZnZv3lMNVLBD8WlJuZnCAeaqaY7rLouwTNfYXV0rmjNLVXAouny
         1UcRyZWDZwv3ekFerRPECumhFAGHfKB/8La63xT8puwMUAiER+QkP52mG1ve7HuJ4oJx
         pRhA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329880; x=1794934680; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1HlRMg2f8VT1EI4K27T8+cqMdE7ojzLtyN9VMRiohws=;
        b=nE5dO+oz2SjMOTcGClTOwDiUjsXlx3ZZ7goQY6AUyMWzKOZEfJq9J4TH4YTo9FASUF
         fxqxQZsS9tkmb8RRM5FyGZt9NdR2u5W8+NtDKfC0MgcBUG7t6lgylOCWfecjddIGkCbe
         m2J4BuMRvtZ+b1D0lVvSbSg+ZPUVjzCxfP7GkcILO8oAxU6OAvklfhzzWq2G+0coy2d0
         UeCp/50yODViuBZaxlvUzBZKki40oP7lkB1ynkauoY/ejQB6TCGmE8DS+8wL0nYUU+Ak
         wvAD9yN7W2r9yq6ECz1nH1Ep8lOokYk+Du57bsBhV6Orcmp1++2Xdi+wlhT0DLd06kKT
         r+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329880; x=1794934680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1HlRMg2f8VT1EI4K27T8+cqMdE7ojzLtyN9VMRiohws=;
        b=LeyquLaXAwoDUSZ88Qm/AeW7RMBPs0Q7E/G7zuXTiivGI4vuMmpIW1+52fIU6R3gUd
         a6ggpwLTKP/XQeK2AzEcUFJVxhIhCYGXdeFpH0ua0mDVSq0gZLA2iNd/IzLzLiZ9hoUp
         /6vJ4OA46Y9NMwx5zeCMPa6pGJ8oiS259L5gsWEej9Sd4QvnXscpg6FbtLWAFdtBCNAe
         uaAwrPkLpdVDElU9v/W7w6UCOe+RzXg9qKgEQbXC7W9DnugsgrElRGWcHN9LK7H1bNby
         2ubJ54NZVj8wBGerbRCnU5odDIwSm0WfEsVQgh8TDsVOYSm7RzSfteG08hISO49OEC9k
         fRGA==
X-Forwarded-Encrypted: i=1; AL+hErFiBS6GWljeakFQxnxhMBhKQrRkU68IMyAOVbtaWrxod2Fh49gHlAW7F2AGaGOt7YJZRp28XjRuHyo4tSKB1dLFJC13Zw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8qq8D0QXk6RcFx/qbNQlSS8ie2KtGXucahWJ0y/djqzmWdUBm0
	He4hFGHR6aFig3v25N8wBphnA4kjZN0ZQiM8h29gvaDYtwZhjeRBTJAeWi5HOd+SMDrt118yWut
	/H7rFUHAihRfsejREA1Q/kcB0ln39usU=
X-Gm-Gg: AYBFou0PQVcaMx8Xe+8jzCgaCRW5Fvngpbwei9bi5mBEJnkgm86WJEBbp7wRTyRcLcI
	NAHOz/nxgWUTfIpWjxADxiatwRQbWs9dphGJF+1F0PMbKCoiF/KFisM8lLmSuf7qbPnX8yxnVD1
	BkCXQYjbXmVCnViEABVdXc6I/DyoTX9tvj2QGdK731X/I3//YBpA2PRYxXXtoOFfrjI1Rg1OZ5p
	+RurPgCH9D1+PO7pQcN8LaxTjLY9RxoJEU42NX/kJj2apqnUOtKtx8LOFsoMa6BanAzP8F4pMBI
	n7wI4c5dGAz80gKo0nwe4LlWGM3/trQwbbPT9NnbkZIVmAe2RfjKyIAUCJbjbUQEDps41iFZdah
	qjvt1JGg7X8Ri5LnjddeDFOKBiYR6Zgj60cVBREmSB+GM/3Ud89Art4NnFhFV7lG8XPMAdf6C7R
	ZEfVA+qfYOUtQSD+ohZtAbushlx2MryNhOz2QlxA==
X-Received: by 2002:a05:6a21:4d92:b0:3eb:292d:6667 with SMTP id
 adf61e73a8af0-3f18fc7916bmr3102272637.45.1794329880120; Tue, 10 Nov 2026
 08:58:00 -0800 (PST)
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1794241654.git.lucien.xin@gmail.com> <20261110074153.4b895bb6@kernel.org>
In-Reply-To: <20261110074153.4b895bb6@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 10 Nov 2026 11:57:48 -0500
X-Gm-Features: AclHuK_HpW_I6LMxVTgDVIWnA6pZgPm7vgrtWceSe67s1c1ZnBXYAOFgqXCnPVE
Message-ID: <CADvbK_e3aoDOyk3hbPtS8pk3U0QSiLtYafpH2oaoNbbR9mV9aw@mail.gmail.com>
Subject: Re: [PATCH net-next v18 00/15] net: introduce QUIC infrastructure and
 core subcomponents
To: Jakub Kicinski <kuba@kernel.org>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Paulo Alcantara <pc@manguebit.org>, Namjae Jeon <linkinjeon@kernel.org>, Tom Talpey <tom@talpey.com>, 
	kernel-tls-handshake@lists.linux.dev, Chuck Lever <cel@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	mef@scarletmail.rutgers.edu, paul@jakma.org, 
	Kuniyuki Iwashima <kuniyu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:42=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Mon,  9 Nov 2026 11:27:21 -0500 Xin Long wrote:
> > The QUIC protocol, defined in RFC 9000, is a secure, multiplexed transp=
ort
> > built on top of UDP. It enables low-latency connection establishment,
> > stream-based communication with flow control, and supports connection
> > migration across network paths, while ensuring confidentiality, integri=
ty,
> > and availability.
>
> coccicheck says:
>
> v:250:19-25: ERROR: invalid reference to the index variable of the iterat=
or on line 241
> net/quic/connid.c:252:16-22: ERROR: invalid reference to the index variab=
le of the iterator on line 241
> --
> pw-bot: cr

This is a code pattern concern, not a real bug though, as the use_count <=
=3D 1
check guarantees the loop always hits break.

Thanks.

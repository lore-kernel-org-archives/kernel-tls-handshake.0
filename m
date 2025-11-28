Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0698A2C0F95
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 28 Nov 2025 22:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764368504; cv=none; b=FvUWikW8lVyb/FeWek30DAUDwKj39dcUXQYt4X75h4c9CAlbxVdpRbkeVAhG1wSzK0ipQ9LDpF+d7szf3fphB0+oEnAdSfJSdwlrv1fcDOfySGe9nN3Rondqfdwz0XlppWTQy6bDiaOiBYF6EWG9LTtejU4A1K4O5623izYP2Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764368504; c=relaxed/simple;
	bh=SQTVp2Fzpk0NoZcAVL+rErGbsCS+UUMcmvwU/jMKSLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p7ASQQOLbpy6KfITAmfdrj16icIMYqVv0GwnihiNJ8o5KX8Cya4ey4JhjIOSvpivRNnpfpu2T5Iqs6BOyCYNVwXOdkT99REcOZT0erthPhFmRn5C0mnq672XVxL6tyYWAiSOI/LUiZ91Ah1NAgvM7FzitLCKFa4vwFIgZnOWQeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2p3tcnT; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2p3tcnT"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3418ac74bffso1453026a91.1
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 28 Nov 2025 14:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764368502; x=1764973302; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P18mAZ1MqIvbh3CmMm45KSEcmyyptIsJafX5Z8hVww=;
        b=K2p3tcnTe0H1kRwIWcv5iw2jVezYF4C0y1/sfWt52AwoGjK5U9beW22nuV5CuFTTiy
         VeliB/qDJYrICeIQLckx1oTnIP4aKvgGa1Pg1r7a9qx1RMhKTBuOjTMt7XzHQwTboNA9
         8FaKICfbpUkYhsPtn9nsYNoKWnudUl0U/Dw/mfMypcJSPDJvc6EItFsTWhT/HTn7PPWa
         3WUdLM65E3XFpFOSMDt0RMoKT46THTo+E+pI5V9zmeEI0lKOPtbEEgLKMy5OQLFEU5n3
         ssKXJygus3iR88NZAZTacjlzYcnD7R+WdYj8wJWHItpvx9DfL4eh9RQ/vfYQZugAUllV
         G6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764368502; x=1764973302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6P18mAZ1MqIvbh3CmMm45KSEcmyyptIsJafX5Z8hVww=;
        b=r1XSKUDQxKdgqYDW8DeUbwgKGaLk7iSO6AxlwcrumLzqg3ue0gPgWWlYmsTBF0ZRYH
         sTK7O3nBoIROYcMjgG2+uhSeZDaeEt/0l/oBpMcrJxDBXLJAUFWgSXgfsxuOIJtySFxr
         Pz2JZMLy0QLDdv+4bnknxlv6ZOD//zIr1+Lb1w+lc2ZOYukpsXB51QEsZ8o9e1NevNpF
         y+O1RLAnh9sYBeGnC3UWkvTJ94iy2Fxzfx4/ChzD0+0hb/cyRg9Eat4WYhuTnJL60kAZ
         Eu7l8dWUfO9E1Fnce3WTXcvL/36Pyyw3cTNgJMvrrTEe9xekB7lPPHx2aVAVFRUauSCa
         soyA==
X-Forwarded-Encrypted: i=1; AJvYcCWgfgDl5KMd4IHBetPCo0j1WSaGLXwZchdbKaJAhvPKz1nEqju1QYzinic/wlsCOqM8WZxrv1r529qtJyYKyD4c/4+Llg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIdCqzeagkOVtFyysMMZ9xuxqhZ286YT4GV4y4JGBdfqTTl4RY
	DI8cdg4gBnf1Kg/y7d0yZyD80hWqH+aV7mVO0lGG555HxYaMW3hbzSq6jpD88Xy0BYAMoIhEVzM
	/QxpJVv3zQyV9VI9HeM7slTMsj0sThD8=
X-Gm-Gg: ASbGncvLSYuFD/jFBUWoxzf7a6nJfXfhH2r4jJ4J0ePUo41Lnns5HjUTNIcqQBnoff9
	j7VV10ES0ZgjvL68Is3MOsLJWf/7MnbcMEakYm2kLs0GyKzLcZaLVAoZlvnoRouob5PEowqZlUW
	etrVpOAjGMb8rpdVbFmCV6M+wHq8ZwTosoQOgyvHdS89Bw4dfYAj1NDywn9i4+8x5d4Hiq93lwo
	h1x4NQGE4reUAJHj3xYK8LktWQl7FH38+ejya3NZgD0ix70Rsccr45BXqZ0uSqGWbZOwJ4ke8De
	SxDwjll9
X-Google-Smtp-Source: AGHT+IGouVmSRU2+5FPtU7PZ4bxQ1L1TS/rzuH0An62oT/VAqyxTOEwsLF/KPWgDyeqL2eIE6oHNOz0m/r6ekRLZB7U=
X-Received: by 2002:a17:90b:3b41:b0:340:be44:dd11 with SMTP id
 98e67ed59e1d1-3475ed6944amr17150643a91.27.1764368502014; Fri, 28 Nov 2025
 14:21:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1763994509.git.lucien.xin@gmail.com> <20251127183008.5ee6757f@kernel.org>
In-Reply-To: <20251127183008.5ee6757f@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 28 Nov 2025 17:21:30 -0500
X-Gm-Features: AWmQ_blWIFPPlXbZwBvgkwqvDmPpeWwfQI3WVoQuGLEtMYmvXkBsPdiaHSosH1o
Message-ID: <CADvbK_crxSB+TwDgEtjV6TUEeO9VYtsE6rqy7L_=rzoDrCfORQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/16] net: introduce QUIC infrastructure and
 core subcomponents
To: Jakub Kicinski <kuba@kernel.org>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, Alexander Aring <aahringo@redhat.com>, 
	David Howells <dhowells@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, 
	John Ericson <mail@johnericson.me>, Cong Wang <xiyou.wangcong@gmail.com>, 
	"D . Wythe" <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>, 
	illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 9:30=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 24 Nov 2025 09:28:13 -0500 Xin Long wrote:
> > The QUIC protocol, defined in RFC 9000, is a secure, multiplexed transp=
ort
> > built on top of UDP. It enables low-latency connection establishment,
> > stream-based communication with flow control, and supports connection
> > migration across network paths, while ensuring confidentiality, integri=
ty,
> > and availability.
>
> Please look thru the Claude review and address the legit complaints:
>
> https://netdev-ai.bots.linux.dev/ai-review.html?id=3D8ac157b3-6222-4e89-a=
c52-28e4ca52d6c4
>
> If the tool is confused but not in an dumb way - it may be worth adding
> a relevant comment or info in the commit message. Otherwise a note under
> --- would be appreciated to avoid maintainers having to re-check the
> comments you already considered and disproved.
Thanks for the link.

I just went through the tool=E2=80=99s report. It found one real issue in
quic_packet_backlog_work(), which I=E2=80=99ll fix. The other items aren=E2=
=80=99t
actual problems, and I=E2=80=99ll add some inline comments or --- notes to
explain them.

>
> Thanks for adding the MAINTAINERS entry, two notes on that:
>  - the entries must be sorted, so you need to move it down under Q
>    instead of putting it next to SCTP
>  - you seem to have copy/pasted the uAPI path for SCTP to the entry
>    instead of QUIC ;)
You're right, thanks!

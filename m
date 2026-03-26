Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A2313D51E
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 26 Mar 2026 21:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774561746; cv=pass; b=Cc3PwkcX52+3JTUqvatjhtt/ZZBQLU5RjJT9pFGq4OUNZ9ihJcxhSO1fy7fqrV4M2GXWyIua8Mt992Z8MLojDr3mys9BhONpWe9Crybyfo2jQv1Jf2feMyqezRrJQj97UPDF6irmYQSJ/98G+8YBt4LFv/mrjwreRviowInHIMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774561746; c=relaxed/simple;
	bh=DWb6NDjjhzhDkeF+RBAi3Ju2eFdvktKCdBS03nVrDeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKfecxS/ZQu15LA8oCbdYDeCMomooloLp7KZHpeXnfuP9jziXd4jFyOkt7MTH9lBAXrZcUBExlNRUH8UNwY99JKEhIJnoK1mfo3fdWyGA6C4fQY9128rMU5Lb81uIVuW0MhTcwmbh0MUGBeSvElMwbiwfb0u7XcHZ7FjDkFnwa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnbc/B5v; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnbc/B5v"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82c2239140aso598007b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 26 Mar 2026 14:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774561743; cv=none;
        d=google.com; s=arc-20240605;
        b=NYVAkyEW6i7LoPd8lnCU97/DCrDhrqxr/H4zHBBOkzI+a85p6rlUSRGRISjBhwGYQZ
         aPpbJ1zjpy+3ls25uX3vbmi+1NqhGK1JH/EjQxb8F7y7I237R/8wp3B4+Zbaoso/triz
         SS/bmUUal/1x53OnwxZU/gmD97n2nGcWQbUhp4bkhzLZrwWCrW3dap22C+VHSQpp+8g9
         9dWQs12hrYx1hH4wsVczeXzMmUebGVXs2afUDZaJNuiMTx3LctGeqU0e5wjzMmZLgkVh
         1d9wt6BduxrrZtfqOI51ztU9+ruav/QpoMNnSRU4ETuvgAbEd87b6kQl91jYwBj/JCJf
         qy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LcNk0BhBpunqYjg8xevwO9GWhKeqxSm/v/1iUobDQcs=;
        fh=+xSxbFvTn/ssLxh3E2V7DJrGJwk2rILormP4I0gXzXI=;
        b=ei/0vU3gPLpMGhgY4PWfYg0xPmxyg5Joj2hjftzPfcXaaLHh+2Xayg/xs1Nc+VFL+C
         NorX5ydcTTkJ7vzP/tunS/LmksDdKnaubBNMv+k4hUP9B6CRT8TMFlt+SFEF0P8aELQ3
         TGTWBJFh4+4T5Yx+Yt37SXYIDxSDcKJscDLsI1Zk7pGf64SiBHHJ8XOgYUtg8LsK/cCz
         5RrBZo4rmRy5rR7ZFOAXywoVD2Y//YbgZc5cBgtAHTcYg59llJ8Li8hmUNgl6DnmYsg7
         Y5d/mEjDPFDm1ctwXsOTU85CpbTZkS58W9lN07jP5HcTiUWI8SAuCvK9wVku/2fWi0lI
         QKew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774561743; x=1775166543; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcNk0BhBpunqYjg8xevwO9GWhKeqxSm/v/1iUobDQcs=;
        b=qnbc/B5vZ+/kqZjDVnAdaKHWt8cmfGE5h7KyfxX11i8bcYUdPWNJgujGD3Nw8Suz/0
         ZKJw7It82py7ldkLnMNG+2QovUVkFGLBG+Kv7i5CjwP7/d5ErKnWEuUH3FQYLLwG4Tok
         JBVjyQcP6Z22ul/Lw0yotCnH6U24X/Wx63lJlr8A39EKzVqqYkiTuIZuJUBFvb5BXneC
         UFzj3MW978foTTTRHHahIbFPY4BLfNIvOVx7eOnmOQIZMdiBvp9dRFUs7akbqG6F50v+
         t/pj+WSYRuPaVy5FhyVJpcKPR2yk6BJxg59jnnstLB7dDTmDW/Q7vyC9ofcnrNshyO1F
         bmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774561743; x=1775166543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LcNk0BhBpunqYjg8xevwO9GWhKeqxSm/v/1iUobDQcs=;
        b=iUGs1dbJIkLZy0qqaOFhLHaB6ah9VOkB7aBTn7ChVUexEqz0xQewFhosGTbQtMtfr5
         nXQGDZqIjhLgIpgh6dt0XlBax5X+bOt4TY77uVp3cYYNqZZ3OhgoJvo+Uv/DptR2cFYk
         SoytE36/mPStBnTKblfl4EqMw42iQDSjZ/HWFNIRVVq/phXsClUjNXYeo60Fo6PMOMpj
         ujKKJwDwtXW1WwBIaERq8pt8zHazpWSi0DlsaxSm4EZl9QguAz98EiqHlyCUoDVWiKiK
         DYK8ywfhzwMj+BA2QSk0p369vqpOcliiPEZz7M9AVYkxpS3fgVRieJp5NDpEbX3kNxgx
         o0Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVXoUjqgLguEaJBMtd8OTMq02qRmrRRPnQ2Fo87Vq4dTPMuIhkP6fKm6KQU4ouXTIG6HPdDCRFsz/TVNse9zJk2lrDsmg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDsGRI9DuIBVy66Cgd13wUd/n8F5dQ0U2lKt0/3+e+E0+EC2f7
	AKlxYWiaquQWm2VSV7Af0mggAcYcqopQ3bTVJygwQ3GSKQkc+76CxrFHJNLjVFRSnVGkoaqVLyi
	uKEi5l5xjWe8096jLcznGp4w9XYsCLe8=
X-Gm-Gg: ATEYQzwDZql0h6x0x4wuN8T0b/C/0MbIxtHss+ws07P3YgungmlyNkXRrwFrwxpfcho
	SV5EPjYPPzpEVta2cRAJ+o3uKVE18L1FCOiSF5JRSLtbuDnM6zixjUGU8Izb8aqkkpa3oeJd4y+
	wynekf8kvqX/54+1VlPQHglli6F5EhYD5Lpie1F+utR1FPnVDasN/rn8O0Q9VZR9jF3d6lfx+NB
	98xvfpobGdM9O34t94nZcVQMN3jGDSH4f2ZGyWJgx1R+95aBIyn79mcfYmdIB/GHXcJJGNw/IU6
	0DyC+M9SN3+PY54ua2pqH1UJEqToUv9PbxBZjHJwSHr4OKx1T057JWYZimo2WTL9zwf+RPjMCH2
	PkXj23NCSeRhcyr4qiEbHPFr8/+7yQjL1Ggkiw7Q=
X-Received: by 2002:a05:6a00:148d:b0:81f:394a:4897 with SMTP id
 d2e1a72fcca58-82c96085fcdmr56960b3a.44.1774561743007; Thu, 26 Mar 2026
 14:49:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1774410440.git.lucien.xin@gmail.com> <91c6fd0a44eb15a98f945171ead8062badb89a60.1774410440.git.lucien.xin@gmail.com>
 <CADvbK_eXUfnGGQgGc_k-ecCW3-Co1MpGb7UvMgLonPy3HRhyFA@mail.gmail.com> <20260326130740.74b4c92f@kernel.org>
In-Reply-To: <20260326130740.74b4c92f@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 26 Mar 2026 17:48:51 -0400
X-Gm-Features: AQROBzAemDJ3qW1z4xWRURYJNQELd9N64vs5NQq1QodH8yfoSs3wYDdFxRVPhko
Message-ID: <CADvbK_eyNtAfA=JPR5Y4arFLPpkWMs8io=TO83rHAa-JJkhdAA@mail.gmail.com>
Subject: Re: [PATCH net-next v11 06/15] quic: add stream management
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
	Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	"Marc E . Fiuczynski" <marc@fiuczynski.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 4:07=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 26 Mar 2026 11:06:26 -0400 Xin Long wrote:
> > The AI report on
> >
> >   https://netdev-ai.bots.linux.dev/ai-review.html?id=3D1624d906-c0b6-4e=
12-a63f-5cbfc51b660e#patch-5
> >
> > is false positive.
> >
> > As the sk_alloc() calls sk_prot_alloc() with __GFP_ZERO, and the stream=
s->head
> > is always initialized to NULL.
>
> Can you also check the google one?
>
> https://sashiko.dev/#/patchset/4019cfba3ffd6f91aee24713d2adc778f858b4c4.1=
774410440.git.lucien.xin@gmail.com

Will do. There are quite a few reports, and it may take me some time
to review them all carefully.

BTW, what's the workflow for the Google AI feedback? should I reply to
each item in this thread like we did with Claude one, or is there a
different workflow?

Thanks.

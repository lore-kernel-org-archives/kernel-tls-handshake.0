Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AC485C4A
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 13 Nov 2025 02:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763000208; cv=none; b=g5KNYAqUEhqasv55dn4QKetuiQz6cSJ451+fJGdKNsylo3tlJBfs1oQXwb3NVhLj/URfpihDCYhZQx9uNYoSciYYdgrOZqCE+lDYC1UBDAp+8+fithkto8ZfIqd0/RI/4RlDcnskEE3r2Qnwc2VQe5CWIJ47KRakQyp9uI7vag4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763000208; c=relaxed/simple;
	bh=ZRaD/fmerrjCeoqkuiGO/IO5MiZ5XDL7oIGJfPfg9Ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IdKtqfZ1SozXcmioODdU5bIkvt5wlrFFe0SeSnMzGs0QyLtCNWw5UD+w6OH4kh3Eg5u7BgevAGmuAwVlhSUMN4E25hwOsjDnEGq+5NsJpCMSeAYkeYqcZSmuviCk6MC8sb7lv3t0rlNviN//d6SCDKS6TlYiz6hz4x8idwUiVoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQEdpp8l; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQEdpp8l"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7866bca6765so3217487b3.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 12 Nov 2025 18:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763000206; x=1763605006; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRaD/fmerrjCeoqkuiGO/IO5MiZ5XDL7oIGJfPfg9Ao=;
        b=kQEdpp8lneyTo7CkZqiiJdO2trk1NzYBkJrZmNsjBJe0N0EmRvpMwCW6YvtjEfWNfA
         oRz6Fm1OaMp4K2MBZxCYGIIlfLoGhwr4WsQwWZ+gp6YEHoxVN1AH4BghB5on14HRQRzw
         zdYYUttMPRMV4XDjd9mnAn2doGSMr5Rpi92Udg5BWSS1zgu7xqvhD5qSZ1KtOHWStKzD
         T5x5BHPtU/oFn3CwEfRzaQOneu3FkfNpnBQAJJv837n3neTMJUakZWhri85ivE6SNp1e
         F9biUkcrYTwF+zQbd40gLR1nUrfZm/8Jdq7IlgnO1lvAW9IeIAFlGFrTlc6L/rRFkuB7
         J8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763000206; x=1763605006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZRaD/fmerrjCeoqkuiGO/IO5MiZ5XDL7oIGJfPfg9Ao=;
        b=jxOFwDiPFQxwkwOUJF6FU5SwbMleksMVBsJRFn7ZUWdG1QXfXxUEZ9U4U/eqsxWow9
         tvwPoxa8TzROQRF0KfhES/w5/6g+aeKbvRfZdt+MK8I+xzV/o9DD7RKhk0yMoarV4kXA
         n2mDaLPl5R174VzCKL2C6Z52ztMA24x8p3nhh4301WvGUo3mLwsZbwTMBXGOuvL1/ZCG
         P3edIhygNfQS40s22Qi33k7xWOhdlf17DSIOy3nxBqCvU/dO0bRT888wLbI1XU9Wv7e8
         6bY5418VeLcqXGh87qIy4WWDxYrGarZbCvxdJ5WAtd4+cuKFx1AA5tYU1UreEqfmFV5r
         CLqg==
X-Forwarded-Encrypted: i=1; AJvYcCXg1JDyn1Kh6MQE1f21PQKkRnry0kgC/H3XBZeTmx//FRcOhTTtGW1pNA6PpP1yBjX70nj6L8brR7ooZCX4td+lHLybuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjXeelw4lFkzRPlvewUymO1I/Ve03/kFGxns1rlkQNXE/Iw0Qs
	UGdMo0f1ItAksKy2eTZ7N242k2wOkvMkgSs1njmV/HkV9kXmYCwqsLZLZmUSmKqKBQsMN5WXbGb
	T5G7VZDtaeYZmW8uRwJ3+olJMjATUxi8=
X-Gm-Gg: ASbGncvt32LohomdQCx9GxVN4d4gZ/vqzrnS+wvZzepFP6C0qtMSVJv+isxkL3Zgbax
	Hc1v5t+3Qur5il16Oq317MvNuxjnnGXXbckpkFxIBlwbyPgYWfsGGnY8v0vp4EevjCbuP6rzmp0
	95JdaPXjIEQp3Gv5RliTxv7WQowvNo/viAFsh/fcLMUfkgEw35r2dhH2H5TuzCT6Z7vYE/TyLaZ
	CZCrWtQ2I/FiqoVu+6cso4iaW1E4nLdIDXxeoEjPawGepVvrkKtzsnryR78tQVvArutwpfndRJg
	TfZ1PdLYaGXIih/Uj4HBIEHQzg==
X-Google-Smtp-Source: AGHT+IEoQGXbDOXpCMV0uLppel/d5OJBdh/BTOE0WrwFdCg3bNRboPUEkEHpLZDtG4hlmvXsyGaHqhvMoipnvR4oKDg=
X-Received: by 2002:a05:690c:5301:b0:787:f72d:2a57 with SMTP id
 00721157ae682-78813626ef9mr34068247b3.15.1763000205991; Wed, 12 Nov 2025
 18:16:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251112042720.3695972-1-alistair.francis@wdc.com>
 <20251112042720.3695972-5-alistair.francis@wdc.com> <3438a873-bda2-4a1c-af8c-76e31a200c79@oracle.com>
In-Reply-To: <3438a873-bda2-4a1c-af8c-76e31a200c79@oracle.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 13 Nov 2025 12:16:18 +1000
X-Gm-Features: AWmQ_bmGVjeLJyvzqCH0oIhjJJEC9KDxsd28wVqF9yRjrr2nfAiVpGZrrJdTjQw
Message-ID: <CAKmqyKOj_vB3dwy2CO2JacL-w6WSm-2HYHuikndsLfYCQvwZNA@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] net/handshake: Support KeyUpdate message types
To: Chuck Lever <chuck.lever@oracle.com>
Cc: hare@kernel.org, kernel-tls-handshake@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-nfs@vger.kernel.org, kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, 
	sagi@grimberg.me, kch@nvidia.com, hare@suse.de, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 1:49=E2=80=AFAM Chuck Lever <chuck.lever@oracle.com=
> wrote:
>
> On 11/11/25 11:27 PM, alistair23@gmail.com wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > When reporting the msg-type to userspace let's also support reporting
> > KeyUpdate events. This supports reporting a client/server event and if
> > the other side requested a KeyUpdateRequest.
> >
> > Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>
> I was not able to apply this to either v6.18-rc5, nfsd-testing, or
> netdev-next, so I can't adequately review or test it. Is this series
> available on a public git branch?

You might have missed Hanne's "nvme-tcp: Implement recvmsg() receive
flow" patch that is required, it's mentioned in the cover letter.

You can find this series, Hanne's patch, a few other patches that
are all on list and some extra patches I'm using for testing and debugging =
here:
https://github.com/alistair23/linux/tree/alistair/tls-keyupdate

Just remove the top commits from that branch to get just this series

Alistair

>

>
> --
> Chuck Lever

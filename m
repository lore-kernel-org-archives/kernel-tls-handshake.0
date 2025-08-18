Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F4E3314D5
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 18 Aug 2025 18:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755542237; cv=none; b=H5S9WXQjCBgqs6/TP5gzE47iI9lZFbHl3ks2OhuQi+vU801e4nUfhGcdxjdv2UBWOkODcXrEin/25SycJXnVQ/nxzDjk67ea/9HdsdCGh/Wy8EltPEfcYlRXQkUJXNCvAZKmb25utWLZHRC0VgLRdYMna9bxecZVzRy4NQFlTK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755542237; c=relaxed/simple;
	bh=s+h/zpdcLO2sufU3UTB1WVULDoAddfqD9Pkjy5KuALY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EpV0deYCf4KR5cq4qRUgJ3mgXDRJNKu0baCONDnkWLb1XTWk2L2xUU6dqFv6R8frFUVr0f5v9SZNI2U9JnOPt4wHXRWw6+wJZY2wXvJ8Xra1Qw0GjdCRzHo3EtH1c7SKRGP7PKNtfaoPcuOGbvbLIdeH/Mj/diK5pygBA5RFsww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghq6Ocbx; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghq6Ocbx"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3e66c013e4dso5490705ab.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 18 Aug 2025 11:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755542235; x=1756147035; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7NhKU41/8jq0SdZcC8/fNpL86G4XGs3Ymmr1MZpRjc=;
        b=ghq6OcbxK7ob4Y6k+M8DSDYFZsdptle2NjhvBNHQW6g4CTLI2gBH0hggHw5e38rrE9
         4yAIn9rAkJtKi216a7y0uMTRw6QeEqgEyHb4kv+yqiJo5y/rsKaCpjLzYMZO2zL4A6mr
         XrspbSfZdtihRd7vBgTbLvfJE8qvFT0LgXL0OQfDesnIpgyt2lWhL4J67EgaONw/dlsE
         G3QgTMPrQw9ZV3KaNDUqU1J9fDFHQZCxWYZZu1YbxDYc5VpbnCPJkTnWAL2FyGRr19B7
         +vBIZwV9cHp1jcTX9YeeqKb/cyTGrAEDZ3NC7taoU1N6HiREVPmV3SwsucGgzxA0sg8j
         Ybsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755542235; x=1756147035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l7NhKU41/8jq0SdZcC8/fNpL86G4XGs3Ymmr1MZpRjc=;
        b=iWPdQH5JLhcu9c0uFGaNYRMX09IjqjjYGL6QyXQidhlZvQIQi71feGWf/IQo5YVbPq
         OxdOQLVx4Nels2xosc+u22byiIxJReBguvvXBAzeXR29P4po+8Gol3RVPWKKK95TceGG
         tQgHKWHxPjmw2fqXGyzRD95qkR8mSsIUybD6fq8QRfFjgT6LRgfKAxG0F1/WBhSnzY0P
         lrufq9RZWt3FZR+7VLEZhL5XoW8PqJ75aTp2oTw1k6MgyaMgGJvdkq0bVDcFWlyvVmb5
         OJQYRtzGVkM5fjY9tG2Z9G7vNjnS8cqtfMqCdplN1/EztB5J3a9cItJN8B632V6KEmo/
         Iawg==
X-Forwarded-Encrypted: i=1; AJvYcCUnH3oMyM1ROVwc3ArILWENgTFjw8LyV9yPENXeECyT7tms8tra0yeqkeyn7WdB/7FyLI5lSrM/d2g9oTYnKVx2BAO2QQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRcvBh+fQjAI1mxUdcnXxM9ObRfhpkgYSs+5RtTfFFx3pYC+Zw
	V/GHWPlykO399U50jvqK5L3CIr1Pv3qcGteOIE3EYL0x9/c49B1OBj7sSvKga2oaq2fR8qOIOpm
	ACqmrlkKwrjW3QTfXQluNUKfeIbP+sbM=
X-Gm-Gg: ASbGnct4++lFnh9obrafZhM2jPVyMRVHhR0Rkp9MvA6tBt0C2dIt62AMUaXFAVG6YF0
	mx8nG5KwPjSGa0Y+sAkIrOJgKBaSqJPmQjZamTl9GUHzSQ/CoUw2yRG4eqpnIj4siPfisP8nJMA
	juQIHmpyLmN/LHJUrK8nAlPdgTUv/IoUAtJ3OtCcMbusKz4YptcA4J4KVFQfUpCdcQb+yIh4DpY
	zZKzccWwq57yeX8DOa5
X-Google-Smtp-Source: AGHT+IFp/eqRpxZrpvX0+FdFTm9XYzuEaxMNWfFdXQBOq53uvPeyc2lisbJohLLKbeqhWF3vjCt8PfLqxKmdZxE8ZEs=
X-Received: by 2002:a92:cda3:0:b0:3e5:52a3:daf9 with SMTP id
 e9e14a558f8ab-3e674fc671dmr11528635ab.2.1755542234757; Mon, 18 Aug 2025
 11:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1755525878.git.lucien.xin@gmail.com> <50eb7a8c7f567f0a87b6e11d2ad835cdbb9546b4.1755525878.git.lucien.xin@gmail.com>
 <5d5ac074-1790-410e-acf9-0e559cb7eacb@samba.org> <e4167710-3667-497b-b12e-096fd06217d9@kernel.org>
In-Reply-To: <e4167710-3667-497b-b12e-096fd06217d9@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Mon, 18 Aug 2025 14:37:03 -0400
X-Gm-Features: Ac12FXyEgNTxVIoWpY0UM5RyDGnPhjjnR1Tzf70bDhn5xnUoI_HCY-n9PLVqlRU
Message-ID: <CADvbK_dztN+x1-M6L841X-JROxrQYh=ENQJC_E1TbcPXErkHSQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Stefan Metzmacher <metze@samba.org>, network dev <netdev@vger.kernel.org>, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Moritz Buhl <mbuhl@openbsd.org>, 
	Tyler Fanelli <tfanelli@redhat.com>, Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Benjamin Coddington <bcodding@redhat.com>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 12:20=E2=80=AFPM Matthieu Baerts <matttbe@kernel.or=
g> wrote:
>
> Hi Stefan, Xin,
>
> On 18/08/2025 16:31, Stefan Metzmacher wrote:
> > Hi,
> >
> >> diff --git a/include/linux/socket.h b/include/linux/socket.h
> >> index 3b262487ec06..a7c05b064583 100644
> >> --- a/include/linux/socket.h
> >> +++ b/include/linux/socket.h
> >> @@ -386,6 +386,7 @@ struct ucred {
> >>   #define SOL_MCTP    285
> >>   #define SOL_SMC        286
> >>   #define SOL_VSOCK    287
> >> +#define SOL_QUIC    288
> >>     /* IPX options */
> >>   #define IPX_TYPE    1
> >> diff --git a/include/uapi/linux/in.h b/include/uapi/linux/in.h
> >> index ced0fc3c3aa5..34becd90d3a6 100644
> >> --- a/include/uapi/linux/in.h
> >> +++ b/include/uapi/linux/in.h
> >> @@ -85,6 +85,8 @@ enum {
> >>   #define IPPROTO_RAW        IPPROTO_RAW
> >>     IPPROTO_SMC =3D 256,        /* Shared Memory Communications       =
 */
> >>   #define IPPROTO_SMC        IPPROTO_SMC
> >> +  IPPROTO_QUIC =3D 261,        /* A UDP-Based Multiplexed and Secure
> >> Transport    */
> >> +#define IPPROTO_QUIC        IPPROTO_QUIC
> >>     IPPROTO_MPTCP =3D 262,        /* Multipath TCP connection        *=
/
> >>   #define IPPROTO_MPTCP        IPPROTO_MPTCP
> >>     IPPROTO_MAX
> >
> > Can these constants be accepted, soon?
> >
> > Samba 4.23.0 to be released early September will ship userspace code to
> > use them. It would be good to have them correct when kernel's start to
> > support this...
> >
> > It would also mean less risk for conflicting projects with the need for
> > such numbers.
> >
> > I think it's useful to use a value lower than IPPROTO_MAX, because it m=
eans
> > the kernel module can also be build against older kernels as out of tre=
e
> > module
> > and still it would be transparent for userspace consumers like samba.
> > There are hardcoded checks for IPPROTO_MAX in inet_create, inet6_create=
,
> > inet_diag_register
> > and the value of IPPROTO_MAX is 263 starting with commit
> > d25a92ccae6bed02327b63d138e12e7806830f78 in 6.11.
>
> I would also recommend not changing IPPROTO_MAX here. When IPPROTO_MAX
> got increased to 263, this caused some (small) small issues because it
> was hardcoded in some userspace code if I remember well.
>
> It is unclear why IPPROTO_QUIC is using 261 and not 257, but it should
> not make any differences I suppose.
>
I agree, it should not.

I wasn=E2=80=99t sure if any other project was using 257, so to minimize th=
e risk
of conflicts, I=E2=80=99ve been using this large value from the beginning.

> Note that for MPTCP, we picked 262, just in case the protocol number was
> limited to 8 bits, to fallback to IPPROTO_TCP: 262 & 0xFF =3D 6. At that
> time, we thought it was important, because we were the first ones to use
> a value higher than U8_MAX. At the end, it is good for new protocols,
> not to increase IPPROTO_MAX each time :)
>
Yes, this approach saves a lot of trouble for new protocols!

Thanks.

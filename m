Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FEC19EEB7
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Sep 2024 15:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981466; cv=none; b=L7Q0q06IULxctcPhGCfUYHBbt4fhjdtW35/UGvJHBXUvmeYMxVMihZtYyuNNaA/PvdMm+oMtuKMP1IaOJiKF4m9/uBU9yjqRAdD+NPEC1RxxKNrlvaTVpkn1TeSveNpmDywT177v65/X+4bGbOik4LjuRxvDlWX4bh9m4RKWRoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981466; c=relaxed/simple;
	bh=CtVMpbyC+2ZH9jfs2y9m85UM1ZQme9yQTwkbI129uEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUD8JvYzfP97JHLKDMbsCmKVRxuj2afHRS/e9wNtA+UtVAXbdpbFLVF4biCO4UqT29fVwXqIYBAGnYAW8n2F8ZJCcB7c8t3b0jD7OQKLSuCadWv/OSW/aNQzP7e4kF5uuK/1oQvxSA8gjJOyDJyu0Ai2dwGJd6iS4ExAPWSSKeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9P8hYz3; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9P8hYz3"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-39e6b1ab200so24937395ab.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Sep 2024 08:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725981464; x=1726586264; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtVMpbyC+2ZH9jfs2y9m85UM1ZQme9yQTwkbI129uEw=;
        b=Q9P8hYz3O1A7rdNkQoNxDSBld6T4f8FXseIdHCU3kOjinIOK7iUJR2X5WcwOgoxGYR
         0vx+mJkAkwj9Hc1stjrto0Cruh9M0AbVygrvEIVMMwwGWZePY5asq/oyq9a6SOIDwdav
         Au/F6LX1IouvNpP1fy6h9WpHen0so4TqRjlGV5AknorPrzrd0LnOqkd6Y0/j7isFPZi1
         N/WQioFcFNtWVLNZcbhYNghyqWDz4/sj6wCghGf82UV8QQmLNWdoalFzvJBjELuCI2ua
         Yu8ZW9n6ara40k6LiZZnno6QS5jajgLRWOcSHCGOjhEaT1NyD36Ty2jdDRQus7R/49Le
         mgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725981464; x=1726586264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CtVMpbyC+2ZH9jfs2y9m85UM1ZQme9yQTwkbI129uEw=;
        b=EkBFJ0/kec69kv40ldZPwtJyTDTEU9cwyzFXGqWsw83oF+W0a6bYbc1xogndUVwMKn
         eKhiJQ7WD3db8lbKVLzEQSChZKSPjdG0ggcxSFINPtlQ6VGCaEdnZkMYxFXXsrxOMnp3
         M+/t2PyBSqUxK/WbOyC6IbbXFBWMMKsSj7A3Q8k1/PAbbfiE3nU61ZeL7lL0y9xgO1J3
         yb/dRkzbKZkS1BuaQD8zR9+OEOBfIl8hgX8YIw1mRtKo+6zQQTDCUJbTSIKkPJr0MMT1
         +R9gtr/WklxYeSgldtILe06F61oFv2O2a/iSENEy6FD/aLZZb9RuoZz/7auBfD0pSu3A
         FgBA==
X-Forwarded-Encrypted: i=1; AJvYcCXw/lEHPiaTEYKjfUJHIithuvhgHTiz3/hpYPvMay0d4q+2LXvKjWbGqcH3MHlVHYXuB0UcjZViXUwgWgkmgxTmRK+cOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvEvOv7WzNJ3yImgVjF9IrpcZFCIf4rgrVz4nozjtk79afF+J9
	Z4KCp1PPZrrAnxvWBxZeckHhhaXKjX+wDXjrRJ6mNR+ylfyarNULZ/wzNGZ7qHUjSDy2/GP2GrR
	RYLQuP8iI8axEvMxiE9+dtir41PE=
X-Google-Smtp-Source: AGHT+IGMpF8pwgFNdIg0DWIhL+N5THv4d3T4qnz2bC0FRPgKx4X/WAIQJmiEmVJbtYHeJsk3n3iXX5Y5nm4/q6VTn6Y=
X-Received: by 2002:a05:6e02:1e03:b0:39b:4ec0:645c with SMTP id
 e9e14a558f8ab-3a04f069c70mr186495915ab.4.1725981464021; Tue, 10 Sep 2024
 08:17:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725935420.git.lucien.xin@gmail.com> <263f1674317f7e3b511bde44ae62a4ff32c2e00b.1725935420.git.lucien.xin@gmail.com>
 <98474d13-a5c3-44c3-b847-cac662affe26@linux.alibaba.com>
In-Reply-To: <98474d13-a5c3-44c3-b847-cac662affe26@linux.alibaba.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 10 Sep 2024 11:17:33 -0400
Message-ID: <CADvbK_c1ibnyFx-u+Vh2FUy7iMMo4jORrSAz2un8tWsYtKmGHg@mail.gmail.com>
Subject: Re: [PATCH net-next 3/5] net: implement QUIC protocol code in
 net/quic directory
To: "D. Wythe" <alibuda@linux.alibaba.com>
Cc: network dev <netdev@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, 
	kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>, 
	Jeff Layton <jlayton@kernel.org>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 11:30=E2=80=AFPM D. Wythe <alibuda@linux.alibaba.com=
> wrote:
>
>
>
> On 9/10/24 10:30 AM, Xin Long wrote:
> > This commit adds the initial implementation of the QUIC protocol code.
> > The new net/quic directory contains the necessary source files to
> > handle QUIC functionality within the networking subsystem:
> >
> > - protocol.c: module init/exit and family_ops for inet and inet6.
> > - socket.c: definition of functions within the 'quic_prot' struct.
> > - connid.c: management of source and dest connection IDs.
> > - stream.c: bidi/unidirectional stream handling and management.
> > - cong.c: RTT measurement and congestion control mechanisms.
> > - timer.c: definition of essential timers including RTX/PROBE/IDLE/ACK.
> > - packet.c: creation and processing of various of short/long packets.
> > - frame.c: creation and processing of diverse types of frames.
> > - crypto.c: key derivation/update and header/payload de/encryption.
> > - pnspace.c: packet number namespaces and SACK range handling.
> > - input.c: socket lookup and stream/event frames enqueuing to userspace=
.
> > - output.c: frames enqueuing for send/resend as well as acknowledgment.
> > - path.c: src/dst path management including UDP tunnels and PLPMTUD.
> > - test/unit_test.c: tests for APIs defined in some of the above files.
> > - test/sample_test.c: a sample showcasing usage from the kernel space.
> >
>
> Hi Xin,
>
> I was intended to review your implementation, but I didn't know where to
> start. All your implementations
> are in one patch, making it quite difficult to review, so I gave up. =F0=
=9F=99=81
Hi,

This is a protocol initial, and it's difficult to split it except that
I already moved these APIs related files, building configuration and
documentation. Honestly I couldn't think of a nice way to split more
that could help much for the review.

But you can try https://github.com/lxin/quic/, where you will get more
information including change history, configurations and all kinds of
tests running etc, although its first commit for the protocol initial
is kinda a big patch.

>
> I think maybe you could consider adding interoperability tests with
> other variants of QUIC implementations.
> When we were working on xquic, this helped us discover many
> implementation issues, and it might be
> beneficial for you as well.
>
> You can check it out from https://interop.seemann.io/.
As you may already see from the cover-letter, the current interoperability
tests we've done are via curl http3 over linux QUIC to connect different
http3 servers that use different QUIC implementations, which are mostly
covering handshakes and some version negotiations.

For the link shared, it does offer more coverage and it's nice to include
it in the future.

Thanks for your comment.

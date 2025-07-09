Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654422D320E
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  9 Jul 2025 14:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072793; cv=none; b=U3S8DS01XRvo1upk2wNvNbFgJ79l5cNZETK0auINz0m8d39YHyt9F+9F6r0mvreicALw2DUJkkJLzqxJuHJNza8TkKVEqG+R4a9SeM8/n3EtROula9w91WLe2iz1HmjK4xKCvHp319882SUdEHCNhqA7gN6YSiSvtj4a0htdOlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072793; c=relaxed/simple;
	bh=jPRX4Sap/8GRTBZpWK9P9CBzfDmuRAsuRNhbipq4yfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/ozXdcGsBHbgqo0EGt4qvJnriMia5V9JBL35uLdQOxn1VePYG+mk4wBxehsXsb7XolnDu1TsEgapcsGZ6GdhQEE/9oheDoNG1SANmC45+jqMbS36iG6NIGk6klnUv3X8T8siI/QyOnY4V959qsYf2NfSc3VMsyUC33ROaHEm1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ht/Rizea; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ht/Rizea"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3df303e45d3so17398125ab.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 09 Jul 2025 07:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752072791; x=1752677591; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ce1CmkYRBQVzTjh/d+4qI/RIXf7zJn+MvFyGg8G0AGA=;
        b=Ht/RizeaVS+yXqj/n80b0cHi9Am1xDjjm8r/wpxDKlbyW5+9IC3fO7zrl7NEOG52Zl
         zH8sBWNNrYm8nGhTpN8hMzpPz3Ompa8tbn9JDMs8CUY9feHTluSOV7LrIJRE9ibRskL8
         rlWP85h3UNfdcn2wV+qSdAbWhNLXFYd/LVoHNXwgWW7s2JCwU0/A9Bbi6T67XICrLBVL
         foZUVXCbn4ELUa0lSe/QXcW4aKPQGQRSc5fYLJpe4DlZlRtSPRxFRozJIaMAGnoxiqSW
         eYNDm7cTmBf9POhvwUnUdj6SMsfK27111J+3fXfBW2MCXui8uaFOx17TtFbK0TK6Q81k
         GpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752072791; x=1752677591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ce1CmkYRBQVzTjh/d+4qI/RIXf7zJn+MvFyGg8G0AGA=;
        b=W5e/ZqoD4Nvw+Qu1bEN7nXHEucZe8X1ZwxO5RT79wZZ2VRoFjSXLDbK7Q+EKyYLEJi
         Z3X/E4bY7gtS7WYfaqjcbfPh/vCnlVTeN7wKK08ZQj6C7vU7xBwe4rP42sFkEi1NvSqr
         KLiJ97sYxv6qzsbt3D7MGM2mJKHrF4vhD8ocVihn2zdBVkaESHTLWN39+ANxPKmhJUh7
         dm39rNoVtZpG0RvthvxoQM3BpQgG6WlP1njQ9X0xGC3sre7kQhL7O++9nq8agoepWjOw
         rvYwm84xFD43YZuTvmyC2oZ7ldPO3kH+73oNvfM/0DG7xsTNo2qZdITqlRXVI93hs+UQ
         76wQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5VVjDyCNETAo9XpCZnXumJ2bhb+TociXuih3RB9ymoWck8Rv1qu1+KaYk845RcsL+KaXvAZx0uqAR6CB7rFaL/tOgpA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoMoxZgMtazyMegKVeZtMJ2W7fPEQB8gD7dRZHhDAfq0Y0+bUm
	nAxLIEMbwlUpnKRlPkplhzW3NSe2Y9/50btxpbTICyII+cwPZSuD5nBQIQmC9H/cufA6ua1utLg
	AB0VmLLi2lZ3wvHAfAFu2+wqr4kN388o=
X-Gm-Gg: ASbGncsQPCZiFsYmpuFzBoa9BayGyxgHnB0OtmurK9hDwFkJufd0DfkFu03apm8oLmh
	BBtUeh69C8/l17R8x1739jeIwb5S04nS5LmHk7x2gsQtgQ4cQ6kKqmb37JCZivo7xiELnot72L7
	izR+ivogtSLkrR/rDJ5NPYFm7YlRC9P0q5hVYY1VtiCiepnZ586HRyYuLKUVj4IqCUs9QXvaMIX
	k4xUw==
X-Google-Smtp-Source: AGHT+IEz2E0d+HK64OuD1uw+y2e1HeVW68ZVG5JBVhNwb1az7fykUxkIZwtwiEUda3UIVaFQUBIAYtXACT2l3y0Ymc4=
X-Received: by 2002:a05:6e02:1c2a:b0:3dc:8b57:b76c with SMTP id
 e9e14a558f8ab-3e16702baa3mr24944315ab.9.1752072791204; Wed, 09 Jul 2025
 07:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1751743914.git.lucien.xin@gmail.com> <74b62316e4a265bf2e5c0b3cf7061b4a6fde68b1.1751743914.git.lucien.xin@gmail.com>
 <20250708073427.6ba38b45@kernel.org>
In-Reply-To: <20250708073427.6ba38b45@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 9 Jul 2025 10:52:59 -0400
X-Gm-Features: Ac12FXw4T8WkSPuPx8iY7P1m_t_n5Fw0GYfKAJYEdZpzrCcph37m-pIeEwqF1s0
Message-ID: <CADvbK_e4XvwVcGSyu64Q0bhfXvn0onnwhOvreDt=r1jYYFmU2w@mail.gmail.com>
Subject: Re: [PATCH net-next 05/15] quic: provide quic.h header files for
 kernel and userspace
To: Jakub Kicinski <kuba@kernel.org>
Cc: network dev <netdev@vger.kernel.org>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Benjamin Coddington <bcodding@redhat.com>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, Cong Wang <xiyou.wangcong@gmail.com>, 
	"D . Wythe" <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>, 
	illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 10:34=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sat,  5 Jul 2025 15:31:44 -0400 Xin Long wrote:
> > This commit adds quic.h to include/uapi/linux, providing the necessary
> > definitions for the QUIC socket API. Exporting this header allows both
> > user space applications and kernel subsystems to access QUIC-related
> > control messages, socket options, and event/notification interfaces.
> >
> > Since kernel_get/setsockopt() is no longer available to kernel consumer=
s,
> > a corresponding internal header, include/linux/quic.h, is added. This
> > provides kernel subsystems with the necessary declarations to handle
> > QUIC socket options directly.
> >
> > Detailed descriptions of these structures are available in [1], and wil=
l
> > be also provided when adding corresponding socket interfaces in the
> > later patches.
>
> Warning: net/quic/socket.c:142 No description found for return value of '=
quic_kernel_setsockopt'
> Warning: net/quic/socket.c:175 No description found for return value of '=
quic_kernel_getsockopt'
It seems kernel-doc only recognizes "Return:", I will replace "Return
values:" with it.

Thanks.

Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F6D79CF
	for <kernel-tls-handshake@lists.linux.dev>; Sat,  8 Mar 2025 00:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741394319; cv=none; b=io2Tb+0G3/GJanrt9TOMpNeqe29FscVNzDBcSTP9W6aO6wzxe32HmWQbwVDmTrjePUcc2Ko6kx5XBGlMopKpL0v7ygKrRUvLxFiJc9GqZ0HgzEvPVn7MIsOW+GY5qSJ6hwQ+zFGicLrh0xh52quAOFX3MyiJmXYspzCMNOEwxsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741394319; c=relaxed/simple;
	bh=rfOEvkpuqKHGflaRaPxkuW+mrOHN7jdwzCFozlhOXPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHaLfiQ1oAk3t8d+FF8jT+lCA53UnwyW6SGGNN3tyjuaN8mgfU+flFdYq70TnSw50mvkyqhfuPh0pdVmiCK6GvcXzsBSZLFHT42vZVvyeCUE0o2f+xBYTsy+u/E7i9RoIAaOnukmaEyruGDnDY15i75oR9HE5CI2Fk4jEAVzfsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFYKFsRm; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFYKFsRm"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d44369e87aso3731495ab.1
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 07 Mar 2025 16:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741394317; x=1741999117; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CzjouSYYDka7fRSAbop5+QmSJVI7Ib11oVwUZA5sKY=;
        b=dFYKFsRmdeZqhDarNSpGx4ic+I4NdgLhyUUhuHjZFx7jNrHRUv4b2y/rR3hKzcAiyk
         HvDElX6nc/h/zGxGj+qg+RvfvxgrlNQ95mG+2x4jrBdQsiEIsOvSSl1+eC9Mwtje+Swc
         3qnoIvXdBcxM10ODqCKg7IBJhinZOebH5bfpvztbCbw1CLH6zwQE4Zgds2J3el5iJqk/
         o55Tta68fe6ADjn6eSYBLlcw8FGRjwQmqm83TKpumxDFAy19B8W7ZB9CxNvWHwTJE4tm
         G9qI/UTVoqIuNSNfk7z3R5X7RAlIyuqzIsuuLzc1RxG63cblekkCo01raqIZeoF3yBc2
         W5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741394317; x=1741999117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CzjouSYYDka7fRSAbop5+QmSJVI7Ib11oVwUZA5sKY=;
        b=qM/zNgt//QZIU3JHJJ/uT7pYbcWrg+nzd+PZ+wCCKrTyhPK2omBXwtvA953+HSRlHK
         lCS/IBLNmVKjnikWifnSekaYqnHOqMdOKZrd6TyBx5EPOkp/uuIoYmXvZhzSt3Zh8+Rg
         4HdBY9VQmGARq4Cy9823KcqNqaFrDwHHmM8PCdW7ySyqKjkWfRn4ZzSDT2c3+yjsUY5y
         okcf9ZVS8B3/zCcJ3b05owQdsBwZ+PNRs9s9V7+pBfpQH7P0u1QIgnZCUAFQNyjLP7W3
         x6N4skEAwZjLk3WozhhES9AsR7TL8iudlhsirze9T4o8uZY5K5tIZqZUIAS3gtJiKQ9J
         vPag==
X-Forwarded-Encrypted: i=1; AJvYcCX88mr3J86Zy9kCjcRU5688HLzqMuNjSrNwf5Ac2CdWaeNGyJSWpFRAOf5MfKc77RnpSCO14mxj9C1dZqrIm9rUDQktWw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6yEhRQ/vQavuB9s6DSvNcLyccAGqFYczv5G6+DqRlwZcMhROu
	Cm7XhDjg2JOPmuweZ7QG2uBJpJ1PS9MeI1fKW2ofD2eOw6DICtQmA3pnlSxSGrlFjH/BPaSlhLD
	Pk76KAIbeEH39XwQhE8R0Fuirup8=
X-Gm-Gg: ASbGncvYrmXqvuH9AWL1wsz96Yh+8DPQRV3+UsqkyPjthmtjv3B9Kcf8HRuT25j32sq
	vGbuRLQiRNFQ+Z+14poIHSVQg5Aevi57i+teKUDo6KVBqyg0wWTVOS7gvDQevJbD/0BJIdLuEZ8
	mszzKZPAP9clFzGG6hU3Kqh9Ed/g==
X-Google-Smtp-Source: AGHT+IHYM/Qlg1nUKjuohwFX/f7a9KSc8NsEAec+iIBAQW4nFK5S/30ZBIn4+oslMC1HxbgTUT9icERNZ5V+SOHrvnQ=
X-Received: by 2002:a05:6e02:3907:b0:3d4:2acc:81fa with SMTP id
 e9e14a558f8ab-3d44ae8e21cmr16955875ab.2.1741394316774; Fri, 07 Mar 2025
 16:38:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725935420.git.lucien.xin@gmail.com> <887eb7c776b63c613c6ac270442031be95de62f8.1725935420.git.lucien.xin@gmail.com>
 <20240911170048.4f6d5bd9@kernel.org> <CADvbK_eOW2sFcedQMzqkQ7yhm--zasgVD-uNhtaWJJLS21s_aQ@mail.gmail.com>
 <53728c53-5c1a-4f5d-9862-8369e9b9d8d0@samba.org>
In-Reply-To: <53728c53-5c1a-4f5d-9862-8369e9b9d8d0@samba.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 7 Mar 2025 19:38:25 -0500
X-Gm-Features: AQ5f1Jqv40IxKhhM_ElltElLnY1_jHNT71hYZr2m5ePLJkbNDUZ9Y0WluKCsZn0
Message-ID: <CADvbK_fk=ga-i22LtLZik81S64ur8+gfrjrxAD45W9bF2Aa4gQ@mail.gmail.com>
Subject: Re: [PATCH net-next 4/5] net: integrate QUIC build configuration into
 Kconfig and Makefile
To: Stefan Metzmacher <metze@samba.org>
Cc: Jakub Kicinski <kuba@kernel.org>, network dev <netdev@vger.kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Moritz Buhl <mbuhl@openbsd.org>, 
	Tyler Fanelli <tfanelli@redhat.com>, Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, Alexander Aring <aahringo@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 9:42=E2=80=AFAM Stefan Metzmacher <metze@samba.org> =
wrote:
>
> Am 12.09.24 um 16:57 schrieb Xin Long:
> > On Wed, Sep 11, 2024 at 8:01=E2=80=AFPM Jakub Kicinski <kuba@kernel.org=
> wrote:
> >>
> >> On Mon,  9 Sep 2024 22:30:19 -0400 Xin Long wrote:
> >>> This commit introduces build configurations for QUIC within the netwo=
rking
> >>> subsystem. The Kconfig and Makefile files in the net directory are up=
dated
> >>> to include options and rules necessary for building QUIC protocol sup=
port.
> >>
> >> Don't split out trivial config changes like this, what's the point.
> >> It just make build testing harder.
> > I will move this to the Patch 3/5.
> >
> >>
> >> Speaking of which, it doesn't build on 32bit:
> >>
> >> ERROR: modpost: "__udivmoddi4" [net/quic/quic.ko] undefined!
> >> ERROR: modpost: "__umoddi3" [net/quic/quic.ko] undefined!
> >> ERROR: modpost: "__udivdi3" [net/quic/quic.ko] undefined!
> > The tests were done on x86_64, aarch64, s390x and ppc64le.
> > Sorry for missing 32bit machines.
> >
> >>
> >> If you repost before 6.12-rc1 please post as RFC, due to LPC / netconf
> >> we won't have enough time to review for 6.12 even if Linus cuts -rc8.
> > Copy that.
>
> I'm seeing some activity in https://github.com/lxin/quic/commits/main/
>
> What's the progress on upstreaming this?
>
> Any chance to get this into 6.15?
>
Hi, Stefan, thank you for reaching out.

If 6.14 is released by the end of March, net-next will be closed very soon.
I think it's very difficult to get it posted and reviewed on time.
I expected to post v3 some time in April.

Thanks.

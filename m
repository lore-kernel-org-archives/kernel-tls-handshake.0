Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857081A4F0A
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 12 Sep 2024 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726153089; cv=none; b=SIsusOIgbC95/dtgtAAGI4U48MXCq3pzTiJYze0yRq6Ekv80n6n68nHd7wZqUvGS5X2YPQ1NRAf8eSzwVobG1vJDFNuLKm+w+E+9WwDqqOkVhdldutSrd8blk0DIGvHGssdVZ55xjqflBa2dtPwWHHtXP9NF/gTvq7c2yiem2bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726153089; c=relaxed/simple;
	bh=LWN0XQ8R0ISShbSDlS7uR86bs77bzSgfW7KPVHHxvTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lp/rSwfbtzgeUK6fx3sJdOWmRm9spW/vJ2lvaA3f4S8hvmc68eXgU1p6t5UMNNtPewvTDqdpNyRn4iko0IZVwaRV/xCRbmes7fvoJmBy8RDfeEHiNqwhuZ60kE/80bkv8hgJogy8yKSEmltusdianZbs/yQAt3RVVbavuTbUIH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6DOTTrc; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6DOTTrc"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-82ceab75c27so54560439f.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 12 Sep 2024 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726153087; x=1726757887; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwSYGxGurQ2imcLaO+EzXdvdJa/BCUOpOoCzBs2qpDk=;
        b=Z6DOTTrc1HELJva4gjjhmvmeRsCic75cLS6eR5Y7h+gVNrgyyRfTdXQ7DZ8gIHVYCg
         YsR1Y4GsV616RqbCLuUuoXczyitwdxirDcGBmJxmQiO11cfrwLfIgvKrwt0Na15l+90+
         mG6+XfXDJWgeokatvwUOPbk5YUR9SWF1SibfMQ7UDMoYL55/cXjBGg73lb3T99XdhE9h
         nLusQXm1i1EA077Y4Z3E6n2/9C0viKrEnRyGSwfiAWqywvd9CzpgYPeCrHtb81GtJdK6
         FLsPl4cDx5rsMZ/rmxaEQVnOglZIY9zg2DK5hcwf8I1biQz1Ir+AfdbeWZxl+48a8Tih
         QRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726153087; x=1726757887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwSYGxGurQ2imcLaO+EzXdvdJa/BCUOpOoCzBs2qpDk=;
        b=k8u7NrXwDJ+CMJ614G1NOn1oXJ5Fl192/e+OXQP7AzL7ZqhSBTEikLqbwqOTeI5XSz
         bkrOjN3/DGcsn3gCsnR/Nlbi66h2cIx0oDPk1A/QxKBPjm+FbOdmOVfnXUmJnBu/Tzok
         WtbcXtFNh92ytDC26O9rbTdhPZNqpWRghVg/xjrAh1S0TchnMQ9AG1hyoE0gxLnhT402
         fC51ZseWx/HZ9MDwwCTnViqXjqEABgJWLQGCj02/G6WvJGYs5VPOtSkIZyaWjrekwUn2
         0iS8pJuvP5Gwbx0Rnl403xiGZ17ugZ+KwnJwNIEcTWIyO0VgnipWgbwTlDeFLIiyH64M
         hEeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrA2Q5BZpYcUH3xJcW2bu/P4yEUAmg/gHisXC79e4+3zP2wBo3Txx4X+VQCHTj7NNWvlti7NBzLZC8dsZIQs/IN7Oliw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwvnBU7DKpk3QqPMTfUId8sPp6zxB98FLb6kwNUibOVynNo1jc
	yEjTti91S3ZhAWhwTzh2wdmtXIxS05ee0MwzY7AbxHqNuuRjTO8uCwE5NE24XYIzIK0gbdSoKTy
	imD8y8dtjhkGEUmZls+YTlIjlBgE=
X-Google-Smtp-Source: AGHT+IE1dcFJmRk8rOYMkareqk7kacw/NHqgZiQNqWPZ0okhMBzgiT14nXkJ9dpmaI41l53/EODcOsso9QaC/XpE904=
X-Received: by 2002:a05:6e02:154a:b0:382:b3f8:9f72 with SMTP id
 e9e14a558f8ab-3a084909691mr33962225ab.15.1726153087339; Thu, 12 Sep 2024
 07:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725935420.git.lucien.xin@gmail.com> <887eb7c776b63c613c6ac270442031be95de62f8.1725935420.git.lucien.xin@gmail.com>
 <20240911170048.4f6d5bd9@kernel.org>
In-Reply-To: <20240911170048.4f6d5bd9@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 12 Sep 2024 10:57:56 -0400
Message-ID: <CADvbK_eOW2sFcedQMzqkQ7yhm--zasgVD-uNhtaWJJLS21s_aQ@mail.gmail.com>
Subject: Re: [PATCH net-next 4/5] net: integrate QUIC build configuration into
 Kconfig and Makefile
To: Jakub Kicinski <kuba@kernel.org>
Cc: network dev <netdev@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Moritz Buhl <mbuhl@openbsd.org>, 
	Tyler Fanelli <tfanelli@redhat.com>, Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, 
	kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>, 
	Jeff Layton <jlayton@kernel.org>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 8:01=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon,  9 Sep 2024 22:30:19 -0400 Xin Long wrote:
> > This commit introduces build configurations for QUIC within the network=
ing
> > subsystem. The Kconfig and Makefile files in the net directory are upda=
ted
> > to include options and rules necessary for building QUIC protocol suppo=
rt.
>
> Don't split out trivial config changes like this, what's the point.
> It just make build testing harder.
I will move this to the Patch 3/5.

>
> Speaking of which, it doesn't build on 32bit:
>
> ERROR: modpost: "__udivmoddi4" [net/quic/quic.ko] undefined!
> ERROR: modpost: "__umoddi3" [net/quic/quic.ko] undefined!
> ERROR: modpost: "__udivdi3" [net/quic/quic.ko] undefined!
The tests were done on x86_64, aarch64, s390x and ppc64le.
Sorry for missing 32bit machines.

>
> If you repost before 6.12-rc1 please post as RFC, due to LPC / netconf
> we won't have enough time to review for 6.12 even if Linus cuts -rc8.
Copy that.

Thanks.

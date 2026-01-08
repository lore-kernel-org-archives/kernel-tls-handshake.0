Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50C12F5A10
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  8 Jan 2026 17:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767894299; cv=none; b=FHoCBfajb3yGfXGaYZ/s2qYA31qy3gsZWFWQP+re9qod7oQGcnLuyqcuVu8w2FU3g8k3ZfBYepCjnkHzg6FdZzA+sK5z7v4O/RWlBWVd/B8OD+4p9yHqnp1Fael1MRU7kX4/r+eB/CtuCGa4j/UpOkCYgYK97Snc/inpmXBMkSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767894299; c=relaxed/simple;
	bh=ss/QmZtegoT8QUE92ql/8y/No8UIkLe6lLm4BxyGzgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pIHErAnqTudckdJ7Yz9dlYa5qXcVKUo4OfsFeKY2emHwT6HkWCa29AduuTQeaVJLbmx6tSj8C57fUicT/SKEGHuc6iwGgtEkWu3OY2otnjbEJ6GCvqhoybmBZ2uzdQDRiy/cReDGx6MUEHlQ2SQjIcWoQzjx1JS5PQsUQsXT8Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeNKhWQi; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeNKhWQi"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a3e76d0f64so9945445ad.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 08 Jan 2026 09:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767894291; x=1768499091; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ss/QmZtegoT8QUE92ql/8y/No8UIkLe6lLm4BxyGzgg=;
        b=BeNKhWQiXYJ8VapN+lS598s7aWlAg3ZkN5x48Iszhtr+ZYxzIzcLJauYMrKVA/Lfd5
         xUz5JHi1VsDQc/NiTND44G1qGP3nhUXtm0Zrbzk8orAAWwvUnzLS3CgbmBj6DqDEa/UI
         ODu7/NU15d5EXvHZd/yaXY1SOJHzwXmrU51Mir1OQ1gj68JqkGgnULhI4LVjBB06TfvX
         Rx1eNsEgNjP/psKCrDmbcOqApvjH/oWl0PNf+QdhzOblHQJuY8A/JjcOOg5nTYPefLNG
         VuI2R3YBiHrNyFenbzGeyMfwJTirq9QHiV/HgcVLmq+PRLT0TFIp/cigc8ScWiZWSXDo
         nuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767894291; x=1768499091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ss/QmZtegoT8QUE92ql/8y/No8UIkLe6lLm4BxyGzgg=;
        b=FZE6BouPjVY+M5uQF5rdb+kD3ptB3qZNT4kU26k7p5xsnVMJjpjEc6A2tv8PRcXm4A
         Z6O6mvF2jO0N7DArDPYoLNPiKu63UqtR3F5j2uy1gGBfho+U4JXJjBLA2kT4ZmCE8yUq
         UUank2b3ux1dxCWxefdrCgREmP8dE7H2ms4YR0ZCETd6WB6a9TaZRikMIyiIX64SB3D+
         Era+drwJisCk4XT10v9J9pSuZnTC6XhB2/F2tQYQw2iSazzHKmshuT0pzkVEn3GLr+na
         hwa6UzVET0NiNZAk4l7vuKSghODh2NPiSJZXvV4MujBoldlypN3k7XZINjji9d2Q0d2I
         8Ehg==
X-Forwarded-Encrypted: i=1; AJvYcCWMZpP0REIESx5c34uqDzCrZlz6v4sarzFrM3cjPJUfYMGodRgPTkBR7gpLl8cCkb1iVNzEjj8tohQ+CoOzOQzcAcAX6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRxQKI0B/9PQfs4W9mo7ni7AShQ3ssKfZJD201RSdI1TqFI/53
	O+Tn/6CwL44hGXYBGH0xbaY4CZ0gWpjFpBpRg+ODrKry08tlWMf+DCpURPNmFTAuBg70J2tUZNd
	2wE4VgT+JGy6pnenqRYQb261PNI0zKo4=
X-Gm-Gg: AY/fxX6mQ/vn5ozbS6ZUzuOUpMZ+XjDdVU9AfRk5J5zPgZbOJy0XqpR2oeYicQ7tU65
	vCEPkQV3UNMQEhcSfDH/jBwxRGYYKDhvcMvzYaucdEWXysfwrSAZbPqfAnVB3AfTkbNhLlEKm+a
	Zc33IrAzugSamGQWY6GTnmQnP0LvLCRpVldqmEz/RIpXXguu+6ypSt0Ik/JNUjPsg36p2ZVQxfo
	bxAGsyikTVfNxrqhTKFoPpI747LWfGdToHZPvv+Oe1CtiLbxBesKYD0g8uC+M96Sf872JARhY6x
	KMVI+RUfqsAP7HohgpH7TtiJYVApeKrQ/1m1gGM=
X-Google-Smtp-Source: AGHT+IGo23JTAhDe6YZ04HEPRhsvfMI0iFv39hHhbnRbHjZlEOShm5/5yd/f68zNrStyS0OL76jXKcU4YQTPqscbaUY=
X-Received: by 2002:a17:902:d4d1:b0:2a0:b432:4a6 with SMTP id
 d9443c01a7336-2a3edb775abmr78034655ad.15.1767894290166; Thu, 08 Jan 2026
 09:44:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1767621882.git.lucien.xin@gmail.com> <127ed26fc7689a580c52316a2a82d8f418228b23.1767621882.git.lucien.xin@gmail.com>
 <1f31a9ac-01dd-4bb1-9a5a-ec67b381c5c0@redhat.com>
In-Reply-To: <1f31a9ac-01dd-4bb1-9a5a-ec67b381c5c0@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 8 Jan 2026 12:44:37 -0500
X-Gm-Features: AQt7F2o6dW95jyJ167axiY2PfCkYBHxaTuo-Pd8v15qVpoBoDqajatltW2Rygls
Message-ID: <CADvbK_c2YE8KfXE2KP0=a_zaUm-AWNOwpmyeDCQURA3AtbDpOQ@mail.gmail.com>
Subject: Re: [PATCH net-next v6 05/16] quic: provide quic.h header files for
 kernel and userspace
To: Paolo Abeni <pabeni@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, 
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

On Thu, Jan 8, 2026 at 10:01=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 1/5/26 3:04 PM, Xin Long wrote:
> > This commit adds quic.h to include/uapi/linux, providing the necessary
> > definitions for the QUIC socket API. Exporting this header allows both
> > user space applications and kernel subsystems to access QUIC-related
> > control messages, socket options, and event/notification interfaces.
> >
> > Since kernel_get/setsockopt() is no longer available to kernel consumer=
s,
> > a corresponding internal header, include/linux/quic.h, is added.
>
> Re-adding kernel_get/setsockopt() variants after removal, but just for a
> single protocol is a bit ackward. The current series does not have any
> user.
>
> Do such helpers save a lot of duplicate code? Otherwise I would instead
> expose quic_do_{get,set}sockopt().
>
Not much, just when using quic_do_{get,set}sockopt(), KERNEL_SOCKPTR()
will be used around the optval and optlen.

It should be fine to change to expose quic_do_{get,set}sockopt().

Thanks.

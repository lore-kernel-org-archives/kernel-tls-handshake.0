Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10C74A92D5
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 23:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602417; cv=none; b=OMrYE8EilTJqxAUWvOKEod5NqRLc+VSQBDs/Por6cHSjylr3S4ZgtOVAycV2DkJSHY9tC1TvNZWKoWR7moTLA/6j6nIeVTqEPoeBpmCSkAt5VQ/iyopLcyWSV9MnxVjH7Bh0irxEqMS1sjX0oCE5wMatXErtc+Sb2FdYFt25xok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602417; c=relaxed/simple;
	bh=VIzkbkLXxZKsovXpA+xdjAahySxj4wsP44L+acvQp1s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=asQ/MzifA0SEf8yjQ99ImeAko/nddob1/xsFNIxWXgsFjvPywBqYUS8idVGyuaJTXG0u3iI6yn8aNPnMZnEKKscTEcf1s3E1kvIWbZaKPjqDRfPJ45NUy2wTtlwokFDwbNiCk7Y+zme1kS6wU6IHhVel7vNDj4pXDsWo2is2lhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Iek7igOZ; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Iek7igOZ"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db3d832827so3334905ad.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 16 Sep 2026 16:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789602415; x=1790207215; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hK+wEjpxWroA8oXhEwZgbSNMxTBytitf0+teGzIfaNE=;
        b=Iek7igOZqOlO2t+HOkUXz/Z8lEEG+m7o8GHcZKW1xCnqDKm7/8M/87TaCSe8z7GEPQ
         CpM9SFt5pAH/EFojPsJPKmPb8gOhH2CdXpcnEkdBhrcz4baoJX3zrKlUpQ6Sk7ziYGy/
         QXnXq4Xc88SC2yQkga2y7kwojadNVNbVPtQL7KQRKmnzPiv38qoavA6PuU2h5Lm9xmZA
         Hh7SYB5mmKz6UP9Fzkt2s2BFMt3ULeCgPLjeTfJ74341/IwQsNnkh5+Fh9rngAD2MaXX
         ER48x4fBxvFawzUd69yuHoD4xIFgKebWyX4HURzxd9vjvsCD5gP7ofHzcEd2kvftRCEB
         IpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602415; x=1790207215;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hK+wEjpxWroA8oXhEwZgbSNMxTBytitf0+teGzIfaNE=;
        b=ZqigIxAhgCMkY4hc7GoGSh5xr38LHsVneK48Nzfh6E8XTqnU/NeiYTtZ047XuqipNE
         lW8CUBZMIFfbLBSjwawVL42PvIxHANIkHnkTXqSr0rlPPCe49Od5zyUMmN7g3nHCRoLN
         jd8ZWGHItS2Nqv+hhkoLcmEp4VvZKrkZO23j8o9lE7bEhjnLMi7yKEPwmN8bogKUxWNW
         SsV+3C8T6JgCsIVfnG/mcy9uFKQk/2CwubXzK3+SS+/Xeq7qwYC8ElIERTrHY4IOo6Gb
         JSy9ecEb9zGwp0TarDuuvsaAWnKCk6HguojNYOYD6LsUIZct6HMCtfRGbLEriuRGvoHA
         kI/w==
X-Forwarded-Encrypted: i=1; AKwUvByF+4hjGRzKJXqp7E881MbSw98T4NVQuZChYI7fE3Acs0aGVhjYVa9gaHH6Ky16c/tin+SFypP76a4mA2Gk/N+m6hjxpQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kOMSMbVJ41XQIXrBa/0AoaZuwYWqJeOyiWpNHY07ltnJUYqHBP
	+Ioen4jbchXiNwKGeLK5K5tNwxKV63xuhQxryfnQX0xaPwiw6yn4argOf61yiKNXjZ+mP0NwDL+
	IdiP8KA==
X-Received: from plhl8.prod.google.com ([2002:a17:903:1208:b0:2dd:630:cea4])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2984:b0:2db:7269:38ef
 with SMTP id d9443c01a7336-2dd8e40ef80mr99903675ad.14.1789602414500; Wed, 16
 Sep 2026 16:46:54 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:46:13 +0000
In-Reply-To: <CADvbK_dHPkHjkPwu0RepYgDsHs5reHepprRHU9hDFBxQM9_RGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CADvbK_dHPkHjkPwu0RepYgDsHs5reHepprRHU9hDFBxQM9_RGw@mail.gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260916234654.420056-1-kuniyu@google.com>
Subject: Re: [PATCH net-next v15 15/15] quic: add packet parser base
From: Kuniyuki Iwashima <kuniyu@google.com>
To: lucien.xin@gmail.com
Cc: aahringo@redhat.com, alibuda@linux.alibaba.com, 
	andrew.gospodarek@broadcom.com, chuck.lever@oracle.com, daniel@haxx.se, 
	davem@davemloft.net, dhowells@redhat.com, dreibh@simula.no, 
	edumazet@google.com, hare@suse.de, hepengtao@xiaomi.com, horms@kernel.org, 
	illiliti@protonmail.com, jbaron@akamai.com, jlayton@kernel.org, 
	kernel-tls-handshake@lists.linux.dev, kuba@kernel.org, linkinjeon@kernel.org, 
	linux-cifs@vger.kernel.org, mail@johnericson.me, marcelo.leitner@gmail.com, 
	matttbe@kernel.org, mbuhl@openbsd.org, mef@scarletmail.rutgers.edu, 
	metze@samba.org, netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, paul@jakma.org, pc@manguebit.org, quic@lists.linux.dev, 
	sd@queasysnail.net, steved@redhat.com, tfanelli@redhat.com, tom@talpey.com, 
	xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"

From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 16 Sep 2026 14:08:22 -0400
> > > +struct sock *quic_listen_sock_lookup(struct sk_buff *skb, union quic_addr *sa,
> > > +                                  union quic_addr *da, struct sock *usk,
> > > +                                  struct quic_data *alpns)
> > > +{
> >
> > [ ... ]
> >
> > > +out:
> > > +     if (sk && sk->sk_reuseport)
> > > +             sk = reuseport_select_sock(sk, quic_addr_hash(net, da), skb, 1);
> >
> > [Severity: Medium]
> > Should the hdr_len argument be 0 rather than 1 here?
> >
> > quic_udp_rcv() already did skb_pull(skb, sizeof(struct udphdr)) before
> > quic_packet_rcv() is reached, so skb->data points at the QUIC payload, and
> > reuseport_select_sock() documents hdr_len as how far the pointer must advance
> > to reach the payload.
> >
> > With a classic SO_ATTACH_REUSEPORT_CBPF program, run_bpf_filter() does:
> >
> > net/core/sock_reuseport.c:
> >         if (unlikely(!pskb_may_pull(skb, hdr_len)))
> >                 return -EINVAL;
> >         ...
> >         pskb_pull(skb, hdr_len);
> >         ...
> >         __skb_push(skb, hdr_len);
> >
> > so the filter would see the datagram starting one byte into the QUIC header:
> > all its offsets are shifted and the first byte (form/fixed/type bits) is
> > invisible, which can select the wrong socket in the reuseport group.
> >
> > [ ... ]
> >
> True:
> 
> BPF programs may need to access the QUIC header, so I will pass 0 to
> reuseport_select_sock() to ensure the full QUIC packet is visible.

Why do you use reuseport_select_sock() here ?

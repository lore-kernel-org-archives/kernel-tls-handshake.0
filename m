Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBA833DEE7
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  6 Nov 2025 17:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762449736; cv=none; b=TUl5/SujAFpJ28BO2KuBwhL7VZHfWMEjdpL+US4chw28oQvCOTjNQDOjeU7uoPOfvU1ikzp36pulgNpqJ8hQ356/fzRCy+txNXRKAtdSS6GB1PCY6rxszuMiVgErfVMIm7NUbs8RiN2vyx3bBkWRKd4Wr0m0aYw5a7p8ipLSu78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762449736; c=relaxed/simple;
	bh=NH2hfHppCjrZFVx6eqpdpt03wHQYT9rQOCs3FER3WSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bSckT8EAk0kxBYAz/8WvO1lkLJA+AYtKY6wwPpZ/6Pxs5aM3DL3s4GFJ54BDs6lUKUtnprR/oA0eh6IoNuZI7SPVJRz5fpZWE/Octp9/b53/dpYhO3sE1y4rsylNkhCxM29f7Rg00GEAh7z15qMdSJA/A+aShM6a5n28w0vMwZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sr9jL3ZB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sr9jL3ZB"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-340cccf6956so910882a91.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 06 Nov 2025 09:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762449734; x=1763054534; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROsaoNagz4I7/dBZaDxwLj1TocAA02sCxxRugnpAtAU=;
        b=Sr9jL3ZBu8K/21SvT+Z91HMp0k/rjQIIyqbAIsC++SsToDWljgQ2iqPlL10oPCXv9M
         sHq8kHxFZe8WC2zSS0jPIcorB6e3G328R3e3vCyRWewHkXWBPp8ZyH4Da2fNiGgiVV+T
         Vu/OAzWDBDvpPKMJ4CQXwGkPFIc8GQNOjiIwSRaB1cjtXGDqBsETDbjnAcJ51l+PrMjK
         5VXqolit2Zyvt7wsZ1b27k2j80DxS7xE6IxRvHOQNVainSh6YfEomNrrgCTCdcfGHqDF
         k3IA90XlKF0IL3M7IiGTAfrpOM1GDeohBki/Mvx7NFy6i0TuwhoFtxk/NIBnj5JLI2qm
         rIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762449734; x=1763054534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROsaoNagz4I7/dBZaDxwLj1TocAA02sCxxRugnpAtAU=;
        b=JgPV08FEK0xzAHZknHcTII3bQJN+kNBNKJmZulUQeZHzGC09oQxWIGAqfAB0JKVsb7
         QJv6smxu1KDi4d4YzPcaHVSagb6zJZs4xrXEJ3eUUjIbTNiUYoq6JX7f4QOVeCliaZYT
         Pz0jVWs9VTyI4/2vjH4JQkFb4Mvj8QWZEjrbe7NQ966+ba17YQhy/LkOZByRS6p5pB9D
         2KsqPJTeOlmCD3e1md8zC7sSmJPQlhjG+O/qgR5iKBMTIPODEQWFs3T3QK4yWUr/lVCV
         edwODhrpZP2TvfVnsAx8C0gWlaQzcBniLIbU/VtTm/K+3IcdKGLf+ORSJNiqISodDDTE
         sJiw==
X-Forwarded-Encrypted: i=1; AJvYcCW40ulJGeA94axXicg5l11xkyUQA4A3nN7Nx3wiZ35NCietL0g5Ak/6sgmh4tmD6MoLK2I/o447y+sR3gm3l2hIIl+itg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyPAPeG14on60kOPwQodK0eyXSdSUWF3mkS8slIPZS3wH0Q+z6
	BrwlaHRaJkKoZpb2PvlTcqFP9dofN9BvRcx4n+SoW/BBBDxTgTH7oigyI/TCQ15gJabftNnMKNq
	nSxh9tmjP6LQjOMzS219cMmVB3L/JA5E=
X-Gm-Gg: ASbGncsjSv7XBXD+4x87ZMlhSTAlvUYF/Kpd9ZbhKdXzJ0JdOoyNaCD8qBsjuhVkUnH
	UKioHSlIXRl+My/LZnnrMgTzma5po13Qv4+gyTHw/XDKf+VR/drMM/fgCjaPSXTwCZOgFEE11X5
	m17UdWTJuHjaFHyr+nVjT/jr9abCuk9OgehC9oXklGOjr709xjWu/PJIeYKSP8huSKFXna2zZ6k
	xqggZhXuCS0ptg4F4tEVurgWeI+sbq2AfsDzIzfD+aZkrZ9/g8jVNgbVVD1nvWVQsSlYkGP2GFy
	q0QTVxKUhpB0ewf3V2A=
X-Google-Smtp-Source: AGHT+IGhY0NYTXXkTu0P4tB4nC9X5IQVYEkg7KbXM/lxcc2ajgsNtrlqaMsuOSOOG/NPcl8ekPlhnRj1iJwQaZFqVyY=
X-Received: by 2002:a17:90b:2b44:b0:340:6f9c:b25b with SMTP id
 98e67ed59e1d1-341a6c4d3f4mr11082353a91.11.1762449734034; Thu, 06 Nov 2025
 09:22:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <56e8d1efe9c7d5db33b0c425bc4c1276a251923d.1761748557.git.lucien.xin@gmail.com>
 <989d3df8-52cf-41db-bb4c-44950a34ce89@redhat.com>
In-Reply-To: <989d3df8-52cf-41db-bb4c-44950a34ce89@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 6 Nov 2025 12:22:02 -0500
X-Gm-Features: AWmQ_blXBOK6Lm7J_4Le7zJYv7Rj5XNuyVIMzzqJ7AFvKAnEANk67rWLYRhV00Y
Message-ID: <CADvbK_eGPuueR7XL80eagkrAeJraKBMiTVrhiFb_wnTD+N7qVw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 14/15] quic: add frame encoder and decoder base
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

On Tue, Nov 4, 2025 at 7:47=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 10/29/25 3:35 PM, Xin Long wrote:
> > +static void quic_frame_free(struct quic_frame *frame)
> > +{
> > +     struct quic_frame_frag *frag, *next;
> > +
> > +     if (!frame->type && frame->skb) { /* RX path frame with skb. */
>
> Are RX path frame with !skb expected/possible? such frames will be
> 'misinterpreted' as TX ones, specifically will do `kfree(frame->data)`
> which in turn could be a bad thing.
>
Yes, when generating and delivering an event to userspace, it
keeps the frame content into frame->data, instead of frame->skb.

There's no need check !frame->type for RX path,  and I will change it to:

        if (frame->skb) { /* For stream/crypto/dgram frames on RX. */
                kfree_skb(frame->skb);
                goto out;
        }

if skb is set, it will go kfree_skb(frame->skb), instead of kfree(frame->da=
ta).
Because if frame->skb is set, it only needs to do kfree_skb(frame->skb).

Thanks.
> Possibly add a WARN on such scenario?
>
> /P
>

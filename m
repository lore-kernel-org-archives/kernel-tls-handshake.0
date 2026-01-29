Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C3A2F5A36
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 29 Jan 2026 19:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769715656; cv=pass; b=cT1OvqyEP8hsZOYZvtJoUn+rh0uHRD5czZcjvgyJ/J+iNM3FXg5H0e7RwgIaq5JiDii3EdWb/0vZNSc/pAnwPAhQ2a+Y7HVY1Qow5eb9fATvcNMEsZjJPA9zznObyQsjD9WrcBARTA5ZUauhVboD/roXfT5VB00f9pZexLgPq2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769715656; c=relaxed/simple;
	bh=OQufuj5kkmYMxx6ttww64CZWm+ndiofyh3a3rNhNfCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+sH9JN2gLZCqTkM2X/ifQjWIsrva8dn1CHwh7eDBeJnZzRa2QRJ2JJO0SE4eh3jL7Sb//Vbubncsv11ZY89aLXdTQEHquH1DU93eXxn1IXF6P+JRqLyvriF68pUBXCmcl0MGNbzblzJQeB4vAWA50pFG2rWxVFpZkys1DnIt68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiNZ8W+C; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiNZ8W+C"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5f52fa0d48dso412464137.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 29 Jan 2026 11:40:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769715654; cv=none;
        d=google.com; s=arc-20240605;
        b=Z1i/4UGMj1eKr1O7kTWjSxAAhFmTffXcna4i1c9/hteVTbhtt9N6G8SKD/7NCixOOP
         EkR/miKb+yE/eENU2KwJgdRKs7iX1uBpFHg/eiQdRBkDOTsmo0kSEnXl/WVN3ysJ3jiD
         ZiId+XmGuCU362udg4fVJeuow/YslWyAJQoesoC0sRu43UUPZpojZFzGdqsN6a9T65Ex
         Y6witYCi6sl/i5Xsool44syNHZk23cOXvz6m24OTvMEaa14W+Te32G6kuPJNvYQIsEpx
         fHJE6fXWNlCAQc8BrCfqz3kT963/NwEE6XLNnngATtSi+TTYuZaqj9fnEhthG8kI+vcj
         DgTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vWXOUBeb3b+nw5Cfis8wSYxSsjd/F4GCHIXMwqvZur4=;
        fh=2rC9YJ5RrZkSfdx5JD79zwvexv0bAhrhc+HSVh68mwg=;
        b=ezh8geZyTeBHVVGJjQEArDpzpjojdnqn1U3jwkuayC2tyFCdP1BQgEVOalxoXq3Ekl
         qdx+r6/z4dZQycPPl2aBoChZtdePddzAHfQ9PPS3qjXIF1HraDwBpEPILaYtNmR5AftB
         ZYixj1veLo6D6YqcMV5T0uDsnUQQQun/upI2fwdinVJl9AwSYVR93jtDLrCg6p+SC4tD
         GCrahhdVvbaRgdUAYMuZfh8cZ/GsMY6LhN/8TDR5OUu1O+84VjAmML5oMC8lyw3zICL7
         Af9qNazFeveNhiueso+QU8Ciiw3OLZ9H7/GpFbIzQOwj9yhajRHcPw8cG6ukl9yp++ae
         Z61w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769715654; x=1770320454; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWXOUBeb3b+nw5Cfis8wSYxSsjd/F4GCHIXMwqvZur4=;
        b=hiNZ8W+CQDug/syWSMf93yZ6E2tTp/pVUJ/YXsuRpzk6czwZerIyVH1qjv+2jx/7WA
         s0DrcpRT8Bl+OljlVgSdptXvjLfewX3/jaY/+Mt5iPqO9vIanfQfIzYCu7SOv4lZpCtq
         MvZiYxBwypawULDmIIcPqmqRd/j9rIH+VW/i/lGdTzP6sj2q9d83b5ja3VESc2YKmXZ2
         o5iwVDAbMM19PRYe9cyWF75mhjJwONaxF3svSm2RfsFvTYHJr8a3xu9Jr4WYEiL4Ojbj
         N8qwVhsIaZOWIMONYcUle4JXufDFv5V5ulD5uPr7wBCtWuA5WSydoVikoatRS1A78HQp
         aXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769715654; x=1770320454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vWXOUBeb3b+nw5Cfis8wSYxSsjd/F4GCHIXMwqvZur4=;
        b=QCFzwhAfo2y85TSRdSXsvi2VivuLkUIXabHr0s14jl2uYlncvas4kGEXugHTr/hoRq
         jKxhl8tztt+dd66Tc3iJbhScVvOD+jmClueOkJpQIkogblA56TAL50o4/tROS2zrac/q
         DrO6mGurbuuNDi+IB21WhzL1WaT63hid7sv88XrPBJAvw+0yU5DkPW6rWvvl2f+QfmX6
         eOkg3eZfknur5ZKgP1ooOL0UD5nOE3e/D/fEnNkKY+SSLNq/EbNhgHjeP3fcwe4XLVhX
         ixhwPErFy3W9ffiRC9yWhDRDwWZWtTYFNoaWLZ/7SIypQh1WakG1S5xuygd74O4TkrYS
         DRKA==
X-Forwarded-Encrypted: i=1; AJvYcCVuN7wzLyl3XRiMri5fGqem1cmi5CwK62rJGJS3+Oyf2N426xYeH9PNbE93hLJeaD8TMW+ydNY7EVNXZI5IAIG9QgsuDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4vP+bGGQafWnWnfUs4RI/dHOSiD3F9FzYRbQzbk3ct4bGeEr1
	NXBFjJFd/wcX7FYh0AvoU4qvBQueOtHzmP5ECE4Q581DB09k1WEyDPCeE2vfKxfZzQaakobQ3iL
	OI0VN1YU3w0X3Qsos5nybJ8LN7ji3fsw=
X-Gm-Gg: AZuq6aJL4VmcFNxkD/EPDhMoBEycRwfYTxNkn5ARbYluNI8VI1ONznj2EO4ID0hh+j4
	1SMEmQRth15tQFp0WD3F0+owosXx46aT5PE1cej7ZOJ1BFYZy1qR3KAAG6s26Ek0wgKfgXr43Im
	rgAcrJCfVFdru1hS05VnsJi3CITKBvrSkZy7hPIXtq96sUt2gzsh3YsnttztuZkeBnVQu+SlvzT
	n1cQeH60dgs2g2f1VVMYw9uADJYpgiT145XPfovUGmgznfZQYAs14tDYUKtm2sZ8Vh5RJmjrMBj
	4HJyifVvfTXVdLa1SBLhDjCSp2ZVYQ==
X-Received: by 2002:a05:6102:304e:b0:5f5:2e08:bbab with SMTP id
 ada2fe7eead31-5f8e23e7d3amr226299137.6.1769715653861; Thu, 29 Jan 2026
 11:40:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1769439073.git.lucien.xin@gmail.com> <1cbfbd45fda48c82f629b000fc102ee011515e12.1769439073.git.lucien.xin@gmail.com>
 <9c17e0f5-0a07-4800-9356-0ee9445e3922@redhat.com>
In-Reply-To: <9c17e0f5-0a07-4800-9356-0ee9445e3922@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 29 Jan 2026 14:40:40 -0500
X-Gm-Features: AZwV_Qjx14-1bOrrh8LVqqfM15IbyrS2KpNfixIqKIZVNgumQoCFAq17MEBRSlw
Message-ID: <CADvbK_f7++7shAGwYLcz=ph-te_d+z+bMxiaTtY2Ahze+Wagqg@mail.gmail.com>
Subject: Re: [PATCH net-next v8 03/15] quic: provide common utilities and data structures
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

On Thu, Jan 29, 2026 at 11:26=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 1/26/26 3:51 PM, Xin Long wrote:
> > +struct quic_skb_cb {
> > +     /* Callback and temporary context when encryption/decryption comp=
letes in async mode */
> > +     void (*crypto_done)(struct sk_buff *skb, int err);
> > +     void *crypto_ctx;
> > +     union {
> > +             struct sk_buff *last;   /* Last packet in bundle on TX */
> > +             u64 time;               /* Arrival timestamp in UDP tunne=
l on RX */
> > +     };
> > +     s64 number;             /* Parsed packet number, or the largest p=
reviously seen */
> > +     u32 seqno;              /* Dest connection ID number on RX */
> > +     u16 errcode;            /* Error code if encryption/decryption fa=
ils */
> > +     u16 length;             /* Payload length + packet number length =
*/
> > +
> > +     u16 number_offset;      /* Offset of packet number field */
> > +     u8 number_len;          /* Length of the packet number field */
> > +     u8 level;               /* Encryption level: Initial, Handshake, =
App, or Early */
> > +
> > +     u8 key_update:1;        /* Key update triggered by this packet */
> > +     u8 key_phase:1;         /* Key phase used (0 or 1) */
> > +     u8 backlog:1;           /* Enqueued into backlog list */
> > +     u8 resume:1;            /* Crypto already processed (encrypted or=
 decrypted) */
> > +     u8 path:1;              /* Packet arrived from a new or migrating=
 path */
> > +     u8 ecn:2;               /* ECN marking used on TX */
> > +};
> > +
> > +#define QUIC_SKB_CB(skb)     ((struct quic_skb_cb *)&((skb)->cb[0]))
>
> Please add a build time check on quic_skb_cb size.
>
I may put this in quic_init():

BUILD_BUG_ON(sizeof(struct quic_skb_cb) > sizeof_field(struct sk_buff, cb))=
;

thanks.

Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B78327C06
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 29 Jan 2026 19:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769715589; cv=pass; b=jeUpgrx5QYA9LsLZps1+ARYHw+L9pq5zun5xkPDWNoHieA0PDfypV4+EhrW6ODGJN2WmCNOUMtjzZBB59JPUmfQDIBxXufeCW+HJgy5RNQiX9QmwveCHVaXvKHzpLWQeNzcE8tfU8TsN5QNbh/6gTTMDf46nTMN2UPUkaZYcAus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769715589; c=relaxed/simple;
	bh=slWb1gPv2FtqXq1twLRiSOtOOA1QvUUzSYzROoZg1Y8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XMzlIaORqB7gdifpTFCR66Bxbw/5TaEQYAZOHMOyzv1dH3iS6axdd/WNxzgXVjV/+aMGOJRz37HLlf259CMyR+4dkP8lRN05acMN6vZwokNbdkboVQlpPtnG8LNHJQKSKYI9i00IGFh6ozYTfY9KkNGJeEXIjFhS6tA1zbWiues=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtxDwTk+; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtxDwTk+"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-352c414bbbeso1488945a91.0
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 29 Jan 2026 11:39:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769715588; cv=none;
        d=google.com; s=arc-20240605;
        b=P4lLETmokvIxdt24mG+qgVnnvbUQjsAAFjvU+8faXSfszvfmCitxgUn7qjvGEAG0dn
         WK9F2SRPNuXANz9GnZn3vUPVdZkCZCTkT3K8atERpoqvpmaEy9dRtmm0BNKlGz24kSCK
         LTJKzDcd3vgCNmWHyq/psWFqbaUYMmpS0POG0hkuFvLEOaq0pxAyxibYH8ESuTgyqINI
         p7CojOfCuz16kNHEW30ICQGxHr9qQ5H0fwvmZ1P28e6vKVV2ISNxDEpIB55D3glLz5Oc
         iswX7ubbO/wvXT8qfdyN1a9t8ntihrzMAJJlNcpfeLwHCm4cJI+a8zcwP7C2t8VaaxBt
         i9GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=76tIsRX/4Fg/g4PCHkk+TBEOGwkN2KFdE8yBjFB4Hrg=;
        fh=Aqpk9wI06t452ZvWhFa83jfxF7CwyVvOfYmOJH8Irok=;
        b=NaxoYAjj7/86vpMHaKqB3KfGgeehxGE+oXA17V4HC6ITD0HN2i+nJYhh41clbT1DvV
         xFSfraNbXBaC7dNk5OCb5Bs+WlPvGQIdn27vOP2Jnv3Ovsj1rBOFVWlJLyaSa1rz+zo9
         PJMWhsmDeQr60AMTgbl6iEEcmL8J2kGvzVFk/XxNv3ALDLs6c93riYZKk9cj8CYM6xW5
         oGn/po2AAMqc9/0ySqFfmcz7VVQMXy4IUUmjL5CLlJHx7Vsc67MvS93Hrz6S3PXf5BWU
         HdOIe/RK9vTK4lawrYWkI1MpHWt3CKZP1W7GJ0qJGPRrHZznkFwbafIprRbsne8nmbqr
         /Uhg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769715588; x=1770320388; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76tIsRX/4Fg/g4PCHkk+TBEOGwkN2KFdE8yBjFB4Hrg=;
        b=QtxDwTk+VYiRvLRzZXG8YPx0LORE9wHWIqrb3hOxkUm6ebnYwb1PmivLM+KbwltuIu
         +U0B9+w4dHlNk2iJSKgdEkqZGCzzYKXSGntniuC17cAFI2waXUNmrR1o99e/z4QiZKxf
         gCcr3oILEzXKGsLO6ICTorqjZNOpLnRxWObnOiMgDH+Ecf59u7uegKRff3TdxCdVRDVr
         lEcCrsJ1dRPMjab4SFkEZZybdUDHq0knnX0rKHAazOeYTeSgD3RCz+afp+vjGjvmDje1
         ej0NUXvk6BJi/5ujVSlZ767h+9i4pTmt6p+lZl3R0Mmb5Z/c+q3tt2rMiD3rzOsfPq65
         O/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769715588; x=1770320388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=76tIsRX/4Fg/g4PCHkk+TBEOGwkN2KFdE8yBjFB4Hrg=;
        b=VBEyy+mxlyESVmBdlfbIO/QavY9nvUDTmkCHwHiNaVmLphM8Cq4/9g90mkiUZA0mio
         3zMhSJ75g6Hu50hVnpfYB2cipInkPc+CL0c4Lq06LO4T8a+C1gYrz+rWNR0BxJq6ZlSU
         E8eMRf6namISDbOW4iSAJ1+5FlaWud+LjrA00v9XtcsC/CEl4ZJ53eOBsM0nMkh1777d
         PREpWi19uYhwoQw2M/Rfqpw+Rku0PPx94uCio2lm6sf4AAJiMWVUAWGnNMBPvHExyW5H
         Q6HbQzpTp6feWl+4bh66MgPzmee4vXBb8MpBGXrOY3nHhzEpAqw6vqeiPJJFlqW3m0AZ
         Vt9A==
X-Forwarded-Encrypted: i=1; AJvYcCUjKW3/7Cwv/sUrRltLnRQJORILNVRrSVjzMfbzeTvKLE3qh3A+Ud6s/vAxx8Hn/qUdFdt3gT9zJyzb4ht5DtKT1h5p8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvpihRgjddn/DAi4Iyzy9uYOmZLBhzA8DPfvuGPZYVjyJ7evQs
	87nKd2m/1FHiOI0Ii27RH04CS9ElZvq9//qQAqgd+ria1Jrynjc8gxxwfZSPe7Lpy34Ta1jMFsg
	RluMbjLifvaUldcsBW5USwMUkLew2BKs=
X-Gm-Gg: AZuq6aLhETZz6bOJENS6Yazh+xB3pyrw55193G/8El5lLjY/yKIpRj8Eu039FYGOvsa
	3w+jBbIM4AmceWwIgIpFt/Q1KrEHdlO5GYsNjmAoXkckUaJGzTf3xu/1usWez/RuJh7s8/5rVrk
	faN3gDYJF6VQ8WB5hJwFniZ9TcUd0LQ+CBWDC5+lxvGR84JpiLKz+vGXHjLZ/5aWe83HuDYSu+M
	ZZuJlsewLf/Li4+b8+vfLb+tpsZtf9RDhALcSP9bk2K4ONJayPApv+GweiFeqhM04AYmWL0bIX2
	DsiS/el3EHsv92rO3kVvSHOayZgGVQ==
X-Received: by 2002:a17:90b:33c1:b0:34a:c671:50df with SMTP id
 98e67ed59e1d1-35429b2e55cmr3308198a91.17.1769715587450; Thu, 29 Jan 2026
 11:39:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1769439073.git.lucien.xin@gmail.com> <4ec3ade7dfc709658a2b1839dbe29c9467b25fdf.1769439073.git.lucien.xin@gmail.com>
 <b0045978-ea65-422b-8260-d079b43eb553@redhat.com>
In-Reply-To: <b0045978-ea65-422b-8260-d079b43eb553@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 29 Jan 2026 14:39:36 -0500
X-Gm-Features: AZwV_QhlVoBaCiIz5kopBTHIpw23-lZlR_vHRkTAGEfDtCF_CgQBWEVXy3dNJWo
Message-ID: <CADvbK_d9FE+Z72JpdFER65dJ7X19Or_m0sLBPdWOZP9DPbksQA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 14/15] quic: add packet builder base
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

On Thu, Jan 29, 2026 at 11:40=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 1/26/26 3:51 PM, Xin Long wrote:
> > +/* Configure the QUIC packet header and routing based on encryption le=
vel and path. */
> > +int quic_packet_config(struct sock *sk, u8 level, u8 path)
> > +{
> > +     struct quic_conn_id_set *dest =3D quic_dest(sk), *source =3D quic=
_source(sk);
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +     struct quic_config *c =3D quic_config(sk);
> > +     u32 hlen =3D QUIC_HLEN;
> > +
> > +     /* If packet already has data, no need to reconfigure. */
> > +     if (!quic_packet_empty(packet))
> > +             return 0;
> > +
> > +     packet->ack_eliciting =3D 0;
> > +     packet->frame_len =3D 0;
> > +     packet->ipfragok =3D 0;
> > +     packet->padding =3D 0;
> > +     packet->frames =3D 0;
> > +     hlen +=3D QUIC_PACKET_NUMBER_LEN; /* Packet number length. */
> > +     hlen +=3D quic_conn_id_choose(dest, path)->len; /* DCID length. *=
/
> > +     if (level) {
> > +             hlen +=3D 1; /* Length byte for DCID. */
> > +             hlen +=3D 1 + quic_conn_id_active(source)->len; /* Length=
 byte + SCID length. */
> > +             if (level =3D=3D QUIC_CRYPTO_INITIAL) /* Include token fo=
r Initial packets. */
> > +                     hlen +=3D quic_var_len(quic_token(sk)->len) + qui=
c_token(sk)->len;
> > +             hlen +=3D QUIC_VERSION_LEN; /* Version length. */
> > +             hlen +=3D QUIC_PACKET_LENGTH_LEN; /* Packet length field =
length. */
> > +             /* Allow fragmentation if PLPMTUD is enabled, as it no lo=
nger relies on ICMP
> > +              * Toobig messages to discover the path MTU.
> > +              */
> > +             packet->ipfragok =3D !!c->plpmtud_probe_interval;
> > +     }
> > +     packet->level =3D level;
> > +     packet->len =3D (u16)hlen;
> > +     packet->overhead =3D (u8)hlen;
>
> Given the above math, it looks like hlen can never be > 255, but
> possibly a DEBUG_NET_WARN_ON_ONCE() could save from future bug and make
> the code more clear?
>
sounds good.

> > +
> > +     if (packet->path !=3D path) { /* If the path changed, update and =
reset routing cache. */
> > +             packet->path =3D path;
> > +             __sk_dst_reset(sk);
> > +     }
> > +
> > +     /* Perform routing and MSS update for the configured packet. */
> > +     if (quic_packet_route(sk) < 0)
> > +             return -1;
> > +     return 0;
> > +}
> > +
> > +static void quic_packet_encrypt_done(struct sk_buff *skb, int err)
> > +{
> > +     /* Free it for now, future patches will implement the actual defe=
rred transmission logic. */
> > +     kfree_skb(skb);
> > +}
> > +
> > +/* Coalescing Packets. */
> > +static int quic_packet_bundle(struct sock *sk, struct sk_buff *skb)
> > +{
> > +     struct quic_skb_cb *head_cb, *cb =3D QUIC_SKB_CB(skb);
> > +     struct quic_packet *packet =3D quic_packet(sk);
> > +     struct sk_buff *p;
> > +
> > +     if (!packet->head) { /* First packet to bundle: initialize the he=
ad. */
> > +             packet->head =3D skb;
> > +             cb->last =3D skb;
> > +             goto out;
> > +     }
> > +
> > +     /* If bundling would exceed MSS, flush the current bundle. */
> > +     if (packet->head->len + skb->len >=3D packet->mss[0]) {
> > +             quic_packet_flush(sk);
> > +             packet->head =3D skb;
> > +             cb->last =3D skb;
> > +             goto out;
>
> The same code is duplicate a few lines above; you could reduce
> duplication jumping to a common label.
>
will add a goto label at the end for this:

init:
        packet->head =3D skb;
        cb->last =3D skb;
        goto out;

Thanks.

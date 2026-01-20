Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A3245BD6B
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Jan 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921113; cv=pass; b=LFE4X3vg22VcDE7V12gSrbHLzoHtab2vv/oUKys1tsgZ00Nq1CVJGTtqTk2fFZ40sTXff/2OWdfa+BrVJKrMfY/d83LCirPU/90VUU1M0yRjEzn0SEsdZ92+/ZwiyYBLKh70Poyl+Kiy0U6LCTgLlE6cVJGIou5O1qv8ilOZFGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921113; c=relaxed/simple;
	bh=AV9hAIQr5RzI8gRTr0Om3D11rvB2xShikwoc1m16OHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XO287GqGyt0i4msy69k0Jn5Mm8HUhQHrpMDi1cwR4bjPBHYxUM5ql9DGr8d1rvNQtjNuVTFLmzaoF64h80KSjKBQ+8ofysalg2KOo5V+kHdWUWbMo5IOfXcWlbPxyOnKFYITWB1ezHH/Lo3G08V+HRhBC/dy2MMtLfECHReHqfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJLGfqPX; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJLGfqPX"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-81345800791so3700428b3a.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Jan 2026 06:58:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768921110; cv=none;
        d=google.com; s=arc-20240605;
        b=V6QX6AZd02v5Id//7OXnS44XusKuW1KhGZMAA8Y72IkeSYogskctsbVSUkYROkUVtS
         0qjlDtY+D9s94EqumfcWZlzdEANBJYyGXcjvYw8dfPK7xvMbqRfEnjv0EEmNLNvWKm7C
         mEvH7i0ca8WuCMZdula1miOmBStMGyk6oa+l+rXO7G12osAXVmLa7f4NjKXjsktTCIxN
         zKoH1TC0aSfoLrP385b4IxM29xy2QKsMn0NMZdqbNF7Y9/QsZFGbSPX1+XTCdNqzActR
         R6S4HCVHYjw3xzQmzsRNeGx7BS7ZEv3VV7Ml+juodDT1UpZMhwiv+3mpAVYojuzjq7tF
         kYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EUfRwMQV3KapT7k/eehULUSMHqVaGxUA4eRrbnoBX9U=;
        fh=byO6MuwKY9blD9C97Pp/Ph3tQt0yECjpWv3NSa2DsnQ=;
        b=QFQFgqEt5XjP9J9U7KjxNYAtkyCbprOpJs++ve50vu9pf41oTbx1KqZkXAgH3bUNEP
         2h5/Jy8GrpBuDmkKvFHR71SUDWzXzc5omVX9cvGp0zW5I+Auclz8nos2RwfFco4HkHCU
         ukZP6JCyqij51lWq5hc22fRRDe1Cyumh49xlpmqILgc+eihmEPP4uMVjCfR21NEiDRVc
         rHG3rl+r0p095kfY2Qc0WtJNMxBH0BOqp/zGGm94Q6SlDdtnMr/UA8PuAWsp9XLBGwbU
         wPZ/EVblVoBk9vxUqzCbsdbICdDM61avbhpnfDfQItoXHPjiVt/Cqj4fwk+2y5d7H/Ie
         BNOw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768921110; x=1769525910; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUfRwMQV3KapT7k/eehULUSMHqVaGxUA4eRrbnoBX9U=;
        b=KJLGfqPXbXWgKRJAk0YOWgo8mMixSi0Xw0ehxrXdmoj2/XcJacr8ihlpkALHL2CuJv
         0C8GFClrPL+H6eBR9ZMCe7zT8Mez1vvzyDbtQN3TuKao9B5wTBihU+EjameGH5jp9wJR
         0QOho3wUBpqOC/y/38q4MyqKZ9Lo9q+ihfvOEtmodHN4APC6zNIdhdzOIfpqMi8/kPw7
         qLSZ7nBcH1k7XKkf8JDrUkMvC7CoIkxpCGaP4sXoHYEo2OO6dhy7wbIVqZJ6aGFEX4mM
         LR5eyHeDB1xelDCwqUrSM2kHkbjPs5l1ReCn1v9xWgXecZKeeBDJkjfr6aqweqn34hpH
         KXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768921110; x=1769525910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EUfRwMQV3KapT7k/eehULUSMHqVaGxUA4eRrbnoBX9U=;
        b=g1GkQsQV9NvKLYF0SIEVc6RyVrhzmThh9EhV2LMgkrfDMsAkU+Ci7oAoY8xY49M8cx
         9o6iNCOO0oQHwjwGZF+UzjwD2EFh1X6JT4daeQMaEX6SrAHOkwGZd2XiATF/ppcB593p
         9XvBNAKpySmUGiWWKRLFPPZUoi+VONdKwEy/+JtM3YbPXipG9UHgecrdDf8trysm/uH5
         6kOM3dcKmoITsfsOcCiEwsg6letipbQCiC9n6AXSQjyOEZCySlNcZpOZcHibXSLfXcaw
         fmLIaNyIMDdQj2PC4gPmO8l6uVhkaB7mpxtbjmLqUrZXmxJyf6/EMWwP8ZpnBmzdbt7I
         DOWA==
X-Forwarded-Encrypted: i=1; AJvYcCWRdSCunFqlJd8KFmWjqW3m/G7eZINyJGsFhi4qTn/x5rmjITMK5Ie1FPUz12VFJj0XcvmT6pXOqz+mrxveP9CFwHsP4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQJ4RuXMbOsXygIu8hxvcCeoLtEj+yWf4Oe0dj14xX1SlCCMkH
	8rXY5p4jh4He3RSfJ/AtApvJEfsRggM361bM29B/tJCOVvJ+E/u0/BjLWRwllqE7Vzvp+HuK7S7
	OT0QCuBPUEFZEeMiH+Ag6CgsB1dTkFuI=
X-Gm-Gg: AY/fxX4eVbAu6chwIh66RhMUyZdNxhtjxi9vHDSfnx07zT9f/4Ei6bYc/XssgU/N1z8
	LrHUPQGGA2lEM1q0TNZLThAH+CRvYquPE252ZfOb96S1h3F5m5cdl+Kl7Dx0XHrsUP4NduKQi6m
	PoWliA02BEIfWqllzEl2Q6xYRQRczzx4VXxW+Cb+qdMPt5BiIJMzGpM1rmFNMwL4vu+Do/rpo+0
	HOYGSHfcDKZEq7hCiDuFWDoiuha09SIj42TV1OiUhIng88MAWa0znAoPyOmMw+dvYlSBoL34AMo
	vvFYkYfS2Gsqg7jbsGMb5q+quT1a66Kgzwj4Efs=
X-Received: by 2002:a05:6a21:692:b0:38d:f0f3:b940 with SMTP id
 adf61e73a8af0-38e00d47b68mr13733048637.57.1768921110331; Tue, 20 Jan 2026
 06:58:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1768489876.git.lucien.xin@gmail.com> <e3f770ef8d9aba101e1f5dc2f2f72bb0d2a30b94.1768489876.git.lucien.xin@gmail.com>
 <6c6d5644-3354-46ba-bbc9-e76789648abf@redhat.com>
In-Reply-To: <6c6d5644-3354-46ba-bbc9-e76789648abf@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 20 Jan 2026 09:58:18 -0500
X-Gm-Features: AZwV_Qg7dfPxOkDkqOzOQW_7YKwWAViU6i2Li95CyFWjfHPIuFun67eybDn2Dd4
Message-ID: <CADvbK_dh-O9NuNE4XL2ic2WUy9ysWc1NzbsJ99kv0ZciAw7ttQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 06/16] quic: add stream management
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

On Tue, Jan 20, 2026 at 7:32=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 1/15/26 4:11 PM, Xin Long wrote:
> > +struct quic_stream {
> > +     struct hlist_node node;
> > +     s64 id;                         /* Stream ID as defined in RFC 90=
00 Section 2.1 */
> > +     struct {
> > +             /* Sending-side stream level flow control */
> > +             u64 last_max_bytes;     /* Maximum send offset advertised=
 by peer at last update */
> > +             u64 max_bytes;          /* Current maximum offset we are =
allowed to send to */
> > +             u64 bytes;              /* Bytes already sent to peer */
> > +
> > +             u32 errcode;            /* Application error code to send=
 in RESET_STREAM */
> > +             u32 frags;              /* Number of sent STREAM frames n=
ot yet acknowledged */
> > +             u8 state;               /* Send stream state, per rfc9000=
#section-3.1 */
> > +
> > +             u8 data_blocked:1;      /* True if flow control blocks se=
nding more data */
> > +             u8 done:1;              /* True if application indicated =
end of stream (FIN sent) */
>
> Minor nit: AFAICS with the current struct layout the bitfield above does
> not save any space, compared to plain u8 and will lead to worse code.
>
Makes sense, will change to plain u8.

Thanks.
> > +     } send;
> > +     struct {
> > +             /* Receiving-side stream level flow control */
> > +             u64 max_bytes;          /* Maximum offset peer is allowed=
 to send to */
> > +             u64 window;             /* Remaining receive window befor=
e advertise a new limit */
> > +             u64 bytes;              /* Bytes consumed by application =
from the stream */
> > +
> > +             u64 highest;            /* Highest received offset */
> > +             u64 offset;             /* Offset up to which data is in =
buffer or consumed */
> > +             u64 finalsz;            /* Final size of the stream if FI=
N received */
> > +
> > +             u32 frags;              /* Number of received STREAM fram=
es pending reassembly */
> > +             u8 state;               /* Receive stream state, per rfc9=
000#section-3.2 */
> > +
> > +             u8 stop_sent:1;         /* True if STOP_SENDING has been =
sent */
> > +             u8 done:1;              /* True if FIN received and final=
 size validated */
>
> ... same here...
>
> > +     } recv;
> > +};
> > +
> > +struct quic_stream_limits {
> > +     /* Stream limit parameters defined in rfc9000#section-18.2 */
> > +     u64 max_stream_data_bidi_remote;        /* initial_max_stream_dat=
a_bidi_remote */
> > +     u64 max_stream_data_bidi_local;         /* initial_max_stream_dat=
a_bidi_local */
> > +     u64 max_stream_data_uni;                /* initial_max_stream_dat=
a_uni */
> > +     u64 max_streams_bidi;                   /* initial_max_streams_bi=
di */
> > +     u64 max_streams_uni;                    /* initial_max_streams_un=
i */
> > +
> > +     s64 next_bidi_stream_id;        /* Next bidi stream ID to open or=
 accept */
> > +     s64 next_uni_stream_id;         /* Next uni stream ID to open or =
accept */
> > +     s64 max_bidi_stream_id;         /* Highest allowed bidi stream ID=
 */
> > +     s64 max_uni_stream_id;          /* Highest allowed uni stream ID =
*/
> > +     s64 active_stream_id;           /* Most recently opened stream ID=
 */
> > +
> > +     u8 bidi_blocked:1;      /* STREAMS_BLOCKED_BIDI sent, awaiting AC=
K */
> > +     u8 uni_blocked:1;       /* STREAMS_BLOCKED_UNI sent, awaiting ACK=
 */
> > +     u8 bidi_pending:1;      /* MAX_STREAMS_BIDI needs to be sent */
> > +     u8 uni_pending:1;       /* MAX_STREAMS_UNI needs to be sent */
>
> ... and here.
>
> Other than that LGTM. With the bitfield replaced with plain u8 feel free
> to add my
>
> Acked-by: Paolo Abeni <pabeni@redhat.com>
>

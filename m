Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FF71FF7D7
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  6 Nov 2025 16:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762447263; cv=none; b=umjxvBxozAqEp/rCLdle9hcYmS53lBx9JK26+nolK4D/mBM5q1O3SCYMXuPIMMnRQ5lhmRRu9ez2HujQUDQ+oGPlUMYw35rIu9/6Vs53jfb7VWdZp5VJ2s9B9SjIq1CLmCkLonxshoa57HtkMBHBNytZDr+BtaHpHyo8iYZrq4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762447263; c=relaxed/simple;
	bh=TBcIWrbd4TaZLgB/ZJb6p325CdBt3uGaZyZ9kmR9+1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SbwDbt0KTjygZ7hpIH9qDMT7FzYO6X+bhMyp7XRWqxb6e0eRhXz2cc8I3dH7OyIA/LHg//iU+EEvT8dxa7YtUSqUwqWgxwPjRZsGndatnjQI+25Q9BrcYVSM7xUCaPunGBaaVZ8xjNC8Iq1N48NzGfZ12XeD9+afJzpEjg5KDu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHvrxYH7; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHvrxYH7"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-341c68c953bso1586246a91.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 06 Nov 2025 08:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762447261; x=1763052061; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvC8dwzzaWG4yq5+kQqkL0SJpAh/HOeEJ2LSeIlJuUc=;
        b=OHvrxYH71Q+UsYMqPTIJigBz3X0u4bh0ZbFiC9y4RPIgfddJGmpgWgjLkvLOgd3/PS
         3ZFX8YXOkAwY9iiX7JQj/kSsG0VhrR3GChsbjTt2TkOUdgR/BgJiuOyToFd4o3HpqD/T
         mFAcEsYg/EDmBubynRvDcEKGo5USRjaYtzm4Np9pJP67ub78iGoLOOLTdSZlCZr5aeOA
         7SEJ58p/CDYqDKbNRsLz8/SaNDMzu6IuHBAxVbpXnfRYMOzFwdya8W6h1S56IL0arsyX
         M6k7Kkl7ol6K3HUggt9v+DvWdOxm3zKOehK8O3qsHr4DRi/fvkE1wl1hgghZhfNyQRin
         99uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762447261; x=1763052061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvC8dwzzaWG4yq5+kQqkL0SJpAh/HOeEJ2LSeIlJuUc=;
        b=wSp2lRBD92eZ5+NAMgzRmu8GE3sfHz9+4yfv+2zBCwVu97tpPGtvUOeLpIOy/X2AHE
         oiRseiHVBPy7dRpeDyOovnGUP/fUTiz5AS18E5KbjGyUdbLd0JZ/N0mn4jaJtRQ16XUW
         Yd8wYHJFYE0E5jlhB7/x0ZMAGQWXG61A6hgRYiZY0jCOScnOMEkyTTlU914Y+Bp8wjXE
         xsmjJhmD5jM0LtgGGK5NQrnH70BUfMU16FWlVOsCGm6A2x+Lm/jacRZw0XR/yb70c7xe
         MoJ3UALN6/pOzt/YMC4JdchsQHyHWBpfZGhpewViLDcjqMrAR6lJVBxIg4F9ChXnYmdF
         sJzw==
X-Forwarded-Encrypted: i=1; AJvYcCVmkWlYjZwSjht/ti/Ee6xyog3lwlM1jMBQBx0zHHEuL4E7riGEzEBFb8kUydNqfLG9xulsDeAQoi5IoAl1WS/ncGFHSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxDgdtYjCPQmw1hDjWdF0znoFeCJE7DBpxvgfP7D8xFqfOx3ud
	hrrjNIjG2wpcqv2QVoKKjmZ7fCdfVnwElW/c82+FFF3qDK3YImer4DMRH+b1iM0rkpZw9WnqwsA
	bVlQTPJBvhygx2hurEA7bB+VtaWQ7XT8=
X-Gm-Gg: ASbGncuzuKwuC4h3zwC/ic/qX4ndGNsLF+9mzu6UDqDloPqtVdKDarO/Z6lvMx8Og3J
	fGRvHCmRjky+138vk2b181fA6Tiv1bN0M9+j6/JJ3yjMb7nHqbQWwM0byD5d9O14ZVCNeLVF2L1
	5E/amIvJd/ae85K0LOrBsAQt5aS6UeG9kUs2RlKtX0c1pp7e/Q06T2ZLoiCn6BjYJdHSsPcrPr6
	Q2ZejoY5IxupLSHojL0zVTf6GIagJT+E/WXhlG0/LMbX9JihaGdbG9vRnstruncLaRjp17gf0I+
	6FrJSnr5BXzOAdRkcMY=
X-Google-Smtp-Source: AGHT+IFhNfCSdGalSOf406WxoKMEjh2ITqWtl6zazWFVAs7ueoni8JgesPYbjGRu4NLpQW9g3l96QGzY8CifeXnMhgQ=
X-Received: by 2002:a17:90b:2888:b0:341:8bda:d0ae with SMTP id
 98e67ed59e1d1-341a6dd83b4mr10067477a91.20.1762447260941; Thu, 06 Nov 2025
 08:41:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761748557.git.lucien.xin@gmail.com> <a1df61880c9f424b49b2d4933e0d6ea0bf6da268.1761748557.git.lucien.xin@gmail.com>
 <635b0dad-98bf-41e9-b7b6-1f28da48fc00@redhat.com>
In-Reply-To: <635b0dad-98bf-41e9-b7b6-1f28da48fc00@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 6 Nov 2025 11:40:49 -0500
X-Gm-Features: AWmQ_bly4E8gAJHH1RdZ4TnHldWIBRhfNNyves1f0Q8O3wlRAgOEjU9eQ8XrsCA
Message-ID: <CADvbK_ft3jLQcQekNtUjs_Bot5LdfcyWHbrfAUp5XEAYncrs7w@mail.gmail.com>
Subject: Re: [PATCH net-next v4 10/15] quic: add packet number space
To: Paolo Abeni <pabeni@redhat.com>
Cc: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Benjamin Coddington <bcodding@redhat.com>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 7:17=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 10/29/25 3:35 PM, Xin Long wrote:
> > +struct quic_pnspace {
> > +     /* ECN counters indexed by direction (TX/RX) and ECN codepoint (E=
CT1, ECT0, CE) */
> > +     u64 ecn_count[QUIC_ECN_DIR_MAX][QUIC_ECN_MAX];
> > +     unsigned long *pn_map;  /* Bit map tracking received packet numbe=
rs for ACK generation */
> > +     u16 pn_map_len;         /* Length of the packet number bit map (i=
n bits) */
> > +     u8  need_sack:1;        /* Flag indicating a SACK frame should be=
 sent for this space */
> > +     u8  sack_path:1;        /* Path used for sending the SACK frame *=
/
> > +
> > +     s64 last_max_pn_seen;   /* Highest packet number seen before pn_m=
ap advanced */
> > +     u32 last_max_pn_time;   /* Timestamp when last_max_pn_seen was re=
ceived */
> > +     u32 max_time_limit;     /* Time threshold to trigger pn_map advan=
cement on packet receipt */
> > +     s64 min_pn_seen;        /* Smallest packet number received in thi=
s space */
> > +     s64 max_pn_seen;        /* Largest packet number received in this=
 space */
> > +     u32 max_pn_time;        /* Time at which max_pn_seen was received=
 */
> > +     s64 base_pn;            /* Packet number corresponding to the sta=
rt of the pn_map */
> > +     u32 time;               /* Cached current time, or time accept a =
socket (listen socket) */
>
> There are a few 32 bits holes above you could avoid reordering the fields=
.
I will switch base_pn and time.

For the hole after sack_path, It can't be avoided in this struct, I
will leave it there.

Thanks.

>
> Otherwise LGTM,
>
> Acked-by: Paolo Abeni <pabeni@redhat.com>
>

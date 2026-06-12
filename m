Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B289836A02E
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jun 2026 19:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293299; cv=pass; b=Aur6Gk1BFNZpziaMrb0b1ejSwrB4EtUUAcrCYGWd7qMeFL0gPX6TPkrntHxcNyRNtXAMWydVcYi40vZYq772L2mRb4QIchXN/+VtLZKnuyxDS4Ceir6q2MGBMzjQBX79inNWQT0IUeLFvcCMGIZyaFP/Nc4ZHXZHOMdYeKcK2nA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293299; c=relaxed/simple;
	bh=8ZLOGvGFodYhD0qua0VuzQdoTndbnD664tOVgr1qn2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olkpUZABD3/OOO1QYYbvWsGJ9U22t5Z5bmxoPM+RV6YrJn/1aXiPWJ9Tzc/WtmgDaSjjnjZKROKRZtcY1E+9C220dPfqYICG5NkKk4Eg//LUeBHYBiqSUHJsg9RTPqXM9nqPuzrPRDIUthM0z3hTTBaAaQd3IFSlzl/nVGxpLYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWCh3jnq; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWCh3jnq"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so1008973b3a.1
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jun 2026 12:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781293298; cv=none;
        d=google.com; s=arc-20240605;
        b=k3mDLaDZPa0dzRc7gZT4Ul/8KORDGlUmDdziW3fUS6kBMrToedShsmf5G7EtQ6t1Sv
         o1CxVZcGzJanrl66TXPsGouGq/1A44S0zdm3IRDNQfT+Q2u+7kNvoax5RG7LpJ/mpWQm
         Lqtat/j4mKgLUJ3nego8xpHagYNjki01fQ48ejVUc7+Kbby0yhk95ycQvNoDZQp6WgMV
         /GanDj1pJ9PqKl0O789EN0vQGtOMCLBxXwRYyx/1/gXUIrqWzcfkMwQnOikr1uJpwbAq
         frGcvz8kJ9A+3NCR/0o9YGhMAtu27nppkv8sdYZ//33wDTNaD5tDJW3kVEEt5aWEinmc
         nbRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Rbi30ru7gSioJ7/e48J895iPmcFfwsVcpIndfODcrgQ=;
        fh=o9Jnzd9eURQjD1IAfXA2q1pdH5AeWcx3riC6EDrxLY4=;
        b=FKxssiYrOZzYiRc9HlUmwmcQPvDz0P3KJWylxtOnwqEi8MW2EV9+0focdvLOcw0Yp1
         E0Y45nY7+ouE+yXJpQQNGvDjjKuS732LUmmzdU/O1N2ZplijmhmHq67jLysd1YKRXqL7
         svnUuSaVfRTl+xgE4iLLd1WeJjq47Lpqsghq/dM9PteVY37PAdEN4IfFRhFeXPwMabFy
         6C/Bi5gjZpMZSe7bVQZjEiQ+gWGkgdBiYqCRnZfXagD9Fvuiu4yRlf7DsAPyJNWxz4Eq
         CkQdk+fKpd623CpVnVUkl80Z5h77p6yUS/WEpD5HiL/S2rlEfbqPe2p/uO1cXRWan0/S
         sf6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781293298; x=1781898098; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rbi30ru7gSioJ7/e48J895iPmcFfwsVcpIndfODcrgQ=;
        b=JWCh3jnq+zTwsfa6e752v+Q5JnmwsoVUYM77XCTdbgwlC2nGIlRAtgJCS8twUSecAn
         V87l4ICHF08F30iThrDago3in+jRiAZDHrk9bxSk8hsoOhTY6EDfzse6IaeFse4lWLxM
         HxT4DjeKCyVGThPhQvz6TJnODVPsMh9F6ErwEAzfpDijAG+Y0wMHWIALMixGTz3ijICw
         ex3elnbR5WOjYKeRejQkJobEpXmdRptQTf5HOvpn7+zdtpmdW3pEA6YoPupQv+13K3JJ
         yQFw1XQIA2mNra1+iBe3iIcLZOtp2PvURswfL9y4u1Enb5zCZpmI3e5imriLkc0h4k31
         xFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293298; x=1781898098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rbi30ru7gSioJ7/e48J895iPmcFfwsVcpIndfODcrgQ=;
        b=Kg4qdQo76agh2Tv96rxNGOYkNbPJFXcQiXV4n7e7fChSayi+BGrQLu5DugI9uuI8XT
         25BACRuBBQ8aKZ9zQOO4tNUGl48heSENt1Jxcc756u3ctqjz7LQa+fUzz9O11QdKXWW3
         n0vy/zcFOB6Xt2nV3or0vwzL2GV+npLU/yXWLIlDFi/1D5pkuYJDCmvk0+Xck5Mc/XLN
         fiGCkZ3gMMIi3/IfCkjBt2ukM740he+o9UQO6M64ciCpSSJtO9ziQxXBYoOhgVaoEDLY
         NQfgZm3Tt2qwtVpFvrDWfXeRQ5vkJIDHo4pGKFs7vzrESEpjRGtq5Bxz1rpcMM458Gsp
         7hyw==
X-Forwarded-Encrypted: i=1; AFNElJ+hJi3kmRz57OBk3KB9x6xTGUqdNSKH+kuxIG1lB7ETcsa5Raoz1D24bksWQPkEtB2v0hPAlCAbSl7ylfoLQXZFKs6vnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRjkjFvBs7gRocyTJTW5YWwPn5GvkPGdYT5EOE1d/26lpmOkyD
	uFh8DLOFQZheA4ST4wUyw7TsyGyxLyx159+HbfaY8HNB0U0E8n9ckK9+emrCyr2frIfVIEV9+eq
	0amgi/SwVbQT78WJ+xNdgRmBZitdXK+c=
X-Gm-Gg: Acq92OGdLHzMTR4SkuSp9k0cnucACGbqzU2XbObbbIJKMxx8dMvk+ti6JrxJJ1LbgkY
	0t4CU6GoHtjwzYo+qNPnpo3FdWEq53QDQY3w/LGvYpmLAlORf5ZUL+TE5jRSaXOFBE6cHdmfCPV
	LdKYPhDkswxtZzkUPGy8kPiBHAac3rEY/ZwLOoAr2XhXvtfq/bYW5a+z3U29hsXR3jCDOjdU0e0
	Ht2LyGj/N+j8CyLxRMH1GiZF92GGAzqBM8lkbY8JuyKavg4lkcCWD2dOpC7zf0aWxMy6AQrQqqN
	oxBO1AhVhOGFj48pMFE2kZQBaAuw5OavnbWvSSjJ6R90vyOUfA8ZKWjy8aK8IE89JKPnyA9cufc
	Z5U6pE8ZQugOH3H+G
X-Received: by 2002:a05:6a00:18aa:b0:842:4387:34b7 with SMTP id
 d2e1a72fcca58-8434cd41f33mr4652675b3a.10.1781293298066; Fri, 12 Jun 2026
 12:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1780855296.git.lucien.xin@gmail.com> <e73d8f69b67fdeeec076fbe772ca465d7e1af4cb.1780855297.git.lucien.xin@gmail.com>
In-Reply-To: <e73d8f69b67fdeeec076fbe772ca465d7e1af4cb.1780855297.git.lucien.xin@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 12 Jun 2026 15:41:26 -0400
X-Gm-Features: AVVi8CccjtCVNlXysoHMU93ce-8zqlj8T5zFjNLF2CVr-6fSHzwtKPVAgQLYHfw
Message-ID: <CADvbK_e7wpf=-C9h97b2JWUMQ6YkQLtVeTcxxCdQPaFTN+Litw@mail.gmail.com>
Subject: Re: [PATCH net-next v13 04/15] quic: provide family ops for address
 and protocol
To: network dev <netdev@vger.kernel.org>, quic@lists.linux.dev
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>, 
	Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, Tom Talpey <tom@talpey.com>, 
	kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>, 
	Jeff Layton <jlayton@kernel.org>, Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>, 
	Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe" <alibuda@linux.alibaba.com>, 
	Jason Baron <jbaron@akamai.com>, illiliti <illiliti@protonmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Daniel Stenberg <daniel@haxx.se>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	mef@scarletmail.rutgers.edu, paul@jakma.org
Content-Type: text/plain; charset="UTF-8"

[sashiko-claude]

> +static void quic_v4_lower_xmit(struct sock *sk, struct sk_buff *skb,
> +        struct flowi *fl)
> +{
> + struct quic_skb_cb *cb = QUIC_SKB_CB(skb);
> + u8 tos = (inet_sk(sk)->tos | cb->ecn), ttl;
> + struct flowi4 *fl4 = &fl->u.ip4;
> + struct dst_entry *dst;
> + __be16 df = 0;
> +
> + pr_debug("%s: skb: %p, len: %d, num: %llu, %pI4:%d -> %pI4:%d\n",
> + __func__, skb, skb->len, cb->number, &fl4->saddr,
> + ntohs(fl4->fl4_sport), &fl4->daddr, ntohs(fl4->fl4_dport));
Should cb->number use %lld here rather than %llu? Looking at struct
quic_skb_cb in net/quic/common.h:
    s64 number;  /* Parsed packet number, or the largest previously seen */
Since number is s64, a negative initial value (such as -1 for "largest
previously seen") would be printed as 18446744073709551615 with %llu, and
compilers with -Wformat-signedness flag the mismatch.
[ ... ]
> +static void quic_v6_lower_xmit(struct sock *sk, struct sk_buff *skb,
> +        struct flowi *fl)
> +{
> + struct quic_skb_cb *cb = QUIC_SKB_CB(skb);
> + u8 tc = (inet6_sk(sk)->tclass | cb->ecn), ttl;
> + struct flowi6 *fl6 = &fl->u.ip6;
> + struct dst_entry *dst;
> + __be32 label;
> +
> + pr_debug("%s: skb: %p, len: %d, num: %llu, %pI6c:%d -> %pI6c:%d\n",
> + __func__, skb, skb->len, cb->number, &fl6->saddr,
> + ntohs(fl6->fl6_sport), &fl6->daddr, ntohs(fl6->fl6_dport));
Same question about cb->number being printed with %llu while the field is
declared s64.

A minor one but legit, will fix it.

Thanks.

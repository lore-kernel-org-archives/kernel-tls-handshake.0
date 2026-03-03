Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DA33090C4
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  3 Mar 2026 09:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772529413; cv=none; b=hCoKMBNQ1/RurFz5kqfPOTNuWNCr10eDQ6K7586nNcj04i1TxM668XuyTifPW0SUbzU/EpkMsAcV9Qo2WYtY05bSZztaLd7Rn1QBIJBbehwKTL5tVwYGL5Lj9uqeZqcwxNLme3ZljruupFrGBU4RxU4oSDeEcelZipZYajyIYp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772529413; c=relaxed/simple;
	bh=N9T9tK8lrPlBnjE46aPR6EPWJfEat41vQnH/NRbnpNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F6T4jitmZm6SCH7AmlQ5W3EZrXDourvYWkAR1eCj0xU27sVAgZTc3uOS5Mp+go98nMlSyymN8SDTmos2RduJNQNsxC+J8lJfJaYBQgX/zDSeffAQem8g3RcEpPcO1zNwGZHpQ8nfb37fj6pC87IKCDeWHMSjhIbntQKGnLPrOY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IiAQ0aY1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IiAQ0aY1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772529411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=477xItCgA+po7bLgye1fu2Qz+J42vgm/OW+kOSIs1X8=;
	b=IiAQ0aY1wDeTtWDXCiITY0m4L3iGOiSmjHKz/89SUoyAs8BzvYcqPU4YnuMtz6suQMt02B
	cooN0dM6DrGgyXCL6lURld/xsr7pVxxEe+fgpZ1sTbBHFRqg33aTYqrkYiMDAHsZ8TCfLx
	1WZKuVi3rq8gOtLnxIpXpq5SmY70X+0=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-39GftotZOwyb45oOOcoHWQ-1; Tue, 03 Mar 2026 04:16:49 -0500
X-MC-Unique: 39GftotZOwyb45oOOcoHWQ-1
X-Mimecast-MFC-AGG-ID: 39GftotZOwyb45oOOcoHWQ_1772529409
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7987dc43f36so86983247b3.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 03 Mar 2026 01:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529409; x=1773134209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=477xItCgA+po7bLgye1fu2Qz+J42vgm/OW+kOSIs1X8=;
        b=P7GfGhdBMxN8V3CGHpl28/hV8A/oRGKvKVTukt+f4lKPAlA6FG7CwVO8dyZVcz10re
         csl4D+tAMJL3Nr60lNcp/lu3vjqeX8nxygFR4KpKQFf4/fyhX2IiAFgFDvUgnkWG/3Xb
         pgtnh72zf7c2hfDUsXBsYh2YQUwPowLBzbky5+O0+GifyBF+q5a/4a4Wdz9YTqdxOKGS
         jTIAXSBPpjJwoSM3nrLuLznxYuCxdfLT9yPuapeql+mJH1iWy6r2SbDFYMtKWyH8zfoF
         y76LEAa5I/orip7muPZMzi7N9Ww7qbPYgY0h38tUGuedyLGNH/ZsxG+WeV2HQrLakdPQ
         GEtw==
X-Forwarded-Encrypted: i=1; AJvYcCWx7ZP75pQZdO7cWXl1/cJPiqd0WU5VtWFI+vT+rcwsHUOKd9nVVqpP4v7GvozQgudDkkxUPLnOBWwvYPE/56To1EHLJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YysFIAqEwzTqWOxIMFCXAlYi3r2pbs9B+DHcHPApl+dlmisVnkz
	dX5b/S4z+ykurT8wRU4mwfiC81xWARyOQjyERLmuJvs02Olw6xkR4dSxLYnJhZFu55z29HiMf7c
	OwYTZ75Bk+FmPIE/azH4C8B2yJzSuCje1fNpYm2iAnyLWqOStAfiYwm2++/ebizJd/T9IJaltjW
	XeSylGaueH3yUndk8oVdKvU3tQIEtKsyYq6/22ytsUD/EnjmVN34w=
X-Gm-Gg: ATEYQzzhjhIVpKn3HMlHCrBlRB27WrRuZWQLPCTlW87e1QLt+H93h/rSBpRKkuYm7gf
	NxmeQTenWOA929s0yWhBEMIx2EdQ+xpUGY0RWMcIqSlM3jzGwgI2VqV7/+vwoIm7pvIW/r9gaYa
	4NEwtjEh8SGhUO5YM8Hhtf+DRwqj7NjeD6Cj5cH341vHWCXWV56slQMHbcvkd9LTOwbqZdKGm7N
	gOSoX0=
X-Received: by 2002:a05:690c:e373:b0:797:cd05:bcfa with SMTP id 00721157ae682-79885631b64mr135971477b3.56.1772529409177;
        Tue, 03 Mar 2026 01:16:49 -0800 (PST)
X-Received: by 2002:a05:690c:e373:b0:797:cd05:bcfa with SMTP id
 00721157ae682-79885631b64mr135971217b3.56.1772529408805; Tue, 03 Mar 2026
 01:16:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1771986861.git.lucien.xin@gmail.com> <08a63705058aff77dd54fb388870f0bca6036c95.1771986861.git.lucien.xin@gmail.com>
In-Reply-To: <08a63705058aff77dd54fb388870f0bca6036c95.1771986861.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Date: Tue, 3 Mar 2026 10:16:37 +0100
X-Gm-Features: AaiRm51KQx9VYE8xMRhcvcGF5sOeXsvvCe5N0-c4bJqQWqxzxGk3Zy5J02q8C_U
Message-ID: <CAF6piCKOiwMz9Le2vBV4_W3R0NR3TW_je+ow4SCm5eX867awyg@mail.gmail.com>
Subject: Re: [PATCH net-next v10 15/15] quic: add packet parser base
To: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>, quic@lists.linux.dev
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>, 
	Simon Horman <horms@kernel.org>, Stefan Metzmacher <metze@samba.org>, Moritz Buhl <mbuhl@openbsd.org>, 
	Tyler Fanelli <tfanelli@redhat.com>, Pengtao He <hepengtao@xiaomi.com>, 
	Thomas Dreibholz <dreibh@simula.no>, linux-cifs@vger.kernel.org, 
	Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev, 
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>, Alexander Aring <aahringo@redhat.com>, 
	David Howells <dhowells@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, 
	John Ericson <mail@johnericson.me>, Cong Wang <xiyou.wangcong@gmail.com>, 
	"D . Wythe" <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>, 
	illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Daniel Stenberg <daniel@haxx.se>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	"Marc E . Fiuczynski" <marc@fiuczynski.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2i3TEjcc7PDvtnwUhGoWWSzs6JDJqPBZ5SupkDY4bkE_1772529409
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On 2/25/26 3:34 AM, Xin Long wrote:
> +/* Find the listening QUIC socket for an incoming packet.
> + *
> + * This function searches the QUIC socket table for a listening socket that matches the dest
> + * address and port, and the ALPN(s) if presented in the ClientHello.  If multiple listening
> + * sockets are bound to the same address, port, and ALPN(s) (e.g., via SO_REUSEPORT), this
> + * function selects a socket from the reuseport group.
> + *
> + * Return: A pointer to the matching listening socket, or NULL if no match is found.
> + */
> +struct sock *quic_listen_sock_lookup(struct sk_buff *skb, union quic_addr *sa, union quic_addr *da,
> +                                  struct quic_data *alpns)
> +{
> +     struct net *net = sock_net(skb->sk);
> +     struct hlist_nulls_node *node;
> +     struct sock *sk = NULL, *tmp;
> +     struct quic_shash_head *head;
> +     struct quic_data alpn;
> +     union quic_addr *a;
> +     u32 hash, len;
> +     u64 length;
> +     u8 *p;
> +
> +     hash = quic_listen_sock_hash(net, ntohs(sa->v4.sin_port));
> +     head = quic_listen_sock_head(hash);
> +
> +     rcu_read_lock();
> +begin:
> +     if (!alpns->len) { /* No ALPN entries present or failed to parse the ALPNs. */
> +             sk_nulls_for_each_rcu(tmp, node, &head->head) {
> +                     /* If alpns->data != NULL, TLS parsing succeeded but no ALPN was found.
> +                      * In this case, only match sockets that have no ALPN set.
> +                      */
> +                     a = quic_path_saddr(quic_paths(tmp), 0);
> +                     if (net == sock_net(tmp) && quic_cmp_sk_addr(tmp, a, sa) &&
> +                         quic_path_usock(quic_paths(tmp), 0) == skb->sk &&
> +                         (!alpns->data || !quic_alpn(tmp)->len)) {
> +                             sk = tmp;
> +                             if (!quic_is_any_addr(a)) /* Prefer specific address match. */
> +                                     break;
> +                     }
> +             }
> +             goto out;
> +     }
> +
> +     /* ALPN present: loop through each ALPN entry. */
> +     for (p = alpns->data, len = alpns->len; len; len -= length, p += length) {
> +             quic_get_int(&p, &len, &length, 1);
> +             quic_data(&alpn, p, length);
> +             sk_nulls_for_each_rcu(tmp, node, &head->head) {
> +                     a = quic_path_saddr(quic_paths(tmp), 0);
> +                     if (net == sock_net(tmp) && quic_cmp_sk_addr(tmp, a, sa) &&
> +                         quic_path_usock(quic_paths(tmp), 0) == skb->sk &&
> +                         quic_data_has(quic_alpn(tmp), &alpn)) {
> +                             sk = tmp;
> +                             if (!quic_is_any_addr(a))
> +                                     break;
> +                     }
> +             }
> +             if (sk)
> +                     break;
> +     }
> +out:
> +     /* If the nulls value we got at the end of the iteration is different from the expected
> +      * one, we must restart the lookup as the list was modified concurrently.
> +      */
> +     if (!sk && get_nulls_value(node) != hash)
> +             goto begin;
> +
> +     if (sk && sk->sk_reuseport)
> +             sk = reuseport_select_sock(sk, quic_addr_hash(net, da), skb, 1);
> +
> +     if (sk && unlikely(!refcount_inc_not_zero(&sk->sk_refcnt)))
> +             sk = NULL;

Note that you could avoid the refcount if you keep using the sk in an
RCU critical section. i.e. plain UDP does that. Same consideration for
established lookup.


/P


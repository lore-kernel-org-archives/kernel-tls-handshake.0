Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CE3374E69
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  3 Mar 2026 09:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772529545; cv=none; b=DBIfkQrsBm8pA7ig/i0VgVSEVNyjgw4vC27tRVaTv84khTJoOXy7ti13UtKkMzKGVkTmWP3ufWfTqPrLVZM8cM/LLRE4/SrAUtvJhvAl50d9vk94oXY2rxamSx5xFTh4hO8soNe9Ob04FCGtpzq5Bl+2yBY3HCOk7Z3xg4EJfSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772529545; c=relaxed/simple;
	bh=Sl9s33PI2gXIErv/itE1S5taIbog6hFU7zftnmcZCok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkxRyDR+GbRN7RAr8HYoNy3B0UiX7TsVItPa1iVbUC67i8WZ0yMssyMlrRofThpTHYxJ/02ejyqngPNGoDh1RPowjke9DsKtNl6YUpmtu082xVaKDrBS1LMcB3vXFntDcKxk/koYDA6kKdIODV7dD8JZP0Dj0E5b/glRqDstKfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pjel4fTi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pjel4fTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772529542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S88HPomaSqnbxnsyYWFXX9R+c+6772O9y0Gq71iEev0=;
	b=Pjel4fTi4O9ij1KZwh3ha2rSWqn6CsUTs3tZUGzLDvT0YoJHu7/nVo06nTXticXLHr6wMw
	+LxBKgagqfECZHoZ9aAY7d9HllEzhKp+YJ+X1OPM22XTgi2AjX8e4Yr346qPwRXNsrMPNG
	nvDFPaWmgabc31X+C4Ms8dUExIB6AVM=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-r6aaWGzyM3--or4NX9vQ5w-1; Tue, 03 Mar 2026 04:19:01 -0500
X-MC-Unique: r6aaWGzyM3--or4NX9vQ5w-1
X-Mimecast-MFC-AGG-ID: r6aaWGzyM3--or4NX9vQ5w_1772529541
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-794d80fea59so86079387b3.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 03 Mar 2026 01:19:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529541; x=1773134341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S88HPomaSqnbxnsyYWFXX9R+c+6772O9y0Gq71iEev0=;
        b=DkXTihTAH449E84T6VIXkbIkIbTqHdkuAU0xnvUx0kRHSJbQYFY6wqvw6LIBdR7o6s
         F5VmWcGibU0W+IVjxOqRWifah8S3wIafhZs8cnZIbggkkYtouwijhK4Sq/weguCV7L+I
         MnZPzbTbWWhTBOuBZ3XpUEONIoBENUb04qS+Y80MFpmBQn5526c+C5wDggc8QE2hXqx5
         mIBhGDtpQkXS0XvE2oj72GuiJhdKNYKEZL+QQcnrFsdM2IRJ1qq17q8u6bVOkgYnjLLp
         //W9nr3bSPGvNMo3edTXCRTHYRR+8+Mcdssf3PsFbJRJaZ1w+2fOkkJ6iTNjxYeVfkMS
         zZ2w==
X-Forwarded-Encrypted: i=1; AJvYcCXiiBeTnhPGTNhyKINRAj3YIdzKToJSG8EQisbNQZ+1ctUhBpBPISuqgc5zoFeH3RSILyu67EhLRw+kj6keSecT8GoQMA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/zelg+j6OJpw+s7W6AFFKn0z899DiUg2ZIF3xbUzOCHZt00DO
	8f7Vrd4nxu0RwpLtIDzy4Pk9jDz75r+ZLS6KZvz1ZoLFOEZhK5U7vo/P84wrT8GThiC7Ksz1ddF
	06/zxeFlNU5Pzx/ciwDdre0L3g2J+aHQ4K/PnxccGYrSvOH+rlbM7iDeBbCrF5PFyc/1yCcOq8t
	8rRCyY4mA9mrfmhxhMWikMkiNox18U0ZkyYHB64OGTMspg+5Dd918=
X-Gm-Gg: ATEYQzxzNzoKFMtRXYNGgjgPyM+yiqxLmUpYrLMyegfk/p0osg8iVuz5ByCBrzEsLjv
	FB7F1G8GVlTArXFvjLLtK+12fDSe5yqc+E//7hzFIHYUEeQaTbYN9w2+wSa8ohuDJ4oVLFGQV2c
	siqeqELO9JvDRN6K6aYPT45/X7IyXIj4U6QjF2Iz7uoK5Dq5tX2piGeWG3JcOlPH9bK0YA2p7z0
	KLfaTA=
X-Received: by 2002:a05:690c:89:b0:798:67be:f8fa with SMTP id 00721157ae682-798854ef3aamr139425997b3.17.1772529541191;
        Tue, 03 Mar 2026 01:19:01 -0800 (PST)
X-Received: by 2002:a05:690c:89:b0:798:67be:f8fa with SMTP id
 00721157ae682-798854ef3aamr139425527b3.17.1772529540751; Tue, 03 Mar 2026
 01:19:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1771986861.git.lucien.xin@gmail.com> <e49a24b97a25a9c25bd33411b8212978dd566bd3.1771986861.git.lucien.xin@gmail.com>
In-Reply-To: <e49a24b97a25a9c25bd33411b8212978dd566bd3.1771986861.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Date: Tue, 3 Mar 2026 10:18:49 +0100
X-Gm-Features: AaiRm53rJ3wV-QBG6V--xu4Px23a7wXyR_Jsp_m9nNP5uOat2VsXjJ9xQsdj7Tk
Message-ID: <CAF6piCJDWjOmgkspuk28qAF8+9xj_o-zTXkUdB+3_waZqaMXBA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 14/15] quic: add packet builder base
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
X-Mimecast-MFC-PROC-ID: UAhQQ3VtkiRJH-f7F5Xbcg0vP2W9YZtonYZRdivyIx0_1772529541
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On 2/25/26 3:34 AM, Xin Long wrote:
> +/* Transmit a QUIC packet, possibly encrypting and bundling it. */
> +int quic_packet_xmit(struct sock *sk, struct sk_buff *skb)
> +{
> +     struct quic_packet *packet = quic_packet(sk);
> +     struct quic_skb_cb *cb = QUIC_SKB_CB(skb);
> +     struct net *net = sock_net(sk);
> +     int err;
> +
> +     /* Skip encryption if taglen == 0 (e.g., disable_1rtt_encryption). */
> +     if (!packet->taglen[quic_hdr(skb)->form])
> +             goto xmit;
> +
> +     cb->crypto_done = quic_packet_encrypt_done;
> +     /* Associate skb with sk to ensure sk is valid during async encryption completion. */
> +     WARN_ON(!skb_set_owner_sk_safe(skb, sk));

This is the TX path, how can sk refcout be 0 here? Possibly use
skb_set_owner_r() directly? At least use the WARN_ON_ONCE() variant and
add a comment documenting why is needed.

> +     err = quic_crypto_encrypt(quic_crypto(sk, packet->level), skb);
> +     if (err) {
> +             if (err != -EINPROGRESS) {
> +                     QUIC_INC_STATS(net, QUIC_MIB_PKT_ENCDROP);
> +                     kfree_skb(skb);
> +                     return err;
> +             }
> +             QUIC_INC_STATS(net, QUIC_MIB_PKT_ENCBACKLOGS);
> +             return err;
> +     }
> +     if (!cb->resume) /* Encryption completes synchronously. */
> +             QUIC_INC_STATS(net, QUIC_MIB_PKT_ENCFASTPATHS);
> +
> +xmit:
> +     if (quic_packet_bundle(sk, skb))
> +             quic_packet_flush(sk);
> +     return 0;
> +}
> +
> +/* Create and transmit a new QUIC packet. */
> +int quic_packet_create_and_xmit(struct sock *sk)
> +{
> +     struct quic_packet *packet = quic_packet(sk);
> +     struct sk_buff *skb;
> +     int err;
> +
> +     err = quic_packet_number_check(sk);
> +     if (err)
> +             goto err;
> +
> +     if (packet->level)
> +             skb = quic_packet_handshake_create(sk);
> +     else
> +             skb = quic_packet_app_create(sk);
> +     if (!skb) {
> +             err = -ENOMEM;
> +             goto err;
> +     }
> +
> +     err = quic_packet_xmit(sk, skb);
> +     if (err && err != -EINPROGRESS)
> +             goto err;
> +
> +     /* Return 1 if at least one ACK-eliciting (non-PING) frame was sent. */
> +     return !!packet->frames;
> +err:
> +     pr_debug("%s: err: %d\n", __func__, err);
> +     return 0;
> +}
> +
> +/* Flush any coalesced/bundled QUIC packets. */
> +void quic_packet_flush(struct sock *sk)
> +{
> +     struct quic_path_group *paths = quic_paths(sk);
> +     struct quic_packet *packet = quic_packet(sk);
> +
> +     if (packet->head) {
> +             quic_lower_xmit(sk, packet->head,
> +                             quic_path_daddr(paths, packet->path), &paths->fl);
> +             packet->head = NULL;
> +     }
> +}
> +
> +void quic_packet_init(struct sock *sk)
> +{
> +     struct quic_packet *packet = quic_packet(sk);
> +
> +     INIT_LIST_HEAD(&packet->frame_list);
> +     packet->taglen[0] = QUIC_TAG_LEN;
> +     packet->taglen[1] = QUIC_TAG_LEN;
> +     packet->mss[0] = QUIC_MIN_UDP_PAYLOAD;
> +     packet->mss[1] = QUIC_MIN_UDP_PAYLOAD;

The magic number above looks quite obscure, and AFAICS looking at struct
quick_packet comments have different meaning. Please use some macro instead.


/P


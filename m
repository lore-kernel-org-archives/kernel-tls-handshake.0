Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1509B387567
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  3 Mar 2026 08:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772526853; cv=none; b=tMrn56P5EQc1/Da2l32BG9bm3r8J/EvdirBAI17cIO/eC8NOVbPXCpDAj6ALklnjsh01Q574iSxq0rv2u2pjvVi/qTph6WlXEZDoGbV75l5fj2ibMLGM0tR4lzw1oTSZba3KmubeQmf/ptav8ik6kZU3ijHy0VzCipqjtnOostU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772526853; c=relaxed/simple;
	bh=28/2SD0zKnxVxONz58kqvH8l9p8IW3PnbEu16NUlN4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=bWvGZ4YL2Grmk51X3a7du8+e7YegU0YI9bS1LsWzqXg7omJ23yd1cHeS0bMvAMJH5Zcb02HWBr8jFTWHHxmhd1hn2kbz7NYh0DP8joyWrHRyjHdMSvdAIbzcFOcVWUMSBBYM4n86CBahid9ruiVc64/1b8/LsWbVx39KnFRxZ+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MV9hFJIm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MV9hFJIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772526851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oGGteXDhadojqghSFLLImSNgVRBGSngpOjwddhC7BTg=;
	b=MV9hFJImL9+cj7wRN0o2RJHW3/txoqFGnJwpQB7Tz5Wep6LkHbn6ThyqtIbODzBXIpwskZ
	XSi+6xkJgF/3EavDW1opaTjJnhZ8b45Ok18NaiES8V/C6HUoXGfrEcOjIc6ArVO5WlNU9x
	C2ipTTk7rPcJScsvPq0kgIYkYMJATw8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-UHN8XmceNhG8w14WNhQxuw-1; Tue,
 03 Mar 2026 03:34:08 -0500
X-MC-Unique: UHN8XmceNhG8w14WNhQxuw-1
X-Mimecast-MFC-AGG-ID: UHN8XmceNhG8w14WNhQxuw_1772526844
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 63C481956048;
	Tue,  3 Mar 2026 08:34:04 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.224.134])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6964219560A2;
	Tue,  3 Mar 2026 08:33:54 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: lucien.xin@gmail.com
Cc: hepengtao@xiaomi.com,
	kuba@kernel.org,
	jlayton@kernel.org,
	metze@samba.org,
	davem@davemloft.net,
	kernel-tls-handshake@lists.linux.dev,
	horms@kernel.org,
	hare@suse.de,
	aahringo@redhat.com,
	tfanelli@redhat.com,
	mail@johnericson.me,
	andrew.gospodarek@broadcom.com,
	linkinjeon@kernel.org,
	dhowells@redhat.com,
	matttbe@kernel.org,
	xiyou.wangcong@gmail.com,
	dreibh@simula.no,
	jbaron@akamai.com,
	quic@lists.linux.dev,
	pc@manguebit.com,
	marc@fiuczynski.com,
	edumazet@google.com,
	pabeni@redhat.com,
	alibuda@linux.alibaba.com,
	steved@redhat.com,
	illiliti@protonmail.com,
	tom@talpey.com,
	marcelo.leitner@gmail.com,
	sd@queasysnail.net,
	linux-cifs@vger.kernel.org,
	netdev@vger.kernel.org,
	mbuhl@openbsd.org,
	smfrench@gmail.com,
	chuck.lever@oracle.com,
	daniel@haxx.se
Subject: Re: [net-next,v10,15/15] quic: add packet parser base
Date: Tue,  3 Mar 2026 09:33:51 +0100
Message-ID: <20260303083351.35558-1-pabeni@redhat.com>
In-Reply-To: <08a63705058aff77dd54fb388870f0bca6036c95.1771986861.git.lucien.xin@gmail.com>
References: <08a63705058aff77dd54fb388870f0bca6036c95.1771986861.git.lucien.xin@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 4ZviMmRN4mGH6MAzNComtJLLeA0qOCHV4pM7xm4dD7s_1772526844
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
quic: add packet parser base

This patch uses 'quic_packet' to handle packing of QUIC packets on the
receive (RX) path. It introduces mechanisms to parse the ALPN from
client Initial packets to determine the correct listener socket.
Received packets are then routed and processed accordingly.

> diff --git a/net/quic/packet.c b/net/quic/packet.c
> index a56edc745bb1..a23ce99a6656 100644
> --- a/net/quic/packet.c
> +++ b/net/quic/packet.c

[ ... ]

> +/* Extract the Destination Connection ID (DCID) from a QUIC Long header packet. */
> +int quic_packet_get_dcid(struct quic_conn_id *dcid, struct sk_buff *skb)
> +{
> +	u32 plen = skb->len;
> +	u8 *p = skb->data;
> +	u64 len;
> +
> +	if (plen < QUIC_HLEN + QUIC_VERSION_LEN)
> +		return -EINVAL;
> +	plen -= (QUIC_HLEN + QUIC_VERSION_LEN);
> +	p += (QUIC_HLEN + QUIC_VERSION_LEN);
> +
> +	if (!quic_get_int(&p, &plen, &len, 1) ||
> +	    len > plen || len > QUIC_CONN_ID_MAX_LEN)
> +		return -EINVAL;
> +	quic_conn_id_update(dcid, p, len);
> +	return 0;
> +}

This parsing logic looks nearly identical to what's already in
quic_packet_get_version_and_connid().  Both skip QUIC_HLEN +
QUIC_VERSION_LEN, read the length byte, validate against
QUIC_CONN_ID_MAX_LEN, and call quic_conn_id_update().

Could quic_packet_get_dcid() call quic_packet_get_version_and_connid()
with dummy parameters, or could both share a helper to extract just the
DCID portion?

> diff --git a/net/quic/path.c b/net/quic/path.c
> index 9414c4f813c5..655f38af4107 100644
> --- a/net/quic/path.c
> +++ b/net/quic/path.c
> @@ -17,6 +17,8 @@
>  #include "family.h"
>  #include "path.h"
>
> +extern int quic_packet_rcv(struct sock *sk, struct sk_buff *skb, u8 err);

Could this include packet.h instead? The canonical declaration already
exists in packet.h (after this patch). Using 'extern' here creates a
duplicate signature.

If the signature in packet.h changes later, this extern could silently
become stale depending on calling conventions. Since packet.h has no
include directives and wouldn't create a circular dependency, including
it would keep the declaration in sync.

> +
>  static int quic_udp_rcv(struct sock *sk, struct sk_buff *skb)
>  {
>  	memset(skb->cb, 0, sizeof(skb->cb));


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EB6386439
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  3 Mar 2026 08:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772526763; cv=none; b=jR4WC+UMjpRx27Ij09ELi597hsO1atWcAIMQ+cKE2cAQjsKQNeily8WsPtOc6EQEzdMaBR6byqrX+JiEyoYebh5Bz3KNmvEuXYjTViDTvhI8ZSk70AQGR0aP32zj1IeGuiA0OMinoLji/rt09AkMS4BtV/07Xf0RMwjgtkC4yGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772526763; c=relaxed/simple;
	bh=FDSjuzY6hMZPE04VNEJP3p8dG4uM+M/S2ykDYAY1P3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=WpkfFtlbUs0M2ma9ecqY6nzYxIkOvAzvNhjxTqLmPpB6hZZjYXUx/D3oxUd2wvbV95WPBwOb8pRjn8ag4Jpn8e5/JYMJt1YRFjS7cl17Q2VAR+ywIaLxBUj0iowTXNf9zSjcqn7n8NxgGxPe8Jp/zf+RZLu83cRo/Mt6eDj+HiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FAqIrF+6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FAqIrF+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772526761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VT2PbwgHCZmFJY4Anjkzq4dQuDVtPyqb9ilb2LUJp20=;
	b=FAqIrF+64Mqy6f1lGiFug6UCOYqHDp19MU7+F0BtPzCKxhuLQxmH4ofixosJy/TKIhCsj0
	dmJiS5X9ZbjvSPHaHzASgd1lejfaKbtJs7qTmOZD5lpD7EkX1rHczH+chDLauKceUgL2ZY
	U2+dgcvLTR9QhTVY4/y+zriD1AIi12w=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-144-A8icytc_MZKTu22j2yIRsw-1; Tue,
 03 Mar 2026 03:32:37 -0500
X-MC-Unique: A8icytc_MZKTu22j2yIRsw-1
X-Mimecast-MFC-AGG-ID: A8icytc_MZKTu22j2yIRsw_1772526754
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D65361800352;
	Tue,  3 Mar 2026 08:32:32 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.224.134])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 36C1E1956053;
	Tue,  3 Mar 2026 08:32:20 +0000 (UTC)
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
Subject: Re: [net-next,v10,09/15] quic: add congestion control
Date: Tue,  3 Mar 2026 09:32:07 +0100
Message-ID: <20260303083207.34631-1-pabeni@redhat.com>
In-Reply-To: <91c5313a4c6675fc9f98efbafc92ca162a6e7d66.1771986861.git.lucien.xin@gmail.com>
References: <91c5313a4c6675fc9f98efbafc92ca162a6e7d66.1771986861.git.lucien.xin@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: vovHVkfHekVAHbzCzZPr8rTyhL02V3hhuVLeICwmnAo_1772526754
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
quic: add congestion control

This patch introduces quic_cong for RTT measurement and congestion
control, implementing a state machine with slow start, congestion
avoidance, and recovery phases using the New Reno algorithm.

Signed-off-by: Xin Long <lucien.xin@gmail.com>

> diff --git a/net/quic/Makefile b/net/quic/Makefile
> index 1565fb5cef9d..4d4a42c6d565 100644
> --- a/net/quic/Makefile
> +++ b/net/quic/Makefile
> @@ -5,4 +5,5 @@
>
>  obj-$(CONFIG_IP_QUIC) += quic.o
>
> -quic-y := common.o family.o protocol.o socket.o stream.o connid.o path.o
> +quic-y := common.o family.o protocol.o socket.o stream.o connid.o path.o \
> +	  cong.o
> diff --git a/net/quic/cong.c b/net/quic/cong.c
> new file mode 100644
> index 000000000000..e0f78ecb00e4
> --- /dev/null
> +++ b/net/quic/cong.c

[ ... ]

> +static void quic_reno_on_packet_lost(struct quic_cong *cong, u64 time, u32 bytes, s64 number)
> +{
> +	if (quic_cong_check_persistent_congestion(cong, time))
> +		return;
> +
> +	switch (cong->state) {
> +	case QUIC_CONG_SLOW_START:
> +		pr_debug("%s: slow_start -> recovery, cwnd: %u, ssthresh: %u\n",
> +			 __func__, cong->window, cong->ssthresh);
> +		break;
> +	case QUIC_CONG_RECOVERY_PERIOD:
> +		return;
> +	case QUIC_CONG_CONGESTION_AVOIDANCE:
> +		pr_debug("%s: cong_avoid -> recovery, cwnd: %u, ssthresh: %u\n",
> +			 __func__, cong->window, cong->ssthresh);
> +		break;
> +	default:
> +		pr_debug("%s: wrong congestion state: %d\n", __func__, cong->state);
> +		return;
> +	}
> +
> +	cong->recovery_time = cong->time;
> +	cong->state = QUIC_CONG_RECOVERY_PERIOD;
> +	cong->ssthresh = max(cong->window >> 1U, cong->min_window);
> +	cong->window = cong->ssthresh;
> +}

[ ... ]

> +static void quic_reno_on_process_ecn(struct quic_cong *cong)
> +{
> +	switch (cong->state) {
> +	case QUIC_CONG_SLOW_START:
> +		pr_debug("%s: slow_start -> recovery, cwnd: %u, ssthresh: %u\n",
> +			 __func__, cong->window, cong->ssthresh);
> +		break;
> +	case QUIC_CONG_RECOVERY_PERIOD:
> +		return;
> +	case QUIC_CONG_CONGESTION_AVOIDANCE:
> +		pr_debug("%s: cong_avoid -> recovery, cwnd: %u, ssthresh: %u\n",
> +			 __func__, cong->window, cong->ssthresh);
> +		break;
> +	default:
> +		pr_debug("%s: wrong congestion state: %d\n", __func__, cong->state);
> +		return;
> +	}
> +
> +	cong->recovery_time = cong->time;
> +	cong->state = QUIC_CONG_RECOVERY_PERIOD;
> +	cong->ssthresh = max(cong->window >> 1U, cong->min_window);
> +	cong->window = cong->ssthresh;
> +}

This isn't a bug, but these two functions share almost identical logic
for entering the recovery state. The switch statement has the same three
cases with identical handling in both functions, and the four-line
recovery-entry block at the end is exactly the same:

    cong->recovery_time = cong->time;
    cong->state = QUIC_CONG_RECOVERY_PERIOD;
    cong->ssthresh = max(cong->window >> 1U, cong->min_window);
    cong->window = cong->ssthresh;

The only difference is quic_reno_on_packet_lost() checks for persistent
congestion first. Would factoring this shared logic into a helper
function make future maintenance easier and ensure the recovery path
stays consistent across both ECN and loss events?

[ ... ]

> +void quic_cong_set_algo(struct quic_cong *cong, u8 algo)
> +{
> +	/* The caller must ensure algo < QUIC_CONG_ALG_MAX. */
> +	cong->algo = algo;
> +	cong->state = QUIC_CONG_SLOW_START;
> +	cong->ssthresh = U32_MAX;
> +	cong->ops = &quic_congs[algo];
> +	cong->ops->on_init(cong);
> +}

Should this function validate the algo parameter? The comment says the
caller must ensure algo is less than QUIC_CONG_ALG_MAX, but there's no
runtime check. Since QUIC_CONG_ALG_MAX is defined in the UAPI and this
function is exported in cong.h, could a future caller (for example, a
setsockopt path accepting user-supplied algorithm choices) pass an
out-of-range value and cause an out-of-bounds array access into
quic_congs[]?

[ ... ]


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A41A3D4107
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Jan 2026 12:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912322; cv=none; b=ji95HJfFwoV3sXkBBARX3bBaHkIaotiPFmSPD1rOwfj/roCkYQHLeBCyUMmuD9+8up9BhZoUB27h9Xh/piYUZoICaB5PlJLlxtl62gV3qy2fmdcnjBYqpRsoEBA0QHaDp5HqpoN8h+HaKaNKfQ5FCDPIQ7YEREddvxKgkq22I8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912322; c=relaxed/simple;
	bh=ybwnOstUjbTzU+WNVQkpG7oSIktyn6VBM0meydYghk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2k2QhFe9k7Rq/7SLRlysJ7urT7rg+ETdaVs4DLIxCzNXHtlLAWdgM2NXxV/n3d87sEK5+ur4lbXj5hzo04FxNs5yJ+R1yDHGOZCThX5uGjXa0ckD+Z0ox1I2eLb9w06dxq7y5l+MfVu/X3x1bEdCcAWZ8kAsQmvuSPVrGcJUuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hacCEu4s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hacCEu4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768912320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VVch8b9/GI7xCZGgBVtwu4LokFmMKHsdozmzzKNxN0A=;
	b=hacCEu4sgWKALO50RQxlihNkrz3A1Yl71t5wddA0AZqTvkoss1NWEU6XR9hKtrhN+qzFNJ
	WIk1+sO0vpYa4m6pepin2b+VBJ3pc3p7CPzTe20JcxU4lcIyxNOPqacN8EXTRxHe/hmN76
	maESj7DGlF7D+uXOfd3u60lrxI+O6Wk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-GYv_OXc8MJiU0Coq2AVulg-1; Tue, 20 Jan 2026 07:31:58 -0500
X-MC-Unique: GYv_OXc8MJiU0Coq2AVulg-1
X-Mimecast-MFC-AGG-ID: GYv_OXc8MJiU0Coq2AVulg_1768912318
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47d5c7a2f54so43279225e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Jan 2026 04:31:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768912317; x=1769517117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVch8b9/GI7xCZGgBVtwu4LokFmMKHsdozmzzKNxN0A=;
        b=j+9mV8OZUbTNOGfjnbH0ZUJQ+KHLd7wn1aZR3ic7V2hbFAzou/15Nvm7VUqOjANLV6
         aZNbf8Z0axnWPvO4ZdD1JwsnuTJPY6vlNI9F//ASuQMAurmgFxXRar8nySPHlIUJwspY
         mNjP3IfpwBMhDmM1dBP5zO4oKyGtDoo/v7yOT8VQLYsqlRERQ1AbO877wRdBiWZtm34A
         4IXc7dsPST+35oqMkbta2rbjSn3NG2+J6XWOEG/kzpHIKdd6SkKfWnjqBPbcpUimEub2
         DrdhDp3gKJBSbVpBVZEn2iEsggCMMapScFPIKZ3iIAgzQudEFBAGWJ5l8yrL/FYy44OX
         eCiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPZWfvG5wufiL1Nxb38DoaoI+vAU6AB2S10Hdr3PIefcyORC1PlMI0b1r+T/fkRwJKt5TQ5+MsHBzx2eM82fHlcjRxUg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5CC5NXG1VwdIUlizlLI8RqynMsTZ1dlZULxDTfxTiF9h5J6+3
	jOjYwIVvh1Ks69NI3Aqutef+2shHMcG/nGJbKr1hST4gamAZ6mAIwLeOwmj0QMw15nWuPkSxeuP
	YE48CnUjEFV//rFO6Ik/B77EhQ/odAhCYL6A4jHK2/9fC41Q++zOVOusbZ4Wl8k67Qe2iSLQ3fW
	Nu
X-Gm-Gg: AY/fxX4ozmmuwz7vIOEq9mtP3Tfkegu+OaFkYggT6DgXkrwMSk74DGLqOuJhJTUqV3O
	6iwHdQHBjczWucqVOjy270NIXy5YokhdpLbx4YREPVDBXgOWW71WWdLtgcvYarWh5DyPU7yJH6I
	3HShUlNVEk3To9OHknVach45zmxKfxJAn4KvTuOYweL99qoZZaFYpwVIRve+UYud7gYLziEWgH4
	KnDZ9Rspli7gxGeJeMU1PYW3OOCHpxmbZ7IIw0pTpiPwWaMVgLBDLAUs+nxzndFUnTd7gF5zbAC
	5EFb9e4SMCoF4Azn5KcJVfcIslercNZXZAaodOipLEbjTEKAfGhzQZTuUOVqkASSj8d1+mGQwxC
	p/5KiKpYtUAL/
X-Received: by 2002:a05:600d:2388:b0:47e:e7de:7c41 with SMTP id 5b1f17b1804b1-47f44d4ca19mr138285185e9.16.1768912317564;
        Tue, 20 Jan 2026 04:31:57 -0800 (PST)
X-Received: by 2002:a05:600d:2388:b0:47e:e7de:7c41 with SMTP id 5b1f17b1804b1-47f44d4ca19mr138284545e9.16.1768912317054;
        Tue, 20 Jan 2026 04:31:57 -0800 (PST)
Received: from [192.168.88.32] ([150.228.93.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4289b7aasm306886765e9.2.2026.01.20.04.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 04:31:56 -0800 (PST)
Message-ID: <6c6d5644-3354-46ba-bbc9-e76789648abf@redhat.com>
Date: Tue, 20 Jan 2026 13:31:51 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 06/16] quic: add stream management
To: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>,
 quic@lists.linux.dev
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>,
 Pengtao He <hepengtao@xiaomi.com>, Thomas Dreibholz <dreibh@simula.no>,
 linux-cifs@vger.kernel.org, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Paulo Alcantara <pc@manguebit.com>,
 Tom Talpey <tom@talpey.com>, kernel-tls-handshake@lists.linux.dev,
 Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1768489876.git.lucien.xin@gmail.com>
 <e3f770ef8d9aba101e1f5dc2f2f72bb0d2a30b94.1768489876.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <e3f770ef8d9aba101e1f5dc2f2f72bb0d2a30b94.1768489876.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tc2Yfj7soJZD2vhHYNZ2njR0Qm4Eh-3mZ-ZfTrTXCv0_1768912318
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/15/26 4:11 PM, Xin Long wrote:
> +struct quic_stream {
> +	struct hlist_node node;
> +	s64 id;				/* Stream ID as defined in RFC 9000 Section 2.1 */
> +	struct {
> +		/* Sending-side stream level flow control */
> +		u64 last_max_bytes;	/* Maximum send offset advertised by peer at last update */
> +		u64 max_bytes;		/* Current maximum offset we are allowed to send to */
> +		u64 bytes;		/* Bytes already sent to peer */
> +
> +		u32 errcode;		/* Application error code to send in RESET_STREAM */
> +		u32 frags;		/* Number of sent STREAM frames not yet acknowledged */
> +		u8 state;		/* Send stream state, per rfc9000#section-3.1 */
> +
> +		u8 data_blocked:1;	/* True if flow control blocks sending more data */
> +		u8 done:1;		/* True if application indicated end of stream (FIN sent) */

Minor nit: AFAICS with the current struct layout the bitfield above does
not save any space, compared to plain u8 and will lead to worse code.

> +	} send;
> +	struct {
> +		/* Receiving-side stream level flow control */
> +		u64 max_bytes;		/* Maximum offset peer is allowed to send to */
> +		u64 window;		/* Remaining receive window before advertise a new limit */
> +		u64 bytes;		/* Bytes consumed by application from the stream */
> +
> +		u64 highest;		/* Highest received offset */
> +		u64 offset;		/* Offset up to which data is in buffer or consumed */
> +		u64 finalsz;		/* Final size of the stream if FIN received */
> +
> +		u32 frags;		/* Number of received STREAM frames pending reassembly */
> +		u8 state;		/* Receive stream state, per rfc9000#section-3.2 */
> +
> +		u8 stop_sent:1;		/* True if STOP_SENDING has been sent */
> +		u8 done:1;		/* True if FIN received and final size validated */

... same here...

> +	} recv;
> +};
> +
> +struct quic_stream_limits {
> +	/* Stream limit parameters defined in rfc9000#section-18.2 */
> +	u64 max_stream_data_bidi_remote;	/* initial_max_stream_data_bidi_remote */
> +	u64 max_stream_data_bidi_local;		/* initial_max_stream_data_bidi_local */
> +	u64 max_stream_data_uni;		/* initial_max_stream_data_uni */
> +	u64 max_streams_bidi;			/* initial_max_streams_bidi */
> +	u64 max_streams_uni;			/* initial_max_streams_uni */
> +
> +	s64 next_bidi_stream_id;	/* Next bidi stream ID to open or accept */
> +	s64 next_uni_stream_id;		/* Next uni stream ID to open or accept */
> +	s64 max_bidi_stream_id;		/* Highest allowed bidi stream ID */
> +	s64 max_uni_stream_id;		/* Highest allowed uni stream ID */
> +	s64 active_stream_id;		/* Most recently opened stream ID */
> +
> +	u8 bidi_blocked:1;	/* STREAMS_BLOCKED_BIDI sent, awaiting ACK */
> +	u8 uni_blocked:1;	/* STREAMS_BLOCKED_UNI sent, awaiting ACK */
> +	u8 bidi_pending:1;	/* MAX_STREAMS_BIDI needs to be sent */
> +	u8 uni_pending:1;	/* MAX_STREAMS_UNI needs to be sent */

... and here.

Other than that LGTM. With the bitfield replaced with plain u8 feel free
to add my

Acked-by: Paolo Abeni <pabeni@redhat.com>


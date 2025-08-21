Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B3F345741
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 21 Aug 2025 13:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783838; cv=none; b=CZngNO3il7IKQSuAXTvq5kyhMpiNro1heaY0JJhMLDF/jtYbQRsNo9I/SAPBa5r57JwnnTUBJO0pVysdZoww79d897+XEh+K5QdahfhBJLWPcITyUqobE5PepVJzdi+JEnQ1HdaTvhfmYO9TULgd0Qmx3KBw8d4eADEtUJY+ZrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783838; c=relaxed/simple;
	bh=BGibils0ixKTkveWPcD3R9qfmRHuchZdAypt/Z4Xoac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KxyiGSQa6i2MjutNk3A7m7gSCSYx2RTER1mKMlyDcOU0fjIKLg+HY/eAsWZAHpHDQ2f6B9HOuKMZdi5W3DfGKZTrg3xNF/8xerIJswXmSKt7WmE6YbQ4er5WVhQBXEIOEE/Rb1Qv8dDBvZ4wtoTWGjKVGlQo5InHAjCzCMwPgp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FLn22agM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FLn22agM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755783835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NEnox1MXYpI6nlTWn+1oQsX5BYXD1Viik97oVd+ziwk=;
	b=FLn22agMGDpehd/vAYGM1fDn691d103GXvMdPcQxt10NC8vMXtJKUSWZX+wyiThcHp4FXM
	KG2w3maOWmP5+NcvzsFOlebjO1+3nXx1evBPMTzFmlZi76wmh6S6ZI9V5BESxAtMeZvbLV
	B9jwM2jsNUMs6Xf3D71EeuW+B/mGYDw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-6MuDCkMeOpOHTsg8X5MVPQ-1; Thu, 21 Aug 2025 09:43:52 -0400
X-MC-Unique: 6MuDCkMeOpOHTsg8X5MVPQ-1
X-Mimecast-MFC-AGG-ID: 6MuDCkMeOpOHTsg8X5MVPQ_1755783831
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45a1b0d221aso5057515e9.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 21 Aug 2025 06:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783831; x=1756388631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NEnox1MXYpI6nlTWn+1oQsX5BYXD1Viik97oVd+ziwk=;
        b=iXimNZrqWTQ72xCLqmP4BIE/PzVSGs2wQnRikOrH3A1CN4ozJiPJBNwxV5cRtuU9Gl
         Cyl+6+1fSCjSeXjrjtsjha8R0UYOrm1wrHQ0HCD2pCwUPXEZAenzFZxvJW6rnnvkj2jA
         FByxEiz9fXZYYhn5IAOhGRedeADjtEtQrM81BoniI4XY05IJU+ZzMV95eBI8UjVmvl78
         xI57ZWDMowy40OnIJujOfMD3xGeth2pwgEfE33t36bZ9Fp+Y7Sek8ZDou9W2GGurOOmZ
         QVBmJyBme3Pqpod8njMzXMOcn+v08q/BvVyN0ilWmgQcIOQjW2GT/J3gX2FkjCZtVPKF
         x4RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD8P0lSpHfrBALhS4ySLNax83BpY6Zhhw4ARdxhQdg1UFK0xRoMK3wTyMEMyX2EoYT6mhyEPAqvoDjrnZ2PtfJkY78pA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn2j+EMmZo+S5vrX7C5xOZY/9BdLEbLEjTc+5z6Ml2rEMBFp6S
	Jkj2aKZlPQkN8vgY0w3JTUxqCMGpy9oI6B4Vd/6jOdUPNMpgYB92oO2/ipqBbdDyjyaICkV28By
	wh3yv9wA0Iqc/fDxjGp/GrOfuZ/IP4tFpbuzimzAUfZO87CyP6Yhxow6/5LMjJhsExfAO8ryV5h
	YN
X-Gm-Gg: ASbGncuWoKLFXZphu13fJAQh/WDf8zAnfzagMcIi3/yRmVQgdiMaZlvg0dyYSWEl8k0
	xDf8zV18GcOif2rQYOuRazcmkv6TStOC+ca1+zxRpiknDdxYKixHAAXb55WSIQ99m8LDtifGna2
	FZR9va4quOuDyHfrLkFApYH8IKsgUDQTlN3Q/Dfc74TrsqM5qWQIMipsC2TZfQmvWJmfFv8cxUC
	w+dMN1zT4Dx2uFC0tKoyXvLuhXNhXnXWEUvq97yWH9CUJ68Q8qocY3A8WXueytWtcvJArsw8KY3
	5SU0NnsYM+js8g6ypdXfBxG1tqSvptp8JtEPfe4LVFq/QT4/Kgja+A9PO2AXL0lOoNHzG+aCAjR
	bCmr2h8Rf+jA=
X-Received: by 2002:a05:600c:1f1a:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-45b4d7dbb07mr19594175e9.13.1755783831008;
        Thu, 21 Aug 2025 06:43:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZRt0wLkKXdgUciFt7chGmSCzwh+L3c2yXfl6KumtYihELiZUeyXIBw0a4KRluTs9is/eX7g==
X-Received: by 2002:a05:600c:1f1a:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-45b4d7dbb07mr19593805e9.13.1755783830507;
        Thu, 21 Aug 2025 06:43:50 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c4568499ecsm3634615f8f.43.2025.08.21.06.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 06:43:50 -0700 (PDT)
Message-ID: <a79bfa8b-657f-4358-99f3-2774eb65d49f@redhat.com>
Date: Thu, 21 Aug 2025 15:43:47 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 06/15] quic: add stream management
To: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Moritz Buhl <mbuhl@openbsd.org>, Tyler Fanelli <tfanelli@redhat.com>,
 Pengtao He <hepengtao@xiaomi.com>, linux-cifs@vger.kernel.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>,
 Jeff Layton <jlayton@kernel.org>, Benjamin Coddington <bcodding@redhat.com>,
 Steve Dickson <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1755525878.git.lucien.xin@gmail.com>
 <a2cd3192c7f301a7370c223d23c9deefecda8a22.1755525878.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <a2cd3192c7f301a7370c223d23c9deefecda8a22.1755525878.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vQ6ifySp4l0SnC7z30s_lzsGch8zsPf7HNpMWyrlTVc_1755783831
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/18/25 4:04 PM, Xin Long wrote:
> +/* Check if a stream ID is valid for sending. */
> +static bool quic_stream_id_send(s64 stream_id, bool is_serv)
> +{
> +	u8 type = (stream_id & QUIC_STREAM_TYPE_MASK);
> +
> +	if (is_serv) {
> +		if (type == QUIC_STREAM_TYPE_CLIENT_UNI)
> +			return false;
> +	} else if (type == QUIC_STREAM_TYPE_SERVER_UNI) {
> +		return false;
> +	}
> +	return true;
> +}
> +
> +/* Check if a stream ID is valid for receiving. */
> +static bool quic_stream_id_recv(s64 stream_id, bool is_serv)
> +{
> +	u8 type = (stream_id & QUIC_STREAM_TYPE_MASK);
> +
> +	if (is_serv) {
> +		if (type == QUIC_STREAM_TYPE_SERVER_UNI)
> +			return false;
> +	} else if (type == QUIC_STREAM_TYPE_CLIENT_UNI) {
> +		return false;
> +	}
> +	return true;
> +}

The above two functions could be implemented using a common helper
saving some code duplication.

> +/* Create and register new streams for sending. */
> +static struct quic_stream *quic_stream_send_create(struct quic_stream_table *streams,
> +						   s64 max_stream_id, u8 is_serv)
> +{
> +	struct quic_stream *stream;
> +	s64 stream_id;
> +
> +	stream_id = streams->send.next_bidi_stream_id;
> +	if (quic_stream_id_uni(max_stream_id))
> +		stream_id = streams->send.next_uni_stream_id;
> +
> +	/* rfc9000#section-2.1: A stream ID that is used out of order results in all streams
> +	 * of that type with lower-numbered stream IDs also being opened.
> +	 */
> +	while (stream_id <= max_stream_id) {

Is wrap around thererically possible?
Who provided `max_stream_id`, the user-space? or a remote pear? what if
max_stream_id - stream_id is say 1M ?

[...]
> +/* Check if a receive stream ID is already closed. */
> +static bool quic_stream_id_recv_closed(struct quic_stream_table *streams, s64 stream_id)
> +{
> +	if (quic_stream_id_uni(stream_id)) {
> +		if (stream_id < streams->recv.next_uni_stream_id)
> +			return true;
> +	} else {
> +		if (stream_id < streams->recv.next_bidi_stream_id)
> +			return true;
> +	}
> +	return false;
> +}

I guess the above answer my previous questions, but I think that memory
accounting for stream allocation is still deserverd.

> +
> +/* Check if a receive stream ID exceeds would exceed local's limits. */
> +static bool quic_stream_id_recv_exceeds(struct quic_stream_table *streams, s64 stream_id)
> +{
> +	if (quic_stream_id_uni(stream_id)) {
> +		if (stream_id > streams->recv.max_uni_stream_id)
> +			return true;
> +	} else {
> +		if (stream_id > streams->recv.max_bidi_stream_id)
> +			return true;
> +	}
> +	return false;
> +}
> +
> +/* Check if a send stream ID would exceed peer's limits. */
> +bool quic_stream_id_send_exceeds(struct quic_stream_table *streams, s64 stream_id)
> +{
> +	u64 nstreams;
> +
> +	if (quic_stream_id_uni(stream_id)) {
> +		if (stream_id > streams->send.max_uni_stream_id)
> +			return true;
> +	} else {
> +		if (stream_id > streams->send.max_bidi_stream_id)
> +			return true;
> +	}
> +
> +	if (quic_stream_id_uni(stream_id)) {
> +		stream_id -= streams->send.next_uni_stream_id;
> +		nstreams = quic_stream_id_to_streams(stream_id);
> +		if (nstreams + streams->send.streams_uni > streams->send.max_streams_uni)
> +			return true;
> +	} else {
> +		stream_id -= streams->send.next_bidi_stream_id;
> +		nstreams = quic_stream_id_to_streams(stream_id);
> +		if (nstreams + streams->send.streams_bidi > streams->send.max_streams_bidi)
> +			return true;
> +	}
> +	return false;
> +}
> +
> +/* Get or create a send stream by ID. */
> +struct quic_stream *quic_stream_send_get(struct quic_stream_table *streams, s64 stream_id,
> +					 u32 flags, bool is_serv)
> +{
> +	struct quic_stream *stream;
> +
> +	if (!quic_stream_id_send(stream_id, is_serv))
> +		return ERR_PTR(-EINVAL);
> +
> +	stream = quic_stream_find(streams, stream_id);
> +	if (stream) {
> +		if ((flags & MSG_STREAM_NEW) &&
> +		    stream->send.state != QUIC_STREAM_SEND_STATE_READY)
> +			return ERR_PTR(-EINVAL);
> +		return stream;
> +	}
> +
> +	if (quic_stream_id_send_closed(streams, stream_id))
> +		return ERR_PTR(-ENOSTR);
> +
> +	if (!(flags & MSG_STREAM_NEW))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (quic_stream_id_send_exceeds(streams, stream_id))
> +		return ERR_PTR(-EAGAIN);
> +
> +	stream = quic_stream_send_create(streams, stream_id, is_serv);
> +	if (!stream)
> +		return ERR_PTR(-ENOSTR);
> +	streams->send.active_stream_id = stream_id;
> +	return stream;

There is no locking at all in lookup/add/remove. Lacking the caller of
such functions is hard to say if that is safe. You should add some info
about that in the commit message (or lock here ;)

/P


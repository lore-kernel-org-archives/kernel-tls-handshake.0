Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A777F184524
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  4 Nov 2025 11:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762254362; cv=none; b=Hi9nRAt2EBPzCtB29FbSPpyHgudCsQYuNZtSUme2Q2quPonc0megrkGIOQFEIjT6nu8ZMU8y9zMGvJMPw75P3C4SePjDhaBBPZxfRgwshyYjmgaEFgslsD/+46VqePj8xPxiKmXZwT9sAutb5AnIPCWlsKD3QF2hx+nyDUBisaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762254362; c=relaxed/simple;
	bh=6rkuhGsUq+FMshFBuGH4UBuujI5+HFmkSrNJPWLxEDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBULE5/e+zzXDTbGPqqR0VUe8WSI4NzeNzfNVF52PiBHMsCoQuKBJ3uSsj4Ra1EH0uGl9FnR+CkIB0NLf4pnuFFV/efh1BKUim/Z+55bkJuzoxFMrMIAkhaUjyPAHvi/o5tWXWYlmmVm22h2BP9g8Ma9TJztRkqPkF+HS2Hmq1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SkLFZ+LP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SkLFZ+LP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762254357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OxmghJIcjc3tJC2DIG8MaqzZFBLXh5fxewma9fsdqXU=;
	b=SkLFZ+LPfzgKR80b1cVKq8G005YNZ8cZ59nAfMccOTRzDEGIOV9f02Qs2F+Aj9ECjG7Zyf
	7/hCkMCTGqAPEiZ1v8beYH/OfZrFmOGZQE9/XDZH4qRKTBx21D0eQZqvBvSs5VGeEabdki
	FX+5M59EKkobkpkdO0kL9z8Bl6ifFIU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-yBvgtt0RMAqrFk97gFu8xQ-1; Tue, 04 Nov 2025 06:05:51 -0500
X-MC-Unique: yBvgtt0RMAqrFk97gFu8xQ-1
X-Mimecast-MFC-AGG-ID: yBvgtt0RMAqrFk97gFu8xQ_1762254350
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-429c8d07874so1687053f8f.3
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 04 Nov 2025 03:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762254350; x=1762859150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxmghJIcjc3tJC2DIG8MaqzZFBLXh5fxewma9fsdqXU=;
        b=gZCjtf3hrwz8p5ASp1rCYBioCh8w7I16jYcWFWoVldXJRq+bVY4Rcnu2QPd8WeaYEp
         nlkqSwiNjKK4WU6EmdLXknSMFJZCdOdvVzOyHVitiXTJQ2+m5w5eP4y2NYfUD4slcSTa
         98Ws7y82YCzU2U0kmEAWJWuKSHZAisOvnpBbvzWjNL4ZRSHMilgQCDz22B8TFDlQW326
         rrI0PmAJYKkDOyuVODNX+aszjVDqTjbmmlvyYOjICAIfWcjW5qJGEYnFKlchNwX5LIyX
         pzqZiXTzYeCQgPeysm0OCaiy1fNG0flwtnXDSkb+zb5SHPYiu7q8RXve7IM79LmpqSE8
         P1WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaCZFvOnvReq6jHh/O2pHmr2wQ7U6awVftrWFhgmhaWqvqcUylMlTTNf/VJE5zJKMGh7HiF5qJbrvP0ncfvQf9m+i4ug==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzfvo4JmRJ5ZsSBubmqlOOB4debghO6jq0hZXGxUveTI8YltCUk
	NgOPRnuBLz5iJXPCxbpJE5ZjPMXr1UUH5c+e5+vl1td6NDJimiZg2URgiOcvX7+KAozYwuqRZr7
	pSk6JuHHBswmoAREFUfZ2ch/7bK7qrEluqD8ypmE7/MaxCG2/j2U6EweU3iviAfq78ozZ6GHXK5
	cx
X-Gm-Gg: ASbGnctFcclM7fMMP/hi2IxUmsgBsZI6BTk4NiZH24+/R6SX4JBG5tJbjKCP7YkeX6Z
	tldaUCnYYr8nKCn/qu9sPdZMcxbVP08v68y77lPSUwGu29kVv03kS4XGN3glwXqTtWdnUFnqBa0
	B+17A2w3gzBiJTfoQ3dQELoUuZEYrl+eodXgli2Wm8vOlGbxaXssPSAZKb86bxLM5u+XzSO2PC9
	q6y0XOZmZukOMIHSmFtvAe82OqqDRxY/j+ZiEeH5QVEyoUXNGZHZWtevZIqYLmYa07wkMfk/VEL
	2Xr1jsSJEmlU5c5+qcMgGOSLhwcdWdy8MAMOE9lDnXWYa1gCTjE9e/g5ZlhrPYfOeETObXGVnhA
	B+i84T6ZqSFxYfndUKtLZ6uuq7ekkROa2X8ahulIDc3A/
X-Received: by 2002:a5d:584b:0:b0:429:dc4a:4094 with SMTP id ffacd0b85a97d-429dc4a41c5mr2036059f8f.30.1762254349823;
        Tue, 04 Nov 2025 03:05:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRTcLyJarL+HzJIicet1BC+SA9mI8/liFB8LEEp4cpSbdxEDl917ajaG6JsdKZcXmSqC73zQ==
X-Received: by 2002:a5d:584b:0:b0:429:dc4a:4094 with SMTP id ffacd0b85a97d-429dc4a41c5mr2036004f8f.30.1762254349252;
        Tue, 04 Nov 2025 03:05:49 -0800 (PST)
Received: from ?IPV6:2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6? ([2a0d:3341:b8a2:8d10:2aab:5fa:9fa0:d7e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1f5af7sm4174267f8f.28.2025.11.04.03.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 03:05:48 -0800 (PST)
Message-ID: <ad38f56b-5c53-408e-abcc-4b061c2097a3@redhat.com>
Date: Tue, 4 Nov 2025 12:05:46 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 06/15] quic: add stream management
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
 Benjamin Coddington <bcodding@redhat.com>, Steve Dickson
 <steved@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Alexander Aring <aahringo@redhat.com>, David Howells <dhowells@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, John Ericson <mail@johnericson.me>,
 Cong Wang <xiyou.wangcong@gmail.com>, "D . Wythe"
 <alibuda@linux.alibaba.com>, Jason Baron <jbaron@akamai.com>,
 illiliti <illiliti@protonmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Daniel Stenberg <daniel@haxx.se>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
References: <cover.1761748557.git.lucien.xin@gmail.com>
 <6b527b669fe05f9743e37d9f584f7cd492a7649b.1761748557.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <6b527b669fe05f9743e37d9f584f7cd492a7649b.1761748557.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qZajrxTjaZJjgHcLg6RDI_Tm_-jGYfoalnJDRVziIl8_1762254350
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/25 3:35 PM, Xin Long wrote:
+/* Create and register new streams for sending. */
> +static struct quic_stream *quic_stream_send_create(struct quic_stream_table *streams,
> +						   s64 max_stream_id, u8 is_serv)
> +{
> +	struct quic_stream *stream = NULL;
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
> +		stream = kzalloc(sizeof(*stream), GFP_KERNEL_ACCOUNT);
> +		if (!stream)
> +			return NULL;
> +
> +		stream->id = stream_id;
> +		if (quic_stream_id_uni(stream_id)) {
> +			stream->send.max_bytes = streams->send.max_stream_data_uni;
> +
> +			if (streams->send.next_uni_stream_id < stream_id + QUIC_STREAM_ID_STEP)
> +				streams->send.next_uni_stream_id = stream_id + QUIC_STREAM_ID_STEP;

It's unclear to me the goal the above 2 statements. Dealing with id
wrap-arounds? If 'streams->send.next_uni_stream_id < stream_id +
QUIC_STREAM_ID_STEP' is not true the next quic_stream_send_create() will
reuse the same stream_id.

I moving the above in a separate helper with some comments would help.


> +			streams->send.streams_uni++;
> +
> +			quic_stream_add(streams, stream);
> +			stream_id += QUIC_STREAM_ID_STEP;
> +			continue;
> +		}
> +
> +		if (streams->send.next_bidi_stream_id < stream_id + QUIC_STREAM_ID_STEP)
> +			streams->send.next_bidi_stream_id = stream_id + QUIC_STREAM_ID_STEP;
> +		streams->send.streams_bidi++;
> +
> +		if (quic_stream_id_local(stream_id, is_serv)) {
> +			stream->send.max_bytes = streams->send.max_stream_data_bidi_remote;
> +			stream->recv.max_bytes = streams->recv.max_stream_data_bidi_local;
> +		} else {
> +			stream->send.max_bytes = streams->send.max_stream_data_bidi_local;
> +			stream->recv.max_bytes = streams->recv.max_stream_data_bidi_remote;
> +		}
> +		stream->recv.window = stream->recv.max_bytes;
> +
> +		quic_stream_add(streams, stream);
> +		stream_id += QUIC_STREAM_ID_STEP;
> +	}
> +	return stream;
> +}
> +
> +/* Create and register new streams for receiving. */
> +static struct quic_stream *quic_stream_recv_create(struct quic_stream_table *streams,
> +						   s64 max_stream_id, u8 is_serv)
> +{
> +	struct quic_stream *stream = NULL;
> +	s64 stream_id;
> +
> +	stream_id = streams->recv.next_bidi_stream_id;
> +	if (quic_stream_id_uni(max_stream_id))
> +		stream_id = streams->recv.next_uni_stream_id;
> +
> +	/* rfc9000#section-2.1: A stream ID that is used out of order results in all streams
> +	 * of that type with lower-numbered stream IDs also being opened.
> +	 */
> +	while (stream_id <= max_stream_id) {
> +		stream = kzalloc(sizeof(*stream), GFP_ATOMIC | __GFP_ACCOUNT);
> +		if (!stream)
> +			return NULL;
> +
> +		stream->id = stream_id;
> +		if (quic_stream_id_uni(stream_id)) {
> +			stream->recv.window = streams->recv.max_stream_data_uni;
> +			stream->recv.max_bytes = stream->recv.window;
> +
> +			if (streams->recv.next_uni_stream_id < stream_id + QUIC_STREAM_ID_STEP)
> +				streams->recv.next_uni_stream_id = stream_id + QUIC_STREAM_ID_STEP;
> +			streams->recv.streams_uni++;
> +
> +			quic_stream_add(streams, stream);
> +			stream_id += QUIC_STREAM_ID_STEP;
> +			continue;
> +		}
> +
> +		if (streams->recv.next_bidi_stream_id < stream_id + QUIC_STREAM_ID_STEP)
> +			streams->recv.next_bidi_stream_id = stream_id + QUIC_STREAM_ID_STEP;
> +		streams->recv.streams_bidi++;
> +
> +		if (quic_stream_id_local(stream_id, is_serv)) {
> +			stream->send.max_bytes = streams->send.max_stream_data_bidi_remote;
> +			stream->recv.max_bytes = streams->recv.max_stream_data_bidi_local;
> +		} else {
> +			stream->send.max_bytes = streams->send.max_stream_data_bidi_local;
> +			stream->recv.max_bytes = streams->recv.max_stream_data_bidi_remote;
> +		}
> +		stream->recv.window = stream->recv.max_bytes;
> +
> +		quic_stream_add(streams, stream);
> +		stream_id += QUIC_STREAM_ID_STEP;
> +	}
> +	return stream;
> +}

The above 2 functions has a lot of code in common. I think you could
deduplicate it by:
- defining a named type for quic_stream_table.{send,recv}
- define a generic quic_stream_create() helper using an additonal
argument for the relevant table.{send,recv}
- replace the above 2 functions with a single invocation to such helper.

It looks like there are more de-dup opportunity below.

> +
> +/* Check if a send or receive stream ID is already closed. */
> +static bool quic_stream_id_closed(struct quic_stream_table *streams, s64 stream_id, bool send)
> +{
> +	if (quic_stream_id_uni(stream_id)) {
> +		if (send)
> +			return stream_id < streams->send.next_uni_stream_id;
> +		return stream_id < streams->recv.next_uni_stream_id;
> +	}
> +	if (send)
> +		return stream_id < streams->send.next_bidi_stream_id;
> +	return stream_id < streams->recv.next_bidi_stream_id;
> +}
> +
> +/* Check if a stream ID would exceed local (recv) or peer (send) limits. */
> +bool quic_stream_id_exceeds(struct quic_stream_table *streams, s64 stream_id, bool send)
> +{
> +	u64 nstreams;
> +
> +	if (!send) {
> +		if (quic_stream_id_uni(stream_id))
> +			return stream_id > streams->recv.max_uni_stream_id;
> +		return stream_id > streams->recv.max_bidi_stream_id;
> +	}
> +
> +	if (quic_stream_id_uni(stream_id)) {
> +		if (stream_id > streams->send.max_uni_stream_id)
> +			return true;
> +		stream_id -= streams->send.next_uni_stream_id;
> +		nstreams = quic_stream_id_to_streams(stream_id);
> +		return nstreams + streams->send.streams_uni > streams->send.max_streams_uni;
> +	}
> +
> +	if (stream_id > streams->send.max_bidi_stream_id)
> +		return true;
> +	stream_id -= streams->send.next_bidi_stream_id;
> +	nstreams = quic_stream_id_to_streams(stream_id);
> +	return nstreams + streams->send.streams_bidi > streams->send.max_streams_bidi;
> +}
> +
> +/* Get or create a send stream by ID. */
> +struct quic_stream *quic_stream_send_get(struct quic_stream_table *streams, s64 stream_id,
> +					 u32 flags, bool is_serv)
> +{
> +	struct quic_stream *stream;
> +
> +	if (!quic_stream_id_valid(stream_id, is_serv, true))
> +		return ERR_PTR(-EINVAL);
> +
> +	stream = quic_stream_find(streams, stream_id);
> +	if (stream) {

You should add some comments and possibly lockdep annotation/static
check about the expected locking for the whole stream lifecycle.

/P


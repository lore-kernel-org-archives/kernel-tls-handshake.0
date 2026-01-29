Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B74037F0EE
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 29 Jan 2026 12:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769690001; cv=none; b=I4UME54dYKjqReA4Lo0sdq9nDtlMXBIL4uy2JwTv43x+fZp0TV+mJizCpRnmwtFCtin6lrZgkGPcDTiMw2d+t2xZq1epdrKzbKZmu3hLqVFfAkxaGjw1+Rz71AnUD0vQsQqjYKvvYku+ykmFn6mwyTrElILlBOVItzCbZmPcjRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769690001; c=relaxed/simple;
	bh=40wMWG7SyPMSzabUx/Wcz8EBhiLCqDenQlqMLv7YPuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=boDKcKr5zmgsVISoNhI/wumALYaiPh3SlAXLhAatoSaeUsxrNRCMQ+KQpUD0iQX5lSDVRgqQ7ThYl2Y3PbmhtCORyP69vYFuh3iZUaGUrZoW+8hURshjJRoyHAnCtvt6Egoyv8LTujZSYHxhWgW9yDpIiGo5cfv7Me7tknKHWQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F2Dge+60; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F2Dge+60"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769689999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mRy+y1wqapOxzHZCLfyA/JeLGF66Z2ABQ1elBTYnVS4=;
	b=F2Dge+60r2+gECeRPxZb8aadw50Sca5T9Wl8hovaNEGZFKiYq1dyp51eiuwpVqOzAgLc6N
	yUjHRGnNdvaiUEa++GIFsDL10dZQ6rtRvFcysF8v546KYHBRylvBS3n6DwD47IZ3SS+9RX
	MqFUOOJuwtA2kHVE21ugDtAB+XmmZjI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-tsbYJJFrMXuaC3QBKgiqdg-1; Thu, 29 Jan 2026 07:33:16 -0500
X-MC-Unique: tsbYJJFrMXuaC3QBKgiqdg-1
X-Mimecast-MFC-AGG-ID: tsbYJJFrMXuaC3QBKgiqdg_1769689995
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-435db9425ebso1020711f8f.1
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 29 Jan 2026 04:33:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769689995; x=1770294795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRy+y1wqapOxzHZCLfyA/JeLGF66Z2ABQ1elBTYnVS4=;
        b=KdoenL6nsR7zCPgDgGpTPrO5Wri41aQPIgl6vC9Bedtz87Or3Iw3l/yynjGZuViG8b
         Rrpl7t2RKLUykbAKoPh7r2GSz5+j6vk6x0C0V8uc0j/z2/C4wJ/0JKajywyvgGDGGapJ
         UKMBCkftnANlmmh5nTcbD15ltyqrRs+JcYaGwldT0XyKwr6uoB7JHRKuo+3Ay0zNhivl
         htqJyc/6iXyX2Bd19k7laWQZW65aFR98rBQU7LYvuIV3W2PkhyRZg9gjeA3CWs8PX30a
         m4hlVNQuWHIqMKEK7Ldh57HHPt2pMlyQuBgeTcBsnV8F/H085RlUTYouNYRFDECUCuHM
         /+VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGwSDRflU4Rwh1dMPytWLs8uyGSR0G19UzyM5ho/dHDTMfOjs3/puDOwl/Hbt7qjgS/TFEZYZo3CpQp/ov4CxNKx/+4g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy/Li41agJmWOIvCuE4qIvxAQPNf1j4DkG9xx74l99JM9SkH/F
	vPx4e1VeC9gnus+xJE9C+Xk0U8teFHKVdusGxZrg9qkCGgCA9UdQq954aMhuiAH1+2nG8f6FbRU
	ls5owOOr7UD0VpJYScdNniGLixmNDA5U9Pm0LO0rcn6K4x5RhRARKnc0vdyMIpTDkKIamaXdObC
	Em
X-Gm-Gg: AZuq6aIiAB3R6SzQ0ZRWLRW3PfZGLix9Ex8AP5Um2sUJO1y32kKonGgxwAEWboMASii
	1dhqKpP1ByukVLCdlBt9nCFrZgLng0HzASmKUTpEDilnag4/7B8XurKWfCVrSn6uQnJqi+n5Zdi
	cG5+SQCBlyEpv5Ikq7xpPbWlCrPVyIZBDSC3VKO+4uanE+leefLEy466iwbGJAQrsuwLRL+sJs5
	dZ9KW6rlW+GYiJdmLxJN9bZBKdzZLfD2CjPO0lrVvlQdnNWrq3rWm/GOaBCdqogSZ1k0M8pBDsI
	l2JYLPWXfD70wEZIy+wttr0mlNeVMgkFM6DvSPTZqaJt3E+8PXJCAgHBy9IuoAESaFoCq6RgNzI
	OnqrceIGH3cun
X-Received: by 2002:a05:6000:22c9:b0:435:9882:234e with SMTP id ffacd0b85a97d-435dd1d8e62mr10552712f8f.59.1769689994897;
        Thu, 29 Jan 2026 04:33:14 -0800 (PST)
X-Received: by 2002:a05:6000:22c9:b0:435:9882:234e with SMTP id ffacd0b85a97d-435dd1d8e62mr10552677f8f.59.1769689994350;
        Thu, 29 Jan 2026 04:33:14 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm15075716f8f.33.2026.01.29.04.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 04:33:13 -0800 (PST)
Message-ID: <9621f01f-5c89-4d13-9997-b4066b7e9d16@redhat.com>
Date: Thu, 29 Jan 2026 13:33:11 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 07/15] quic: add connection id management
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
References: <cover.1769439073.git.lucien.xin@gmail.com>
 <ad730679ce27da0886104546a3d327b5fb653340.1769439073.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <ad730679ce27da0886104546a3d327b5fb653340.1769439073.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kQviz1BmNLoujnsQRIjXOGtJy7tVgBWc7iRzvUCL_ks_1769689995
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/26/26 3:51 PM, Xin Long wrote:
> This patch introduces 'struct quic_conn_id_set' for managing Connection
> IDs (CIDs), which are represented by 'struct quic_source_conn_id'
> and 'struct quic_dest_conn_id'.
> 
> It provides helpers to add and remove CIDs from the set, and handles
> insertion of source CIDs into the global connection ID hash table
> when necessary.
> 
> - quic_conn_id_add(): Add a new Connection ID to the set, and inserts
>   it to conn_id hash table if it is a source conn_id.
> 
> - quic_conn_id_remove(): Remove connection IDs the set with sequence
>   numbers less than or equal to a number.
> 
> It also adds utilities to look up CIDs by value or sequence number,
> search the global hash table for incoming packets, and check for
> stateless reset tokens among destination CIDs. These functions are
> essential for RX path connection lookup and stateless reset processing.
> 
> - quic_conn_id_find(): Find a Connection ID in the set by seq number.
> 
> - quic_conn_id_lookup(): Lookup a Connection ID from global hash table
>   using the ID value, typically used for socket lookup on the RX path.
> 
> - quic_conn_id_token_exists(): Check if a stateless reset token exists
>   in any dest Connection ID (used during stateless reset processing).
> 
> Note source/dest conn_id set is per socket, the operations on it are
> always pretected by the sock lock.
> 
> Signed-off-by: Xin Long <lucien.xin@gmail.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>


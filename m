Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EA1426D20
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Jan 2026 12:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911824; cv=none; b=p2FS2RRFIAA3OycxtuUZ9alLh3Zu6KpzgN0RTdznFfy/bYmrZTVCvmwAMM9ZJ81Bs7bOob1MFP/9xtylJwnMwy0jIeCBQOoGSD54LLwl/L/4Fq6lEZgCJCTIEaoo+t5P8qhO2FnqBKJzJB+CQyS+HufD4TojELTfUCfD+PMJCok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911824; c=relaxed/simple;
	bh=1XPv3uNkmWHVj9nBvtujA7kYi4ti9RusPKYh5MYQv+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdWS5csCrTYiJ3IiYWwSXvn/nwR36osTcaJYGuWU8BdeCAneLQt5+MJBaIawCa8+Oc2DTAV6SGVKkD2FDisBmMb4DLJNjkaHjdq8fUox/1qlsmRohq+qVJ8iEFTSkePXxmFjZgi5MED85W7BC/gUH2EnqtgMcom43g7y01ziV1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UXVqlzQD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UXVqlzQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768911821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aEG9JILWJtDxSikxSaJuovdTLx8v+TifArul6/N/tD0=;
	b=UXVqlzQD7YI/tCUfyc/Xv1PBRHqfAwoOGFeeAi2QX7nY04gcRF2BohQjKTUfzUykukNZVb
	2070jha56EZiP++tdPIn+UyPNpa8pCYiuN7zoz+/DCEVnjnGCA7MK3ex45T5NUF0F1FO8j
	IEaq81nh0DiaBRwjgYvK58AMwkZTaTs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-WnJVO2ZlNY2EBpnQizSdSA-1; Tue, 20 Jan 2026 07:23:38 -0500
X-MC-Unique: WnJVO2ZlNY2EBpnQizSdSA-1
X-Mimecast-MFC-AGG-ID: WnJVO2ZlNY2EBpnQizSdSA_1768911817
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-477cf2230c8so48999775e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Jan 2026 04:23:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768911817; x=1769516617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aEG9JILWJtDxSikxSaJuovdTLx8v+TifArul6/N/tD0=;
        b=ameGwdqxC6ftMq4fdkpfshm1rKQmZro8NlmbAU6oBDG/7tnCQByqPhJNf6mAZaLQ5N
         cqaiZXGRK7YBkLBa2MWmJ59GJ0QGLi43RVTPzXFFbwoeeBEa7vmMrRmYArdwOaHrSrac
         IwjEYgBdIFmE7zPw9fwQkBkOfGCfaczXcqAERnbJidES2i21SAINJSxaDzHjqn1MUupK
         AL4iOOoElwRxmRjlzT0kEGb/L/J2m9f6XrMRtEsWLavPVlFwb2OL66AUnL86MuP9qZOq
         ZltKfmeUEKJwLAtS5V8ginPN7uFhtRymXHIl6eVqEt+s7JZgZGhxllMzAlYN51dNRGNo
         Upug==
X-Forwarded-Encrypted: i=1; AJvYcCV+6mgKApsBI9Rj0YI0goJBeGnJIIpO9uMnvra4VlwDUUpNAoaggRW1jXrkiIhBpHa+tQosz5S6Uxh7FwEHD+FxpSXfcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDB2i/NKVDkGsh7abWS+iUC/iINRcMUUoyPig58WN8qX07b8gv
	+mMn3aDrxpqEdm2CKmceIaqk6ux1hlmyfvS7Z5NEPqAiX/9dRckPaDEoSXM2CBA3ObPS79b4TrD
	PRMQfPPlozI53m0Ln4MNxtNDtduuVkEhJdHvk3fXJxyYj+OsZ8knS7rJqzXyWYflaJKdxGvfBh6
	M4
X-Gm-Gg: AY/fxX5NxuiDn+ft0wCgnh8n7MbI6PRW2GkygDvEK0aw2ghQKh3iXQLCoCvs1iiCgLz
	0TCPncgOYuiBFo/Im5Ej6T3+oW1NV9OiZ4i/dBzK70ZhcdQyg3rbJuxkCr7+F0x80N9XGuqQMpP
	5QFKQf5262ECxOMta3izmwefevT7jPFV5cdBAM82flbRCBZUcAYzSrpla5X53sKs9ixkcLvVfdV
	sC1mtT/g7JjQhfjAyJIh8v6NGo4a2H9uJm0wnSvbEvLLozqwQvvK4upCIPTAZ8JAcgFJM7Ca6XG
	6dMmqBdq6LsKgF4dvfPQYs5sh2EGt4ZT2rKFGlFMXAQpMX+RJSmDjR4nHOYUfJm82r5IUd5zVX3
	8PNQNqeDSTLAb
X-Received: by 2002:a05:600c:3b1b:b0:480:3230:6c9b with SMTP id 5b1f17b1804b1-48041472847mr5520395e9.7.1768911817127;
        Tue, 20 Jan 2026 04:23:37 -0800 (PST)
X-Received: by 2002:a05:600c:3b1b:b0:480:3230:6c9b with SMTP id 5b1f17b1804b1-48041472847mr5519745e9.7.1768911816688;
        Tue, 20 Jan 2026 04:23:36 -0800 (PST)
Received: from [192.168.88.32] ([150.228.93.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e86c197sm247488175e9.1.2026.01.20.04.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 04:23:36 -0800 (PST)
Message-ID: <a9c9f16b-f695-4009-945c-ac3b03631596@redhat.com>
Date: Tue, 20 Jan 2026 13:23:30 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 05/16] quic: provide quic.h header files for
 kernel and userspace
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
 <32a34bfa4fcd69de5c738db95dbd71ac8e361d24.1768489876.git.lucien.xin@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <32a34bfa4fcd69de5c738db95dbd71ac8e361d24.1768489876.git.lucien.xin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QxZohUengJq4waY9eNwCza4fGcisHTnbVYpfJNYN-nI_1768911817
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/15/26 4:11 PM, Xin Long wrote:
> This commit adds quic.h to include/uapi/linux, providing the necessary
> definitions for the QUIC socket API. Exporting this header allows both
> user space applications and kernel subsystems to access QUIC-related
> control messages, socket options, and event/notification interfaces.
> 
> Since kernel_get/setsockopt() is no longer available to kernel consumers,
> a corresponding internal header, include/linux/quic.h, is added. This
> exposes quic_do_get/setsockopt() to handle QUIC socket options directly
> for kernel subsystems.
> 
> Detailed descriptions of these structures are available in [1], and will
> be also provided when adding corresponding socket interfaces in the
> later patches.
> 
> [1] https://datatracker.ietf.org/doc/html/draft-lxin-quic-socket-apis
> 
> Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> Signed-off-by: Thomas Dreibholz <dreibh@simula.no>
> Signed-off-by: Xin Long <lucien.xin@gmail.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>


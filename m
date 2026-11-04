Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835292;
	b=MNVtAOUFgfa2VnSneSIwi8xgmAy7ouNQLNSsh7H8HcRHcAIK++SSIQCF5xqNzwbyFdfn
	 y3IDMwVRJ08J2R3VSgr05ZYSs8tF3bIVuLIl/c2dUsVSbNcK7YRqHwnmGb8S3klCEfM7x
	 H3E83NH73OZws6dU6HXAdztzO8YBrtQRBQHbN6aX2adWZiUZ33ffK+sH4l0QRt46jojSR
	 onjjCbcX+sV4Pl2l6Qs3kluG0f1RFI+Wp/xZhPWyjG7Bm86oIXZgOxutGNLiQVooiclo0
	 69WW/7D3KOucsS2NnlkFCIDVardjDicqZtJYm7/vDpbRPQ9ni8b1cVKMm6wa9MG3orQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LfE6XYGuOtutQi6QIVbHin4gqCciGQW2WLAtGNmvG6Q=;
	b=YcJnWh4don5VBS1dfGQrz7ZuNgXYmgP03HEIhDMZjthXtchD6nTI2hfNcsqWxvkDRxqZ
	 WErPqNTDl5DXKmcUwmKR8g4xILHWc4L75MOWyMGeBImaM/l3qvVNC0i9+TQ13OcMa9qeB
	 G/96VBvZwFaZGb+uFtCIgfo7OLA7KtnbfqM6txu3AEZvA+tP4q4GocdfZRKp72Itu6yll
	 5FjUZzB1iOy8eWPJFVZdj1PYuf+ldjKcJxfs1njysGf5KrLhXbipGKE2DHmreBSe1YfWh
	 s6rH1rVQLtHDI6cTjIyubEiYiM8ihWvbgs6dGy3pz6WHCCAVG08XMpiKcqDRqz05g8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rA2Tkfm4;
	arc=none smtp.remote-ip=74.125.230.200
Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EADD606A326
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  4 Nov 2026 23:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EADD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rA2Tkfm4
Received: by mail-qk2-f8.google.com with SMTP id af79cd13be357-93e63db6681so89787185a.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 04 Nov 2026 15:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793835291; x=1794440091; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfE6XYGuOtutQi6QIVbHin4gqCciGQW2WLAtGNmvG6Q=;
        b=rA2Tkfm4iyQh3RgGUQZxcJ8vMJZBzVJemDzm6SCgUbWqKrOpLzAyzv9XubYAb160Sb
         LRZKtyhf/LnNMAf0gu9BlUYlSJxrOgTnyYM+lMsAaN+47l485JpzmbEIKA2mrqGNkIWv
         VJXFFDQYxBKq/YNFFnk0TDuJpPCBb8nLpkQCAk+VKDjjNPliOTJpVPW+QpGv0dHq8VdO
         749uF+oLoBAD6QVCPH1ER29reuT7K0gKnJL5wdXcyVGfe9OAC4pmxK2H/0bOHPtnHl4G
         W3eWyjj8XMxKvNp2Q1v/0FNIgtwOsQX50ZiLQPdl95VNTfd/RiYOTKm94bbhhjU26r0g
         PvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835291; x=1794440091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfE6XYGuOtutQi6QIVbHin4gqCciGQW2WLAtGNmvG6Q=;
        b=GawBZtM4Kt+bAYvf5GaO2BEMNUBvCOvgwCnOcAOWLdI6fAeJGNnU/N4jsSQ0Lx5tFO
         tG+3ts0EUOeMYMYY8Jl+bgLv+okc71zmGqKTweHO8X8YTpSV4xQOyHnlkomOK18iOjDk
         +nfQvW+9gJwVZ6x2UEiwBfQC7z8BPjetehoHtDavPrZ9Bt781N+4eWbwqPdWcOyP3yum
         X/6v9/ynQAR/YPNXEIWcYHaPt77+RrK8DjXAmAFuua1jiBVFzwfoMScVwhF5vQAePAdT
         xOJMCLBM/icxm+fpwlUW6YZ8p2PuMjIhBAi5mmpiXzuGVenZE67CKFrjn/kEVFvFfTGL
         eXig==
X-Forwarded-Encrypted: i=1; AKwUvBy0gzD0f5QyK6MFQWnpPOdfOJJPZFM4xpkxUhEz86uZvKAODGVwH03xlYb6ci5c6YCo+5rWh0fSVSK/0XU98zxlvdChEw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9Uor0G+UT2dGyj/33oHB1+yZpPcHKN+k9LL728qk8/p4+ELen4
	qgKy+zqXJlv94uKYoiR+v27r/0vmkaN8PiDSWAmn9g+nfUqq+iskxqBT
X-Gm-Gg: AYBFou0p02oq5JfS1MakD58oyxZ4rTvdNnta3OWUlYke76kpHFbDfrqOzV2kmbXP9Ik
	OukmLkpBohICHmSDVebC3626dwbmCjEBDnS+H3IjFjqfavJwUlTqL7g5kvmmKY2ACnUNcSpvfNa
	wJd5xT/eOHDYAXx5wgHredZrJAHf7Fxw/4+Q9LxoV3Uw4zk5GFaV5QjBdd99K4eZ0MNVWYj3uJb
	LN9wDOeORQ5V9D9Q6Y8CgUJaJ74H4k4LRN26s9P9Y9fIrMGFEapm9At9ybdi52HtRMsxv68v1/j
	am9Iq4AlQrTghUswAsClOF9HSd+ulV6MBqEBfSgnKi6/gfgyWt3JHOyPyD7WAdssGsZJwNqAwXL
	AoP/zisgLMQEseLP49AmbidwNLmnMYZp01g+r7GRkmH/BQnNUgm4sQl77r+/nLKdSRs6WDP2io7
	46YrnlaHEnlR2OUf1IJs6S5+3wTiW/ciS360arFz40TfVW3Itebwu/OofeaUSOaC10df+YjAJHn
	fCQbpjCupy9a+bHtaBFLWvTtRJs7Jg9U1LhAw4rwypSTGf4nQzrApEXXRU/Hs5my41X8Tir1rp8
	DAACV/ZtGqhWl6BVZwRoP1ZBXKrHqmhJR+4=
X-Received: by 2002:a05:620a:2994:b0:939:4a44:5f99 with SMTP id af79cd13be357-9442156ab2fmr2992527785a.10.1793835291266;
        Wed, 04 Nov 2026 15:34:51 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm324141685a.39.2026.11.04.15.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:34:50 -0800 (PST)
Message-ID: <0f61c649-6e27-4f09-a69f-026f91d89848@gmail.com>
Date: Wed, 4 Nov 2026 18:34:48 -0500
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 4/6] tls: update the RX key when a KeyUpdate
 is received
To: sashiko-reviews@lists.linux.dev
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>,
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20261103-keyupdate-rfc-v5-0-de1ab90a88d5@gmail.com>
 <20261103-keyupdate-rfc-v5-4-de1ab90a88d5@gmail.com>
 <sashiko-outbox-198140@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <sashiko-outbox-198140@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/26 16:43, sashiko-bot@kernel.org wrote:
 > > +   memcpy(crypto_info_salt(info, cipher_desc), iv, cipher_desc->salt);
 > > +   memcpy(crypto_info_iv(info, cipher_desc), iv + cipher_desc->salt,
 > > +          cipher_desc->iv);
 >
 > [Severity: High]
 > Won't these memcpy() calls trigger a CONFIG_FORTIFY_SOURCE field-spanning
 > write warning when tls_check_pending_rekey() -> tls_keyupdate_rx() ->
 > tls_keyupdate_rekey() runs on a socket with a registered traffic secret?

I could not reproduce this. I built with CONFIG_FORTIFY_SOURCE=y and
GCC 15.2 and ran the keyupdate selftest with TLS 1.3 AES-GCM. There
was no warning. In this build, __member_size() and __struct_size() of
both destinations are unknown (-1), so the field check is not compiled
in.

The result depends on the compiler. A small user space copy of this
pattern gives a member size of 0 with GCC. In the next version I will
take the info pointer from the union itself, as c43c1c24f3cd does for
the same reason.

Martin

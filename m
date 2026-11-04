Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835358;
	b=NBEk1jDXvw4sds/w/zu/iVHNwbfYL/AqmGa0Sp4/Kbgm+MZiVdQCLZKcWL08RaKKa4Rq
	 zuy2zifl7jLxw9CrLCh3DwwR2VFKgDc/ULUBh5hoZEafv9uTR+m5U8d5cQANwqWq5vi/f
	 84ZFgYhFeloWXirRiKb656wxdEwCOPadjPgcB08FURJh52aHLhbxb3MRC/baztqOC4zG/
	 5XOJt/rKy1eLFXF71fwtzJEC73AymR1rD389ceYsSoCetFlf2UjL7g+j+3KzG5z6InfYi
	 DAPuuWuz8xzVRQGOsXelYTCAEKS0ph+sIs5Us9Bt8AteuVTVdJa9Ox/7ANjAOY3RWdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
	b=4GcL2wO+Z8/pHwkB+/LU3oBePddxwZ0KopLiiadBSOwbgnpL3YDAIGQoAIrb2bEqMtEA
	 jJ/ynNqinCjVdAiocA+hjxxlN/vtwW5VrQw60kILkzSvZDzStBgzPIyqaz/dvsRyqKgC9
	 OD/FE50sV8h1mm8KDngdzYoEerEosZpU/XIvW1vI+MPMN3DssQeM5igzhhhrQq+vUp48x
	 mieP+x+vXcy1dL4AGZEYkj2d9jnK7R33+du+5jFiaqRarNNPZYqHzLJf00vDtx7QEAeqz
	 hCrsnm/fN3E3tx3s4GGk5BEnv/oGohSjFRiLH9BvqXQaZHB3sErZpwUOH4CijGqkn3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QCfFe0qB;
	arc=none smtp.remote-ip=74.125.230.193
Received: from mail-qk2-f1.google.com (mail-qk2-f1.google.com [74.125.230.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84648606A328
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  4 Nov 2026 23:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84648606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QCfFe0qB
Received: by mail-qk2-f1.google.com with SMTP id d75a77b69052e-5332a0f6dbbso8351601cf.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 04 Nov 2026 15:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793835356; x=1794440156; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
        b=QCfFe0qBmQEWIMxBRmhIJESzEXMTQSoq+aFcDSkZjQlnnySeD+t+HAOB1xIk7m06cn
         yFPucdbZAtUmUZpSI/AHhewWWBOXmxXLetSyEYwb1bwc0O7doH59dZ2k4T7NJpU6pmWw
         rWTnVkHDQOASvMcitMVWySFhNUFm+e+JsKJXMDsEOmtKRxAVy6ZPg8jL7FHdvIZwDWG4
         XKLu5t7fvHSStE6EURE0LGe/t+L7HZ53VpJTuftIwThFDxAqAe4OJfMjVJWRBQzp+Lrh
         X2QZz/pubB1C6SmuN/WEqhzGVgB0yVyS8G6n+MbXCGO8KWknc3/DK0Pxg0RgU3gTOHYI
         OvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835356; x=1794440156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
        b=r1xq/u31PbWQLRz/zoCrZjB+xoso7uJVyjg2zejqutRfj5xfg4XOZ+QSm6h/gwmrjd
         7aaTXTHPK19H/Q2efFo4h7JgZeEL3ek+5a+W8KfMR6D6r2xh4WUu/ZebdhnOpPp+swzG
         MxD/+6SC3iZVXpUGoMAeHaKx9CKVbOqmHH01xA9yaPo73ImOtjQhWVUkbiZZIMm3DJPe
         FZhfpQVpr6SlbpqrSxBwHSpq803/0b01O9bw6P2kGlpMBcrBkve65jdVe2MuhqLdfXTY
         7onkKPjJb0/RCOCaldzIOexMYUA7sQrlii79a8zlLKut845TB5bw0r+rUFrrYyOQLaxh
         YTbw==
X-Forwarded-Encrypted: i=1; AKwUvBw66vEV8FWl5f1VABSC0bG2o2cj2bWv6LSIL4LTMhAO2RKy77LOwksHm8vt3EfCdyioH2oaxVhSCE3OeaQ+mEQopcP6Qw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/dlsx0JaRtLEwV3X+6oWTaQb36zqLTaXsPI81B9bpoPhKq/lyZ
	/IB/VlIDAhIgfIygFP7zDwIRMY1LtHBJuahhvQ3sTLva2XpDhLDSom6t
X-Gm-Gg: AYBFou3/5mpqMY+QjOFkW1dPyGp6g+NsMm8faoHPOKqVZqK7b95Mn6Rzr6P/BfHwI5Y
	1Jr2NeZIObJ9Mz76A6u4HA/hL3bHHwtTvixN1OA1QMl48rgK/vATMS8Dh9h3ZKDeOJAB96EDteu
	QT0zph+Hmm3pU3YGU6CVrnDozqGOfQX2UUTAik5liKPC4UiTXMNyWUKSsW0Z7qP+UFvfHO7O93X
	twFtDPeXkLfO6u8BCYSak2D2U2Io5CLPtaMrzl1wpT4SDt06anor0rEotw+u8pJLjcj48jit/Fh
	9hBIsntgyfY/maSWZGvdOz2nusZztNVO1lLN2S2f7ujibx80VDXAaQAB5E+q0qrAcF5AEnSZtvC
	aaERu7hADfQOZaIgQPEjQ8lkRZwOUnZv7aImfQ4ZyaErp7whlblkHT9WZUymbwbxfKg4nbHe1h2
	bEG6lSaQbtCLkko3fPQbr25bg68M4decTTWvo3RKoBoANzfKYSEczatxFHQlgOBEzaf+BBOYgpk
	+/oV9R6UV0fUK+yr5Jzs/xTg6S4FFTUPwKLpl+QEDYTu7VhNDDPtgyV5uBC7n9uAWm6fVNbzcWb
	QQK90/E/pHCv7486ZlxbLNNgAcIypsGEEQ==
X-Received: by 2002:a05:622a:1aa9:b0:536:766f:271d with SMTP id d75a77b69052e-542b781f632mr306774901cf.51.1793835356393;
        Wed, 04 Nov 2026 15:35:56 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10a63462sm36858141cf.15.2026.11.04.15.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:35:56 -0800 (PST)
Message-ID: <2a1728c5-2856-41bb-9ffd-c80df4ffda6e@gmail.com>
Date: Wed, 4 Nov 2026 18:35:54 -0500
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
Subject: Re: [PATCH net-next v5 5/6] tls: send a KeyUpdate at the record limit
 and on request
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
 <20261103-keyupdate-rfc-v5-5-de1ab90a88d5@gmail.com>
 <sashiko-outbox-198141@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <sashiko-outbox-198141@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/26 16:43, sashiko-bot@kernel.org wrote:
 > > +   ret = tls_encrypt_async_wait(ctx);
 > > +   if (!ret)
 > > +           ret = tls_keyupdate_rekey(sk, 1);
 >
 > [Severity: Medium]
 > As reported by Sashiko on v4 [1], can tls_tx_key_update() ignore fatal
 > transmission errors and rotate the TX key anyway when 
tls_tx_records() fails
 > with -EPIPE or -ECONNRESET?

Yes, but this is not specific to KeyUpdate. After shutdown(SHUT_WR),
send() on a kTLS socket with no KeyUpdate also returns the full
length. I tested this with TLS 1.3 AES-GCM. As I read the code, the
KeyUpdate record then stays queued and TCP does not send it, so the
peer never sees a record with the next key.

This corrects my note in the v2 changes, "The next call reports the
error". In the same test, the next send() also returned success.

 > [Severity: High]
 > As reported by Sashiko on v4 [2], how is the KeyUpdate state in struct
 > tls_context synchronized when sk_stream_wait_memory() drops lock_sock(sk)
 > during a send or TLS_TX_KEY_UPDATE?

No change, for the reasons in the v4 changes. I checked these points
by reading the code.

Points 1 and 2 need a TLS_TX or TLS_RX setsockopt() during a blocked
sendmsg(), which is an application error.

Point 3: tx_key_update_reply stays set after the update_requested
KeyUpdate, so the reply still goes out before the next Application
Data record.

Point 4: a record that was already being written can go out before
the reply. RFC 9846 section 4.7.3 allows this for records in flight.

Martin

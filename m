Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013944;
	b=mL7gEKupkIup6A962IM8pI8l52oYB//nd7aQx/p3EGBqNPhAVjyWVPfLqmA5s57e9kMK
	 RKD3ne/k/O/Yc2MboJBspdmCyqVNQksD4KR+wv9d1yb2sgyMQ/3W01hjUBIh5CC5W4GIc
	 PiC/1RjlkiTXJ8sqVvBrKRmI6CUTz/pyQPrh17GdbU4FR1v53C4iTNgQ+xZ1eYCInsais
	 UEBWHD3dLcgvlPqtK/rpyBx7OsOoxOVdWyGTRtpHhS1vQ1bGwxASPToMZGMrwiD8NoBLL
	 WMg8QWxCpv0tEP1YM2feQ4w2oRdHklhOupC8IqjzFVDoqamrBMa/kb+uOxo+FAhOoCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6eCgEceiFsvuqOLL4DtIMBpdvoUh9ThW46mPVQRJDrA=;
	b=AKiCjM6eO0f837sKHyJka/XlPwCtEm5OlZhEhhoWHk1wbOW6tiKWY5BbQ6zC4Y3oGaRA
	 u2vz46trS3fcISwiS4ZrsexLlstCW1A4rW2I+o50/+ayJ1UX/VCHza3m6HflRfViUxZZ3
	 4+YpgNxoo0TVfDAkIC/4l6v9QKnRLFaHTsyaA6CS4/FQqei16769ySdkmZfP2pUcfWcsX
	 XwC7oEI6IAB0dbD6cGzszHa/7wMfDqTR49jFW6MySZkiyYXHgc6Tc+9FQ7KZQwle6riY6
	 dqj8jxQvNe1TZJy0iBpBOOJn6aScVvCa2aZSWb+JO/fYrVGtPwnroBRIuJU3itJhzOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jy3hsEFS;
	arc=none smtp.remote-ip=74.125.224.132
Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C35606A31D
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 26 Oct 2026 11:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90C35606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jy3hsEFS
Received: by mail-yx2-f4.google.com with SMTP id 00721157ae682-8b0dbcd4b6aso5329787b3.1
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 26 Oct 2026 04:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013941; x=1793618741; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6eCgEceiFsvuqOLL4DtIMBpdvoUh9ThW46mPVQRJDrA=;
        b=Jy3hsEFSxDD9lc9ufs6hlJnkNwYi1a1W8W8o1YmTL+JVCqVBmJ0SOBfTb7vgFiCFJR
         unC/JQNEnqW/DvJxFW1Blhmw33ofSMsdwKK03lQXGt8nCFgALHf4Q70nfHi+rUaWun2F
         I6hm1TDTt3Va4iswvUH22XnxlN+ALkefbcYfwrWuxn27XARpRq9nme7l62+Reqd6SA02
         dz6yNrkhzIbqJvgeJI1zKwRAiFYjpVxYOzjNLpctEj4mXyMaR8nVVEzoCumaFY6EaB7u
         KomzxDIRnRl50E38SV8Sv6z+NfVif19IZZ4dWJlmX2eWOpX7e7SB5W04wiCvv8fI+GY/
         eEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013941; x=1793618741;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eCgEceiFsvuqOLL4DtIMBpdvoUh9ThW46mPVQRJDrA=;
        b=qXexNcdLdm7FQ8ze+NKx04ZnlZFkM+cVBk8iPfIjs9eSoaYlywicvW6mPNhb1T06E5
         xkuu/spvTWcqQO9npJbLCeD2pZzmt5E/3fPCeH1quN1GdqTCWVcBVG+vGJFfNA+diDSc
         GMPxZJX2ws5LM4Tf0n/OH74ou1zZs6dZWXi9NhbGB82rbKZ3H0iQXJ8Q+FRRCbF+zW94
         XfTSUh/ZGF74SKNJKtU9HGboqvZ2hd+aG5Q5GT6DshoGm+nT/lI5BthhsiOGlzotpeXe
         QmgRawLwO9n86lOYfpefe7VZTEtPFke0t/ziCY5l/ULQkoTGumlq+mcqNMWk7/TNO3o5
         3KyA==
X-Forwarded-Encrypted: i=1; AKwUvBy1ISTpyqsFr48S55IV7yw96wTHYE8sBfSRgYDRv0AJMJEiA1mGtDkS0S6ZJwdQW57G5GMjWKd5sSUepPRMIvzUhu80iQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYILrPNTBgP0OUVGOAGuYsYqVaAJ+kbMBZ7LH9rSTAr9jxBnNzYt
	Z+yPvodcyrpsfv7V6d+S7cX3pZ87+UF4DpGYUUM4vI90kHjHjmztjkb/
X-Gm-Gg: AYBFou2ql79JKjxJFPtCTF86zLWRBvDPZJze8qvPxyNLjr1WN73MQoDcD13sshqdfcs
	tgb4JblzlbEZ5PpYxRH6haRQ4i3U8dtRnI9iKrXYr/VQzFsycEmQFagGWEK0pwv8ipq1lpNx1Iv
	68MUvLBnYv5+iOisq272x8seMDwM5vrQ+zG57Th865GLasKR5aP/ia9wCatR0gOgSNt1uBGLi5p
	crw6ZLA51kxBeNTaA/5C5KUEb+T69eMXkV7gqzCYTNuDU6bLPmkjlkM/XruElu8dz+5nZ1jcQ61
	GKqk2aPkndioB3ZuRkcSNi5kebzs032KrPMOGQz3LnxG13YbKAYxryU8kLuroUzqqJ0Vs7UBsD9
	4EtSQnrn8oNoUqNp+XnuZJOhAu4o8BY/DUYFnsxcUki/VhFZNxfjp2piXmrCQa7gEHnzSdenpss
	IC8kGOViT/hvTw3/sjfzrsZb516C8Ff/sdEMVB7eaxzNU1zjh+EQjIiMUe8LyB7wBJ4RcT/WQNZ
	+f+zG2GNT7clfhhfAw6DRCNT4Cz/4H8LcKdOO/nL+Dtxkq0+TvgiyekPIkcoKRs
X-Received: by 2002:a05:690c:2788:b0:8b0:eab2:f502 with SMTP id 00721157ae682-8b166c93421mr38305577b3.61.1793013941439;
        Mon, 26 Oct 2026 04:25:41 -0700 (PDT)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166c5d605sm29719597b3.5.2026.10.26.04.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 04:25:41 -0700 (PDT)
Message-ID: <c0c4dc10-8999-4c4b-977c-69beaae7bdcf@gmail.com>
Date: Mon, 26 Oct 2026 07:25:39 -0400
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
Subject: Re: [PATCH RFC net-next 1/5] tls: add HKDF-Expand-Label for the TLS
 1.3 key schedule
To: Hannes Reinecke <hare@suse.de>, John Fastabend
 <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Sabrina Dubroca <sd@queasysnail.net>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>,
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Martin Belanger <martin.belanger@dell.com>
References: <20261025-keyupdate-rfc-v1-0-60b7756eccbd@gmail.com>
 <20261025-keyupdate-rfc-v1-1-60b7756eccbd@gmail.com>
 <c75aa5d6-5037-4489-99e0-3e38528e10d0@suse.de>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <c75aa5d6-5037-4489-99e0-3e38528e10d0@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/26/26 03:27, Hannes Reinecke wrote:
> On 10/26/26 1:36 AM, Martin Belanger via B4 Relay wrote:
>> From: Martin Belanger <martin.belanger@dell.com>
>>
>> A TLS 1.3 KeyUpdate derives the next traffic secret, key and IV with
>> HKDF-Expand-Label (RFC 9846, section 7.2). Add the helper for the
>> kernel to do this itself.
>>
>> Only the part of the key schedule after the handshake is needed. The
>> input is a traffic secret, which is already a pseudorandom key, so
>> HKDF-Extract is not needed. Each output is at most Hash.length bytes,
>> so each derivation is a single HMAC with the library SHA-256 or SHA-384
>> functions.
>>
>> Assisted-by: LLM
>> Signed-off-by: Martin Belanger <martin.belanger@dell.com>
>> ---
>>   net/tls/Kconfig    |  2 ++
>>   net/tls/Makefile   |  2 +-
>>   net/tls/tls.h      |  2 ++
>>   net/tls/tls_hkdf.c | 82 
>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 87 insertions(+), 1 deletion(-)
>>
> And another HKDF implementation. Maybe it's time to split if off (again).
> But anyway.
>
Yes. crypto/hkdf.c went away again in 6d888db2cfd9 ("crypto: remove
HKDF library"), when fscrypt and nvme-auth moved to the HMAC library.
tls_hkdf.c follows that pattern. It needs only HKDF-Expand-Label, which
is one HMAC here. If a shared helper is wanted again, I would do it in
a separate series.

Thanks for the review.

Martin

> Reviewed-by: Hannes Reinecke <hare@kernel.org>
>
> Cheers,
>
> Hannes

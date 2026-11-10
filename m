Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329998;
	b=fJjbRJ09Gi8yYQg6yQYJTh/S3LErzVqSlhzPE1/UuYKlvW+H59NgqDHISa1LmczpEcNI
	 Nl+NhVAAnAlJDVtcNeymexlVLW8m6+YyEYGj3sEeVUxFgeZqGCGlPxen0TWNJxwOYfhan
	 6na9S02feHX9WR2zSXp1o6YJrb58ALM/5BzuwsGqG/SzPuY7KC8TRp5qyq3+QWFkSSeCo
	 55Tj7BP/HSJFlsLCzsZz7qrES5T0wOBtqdc1B/LoQE4J3cUpzwqL4KO0SIlCpBh9MMn9J
	 ARy8f6QkKbnB2F5oEmKqnizwFAfpHBeyTr/8mAUzlrBIm8QoLwwJubXcwkvSHaqk6Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Kf7w354TnqYFz6mNyIxqofoq3s7JBFyBYZ6UqKXQCes=;
	b=PzdH8+SKPbtjkOTOTTjHrEIs12FgdxZZIryxKOV42sLDhis5aNMkSOsHx5eH/7qWL+fK
	 KHSJu8Up7hzH/CKngDdzYmTWr3EGKGYkn9cNVB79Ki6HfBmaWFhrY/LxBTVqiwphLjqVh
	 tgFI9RQOIgUB36Kk0MxifMpZwqP5S4aIOGtht8kvdjfLSbeBze4pGL7l6ysopDa/q9RiO
	 CC6cgqKL/C01cZieZQMR8WNa6Tl7DAYyoMNGRM0g3phDe4LKota1UTHAsB/H+CAVlq70C
	 GU8OqM9flxQIlQgFLaPEZZxRDhpaKIYWZQTTXllScehKRWM/o8Izr87vBXCWTHVzpfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mfu49GaU;
	arc=none smtp.remote-ip=74.125.224.138
Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D386606A33B
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Nov 2026 16:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D386606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mfu49GaU
Received: by mail-yx2-f10.google.com with SMTP id 956f58d0204a3-67bf5e70218so484535d50.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Nov 2026 08:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329997; x=1794934797; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kf7w354TnqYFz6mNyIxqofoq3s7JBFyBYZ6UqKXQCes=;
        b=mfu49GaUYIP7zWghGuQitGOxiaihPhPCYlK5/cYQXIc2Q1CiPJlAjVlIy3UAg5B4SW
         Frq5zCSkS96gUFvp8MPoM3zsPGXv8p8UHsypxye2Sqc6oA0DLfS1IS3ADxpeBm926uRS
         9HvTAAohKlD9nH+LrWMdgYNo+sZ/yuQV03k+f5nbQ9ZG/HXxCTgmY4NHg82a9ALccet7
         U8tOwz2NoPgWOpAGwON5sFGZdCaJIB4FwfuSZiS3cWZe+8uwhV7roXZw2Rhl/BhTD6Us
         ao2AShaSJnqlvX66oqyzavuAshzTXNSIldFnl54M0zN9faR0CpRudSJt2SDMhm0l+AqF
         OMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329997; x=1794934797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kf7w354TnqYFz6mNyIxqofoq3s7JBFyBYZ6UqKXQCes=;
        b=rkFunkWvhfZob4Nb0lr0IakVX91/77fOLKsTmN8q9bUEXNWzh0D2tKp6ZaG+eicWZx
         OjqdcX7pIN5E5UIqQmQdbghxjNlf4qxTxmdR3DmD0BGJ2V9jWhV7MevaQPtDKEEa2kGe
         O4MNolIN/PB+rs9fU84JVg6tsQBn+g3NoHxJDDFd4/3dq7Uf3udvQa9B6frrENxkR2lR
         Zo4mxzOm1c0dgQjHw3Y3WCqozmiIiLxUiUeBwdtlghDVcFTe8pKRIIavx9BrHmnF6FdD
         ibKFczvTVda4vu28u+cjENGZSIrWm3xltrtVvE2D4skEMVqrfmw5s2gF/btzv2QR97EO
         4QVg==
X-Forwarded-Encrypted: i=1; AL+hErHY+ZtnAMCdIgTLOf4AJCSWlB0kZAgZ8woqiAJe7vVS9OStgMF8zb2UmdaNzvXWDzq0zYfhjcK2ngtl6o5krGMw+Xd9Ew==@lists.linux.dev
X-Gm-Message-State: APuU4Z+BP3flfvu3pH5UmQUKQ2dM71XZV0I/wRCyiiIoUObZVYI7FTjH
	Vz0oMuaH1G8qg7pNG+ySJRkOAYIxP+ULyQp5esV5J0HDY3evUj7l5qZ3
X-Gm-Gg: AYBFou3vRROorwTG35nWvJr/rKsXVASzVVbcYlsfmB7Ot5SQ4zzly2EHyL8WwEcslvQ
	dxnjt24rbaxVDGQqaLEwsoALOWqBUxzuD+JdfNLIwsPRj8vVfrimnBcECUuCT2As089wToRPqS6
	v5j67Ku/x4aizyX9aiuWC+80JfO8Rpj5YAOqY7ceRHwo0C4h6Q5y0w+gpR1tURo6yedWlukpOgx
	jHcZS880FzlzCGsY+ef/TiW/n/A8CyGN6XAALqy3IkPYhutWr32qk0dUgBNgWAfGfT90HY6ulIh
	lUVdnxg83zpN9uk2o26IjHy5xPtfwoKV5fUsiAjR0XprqjeM12p3ZAjBul0tMY1u3fNhlbXDT/m
	Si9xiHx4pW7sS/aosItFjiAuOFk6uxmo3fkifGNJgqILcWJjqymD7y5uphRtPDfES1gbUvZFFRS
	L2dRhDRVf12sbmG+Sm3tV4Sp7G+95YMPXtCqVlp94PbRpYrN/K+eeZczt8q3pU/B9R8JPtfhFRh
	PHKecC0T7lXlR32arHD4ThRtQda4wkmYDNZNjjzWJM30vQPTlUlqJu66jMEzCyHIfzCH4elIhJi
	A1C33uYFNuIrMdAKxmkv6g21c/KHXnzLqNg=
X-Received: by 2002:a05:690c:e211:20b0:8b0:6d2c:1895 with SMTP id 00721157ae682-8b392b410d1mr14729287b3.32.1794329997081;
        Tue, 10 Nov 2026 08:59:57 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393b2e455sm22746087b3.41.2026.11.10.08.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:59:56 -0800 (PST)
Message-ID: <85e09745-7bab-43b9-9982-4428f5b61750@gmail.com>
Date: Tue, 10 Nov 2026 11:59:55 -0500
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
Subject: Re: [PATCH net-next v6 6/6] selftests/tls: add KeyUpdate tests
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, hare@kernel.org, cel@kernel.org,
 kernel-tls-handshake@lists.linux.dev, alistair.francis@wdc.com,
 martin.belanger@dell.com
References: <20261105-keyupdate-rfc-v6-6-99b695f9eb4f@gmail.com>
 <179424471492.994134.1896421329544039632@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <179424471492.994134.1896421329544039632@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 12:18, netdev-bot+sashiko@kernel.org wrote:
> If the AF_ALG hash interface is missing, should these tests skip rather
> than fail?

Yes. v7 will skip these tests when AF_ALG HMAC is not available.

> This isn't a bug, but does any test check the next-generation secret,
> key and IV against an independent calculation?

No. v7 will derive the next key in user space and compare it with
getsockopt(TLS_TX) after a KeyUpdate.

> Could the test also check that a KeyUpdate sent from cfd now reaches
> user space on fd?

Yes. v7 will add that check.

Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26D31373
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 18:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749408314; cv=none; b=eDz6ftgLbehZTQU9TOdsvCR9i9OC9sqp76rYBCZSBCiypjJ9f7EIvqoUP13/qz3LsE4hRxfd8MA1S74XFv3I0w9v263xqnJyibtM8BL2wTVI0nFjdlcbUhRrRW3wCzen4wkrUqclXVgcAcdpvgYgOwVDrAAtXEMETWokBvFL3xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749408314; c=relaxed/simple;
	bh=UiD7+Q+gDX1CbSlBx7E/hfMPi2ph08Bsw3nQ7zVjijE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=F0F5Pc4m6bTaNMCxcuJN68PBJUVSnjRN4sEEXD3u5X2c23M4ivi2FBmzvy0u6q9H9zf319vEkoTX1yIloth5FejRVxkyd2H7mohFvUKmmklQwt9gZ1ge3aoZC6FvdhUiLfemQstLj9KG8MDRTlhjHI16EfT7Tnf93/AN3j5c6dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mt4O5DNP; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mt4O5DNP"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a522224582so2252055f8f.3
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 08 Jun 2025 11:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749408311; x=1750013111; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OE09WOnDH69Xht7cmswK+MNhIlcJOfjQptbceZAwlp0=;
        b=Mt4O5DNPM9j/p48V/FCkRaKNccraU7IOC9Vj5RYDY5Iz9pvUzSjuezo1a1s64G1O3c
         Qb+3mMn6c6e5bQTjbVGMuoNlZ0cUXJf5NEYgPC6hzPU3Xcmg0FsE2WhOnoKmrKM2SVnT
         vXDNVrv1UAtBQhXh55dYoqYH79toXddb0/hIiysuNaygz18irSJ1Zg0W8zabeTAiSH6n
         Bqb86e/rPtvmhDmEw8MgMygXdVNJZmcYKHkESeRSeHIi63ch/6Ut/WAASL6cDn/rJn+/
         dSi0ALGWkbhPJxaPHgYsNejTXPeaqYn+46BKQX4zkxTKSUoiHkuVKuCEP4OUFpJZyix8
         iyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749408311; x=1750013111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OE09WOnDH69Xht7cmswK+MNhIlcJOfjQptbceZAwlp0=;
        b=bDQVuqa5QXhnVTOYpKpeEOd0V6LnYsi9+RcSYmBzYgLAKZBJAONqs8Fe6rNaDArmyv
         7SzpSvbiBPltiOqjKHL/t9l6YZZkIgPrPnZIKlANxTmOcsokDxulgYFEfNsCMZ2WMA8e
         jDN5dLtUqjDg9c1rXrHjbVmwLga5yfrMmi61Ma95Xqf8Bp9N7FLvXiYdXcnWJfu8Qs60
         pbQUJ6ZTVn5psQ1F8tpPrDZg09ChijqF9zSXzoFaT8TvrUEWEP90uwAu7nClW3iQFpAx
         PKuk3T15+ysL9j+zzsPwPQ8s9vBCfnYPLi1YnY2f695f2gsv6mz1S7bpv0VOdZRoRbn9
         lMZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4uUXERQawQvgdDszElu1GMt8Mc9phjowxShrVtdRFnxVc3s1BujUHLJm9IBp8Qj4DGJu2co1sYhibv2z+gIV0QeWWwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuTyC2ls0XCVcyo6EEvZgswMBcRq1B0YEc20Fg1PM6qpdBEhe7
	JiGFFKxlQ8ssyZZzUTwXYtSqRw2FX3jHqTpN2EFobTY59QZLp1zIu+nj
X-Gm-Gg: ASbGncvfJwsyTaDE95lT6VicAIFgE1PKebtIHqR/9/Va3Kg1sLCQiYfTzNbI4N+8Qzu
	ecInZWcY7bqetG85HNlX3Ksjcyq9WA94jbdT9i/F57eJ4ursx/qK5SzJJuHX8rp5NYZ9U9CQtk+
	A/LoOBq7GYZe+BYtuBqU4NAOiQHUGN/OA/F+9H3iT+BDy6ex+eJoJgqjCu0I1LWhGdQ/tLLhphi
	vD+NHEvhkwQaxChiDMR+LtFcRJYxJEHACEExu3AvgDBY0PThpc6iMksuxdPrwThxAd4v1ohLtuQ
	0fODTW5Y6AD3VuTJNvRHidJmgrpWnwgEma27rS5TlDZiuS+RicfRTVchJKaZHdy3ONrsX2n9ZWk
	WhmoccbP1vxYRNam6tlQ=
X-Google-Smtp-Source: AGHT+IHc6H4LdmeuNgt9nq4sahSkUNzaGmTjZXKtq9QmYQUwu22jVC7fKk7PecShp2ljIOJt4U+B6w==
X-Received: by 2002:adf:a3ca:0:b0:3a5:3af1:e21b with SMTP id ffacd0b85a97d-3a53af1e779mr3980535f8f.47.1749408310825;
        Sun, 08 Jun 2025 11:45:10 -0700 (PDT)
Received: from [192.168.1.227] (40.135.90.146.dyn.plus.net. [146.90.135.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532464575sm7780934f8f.97.2025.06.08.11.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 11:45:10 -0700 (PDT)
Message-ID: <ace628ba-a7cb-45b2-a5f2-cd3810b0c1f2@gmail.com>
Date: Sun, 8 Jun 2025 19:45:10 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] server: Add boolean config option "verify_peername"
 under "[authenticate.server]".
To: Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <4b17224c-0525-4e30-9ff3-4c0abaacab89@gmail.com>
 <b9815a8c-25a7-42ed-aa7a-f90821cf4853@oracle.com>
Content-Language: en-GB
From: Ken Milmore <ken.milmore@gmail.com>
In-Reply-To: <b9815a8c-25a7-42ed-aa7a-f90821cf4853@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08/06/2025 19:30, Chuck Lever wrote:
> Perhaps a better option would be to test the socket's source address
> against the certificate's SAN field, if the SAN field contains one or
> more IP addresses. For a client with DHCP-assigned IP addresses, simply
> don't put an IP address in its certificate.

Well that's effectively what happens if you pass a textualized IP address to gnutls_certificate_verify_peers3(),
it is checked against the SAN as per RFC6125. But see the "verify_peeraddr" patch for that.
 
> 
> That check could then be enabled all the time, and perhaps could be
> changed to "warn" instead of "reject".
> 
> Still, this feels a little unnecessary. If a client's certificate is
> used by another peer, that means both the certificate and the client's
> private key are compromised. The usual way to handle that is with a
> certificate revocation.
> 

Yes, but again, this is not to intended to guard against certificate leakage.
It is to enable secure discrimination between peers, otherwise clients can access each other's shares if they simply change IP address.

Clearly if you implement tags or some other mechanism of securely linking the certificate to the client, then that would also work
and would be more flexible.

This works and is useful for some limited use cases, which happen to include my use case! ;-)

 


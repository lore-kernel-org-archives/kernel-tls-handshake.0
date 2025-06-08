Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2747218A6AE
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 18:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749407299; cv=none; b=RBijcQc1wNhBOflI6v3hNz4ezKiy2WD1HwUfmzf7j+iQGzWvFz6qLGTbSrVnz8gAoRCi8DpUXm36HE6WkC5mKieHd/auXrGxg4J3gog+CRc6HO4Xz0QYmi6kfqLbSqy5bC9ObG2z2wJ1u18zIrMgE7ppwGy51K0cgmqjL3aXN9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749407299; c=relaxed/simple;
	bh=zG/zk/fe6bwDUGJpu4wqR9OSX/lnz8lcSJfv0fKYiyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oq4P/JhamNXE030rQQ6QKphIeNu/cUy9d8OrwiqKbPGiURNVnAw2+SYLMZTXP6Pnw62jVtXrXU4jHsZgLSD8afzF41quYvOAnMfzcNUBD3ELyHffZaT+kWO0cBvvve3TnvsyCe1FA+UBC4z7cZBnK5Cd4UcD/QpNZF4Dt1qMyBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpmfSK9m; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpmfSK9m"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so31830545e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 08 Jun 2025 11:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749407296; x=1750012096; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+6FsnS+CSyjDjJT/Y4w+q7wV4iGlzmG8TRZHa96Xkg=;
        b=LpmfSK9mRbCCSylCAyp4N2nlzs7H3e9EHsM3kTE2c+WiRaidpOap7tKXw/2vZBRW6m
         UUynIwxYsWV3lFmzV1LUX+3KOT69skM2+9wNRamDNFMWThAtkpxUVbFADUX90fZQVVHH
         ig2LXWbYwE8iXWkVCqIdJ5tGogbTwmO/o63Q08s9WK81ZXIaBYOSTq2ELEZdZSlrAiRm
         NA9CelHvaLlMpzfCO1I0+xxD/b/CV5YDomsZSi/Fv5Q0oqR/KgLaY6Tu2p2JbWeB2VK6
         ZcOLAR4yu2gnyU/VTANvg0AYxFeSo+EMS4iRLJ4MNSPgLxCMF9jzsqSF7Pqr9ptpDd2b
         5kXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749407296; x=1750012096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P+6FsnS+CSyjDjJT/Y4w+q7wV4iGlzmG8TRZHa96Xkg=;
        b=IE631m+8Hy+ttMB9d6Lpnid2cpqNEXzv0ggWXMMVYmGhe7ToojMXRlgW6ntblgWWDz
         +67oVDMaYAQvy6ADBKRp5feCUzyzG7i6qE3Ux1EPk2lJWwRUEpHuU5Wl4IQeuyznvCr+
         5Q4mPPq4cwUK+f62x7syhTQv6gVobYwudHqYKzh8WFzrGa0V/CZbBOKYxEBh0u6N6ZKq
         bB3aGWLo2sCwPbE8HLYucbpK+tMahY7yLHEaa+aYSSmlJ+Bq23FraY2fxI6FZQh8Jcd8
         uw7kAvLJry3qT1+vKvFvfyuIS1s7oZUvSt/bT6MA6AwWKrmlj1qr5l9dc81s7oLo3Dp6
         6SvQ==
X-Gm-Message-State: AOJu0YyB61EG6/mAdQgrG/7eB+0iLKBz4Bo4C7BCEIyIbglOIuzRGQI+
	HYWK/U3lJ/+Jc91ZXe+cTH/seZgDUnDgAbbsF8FV5WV/wKNf77spPN6NC/0A0gGz
X-Gm-Gg: ASbGncuFPirgK8z2WDbxRwRSsjAD2UxsraKri37padnC2KqHVgvbh1UUUc2tsS6eALY
	SnzukE8h4hcI95HEi1yaGIE3xFPAezIqAzkARCU10R3uWnv8KtSLnagJ/aQPUnRWWaYrLJzlY4y
	iSq++EFLAOje7neOSUapYOv83lUJ2Diruoi50yfgB83Keaw13lpSYqtMWYBFhtpW9aSymb+IR3g
	0bMz/KUZSOiTbIhGMzDzTPSgCrr4ibOLje4RywLBWUq3+BsySmN4ZaJOBC/Qklh5njD9UvXFmT7
	9R7rnHmS5VhipjN9JFiT2DgJ5GUBJgMj54kOwl7ij4s8NXUQCxz/SMY3MmW0m3WX8K7i1yG4caQ
	w19xgLgeD5Y+ISR7wXpI=
X-Google-Smtp-Source: AGHT+IEMzAA6vfYzzoppIxRMiTwiwHGgJ0RsAnpDgWGJsnM+HBx9m3NYvnoWA7jKwpMYV8JqO+L2pw==
X-Received: by 2002:a05:6000:4202:b0:3a4:e63d:2f2d with SMTP id ffacd0b85a97d-3a5313155d0mr9442581f8f.6.1749407296232;
        Sun, 08 Jun 2025 11:28:16 -0700 (PDT)
Received: from [192.168.1.227] (40.135.90.146.dyn.plus.net. [146.90.135.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de01sm7914561f8f.11.2025.06.08.11.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 11:28:15 -0700 (PDT)
Message-ID: <1de55cd8-1929-48ef-9c26-3dadb911b58b@gmail.com>
Date: Sun, 8 Jun 2025 19:28:15 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ktls-utils client address verification and other patches
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
References: <427f90d7-5bc9-4d40-ab94-a1f024b7742b@gmail.com>
 <0d1d9550-43cc-4e85-9d88-adb72ffd5dfb@oracle.com>
 <8342df0b-f308-4b95-905d-87d2c4a4d55a@gmail.com>
 <7c0de7c2-2c4c-44d6-ab54-b39d528e2b95@oracle.com>
Content-Language: en-GB
From: Ken Milmore <ken.milmore@gmail.com>
In-Reply-To: <7c0de7c2-2c4c-44d6-ab54-b39d528e2b95@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08/06/2025 18:58, Chuck Lever wrote:
> 
> If IP checking is needed, mountd handles that as part of the usual
> access control, once tlshd has validated the client's certificate.
> 
> To date, we have been thinking that if a client loses control of its
> certificate, the cert should be revoked and the client should be issued
> a fresh cert. Because in order to use that certificate on another host,
> the client's private key will have to come with it. So both will have
> been stolen, quite clearly, thus revocation is probably best.

AFAICT a client does not need to lose control of its certificate in order to be compromised.
If more than one trusted client exists, each with its own unique certificate, then they are all
able to impersonate each other. They do not need to leak their certificates for this to happen.

I don't believe mountd can prevent this, as it will take the client's address on trust. Or have I
missed something completely?

> That is more-or-less by design. tlshd is going to be used by a bunch
> of systems, not just NFS. tlshd can make decisions about whether a
> certificate is trusted, but the consumer systems (NFS, NVMe, QUIC)
> need to make their own choices about authorization.
> 
> Our plan is to have tlshd tag the client's handshake result based on
> filters of the client's certificate fields. The trust store says the
> cert is good. The tags indicate what "category" of client this is (like,
> "Subject:O=My company") and then mountd can authorize the access based
> on the tags returned to the kernel with the handshake result.
> 
> I believe this can also filter based on the client's CN or DNS name, if
> that information is provided in the certificate's SAN field.
> 
> I'm working on it right now. See issue #21 for recent traffic, but we've
> also discussed here on kernel-tls-handshake@ a bit.

That sounds great. If you can tie mount points to the certificate by any sort of identifier then
that would solve the problem. Clearly I've tried to use address, as it was already there.

I realise that the approach I've taken here only works in some scenarios, although I suspect the
problem I've been trying to solve is shared by a lot of sites using NFS in a non-Kerberised
environment.

Having waited a long time for mtls to turn up, I realised on trying it that it doesn't (yet) offer
sufficient security beyond clients being "in" or "out" of access; there is no way of securing their
access to different mounts. So this seemed like a useful stopgap. Being a good open-source citizen
I felt obliged to offer my solution upstream, and I've now done that. It's working well for me as an
interim solution, although I'm sure I'll switch to using tags immediately once they are implemented!

Thanks,

Ken. :-)



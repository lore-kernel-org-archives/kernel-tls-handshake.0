Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DA034166B
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  5 Jun 2026 21:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780695186; cv=none; b=g+AHmstpiTVfwNDKb+grfXzQY3uHp2JW7eMUXGLzU9Y2gLbICaaTt3N0ncX/njVWsfILPsbb17anuX9Qyk287iLm1HyCUtpImefoSqjrsioyjUnTdvVeTyZcgPLezIwIE/eEbalEClAp1ORn+i7RX80QYHhbhf3wu7rYAmze9Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780695186; c=relaxed/simple;
	bh=yB8i6L7KoJ6YeQ5x5SkEb3TWEe2vEfLFo8gyBr/eSF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqVfxUI+tFDaa6P9rIZ5J3M4s1r1M1XHioOgWCfjPh1M1gqVGAcsCnGmZDsh5LvhvPcnViRTeEA6TK3gMyFYHOyLPJ5MVVMi4pIXcEg/SUDtXQyLIFC/SF8GnpA74usamaPcD3gx3FgwMfmfDSIo9aDCOSFNULGeZS33oVpM7eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4905529b933so23972915e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 05 Jun 2026 14:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780695184; x=1781299984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yB8i6L7KoJ6YeQ5x5SkEb3TWEe2vEfLFo8gyBr/eSF0=;
        b=CVnik91Yqjl/vYCyUGmJED1SuQEJ7osxS/N20FFN7fWKX5QSCuWrj0wEAInJ7J2DI/
         83cmjAiGxZHJBhw09Gl+1HjVVVsBbV844imndqXMftnrd6vx+15NLCaRn3Tj9W4I7Kmt
         06Z6D6usD1ZBDRfoKR9BShXX8jf85/hkpa7fAZq642PdGvV5svvzw/Q4dnZzdzkmfDm9
         S+3POMyO5DbKUYod4TdpxzG3gpmHt3UzGw7QXEOBzNIn7XIiaz8UQDKkSRaZPRx+sDze
         owI8FVO0ZBbD95xYSAsE92aqN9grgACX+M9sFaF8Q9hrVP1hrujS1vODWS1ziPq+znQ0
         jZ0A==
X-Forwarded-Encrypted: i=1; AFNElJ8LplejjYsPlm+htnc6Pdv+MTcoVdsQ13PWPPilcWrWX7PXYx1hXX5NvxF/5ha3rFWk7zHy4oaeLUwqIyDpsSEb9DwZSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YygCFig2NV0R2Ucf1U16CND/Ho28SP8OAPZdTkpwE7qMasECRgp
	vwBX4wiJxGYFC1SNQ+RTUYrfxwJrDiKltVpmFoFCynMl1gr6ux9EKnEU
X-Gm-Gg: Acq92OFGAXGsKcSssEP8ZGmjG728WBkgh+ScaA95rUYJunmKgX5b5iP+H5Jm8s9RFfL
	mzSAbCC7F8eGXQ5LjO591cIcGTtI48G0p0pCtxMuS1NGbM7ouQcXq33klKUQNP2Hjd3ZX+pvLDJ
	KTgDd30vaoq4AXGEZs1+e937+hgAuU/EeGVJDtOcRBIzJ8MArIzi/Fy0IW445KXNyzQmzKJj+sA
	LZZYH0JI5+LpHZXCKQCp9HhizGq+4EmfLZWZ99umdq/nwzQWP45Ek30Huca8QP1AsD+tcOi2cLw
	VvcY7tgch7O0KWrPNzAVpL8m7qMP1V2pBTWMrXqiA0T/eV/hB8TGpWENFzJB9fCB+mBv1JhfFh9
	jA3t8NSRJkANRTpo0XRr6IU2jqAR3gAX3BCWambPodpRRHIhGvx3mG7c/Jb8Kf37DLL/S3RWhK1
	ITcxH7InHng7ooXyTRmww1Bl7CW1hZ3GFvgaqHtmJi1n1Dzt7bXrJ94NfUM2q/aMg=
X-Received: by 2002:a05:600c:8183:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-490c25c6625mr78070045e9.25.1780695183438;
        Fri, 05 Jun 2026 14:33:03 -0700 (PDT)
Received: from [10.100.102.74] (89-138-67-1.bb.netvision.net.il. [89.138.67.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d52e5esm48030115e9.2.2026.06.05.14.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 14:33:01 -0700 (PDT)
Message-ID: <ab767baf-aa94-4ff7-81fb-c19804a7883d@grimberg.me>
Date: Sat, 6 Jun 2026 00:32:59 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] NFS: named client identities for mTLS mounts and a
 per-namespace .nfs keyring
To: Chuck Lever <cel@kernel.org>, Hannes Reinecke <hare@suse.de>,
 linux-nfs@vger.kernel.org
Cc: keyrings@vger.kernel.org, kernel-tls-handshake@lists.linux.dev,
 netdev@vger.kernel.org, Trond Myklebust <trondmy@kernel.org>,
 Anna Schumaker <anna@kernel.org>, Christoph Hellwig <hch@lst.de>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>
References: <20260602154740.49861-1-cel@kernel.org>
 <bb9a872a-d4aa-467a-b4c9-7bca174a6bbc@suse.de>
 <b38b0983-7a63-4e77-a549-2d8859752cb9@app.fastmail.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <b38b0983-7a63-4e77-a549-2d8859752cb9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/06/2026 17:27, Chuck Lever wrote:
> On Tue, Jun 2, 2026, at 6:39 PM, Hannes Reinecke wrote:
>> I am all for making keyrings namespace-aware. Logically I _think_ they
>> should be tagged per user-namespace, as this really is about the
>> filesystem (and as such would warrant to be tagged per mount ns).
>> Tagging it per net-namespace is not a great fit (well, for me, at
>> least), as also block devices might require keys to present the
>> bdev (eg nvme authentication)
> My understanding of the proposal is that there is one keyring on the
> system for .nfs and the keys in it are visible only in the namespace
> where they were created.
>
> Therefore the consumer (say, NFS, or NFSD) is running in a particular
> network namespace. It will create keys on the one .nfs keyring, but
> only the tlshd in that same network namespace will have access to
> those keys.

Can tlshd run in multiple network namesapces today?

>
>
>> I might be okay to have it tagged per net-namespace, though, as all
>> current users are in some shape or form being network related.
>> But I'm not sure if that stays that way, so I am worried if we're
>> not restricting ourselves to much by that choice.
>> As really, the question is: what is the driving the namespace selection?
>> Is it the _requesting_ layer, ie the layer issuing the mount() call?
>> Or is it the _providing_ layer, ie the layer providing the
>> devices/interfaces where the mount() call is operating on?
>> If it's the former, then we need to tag is as
>> net-namespace. If it's the latter, then we need to tag it as a
>> user-namespace / mount-ns.
> tlshd is a network layer service, so it doesn't make sense to bind
> it to a user or mount namespace, IMHO.

I agree with network namespace isolation.


Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6492264CA
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  5 May 2026 08:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777969958; cv=none; b=Fm3utxL+0S0mIWLpUTSz5T+fxzJaB+oTm2eQcQkA94DR0GXy1JloE42HsZ01dfbnwbYSiat7RQGEwJiPsdQNLTBZkz4j4043eQ/QuRj2QPRuAq6VVm3+s1EzE/u1BkqFFgWbXgtjVHSmrWiFBVVe0VpTWfeRkxH61R5Ao3Ezr/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777969958; c=relaxed/simple;
	bh=G1IAbDpD34zFs/zr3HeiJ5rHOg/8nMo4BlbsC8iXbrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksHsr/EIIbwuWsKt6d4PwifS2Nd4O67xBFQVFUXBWriHh8ZxPsVrh58zuHTs/88YPWlUPCZkdYn+WR1F2QrD+AMO9GPnEtp7rCJTt28tdXLaLKJ4xgjT9TEfEVb1OAGSB9/mh2IX8dGKgRNBmmQ09LZsmrFkxtcsQCtX9U4c4a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43fe62837baso2641344f8f.3
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 05 May 2026 01:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777969956; x=1778574756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1IAbDpD34zFs/zr3HeiJ5rHOg/8nMo4BlbsC8iXbrQ=;
        b=ojfu2oFSY2Y/fmLZxAf2ApWVfzbMiI5ydMeytq583XxNBqRbhij+mAsdgkPOfWhL2E
         FHvUNPWhVNxm9+3b9syqqWq+yumxXfPP7/flPXMOTUip2aciQnhNZ2TFZAxUXiWE78gt
         kyLDca8tPzoBOjC+Kzakz/9NbuENBKjSZsZYtZsKRolEUe9A4geQPzL6FBxDIyhDTLsL
         SnJ4+spf6YCsPyeXS64OUKMO0wBMpwnFilqBEmzd4moVVBdLwdT1E1PaiI632Y5LZwWY
         FFxuXsOF9pSbp2gXaILBRy16Z+a8lgJZECT722sMqzRdqpHntGNMBlJzOITnXOVpPCpj
         Cktg==
X-Forwarded-Encrypted: i=1; AFNElJ9iyt3i3WGxIoejWTnZAsocG1AFC1T2nVRCms2SCxonlgpoGwgqDIFjE8/DppB9PArzyWIN3UJy6VYWyP78/XxG8L8JAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHLxPqEvbgv/MBe/+ej79nDXOPNI777Hv/uRGvjk1n8RilY50v
	yK+sQpf917sHCI7KmgUwOZ8Hinocdjr9bddKxs4YmQyE8OJ+HvZ2ahUS
X-Gm-Gg: AeBDievxqkWsGCVLWUPikcoU479BXSbJ0Fxy++qL+es84ofl6GZvm/oaokn9Xilr6DR
	Y2kEN6DnoWNNGYRa7lSIodP3q3sSlBlAef2bd8RCNXaUJGBZWNvU93X95br2SnJzFv8Utelipn2
	LLLQe1fDOnUZACPyr5YE/BCL311pic+jOEmBwVYghq0A+/gyd0dKaVISGgaXfelzB0S4HpcxnGR
	AfioxdNpSObFcZ17KybaH1x3armfuu7dv6VQg+OfTd6qzR7Ok399/zTfccocUmAK4udFrIT5byu
	p/WO9+PDLDaRKFqsjpRYUYr/wqo0fOamTzsjaq5y0lnSojuZM7Ac2BiyJRrGU6dMuhir/bv0Unj
	/31OOnnuNegxOJCadx26Sp//5nyrmobU0T0Q6HIWEwRnJbW3nFMohzuoiYZPpXFpUScERiAHGcL
	nIOi8T2eyWUl11CPFotvtpUlycllgPNycK5tspO5KXAVcDJaMTIcml3VlZKskpQw/68p13P5a6G
	A==
X-Received: by 2002:a05:6000:228a:b0:43d:67f4:91aa with SMTP id ffacd0b85a97d-4500670ae2dmr3456562f8f.40.1777969955517;
        Tue, 05 May 2026 01:32:35 -0700 (PDT)
Received: from [10.50.5.21] (bzq-84-110-32-226.static-ip.bezeqint.net. [84.110.32.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4504f4857ffsm2802418f8f.0.2026.05.05.01.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 01:32:34 -0700 (PDT)
Message-ID: <f4c22c54-f760-4b60-9acb-dbeb32071285@grimberg.me>
Date: Tue, 5 May 2026 11:32:33 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Breakage in ktls-utils with nfs keyring?
To: Chuck Lever <cel@kernel.org>, Scott Mayhew <smayhew@redhat.com>
Cc: Chuck Lever <chuck.lever@oracle.com>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 kernel-tls-handshake@lists.linux.dev
References: <fd4aaf4e-b1b7-4ca2-bc93-955c31fab317@grimberg.me>
 <92a53963-1e4b-42eb-af81-6be9f63f9e43@app.fastmail.com>
 <afUKzeUYPhb97DX4@aion>
 <7c6516be-adb9-4d0d-ba7c-fa107fd4a865@app.fastmail.com>
 <e55cd958-6d86-4c6b-abc6-5be83fc53b0b@grimberg.me>
 <98a865cb-94e3-4f57-8b9e-0634c43098b9@app.fastmail.com>
 <2330c9c6-de7e-4cac-b991-3ffcfdc23858@grimberg.me>
 <ce60fc54-5082-44a4-99ae-dccbbb25eb88@app.fastmail.com>
 <4797a5a7-ac88-48a5-8707-b9e33a899da6@app.fastmail.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <4797a5a7-ac88-48a5-8707-b9e33a899da6@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/05/2026 11:15, Chuck Lever wrote:
> On Mon, May 4, 2026, at 8:44 AM, Chuck Lever wrote:
>> What you are asking for, then, is a 1.3.0 dot release for this fix. I
>> still don't feel there is a strong requirement for that, given that
>> distributions apply fixes to packages all the time. But I haven't made
>> a final call on that.
> After auditing the commit history between ktls-utils-1.3.0 and 1.4.0,
> there are enough fixes to bundle together and release a 1.3.1 that
> includes the fix for the keyring-based NFS mount failure. I've created
> a branch ktls-utils-1.3-fixes that can be tagged and released once the
> keyring fix is merged into main.

Thanks Chuck.

Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA15EC4
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 19:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749409725; cv=none; b=iUVgmHgGPSOzmEknmPRQOvcYFg/tPPfU2RFrxPJjlDIGXMCOeO/MoNBuL5ZIWKW03orA9gcqPN1/J+rUa4NrcXXSQQXu+u6jdX2Vdr0HRqblO0eTjqrwFwLLzT16ENyf8ibVYD2tHu4CTLBet6vfSzO7jUhYvO+4gM+ov0qeYkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749409725; c=relaxed/simple;
	bh=J205wN3fGwtrqfiidxsrWURlOQ21iDp0tEMp/peK1IA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aNVOVIbSWEMaKBXMJrCEHhVCMVHOglLbHEh4AWmDbZDfWld+mozIM/kVEipqQvQEOySmIB2IkRpFGLSqX3ynHHUgjVjhqdSsFM0HsfUCGuGrakE1TOfxyO1sL6rI0ZzV6f5IGc3IR/sX5hUoT+abQcO4sXZOe7t1Y373KzePwcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgyYK0xQ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgyYK0xQ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a54700a46eso294270f8f.1
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 08 Jun 2025 12:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749409721; x=1750014521; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fRCqFHerWCDilZDsm74sfB4TDzj9GUBxIpmOdqcPK78=;
        b=fgyYK0xQ6JXl0J8Swl0Vw/xjtbdbHprEBm3K91NsS5Rocwi4Y7IgYUKk2BfDJhKKPO
         rb3nOEwLUUp/YwP5dl03oqBOHDW1sCgom4geJHXooultG2aZolvpSfP9yYgK9O99zjnN
         td1CjXfA3FlrEKn7bpXn2/uYIUPpyFEz4Anw/f3k1wQCcD98tdGjRFgiI1sv2e0xBchA
         t7JOTnRH6uKHI/1+er9COdv3zwkChY/Q9pLTye975+pQ68UfrK1uiB5bYyzJ9Bfo6kP8
         +CI2j9U/nMYR/ViH1Ups/mBBnshGwfFwRhPahY9sgm+bFdyPDr5DWz7alYmzSmZ4JnJj
         cWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749409721; x=1750014521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRCqFHerWCDilZDsm74sfB4TDzj9GUBxIpmOdqcPK78=;
        b=SgSLBeiuw9vUPBpIDhElMeR942M2/54hSIfavbLApHzA+06PJ52ilB2j0WGQAPdklQ
         fkk7FTyZZdyy5AZYKvEMgQXvu3yqhXa8KQw0XqjTDQpUT5yfs6oCWeIBGGfXOWnY04K0
         hfkFSmDXFszMG42+2NjY7PUctNJJac8J3N+mIpN6KAM/tBDkVOsEyAiE2fEmXe1k6wSF
         YfFWQUcs4YjyNg0ZPad8YK6nR9a8ptxUdW3XmyRnElpjVHADF/zFRNgp93CDyctzOwgR
         QufIoyRRF/TSDNG8oNM3AY286y5/o+NZatQ6ctiu0I9olXasyeTPUbgQ4WOnQMUdFZuz
         UiCg==
X-Forwarded-Encrypted: i=1; AJvYcCUm2HCHFYbDZPbSakty7UgsY8Lg3yo7mxWvIR+6JOXSl+CAmbb/MFOGQzLHs1fUHpJGaQLUAeSwX6ElCsxKgEFUuAGulA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDc0HtOUpSL1Z7fhV87yhTxf67TER+Do320p34dfZ12bClw5ZG
	EWFurUJPIoadWIyOiWqPAGuBAH0WPczZAPbCsSRSi1Wo5lqRmgzsgQETQ2PBsEqD
X-Gm-Gg: ASbGncssTQy+iWng/H+8PsytQgo5z17hnAXPK2myndOLnvEfwAukNzCGtCROIPhvPHf
	Ze5Ifqw+ok7/66K0kGic+g+pTaFrWOoMrmecOIbAtLB7qQZzJNNL4tHHdzHYSOel8bD04s3B4S9
	jLJg6q3c7iY8IuHAFGZaHB9Nil27G0z7b9VYZITd963jrG2fr96dx8NSvUQz8eb1ghyFcIRXBCZ
	6loOYBHFy9ClVPU0S7i4FpI1+KNfSearjQPrWqSmS3tlx6WC3NN10gQs0jz3YJ88XZqBRPTD22i
	49NfFy7QLNPXStNSuq/EgiGfLNW8NSQbnsF9dbUuqygxt9ixmI3Zz/aob9Zidei0kmcnU9y52io
	ZWBW0qwoYuL8Cwzl4F6A=
X-Google-Smtp-Source: AGHT+IE43Iw8Yc44CF0RqZf+HZ2cBnaJiVU2jZjkoh78wAOy4nhja+UiKexWBF2x5//4qxelc3NjPA==
X-Received: by 2002:a05:6000:1ac9:b0:3a5:1c0f:146d with SMTP id ffacd0b85a97d-3a531cb9bd8mr8378375f8f.33.1749409720910;
        Sun, 08 Jun 2025 12:08:40 -0700 (PDT)
Received: from [192.168.1.227] (40.135.90.146.dyn.plus.net. [146.90.135.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244fceasm7639301f8f.82.2025.06.08.12.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 12:08:40 -0700 (PDT)
Message-ID: <004e428f-0f19-4afa-b286-c62ff3492a71@gmail.com>
Date: Sun, 8 Jun 2025 20:08:40 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tlshd_handshake_parms: Dispense with unnecessary
 dynamic storage for peerids.
To: Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <28cbbced-681c-420e-9015-bb8b6dda3b39@gmail.com>
 <9f57e091-8e21-4ab3-981d-962a3d738e10@oracle.com>
Content-Language: en-GB
From: Ken Milmore <ken.milmore@gmail.com>
In-Reply-To: <9f57e091-8e21-4ab3-981d-962a3d738e10@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08/06/2025 19:03, Chuck Lever wrote:
> On 6/8/25 1:42 PM, Ken Milmore wrote:
> 
> Needs a patch description. Why is this change necessary?
> 

I find the varied allocation policies used for members of tlshd_handshake_parms a bit sloppy:

- Some of the members are pointers to static singleton buffers outside the struct (peername, peeraddr).
- Then we have remote_peerid, which is an in-struct array of of key_serial_t, size 10.
- Then we have peerids, which is a dynamically-allocated array of key_serial_t, maximum runtime length 1!

This inconsistency has no obvious rationale, is very confusing to newcomers (me!) and is a banana skin for anyone 
attempting to audit the code. This seemed like a bit of low-hanging fruit to tidy up.


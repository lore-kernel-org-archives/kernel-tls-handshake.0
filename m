Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA154428
	for <kernel-tls-handshake@lists.linux.dev>; Sat,  3 Feb 2024 01:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706924760; cv=none; b=JCySTbpt5vJ0UvAOgA7XBprJagH2mZ/4aw6emYXD4EX442SI72lvkZClrCYTwU38i3mmt7iMt1eNhruTsm6UzZOAG3UqDYTHSy55vOOwTGDUMXEvS0c7RhVV1/alHpOizb0Md87SaLrLXewJd9PtrDAvAAdySiZ7qA8lGJTdnB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706924760; c=relaxed/simple;
	bh=TJHp6TZszgsibL6GHrhpsYc2ipXdX88wIUMSvIltD8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXJklnsMFcLCe4+CMowPaXCt4clf1vxuOqOsK4GCSigSA80QOoeUkg2kbqmH2/XvQfp4TgUjXUbptyZWndtRbHGaHAfE2JVTBsKwejiRYxUaiTr+QFAo2kfBYZ8sWJy3ZSCW06yLOgnvKOonrQTHryz6iLbJe/OWb3Ajdqlv0Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MytmC/NA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MytmC/NA"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d751bc0c15so23412445ad.2
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 02 Feb 2024 17:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706924757; x=1707529557; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YAcRE8TWaJ7VSDHKOOUjxiKpkKg1g2VSDS98lQik8io=;
        b=MytmC/NAonUZILMydyL+gCfT5S/vd3wMdqe28T0KkwJj/aB12Bm658FE5HO2006hWI
         ski+DgRIX/sjySW8vNIuFRsjaD5fr8A/zmrtGS+tWn1sirETMpTvZ5IzREF38rUR161H
         euGDyYxf/XE/MdmkiAQpk2OFBXiwvvQpuVksrGOz+G8Yo2epSdLUI5C/QR/xEL3EmGwc
         a0I0RMEMhEd0aPVR0vk7BUCVVw9SAGN/npd3M+FEW9JzjKgNsk3Y8qq4LYsSu4ebxuXh
         Yfkdw9FMRMFvf+AOzxkxiY4e79xYYc8Q3tJN0OnwWFCba5jxB5WK09NRCSyn0SIaUf/M
         JzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706924757; x=1707529557;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAcRE8TWaJ7VSDHKOOUjxiKpkKg1g2VSDS98lQik8io=;
        b=X0BVA/zchvMZVyuSNO1GUthjbUaPDifKHcK9SiYrqj1k5+rEj+/K+omClGa93bVo3H
         wOF77qAXDPqREtR3iqU3woktxZzeYrvgOlqZjikcGHo/WdROdNe/LmFR4otWhdNRYO/L
         YLKQv5yx8ZXiScbbf4NGb7XE97V48MFQVqphVF89ArGv+dENCimA7Z119m97soqbNJBo
         QCyIjbeymX4MsLpHOdBOXsfEhuWnWfW1ZGjkhHMJz1Bl2T8MUMtnWTO3WwoWnCvBXEt2
         dcflC9lVfuSweDET04cbyodW34+3ruhgljWqY/B2Wq7RKbVhPIxYGX/wnQ4PhdkMKglx
         BRrw==
X-Gm-Message-State: AOJu0YwxTjTDB2I8khnu126uzC4+xLNiYP5fTVi8CNtlU8aEDLuJP7N0
	4IoKmvAOIXq5J6d0a54mc47vAA1isGr3esChYMiJFeSDnzUce6Xp
X-Google-Smtp-Source: AGHT+IHpgXtaQ3u7939lkPuQzL+mk4dBYxCdNKcnshj9jEtR3hX14XBAQxDi/je1bDNwTVKcp4z60A==
X-Received: by 2002:a17:902:7d82:b0:1d9:167b:8e6c with SMTP id a2-20020a1709027d8200b001d9167b8e6cmr9348631plm.46.1706924756802;
        Fri, 02 Feb 2024 17:45:56 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV0N/XA6G5D+Ae2O7G+p14lCpxk/1BqKqv210vVW12gPAcMU2JPKGWNdNvt+4Q/hcADE6wtfNwewAn71J7T/KKdUGflOluq2DLCt8ALAAh0XcpTFnMhU8BVQ/1sH1NO/QQEyeIXMzJsVsycPdM=
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r7-20020a170902be0700b001d947e65ad8sm2220436pls.251.2024.02.02.17.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 17:45:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2ad1ff9f-bf42-4a36-855f-8ae62931dd84@roeck-us.net>
Date: Fri, 2 Feb 2024 17:45:55 -0800
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Persistent problem with handshake unit tests
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
Cc: Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org
References: <b22d1b62-a6b1-4dd6-9ccb-827442846f3c@roeck-us.net>
 <20240202112248.7df97993@kernel.org>
 <f76d66dd-5920-4bf1-95f5-dd64f19826d4@roeck-us.net>
 <39a8176f-7c22-41ac-a027-dac10e349c51@roeck-us.net>
 <20240202164705.6813edf2@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240202164705.6813edf2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/2/24 16:47, Jakub Kicinski wrote:
> On Fri, 2 Feb 2024 12:51:07 -0800 Guenter Roeck wrote:
>>> I have CONFIG_NET_HANDSHAKE_KUNIT_TEST=y enabled in my configuration.
>>> The tests run during boot, so no additional work is needed. I don't run all
>>> tests because many take too long to execute in qemu.
> 
> I was wondering how do you discover the options. Periodically grep for
> new possible KUNIT options added to the kernel? Have some script that
> does it.
> 

"Periodically grep for > new possible KUNIT options added to the kernel"

Exactly, and see what happens if I enable them to determine if they run
fast and if they are stable enough to be enabled in a qemu test. I can not
enable tests automatically because some just take too long to run, as in

# takes too long
# enable_config "${fragment}" CONFIG_TEST_RHASHTABLE

or

# takes too long
# enable_config "${fragment}" CONFIG_TORTURE_TEST CONFIG_LOCK_TORTURE_TEST CONFIG_RCU_TORTURE_TEST

Sometimes I have to disable tests because a long-running sub-option is added,
as in

# CONFIG_MEMCPY_KUNIT_TEST sometimes takes more than 45 seconds.
# CONFIG_MEMCPY_SLOW_KUNIT_TEST avoids this, but last time I checked
# this was not present in all affected kernel branches.
# enable_config "${fragment} CONFIG_MEMCPY_KUNIT_TEST

or because of problems such as

# RTC library unit tests hang in many qemu emulations
# enable_config "${fragment}" CONFIG_RTC_LIB_KUNIT_TEST

or

# clock unit tests seem to introduce noise warning tracebacks
# enable_config "${fragment}" CONFIG_CLK_GATE_KUNIT_TEST CONFIG_CLK_KUNIT_TEST

or

# Results in lots of "ASoC: Parent card not yet available" log messages
# enable_config "${fragment}" CONFIG_SND_SOC_TOPOLOGY_KUNIT_TEST SND_SOC_UTILS_KUNIT_TEST

or

# CONFIG_WW_MUTEX_SELFTEST interferes with CONFIG_PREEMPT=y
# enable_config "${fragment}" CONFIG_WW_MUTEX_SELFTEST

or

# generates warning backtraces on purpose
# enable_config "${fragment}" CONFIG_OF_UNITTEST

Thanks,
Guenter

>> Follow-up: If this test isn't supposed to run during boot, please
>> let me know and I'll drop it.
> 
> FWIW I don't see why, but Chuck is the best person to comment.


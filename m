Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73283221546
	for <kernel-tls-handshake@lists.linux.dev>; Sun, 30 Nov 2025 22:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764541321; cv=none; b=sfpk15ZciK4wEKZTSus4JK0H4BMAoUBzuxB6/MMFpe5SQOTMCdttgsebf71BK2WdnzE6V99VhDS+phf+xFWVgsBXDwF5irRvjxOHKrkndHwrccYJxy8l2dhpKXSATdLj+JuzBkDEqJZjDo/VRwMAyXTjVsRbU6/voc0GJbnIsbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764541321; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tg6/qBEcMhsUpNFUpELkYd0x2H720wCu3IV+TPmuPrebvbcfbUJgHc4gRIp/nmjrv9dvOrSOyGTDuXilA6Oxp0lz1T9agYmsFBQqp8I4xbbAfM1bmFWZmISCM+AUxZ0dnbf3zOpav5bX7O++m+swOOEOnQYwXhwbKkHZ5OmCm5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so21782845e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 30 Nov 2025 14:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764541318; x=1765146118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=tXgmI7Zn7/NNpr7rG8aVp1IPXxlgQ4diTjQrGao6U5AJbOyjQO9lt+C2/vsZpBdMtd
         aWiDyVSlH5QXVdju1xO+8n/lNpvy/OOthSn6i1xUEMcIF2Bm0wdSHP3KN2Pe3lEvcPHZ
         FJeaiD1Nm7FOXMZgEN/MbjqmHl5jIO1he3adQOj7UNH9dtNnGsfSFj65MBbv4tEATIZM
         CfeRLuk1ZbDDMmo/qvS+tk4soQgRE2VIgjSyQYFdAzlEvtlJDcONKegRJagV8tznUgWg
         OUc80Bno+CYCfCS0BnbTZNpiliVUlZKcZ8HApWZNaCrsmIb1Og1FnO7bPrb3XbIh2Lbn
         7pUw==
X-Forwarded-Encrypted: i=1; AJvYcCVzhwHennUt/J+34P6+XgQyWXSJbnCf1TG8bGLtf7W1XcJf3Od2kXL1anqSujnpLrwnsiTB42x+NTZ2FEra0qRrUvyy2g==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpap7CBeAA2c8cqodtqpnhLrbzV1h9rmkpCiVstpQDj0AFxgBt
	uAUTA+DP8uDsUX668yEt4O6GtTDZZnztPwsQzq6dOrVi+wSCQXAJvUZ6
X-Gm-Gg: ASbGncvQNnQRTEA9p9o4yWKsMz3Wz87RnF70GA10o0K3QK5VerOp62x7QzrCSzMzGPT
	pFjJFspCGF66j+NLmMVGo7eCCSzF4ZwMsz7LNjPLpQe4hdt3ejwZb9mMd6f/H74e9nADJaU5oPQ
	PKN1Khvo56nvaNB0xpq12MQWOw/1SDOcIhA8S1G+oH9zFehhm7d97dWitGRuU1UDHtDEFcBzetX
	X7JXgxevps+KzKjSEFc9gaJU8bR83+daswgn1YWFuaUsVwAUJfGV4iRnPg+3f3u6qoNAcuYWPAw
	iAXu3iUwvy3T1p9hBTTWtL7ur3HCFWHtw44anECfsZUGdE3bsuIGL1qPSQk/dqy8EfTV4u1+lBq
	EObeqUtxMAyox+r0Qr5lr6MyZYbNs9sDY33MV9b/IZUI+V6w523qd9bsbHdWGgF5AHqrHyut93d
	8EgHnj0ZRWukydv3OMkBUSJ6AuLRFZMPUe1TloQlQf
X-Google-Smtp-Source: AGHT+IEaDq7D6ajMDVwbhmEysEzsY+1ogXGwoywM0VuEEVuoRMtFYjkQRVWQHiyxGuNw2ezMfnKldQ==
X-Received: by 2002:a05:600c:1c1b:b0:471:14b1:da13 with SMTP id 5b1f17b1804b1-47904aebebdmr256111855e9.14.1764541317764;
        Sun, 30 Nov 2025 14:21:57 -0800 (PST)
Received: from [10.100.102.74] (89-138-71-2.bb.netvision.net.il. [89.138.71.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790530f0a4sm142367985e9.8.2025.11.30.14.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Nov 2025 14:21:57 -0800 (PST)
Message-ID: <93c631e9-a07e-4293-a59e-81be85270687@grimberg.me>
Date: Mon, 1 Dec 2025 00:21:55 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] net/handshake: Store the key serial number on
 completion
To: alistair23@gmail.com, chuck.lever@oracle.com, hare@kernel.org,
 kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, kch@nvidia.com,
 hare@suse.de, Alistair Francis <alistair.francis@wdc.com>
References: <20251112042720.3695972-1-alistair.francis@wdc.com>
 <20251112042720.3695972-2-alistair.francis@wdc.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20251112042720.3695972-2-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B83F748D
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  7 May 2025 15:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632158; cv=none; b=YnefByUKJuLoFuYHecwtldVTgibauEvLfaMXt/f11pDkq19rPfxVKDxh4my5GlytcQmSOcMeGG4jSp16lZQm6lvWdIUuF9DfFBORlNBK6aCC29rTelE7f34wYLVL5sbm2hEl5sPta13DIfi8V0dv3uyKsWW2oMUYqcfi2910Mdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632158; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EevHRyCUEW8jAtaiZv92v3xYyP/fPfMhG2G2LK7Z/zoAoP5vuVFxpCAkRH+NC5hh0mjQqr0SL6PIIiMKhajwxRH5YDegWXZTHzdgloypBtDN3ig6kjzXk93WX7KWlqJqUTvCLY+V3wD9zl/QWGC+xVQ/m/2mzYVeyruBqAW0JnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso3752f8f.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 07 May 2025 08:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632155; x=1747236955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=Mz5CEKG+6WreqIEobex2h3ZFScXpHcHDjrA6EecOf1vvHN3NrLkkRiKh7ah4lPcmGy
         SqqQPaLXkScdSNzMGi/d7FwVLIsr4MBe0y/u5K07zxcKJY++Ds4+Y8kVwizDdBGsCTjI
         nDCkSUE4K0LrtI8gkQTQcF3v0J4dGHUIeEGhxLVFiJqNi18LsfZht3hrDKOQrqhzwQN1
         PMCx2z0GXUk5iLRJk4Ur+PKcPRMyEFdwU8DGq49ci3aoLsAds3rsbxy1EVbIMPxg0l82
         zm+IoSENKKDa6AIMA9kXF57ZafV2+/6pbLtfZJgiqtTr2KX2QHnU4Rvm//fx1LBvE7HO
         95BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVdvVrDx4KySYQJ+z7hNpOQ+efiGS4mtdo10yWohNVqPrM9dEfCBENmYJNkImvij8fZwnzUPHU2j6D7WsicrxOkySV6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQeXdaM5yJwSi9aq4ErHhBDWWL24cySJe0zEn6B2DYSbTMiHGY
	mSCa1RWKN5NJXuIVz0GVDXDyqMCSOA0sd8YQ0O4UT8X2EVTJKC/O
X-Gm-Gg: ASbGncvqdtychn6NI6i5A1csXJXr8saTbItCQh1dGRjO5EZ14Hd8uVuX9de20h+IRam
	B49W9ewefXjUnyU0OqcGMdyGCEDaAOBPDxDHS1fttVxvLm8T4u6YFxvXXr9B3HHw+HGbNO+rHew
	2djmGoVr5Kakr06j87DzcBuCHBSwLyXqCLCTL8n27kI1UI6EQl8JPxASiYn4GRm+u1K2nX/Ir+B
	GxhW8SWG1zIEhLUB9ZPIdF09Vb4yxolvREKRMoHFnwnZpNxSeTQ0iGiU5nD4LkqmfmY+rg3k6rX
	c+bqJIzRmIqQmMdtisiLnABCaTe/uOybIQymr8J1e8opU/JOE/aallMsJ5E3odF7NIljqtfMPUH
	dDAP19w==
X-Google-Smtp-Source: AGHT+IGiOr4SxpX8KWlJR572ZILxJmet+uuIdlr8DZlTDzT4zYf2DpLQoH8ENn6oAIzBxFPpjVQjIQ==
X-Received: by 2002:a5d:47c8:0:b0:3a0:b294:ccc8 with SMTP id ffacd0b85a97d-3a0b4a21b0bmr3032175f8f.59.1746632154419;
        Wed, 07 May 2025 08:35:54 -0700 (PDT)
Received: from [10.50.5.11] (bzq-84-110-32-226.static-ip.bezeqint.net. [84.110.32.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd350f56sm4539555e9.21.2025.05.07.08.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 08:35:54 -0700 (PDT)
Message-ID: <5c9a5e51-8149-4506-9db4-337c641b23f8@grimberg.me>
Date: Wed, 7 May 2025 18:35:52 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net/handshake: Add new parameter
 'HANDSHAKE_A_ACCEPT_KEYRING'
To: hare@kernel.org, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 linux-nvme@lists.infradead.org, kernel-tls-handshake@lists.linux.dev
References: <20250507094049.26181-1-hare@kernel.org>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250507094049.26181-1-hare@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

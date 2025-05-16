Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22B522259B
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 16 May 2025 11:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747396043; cv=none; b=j5J6HP5BXgTD8L0Ziia3UbLz3DgswBDkGo+piKoZegvJda2CqFlDnWH0lhdvpmM4QGJXa1QnN0AHs/HQxLRRKPhyEnUYjbsAVLFoRzc8EJ2vMUzOOUOlthy78YnWO5gZTyzuSyC52Hrbh/o/IZYniJ8inZVisddnaZobBtCrp1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747396043; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dPurAAuIUrEMWCEuMBx09ZUJLpAzrSfJWDH2L/EYDwcQ4ZnOlaSPC2xsf9Qm3nPKdYeku8XbsvTB4uzGeYycIMPCONDpv2mI6gmAqoCPBIuwEvfoXachc6OVvAx8oIa0YnXFFdxLs53U5mmaYoGzfCpal/xPzW/F9dUAkLnXGcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442fda876a6so6882785e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 16 May 2025 04:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747396040; x=1748000840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=l4LFnYGSLXgEfEu66o8gl3mRVr1xmFmRiNNbErNETc2ljvssqMfUD3LTusYLEmwv4p
         2e2j14bqydGPOIBxMHztocF1ShKGlnngrkFISoq53rEUOWtt0lU6mQqhhgCt9JrmlEZi
         ivgkNaIlAWHsadXNGcrE6ZaElOIuoIcOmz/3U6zH9IDF63kRXH7+kHcUDyL+jM1Tfw7s
         eHuTQpGeUlc1FN3aqu06CKhgPcNyxNQWwhIT79ZA6Cg6FL13OU7alym0nRduvYkEGTBw
         3kqNcuqLNYOkm0rvfqpcs3HWFl1J2xuobPK1vxX6hZI3YCkaUKa6QWsqukfsocFlLy5M
         S/1w==
X-Forwarded-Encrypted: i=1; AJvYcCVN+7BdsoS/pDIjkHlqKvWxOC1t1Knii8V5Gc8M6Woc7NKMm7tlz6NdAV+DpGyIvugf8Ls6jy6W5kyRzBrDKxcnMemYnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdxdIbsfLL/KYaotbh8SNSKI+cOgV1j8bRYJEE90rKl/unWyoP
	9S2tARY1UPmEyA8KIPyPnCUYqhuy8t/5PM4T5SZzH+3QLXnQsIRKAirm
X-Gm-Gg: ASbGncvoVnJBmcbt/FfUDhOYekpqWwzSzBnIpet9Yo5qiXz+MGuM6nSn/b348x3vSeW
	6wSdCecdy2vSEpD+0p1gIkgNifWHhykJ3elc8c5LlTqylMIVD6Gys5w/GGIMQgfZDb2lxk/kBNr
	YlMZEjtnNecZztXF8uwnB+vOXNP3BdeMjH0TeMaBQv2aNvivjaUKYdXL7mvFClgchLpfdvZqVWo
	pucoWOrQMNNWucTk8LMB1diF2wOB3ae9swW+xl+uxNtcjZu3kRE1jbcHhcCo/LqlHRM+FxUoXbq
	LQr8Lgu9AJ6d3FYo530sNFeAv1ozdjGpnWg6/Sw134SpD6+hb42Vl4j0O+8OagT4Vj40jTPqfIa
	w9EACwxkD
X-Google-Smtp-Source: AGHT+IHg2tHHiKueKs6xvAo7xLj09H6Qy+ABxe4CoeV7u4nYMJWg0MKaXFmFUVLriDrlyx5PEMiYUA==
X-Received: by 2002:a05:6000:188d:b0:3a0:b294:cceb with SMTP id ffacd0b85a97d-3a35c84f659mr2970619f8f.54.1747396040098;
        Fri, 16 May 2025 04:47:20 -0700 (PDT)
Received: from [10.100.102.74] (89-138-68-29.bb.netvision.net.il. [89.138.68.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d263sm2593376f8f.3.2025.05.16.04.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 04:47:19 -0700 (PDT)
Message-ID: <c2044daa-c68e-43bf-8c28-6ce5f5a5c129@grimberg.me>
Date: Fri, 16 May 2025 14:47:18 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] nfs: create a kernel keyring
To: Christoph Hellwig <hch@lst.de>, Chuck Lever <chuck.lever@oracle.com>,
 Trond Myklebust <trondmy@kernel.org>
Cc: Anna Schumaker <anna@kernel.org>, David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-nfs@vger.kernel.org,
 kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>,
 keyrings@vger.kernel.org
References: <20250515115107.33052-1-hch@lst.de>
 <20250515115107.33052-3-hch@lst.de>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250515115107.33052-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

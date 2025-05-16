Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC1A23182A
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 16 May 2025 11:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747396032; cv=none; b=kuSsvpiUuj0zny6k2NnD8ivpYfsC85pKKi/6rJsEm/tfjFQTZub7xff4Wm6+s67YcSWuVsXC+cRvdJ52SMHy0OaG9oE8n1pweof+JS5lsmk66OEvx0GI6EOnc2BiRtEddKIhWS997oeHwZ+wyfQMBZs1QjL/VkJUr5IYneobPwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747396032; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lXEnxneAbYJE/hvr7ppKKl8wv6NAfej72/uo0VDGTFYKN62WQgAKetOOGPu4iMwa3t9R4R03RgOFzyk+acSviFjhjnfINf8HluQe08ePb6mnpGJUK+8rRcz61MTbC3B9ZD0fYXVS805NVosOyOErfCV8+55Y5IIv2aOuwvxFzG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a0ac853894so1586354f8f.3
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 16 May 2025 04:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747396029; x=1748000829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=kw7+r8owLM7t0cxrdzZhOZ818UAxraE0B/cKJu1aO87YzN6W0sx0OqE3D6Bs2WhXLu
         w2+APBIsPFQhQWurrXY0Qd22lsC1VPahNkCOxYEuQgU+GZYIY1CxSKfEsE0j+bG80Noc
         8KcaTFFVnZ4rTUPsLZQZ/B8iI5S+TQKuSG/fakAITmG6bNYaBBc1meTW3Z94/zZgeuOj
         DU1SUoRK1kcJJ9oUBMbiYAGhRilHqGsdF+BFy6JySUXv669JOOlemcH9JrEUpUjiSe35
         8kCYtk9XU1iAAM5noRyFb7f9DOaHikr6LGp6knwYKumqtrovNSaoAjRUqVBFrpZdbb/0
         13Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWCJn7W6xVzWoNYOlHZlx0jmfumHU9TvYWTNLycHS9guWHX71MQ8Cl1C8ttMUvawTX6NrJChILl5JATHyGLJB/s3JvfMA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoD/GpNRd5oYZIqU6Y5B7OwXdRCh6EWDtFk8MTp7F9yxOfIpO+
	SEz03Xzzs09kvoTePtHgitO5obs+EQ80hBWDtPB4WsfAnWtHyF1REvkC
X-Gm-Gg: ASbGnctjIAD7m5lV4Dviit7hEd5NeOELpeYMeElQQnUHITXT3BeGBXCw8XGm2aaDatd
	6x1gZ/ezAStseV2vC6sGjZTPlvhppO6wLzapxBKv6dL5E6GM5ycTNzZ2xd6fqO4SSRM9igfKS08
	5ormDhz7GCZ6ozE0H8pIYaLlmOspmEZsiRZhKrUD+4mcbT2yrG8E+cx5eeL3ww4HP35v3V/YV+v
	OMCTUXMg6Vir+q3D2nIVs7AfDwNNRpC0qVdRhedSBQrgELqDVAqpnyzt4twvEUyQc20GYfbLlUs
	h4UkbQwuq3kybzAKZm2R0IRC3fqKkORbY7EpiQ1OS4q5TPYvk67AxrcPVf2fw1GHNTY66gIVKXI
	Dyc++HaiT
X-Google-Smtp-Source: AGHT+IFr5TUeVMMUuFzng/gsAi732GGdSNi4MQXvc/J9k97Q+tXi1RLh0SzgjIJRvHMOeNnVFUtbXA==
X-Received: by 2002:a5d:64e8:0:b0:3a0:8383:ef19 with SMTP id ffacd0b85a97d-3a35c84f442mr3728733f8f.51.1747396028939;
        Fri, 16 May 2025 04:47:08 -0700 (PDT)
Received: from [10.100.102.74] (89-138-68-29.bb.netvision.net.il. [89.138.68.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a79asm2563189f8f.25.2025.05.16.04.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 04:47:08 -0700 (PDT)
Message-ID: <2c83a75a-31af-42ba-8d18-973800f9026d@grimberg.me>
Date: Fri, 16 May 2025 14:47:07 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] NFS: support the kernel keyring for TLS
To: Christoph Hellwig <hch@lst.de>, Chuck Lever <chuck.lever@oracle.com>,
 Trond Myklebust <trondmy@kernel.org>
Cc: Anna Schumaker <anna@kernel.org>, David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-nfs@vger.kernel.org,
 kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>,
 keyrings@vger.kernel.org
References: <20250515115107.33052-1-hch@lst.de>
 <20250515115107.33052-2-hch@lst.de>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250515115107.33052-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970A321D3F9
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  7 May 2025 14:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629325; cv=none; b=OMg018n/qej2oQDctlBjup+r0hxZuLiEGf195AxeDG4vU/8ugXWhZCiy7NMRCghDXvpPdiD4fqTk40RbhZ2EybYF0y9XJ+MBy22vVcWnNGMDavVjE0CqEkYOEv55VXRKJzh3O07+yFJNyjJEHyXbmepxFuMFNq6h6oVTsNeYz4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629325; c=relaxed/simple;
	bh=EAKMHUJqzlQgDrepx4CDqYCADzmC7w3H6FiJl08P0iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=shXaBoC9kTciK+YZOBAnRDsmR/mynNeeM8CgVCpywfW34hS7Avz6d/2dKPCCdwe8Zk8K03nTgzzLbCEoNF+lT0c68Vj3BnTMUh2PRiCaBjXkzZISRakOi9fOAHbRnsNMVxJQqc9szZvlR6s05c+RMrweSJ1j/0OQ+MmUtf+Oy/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-441ab63a415so70748105e9.3
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 07 May 2025 07:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746629321; x=1747234121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAKMHUJqzlQgDrepx4CDqYCADzmC7w3H6FiJl08P0iU=;
        b=HdgeIoZ8zioqJbOe1ljMUywnQ4VQOjY0rcmRVWaRxoT7h9Ipe/ny5QUy3OaXpPrhTg
         5PjIUMz9hqm8AISGsL+r5/8Qnf4bYeQZNNAu/hl4wgj19LS88ECDWOgtlG/MYn4ZrPXI
         FOpVGDs4WIjnJs1PMvC57PTevJd7+D/nzJy+Rhg9lzJUYc7Ql7s5b1bTB3R3atC0jIoN
         uy4tyBQFVojagzXOY0qboWe/Mw8FybW2kJ5H0aOkans2YZzcxTu1YFQ3YANjGLxNA7TL
         Lpu5tzhae0KzV150woAm0BsbCnoyWeIvMZuFOJ41rnO2rayTJLkTiD4LWGn8We8RASfe
         jXZg==
X-Forwarded-Encrypted: i=1; AJvYcCV5CN+d3CKOKCofoLKBvu6bALoXZi76wg0IR7QaspsSilGpmM3MI7vqk5KISen4aW9N2U2vBF27XRGNJMvgfa6fptaf8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9yeTphWwNe+n/x/vmkhaJV+uUdx4INFEzx4cxbnBGrqvfQ7jD
	JCdyh8+nuOST2Rv6r1sZ06TnNbkWBR3ynZSOErII+wWiz60603Vp
X-Gm-Gg: ASbGncuGTxkz7+vnZuVKNWJg5caUk2mYPuo1A4ktDC7YaYNsIRycHBNSApvxmDn1yqU
	3ZKyH7ezlDfg4tmQuQ9ZWajLoa/qaKIZM14Zt84gm2C+21MAMAINQabMfb2Z452/XBcHiefSyjn
	x3uQ6FCosKoiGJeCEiVUvbPhnjj1WTiB6IWim4lYI2nLsb1AmC/wB81fas+Lz0beAUfsGaOWr77
	YwasRX71+a1O3NtbAZDfBM5cyZN+aQ2vo9gBF2A6ZV8DxCF7gvgWW+U9Sco/8o3tLMRTYR2Z2BX
	/IY6jz/fpBiAmhGZdd0TCkTBOusrHc+Vi5mAgtcxedMe9yl1UMep1qH+3Qd3zkKRjAr8rseOhJv
	sVPl1yKgIWWQLqBAA
X-Google-Smtp-Source: AGHT+IF5BTozncU2f8ZOakRdmEUv5uIWg8hax2hMSrXQM17uMKwSEvjMx5Ip07y2lNB42HNCyDZFCQ==
X-Received: by 2002:a05:600c:37c6:b0:43c:f8fc:f6a6 with SMTP id 5b1f17b1804b1-441d44c321emr32242065e9.9.1746629320547;
        Wed, 07 May 2025 07:48:40 -0700 (PDT)
Received: from [10.50.5.11] (bzq-84-110-32-226.static-ip.bezeqint.net. [84.110.32.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b6d0e1ebsm1458450f8f.80.2025.05.07.07.48.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 07:48:40 -0700 (PDT)
Message-ID: <b56bc2a2-3357-4d50-b53b-e65866ba1e7b@grimberg.me>
Date: Wed, 7 May 2025 17:48:38 +0300
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
References: <20250507080944.3947782-1-hch@lst.de>
 <20250507080944.3947782-2-hch@lst.de>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250507080944.3947782-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Pretty straight-forward I think.

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

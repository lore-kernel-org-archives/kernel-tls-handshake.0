Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561A91E1C36
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 17 May 2025 09:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747475108; cv=none; b=NtTI4Lqi2wE5tE36IO1EyatbVrY6Gh4CpRR9PbBTGQt6/No63I5RoM6GOXnsJ1pc53KEcEgWR940ouGOsfJEBRp12R/nI/NLvakblPThyqyPsWv3W+OekoU7+UKbo/N9x0EudI/mjZYcwI9bcZ+P8VGlB/Xukg4p+eMEdxqQoyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747475108; c=relaxed/simple;
	bh=Wmr5ohTXPKdyo8kcG6Jmsfp9sjQdnBz8HB4WyVN+qxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aPTgwhh376jLlUJF86QjG+wAPcJAPzp1WL9g5dQ52ocKkEFMPdOblD4b4y7uNgQz/9EIAIPSi7eOLv81697xv9d+78gIscqMvbc7NCKKFLBvOo1WfJn2oCGJsEd4FsM7e92zVwOQjTAEw+15jJirmvu6utjmW+jlsKONA5dcrBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so29033395e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Sat, 17 May 2025 02:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747475104; x=1748079904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=59Ev6Sd7fd/e7l1k5vr2tNy3baDisKIlgFDy502JZ1c=;
        b=g48qumnoWAYW5O3GIG5FxxIe8us32zxkSPRPaBsFNG10YxvAEV+d5ooMjPStWfFe7f
         Fb5TabLmEENvisEtyOilT8UjFVrwu9VkoHzGUbYwJv+LGkpwiANMNwEHfrRSVjSithQ1
         rqyPm6xjXLRLpwzgbiJ8eUtAxDwTKWpkpVJuMlIvke+Ep/g2Argk4zLnyjq76kFLSfQK
         s2t/2ZguLaa6dumGBzPMk2WxISISyima1H5+ORyuj2gi3FowogdY90R+sUpbIiHI2yfv
         oL9UTe1Q/vKQkX5qYpSKWu1Rla1CCrcN7kMo3t0RJH/lW+Le+d6yGhqaK+a7fwwQjGNd
         1ylQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2VP6gcNUSikOnfAF0EAo8h9Hfhnse6GpHbwygfFrcIxg08uC1D60pGnFUMLOGskWbL8M3Q99czzgM6E2FHq+AfLOHHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOt1zwCRz034O6rZbibPBzBwAhS9LPAj7iUDjG5IJJH1Dl+kIh
	OejUEWw8P2/33nJUkAiH28s9DfVft17JOgL5qF1kXShod12TI+VlfqFe
X-Gm-Gg: ASbGncuGmxzI+4ls6hrPd+L9zW4n4+LBxDQCAEur60+iRKE0hGGhaCOOqWSzLB54LAi
	SsLW66Vlb4J3LhabLzb0kDWOW2Lt7qmURmF3FyhbzbmHI6NgcmpyN0FxEpk7tIwxWBGk2ipifdx
	z9mTW7bOihJsXafuwzgZ5K8MN1QD7PsEMzipZCM7fLPDdGm3XIEcpSKyl4PPLGRr2QrAO9i7U6v
	vzUuIyq7VVV9r/ybAu552LUarIEi+Cnb9udshzH3/11fC2LCpo+sOjyRuvrwKwMDFICrh1QKBe4
	2kWUtR6GgDyomTk+Rf2LvJIN5Lj07paofZe0h1g1D+y3RHmdwdjDhONtZfQsTVy7Njry/YmAt++
	R0CcCcWeS
X-Google-Smtp-Source: AGHT+IEPe+vH7uFlOf+TSGvbTNcnl43YmfmsDp9u6x+rtqvyh9yZj9hPQWU9IyvvhHf3yqZKQNucBQ==
X-Received: by 2002:a05:600c:4ec6:b0:442:e147:bea6 with SMTP id 5b1f17b1804b1-442fd950bd4mr64220845e9.11.1747475104304;
        Sat, 17 May 2025 02:45:04 -0700 (PDT)
Received: from [10.100.102.74] (89-138-68-29.bb.netvision.net.il. [89.138.68.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8cf66sm5565802f8f.87.2025.05.17.02.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 02:45:03 -0700 (PDT)
Message-ID: <692256f1-9179-4c19-ba17-39422c9bad69@grimberg.me>
Date: Sat, 17 May 2025 12:45:02 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] nfs: create a kernel keyring
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Chuck Lever <chuck.lever@oracle.com>,
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
 kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>,
 keyrings@vger.kernel.org
References: <20250515115107.33052-1-hch@lst.de>
 <20250515115107.33052-3-hch@lst.de>
 <c2044daa-c68e-43bf-8c28-6ce5f5a5c129@grimberg.me>
 <aCdv56ZcYEINRR0N@kernel.org>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <aCdv56ZcYEINRR0N@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/05/2025 20:03, Jarkko Sakkinen wrote:
> On Fri, May 16, 2025 at 02:47:18PM +0300, Sagi Grimberg wrote:
>> Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
> Based on?

Based on the same that nvme is doing. The only reason I see to have it
is to avoid having the user explicitly set perms on the key for tlshd to be
able to load it. nvme creates its own keyring that possessors can use, 
so makes
sense that nfs has this keyring as well.

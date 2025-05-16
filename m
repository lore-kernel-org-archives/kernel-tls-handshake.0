Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6462E19D8A2
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 16 May 2025 11:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747396018; cv=none; b=Ka0vuSANp2952xaDmmBv5Ct8O6vi7vEky4REbEsy2BolFh8Boh2/LaE+EepMxn2zKRvzb3lP3vlulgV5tB1v5a41UNWk0cJ+nxqrAWIiJx0X4e/XivrfQWjTpYaWzQjkqJ82fHTYYmzJLSbuwziYoYknvstZOPUas0wc2mlkYww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747396018; c=relaxed/simple;
	bh=P2MGul/iONu8XqlMpG0+0M3tANrl0DU+W8I8PXkQdhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iqz/GD11qMAp9tY9bHUFEUD+IK1tALvFLGOc3oG+ZuQKBulFy9ZF+HuMlDda/97GdHfR/LRoZtf0UEpNPCD5IWnCUD1WjmBeZmx1wQDerhCjjnhcahbulbAF+2YvRNNUgj1pnTzuejiQPHn8lJ8TLm65wMQIZ+XRNLI+35q74o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43edb40f357so15234625e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Fri, 16 May 2025 04:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747396015; x=1748000815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2MGul/iONu8XqlMpG0+0M3tANrl0DU+W8I8PXkQdhk=;
        b=qOztIxZLaicXq7eOaWC6g/ylr/ZLlXvCJxiqqIOFZu5ggUxeLfg4QeA6JNVO12OJ/e
         8WMjcTV9Dmo+FcWqzx3Ove068yFlXWkO6QAam9Wp4/6w/eDLPR8iBsknbxRo4dMMiHCY
         FoAl5w8xJgydiGSmJKpIDAQBGsJ9AxwgA4na2BjdnOD0FR5W0mZnjp1x7mD5gJRak+bh
         6xus51aNYiD2/01MFtU5NpNuPHBmCZUZLAocppxGBTGN8T6moDGeZxabmuVUkVz+QiFv
         l5cvpSRTJnpkQzDP7LG2LQKVeCTI7KbIUcd4BMLaQAoDYxPAqvw1djokDdOOZGLH0FwU
         cg2g==
X-Forwarded-Encrypted: i=1; AJvYcCUhbYyf9R+mL1fro5CQsPgXl4SuHmqGkfNUW+FVNUVkxx8IDZURIuvWrSGFJEpkipRZB7i0VasLw4dh/gy2zyojyhgCHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPvLFS6ro1NXpemQH2s23/aWh5HrlrvjX1RxFQwVW41bCEEwVv
	pOo4ry7bNl3hZlL0ptl5Uj2x6qvahFauuOl3sV2Lg8un0HiAmDKWI7wl
X-Gm-Gg: ASbGncuvHzfkoTiOyNNoYHmdRhfb+6k+fk0C6bvTOqMSvaaTW3G0YBKi++zOuPPtA3n
	wnSnUIeeFq/77bs9wSnfMF3+pwLxE/mwpwaVWsBC3fKq4B3mOqvRKzVza0ly8f2Zqz72QwumXxn
	+6D17bjuEtPLvgRXIOjaRxBdnjBa790QQ8hNJmjMoeHPT0LJhQ2WmkYssszUhxeFBVAFyus/b99
	IaTRGDc06uCN7uUV9q2S08vGCr+D9wyNjaHaf928ughCOqENDfbTVPGwnkbHnujmV8GYR2Yd0r9
	299DR2+3VDAuyAol8TfhoA88aidaKCh5PMANgK8/ABTOzb56kwuB47maFjX/aNtNSL/FR2SQiMK
	przeX1972UGAKN8vfQdw=
X-Google-Smtp-Source: AGHT+IH34fqER+F0gFms0Y7uwq6fzlTdeCwf77MrGQZyzyo8gUXRuxXFo6iB46ssNsnpb9tTo71Uuw==
X-Received: by 2002:a05:6000:402b:b0:3a0:b7ee:b1c3 with SMTP id ffacd0b85a97d-3a35c821fe2mr2924299f8f.6.1747396014536;
        Fri, 16 May 2025 04:46:54 -0700 (PDT)
Received: from [10.100.102.74] (89-138-68-29.bb.netvision.net.il. [89.138.68.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a361b04236sm1628786f8f.28.2025.05.16.04.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 04:46:54 -0700 (PDT)
Message-ID: <872403b5-c6b4-4c4b-bff5-8e60b22f8102@grimberg.me>
Date: Fri, 16 May 2025 14:46:52 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: support keyrings for NFS TLS mounts v2
To: Christoph Hellwig <hch@lst.de>, Chuck Lever <chuck.lever@oracle.com>
Cc: Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 linux-nfs@vger.kernel.org,
 kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>,
 keyrings@vger.kernel.org
References: <20250515115107.33052-1-hch@lst.de>
 <79477eac-ba92-4d2a-9905-f5250e7e95bc@oracle.com>
 <20250516051630.GA13495@lst.de>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250516051630.GA13495@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/05/2025 8:16, Christoph Hellwig wrote:
> On Thu, May 15, 2025 at 08:31:23AM -0400, Chuck Lever wrote:
>>> Note that for now the .nfs keyring still needs to be added to
>>> tlshd.conf, but that should go away with the handshake enhacement
>>> from Hannes.
>> Just curious: Is there a downside to shipping a default /etc/tlshd.conf
>> with the NVMe and NFS keyrings already added?
> That's probably a good idea for the current situation, but doesn't
> resolve solve the overall problem of having to add every new service
> there.

IIRC Hannes told me that latest tlshd already does this for .nvme keyring

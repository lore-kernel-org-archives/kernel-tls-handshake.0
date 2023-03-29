Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC96F2F30
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 15:37:38 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id s13so9189986wmr.4
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 08:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680104257;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oRJvBk1aRhWUXZpzrDEBepxU3iynjIqSJhsVPHzuxE=;
        b=7oJb9lOPReUTOx/ZBJqFemBapAZG1oWcKsE0/QzTnOplhgoDVAf8ybIu05t8JY/iYF
         3pHZ0HUbH7+o7Rc8VkZWEhb4SgbxJB7Y9K6PByiKv991+OYp6h9EZ7R0OFVomowjXGpu
         O4SQq7FZwXR9n8t85PSNERPSbarn5CbYuwifpbl+8QOC2pEVzkAy4Z/l0Kl2ROkgAgKA
         c8MYBvTPjrXlQEWn0XHdVeuazojaLbdpKNAt81BYt1eBl5GOXIcPE2c/rm2TkbUlRj/B
         Dx/YHH7frREvVc9VATpBEWaMJzE+A0ZddDK4DslfmbhELoiEeQsDmKryrBkejus2Ssna
         uAOA==
X-Gm-Message-State: AO0yUKVGDWfZmo+BiJlLESl/+kGfeBqChLCyl9GcVEZoT+R3qJzcv4If
	pp8diuVbsIREtaMR6HRZ8lk=
X-Google-Smtp-Source: AK7set9DJD5O37K3/4K5wCZSeXkekmic0BIeRAkHgwFejMT0MDC/1ZUnqIK9AJXT5CCQVsyw/1afcA==
X-Received: by 2002:a05:600c:1e86:b0:3ed:ebcb:e2c6 with SMTP id be6-20020a05600c1e8600b003edebcbe2c6mr16453850wmb.3.1680104257151;
        Wed, 29 Mar 2023 08:37:37 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id v26-20020a05600c215a00b003ed2433aa4asm2535844wml.41.2023.03.29.08.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 08:37:36 -0700 (PDT)
Message-ID: <d177a5d6-3f76-4eee-0cc5-2c6d995c2e8a@grimberg.me>
Date: Wed, 29 Mar 2023 18:37:35 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 05/18] net/tls: implement ->read_sock()
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev,
 Boris Pismenny <boris.pismenny@gmail.com>
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-6-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230329135938.46905-6-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Implement ->read_sock() function for use with nvme-tcp.

Nice.

> Signed-off-by: Hannes Reinecke <hare@suse.de>
> Cc: Boris Pismenny <boris.pismenny@gmail.com>

Would be great to see a tls_device implementation as well.

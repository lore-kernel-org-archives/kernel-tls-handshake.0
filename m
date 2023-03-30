Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2769A79C6
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Mar 2023 15:26:02 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so12039951wmq.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Mar 2023 08:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680189960; x=1682781960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++1bVXHus0v2bPaiJbFSkli9vKZrYftJzLm+Sb2cxQE=;
        b=q67zP1jtp36JpxWjoH+P51kJUZQJ2aeKu6knaiWlfw1/ChDs2t6wts+nLfB4S53bQI
         5U/sksqlTS41AHp2Tr2BejHG1HNa/Svar17g9N02T/wLfVjbZYO8VSciPH+qCkTtH7SW
         WUR4I9ijkD8DAXEbCcNRoH4vFGPs43b+E3w9/fYw+DfYltEoJdxPnznqiFAr59kh2Rue
         OttYSHGmd1+UDNc+pZ5cYwYKcsalEc2VRZkmqROk4BKk26NGOX3NjnbffK9snlxAJkJA
         /lomCgCeSX/oyjox1SYCt5HMJzFA8bibpXFyl2Mzosg70Cilq8arbxBttbrhUzfCHZll
         UHew==
X-Gm-Message-State: AAQBX9f1ASLUXd3LURvj25RQeW6RccHmeeJsRaJQuBZES/jp6zVQqNA0
	RekcO1cAUP3OVjYNvdpNtx4=
X-Google-Smtp-Source: AKy350a1HaNmrAeHu/TeS3LbkF0eUcRyNpsCPETB0iXsfKhAK/V12FmL75Lp178zMPXXhbVay1Ef+A==
X-Received: by 2002:a05:600c:3503:b0:3ef:7795:e5b1 with SMTP id h3-20020a05600c350300b003ef7795e5b1mr8919746wmq.4.1680189960284;
        Thu, 30 Mar 2023 08:26:00 -0700 (PDT)
Received: from [10.100.102.14] (85.65.206.11.dynamic.barak-online.net. [85.65.206.11])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c4fc900b003ef6bc71cccsm6865399wmq.27.2023.03.30.08.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 08:26:00 -0700 (PDT)
Message-ID: <a50f13a0-6e15-0cd1-cb5f-ac522eb32e6f@grimberg.me>
Date: Thu, 30 Mar 2023 18:25:58 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 11/18] nvme-tcp: control message handling for recvmsg()
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-12-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230329135938.46905-12-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

This looks fine to me,

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F051FB1
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 08:19:01 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id m2so16087391wrh.6
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 01:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679473139; x=1682065139;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=7EjA8WTVhAZkhx5zMLZq0h5CvNyw6yc5JNQ5HZ2jibtMnY8TMvTPZHDPQKr6SPEoiF
         hYc8o9BMKZ/2hXg6qls8LO+EdOqGM2hKo/MZezeHw9D/6kQBITr0Ccw3yLTbEUci8TQ6
         aSJMSq1G+zD2XXyZJZEKfikxlNmB3C9LE+jFqfvcX1neEJEZCeqBJ02tUDr+y/A6C7Jc
         nc4uBaMDbEMEfmj06B29LYQ8jVyXkKv/TS8KxhoObYRJkr0xvStwWSCRxjtvi5r1bY7N
         tZzPlYyJn2SwouNDAo7iBaCmRPKzyPAjufWi7ideGCk1SwOOwzOgiyeMIT1rKp5cXQ6n
         kCQQ==
X-Gm-Message-State: AO0yUKW3vxjZVUyhRFtyDa46awNq8yP7Shq3YHb4KdEZmwTpdAS4zWSP
	FJN+uMDrMqp7rSY9S9CqZ0s=
X-Google-Smtp-Source: AK7set+zO2AVMCbFZMbULBnM+hjOZ8HOMXZ8ZSmBzgnfEDJHfxP6o4/TJQDaiDMieSbhaytlJwA5bg==
X-Received: by 2002:a5d:4586:0:b0:2cf:e5b8:2ca9 with SMTP id p6-20020a5d4586000000b002cfe5b82ca9mr3397228wrq.3.1679473139552;
        Wed, 22 Mar 2023 01:18:59 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id b15-20020adfe30f000000b002c706c754fesm13265082wrj.32.2023.03.22.01.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 01:18:59 -0700 (PDT)
Message-ID: <5469103c-cf73-a6b4-a704-d3160a8b8d8e@grimberg.me>
Date: Wed, 22 Mar 2023 10:18:57 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/18] nvme-tcp: add definitions for TLS cipher suites
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-5-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230321124325.77385-5-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

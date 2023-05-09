Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1047E1990C
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  9 May 2023 23:30:06 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-52888681eebso869704a12.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 09 May 2023 16:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683675006; x=1686267006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UBwxZuYSoI2fhFfKRrxW7a8dQIXn2cgowQwGSCf3sb8=;
        b=RaUIlXsQbNtr75rC/BtX0EdX3KtTHR92+IeXEekfTKTT1IJvnUiGV5wxOMCbfXL1Jz
         HgY0ZbiXq8hKhoPam5QzuRjtuz18VVy0mPxXt8iG5RtwAu2FZIA/aXj7Z1xMVufGuw2c
         3jm3mo6zi9vMHGLnIAYIaZ5c5IDYYkMrAejNsbpPraL6b2DjjHw9W3O03ZyPYaQ/lRvR
         fL8yottFbamoDC1scWIEl3tEAyRqpeewR2V3BcEMOhjptYbQn7b7Z+uWdiGB+NM74fRZ
         +WbsLH4VUmaPTIn9SOY3yGIFmuRFf5D3m3+wjB0mtlGnoSlqhyu86+EIynvMThhy9jOf
         eAeg==
X-Gm-Message-State: AC+VfDw+73FR0gGKfvoZFL/mvCIXpCwAHVSEnko1RFitcuk6g03cnW9/
	k1xCQ1pz9HVNNKv3zeOFo6s=
X-Google-Smtp-Source: ACHHUZ6+mnzV23jfk1tGvM0u/lT9LsaKTrVg6N+7Kf2iOg01VgpuqfwrpGKg2WZjHvuQS3mBMWHkkg==
X-Received: by 2002:a17:90a:194a:b0:246:fbef:790e with SMTP id 10-20020a17090a194a00b00246fbef790emr14575716pjh.3.1683675004945;
        Tue, 09 May 2023 16:30:04 -0700 (PDT)
Received: from ?IPV6:2001:4958:15a0:30:c6ee:a400:39c6:2a73? ([2001:4958:15a0:30:c6ee:a400:39c6:2a73])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090a638a00b002465ff5d829sm6453702pjj.13.2023.05.09.16.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 16:30:04 -0700 (PDT)
Message-ID: <da7135cf-c96e-f79f-9d49-87ee269871cf@grimberg.me>
Date: Tue, 9 May 2023 16:30:03 -0700
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 06/17] net/tls: implement ->read_sock()
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev,
 Boris Pismenny <boris.pismenny@gmail.com>, Jakub Kicinski <kuba@kernel.org>
References: <20230419065714.52076-1-hare@suse.de>
 <20230419065714.52076-7-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230419065714.52076-7-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Implement ->read_sock() function for use with nvme-tcp.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> Cc: Boris Pismenny <boris.pismenny@gmail.com>
> Cc: Jakub Kicinski <kuba@kernel.org>

Jakub,

Can we get an ack (or review) from you on this?

The only consumer of this is nvme, and seems to at least
work on the limited testing this series has seen.

We can take this piece from the nvme tree or not, whatever
you prefer.

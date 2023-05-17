Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1834011184
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 17 May 2023 09:36:07 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3079b59230eso38724f8f.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 17 May 2023 02:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684316166; x=1686908166;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=urglFtLe5OfH8uHGc0CuJYPv61AT6Sa7CBlPp/2sj1M=;
        b=llaXKNdKS1/ffcvOeEAe2C1Ss7ztXJacFpAW0VU+fSCVJXK6sQfs5w8DiEk1Tp3aHn
         EpZ06GTGMxgOv/1CdLxjGspjY8SpUMA/YZLx9NsGeYoyM+TKseJ+6mWpLyraW1xo2uOX
         FXtINaIQX9fy1Bu+AawjOlQtWohraB9rL0yw9pYclKKQVHXTDPG+0Bgd3v46o5ZDh/CT
         GvI8ETy+4XG4dTpHi8QQztuspRcxgLqMcSfVl94J5JXigeBcRPXh21cLftvxwayRBUL9
         TQsa+VqFZrIIUQMsSbbzPLZVXMi96+6v5C8eRsKP9B2nIW70TtHh+0oM88K1peZjY/dx
         PrlA==
X-Gm-Message-State: AC+VfDxAa0sOHbXooyCsEpm6tkCAfF68nrBOxIyqtJOr1cC5F0OD0fQS
	WNN9drSVxMCdIzSl/KtMTQw=
X-Google-Smtp-Source: ACHHUZ6Tz7t6ZiitYv5qDlOTnkdZKR2btl4wh4kcoAZgwhBaKa7+q3p1tZRO6BPRL8LUnudcUTmJUQ==
X-Received: by 2002:adf:eb4a:0:b0:306:2720:b00d with SMTP id u10-20020adfeb4a000000b003062720b00dmr1321474wrn.7.1684316165973;
        Wed, 17 May 2023 02:36:05 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id d18-20020a5d5392000000b002feea065cc9sm2120975wrv.111.2023.05.17.02.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 02:36:05 -0700 (PDT)
Message-ID: <70f0e567-95f1-4c88-a4ca-3357524a5c6a@grimberg.me>
Date: Wed, 17 May 2023 12:36:04 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 06/17] net/tls: implement ->read_sock()
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Jakub Kicinski <kuba@kernel.org>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev,
 Boris Pismenny <boris.pismenny@gmail.com>,
 David Howells <dhowells@redhat.com>
References: <20230419065714.52076-1-hare@suse.de>
 <20230419065714.52076-7-hare@suse.de>
 <da7135cf-c96e-f79f-9d49-87ee269871cf@grimberg.me>
 <20230509174724.4a198306@kernel.org>
 <0097e7c0-351a-b922-dd77-ab414b53170b@grimberg.me>
 <c711fc3b-08c4-6673-0f22-f73bf377a072@suse.de>
 <20230517075444.GA30685@lst.de>
 <4d1f5afe-628c-ee5b-c6b9-59d59c184f42@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <4d1f5afe-628c-ee5b-c6b9-59d59c184f42@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


> On 5/17/23 09:54, Christoph Hellwig wrote:
>> On Wed, May 17, 2023 at 09:53:10AM +0200, Hannes Reinecke wrote:
>>> Problem is the MSG_SPLIC patchset from David Howells; that 
>>> essentially does
>>> away with ->sendpage().
>>> So I'm not sure how to go from here; wait for the patchset to land, and
>>> rebase my patches on top of that, or proactively switch away from
>>> ->sendpage() and resubmit directly.
>>
>> I'd wait for it.  It should make life a lot simpler.
>>
> Same thought here.
> Let's see.

Did you test that you don't need to change anything with nvme-tcp
on top of the SPLICE_PAGES series from David?

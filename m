Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC9528FC
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 13:16:14 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so700562wms.1
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 06:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679490973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rC0zG0SvapUEBPxtVD1GPdKxIKQjvdqme1KCiz1Z1EM=;
        b=SS7qS0j3MD6oqN9W46xeZUwR9AOAIwHsZgZXkqghVmCoE2NHMnZEYHWhS6U+gdwdrS
         TFAQTaBv0e0LFbAKk2VXHrhzFsH9FMhCkVUH1rQ+u0i9HhVdcctQmVz8D92xNQWLdEcc
         UEYEbB0onPSuzYrxuhW4uobGZZY/Tn/4tNwJ0yBPxozGtku7/2uW8GARCk9rMNJwz4jZ
         fzw2CrUX7r6HNhf3ZFzf37eV/O4SGS27rQEDL/23hF7hDYylhJV6sXO+POBmvEupzseT
         pCEsKy+i6BgpChK3V3emqoo3le7pAyFqtKv9l3BMDTwgu0AEtBJoSRUTA/L2D6V0THsR
         AKhg==
X-Gm-Message-State: AO0yUKW2qbVRHxrEIZfougCNaGY8UU8if8nmq034d+Hl6lZcNcfJuXlw
	msUczMBZV/CUTs7/DjVhsa8=
X-Google-Smtp-Source: AK7set+CpPWzKU7kUJo9nlEKZYxHxWSSGqrbg4gwFWfSP6DmVprzSIknku66aprgww/Yt7zEOatIsw==
X-Received: by 2002:a05:600c:4ec7:b0:3ed:d119:df36 with SMTP id g7-20020a05600c4ec700b003edd119df36mr6522869wmq.0.1679490972555;
        Wed, 22 Mar 2023 06:16:12 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id y6-20020a05600c364600b003ed2c0a0f37sm16757490wmq.35.2023.03.22.06.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 06:16:12 -0700 (PDT)
Message-ID: <8a2515d4-c8cc-a70a-2b37-ec5260ea22ac@grimberg.me>
Date: Wed, 22 Mar 2023 15:16:10 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 08/18] nvme-tcp: enable TLS handshake upcall
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-9-hare@suse.de>
 <92bd0f9f-8df1-b1ef-dc8b-99ae3b1e0300@grimberg.me>
 <cc5a73b9-7457-9f72-1b2f-750443b33925@suse.de>
 <6d582f3e-24b9-0e27-40ad-fe2691ef26d0@grimberg.me>
 <3ba504a2-5756-8767-3cf4-6369d136fec9@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <3ba504a2-5756-8767-3cf4-6369d136fec9@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> I have a more general question.
>> What is the scenario that we will have for a given hostnqn and
>> subsysnqn more than one valid identity? Do we need to support it?
>>
> Well; there are SHA-256 and SHA-384 identities. We need to _support_ 
> both, but seeing that we're dealing with retained PSKs for now I would 
> assume that the admin ensures that both sides are able to support the
> chosen hash.

Yes, lets not over-complicate it.

> So the real choice is just between a 'retained' and a 'generated' PSK.
> And it is assumed that any 'retained' PSK should take priority for any 
> 'generated' PSK.
> So for 'retained' PSKs we can use userland to pass in the PSK
> (or, indeed, having the kernel select one as we really only have on 
> choice...)
> And for 'generated' PSKs they really come into play only if we don't 
> have 'retained' PSKs, and if secure concatenation is enabled.
> But even there you can (out of necessity) only generate a single PSK,
> so again there is no choice.
> 
> So in the light of all this I guess we can revert to only using a single 
> PSK.

This makes perfect sense to me.

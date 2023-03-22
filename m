Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C42C2566
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 11:50:29 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id h17so16710814wrt.8
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 04:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679485827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pUsLzBbty+zjvYqKGIqWjFdElyc0aY817o+EuZ93dRE=;
        b=MNSaQtySZ34JNpiSlBCitK1XGcQVf4y+NS/xeLl2cSA3w3Ecs9Q5ExlPvKwJRcNGl+
         2/jCiDPgE4vIHqZi9BJcBZqvvAq11peu8b5PAvTGGE9K6fujqtCJKJ0xr0ZB/R3pStru
         30g6JRTVyEsHKzthSQgQr2bkenUvpK2mQuOPkby390xYkZrxKJIjlpJ6IPrpsSb9RlQn
         uW5/nPR/icE6IPAht/UovoSrE4IhxG71nIB3vq0V3LlLIwwF8ReYjZA4PGSYjtWz6CzL
         oup7ruU+rCcncB+PAb7rXSw2mG+mTHxC7wumTrYC2ypzRAP+oQcknOOBeUiDUVz2Q4ic
         4rLw==
X-Gm-Message-State: AO0yUKUNC2oqNic0DPBWr6OIVvdsoZKguCSDJNmTwCD7rpChheo73uRB
	8/Ta4OL3DyDi+t5n6R0D0D8=
X-Google-Smtp-Source: AK7set8/OZM6RXDqQ+yuEQj6hbzhIxWyWbdcrHc6WmF+i3E0X6UTyqpYV2giOUnfN0f99r9tNRgPJw==
X-Received: by 2002:a5d:684a:0:b0:2cb:9833:1e95 with SMTP id o10-20020a5d684a000000b002cb98331e95mr3717734wrw.3.1679485827636;
        Wed, 22 Mar 2023 04:50:27 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id q10-20020adff94a000000b002ca864b807csm13801937wrr.0.2023.03.22.04.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 04:50:27 -0700 (PDT)
Message-ID: <0cfcab69-c4a1-2072-a85b-12c5a087db58@grimberg.me>
Date: Wed, 22 Mar 2023 13:50:25 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 11/18] nvme-tcp: control message handling for recvmsg()
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>,
 "boris.pismenny@gmail.com" <boris.pismenny@gmail.com>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-12-hare@suse.de>
 <0be88516-8e29-a1a5-f0ff-204830c0fba5@grimberg.me>
 <cd37b4a7-41e7-b142-e87d-908a2e7bcfc7@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <cd37b4a7-41e7-b142-e87d-908a2e7bcfc7@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>> kTLS is sending TLS ALERT messages as control messages for recvmsg().
>>> As we can't do anything sensible with it just abort the connection
>>> and let the userspace agent to a re-negotiation.
>>
>> Is this a problem if we do end up adding read_sock to tls?
>> Although I do see that the tls code does manage this in the
>> sk_buff control buffer, so I assume there is access to this info.
>>
>> CC'ing Boris here as well.
>>
> Yeah, that was the other reason; cmsg aka TLS alerts are only available 
> for recvmsg().
> 
> However, for TLS 1.3 the only TLS alert which does not trigger a 
> connection reset would the the ominous 'new session ticket' alert.
> But during TLS handshake development we already decided to _disable_
> session tickets as they are pretty meaningless for our us.
> Consequently all TLS alerts will trigger a connection reset, and 
> realistically we don't _need_ to know which alert type has triggered
> the reset.
> 
> So 'read_sock()' could be implemented by closing the connection on
> any TLS alert, and not giving us access to any of the alerts via
> control messages. If that makes life easier ...

Most likely read_sock() is the wrong place to ignore alerts. Probably
the better way is to do this in nvme, although its a bit harder.

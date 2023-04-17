Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0960E8460
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 15:12:27 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-2f4130b898cso251162f8f.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 08:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681744346; x=1684336346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6i2IHb1dRf7Rq/h4Um0rVFJJU1I8nzPe8J3nLS/Xqo=;
        b=bkgcCZkOhS9RkTffshLEfB3jToNbC6KRIXFayzArumxJ/r5BchI34c5kvGgIuwFgUB
         jj/y2BL0FjNJXXGDM8K8A7Suli46I9cIc9iG7XqdKkl2hPdMc1UDaDCcyRzy3dpuRv3n
         +bVAffHTyxbnaiQwzRGL+8e/o0soCb1KBIS1+0GkwznFuoY7cExqMcqWxkbDMv8Ojfqw
         msYSBR7VDZ2LQ8m0YESjRXGp8Iww/Z7UYBC8BkUmLcE39OtGd7urTDGMgqxyUuVualp4
         X8xf6UnK2CQUjFkY5WFgeIL7/qzXoWfflmK2dLTxoKWseL7TxR9/4l0sP1cFqK4yI4wA
         a+BA==
X-Gm-Message-State: AAQBX9cWo6acC43MH/1/Nu8G1noF4hMj7dKthfq4bZw+EpFKUmykJrww
	ojW04MdS6w2zAXWAQvIcowE=
X-Google-Smtp-Source: AKy350Zh1bNuv0vK8gv2VsVaUsWBFWmiIL8HeoDHI0un6BTqvMSvfIyTag7My8SmTYNkjxhPeQm16Q==
X-Received: by 2002:a5d:6281:0:b0:2ef:9699:f906 with SMTP id k1-20020a5d6281000000b002ef9699f906mr7272926wru.7.1681744345931;
        Mon, 17 Apr 2023 08:12:25 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id q21-20020a05600c46d500b003f03d483966sm16158530wmo.44.2023.04.17.08.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 08:12:25 -0700 (PDT)
Message-ID: <57d53899-8695-2bf2-b6aa-0389ad82c7ea@grimberg.me>
Date: Mon, 17 Apr 2023 18:12:24 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 18/18] nvmet-tcp: add configfs attribute 'param_keyring'
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-19-hare@suse.de>
 <60ff89b4-5d63-a6db-18b1-e0f28055c5d9@grimberg.me>
 <c7e895f1-1c95-f658-f7a1-c4cee5cf8c91@suse.de>
 <1b018791-9aa3-b988-7045-40b46bc50989@grimberg.me>
 <02e4f6eb-32c2-8f3c-872f-831e70da6166@suse.de>
 <ffb33351-e26b-470e-9849-e195d9b05b52@grimberg.me>
 <1b9a7d09-1af6-564a-18db-2a73f27435cd@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <1b9a7d09-1af6-564a-18db-2a73f27435cd@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>>>>>> Add a configfs attribute to list and change the default keyring.
>>>>>>
>>>>>> is the keyring an attribute of a port? or a subsystem? Why the choice
>>>>>> of making it per port?
>>>>>>
>>>>> As per discussion at fmds each port might want to use different 
>>>>> credentials.
>>>>> We can move it to subsystems if we decide we don't want to support 
>>>>> that use-case.
>>>>
>>>> I think we should move it to the subsystem in Linux.
>>>>
>>> Easier said than done.
>>>
>>> We can only fetch the subsystem once we have the NQN, which we will
>>> know after the connect command.
>>> But out of necessity the connect command will only be transferred
>>> after TLS handshake completed, so there is not subsystem NQN allowing
>>> us to figure out the correct subsystem.
>>>
>>> So we'll have to keep it at the port level, I'm afraid.
>>
>> Question, why does nvmet needs to support user defined keyrings?
>> I understood your argument for the host, but why should the target
>> support it?
> 
> Hmm. Originally I implemented it to be similar to the host 
> configuration, but from the implementation we don't _actually_ need it 
> as we select the key from the entire key store.

Thanks for confirming.

> Having it is just a nice way of avoiding having to have a daemon 
> configuration.

I'm sorry, but I don't understand this statement. Can you clarify?

> So if you insist we can drop it for the initial implementation.

If there is a use-case, we can add it. But I'm trying to understand what
is it.

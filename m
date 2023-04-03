Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BACD5683
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  3 Apr 2023 13:07:18 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso19821197wmb.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 03 Apr 2023 06:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680527236;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4yfHxwfFzVgQnZp/Yx9Pk7v15x9g20qt8HaR7zZL0bs=;
        b=zL8U+8ZH9n2VckgryZVGNZeTWIcQNlFiA5qHKW0cK2/Xv3YBJktS8Seo0AV5QLsDuR
         DD7ZV3mv+KwL8PFfWeGiepZbiESlyFPo3DTaqzknhzewLl044doRop/FlgtlwAwdB/qX
         PwePpudOj0aRhWWfnfdjJHeURGkGEOcYq4S+8M9HFuV7tjHBdYj6/WagmfLi1CReuiEr
         R0KqorjQjhY8x6fP6mfNc/nGQqWzQHLAv4fTwkKSjQHVR7JPe+RrChWfyvb1j9UiuRRe
         16CHSkA5yGBz8YPWPcLepVokuz7r+GTfnHXBzKFiWxSc0hYewCAP2odtkaaiDlHTqE42
         jj7w==
X-Gm-Message-State: AAQBX9ceyKGHn1VkcGPwCl8uEox14EyvL3YclbYOIV6f9HpG5pEh/zRt
	vTn3gYx0qZaG+QDX+eqBoDlsDXqVll8=
X-Google-Smtp-Source: AKy350YT2fTtu8c/NvUfYvoziMY5QCGuqYyL3l2IQRlWMYIBPbBMGno4eW01XnkRH+vNPU9DYgUmCg==
X-Received: by 2002:a05:600c:1d11:b0:3ed:793d:9dd6 with SMTP id l17-20020a05600c1d1100b003ed793d9dd6mr11438119wms.1.1680527236473;
        Mon, 03 Apr 2023 06:07:16 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c315000b003eda46d6792sm19377363wmo.32.2023.04.03.06.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 06:07:16 -0700 (PDT)
Message-ID: <a22946d2-e22d-a361-8768-8b34cbec1b03@grimberg.me>
Date: Mon, 3 Apr 2023 16:07:15 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 12/18] nvme-fabrics: parse options 'keyring' and 'tls_key'
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-13-hare@suse.de>
 <677f3f9a-872d-27fe-9a21-b41bbe1c44ff@grimberg.me>
 <daf1e19e-119b-3ceb-7808-b74d8b113e05@suse.de>
 <f1bfbb7c-d8df-0386-1048-f141cb6e22bc@grimberg.me>
 <d67d9932-96eb-3548-cf40-b48a6db95739@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <d67d9932-96eb-3548-cf40-b48a6db95739@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>>>> Parse the fabrics options 'keyring' and 'tls_key' and store the
>>>>> referenced keys in the options structure.
>>>>
>>>> Can you explain the reasoning to why a user need to pass a keyring
>>>> given that we already set up one?
>>>>
>>> Choice.
>>> With a single keyring we can only have a single identity.
>>> But there might be configurations where we want to have different PSKs
>>> for the same identity (eg for key rotation).
>>
>> How do you expect that rotation would work with this?
>>
> The user creates a new keyring, adds the necessary keys to it, and then
> either
> - updates the keyring for nvmet (via configfs)
> or
> - reconnects using the new keyring

And the user cannot update the nvme keyring?

>> How does nvmet handle a non-nvme keyring?
>>
> There is a configfs attribute 'param_keyring', allowing you to use a 
> different keyring (the nvme one is just the default).

OK.

>>> With this option we can prepare a new keyring, and use that instead 
>>> of the old one.
>>
>> On an existing controller?
>>
> Sure; when we are updating the keyring and the key id the controller 
> will use that after the next reset.
> Much like we do for DH-CHAP nowadays.
> 
>>> (And it really doesn't add much complexity...)
>>
>> I know, it just adds one more argument, and I want to understand if it
>> is really needed.
> 
> I do agree that the keyring argument would not necessarily required if 
> we pass in the key id, but I'll be needing the keyring for secure 
> concatenation. And plan is to move DH-HMAC-CHAP over to keyrings, too.

I'm not sure I understand why authentication move to keyrings requires
that the user is able to bring its own keyring.

> So I'd prefer to keep it.

I'm not against it, but I failing to understand in what situation a user
_must_ send a different keyring to the driver (and not use the nvme
keyring).

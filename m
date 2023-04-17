Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF856FCB
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 13:50:54 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f167e8a880so3800475e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 06:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681739453; x=1684331453;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rW08AcXe5h1yzwO/16VfGa8RMtIWOvyOCi3lznESrus=;
        b=izOAWRQV2xg+WILFTTIuGgoRLPTtJU7mfM7F3GtuFnYBljl2WFCgWw3aOEJS17MBRB
         daB8kgRkq584+hh9nlTf2o1JMqfo56d1TCEVl2KgXBuh8b3P/XSduhMtFeat6CnAztGM
         JSUkMtTHBbUspsbbcvkFry4uP4KZd8M9fN5baBPfoI/FylqF+FW4WKAzrTqV96IeNfaK
         PgpQdh8/XkoXelc+M+osxH9Sh5Woxxup3AsnTGfqpKGUn7DGiHGRtFr47te+TTMLR6y4
         Ivvax9xhzWPOoyE6gSFqDXrgRapKZSAfsdyCG8P2CxUpNw33zx3xYX1JEOHTRz8HqhZV
         8oIg==
X-Gm-Message-State: AAQBX9cwl7CAsq6GTJi4lgJWX7XTL/0GzYvcmGJgUghT5GtKMT2pQROv
	SlI4B1EH+BkQswUw/wQ2utM=
X-Google-Smtp-Source: AKy350b1X6uGiq3uux1vDEuWjGbMRSgJevFg6hjeWvM+TsOvfsrYDWSWYdhSqBqqRF+8GiUVOXaing==
X-Received: by 2002:a05:600c:6025:b0:3f1:75a5:a369 with SMTP id az37-20020a05600c602500b003f175a5a369mr1310893wmb.3.1681739452680;
        Mon, 17 Apr 2023 06:50:52 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id g12-20020adffc8c000000b002f79ea6746asm7582944wrr.94.2023.04.17.06.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 06:50:52 -0700 (PDT)
Message-ID: <ffb33351-e26b-470e-9849-e195d9b05b52@grimberg.me>
Date: Mon, 17 Apr 2023 16:50:50 +0300
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
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <02e4f6eb-32c2-8f3c-872f-831e70da6166@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>>>> Add a configfs attribute to list and change the default keyring.
>>>>
>>>> is the keyring an attribute of a port? or a subsystem? Why the choice
>>>> of making it per port?
>>>>
>>> As per discussion at fmds each port might want to use different 
>>> credentials.
>>> We can move it to subsystems if we decide we don't want to support 
>>> that use-case.
>>
>> I think we should move it to the subsystem in Linux.
>>
> Easier said than done.
> 
> We can only fetch the subsystem once we have the NQN, which we will
> know after the connect command.
> But out of necessity the connect command will only be transferred
> after TLS handshake completed, so there is not subsystem NQN allowing
> us to figure out the correct subsystem.
> 
> So we'll have to keep it at the port level, I'm afraid.

Question, why does nvmet needs to support user defined keyrings?
I understood your argument for the host, but why should the target
support it?

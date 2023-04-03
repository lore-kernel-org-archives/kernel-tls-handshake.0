Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491A45678
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  3 Apr 2023 12:24:08 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v1so29146499wrv.1
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 03 Apr 2023 05:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680524646; x=1683116646;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hQCt4YaHv+6303eq3oNsTscAtpuTTpPBNIA7vNtc7BM=;
        b=wqep7Zm7tEI1YoyhM76LK7bl0LecSu6oJGfHSlhRVVO0/b8N7QVrUbMAlCfmrycAfE
         RxmvCWNhnz8bCD7Sc1dwCpYha/HXUwb80tqL52BXm8+sSh4lCYE2p3Lg8xjuiRv4CZkT
         Jf5BEyrQcxTHpWyck2n5wqilOC7xg9NlQ/ZkYuRlKddu8CrnAjGFUiDF1F+Ed4tl6++V
         BnhV57vvTQqm5KfzImm1i1U/+nI41xzsaPJ0hMg/uVNqb6+mSPzEpa9RA6f4k/lcpGcE
         oPKAJG30J44/+G/qSgk6i/MD43UXhjc2uea7nbP4PDYAZ7We8F0g3lUHu9OtbnlS70m4
         HEhQ==
X-Gm-Message-State: AAQBX9d63ainf0+kmvV70G5rBtRIGFUPkbcXoeN/rrL1EcGsqV1xz6IC
	ILMmnea6Yyq+jqNo8LANWtQ=
X-Google-Smtp-Source: AKy350YnT17EWqc4AVjiSBa/72RALGXXw0d8R+ex3gWi7PTbwRyKB/1X+7eHkM+2sdSrVB3oRW0lzw==
X-Received: by 2002:a5d:49c4:0:b0:2ca:ab68:eff9 with SMTP id t4-20020a5d49c4000000b002caab68eff9mr19563040wrs.7.1680524646419;
        Mon, 03 Apr 2023 05:24:06 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id a12-20020a056000100c00b002cea8664304sm9514655wrx.91.2023.04.03.05.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 05:24:06 -0700 (PDT)
Message-ID: <f1bfbb7c-d8df-0386-1048-f141cb6e22bc@grimberg.me>
Date: Mon, 3 Apr 2023 15:24:04 +0300
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
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <daf1e19e-119b-3ceb-7808-b74d8b113e05@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>> Parse the fabrics options 'keyring' and 'tls_key' and store the
>>> referenced keys in the options structure.
>>
>> Can you explain the reasoning to why a user need to pass a keyring
>> given that we already set up one?
>>
> Choice.
> With a single keyring we can only have a single identity.
> But there might be configurations where we want to have different PSKs
> for the same identity (eg for key rotation).

How do you expect that rotation would work with this?

How does nvmet handle a non-nvme keyring?

> With this option we can prepare a new keyring, and use that instead of 
> the old one.

On an existing controller?

> (And it really doesn't add much complexity...)

I know, it just adds one more argument, and I want to understand if it
is really needed.

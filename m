Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44E233D2
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  3 Apr 2023 12:20:17 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so14267672wms.5
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 03 Apr 2023 05:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680524416; x=1683116416;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FLTeks8eELiIGcTY5wF4oXdJ+bPSmjNFBcw73Z/uIUE=;
        b=liwuSB6uBwDQhdMlcTbX8RWNpbdJBBWP5wc5w14R4zGCTWxBcCXAQhVidVIN4xAXx7
         YxJ1PAq7cBZEbd62yEPfTEehLNYxE0ceMrq4qlFD0ABNfLzb12mX4yAsOhpg3l87axiv
         EPddfJvj67i8eRqR0YO0xp1AK3/WrsMSMavbM6b+7aB+nybCdvgmdEBwX+Qa0Bsezj/K
         jZyZMq2qpd/w2YxUK1cl8w7f3tIupi75yrvhH/1GPLdoweHCXDnCf27QNkKVr2AUGCCx
         UqP1hL56Jbb2nRoyj93pdNNha7kpP4tdudeMfAg1n5qf5VJ4TORKPI8gmYMNXNH1K2n0
         Elog==
X-Gm-Message-State: AAQBX9cU814GWayRc/FjVMZE9ABIBj43UTVWRM5SDMl9rSTtQKly9/HG
	CRPOawTbf5Um13YCJG0Yzvw=
X-Google-Smtp-Source: AKy350YxmO96TAvXra/msTOS7cA1FwhAgYJY37TVSY7/z3X8F/c5jraEpEwEAHhi8th5HWQB1BJOjA==
X-Received: by 2002:a05:600c:3b8a:b0:3f0:34cb:a542 with SMTP id n10-20020a05600c3b8a00b003f034cba542mr11934460wms.2.1680524415877;
        Mon, 03 Apr 2023 05:20:15 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id y4-20020a056000108400b002cfec8b7f89sm9670709wrw.77.2023.04.03.05.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 05:20:15 -0700 (PDT)
Message-ID: <44fe87ba-e873-fa05-d294-d29d5e6dd4b5@grimberg.me>
Date: Mon, 3 Apr 2023 15:20:13 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 10/18] nvme-tcp: fixup send workflow for kTLS
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Jakub Kicinski <kuba@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Boris Pismenny <borisp@nvidia.com>,
 john.fastabend@gmail.com, Paolo Abeni <pabeni@redhat.com>,
 Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-11-hare@suse.de>
 <634385cc-35af-eca0-edcb-1196a95d1dfa@grimberg.me>
 <20230330224920.3a47fec9@kernel.org>
 <7f057726-8777-2fd3-a207-b3cd96076cb9@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <7f057726-8777-2fd3-a207-b3cd96076cb9@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey Jakub, Hannes.

>>>> kTLS does not support MSG_EOR flag for sendmsg(), and in general
>>>> is really picky about invalid MSG_XXX flags.
>>>
>>> CC'ing TLS folks.
>>>
>>> Can't tls simply ignore MSG_EOR instead of consumers having to be
>>> careful over it?
>>
>> I think we can support EOR, I don't see any fundamental problem there.

It would help at least one consumer (nvme-tcp) to not change its
behavior between tls and non-tls. At the very minimum don't fail
the send operation (just do the same as if it wasn't passed).

>>>> So ensure that the MSG_EOR flags is blanked out for TLS, and that
>>>> the MSG_SENDPAGE_LAST is only set if we actually do sendpage().
>>>
>>> You mean MSG_SENDPAGE_NOTLAST.
>>>
>>> It is also a bit annoying that a tls socket dictates different behavior
>>> than a normal socket.
>>>
>>> The current logic is rather simple:
>>> if more data comming:
>>>     flags = MSG_MORE | MSG_SENDPAGE_NOTLAST
>>> else:
>>>     flags = MSG_EOR
>>>
>>> Would like to keep it that way for tls as well. Can someone
>>> explain why this is a problem with tls?
>>
>> Some of the flags are call specific, others may be internal to the
>> networking stack (e.g. the DECRYPTED flag). Old protocols didn't do
>> any validation because people coded more haphazardly in the 90s.
>> This lack of validation is a major source of technical debt :(
> 
> A-ha. So what is the plan?
> Should the stack validate flags?
> And should the rules for validating be the same for all protocols?

MSG_SENDPAGE_NOTLAST is not an internal flag, I thought it was
essentially similar semantics to MSG_MORE but for sendpage. It'd
be great if this can be allowed in tls (again, at the very least
don't fail but continue as if it wasn't passed).

If this turns out to be a big project, I would prefer to change
nvme-tcp for now in order not to block nvme tls support (although it is
a hidden capability interface, which is always bad).

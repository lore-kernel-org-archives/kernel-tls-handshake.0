Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B03C8C01
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 15:42:07 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id h17so17521854wrt.8
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 22 Mar 2023 08:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679499726; x=1682091726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xzNL49rNdZRA9UN8vxyLZlu6eeRfFXD3DSb35f++8oc=;
        b=GfxWHDkv3VjQ8LmHQO8QucsbBElSsfCE0YQdXjFeWAyoOlf3qA4E7aWgZhOmZaxWB7
         nvKk0wsCxJ8XPLyUUztJozsNljqOeQQ/b7AMWlgzSFOkpFt4agHfQx/ajYFDSCWE4VSR
         PVMjbh55WMQdt6Hxn2rC+B2zsKwz4AiYc68pnt9kE0cvPOTRgYDpnnCeVYlLEn8UTSQI
         gYZqlzTghg9MLUX/kU+J3pFat9BbEZJmr3WfPYn357rv42nQy3KPPy8b1vyYSrXM+XnT
         8GiKAtK9tmvGCf6ObXR7SktiQ0DUJhpAwS4sRqbwu2tpzCbeRg3vA+6pPmo38WVoepHl
         fqJA==
X-Gm-Message-State: AO0yUKX9+RAsHq2qlsi92fuGP81mLdvuwez7iBj1Opsb7CRVqnu239TK
	mW6zN1aKEQKjLr6ru9TLHjo=
X-Google-Smtp-Source: AK7set/4107LAZ89SkfqS7RYFzFEwEl8G3SCAHnIcwIrXj9bRYzh6x/mnBVb9279WwiJA1iokew3rQ==
X-Received: by 2002:a05:6000:1106:b0:2cf:e37f:2b with SMTP id z6-20020a056000110600b002cfe37f002bmr4109479wrw.0.1679499726140;
        Wed, 22 Mar 2023 08:42:06 -0700 (PDT)
Received: from [10.100.102.14] (85.65.206.11.dynamic.barak-online.net. [85.65.206.11])
        by smtp.gmail.com with ESMTPSA id a8-20020a056000100800b002d8566128e5sm5687600wrx.25.2023.03.22.08.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 08:42:05 -0700 (PDT)
Message-ID: <e0620d94-9729-014c-2cb8-8ff826ebbefa@grimberg.me>
Date: Wed, 22 Mar 2023 17:42:04 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 15/18] nvmet-tcp: enable TLS handshake upcall
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-16-hare@suse.de>
 <6f69983c-17bd-dd72-b941-95f55db10180@grimberg.me>
 <b8a2e1d4-3571-447b-25c6-c6dd25fbad02@suse.de>
 <a1af3f6b-ec9e-4e91-ad70-57fcc9010a91@grimberg.me>
 <c426d104-b7f2-e736-c23a-b94fda54ed37@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <c426d104-b7f2-e736-c23a-b94fda54ed37@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>> The 'data_ready' call might happen at any time after the 'accept' 
>>> call and us calling into userspace.
>>> In particular we have this flow of control:
>>>
>>> 1. Kernel: accept()
>>> 2. Kernel: handshake request
>>> 3. Userspace: read data from socket
>>> 4. Userspace: tls handshake
>>> 5. Kernel: handshake complete
>>>
>>> If the 'data_ready' event occurs between 1. and 3. userspace wouldn't 
>>> know that something has happened, and will be sitting there waiting 
>>> for data which is already present.
>>
>> Umm, doesn't userspace read from the socket once we trigger the upcall?
>> it should. But I still don't understand what is the difference between
>> us waiking up userspace, from the default sock doing the same?
>>
> No, it doesn't (or, rather, can't).
> After processing 'accept()' (from the kernel code) data might already be 
> present (after all, why would we get an 'accept' call otherwise?).
> But the daemon has not been started up (yet); that's only done in
> step 3). But 'data_ready' has already been called, so by the time 
> userland is able to do a 'read()' on the socket it won't be seeing 
> anything.

Not sure I understand. if data exists, userspace will read from the
socket and get data, whenever that is.

> To be precise: that's the reasoning I've come up with.
> Might be completely wrong, or beside the point.
> But what I _do_ know is that without this call userspace would
> _not_ see any data, and would happily sit there until we close the 
> socket due to a timeout (which also why I put in the timeout
> module options ...), and only _then_ see the data.
> But with this call everything works. So there.

I may be missing something, and maybe its because I haven't looked at
the userspace side yet. But if it calls recvmsg, it should either
consume data, or it should block until it arrives.

I'm finding it difficult to understand why emulating almost 100% the
default socket .data_ready is what is needed. But I'll try to understand
better.



>>> As outlined in the response to the nvme-tcp upcall, on the server 
>>> side we _have_ to allow for non-TLS connections (eg. for discovery).
>>
>> But in essence what you are doing is that you allow normal connections
>> for a secured port...
>>
> Correct.

That is not what the feature is supposed to do.

>> btw, why not enforce a psk for the discovery controller (on this port)
>> as well? for secured ports? No one said that we must accept a
>> non-secured discovery connecting host on a secured port.
>>
> Because we can't have a PSK for standard discovery.
> Every discovery controller has the canonical discovery NQN, so every
> PSK will have the same subsystem NQN, and you will have to provide the 
> _same_ PSK to every attached storage system.

Right, because they have the same NQN. Sounds good, what is the problem?
It is much better than to have sectype be nothing more than a
recommendation.

If sectype tls1.x is defined on a port then every connection to that
port is a tls connection.

> If we had unique discovery controller NQNs everything would be good,
> but as we don't I guess we have to support normal connections in 
> addition to secured ones.

Its orthogonal. the well-known disc-nqn may be "weaker", but tls
is still enforced. when we add unique disc-nqn, we can use different
psks.

> As I said; maybe it's time to revisit the unique discovery NQN patches;
> with those we should be able to separate the various use-case like
> having a dedicated secured discovery port.

I don't see why this would be needed.

> 
>>> And we have to start the daemon _before_ the first packet arrives,
>>
>> Not sure why that is.
>>
>>> but only the first packet will tell us what we should have done.
>>> So really we have to start the upcall and see what happens.
>>> The 'real' handling / differentiation between these two modes is done 
>>> with the 'peek pdu' patch later on.
>>
>> I am hoping we can kill it.
> 
> Sorry, no. Can't.
> Not without killing standard discovery.

I don't understand the dependency.

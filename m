Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC0DA2D
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 06:33:41 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id i9so14501843wrp.3
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 23:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680071620; x=1682663620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xAhAouquoLXV6R1b7M9GsqTyZGR2tDdw2bAIY7nozZ0=;
        b=yAlb8YsLSKAo1RMnuci6SC9cF9p150ZTOMoq9VraRmlVeDvcTEQIXx7sa0EQwssl+l
         3ZgwzoRFu/QrSBLUp1oaKd0iwJVlS0VcNaBLUze3jlRaQYnn+DDBuS2/sfAOToSVyIvq
         q4SstL07wup4lnEVtg8Utv4YOwWtmb4RDWJPvcqyLw63JMqrpG8LdtmlgyVw+/PZu3cb
         aQ9KiVRLgKfg1sXelzMAEYrkQO26UramWoes9rV4I23lI5CGn2flswEcwcgm3ldWGtB3
         ocPWX4BtuvMeN42o2fq368hME0gKMP17Mp4uxJcIqEhaQ17h4/Vgb5pQg3Atur0E9J7i
         0bpA==
X-Gm-Message-State: AAQBX9dlatCaWVQmeiUiZp7YTURNBgWuq4tiKc4z4xrCUqX8Qv0h/2jJ
	ksKd1548UyWiy1oLdC7l27M=
X-Google-Smtp-Source: AKy350bKAaWQWL36mC2fobfHZo1TgHqc+fSziiD8J6vO6IJkvHSjcOwu6E/aiV7GatuqMNZgh/hppw==
X-Received: by 2002:adf:ec82:0:b0:2c9:993a:f4cd with SMTP id z2-20020adfec82000000b002c9993af4cdmr10884133wrn.1.1680071619918;
        Tue, 28 Mar 2023 23:33:39 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id b7-20020a5d4b87000000b002cfe0ab1246sm29337299wrt.20.2023.03.28.23.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 23:33:39 -0700 (PDT)
Message-ID: <cac91fc0-ab9f-ab35-fb74-1e3dcbf3eecc@grimberg.me>
Date: Wed, 29 Mar 2023 09:33:38 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 15/18] nvmet-tcp: enable TLS handshake upcall
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>,
 Keith Busch <kbusch@kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 Chuck Lever <cel@kernel.org>,
 "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-16-hare@suse.de>
 <6f69983c-17bd-dd72-b941-95f55db10180@grimberg.me>
 <b8a2e1d4-3571-447b-25c6-c6dd25fbad02@suse.de>
 <a1af3f6b-ec9e-4e91-ad70-57fcc9010a91@grimberg.me>
 <c426d104-b7f2-e736-c23a-b94fda54ed37@suse.de>
 <e0620d94-9729-014c-2cb8-8ff826ebbefa@grimberg.me>
 <e016af81-f77e-2eba-a805-838f62ba50f7@suse.de>
 <68AA3629-6B88-4098-AA03-BEDF614F8D0B@oracle.com>
 <ea181844-69f5-66eb-e64e-e9871916532b@grimberg.me>
 <3ad50302-6b3c-6d6a-669e-0b11c2df6a6b@suse.de>
 <c9b5bb2d-89d7-8805-6d60-2c53e13f5d58@grimberg.me>
 <7c3da604-251f-209e-db6d-d1bee5a838c5@suse.de>
 <8d0ddb2d-0b4e-e782-6507-a1d61b5d53f4@grimberg.me>
 <D2384BEF-CE08-4CC6-95C2-F5E6726E0970@oracle.com>
 <6350ad42-d6ab-b244-6bdd-9830c11fb1ea@grimberg.me>
 <D37E71E9-06C0-467A-A653-9F1B968590AA@oracle.com>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <D37E71E9-06C0-467A-A653-9F1B968590AA@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>>>>>> As the callbacks will be changed once TLS is activated, and we really should not attempt to run if sk_data_ready() points to another function,
>>>>>>> as then the sk_user_data pointer will most likely be changed, too,
>>>>>>> causing all sorts of issues.
>>>>>>
>>>>>> Umm, something is unclear to me. if nvmet_tcp_listen_data_ready is
>>>>>> called doesn't it by definition mean that sk->sk_data_ready ==
>>>>>> nvmet_tcp_listen_data_ready ?
>>>>>>
>>>>>> Are you talking about a situation where between
>>>>>> nvmet_tcp_listen_data_ready is starting and until the
>>>>>> sk->sk_callback_lock the data_ready cb (and the user data
>>>>>> pointer) is changed?
>>>>> No. Far simpler:
>>>>> Starting kTLS will change the callbacks.
>>>>> So sk->sk_data_ready will point to our callback before
>>>>> the upcall, but to the kTLS version _after_ the upcall.
>>>>> It typically doesn't matter, as we're setting it to
>>>>> nvmet_tcp_data_ready() anyway.
>>>>
>>>> For ktls won't we set it to nvmet_tcp_data_ready only when
>>>> the handshake is done?
>>>>
>>>>> But there might be the odd case where the data_ready
>>>>> callback is invoked after kTLS has been started but before
>>>>> we're setting it to nvmet_tcp_data_ready().
>>>>
>>>> What does nvmet_tcp_data_ready has to do with it?
>>>> You are changing nvmet_tcp_listen_data_ready.
>>>>
>>>>> Then we cannot guarantee that sk_user_data really is set
>>>>> to the 'queue' pointer, so we should skip the function.
>>>>
>>>> nvme_tcp_listen_data_ready was invoked, then sk->sk_data_ready
>>>> is nvme_tcp_listen_data_ready. Are you referring to the case
>>>> where the callback has changed before the read lock ?
>>>>
>>>> I would like to understand why svc_tcp_listen_data_ready doesn't
>>>> have this race as well. Chuck?
>>> svc doesn't alter the pointer address in the listener's
>>> sk_data_ready field, and neither does kTLS.
>>
>> It is inherited from the parent socket sk. IIRC it is cloned in
>> inet_reqsk_clone.
> 
> Ah. I meant the changes to support the use of kTLS sockets do
> not alter this svc code.
> 
> 
>>> For a connected socket, when the handshake has completed,
>>> svc examines the socket for more work one last time before
>>> deciding it's idle (a kind of simulated data_ready). That
>>> should pick up work that arrived undetected.
>>
>> The question is how does a ktls socket never calls its inherited
>> sk_data_ready (svc_tcp_listen_data_ready), which according to Hannes'
>> explanation, should be the case if this socket was created as its
>> offspring.
> 
> Have a look at svc_tcp_accept(). It resets the inherited callbacks
> before setting up the socket.
> 
> svc_tcp_init() then sets sk_data_ready to our data_ready function.

Yes, I see.
When starting a listener, it saves inet->sk_data_ready in
svsk->sk_odata, and sets sk->sk_data_ready to svc_tcp_listen_data_ready.
then when accepting, it returns it to newsock->sk->sk_data_ready,

then only when adding the new socket, it sets sk_data_ready to
svc_data_ready...

This is what I agreed with Hannes, that nvmet reset the newsock
inherited sk callbacks, and only restore them after the handshake.

Thanks.

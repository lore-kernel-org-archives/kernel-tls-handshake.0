Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015608BE0
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 15:29:34 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id m2so12652692wrh.6
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 08:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680017373; x=1682609373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qexeKim1ZlEK1Dz+xS1G2ct6jCCGIXB+0tiAHlwj1VM=;
        b=J9BjDt1sCUgfoQd2+EuEguRwCZMnYkZCEIL/E+KgaR9JjYmcJOGnOGvqmx+s+P3vAQ
         vndTEtIQJscl1o65lwVwAEqIQkb48PTUoYnSe5xFR5+qJiLhIzW/k6rpK4Vrb+spY6ML
         6wU6cE8XQEFJqZDVRwasPH9tPbhUXGOeytIS7WDDP0nSSRtbZdfPESPeOuB01HUyJtxU
         tcc7otfsPqj+3Sw46B0B7MQ7m9gg60EYefN0S+qNfA0Xyuxhm40EbVQ+lf2hSpTe4JT2
         tDND1ekqRtz7BZLCEhcABP3f6qStSp9r8gSAbtG1QZeKYwyK8G7R8bzMo3DufUcmWuE6
         h3ew==
X-Gm-Message-State: AAQBX9fpvN7lLsku6VuZ+oAbip23rJbJQ9k5xcuIgCHRu7+qPlnshv36
	lrbkHpvgkF9QnTkGKBBpW3A=
X-Google-Smtp-Source: AKy350b0CMmJ6FjSU5ZNkToc1NWn0FhMTu9hxkGdLkaDMndAUxm8kRaaKwW1PmfbC0q50pHt8f5/FQ==
X-Received: by 2002:adf:e60a:0:b0:2c7:175e:e201 with SMTP id p10-20020adfe60a000000b002c7175ee201mr8716190wrm.1.1680017373082;
        Tue, 28 Mar 2023 08:29:33 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id m23-20020a056000181700b002c5694aef92sm27798980wrh.21.2023.03.28.08.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 08:29:32 -0700 (PDT)
Message-ID: <6350ad42-d6ab-b244-6bdd-9830c11fb1ea@grimberg.me>
Date: Tue, 28 Mar 2023 18:29:31 +0300
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
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <D2384BEF-CE08-4CC6-95C2-F5E6726E0970@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>>>> As the callbacks will be changed once TLS is activated, and we really should not attempt to run if sk_data_ready() points to another function,
>>>>> as then the sk_user_data pointer will most likely be changed, too,
>>>>> causing all sorts of issues.
>>>>
>>>> Umm, something is unclear to me. if nvmet_tcp_listen_data_ready is
>>>> called doesn't it by definition mean that sk->sk_data_ready ==
>>>> nvmet_tcp_listen_data_ready ?
>>>>
>>>> Are you talking about a situation where between
>>>> nvmet_tcp_listen_data_ready is starting and until the
>>>> sk->sk_callback_lock the data_ready cb (and the user data
>>>> pointer) is changed?
>>> No. Far simpler:
>>> Starting kTLS will change the callbacks.
>>> So sk->sk_data_ready will point to our callback before
>>> the upcall, but to the kTLS version _after_ the upcall.
>>> It typically doesn't matter, as we're setting it to
>>> nvmet_tcp_data_ready() anyway.
>>
>> For ktls won't we set it to nvmet_tcp_data_ready only when
>> the handshake is done?
>>
>>> But there might be the odd case where the data_ready
>>> callback is invoked after kTLS has been started but before
>>> we're setting it to nvmet_tcp_data_ready().
>>
>> What does nvmet_tcp_data_ready has to do with it?
>> You are changing nvmet_tcp_listen_data_ready.
>>
>>> Then we cannot guarantee that sk_user_data really is set
>>> to the 'queue' pointer, so we should skip the function.
>>
>> nvme_tcp_listen_data_ready was invoked, then sk->sk_data_ready
>> is nvme_tcp_listen_data_ready. Are you referring to the case
>> where the callback has changed before the read lock ?
>>
>> I would like to understand why svc_tcp_listen_data_ready doesn't
>> have this race as well. Chuck?
> 
> svc doesn't alter the pointer address in the listener's
> sk_data_ready field, and neither does kTLS.

It is inherited from the parent socket sk. IIRC it is cloned in
inet_reqsk_clone.

> For a connected socket, when the handshake has completed,
> svc examines the socket for more work one last time before
> deciding it's idle (a kind of simulated data_ready). That
> should pick up work that arrived undetected.

The question is how does a ktls socket never calls its inherited
sk_data_ready (svc_tcp_listen_data_ready), which according to Hannes'
explanation, should be the case if this socket was created as its
offspring.

> Maybe I'm missing something?

I don't know yet.

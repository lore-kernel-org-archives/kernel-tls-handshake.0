Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7AB187D
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 08:44:51 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id n19so6449421wms.0
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 01:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679993089; x=1682585089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sq4nT9N0o2/zS2QXl0qJAFl4VFvJRq9f1jczWkHjikc=;
        b=lJSA7vK5A+R4eW/UA4+Sww4MOkGvC6GjCLLMfQHZDdFfFeFUoSTFMuOJnRdhI/2N2h
         10WZ1hhNxM3c9XLYgxtVgjsP5SNAY8fqRnP17RwxvJy+1N82bz1IgmF8ujNLLb6hcMh0
         SmqsuF2l5xcryG4k/FA/xOezmrLpJRFVIyb9WNV10u1bxGTYW7LXK2H5jAuP45R6s4yp
         Eb77850sbskdeNufNeXcohGO+QTqlR7Qe9G/09gCccj43zieX1lHGSXogSz3fCpG3u/D
         lm+vP2JkwMYVpFP+jNc4tZwBdvJtMrjC9v33Ft4tfrMClNXoR6vmHe5cb1khAYH6JpUa
         p4Rw==
X-Gm-Message-State: AO0yUKVgYB7gprMf71rjtSPRTRW5Ew/frrf6BaG4yPs4lw5R0IlOwy/t
	zpTwRKtpkCy1uvnvPBE8Il4=
X-Google-Smtp-Source: AK7set90+VL5KGJqEfkzuoVdDH1wCYjC2mOUWPZnyVj88gw2HdB5CMhd3SdkphQZUwDaETD6aF9a4w==
X-Received: by 2002:a05:600c:470c:b0:3ee:7d85:e0d1 with SMTP id v12-20020a05600c470c00b003ee7d85e0d1mr12685587wmo.2.1679993089610;
        Tue, 28 Mar 2023 01:44:49 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id k22-20020a05600c1c9600b003eda46d6792sm11548669wms.32.2023.03.28.01.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 01:44:49 -0700 (PDT)
Message-ID: <8d0ddb2d-0b4e-e782-6507-a1d61b5d53f4@grimberg.me>
Date: Tue, 28 Mar 2023 11:44:48 +0300
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
To: Hannes Reinecke <hare@suse.de>, Chuck Lever III <chuck.lever@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
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
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <7c3da604-251f-209e-db6d-d1bee5a838c5@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


>>>
>>> Nearly there.
>>>
>>> The actual patch would be:
>>>
>>> @@ -2031,10 +1988,16 @@ static void 
>>> nvmet_tcp_listen_data_ready(struct sock *sk)
>>>          trace_sk_data_ready(sk);
>>>
>>>          read_lock_bh(&sk->sk_callback_lock);
>>> +       /* Ignore if the callback has been changed */
>>> +       if (sk->sk_data_ready != nvmet_tcp_listen_data_ready)
>>> +               goto out;
>>>          port = sk->sk_user_data;
>>>          if (!port)
>>>                  goto out;
>>>
>>> +       if (port->data_ready)
>>> +               port->data_ready(sk);
>>> +
>>>          if (sk->sk_state == TCP_LISTEN)
>>>                  queue_work(nvmet_wq, &port->accept_work);
>>>   out:
>>>
>>> As the callbacks will be changed once TLS is activated, and we really 
>>> should not attempt to run if sk_data_ready() points to another function,
>>> as then the sk_user_data pointer will most likely be changed, too,
>>> causing all sorts of issues.
>>
>> Umm, something is unclear to me. if nvmet_tcp_listen_data_ready is
>> called doesn't it by definition mean that sk->sk_data_ready ==
>> nvmet_tcp_listen_data_ready ?
>>
>> Are you talking about a situation where between
>> nvmet_tcp_listen_data_ready is starting and until the
>> sk->sk_callback_lock the data_ready cb (and the user data
>> pointer) is changed?
> 
> No. Far simpler:
> Starting kTLS will change the callbacks.
> So sk->sk_data_ready will point to our callback before
> the upcall, but to the kTLS version _after_ the upcall.
> It typically doesn't matter, as we're setting it to
> nvmet_tcp_data_ready() anyway.

For ktls won't we set it to nvmet_tcp_data_ready only when
the handshake is done?

> But there might be the odd case where the data_ready
> callback is invoked after kTLS has been started but before
> we're setting it to nvmet_tcp_data_ready().

What does nvmet_tcp_data_ready has to do with it?
You are changing nvmet_tcp_listen_data_ready.

> Then we cannot guarantee that sk_user_data really is set
> to the 'queue' pointer, so we should skip the function.

nvme_tcp_listen_data_ready was invoked, then sk->sk_data_ready
is nvme_tcp_listen_data_ready. Are you referring to the case
where the callback has changed before the read lock ?

I would like to understand why svc_tcp_listen_data_ready doesn't
have this race as well. Chuck?

Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA95168CF
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  8 May 2023 11:17:13 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-50be0d835aaso8028751a12.3
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 08 May 2023 04:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grsecurity.net; s=grsec; t=1683544631; x=1686136631;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LwQu0CvnIqHdk0zFd2Ly95xzIicNpjf5hK7qle0GkMo=;
        b=nM5BYOjR2DUwGc/nXMZ2wBBLtIOF9TY4KtvvpIcn2R3FVBd057dKvWJFAj3u0xU9Qe
         F4/n8mS6C/0JoVgip7FQ5QL1lMa9F7v6rmrOWY+TSMl1+rvwG3smy/M1OYhVurJ2mIF0
         GuGOLHL7WcwVL3KUVTGhSHC1VYu5Tg7pCJ4WfCXzQCCzX9dlAQN7teT79uf/UeeJuVK5
         5ghWOqUONzNzBluDKnbToRfukQsgXvO0x25PvJzt6vIRlJuY4gZiyWt+khH+jRkDG8zO
         NTStLHp6mHwav+kj0aZPa4KFdoix9gfl8ftHr2uBWzfPXWqIwtv+xhl2vVFXTi7ye7f2
         Iwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683544631; x=1686136631;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LwQu0CvnIqHdk0zFd2Ly95xzIicNpjf5hK7qle0GkMo=;
        b=GV8S9d4oAS8LBpHRt+oeIepyO8L5Y5lvLsVD5TlooRsQLZi4XmfjeS1yz0vIdXP9Hr
         4WcCaziH4FQZcEjzS1/0ByBzST/Kt7QdF2CEEEvAu8KgxzagPfI8hahbRcC99MxP84gD
         /EPdoWt35cSsQRxWf/11nJww/T0GIdAM0Agjz4kXfllK8iixn+obZOGa2Y069H5BABv3
         SjK+hoA29ZB8vmtIN5fHzvnMmiawyKmF2d18FAuDdLTHphpA+VsVstlj6uYsj3UlaexE
         cVJ2Y8VSSa/PZ2sM35o/wZUAd/FVdg0oKSjzEFIoRKMuGtzyWy7QLi6zhpS3CKXYQGvP
         UG8A==
X-Gm-Message-State: AC+VfDxEFhIAmanMR7yhIaTvoZTHHFkglmoaicPZLRDMYn6t0ooghCdo
	GfkMNbNu1xm10MWzzzFNlqAWbg==
X-Google-Smtp-Source: ACHHUZ6daYUy5vtQ/+17bRB0bpR39MM3kuUIPaKChnu2FLWMvP1g0/2R8Pd61ENkn+fP/usDsmIzbw==
X-Received: by 2002:a05:6402:31e8:b0:50b:fbb5:f934 with SMTP id dy8-20020a05640231e800b0050bfbb5f934mr7282286edb.3.1683544631271;
        Mon, 08 May 2023 04:17:11 -0700 (PDT)
Received: from ?IPV6:2003:f6:af27:500:653d:9c74:8bdf:2820? (p200300f6af270500653d9c748bdf2820.dip0.t-ipconnect.de. [2003:f6:af27:500:653d:9c74:8bdf:2820])
        by smtp.gmail.com with ESMTPSA id n20-20020a056402515400b00509d1c6dcefsm6018953edd.13.2023.05.08.04.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 04:17:10 -0700 (PDT)
Message-ID: <e41400ed-cb95-0694-2881-61d25c0fcaa0@grsecurity.net>
Date: Mon, 8 May 2023 13:17:09 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [bug report] net/handshake: Create a NETLINK service for handling
 handshake requests
Content-Language: en-US, de-DE
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>
References: <f4e2ebae-c40f-4267-84e5-f3944d4d7f9f@kili.mountain>
 <FB3B84D0-2148-43D9-A0E1-153718BA07DC@oracle.com>
 <96b2652a-2316-4a1e-b47f-adc821c4dcee@kili.mountain>
From: Mathias Krause <minipli@grsecurity.net>
In-Reply-To: <96b2652a-2316-4a1e-b47f-adc821c4dcee@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dan!

On 03.05.23 09:14, Dan Carpenter wrote:
> Let me add Mathias Krause to the CC because I don't necessarily remember
> the rules perfectly.  Mathias, is there any way you could take a look
> at this in linux-next?

Sure, I can take a look, but won't be able to do a full review.

> 
> net/handshake/netlink.c:153 handshake_nl_accept_doit()
> warn: fd used after fd_install() 'sock->file'
> 
> On Tue, May 02, 2023 at 09:18:38PM +0000, Chuck Lever III wrote:
>>>    138         sock = req->hr_sk->sk_socket;
>>>    139         fd = handshake_dup(sock);
>>>                     ^^^^^^^^^^^^^^^^^^^
>>> This calls fd_install(newfd, sock->file) so we cannot trust sock->file
>>> again after handshake_dup() succeeds.
>>
>> I don't understand this comment, or the Smatch warning.
>> Can you explain more?

Lets quote handshake_dup() as well to get the complete picture:

 91 static int handshake_dup(struct socket *sock)
 92 {
 93     struct file *file;
 94     int newfd;
 95
 96     if (!sock->file)
 97         return -EBADF;
 98
 99     file = get_file(sock->file);
100     newfd = get_unused_fd_flags(O_CLOEXEC);
101     if (newfd < 0) {
102         fput(file);
103         return newfd;
104     }
105
106     fd_install(newfd, file);
107     return newfd;
108 }

I believe the Smatch warning is a false positive, as sock->file likely
has a non-zero reference count when handshake_dup() gets called (if it's
non-NULL and assuming no other UAF issues related to sock->file, but see
below). This makes the fd_install() call harmless, as a racing thread
can only drop the reference count back to its previous non-zero value.
However, 'newfd' can no longer be trusted to refer to sock->file, as a
racing thread might have replaced or close()d it in the meantime.

>>
>>
>>>    140         if (fd < 0) {
>>>    141                 err = fd;
>>>    142                 goto out_complete;
>>>    143         }
>>>    144         err = req->hr_proto->hp_accept(req, info, fd);
> 
> This code exposes the "fd" over netlink...  I would have thought that
> Smatch should have printed a warning for this even though it's a false
> positive.  Let me change that.

I don't see any implementation of the hp_accept() callback in that
commit nor is its behaviour described, so I cannot tell much about the
error handing here. But if it assumes 'fd' refers to 'sock->file' it
might be broken for above mentioned reasons.

I assume the final consumer of 'fd' shares the fd table with current(),
i.e. is part of the same thread group. So at best one thread is messing
with another by trying to make the fd index it receives via netlink be
stale. But, again, that's not really an issue, as a process is tampering
with itself.

> 
>>>    145         if (err)
>>>    146                 goto out_complete;
>>>                        ^^^^^^^^^^^^^^^^^
>>> This is an issue.  I believe it's better to leak the fd here and let it
>>> get cleaned up later when the process dies.  (I sound very confident
>>> here, but really I am just repeating things other people have said, like
>>> some kind of ChatGPT nonsense generator).
>>>
>>> if (err) {
>>> sock->file = NULL;
>>> goto out_complete;
>>> }
>>
>> That field is owned by the API consumers. I don't think we
>> should set it to NULL here.

I agree. Don't listen to the ChatGPT nonsense ;)  However, see below...

>>
>>
>>>    147 
>>>    148         trace_handshake_cmd_accept(net, req, req->hr_sk, fd);
>>>    149         return 0;
>>>    150 
>>>    151 out_complete:
>>>    152         handshake_complete(req, -EIO, NULL);
>>> --> 153         fput(sock->file);
>>
>> The point of this is to remove the reference that is added
>> by handshake_dup. There are a handful of other fput() call
>> sites in netlink.c -- the idea is to hold sock->file until
>> DONE is complete.
>>
>> If anything we are double-putting if get_unused_fd_flags() fails:
>> the code invokes fput() once in handshake_dup, and once again
>> in handshake_nl_accept_doit().
>>
>> Perhaps that fput() should be removed.

Yes, it needs to be removed, as you already explained yourself. In case
get_unused_fd_flags() fails no additional reference is held any more.
The same is true if handshake_dup() succeeds but the hp_accept()
callback fails. Just in this case we won't be dropping the last
reference to sock->file with the above fput() but when 'fd' gets closed,
either explicit by a call to close(fd) or implicit on process termination.

In either case no additional fput() is needed and the current code is
broken in this regard as serving as a UAF primitive, likely exploitable
as sketched in [1,2,3].

The other fput() calls in netlink.c might need a closer look as well to
account for higher level protocol abuse like sending forged netlink
messages, e.g. HANDSHAKE_CMD_DONE messages with an invalid fd value
triggering fput(sock->file) for an unrelated 'sock'.

>>
> 
> Huh...  I can't remember why we wouldn't trust sock->file.  Maybe at
> the time I got confused by the double put bug as well and thought it
> was related to not trusting fd_install() stuff but actually it's just
> about reference counting.

Jepp. It's "just" a double fput() bug. The fd_install() related reuse of
'fd' is "fine" as userland can only mess with itself, not the kernel.

> 
> Here is the information about fd_install() but I think it doesn't apply
> in this case.  It's just the double put bug.
> 
> c72ea2050361 ("iio: buffer: Fix file related error handling in IIO_BUFFER_GET_FD_IOCTL")
> 46963e2e0629 ("misc: fastrpc: avoid double fput() on failed usercopy")
> a0f90c881570 ("drm/vmwgfx: Fix stale file descriptors on failed usercopy")
> f1ce3986baa6 ("nitro_enclaves: Fix stale file descriptors on failed usercopy")
> 
> I will make Smatch warn about this same line but as a use after free
> because of the reference counting.

Thanks,
Mathias

[1] https://www.openwall.com/lists/oss-security/2022/01/27/5
[2]
https://grsecurity.net/exploiting_and_defending_against_same_type_object_reuse
[3] https://github.com/opensrcsec/same_type_object_reuse_exploits

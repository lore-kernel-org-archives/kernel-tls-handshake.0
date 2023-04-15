Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCFF33C8
	for <kernel-tls-handshake@lists.linux.dev>; Sat, 15 Apr 2023 17:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681581433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7d2W1ucmVY/6X5FpK/ySjW9qzCCwXRXU+W4oYYj4ze4=;
	b=FFf2PerjBENnkU9tipqLSmGYhq36V6ZKiWaQfpeyn/M6SaelJsbfwKnilpKeM1JUVpFY02
	u9op4/xiHN09G+b6JNXtjv3vz10cvauRiGpgcJ47MAM/4qdlza6VWI3Agp2khKCz4WKyFv
	QyvCohuq+kQMcifxihoMQxTTqu2JEoA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-g_9-zYATOxSXr-QU5r4l4Q-1; Sat, 15 Apr 2023 13:57:12 -0400
X-MC-Unique: g_9-zYATOxSXr-QU5r4l4Q-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-74d96c33de9so3897085a.1
        for <kernel-tls-handshake@lists.linux.dev>; Sat, 15 Apr 2023 10:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681581432; x=1684173432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7d2W1ucmVY/6X5FpK/ySjW9qzCCwXRXU+W4oYYj4ze4=;
        b=gc2jb+xEjihHXwzD/Yr6Ll8JZ6jF+rd6vOWHl1ErVLjgeSG3xA4lKHn5sC0lG5l4z6
         klLWMFp91LJ6ivHoRMqL3JlIWmc+5os1zZ59SjRcoEDo8LTOzeWXs//9tFLbicoviqBt
         ysBSzfo+0zVlmHx6TnfmjKqvI7USgLMfmcCVwgRBIUuOnH/kZg8DgnE5s+q4aWhEx2dv
         nrSaGgKus9fTrh4ymPkUTShv0xpw/Zv11t8Liipz3vJa3x6KxNJPFbiD0KX452vjDntx
         I1mKpvU+P1LqHY0gLyg2O0Z5E2CF082TL/yUhxZl/3c7GFkwWYhENZRM0yYTxV7frAP0
         xwSA==
X-Gm-Message-State: AAQBX9cDNEINJGnyJr5Z8Y8WIOUNZ6igzh/kK8kD+P4ZUvtXl/ZGVcLV
	opm5c3Mi6S1ARi8qczdX0CswSTiaxoizxnnb4d1sZ4Me6V4SKd1VvfYJXMEewea1NxJEYqK5d5i
	1Lqux0wKm4L6y4wfh1II5j5CKj1LwQQd9yNLyMNAOTh8=
X-Received: by 2002:a05:6214:4108:b0:5ef:4de8:fb0d with SMTP id kc8-20020a056214410800b005ef4de8fb0dmr9284230qvb.5.1681581431876;
        Sat, 15 Apr 2023 10:57:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350a0LJs2yX5TaP6cbdJSo3Kip4+xNp9qB/ovWyuisS8eqL7q8NRk/Nz9OmzeCL/oEqX9P8pFNg==
X-Received: by 2002:a05:6214:4108:b0:5ef:4de8:fb0d with SMTP id kc8-20020a056214410800b005ef4de8fb0dmr9284214qvb.5.1681581431488;
        Sat, 15 Apr 2023 10:57:11 -0700 (PDT)
Received: from [172.31.1.12] ([70.105.248.80])
        by smtp.gmail.com with ESMTPSA id o8-20020a05620a2a0800b0074411b03972sm2021563qkp.51.2023.04.15.10.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Apr 2023 10:57:10 -0700 (PDT)
Message-ID: <0c7ba622-6c08-a8b5-8f88-6eb493d2a10b@redhat.com>
Date: Sat, 15 Apr 2023 13:57:09 -0400
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/4] nfs-utils changes for RPC-with-TLS
To: Chuck Lever <cel@kernel.org>
Cc: linux-nfs@vger.kernel.org, rick.macklem@gmail.com,
 kernel-tls-handshake@lists.linux.dev
References: <168009806320.2522.10415374334827613451.stgit@manet.1015granger.net>
From: Steve Dickson <steved@redhat.com>
In-Reply-To: <168009806320.2522.10415374334827613451.stgit@manet.1015granger.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/29/23 10:08 AM, Chuck Lever wrote:
> Hi Steve-
> 
> This is client- and server-side nfs-utils support for RPC-with-TLS.
> The client side support at this point is only a man page update
> since the kernel handles mount option processing itself.
> 
> The server implementation can support both the opportunistic use of
> transport layer security (it will be used if the client cares to),
> and the required use of transport layer security (the server
> requires the client to use it to access a particular export).
> 
> Without any other user space componentry, this implementation is
> able to handle clients that request the use of RPC-with-TLS. To
> support security policies that restrict access to exports based on
> the client's use of TLS, modifications to exportfs and mountd are
> needed. These are contained in this post, and can also be found
> here:
> 
> git://git.linux-nfs.org/projects/cel/nfs-utils.git
> 
> The kernel patches, along with the handshake upcall, are carried in
> the topic-rpc-with-tls-upcall branch available from:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git
> 
> Soon I hope to compose a new man page in Section 7 that will provide
> an overview and quick set-up guidance for NFS's use of RPC-with-TLS.
> 
> 
> Changes since v1:
> - Addressed Jeff's review comments
> - Updated nfs.man as well
> 
> ---
> 
> Chuck Lever (4):
>        libexports: Fix whitespace damage in support/nfs/exports.c
>        exports: Add an xprtsec= export option
>        exports(5): Describe the xprtsec= export option
>        nfs(5): Document the new "xprtsec=" mount option
Committed... (tag: nfs-utils-2-6-3-rc8)

Thank you this work!!!

steved.
> 
> 
>   support/export/cache.c       |  15 ++++++
>   support/include/nfs/export.h |  14 +++++
>   support/include/nfslib.h     |  14 +++++
>   support/nfs/exports.c        | 100 ++++++++++++++++++++++++++++++++---
>   utils/exportfs/exportfs.c    |   1 +
>   utils/exportfs/exports.man   |  51 +++++++++++++++++-
>   utils/mount/nfs.man          |  34 +++++++++++-
>   7 files changed, 219 insertions(+), 10 deletions(-)
> 
> --
> Chuck Lever
> 


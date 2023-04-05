Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE4028F1
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  5 Apr 2023 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680712817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gze+/zmDvL9jua4b7kzXJmGlwe0Way1JzAm4SbIpDiw=;
	b=aC81YXaVXMeZSRGyxhVDCnCk3iO4U/pd58iEFQX/eknv1+H7D+4GzHDb6tVNv8hFFC37z1
	wbseO6mUIfzq5XwyPGaHFkjem32haeYoN4MET76XemLLnz8rK1dzMM1EjZWjmEUf60+ToF
	eGJkfxnlHInLLHCSPjXTCsUWW9LoNEc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-ocKmH2p9PPSnuS_hPuNuMw-1; Wed, 05 Apr 2023 12:40:16 -0400
X-MC-Unique: ocKmH2p9PPSnuS_hPuNuMw-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-74610f3f19fso16979085a.0
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 05 Apr 2023 09:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680712816; x=1683304816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gze+/zmDvL9jua4b7kzXJmGlwe0Way1JzAm4SbIpDiw=;
        b=zA1vJtlHHstAlJfrAU1tZMO8ixEwbxo7uCWYJHudwNYIx3Gdc4pLg6sgWtxlax300f
         MqdYBqcUgw7nhadRTDG4hG8jkFSSjzFs8IwGoJ7M0fBbNnWqm2oVcskraXEKDVFxYAgg
         N85V2yLBx6nlryNu/h7W5bdGBUTWAlaG3+nnpY+dsYtJdqhpNZD3Az1Ks/V7o6yL9Y5R
         u1IUGa0vSYpOS7W1FIAouH025XSnxLcNvB/EKo9BkLvk8HQolRwYI2Ffzl6+97bDM/Q8
         76+dJ3mx4bQjZBMWMWYPkqnogTZ1qlNy4XgUWvat3SrpSz52zJLYuI+WqWzgn96MTrWG
         l0/g==
X-Gm-Message-State: AAQBX9fQRvDdP6MRBGqrP69wqfSz6sJBmSYqZK2+9qmNPYtHTsZXgP5f
	lWgZYu7EK0TYdTfJg15wjDagmGAPpSmJFMh9IuglzsaUkiDuRWSDBu5HrbkCPI0lbmLhaTjtg8F
	v2C7udIfd024+vOmr/uNP6i18v7ZA3nAfhio=
X-Received: by 2002:a05:6214:301b:b0:56e:f7dd:47ad with SMTP id ke27-20020a056214301b00b0056ef7dd47admr4465469qvb.5.1680712815743;
        Wed, 05 Apr 2023 09:40:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350adKIH0kcr8/KUDiCVePvJuTLVpxHg4L/jcNCGj3ryCKvBi7FXZQVxzJ0AzChSBprOvRPUfNg==
X-Received: by 2002:a05:6214:301b:b0:56e:f7dd:47ad with SMTP id ke27-20020a056214301b00b0056ef7dd47admr4465434qvb.5.1680712815332;
        Wed, 05 Apr 2023 09:40:15 -0700 (PDT)
Received: from [172.31.1.6] ([70.109.174.217])
        by smtp.gmail.com with ESMTPSA id 203-20020a3707d4000000b00742a23cada8sm4516818qkh.131.2023.04.05.09.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 09:40:14 -0700 (PDT)
Message-ID: <1c59beaf-63b6-ee39-b339-339a0c7e72b9@redhat.com>
Date: Wed, 5 Apr 2023 12:40:13 -0400
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
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

Hey Chuck,

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

Just wondering if these patch should wait until the kernel
patches reach mainline (aka rawhide)?

steved.

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


Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6DF6FA1
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  3 Apr 2023 15:51:13 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id m8so6485272wmq.5
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 03 Apr 2023 08:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680537071; x=1683129071;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7litT2ku0CKU9M7PH5y/5Y+4vyCKFBTn5xjvf/oTZA=;
        b=vZ3R10jPuIn0k1zbzMnEcZTECVtpjsI9eUEYX/Ioxn7S+kcoJVMdsdCC9JMzCXkbGK
         tnXcTK+uQ8miEtfR/Ng9Y/qKneQwrIQtp443CWb8Aeor9XzDsGP8SGvv2N/OEekE2EbU
         X5KAXx58BTMje5jpL8uh6PnDSOWtoeV5jJR2jf3s2irRLkrbvcvQQAYMZXKsLI0/2tgY
         ifKmHvGl30bDBSPEnf92tFNMFhixMrT7ajcKBoUedlQpJ+F3QMBLL5ZCxUrOcrR0450X
         g5ZvINSZ5cvNtd1U9wCySxXH+rqRKl1mzsy4C54fD4NMZ6GQO6Vx4w4koHxzfVuyhNU4
         zcUg==
X-Gm-Message-State: AAQBX9cEprtPv6PV/c0v4/Uwjj+HGSA5wviSY/d0q6twGQyZYylHuYG1
	rPRQrSO62xj4xNdfREClZkY=
X-Google-Smtp-Source: AKy350axQSLF/hDT9cyBm7N2x/F0vRpfgcI7KPkQaOL3AJPv/qmBdqmepUfbm4XQU7KMQjLPYkQ17A==
X-Received: by 2002:a05:600c:1c82:b0:3ed:d2ae:9adb with SMTP id k2-20020a05600c1c8200b003edd2ae9adbmr37206wms.0.1680537071615;
        Mon, 03 Apr 2023 08:51:11 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id u25-20020a7bc059000000b003ede06f3178sm12420692wmc.31.2023.04.03.08.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 08:51:11 -0700 (PDT)
Message-ID: <c7a07e1d-b300-dd1d-1be6-311666387820@grimberg.me>
Date: Mon, 3 Apr 2023 18:51:09 +0300
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
To: Jakub Kicinski <kuba@kernel.org>
Cc: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>,
 Boris Pismenny <borisp@nvidia.com>, john.fastabend@gmail.com,
 Paolo Abeni <pabeni@redhat.com>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-11-hare@suse.de>
 <634385cc-35af-eca0-edcb-1196a95d1dfa@grimberg.me>
 <20230330224920.3a47fec9@kernel.org>
 <7f057726-8777-2fd3-a207-b3cd96076cb9@suse.de>
 <44fe87ba-e873-fa05-d294-d29d5e6dd4b5@grimberg.me>
 <20230403075946.26ad71ee@kernel.org>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230403075946.26ad71ee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>>> Some of the flags are call specific, others may be internal to the
>>>> networking stack (e.g. the DECRYPTED flag). Old protocols didn't do
>>>> any validation because people coded more haphazardly in the 90s.
>>>> This lack of validation is a major source of technical debt :(
>>>
>>> A-ha. So what is the plan?
>>> Should the stack validate flags?
>>> And should the rules for validating be the same for all protocols?
>>
>> MSG_SENDPAGE_NOTLAST is not an internal flag, I thought it was
>> essentially similar semantics to MSG_MORE but for sendpage. It'd
>> be great if this can be allowed in tls (again, at the very least
>> don't fail but continue as if it wasn't passed).
> 
> .. but.. MSG_SENDPAGE_NOTLAST is supported in TLS, isn't it?
> Why are we talking about it?

Ah, right.

What I'm assuming that Hannes is tripping on is that tls does
not accept when this flag is sent to sock_no_sendpage, which
is simply calling sendmsg. TLS will not accept this flag when
passed to sendmsg IIUC.

Today the rough logic in nvme send path is:

	if (more_coming(queue)) {
		flags = MSG_MORE | MSG_SENDPAGE_NOTLAST;
	} else {
		flags = MSG_EOR;
	}

	if (!sendpage_ok(page)) {
		kernel_sendpage();
	} else {
		sock_no_sendpage();
	}

This pattern (note that sock_no_sednpage was added later following bug
reports where nvme attempted to sendpage a slab allocated page), is
perfectly acceptable with normal sockets, but not with TLS.

So there are two options:
1. have tls accept MSG_SENDPAGE_NOTLAST in sendmsg (called from
    sock_no_sendpage)
2. Make nvme set MSG_SENDPAGE_NOTLAST only when calling
    kernel_sendpage and clear it when calling sock_no_sendpage

If you say that MSG_SENDPAGE_NOTLAST must be cleared when calling
sock_no_sendpage and it is a bug that it isn't enforced for normal tcp
sockets, then we need to change nvme, but I did not find
any documentation that indicates it, and right now, normal sockets
behave differently than tls sockets (wrt this flag in particular).

Hope this clarifies.

Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC01179C6
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Mar 2023 15:24:08 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id o24-20020a05600c511800b003ef59905f26so12005981wms.2
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Mar 2023 08:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680189847; x=1682781847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VlGPtSrw2R8pqr0Pj4WWPKBB0VVInHmRW+IQGsnGCo8=;
        b=eEBvUGgxwm8u2IvqUJpm1LLW72u8Z7JSKcRse4FGQ6OintJt5Ee/GywcUjXScKk/LX
         zsGYBxkQYnk2VCVivG7Rvc9VwjRuuX3JFUCC48fxVZkC00ZhjpYWyjckC6iaeSNwFn5e
         ZbVZKMgjbuUL5riFvm3PB8zb00nhj6VfZjmES4SPK9hL97PWYxwceYk3QpidXUUIg2i4
         HwsswJSex/ID2cr6KUjVaXDmBOZVyBpDC4gAbOO1PMtg9DOQ2McxkvK+72ZHUn3HeatU
         JT72rBwCL3h/scoyALR1M6gUo345oBphxPUoLdpU8gz4sBg+lKphvnVtvw8j+Yz8jQJi
         Weuw==
X-Gm-Message-State: AAQBX9c28vig6LD1vNPY/Wrp89G5cDdSEH+VHyCR5GvOcoAiZtdAlOCO
	tSKYYCMNvxhIA5WTJnB2Q+E=
X-Google-Smtp-Source: AKy350Zp8ga7rUElh7ZS66R//b9iDODBzsxym/l0056NcE0QKDadMpst3XEgpILsxVkgH3yFbtEz4A==
X-Received: by 2002:a05:600c:4f4e:b0:3f0:330b:d316 with SMTP id m14-20020a05600c4f4e00b003f0330bd316mr3480367wmq.3.1680189846847;
        Thu, 30 Mar 2023 08:24:06 -0700 (PDT)
Received: from [10.100.102.14] (85.65.206.11.dynamic.barak-online.net. [85.65.206.11])
        by smtp.gmail.com with ESMTPSA id c9-20020a5d4cc9000000b002d21379bcabsm33073548wrt.110.2023.03.30.08.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 08:24:06 -0700 (PDT)
Message-ID: <634385cc-35af-eca0-edcb-1196a95d1dfa@grimberg.me>
Date: Thu, 30 Mar 2023 18:24:04 +0300
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
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>,
 Boris Pismenny <borisp@nvidia.com>, john.fastabend@gmail.com,
 "kuba@kernel.org" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-11-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230329135938.46905-11-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> kTLS does not support MSG_EOR flag for sendmsg(), and in general
> is really picky about invalid MSG_XXX flags.

CC'ing TLS folks.

Can't tls simply ignore MSG_EOR instead of consumers having to be 
careful over it?

> So ensure that the MSG_EOR flags is blanked out for TLS, and that
> the MSG_SENDPAGE_LAST is only set if we actually do sendpage().

You mean MSG_SENDPAGE_NOTLAST.

It is also a bit annoying that a tls socket dictates different behavior
than a normal socket.

The current logic is rather simple:
if more data comming:
	flags = MSG_MORE | MSG_SENDPAGE_NOTLAST
else:
	flags = MSG_EOR

Would like to keep it that way for tls as well. Can someone
explain why this is a problem with tls?

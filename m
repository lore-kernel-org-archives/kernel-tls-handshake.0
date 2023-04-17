Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0118460
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 15:10:24 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f16f792384so3149565e9.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 08:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681744222; x=1684336222;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TqlkhVbab+EjQ6gUsAOVQyNn+g6U3XFNNKE9iP//FAc=;
        b=EWE1WZPKKUstYgti57e0QlDK6xcZqpUwL7TjPdez7vFo3oiBEMrayz9krm10WM7WWA
         Z5S7tkSHPqhUgI3VIwFB9sz4n5pNfzRGtgPM6ZY3+0YsD+/bMwCP8MabUtIOSgiatSgj
         Yt7izf7GZxb8HbWt6aR7lwWRoALL4OBPK5pXgE7DkOxkCZMBREbSPpnUrj2ydETurj0f
         1MCXnPvCme/newvLTonOv38nPhAMm2lMVarNCE7NQ6q7RETcs4GKI/ypCcbtMhm4jV46
         ScEcz3VouO0XOc0nwhe6ankLRx6Wyiya+3h6D2KpuYNOOYX2cPvanAH/SA9MynJ7mNP9
         QWAg==
X-Gm-Message-State: AAQBX9eMsWf8VLYldbEj1/+S0QeeiHkXqB93GtHlso3YOJb6Z3gVhfeP
	tch+PS50JGgV+dRoyFISjcY=
X-Google-Smtp-Source: AKy350bS1RdQSAJcWSf6GDd+f2TwRNo1jDZJcMYugxATqOBRJKk038NTj7YhzNZivac70zjR80eX+A==
X-Received: by 2002:a05:600c:6025:b0:3f1:75a5:a369 with SMTP id az37-20020a05600c602500b003f175a5a369mr1499695wmb.3.1681744222332;
        Mon, 17 Apr 2023 08:10:22 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id c7-20020a05600c0a4700b003ef4cd057f5sm16192594wmq.4.2023.04.17.08.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 08:10:22 -0700 (PDT)
Message-ID: <36976756-b4c5-f2a5-34b8-e9731a49c477@grimberg.me>
Date: Mon, 17 Apr 2023 18:10:20 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 08/18] nvme-tcp: do not set MSG_SENDPAGE_NOTLAST
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Jakub Kicinski <kuba@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev
References: <20230417130302.86274-1-hare@suse.de>
 <20230417130302.86274-9-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230417130302.86274-9-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

nak from me.

> MSG_SENDPAGE_NOTLAST was introduced with commit 35f9c09fe9c7
> ("tcp: tcp_sendpages() should call tcp_push() once") to fix issues
> with the ->sendfile() call, and the implication seems to be that
> the flag should be strictly internal to sendfile.

no, the use case was to allow sendpage consumers to build larger
tso packets for large payloads (splice being the primary one), nvme-tcp
also benefits from it (as do others), just like sendfile.

> Hence we shouldn't be setting it on nvme-tcp, and anyway doing
> so will cause TLS sending invalid data.

That is something else. I don't recall the full details on the
discussion with Jakub, but it was not my intention to strike
it altogether, just remove it if !sendpage_ok.

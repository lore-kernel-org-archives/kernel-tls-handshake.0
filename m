Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB1E6FA1
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  3 Apr 2023 15:53:58 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-2cfe3278da7so541903f8f.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 03 Apr 2023 08:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680537237;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ClRkonRNBH8O7NdfUT93YUzudQLnZcGd0jMnr/kHGA=;
        b=tBXdV73BEOmJLt0eMfNabpZsb0KcKoNAVrayy+jiWRIUsAAaTWtsiKUnFToBlXPDZ4
         e433bKmst0GDUbAz0baw7jnFwFtIp/6ZwCH84pwc6wZsQcgUSxExSH6kpbTYxB5uMC61
         c96QME974rDHyVcBXQArTYCEA/z8LAG+vtv2S3wlrPNvoE3G4/Ijuaf45QuF1+TV5TFn
         j/EV4tW9Sts0nYIpLffTIQpvvb2gz1oAW0ALMbjIkfNQKwFuYxa+6mn+nIwK0Xie6RkZ
         a6C/R2Yhe8E+ZrEZG92HvuE8OVCZg7hR2E671yxA0650c/RBHIIo40piNU+3eXwv2UAu
         mV3w==
X-Gm-Message-State: AAQBX9fukOFoVOtahALVMPcqeqZyDV8mUIKD5ylpJh8OL9P4L28aXibt
	eJmsxyvFOKotJCyvYgwu0Mc=
X-Google-Smtp-Source: AKy350abIeRfp3sEfbHUjS/39EXa4otYzwWvSMb2ZrNYUeahOFNo1/FAI48z8LrzEstVbJv5En/THQ==
X-Received: by 2002:a05:600c:4fc9:b0:3ef:7bc5:4e14 with SMTP id o9-20020a05600c4fc900b003ef7bc54e14mr12422421wmq.4.1680537236960;
        Mon, 03 Apr 2023 08:53:56 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id y5-20020a1c4b05000000b003edd1c44b57sm12455105wma.27.2023.04.03.08.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 08:53:56 -0700 (PDT)
Message-ID: <1b018791-9aa3-b988-7045-40b46bc50989@grimberg.me>
Date: Mon, 3 Apr 2023 18:53:55 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 18/18] nvmet-tcp: add configfs attribute 'param_keyring'
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-19-hare@suse.de>
 <60ff89b4-5d63-a6db-18b1-e0f28055c5d9@grimberg.me>
 <c7e895f1-1c95-f658-f7a1-c4cee5cf8c91@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <c7e895f1-1c95-f658-f7a1-c4cee5cf8c91@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>> Add a configfs attribute to list and change the default keyring.
>>
>> is the keyring an attribute of a port? or a subsystem? Why the choice
>> of making it per port?
>>
> As per discussion at fmds each port might want to use different 
> credentials.
> We can move it to subsystems if we decide we don't want to support that 
> use-case.

I think we should move it to the subsystem in Linux.

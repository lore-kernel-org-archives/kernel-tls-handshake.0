Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E05D8460
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 15:14:25 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f1754e6ac2so1304565e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 08:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681744464; x=1684336464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IBMj2PoAC8po2jTTXF/lcftntgqScghL6weij5Q4iOk=;
        b=SJVBZxRN46DFZ9HGtql3GaNf4s75x+JWd8eeBuL/a0dCLdUgNE+sUKYfou6k3HPpmw
         UjggDSEFxBlqu3cC8gpR3slLKiK1eDdoVqUECdwthypSmCzEQCqPXWbgtPDPAf/e68S/
         IwRtUIp3n5ZM+xe4gNBb0R03zZ5L4Qqs+2j/dJjbdO4GF+NisS3YboOUcuyr/FpzhPwp
         6YT6aoeeFdguI4HfTxHd1CNn19Dm2/ZyfQyHyQcl9q6X3oE8gUzKupN7bk+L4OtyxkoB
         1cnDbVhqxc8b2OkjfG/jq/nPWLQIcxkcbKj9l2u+8Xg3ll9LM4b5OC8k+Mp74z110/QB
         olDA==
X-Gm-Message-State: AAQBX9cTgVDaG6pGH8CXSW+vx1B5HSdF62Z5HQSdmvKhQQJBQ1kLcj/t
	avZ1ao2+Dg+bhsCiezq13x0=
X-Google-Smtp-Source: AKy350bpXc+yI3Gdn3/cA+cAl4pjIHePGshs7NAiTjBUBlqie0F/fP4QMzwSiUyx7eymTQ0dMqBJ3A==
X-Received: by 2002:a05:600c:1ca6:b0:3f0:9deb:c60a with SMTP id k38-20020a05600c1ca600b003f09debc60amr8463391wms.4.1681744463802;
        Mon, 17 Apr 2023 08:14:23 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id s9-20020a05600c45c900b003f09d51a4edsm16105909wmo.48.2023.04.17.08.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 08:14:23 -0700 (PDT)
Message-ID: <e8912f5b-c523-a682-f28e-fa89872df58f@grimberg.me>
Date: Mon, 17 Apr 2023 18:14:22 +0300
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 06/18] net/tls: implement ->read_sock()
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev,
 Boris Pismenny <boris.pismenny@gmail.com>
References: <20230417130302.86274-1-hare@suse.de>
 <20230417130302.86274-7-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230417130302.86274-7-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Implement ->read_sock() function for use with nvme-tcp.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> Cc: Boris Pismenny <boris.pismenny@gmail.com>

This needs a review from Jakub/Boris/John...

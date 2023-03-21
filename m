Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3EC10E9
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 13:12:54 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id t5so22654459edd.7
        for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 06:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679404372;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uje3LCySfaQlUQjhZYuiWJYvV7rBiSMPGA/U2mclzvI=;
        b=DQNELjAeGUtMFkCiInHd4dfutCbWPz3gj0teJRYfcGEm37mwijvY3MBW//av2POV2A
         2OQYCLWDlj8wxe1IHXlRGbzxy5bCDsoro4hghkMBI5y73D+Exwp5GObGdgOSt8pNKCgG
         Xu60Aw0S7Ip6BrPFzhfXNn2r/QpTcAl7GGNR2jFaM/+3VX1XM2/drDaNwBKYKrgt4ZFW
         fBw1dBd79YCm6QFjup9cD6l69jXRLqOlsmUWnIbGQVDTH6KtGQ3RA2j6g4Hyk99wcolt
         EUMK1YgOAT5yHxZHoNEspKb4EOrTmlvT8Z9kJdWj3hX9VTNZ3eRr0wyC9WA2Wju946Qd
         nVYA==
X-Gm-Message-State: AO0yUKVXGzeBDh/LPaNsvoFgPk8yUEA0NZxD3NdLRfJBKD/ZAWkKS9ej
	qqclsR3sXJVbeGsTZKLpW9c=
X-Google-Smtp-Source: AK7set8t2cDe6tzSHXZ3HbzW8I77f3FAVLiW1Tlu7OQxrCGjAKsft2jxUSmevWStyWgdBID0qaAA6Q==
X-Received: by 2002:a17:906:2252:b0:92f:38a6:d087 with SMTP id 18-20020a170906225200b0092f38a6d087mr2367546ejr.4.1679404372264;
        Tue, 21 Mar 2023 06:12:52 -0700 (PDT)
Received: from [10.100.102.14] (85.65.253.165.dynamic.barak-online.net. [85.65.253.165])
        by smtp.gmail.com with ESMTPSA id ml23-20020a170906cc1700b0092ce8344078sm5821362ejb.33.2023.03.21.06.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 06:12:52 -0700 (PDT)
Message-ID: <98884644-99f3-7b3c-387a-66fbdd98d4ed@grimberg.me>
Date: Tue, 21 Mar 2023 15:12:50 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 00/18] nvme: In-kernel TLS support for TCP
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230321124325.77385-1-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Hi all,
> 
> finally I've managed to put all things together and enable in-kernel
> TLS support for NVMe-over-TCP.

Hannes (and Chuck) this is great, I'm very happy to see this!

I'll start a detailed review soon enough.

Thank you for doing this.

> The patchset is based on the TLS upcall mechanism from Chuck Lever
> (cf '[PATCH v7 0/2] Another crack at a handshake upcall mechanism'
> posted to the linux netdev list), and requires the 'tlshd' userspace
> daemon (https://github.com/oracle/ktls-utils) for the actual TLS handshake.

Do you have an actual link to follow for this patch set?

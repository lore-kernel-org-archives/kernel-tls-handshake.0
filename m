Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA4F5683
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  3 Apr 2023 13:03:16 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id n19so17081903wms.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 03 Apr 2023 06:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680526994; x=1683118994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ixef6iu509BbU/eA3x9h6zTU0gboEx253oUuoAO+LU=;
        b=7MNj2+77MetRmbYYfbpJ4Kn6mP0HYu3keidaTj0JX4x2ubMO95esUzEjRK3bmdVBPb
         lift2au0j17vYY0zZLIQCXjjqG74YWMJrHz6hx7A6TRvoWh7KxnhsnqTDgNDLPUa/LRn
         RnVA+MfO+RL5ahD5nZtgTyxadj6T59h7gP2bR8VsHVnUpz+hX5sWMfxo2jjS3SymAM8u
         XmfiSOx3a7GfmdBlKkr7HkaGukA/yF5BMPQAcJUUXGB02/qj5uuqmYVG4lVA+f4ii1jS
         CB4oBVajlc+cJc3pH0KsaMXoDkzImn/Cdm3F2QV/M2FoQxO5Fifsun2gIxt4L98e3Y6i
         KIkQ==
X-Gm-Message-State: AAQBX9dYaQRm1YApZhIDiipLjZPZsBLE7RILZO8JCpM7dF9UN2KsawtS
	Iuzp4PLeQugqbnkZRfBxHBo=
X-Google-Smtp-Source: AKy350ardo2Pog514uByZ446mtmSmnm5bo9ea27wJWtbDP8DjsFUSyj2AIDVRrvMc59l6RBjmBcRrQ==
X-Received: by 2002:a05:600c:3503:b0:3ef:7795:e5b1 with SMTP id h3-20020a05600c350300b003ef7795e5b1mr18329257wmq.4.1680526994489;
        Mon, 03 Apr 2023 06:03:14 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c358c00b003ef6f87118dsm19787750wmq.42.2023.04.03.06.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 06:03:14 -0700 (PDT)
Message-ID: <60ff89b4-5d63-a6db-18b1-e0f28055c5d9@grimberg.me>
Date: Mon, 3 Apr 2023 16:03:12 +0300
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
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230329135938.46905-19-hare@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Add a configfs attribute to list and change the default keyring.

is the keyring an attribute of a port? or a subsystem? Why the choice
of making it per port?

Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F136111BC
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  8 May 2023 21:01:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 60C2721D40;
	Mon,  8 May 2023 21:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683579691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UKC+JKlCC60bjHNXRiHZI7ynBkY1nRGEcQd2Yz4B+AE=;
	b=QUQJ4nTmY6T3mtvZNH5sF2SOP25s70xzGb21d3UHFaYe6oZlKR/LUbw9A7WTqnaPZEsGla
	CBHp3ZXNS+rSoBLvEQiGMU9LV+dWGpyVDduUAp0/Y6coxZyFv9TLT4prUQWYsgkJJ7kY1f
	tWd9IJmJBl8xj0e7i+fS+f64L16cVuc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683579691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UKC+JKlCC60bjHNXRiHZI7ynBkY1nRGEcQd2Yz4B+AE=;
	b=lTZJEY3sPqVJgYyCIeptVdfpH3Y2OsHiy09aI5W9tEG/WDzxgkd4racUeRYXwfoYnZoxRt
	SqUYq8B746cyscDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 97D7F1346B;
	Mon,  8 May 2023 21:01:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id tRZPGyljWWTqOwAAMHmgww
	(envelope-from <hare@suse.de>); Mon, 08 May 2023 21:01:29 +0000
Message-ID: <a4eb99fb-cb66-daea-e292-a379bbdf0dc1@suse.de>
Date: Mon, 8 May 2023 23:01:27 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 03/17] nvme: add TCP TSAS definitions
Content-Language: en-US
To: Max Gurtovoy <mgurtovoy@nvidia.com>, Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev
References: <20230419065714.52076-1-hare@suse.de>
 <20230419065714.52076-4-hare@suse.de>
 <76dda7eb-55a6-e2fc-677a-05d08de738be@nvidia.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <76dda7eb-55a6-e2fc-677a-05d08de738be@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/8/23 18:36, Max Gurtovoy wrote:
> Hi Hannes,
> 
> On 19/04/2023 9:57, Hannes Reinecke wrote:
>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>> Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
>> ---
> 
> can we find one sentence for the commit message please ?
> Maybe describe about the handshake and sectype ?
> 
Sure.

'Add TCP TSAS definition from NVMe TCP Transport specification 1.0'
?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


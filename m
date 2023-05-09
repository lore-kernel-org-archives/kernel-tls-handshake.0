Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891438BE3
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  9 May 2023 14:14:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DCBC521998;
	Tue,  9 May 2023 14:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683641647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IFlFwtqLT1wxihYwZ4BRih/ZzA3eSgJo0IVyqxNOjGQ=;
	b=XIqyMKFZp+ThPNuRQdL7XN0hHliU5+VZi/qJw3wriWuxlWrkzqYWU6H38BPrR31x7BIv16
	oUy/uMzu0JuM37TmX5wKMi+goCYuZUqQ93W/D5V7VpEQPS/kq9LBIv7215brH/ayJRZeA2
	yQ9M64hg9u5oflPcNiYuv/KaR4Ishmk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683641647;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IFlFwtqLT1wxihYwZ4BRih/ZzA3eSgJo0IVyqxNOjGQ=;
	b=hKGzjCf+tyoCuIT3kKSPHlDo6zHPrxsghUvCQYDLBogI01Ds4vg/5hRRD8bXaKBCGKYbbf
	17Sq8vSworvehTBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1FAB139B3;
	Tue,  9 May 2023 14:14:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 13igMS1VWmQwAwAAMHmgww
	(envelope-from <hare@suse.de>); Tue, 09 May 2023 14:14:05 +0000
Message-ID: <49b4eace-5b74-0b19-2e03-72e8a9a7eed9@suse.de>
Date: Tue, 9 May 2023 16:13:59 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 05/17] nvme-keyring: implement nvme_tls_psk_default()
Content-Language: en-US
To: Max Gurtovoy <mgurtovoy@nvidia.com>, Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev
References: <20230419065714.52076-1-hare@suse.de>
 <20230419065714.52076-6-hare@suse.de>
 <79ecbedd-9392-cc0f-dd7f-37668cd67d3d@nvidia.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <79ecbedd-9392-cc0f-dd7f-37668cd67d3d@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/9/23 09:31, Max Gurtovoy wrote:
> Hannes,
> I wonder if we can squash the keyring patches 1/17 + 2/17 + 5/17 to a 
> single patch ?
> And start the series with some preparations in the nvme/tcp for it to 
> compile..
> This will reduce the amount of commits and simplify the review.
> 
Sure, will do so for the next round.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


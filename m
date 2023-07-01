Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E95442F
	for <kernel-tls-handshake@lists.linux.dev>; Sat,  1 Jul 2023 08:46:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DE9D121836;
	Sat,  1 Jul 2023 08:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688201197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xZLm7V+57zfNGolFbhMoC/xW/CSmxnOxoPkUubWkAxs=;
	b=bKuR1bGMLodb8HJ2rQ63FrV5Wp6Y0p2KOOAgIWuteZVxOLHzk9BTcsupMRVoqwsd6nONMK
	QBMkPQA9okofG/WZSYP/le+ZCRVmbsLFPtKxW5OgQmxxVRibirIoR28MQPjwedrzNkSDYw
	vx7SB9ooHPCO236FlpZ7XDEZxXgk9S0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688201197;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xZLm7V+57zfNGolFbhMoC/xW/CSmxnOxoPkUubWkAxs=;
	b=Qf+WM0SuiJI3k44UT7SNauj5JOBaOrYPetmawMPDDRZomfk/XVaCfoeiJLB7FYlca7U0Qn
	vpUhiUNEPUiVcdBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C8FBE13638;
	Sat,  1 Jul 2023 08:46:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IVDfL+3nn2TqEQAAMHmgww
	(envelope-from <hare@suse.de>); Sat, 01 Jul 2023 08:46:37 +0000
Message-ID: <84d5d1d7-58f6-e7e3-9e96-22144ad3a71d@suse.de>
Date: Sat, 1 Jul 2023 10:46:37 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>
From: Hannes Reinecke <hare@suse.de>
Subject: OpenSUSE package available
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

I've managed to create an openSUSE rpm for ktls-utils:

https://build.opensuse.org/package/show/home:hreinecke/ktls-utils

As there's a change request open with our product management I guess 
it'll be appearing in our 'official' repositories for Tumbleweed and 
Leap in due course.

Cheers,

Hannes

-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman

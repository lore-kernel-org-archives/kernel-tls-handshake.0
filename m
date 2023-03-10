Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B5E8493
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 10 Mar 2023 17:11:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B26E220660;
	Fri, 10 Mar 2023 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678468304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AoKOBpom8PXZMFBNDnUSrKaFfrPvPSuXVw6lHv6tpTY=;
	b=Tj8sUWi+4ISvdSkr2x/zg5eBxhQTfdr25GPUX6ztVtqJ1sud+8z7cqzBQNHJ2WwLyKAGCH
	SrmAg02FbhXu2yJqss8Avl7OnNVKGcq/cvLvv4wUumEhIkKNtFlhe3SoSKozu0Ra2bbk+Q
	QGu8X92XUEBDxH4LfPgj42SOcMSjKcU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678468304;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AoKOBpom8PXZMFBNDnUSrKaFfrPvPSuXVw6lHv6tpTY=;
	b=75zwJ1kfdPH5KBGtWXsU8otz09jWQdGDU5ENkva/OsM3lRhsxXd56D5BvZV8cYyAPJdqps
	12MVDl1qG+2PKjBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9FD1D13592;
	Fri, 10 Mar 2023 17:11:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UoejJdBkC2QdOgAAMHmgww
	(envelope-from <hare@suse.de>); Fri, 10 Mar 2023 17:11:44 +0000
Message-ID: <7e6a350f-e4b8-c245-83bf-a4ccca2f46bc@suse.de>
Date: Fri, 10 Mar 2023 18:11:43 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>
From: Hannes Reinecke <hare@suse.de>
Subject: psock patch
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chuck,

for the previous accept()-based patch series you had a
patch 'net: Add distinct sk_psock field', claiming that it
was required to get kTLS and any other ULP using sk_user_data
to run.
What happened to it?
Is it still required?

Reason I'm asking is that I'm seeing odd stalls during encrypted traffic
(command timeouts etc), whereas the TLS connection itself seems
to be happy.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman

Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6462129A5
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Mar 2023 11:26:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A90E21FDA6;
	Thu, 16 Mar 2023 11:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678965996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nUUejg+yGImd3JmGtj03FBC3rHGltojuKENwMf6ZJ/Q=;
	b=apO8oX92yee9TPzHJ3nEFq/Gfc5L+l4tABHPPJ0pVhKi0NI0AyCnJVfVQDGbt/7eraZGce
	GIYOC5toCh8Hf1hPy6VbeDv7FTc+RIzfZnkb7rONcMNfR4pTJd51iS5qAgpk5tmpbeSmSt
	oabJGvhnL1X94+oUUxmCsWpRBJcmAz8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678965996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nUUejg+yGImd3JmGtj03FBC3rHGltojuKENwMf6ZJ/Q=;
	b=K+0ZCHzU3/fHI+8oKhAXDK1OCs6odktoXts5Um0rMy8EviJtycQjZ7Sn3oplYdtfebvfkG
	jCly40RVL440k7CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7CD80133E0;
	Thu, 16 Mar 2023 11:26:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +tqhG+z8EmTzAwAAMHmgww
	(envelope-from <hare@suse.de>); Thu, 16 Mar 2023 11:26:36 +0000
Message-ID: <7464fd83-7cfa-d075-71a4-6ff6ed73529d@suse.de>
Date: Thu, 16 Mar 2023 12:26:36 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Chuck Lever <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>
From: Hannes Reinecke <hare@suse.de>
Subject: sk_data_ready callback restore
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chuck,

some good news; my prototype is up and running and seems to be happy 
with the infrastructure:

nvme nvme0: connecting queue 0
nvme nvme0: queue 0: start TLS with key 389e6cd5 keyring 23836d8b
nvmet_tcp: queue 0 hdr type 22 hlen 1 plen 33554719 size 128
nvmet_tcp: queue 0: TLS ServerHello
nvmet_tcp: queue 0 wakeup userspace
nvme nvme0: queue 0: TLS handshake done, key 389e6cd5, status 0
nvmet_tcp: queue 0: TLS handshake done, key 389e6cd5, status 0

but there's one question: in order to get this to work I had to
set the sk_data_ready() callback before starting the TLS handshake.

queue->data_ready = sk->sk_data_ready;
sk->sk_data_ready = nvmet_tcp_tls_data_ready;

That works, but it's getting tricky once the TLS handshake is done.
Naively I would have thought that I need to reset the sk_data_ready()
callback

sk->sk_data_ready = queue->data_ready;
queue->data_ready = NULL;

But as I'm paranoid I've check whether I'll be resetting the correct
sk_data_ready() callback:

WARN_ON(sk->sk_data_ready != nvmet_tcp_tls_data_ready);

before resetting.
And, surprise, surprise, that WARN_ON triggers.
Probably understandable, as kTLS is changing the callbacks, too.

Leaving the question: how do I _disable_ my sk_data_ready() callback?
Just blindly reassigning the original callback clearly is not a good 
idea, but doing nothing would mean that my callback will be left in 
place during the entire connection, which also is not a good idea.
So what is the correct way of disabling the callback?

Cheers,

Hannes

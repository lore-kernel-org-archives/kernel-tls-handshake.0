Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145E19460
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 14:11:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4CD3621F53;
	Tue, 21 Mar 2023 14:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679407881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ePiq7va0x5areFcuFXjjnfAa9NRdJMeLSW7bfAF5kh8=;
	b=X/nMArOlfJi6zQaptRnOh7DtSq/8izPrVK4WpaewKg06oLDy0DbPzBMFLatwABbuYiXvI2
	pTyJO46tx1+X6EuqibKcunEcCDzA/S0VYuAcMHSjcWUu1ZKbKLeZ6ne0ddcueWrzGmekAC
	LLf7H7YyBFgfig3axU67YvGKcIbjHe8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679407881;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ePiq7va0x5areFcuFXjjnfAa9NRdJMeLSW7bfAF5kh8=;
	b=bjJWFvKTR+ke0CRoMZQH3w0KK2+ZHPGZs6s609nCaqDVNfEUtghnYI1sIVXDJ+hMhDBSbM
	t1iXfyOLgR/pmkBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 34AD613451;
	Tue, 21 Mar 2023 14:11:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6D/kCwm7GWR8KQAAMHmgww
	(envelope-from <hare@suse.de>); Tue, 21 Mar 2023 14:11:21 +0000
Message-ID: <714930e3-fb46-191f-60b9-b5a29728842a@suse.de>
Date: Tue, 21 Mar 2023 15:11:20 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/18] nvme-keyring: register '.nvme' keyring
Content-Language: en-US
To: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-2-hare@suse.de>
 <08f5a168-3a15-2276-f472-dee926378e65@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <08f5a168-3a15-2276-f472-dee926378e65@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/21/23 14:50, Sagi Grimberg wrote:
> 
> 
> On 3/21/23 14:43, Hannes Reinecke wrote:
>> Register a '.nvme' keyring to hold keys for TLS and DH-HMAC-CHAP.
>> We need a separate keyring as for NVMe the might not be a userspace
>> process attached (eg during reconnect), and so the use of a session
>> keyring or any other process-related keyrings might not be possible.
> 
> So the keys will be stored in the ring such that on any reconnect
> userspace will have access to these keys? How does this affect 
> dh-hmac-chap keys?
> 
Correct.

And it does not affect dh-hmac-chap handling as that implementation 
doesn't use keyrings (yet). That's another patchset which is in the works.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		           Kernel Storage Architect
hare@suse.de			                  +49 911 74053 688
SUSE Software Solutions Germany GmbH, Frankenstr. 146, 90461 Nürnberg
Managing Directors: I. Totev, A. Myers, A. McDonald, M. B. Moerman
(HRB 36809, AG Nürnberg)


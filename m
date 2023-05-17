Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D7DAD21
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 17 May 2023 07:59:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 554F5228F3;
	Wed, 17 May 2023 07:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1684309991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1lqI1s0lbYIUlRUVOqcIBd+WLzDE3puDGbCjIrTHNBA=;
	b=0ChX0wAqQHudy/JLOBEoJUsL/SyuGPIDr8QiMZTpbehBWlPOEal3helSzUBZ2efkasvMNu
	HU0/n2RM7D/iWI8AmteX/rGsYlpcmh0zVaFOc4eE8DPo4ICrY3wNz0GRvnuBtzt5NGskBo
	SRz9QGYlnlF3BLPPgs5ZM+DwcDNhGB4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684309991;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1lqI1s0lbYIUlRUVOqcIBd+WLzDE3puDGbCjIrTHNBA=;
	b=vym4S3NRrwDkI6f75Bl5hKVR7iW6jevX0fH3tGeDuo2NIzY93EXJn+j+tb611ZdkCgMPaw
	QEuJ4AvxDTQWWZCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0801D13358;
	Wed, 17 May 2023 07:53:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Z9zeAOeHZGThGQAAMHmgww
	(envelope-from <hare@suse.de>); Wed, 17 May 2023 07:53:11 +0000
Message-ID: <c711fc3b-08c4-6673-0f22-f73bf377a072@suse.de>
Date: Wed, 17 May 2023 09:53:10 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 06/17] net/tls: implement ->read_sock()
Content-Language: en-US
To: Sagi Grimberg <sagi@grimberg.me>, Jakub Kicinski <kuba@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev,
 Boris Pismenny <boris.pismenny@gmail.com>
References: <20230419065714.52076-1-hare@suse.de>
 <20230419065714.52076-7-hare@suse.de>
 <da7135cf-c96e-f79f-9d49-87ee269871cf@grimberg.me>
 <20230509174724.4a198306@kernel.org>
 <0097e7c0-351a-b922-dd77-ab414b53170b@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <0097e7c0-351a-b922-dd77-ab414b53170b@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/17/23 08:43, Sagi Grimberg wrote:
> 
>>> Can we get an ack (or review) from you on this?
>>>
>>> The only consumer of this is nvme, and seems to at least
>>> work on the limited testing this series has seen.
>>>
>>> We can take this piece from the nvme tree or not, whatever
>>> you prefer.
>>
>> Let's get all the TLS patches posted to netdev, reviewed there,
>> then we can put them on a branch on top of -rc1 and they can
>> be pulled into both netdev and nvme tree.
> 
> Hannes,
> 
> Are you planning to resubmit the series soon? Please make sure
> to CC netdev on the next round.

Yes, and no.
Problem is the MSG_SPLIC patchset from David Howells; that essentially 
does away with ->sendpage().
So I'm not sure how to go from here; wait for the patchset to land, and 
rebase my patches on top of that, or proactively switch away from 
->sendpage() and resubmit directly.
Thoughts?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


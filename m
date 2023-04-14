Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583567C
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 14 Apr 2023 10:31:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7B5831FD93;
	Fri, 14 Apr 2023 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681468259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x/rVxwmuhdoXjph7m3KFQaaxQ03CPZ8xng6hMKv1qM8=;
	b=fD2GWcOYUW7dLr3AZS33c9W0k3eI3Q22fLjAbwCJnQNxH8OESeSJY3tTx7yePcIfXsDiA2
	7xVOYvrWrusXUNfYhXiLZLt1hk+F6DV6shKIOypCioZqqUrgNJbyKssdFF+zjxigP0NjlI
	T3e9ouPfbliQbNZIaO9RRyR2FdJzecg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681468259;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x/rVxwmuhdoXjph7m3KFQaaxQ03CPZ8xng6hMKv1qM8=;
	b=bC/apYcRbNGMfsqACwDKZKP0ljGQzFi7tqJVShsGD4NAPIM90gcmb5snxKCAF9xoHT6OCs
	V52YX8B/1V/Y3dDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 645BF139FC;
	Fri, 14 Apr 2023 10:30:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id vossGGMrOWSgKgAAMHmgww
	(envelope-from <hare@suse.de>); Fri, 14 Apr 2023 10:30:59 +0000
Message-ID: <02e4f6eb-32c2-8f3c-872f-831e70da6166@suse.de>
Date: Fri, 14 Apr 2023 12:30:58 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 18/18] nvmet-tcp: add configfs attribute 'param_keyring'
Content-Language: en-US
To: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-19-hare@suse.de>
 <60ff89b4-5d63-a6db-18b1-e0f28055c5d9@grimberg.me>
 <c7e895f1-1c95-f658-f7a1-c4cee5cf8c91@suse.de>
 <1b018791-9aa3-b988-7045-40b46bc50989@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <1b018791-9aa3-b988-7045-40b46bc50989@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/23 17:53, Sagi Grimberg wrote:
> 
>>>> Add a configfs attribute to list and change the default keyring.
>>>
>>> is the keyring an attribute of a port? or a subsystem? Why the choice
>>> of making it per port?
>>>
>> As per discussion at fmds each port might want to use different 
>> credentials.
>> We can move it to subsystems if we decide we don't want to support 
>> that use-case.
> 
> I think we should move it to the subsystem in Linux.
> 
Easier said than done.

We can only fetch the subsystem once we have the NQN, which we will
know after the connect command.
But out of necessity the connect command will only be transferred
after TLS handshake completed, so there is not subsystem NQN allowing
us to figure out the correct subsystem.

So we'll have to keep it at the port level, I'm afraid.

Cheers,

Hannes


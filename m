Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5A57C
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  5 Apr 2023 06:32:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F3FB4229B1;
	Wed,  5 Apr 2023 06:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680676345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SDi7jTnrPialMmk53o+/qu+PZf3xFKvnIKRCarR0d9k=;
	b=KD1kFJw9rGxwEogwSS/QS4/r21QBkPiMphh4+6N1nCI0IkSTPSz/lEav63sTRssAoN+nO7
	D+0K2Hw/eQOE20N6VRqN/LlMpgMZlYg+e6VBg5IsaH12dRfJgpqjWRXYLBSVbWQY5BLmf5
	WwYRQ0B3avxj91/u911vS0w/bf/pM54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680676345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SDi7jTnrPialMmk53o+/qu+PZf3xFKvnIKRCarR0d9k=;
	b=avY3yoYEFJigO1mQGk42wNixpEvHRg27D2i+6jcciajAhCwawvsG3xwMgkjypUCglC8SZ3
	N6va3b55bFXcVVDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 61DBB13A10;
	Wed,  5 Apr 2023 06:32:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uIosFPgVLWR/AwAAMHmgww
	(envelope-from <hare@suse.de>); Wed, 05 Apr 2023 06:32:24 +0000
Message-ID: <7dc57e79-bba4-edb3-28ee-60293bcaa9cd@suse.de>
Date: Wed, 5 Apr 2023 08:32:23 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 1/4] net/handshake: Create a NETLINK service for
 handling handshake requests
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
Cc: Chuck Lever III <chuck.lever@oracle.com>, Paolo Abeni
 <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Boris Pismenny <borisp@nvidia.com>,
 "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>,
 "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>, John Haxby <john.haxby@oracle.com>
References: <168054723583.2138.14337249041719295106.stgit@klimt.1015granger.net>
 <168054756211.2138.1880630504843421368.stgit@klimt.1015granger.net>
 <63A1FBC9-8970-4A36-80B1-9C7713FF1132@oracle.com>
 <4dde688e-21db-6cc6-080e-c451eac2a9ca@suse.de>
 <20230404170035.6650027d@kernel.org>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230404170035.6650027d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/5/23 02:00, Jakub Kicinski wrote:
> On Tue, 4 Apr 2023 17:44:19 +0200 Hannes Reinecke wrote:
>>> We're still seeing NULL pointer dereferences here.
>>> Typically this happens after the remote closes the
>>> connection early.
>>>
>>> I guess I cannot rely on sock_hold(sk); from preventing
>>> someone from doing a "sock->sk = NULL;"
>>>
>>> Would it make more sense for req_submit and req_cancel to
>>> operate on "struct sock *" rather than "struct socket *" ?
>>>    
>> Stumbled across that one, too; that's why my initial submission
>> was sprinkled with 'if (!sock->sk)' statements.
>> So I think it's a good idea.
>>
>> But waiting for Jakub to enlighten us.
> 
> Ah, I'm probably the weakest of the netdev maintainers when it comes
> to the socket layer :)
> 
> I thought sock->sk is only cleared if the "user" of the socket closes
> it. But yes, both sock->sk == NULL and sk->sk_socket == NULL are
> entirely possible, and the networking stack usually operates on
> struct sock. Why exactly those two are separate beings is one of
> the mysteries of Linux networking which causes guaranteed confusion
> to all the newcomers. I wish I knew the details so I could at least
> document it :S

Bummer. I had high hopes on you being able to shed some light on this.

So, Chuck: maybe we should be looking at switching over to 'struct sock' 
for the internal stuff. If we don't have to do a 'fput()' somewhere we 
should be good...

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


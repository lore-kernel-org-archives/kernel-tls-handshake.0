Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F9FBA3E
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  4 Apr 2023 15:44:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C13C920107;
	Tue,  4 Apr 2023 15:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680623059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pbrw8+cGg/gTzv7zokO+GpIaZImu3f2kd/1SyEgVLdA=;
	b=LjLgq1GstJtCQ2la/BWHbwpjAPVmU8JvSSaSW0xfJC9e/emMcPMPnmvpMQut+mzxsREU0D
	JOgOaq0NLKD0VEZU6LlVcXfmkIBvs/gRjRWGU0A4l1s8M8cZp2v9213nF0tO3eEcPwYoYX
	jfHhcOthBG4U7TNC41yLV7doAiGnHaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680623059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pbrw8+cGg/gTzv7zokO+GpIaZImu3f2kd/1SyEgVLdA=;
	b=BNFyMb4xro2yYJAHG9sko9J4Wr5eXsdjtwyYr6pVvqdsCimFlp7fL41U83eQRF7gKjcvsz
	8bOd56CFPboQtmBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D0FD13920;
	Tue,  4 Apr 2023 15:44:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 04nQINNFLGSNDwAAMHmgww
	(envelope-from <hare@suse.de>); Tue, 04 Apr 2023 15:44:19 +0000
Message-ID: <4dde688e-21db-6cc6-080e-c451eac2a9ca@suse.de>
Date: Tue, 4 Apr 2023 17:44:19 +0200
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
To: Chuck Lever III <chuck.lever@oracle.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>
Cc: Boris Pismenny <borisp@nvidia.com>,
 "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>,
 "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>, John Haxby <john.haxby@oracle.com>
References: <168054723583.2138.14337249041719295106.stgit@klimt.1015granger.net>
 <168054756211.2138.1880630504843421368.stgit@klimt.1015granger.net>
 <63A1FBC9-8970-4A36-80B1-9C7713FF1132@oracle.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <63A1FBC9-8970-4A36-80B1-9C7713FF1132@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/4/23 17:36, Chuck Lever III wrote:
> 
> 
>> On Apr 3, 2023, at 2:46 PM, Chuck Lever <cel@kernel.org> wrote:
>>
[ .. ]
>> +/**
>> + * handshake_req_cancel - Cancel an in-progress handshake
>> + * @sock: socket on which there is an ongoing handshake
>> + *
>> + * Request cancellation races with request completion. To determine
>> + * who won, callers examine the return value from this function.
>> + *
>> + * Return values:
>> + *   %true - Uncompleted handshake request was canceled or not found
>> + *   %false - Handshake request already completed
>> + */
>> +bool handshake_req_cancel(struct socket *sock)
>> +{
>> + struct handshake_req *req;
>> + struct handshake_net *hn;
>> + struct sock *sk;
>> + struct net *net;
>> +
>> + sk = sock->sk;
>> + net = sock_net(sk);
> 
> We're still seeing NULL pointer dereferences here.
> Typically this happens after the remote closes the
> connection early.
> 
> I guess I cannot rely on sock_hold(sk); from preventing
> someone from doing a "sock->sk = NULL;"
> 
> Would it make more sense for req_submit and req_cancel to
> operate on "struct sock *" rather than "struct socket *" ?
> 
Stumbled across that one, too; that's why my initial submission
was sprinkled with 'if (!sock->sk)' statements.
So I think it's a good idea.

But waiting for Jakub to enlighten us.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


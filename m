Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C1DC297
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  9 Mar 2023 20:34:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AA78F21DA3;
	Thu,  9 Mar 2023 20:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678394083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lxc4a9PEAcYQDOvs7UCT+/WOvu5hsUXhyI9ejLiLPJ4=;
	b=UuUP1ylyp9dY08AbC/+QECYc/ChuqGetyXSwWpAwH+wYV8CThHYfohzpCO9S+wtloOkneZ
	xq9ZVbCx1nfehx06VstZ2L7BqGv+IYzLMCCWWLVdMHxLozY+ty9eDSDCK7lN+wxZoHhlPq
	n88sseZIya75DtKgCJfawsIrEGs64rY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678394083;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lxc4a9PEAcYQDOvs7UCT+/WOvu5hsUXhyI9ejLiLPJ4=;
	b=EP7ICPKhplYBlkXI3Tp26LTnQRoBd7UCb48Tvi6v+KZocb5zSz+ZWSSdOLa5r1ze2EH8HF
	ub+goX4oH9PGFUAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 970361391B;
	Thu,  9 Mar 2023 20:34:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 3t2kI+NCCmQgcQAAMHmgww
	(envelope-from <hare@suse.de>); Thu, 09 Mar 2023 20:34:43 +0000
Message-ID: <4c61ef1d-be30-365a-4b42-f5264cb63dab@suse.de>
Date: Thu, 9 Mar 2023 21:34:42 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: pre-release of v7
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>
References: <D6172FF4-D42F-4677-987E-D0B80326AD11@oracle.com>
 <022a5a5b-3771-ca67-e01a-d043f12c4278@suse.de>
 <46AB1958-D9BB-43F6-B992-71C59430AC53@oracle.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <46AB1958-D9BB-43F6-B992-71C59430AC53@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/9/23 21:20, Chuck Lever III wrote:
> 
> 
>> On Mar 9, 2023, at 1:29 PM, Hannes Reinecke <hare@suse.de> wrote:
>>
>> On 3/9/23 15:41, Chuck Lever III wrote:
>>> Hi-
>>> I'm now trying to take a step or two towards a more typical development
>>> process for the kernel patches and ktls-utils, as we replace the old
>>> upcall mechanism with netlink. This is in preparation for a release of
>>> ktls-utils-0.8, once netdev is close to happy with the kernel part.
>>> I have pushed pre-release branches of v7 so you can comment early, test
>>> it, or send me patches /before/ I post "Another crack at a handshake
>>> upcall mechanism" v7 on netdev@. What a concept, eh?
>> <applause>
>>
>>> Kernel part: The upcall-v7 branch in
>>> https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git
>> Hmm. Guess I'll branch off that, and push my patches on top of
>> that. They probably have to go via a different maintainer (read: hch),
>> so keeping them separately might be useful.
>>
>> Or having them on your tree, too?
>> Dunno.
> 
> The first two commits in topic-rpc-with-tls-upcall will go
> through netdev. The last three commits I can take through
> the nfsd tree. The remaining commits will go through the
> nfs client tree.
> 
> IMO having the latest PSK work included will be good for
> anyone wanting a central place to get all of this work, and
> it will make it a little easier for me to test PSK.
> 
> I'm not planning to send it all through one tree unless the
> other tree maintainers ask me to.
> 
> 
>>> User space part: The netlink-v7 branch in
>>> https://github.com/oracle/ktls-utils
>> Ah. There was the 'before' part of your mail...
>> I've pushed a patchset for the 'netlink' branch, containing fixes
>> to get PSK running.
>> Will be rebasing them to v7.
> 
> 	• 8eaa23f netlink: de-constify nla_policy
> 
> I'm dropping this one. My libnl headers have a "const", so
> the compiler complaint you see is clearly due to a locally
> aged version of libnl. This change would break my builds.
> 
Yeah, possibly.
Have to figure out what I can/will do here.

> 
> 	• 7d2a2ea ktls: add 'use_psk' argument to tlshd_make_priorites_string()
> 
> I'll rework this a bit and fold it into netlink-v7.
> 
Ta.

> 
> 	• 363ad37 netlink: Reshuffle argument parsing in tlshd_genl_valid_handler()
> 
> I don't understand this. There is no longer an ACCEPT_STATUS
> attribute -- the v7 kernel now returns an invalid message with
> a non-zero errno.
> 
> The patch description does not help me understand why the
> attribute parsing order matters.
> 
Thing is, in v6 any error will _just_ have the error status, with no 
additional value (auth type? mode?), playing havoc when debugging.
But as I said, it'll probably needs to be reworked for v7.

> 
> 	• 2e6b71c netlink: No key is always an error
> 
> It's not an error for anonymous handshakes. This patch
> introduces a layering violation -- the tlshd_genl_done() call
> shouldn't turn a "success" reply into an error reply -- it's
> job is only to form the reply message, not to enforce policy.
> 
Right.

> If this condition needs to be an error, the handshake specific
> code needs to decide that before genl_done is ever called.
> 
Okay, will do so.

> But more preferably, the kernel consumer for PSK should work
> like x.509 (as we discussed last week). The consumer needs to
> get the DONE downcall and then decide that, since there's no
> peer ID, this is actually not a usable TLS session. (That will
> be the case for x.509 handshakes where the client did not offer
> a certificate, but the server's security policy requires one).
> 
Well, slightly different for PSK; the PSK identity is bound to the key 
material, so if there if the PSK identity is not found the connection
won't have key material and consequently the TLS session can't be
established.

(That's the 'S' in Pre-Shared Key ...)

> 
> 	• f0e9956 server: set peer id for PSK
> 	• 6651a4a client: set peer ID for PSK
> 
> I think you misunderstand what the session_peerid is. It's the
> peer ID of the /remote/ peer, not the local peer ID that the
> remote chose. This attribute has been renamed in v7 to better
> reflect its purpose.
> 
> If PSK consumers need to know the local peer ID chosen by the
> remote, that IMO needs to be a separate netlink attribute.
> 

That is how PSK works.
The client sends a list of possible ids, where each id is bound
to a key. The server compares those ids against the ids present
on the the server, and picks one of those. This selected id
is then sent back to the client to inform it which id from the
list it should choose for the transaction.
Then both sides have agreed on a key, and that will be used for
the TLS session.

So for PSK we don't have a 'server' or 'client' ID; there is just
a single PSK identity on both sides.

For me, the 'peerid' attribute works just fine, and I think an
additional attribute is not necessary.
But if you decide otherwise, fine. Just let me know.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


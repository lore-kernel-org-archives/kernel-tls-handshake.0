Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF14CC26E
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  9 Mar 2023 18:29:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D74F720229;
	Thu,  9 Mar 2023 18:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678386540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QaJwtn6UDrs2mGRtsVNMuNijffopc0w/d3uNjDGdAQM=;
	b=BBJmOoMlfUBRushY2Q9zfF2s5QXJ7/cDyjTql0UWQfGythY22jDqOaNKae9S8G2e8/NU7d
	Z0GqOrLYv9jeGJX2kDwk91dE/Nz1dLRAUiFoXsjh7v+eVxp2Fm0Uoz8HQwaBPDrWpLcDG8
	ghpCSOUqCbx/EzCnIwthB+MV8eBQyBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678386540;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QaJwtn6UDrs2mGRtsVNMuNijffopc0w/d3uNjDGdAQM=;
	b=IRI24lCJ8kauco8r+FxVDrIS99GSlyMZuBll7hHRiMTrMZfTWTI4pKrA+K7YyAL4Xw1nG8
	/7obpXC7H7DNILDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BC2911391B;
	Thu,  9 Mar 2023 18:29:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GpHMKmwlCmTcNwAAMHmgww
	(envelope-from <hare@suse.de>); Thu, 09 Mar 2023 18:29:00 +0000
Message-ID: <022a5a5b-3771-ca67-e01a-d043f12c4278@suse.de>
Date: Thu, 9 Mar 2023 19:29:00 +0100
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
To: Chuck Lever III <chuck.lever@oracle.com>,
 "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
References: <D6172FF4-D42F-4677-987E-D0B80326AD11@oracle.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <D6172FF4-D42F-4677-987E-D0B80326AD11@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/9/23 15:41, Chuck Lever III wrote:
> Hi-
> 
> I'm now trying to take a step or two towards a more typical development
> process for the kernel patches and ktls-utils, as we replace the old
> upcall mechanism with netlink. This is in preparation for a release of
> ktls-utils-0.8, once netdev is close to happy with the kernel part.
> 
> I have pushed pre-release branches of v7 so you can comment early, test
> it, or send me patches /before/ I post "Another crack at a handshake
> upcall mechanism" v7 on netdev@. What a concept, eh?
> 
<applause>

> 
> Kernel part: The upcall-v7 branch in
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git
> 
Hmm. Guess I'll branch off that, and push my patches on top of
that. They probably have to go via a different maintainer (read: hch),
so keeping them separately might be useful.

Or having them on your tree, too?
Dunno.

> 
> User space part: The netlink-v7 branch in
> 
> https://github.com/oracle/ktls-utils
> 
Ah. There was the 'before' part of your mail...
I've pushed a patchset for the 'netlink' branch, containing fixes
to get PSK running.
Will be rebasing them to v7.

> 
> The one thing I'm waiting on now is for Jakub to deal properly with
> the license and copyright notices in the YAML specs and generated C
> source code. As an old SunRPC hand, I feel that the code generator
> needs to copy the spec's license and copyright notices verbatim to
> the generated C code. Jakub is not certain this is required; his code
> generator adds a license notice that is sometimes not compatible with
> the spec's license.
> 
Hmm. Not that concerned; my company has not a strong policy here :-)

But anyway, things look (mostly) good:

[89683.623479] nvme nvme0: connecting queue 0
[89683.623610] nvme nvme0: queue 0: start TLS with key 21712227
[89683.623622] tls_client_hello_psk: peerid 21712227
[89683.623687] nvmet_tcp: queue 0: TLS ServerHello
[89683.623695] tls_server_hello_psk: peerid 0
[89683.707089] nvmet_tcp: queue 0: TLS handshake done, key 21712227, 
status 0
[89683.707099] nvmet_tcp: queue 0: restarting queue after TLS handshake
[89683.707109] nvme nvme0: queue 0: TLS handshake done, key 21712227, 
status 0
[89683.708138] nvme nvme0: queue 0: TLS handshake complete, error 0
[89683.708781] nvmet_tcp: queue 0: failed to map data
[89745.034618] nvme nvme0: queue 0: timeout cid 0x0 type 4 opcode 0x7f 
(Connect)
[89745.036161] nvme nvme0: Connect command failed, error wo/DNR bit: 881
[89745.037437] nvme nvme0: failed to connect queue: 0 ret=881

So, TLS handshake works; I 'just' have to work on the actual data
transport. But still, a _big_ step forward.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


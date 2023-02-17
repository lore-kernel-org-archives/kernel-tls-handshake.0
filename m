Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266C55692
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 11:36:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6E64F1FE6D;
	Fri, 17 Feb 2023 11:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676633772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWEgmcA3hQlHrnWADQ/CDIVNfpL4xvNGSm/dPHdq7gI=;
	b=nj0kL5LAtZ+5ERSJmT5LPJ2PXBzrZfiNhEd2BOppPuS9nkkcpSMytR9HCPxJouK/A3BUMJ
	hZYyaVLDf0cTDwDSZmG+5mGuunqqzI4rKZhhJc3x6GE7g444EhTaoEUbbIk01r2QNqw0H2
	HlbmNkviSD+TE4hIeLb9Q13JaPQ3erY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676633772;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWEgmcA3hQlHrnWADQ/CDIVNfpL4xvNGSm/dPHdq7gI=;
	b=kvb8FTctcYL9PWMXcljCZX8kXIvpZXufHdbEu3qbK8Vsu2Rtp3jo550VK1AYmpzCUbCwED
	1T2+hmcyAmgre7CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 64A4E138E3;
	Fri, 17 Feb 2023 11:36:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IcRIGKxm72NqTgAAMHmgww
	(envelope-from <hare@suse.de>); Fri, 17 Feb 2023 11:36:12 +0000
Message-ID: <0aafe14a-5153-c02c-85d3-9568bc7e3bd0@suse.de>
Date: Fri, 17 Feb 2023 12:36:12 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Test results from v4
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>
References: <5ba0cee9-3a24-5d00-67e8-79204214f56b@suse.de>
 <6FC992A4-C4FC-4AD9-9BD4-5F57FF9C74DD@oracle.com>
 <ce49fa28-f0ab-dc01-c7d2-dd80e46c5796@suse.de>
 <66F7EBA7-AA44-4FAD-B7E2-20FBEBC74C2A@oracle.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <66F7EBA7-AA44-4FAD-B7E2-20FBEBC74C2A@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/16/23 18:17, Chuck Lever III wrote:
> 
>> On Feb 16, 2023, at 11:57 AM, Hannes Reinecke <hare@suse.de> wrote:
>>
>>
>> I've got some patches queued up to enable PSK for v4 (both client and server side), how should I post them? Here on the list or on the general linux-block / linux-nvme list?
> 
> Start here, let's see what you got.
> 
Done.

Handshake looks good, _except_ that the server side refuses to fetch new 
packets until client side closes the connection due to a timeout:

tlshd[11024]: (11024) gnutls(5): REC[0x209cc40]: Preparing Packet 
Handshake(22) with length: 559 and min pad: 0
tlshd[11024]: (11024) gnutls(9): ENC[0x209cc40]: cipher: NULL, MAC: 
MAC-NULL, Epoch: 0
tlshd[11024]: (11024) gnutls(5): REC[0x209cc40]: Sent Packet[1] 
Handshake(22) in epoch 0 and length: 564
tlshd[11024]: (11024) gnutls: The operation timed out (-319)
tlshd[11024]: (11024) Handshake with c472.arch.suse.de (10.161.60.216) 
failed
tlshd[11023]: (11023) gnutls(5): REC[0x209cbc0]: SSL 3.1 Handshake 
packet received. Epoch 0, length: 559

Any idea what could be causing it?
(And I checked, the ClientHello packet really is on the wire, so it's a 
server-side thingie).
I'm pretty sure the server side doesn't set any callbacks to the socket 
(yet), so I'm a bit at a loss what could be the reason here.

Thanks for any pointers.

Cheers,

Hannes


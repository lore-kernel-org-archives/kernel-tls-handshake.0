Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFF26AD9
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  9 Mar 2023 11:08:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4493120033;
	Thu,  9 Mar 2023 11:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678360118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T20mQJkWoGCctYxjRPvfm9QYAyk6Tp+hP7mO+wIDgkI=;
	b=QI/k7CGTGsNZdUXNHrf5CPVJtHKE9j+Vp+h5oLGadedH5bezC94lm60kdr69MWOKO0Ycvb
	Dhb5kTQ+7qw6rJ3kNTU2lRF0vKDUl8URrIC97b4Lc8fS+ydP4+q8qrjmfVEFFhHSozMysn
	TOK4nC96xc4fB03bFH/AhgIBLV5ACWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678360118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T20mQJkWoGCctYxjRPvfm9QYAyk6Tp+hP7mO+wIDgkI=;
	b=NpMNVD+68nGaNFtrU6GTixXrCx3Of5SDJatBxWlZgw+VvYCR8DVOn58GCtuLYJqrNR+har
	E9NX5zD36U8mQACQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 388F61391B;
	Thu,  9 Mar 2023 11:08:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MiFsDTa+CWTwRAAAMHmgww
	(envelope-from <hare@suse.de>); Thu, 09 Mar 2023 11:08:38 +0000
Message-ID: <f7891138-9047-469b-3707-b180e77c3331@suse.de>
Date: Thu, 9 Mar 2023 12:08:37 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: NVMe client TLS finally ... something
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>
References: <e11b9cfc-5567-d2fb-7378-8af3467f5564@suse.de>
In-Reply-To: <e11b9cfc-5567-d2fb-7378-8af3467f5564@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/9/23 11:39, Hannes Reinecke wrote:
> Hi Chuck,
> 
> at last some good news. The 'fput()' instead of 'sock_release()' really 
> did the trick; crashes are gone, and things started to rumble along.
> 
> So the client side now seems to work:
> 
> [61077.029382] nvme nvme0: connecting queue 0
> [61077.029778] nvme nvme0: queue 0: lookup sha256 retained TLS key
> [61077.029792] nvme nvme0: queue 0: start TLS with key beab76d
> [61077.029800] tls_client_hello_psk: peerid beab76d
> [61077.105017] nvme nvme0: queue 0: TLS handshake done, key 0, status 0
> [61077.105036] nvme nvme0: queue 0: TLS handshake complete, tmo 2500, 
> error 0
> [61077.206598] nvme nvme0: creating 2 I/O queues.
> [61077.207100] nvme nvme0: connecting queue 1
> [61077.207168] nvme nvme0: queue 1: lookup sha256 retained TLS key
> [61077.207176] nvme nvme0: queue 1: start TLS with key beab76d
> [61077.207184] tls_client_hello_psk: peerid beab76d
> [61077.255669] nvme nvme0: queue 1: TLS handshake done, key 0, status 0
> [61077.255687] nvme nvme0: queue 1: TLS handshake complete, tmo 2500, 
> error 0
> [61077.255821] nvme nvme0: connecting queue 2
> [61077.255883] nvme nvme0: queue 2: lookup sha256 retained TLS key
> [61077.255892] nvme nvme0: queue 2: start TLS with key beab76d
> [61077.255897] tls_client_hello_psk: peerid beab76d
> [61077.308351] nvme nvme0: queue 2: TLS handshake done, key 0, status 0
> [61077.308367] nvme nvme0: queue 2: TLS handshake complete, tmo 2500, 
> error 0
> [61077.308494] nvme nvme0: mapped 2/0/0 default/read/poll queues.
> [61077.310415] nvme nvme0: new ctrl: NQN 
> "nqn.2014-08.org.nvmexpress:NVMf:uuid:7a48d319-b49a-452a-86dd-3be7c4491382", addr 127.0.0.1:4420
> [61109.661753] nvme nvme0: queue 2: timeout cid 0x1043 type 4 opcode 0x2 
> (Read)
> [61109.663158] nvme nvme0: starting error recovery
> [61109.663992] nvme0c0n1: Read(0x2) @ LBA 130999, 9 blocks, Host Aborted 
> Command (sct 0x3 / sc 0x71)
> [61109.665081] I/O error, dev nvme0c0n1, sector 1047992 op 0x0:(READ) 
> flags 0x4080700 phys_seg 9 prio class 2
> [61109.666763] block nvme0n1: no usable path - requeuing I/O
> [61109.667309] nvme nvme0: queue 1: free socket
> [61109.667452] nvme nvme0: queue 2: free socket
> [61109.670704] nvme nvme0: queue 0: free socket
> [61109.670712] nvme nvme0: Reconnecting in 10 seconds...
> 
> IE TLS handshaked worked, and the client has sent commands.
> They never made it to the target, though; however, that might be
> that the plumbing on the client side isn't done properly.
> (queues need to be restarted, socket operations set, yadda yadda).
> 
> But it really is a big step forward.
> 
Hmm. Retry the whole think seems _way_ better:

nvme nvme0: queue 2: TLS handshake done, key 0, status 0
nvme nvme0: queue 2: TLS handshake complete, tmo 2500, error 0
nvme nvme0: mapped 2/0/0 default/read/poll queues.
nvme nvme0: new ctrl: NQN 
"nqn.2014-08.org.nvmexpress:NVMf:uuid:7a48d319-b49a-452a-86dd-3be7c4491382", 
addr 127.0.0.1:4420
nvme nvme0: Removing ctrl: NQN 
"nqn.2014-08.org.nvmexpress:NVMf:uuid:7a48d319-b49a-452a-86dd-3be7c4491382"
nvme nvme0: queue 1: timeout cid 0x102f type 4 opcode 0x2 (Read)
nvme0c0n1: Read(0x2) @ LBA 130988, 10 blocks, Host Aborted Command (sct 
0x3 / sc 0x71)
nvme nvme0: queue 1: timeout cid 0x1030 type 4 opcode 0x2 (Read)
nvme0c0n1: Read(0x2) @ LBA 130999, 9 blocks, Host Aborted Command (sct 
0x3 / sc 0x71)
block nvme0n1: no available path - failing I/O
Buffer I/O error on dev nvme0n1, logical block 130988, async page read
nvme nvme0: queue 1: free socket

IE data transfer seems to work, and I'm only seeing I/O errors after
trying to disconnect, but that's about to be expected.
Me thinks.

Hence I can declare the client side functional.
Thanks for the work!

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		           Kernel Storage Architect
hare@suse.de			                  +49 911 74053 688
SUSE Software Solutions Germany GmbH, Frankenstr. 146, 90461 Nürnberg
Managing Directors: I. Totev, A. Myers, A. McDonald, M. B. Moerman
(HRB 36809, AG Nürnberg)


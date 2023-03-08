Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E013579DA
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  8 Mar 2023 16:04:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0B8A321A5B;
	Wed,  8 Mar 2023 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678291461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zYHgVbNE9RgqX7QEYKgbrG/LPfJ8VekYYtdbsM48EKc=;
	b=oJyREy7PXWP6SNlK1rme4BuxF9/Qguv5T+jEnHkMxiG2V0GZIe1pxwWmfS5HYWQvBFyng2
	ETYdpb6GjRH+3ofiT/SJH6xolNxvwHqgfBLSrsQKNv50g4GtlrAibE69Qaq0Drb/Madhfq
	FZiMEuKrZo50sU7XQqIkgucc1kOQz64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678291461;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zYHgVbNE9RgqX7QEYKgbrG/LPfJ8VekYYtdbsM48EKc=;
	b=7+oUlh2rFTuwPzh0m21n1IDWfToL5ctsJjh5qcUW71dYaeFN9JMThXG2Mvh3E6EsvOy3cd
	q/xrKB0BQ31RtGDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA5F61391B;
	Wed,  8 Mar 2023 16:04:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id JhSuOASyCGS2JwAAMHmgww
	(envelope-from <hare@suse.de>); Wed, 08 Mar 2023 16:04:20 +0000
Message-ID: <c519d883-5e08-0d28-dee8-89f1a7f197e3@suse.de>
Date: Wed, 8 Mar 2023 17:04:20 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: fput() considered harmful
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>
References: <06eed177-d4e9-c321-6146-4d4f51b5d759@suse.de>
 <81E39086-B15B-46ED-8481-8796C00CFF46@oracle.com>
 <59EF30C0-05F8-458E-8BAF-36A9CC757D00@oracle.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <59EF30C0-05F8-458E-8BAF-36A9CC757D00@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/8/23 16:40, Chuck Lever III wrote:
> 
> 
>> On Mar 8, 2023, at 8:43 AM, Chuck Lever III <chuck.lever@oracle.com> wrote:
>>
>>
>>
>>> On Mar 8, 2023, at 8:24 AM, Hannes Reinecke <hare@suse.de> wrote:
>>>
>>> Hi Chuck,
>>>
>>> I'm playing around with v6 and (again) facing really nasty crashes:
>>>
>>> [ 1662.912887] ------------[ cut here ]------------
>>> [ 1662.913399] kernel BUG at fs/inode.c:1763!
>>> [ 1662.913822] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
>>> [ 1662.914336] CPU: 1 PID: 6494 Comm: tlshd Kdump: loaded Tainted: G       E      6.2.0-rc4-54-default+ #231
>>> [ 1662.915235] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
>>> [ 1662.915932] RIP: 0010:iput+0x1d/0x20
>>> [ 1662.916275] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 48 85 ff 74 0e f6 87 98 00 00 00 40
>>> 75 0a e9 18 fe ff ff e9 23 e3 7a 00 <0f> 0b 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44
>>> [ 1662.917921] RSP: 0018:ffffaeb600b1fe38 EFLAGS: 00010202
>>> [ 1662.918423] RAX: 0000000000000000 RBX: ffff953bcb9d9180 RCX: 0000000000000064
>>> [ 1662.919065] RDX: 0000000000000001 RSI: ffff953bcbb23c38 RDI: ffff953bcbb23b00
>>> [ 1662.919703] RBP: 0000000000000000 R08: 0000000100053304 R09: ffff953bcbb23b00
>>> [ 1662.920339] R10: ffff953bc5538b40 R11: 0000000000000003 R12: ffff953bcb9d91d8
>>> [ 1662.920978] R13: ffff953bfd15ade0 R14: ffff953bcb9d9180 R15: ffff953b83918cb8
>>> [ 1662.921617] FS:  0000000000000000(0000) GS:ffff953bfb900000(0000) knlGS:0000000000000000
>>> [ 1662.922376] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [ 1662.922907] CR2: 00007fdc89a091a0 CR3: 000000004ad8c000 CR4: 0000000000350ee0
>>> [ 1662.923568] Call Trace:
>>> [ 1662.923801]  <TASK>
>>> [ 1662.924006]  __dentry_kill+0xca/0x160
>>> [ 1662.924353]  __fput+0xdf/0x240
>>> [ 1662.924652]  task_work_run+0x67/0xa0
>>> [ 1662.924992]  do_exit+0x343/0xb50
>>> [ 1662.925302]  do_group_exit+0x2d/0x80
>>> [ 1662.925644]  __x64_sys_exit_group+0x14/0x20
>>> [ 1662.926039]  do_syscall_64+0x31/0x80
>>>
>>> Key problem seems to be userspace here, which (apparently) is calling close() on the fd which we've passed from the kernel.
>>> While this _normally_ is not a problem, in our case we have the problem
>>> that the filedescriptor is associated with a socket (ie struct socket).
>>> And that one is shared between kernel code and userland.
>>> And doesn't have any refcounting whatsoever; socket_release() removes the reference to the underlying file:
>>>
>>> 	if (!sock->file) {
>>> 		iput(SOCK_INODE(sock));
>>> 		return;
>>> 	}
>>> 	sock->file = NULL;
>>>
>>> ie if _another_ process (the kernel driver, say) is calling 'close()', too, it'll run into the
>>> !sock->file condition and crash in iput().
>>>
>>> I have been testing various things here, not calling fput, calling get_file() etc, but either
>>> hit a crash or kmemleak complaining about
>>> the file not being freed.
>>>
>>> Have you seen similar issues?
>>
>> I have, and they all vanished with the introduction of handshake_dup and haven't returned.
>>
>>
>>> And even if you haven't: relying on userspace _not_ to call 'close()'
>>> on the socket seems to be a quite dangerous concept.
>>
>> - The kernel "closes" that file descriptor anyway when the process exits. Is that not the
>> same as a user space close(2) ?
>>
>> - The endpoint was created via dup, so calling close on it should merely remove that endpoint
>> and not trigger a sock_release().
>>
>> AIUI the reference counting of the struct file * is what prevents user space from calling ->release.
>> So maybe NVMe needs another get_file() somewhere before it calls tls_server_hello_psk().
> 
> I added an explicit "close(sockfd);return;" in src/tlshd/handshake.c.
> I tried it once with the close /before/ doing the handshake, and once
> with the close /after/. I don't see any kernel issues on my server
> system when a client attempts to handshake with it.
> 
> Based on what I've read here, the missing get_file() theory seems
> plausible.
> 
Hmm. Let's see.
I must say the lifetime rules for 'struct file' (or 'struct socket') are 
still somewhat beyond me.
Currently I have to do a

sock_alloc_file()

_and_

get_file()

before calling tls_client_hello_psk() to avoid a crash.
One does wonder why; typically the refcount is initialized to '1',
so the extra 'get_file()' shouldn't be required.

But what do I know ...

I see to get you instructions for my testbed.

Cheers,

Hannes


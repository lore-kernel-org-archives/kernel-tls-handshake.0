Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD056ABA
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  8 Mar 2023 13:24:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3C1771FE3C;
	Wed,  8 Mar 2023 13:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678281844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l0Al9ST0FlmbRzN5oVRJKmjaxgYuvWZbRQhO6Y3mYoY=;
	b=XH/zYHDCRB+/eGV5AcnCBRbDpUMz3uAYJ6c/C7AbqYqaK3yyyspoHOs9szC5C6dLwj3dfd
	3LrhQn60U9O7HxaHcETIFq6u0WW+H08eTgZ04x/pxyCsZumgMTNj8xAI/tg5U8T2lApOHb
	N8KgcTBEn0SLWA+jrKBh25s9WJk+zLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678281844;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l0Al9ST0FlmbRzN5oVRJKmjaxgYuvWZbRQhO6Y3mYoY=;
	b=xssV/jkKpoT7Ufd6sihteOlHO+lBuO86Roay1aRAod48rzSJWVgq3PCPfRqRXV7N7NMAxD
	NMso63YhsEgVkBCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 306901348D;
	Wed,  8 Mar 2023 13:24:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id igdoC3SMCGTTRgAAMHmgww
	(envelope-from <hare@suse.de>); Wed, 08 Mar 2023 13:24:04 +0000
Message-ID: <06eed177-d4e9-c321-6146-4d4f51b5d759@suse.de>
Date: Wed, 8 Mar 2023 14:24:03 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Chuck Lever <chuck.lever@oracle.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>
From: Hannes Reinecke <hare@suse.de>
Subject: fput() considered harmful
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chuck,

I'm playing around with v6 and (again) facing really nasty crashes:

[ 1662.912887] ------------[ cut here ]------------
[ 1662.913399] kernel BUG at fs/inode.c:1763!
[ 1662.913822] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
[ 1662.914336] CPU: 1 PID: 6494 Comm: tlshd Kdump: loaded Tainted: G 
       E      6.2.0-rc4-54-default+ #231
[ 1662.915235] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 
0.0.0 02/06/2015
[ 1662.915932] RIP: 0010:iput+0x1d/0x20
[ 1662.916275] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 
00 48 85 ff 74 0e f6 87 98 00 00 00 40
  75 0a e9 18 fe ff ff e9 23 e3 7a 00 <0f> 0b 90 90 90 90 90 90 90 90 90 
90 90 90 90 90 90 90 90 0f 1f 44
[ 1662.917921] RSP: 0018:ffffaeb600b1fe38 EFLAGS: 00010202
[ 1662.918423] RAX: 0000000000000000 RBX: ffff953bcb9d9180 RCX: 
0000000000000064
[ 1662.919065] RDX: 0000000000000001 RSI: ffff953bcbb23c38 RDI: 
ffff953bcbb23b00
[ 1662.919703] RBP: 0000000000000000 R08: 0000000100053304 R09: 
ffff953bcbb23b00
[ 1662.920339] R10: ffff953bc5538b40 R11: 0000000000000003 R12: 
ffff953bcb9d91d8
[ 1662.920978] R13: ffff953bfd15ade0 R14: ffff953bcb9d9180 R15: 
ffff953b83918cb8
[ 1662.921617] FS:  0000000000000000(0000) GS:ffff953bfb900000(0000) 
knlGS:0000000000000000
[ 1662.922376] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1662.922907] CR2: 00007fdc89a091a0 CR3: 000000004ad8c000 CR4: 
0000000000350ee0
[ 1662.923568] Call Trace:
[ 1662.923801]  <TASK>
[ 1662.924006]  __dentry_kill+0xca/0x160
[ 1662.924353]  __fput+0xdf/0x240
[ 1662.924652]  task_work_run+0x67/0xa0
[ 1662.924992]  do_exit+0x343/0xb50
[ 1662.925302]  do_group_exit+0x2d/0x80
[ 1662.925644]  __x64_sys_exit_group+0x14/0x20
[ 1662.926039]  do_syscall_64+0x31/0x80

Key problem seems to be userspace here, which (apparently) is calling 
close() on the fd which we've passed from the kernel.
While this _normally_ is not a problem, in our case we have the problem
that the filedescriptor is associated with a socket (ie struct socket).
And that one is shared between kernel code and userland.
And doesn't have any refcounting whatsoever; socket_release() removes 
the reference to the underlying file:

	if (!sock->file) {
		iput(SOCK_INODE(sock));
		return;
	}
	sock->file = NULL;

ie if _another_ process (the kernel driver, say) is calling 'close()', 
too, it'll run into the !sock->file condition and crash in iput().

I have been testing various things here, not calling fput, calling 
get_file() etc, but either hit a crash or kmemleak complaining about
the file not being freed.

Have you seen similar issues?
And even if you haven't: relying on userspace _not_ to call 'close()'
on the socket seems to be a quite dangerous concept.
Maybe we need to implement a 'socket_clone()' functionality?

Cheers,

Hannes

Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E18C747A
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Feb 2023 15:58:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 399DA228B1
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Feb 2023 15:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676563094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XbjLln0g11JMUmxgJD4idvXxLzJCWRukTLsGX+yhi8g=;
	b=IZ4gJ01bbwvf/TQRAlACAtfIt2FUfMO131P+R+WjQPlGlsQNRBdxs1p+09S2OaUOTZIhX1
	xUktGh8YxY/reAD6p/LiG6BHeSygQ/IuOTs/Fa/VPVMHP0saO03A2x7VeKH3PSDyEvv8jk
	+bL0HrWczluqJ/kPfgFNbna4GA1Nld0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676563094;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XbjLln0g11JMUmxgJD4idvXxLzJCWRukTLsGX+yhi8g=;
	b=y3YCscN7LKgQFsLVjdav3quyPHWXRnJ2gbPSdZroukjHZGPQOyLR/xlSrGzwWhA62wZpBB
	97l+UsPnkgnEybCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30E10131FD
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Feb 2023 15:58:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id dR+TC5ZS7mPmHwAAMHmgww
	(envelope-from <hare@suse.de>)
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 16 Feb 2023 15:58:14 +0000
Message-ID: <5ba0cee9-3a24-5d00-67e8-79204214f56b@suse.de>
Date: Thu, 16 Feb 2023 16:58:13 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: kernel-tls-handshake@lists.linux.dev
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
Subject: Test results from v4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chuck,

I've given v4 a spin on my testbed, and ... well, things could've been 
better :-(

Biggest issue is that I've lost connectivity to my testbed 
(openssl-based). It always kicks me back with:

SSL routines:tls_choose_sigalg:no suitable signature algorithm

for whatever reasons.
I try to fiddle with the priority string, but it's _really_ annoying.

And also reference counting is wrong:

unreferenced object 0xffff9989c22a0018 (size 24):
   comm "tlshd", pid 2332, jiffies 4294964098 (age 1513.848s)
   hex dump (first 24 bytes):
     00 00 00 00 00 00 00 00 a8 31 85 c1 89 99 ff ff  .........1......
     00 00 00 00 00 00 00 00                          ........
   backtrace:
     [<ffffffffa00ad3e4>] security_file_alloc+0x24/0x90
     [<ffffffff9ffbb747>] __alloc_file+0x57/0xc0
     [<ffffffff9ffbbbc3>] alloc_empty_file+0x43/0xf0
     [<ffffffff9ffbbcad>] alloc_file+0x2d/0x170
     [<ffffffff9ffbbea7>] alloc_file_pseudo+0xa7/0x100
     [<ffffffffa05158a9>] sock_alloc_file+0x39/0xa0
     [<ffffffffa073594b>] handshake_genl_cmd_accept+0x19b/0x2a0
     [<ffffffffa05d44e7>] genl_family_rcv_msg_doit.isra.19+0xf7/0x120
     [<ffffffffa05d495f>] genl_rcv_msg+0x19f/0x2a0
     [<ffffffffa05d3286>] netlink_rcv_skb+0x56/0x110
     [<ffffffffa05d3cc4>] genl_rcv+0x24/0x40
     [<ffffffffa05d277b>] netlink_unicast+0x1bb/0x290
     [<ffffffffa05d2bc5>] netlink_sendmsg+0x365/0x4d0
     [<ffffffffa0516e9f>] sock_sendmsg+0x5f/0x70
     [<ffffffffa0517211>] ____sys_sendmsg+0x201/0x280
     [<ffffffffa0519ca8>] ___sys_sendmsg+0x88/0xd0

But I guess you've found these already.

Cheers,

Hannes

Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719FB26FA54
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 29 Apr 2025 05:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906123; cv=none; b=nIHE5oEV8oQFHEvz1hwGjspkdbiISIAoUteI9pgmd+Wxt5c80h0r3Rtxyln07TaGA4IVOhS3ptFcqhww+rdBr11ylYF0SNvXdHq+2ucqsGXc42fGKOvDMSriI7Qd6Cq4Qcv9Wg6GyYuShTx7rbOMhPW2/HEse9dK43mlSo2wkZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906123; c=relaxed/simple;
	bh=AhQx3cmRsYXdrlTJEada4bBG40b3ogV7oYG1+jvWZL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wo0xhtK/VAcpAbDj8Fo9jdFTHlvA5xCQz0VrpHMxgMpcPhUHQR/qYWDr5HH+B4qGdN7l8e6rPqF85zm6wPA2XY6zj8y7ywZTajNyDtx0bPgeV+7/lXkRj+Hah/YMv7XyP65Vw8w8Jgsbjbko+WL1DWqRogkiqjhTTf0l1mN0YJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F3mnHimm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/vIXob2k; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F3mnHimm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/vIXob2k; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F3mnHimm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/vIXob2k";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F3mnHimm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/vIXob2k"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 675E81F7CB;
	Tue, 29 Apr 2025 05:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745906119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xJf9Hw+BP1mFKmnkjBb6rwlSfF5DdYYOjQOoXeP7DQA=;
	b=F3mnHimmhA0iiSYwh3wXhwsEgq8EEaPjoNmtzg5jiEiwuwJagQ8clSd/KxILnOjpcLIc3T
	UczLrRS/G1cG8NNmC+Ji+Ch1UETuveJb7/BUChbKlchQUkXVDCtk7aqzIjCT8h6AxQRW02
	/Bp5DQvSE/igXomGhDPrLwS5j60nwV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745906119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xJf9Hw+BP1mFKmnkjBb6rwlSfF5DdYYOjQOoXeP7DQA=;
	b=/vIXob2ke2rk1ndD4sxj9OP9+YIA/iGZhbvFU/bnNmq5ey3RidVTuUReuBttOEZcye36CB
	4txUCXY2ZTggA1DQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=F3mnHimm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/vIXob2k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745906119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xJf9Hw+BP1mFKmnkjBb6rwlSfF5DdYYOjQOoXeP7DQA=;
	b=F3mnHimmhA0iiSYwh3wXhwsEgq8EEaPjoNmtzg5jiEiwuwJagQ8clSd/KxILnOjpcLIc3T
	UczLrRS/G1cG8NNmC+Ji+Ch1UETuveJb7/BUChbKlchQUkXVDCtk7aqzIjCT8h6AxQRW02
	/Bp5DQvSE/igXomGhDPrLwS5j60nwV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745906119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xJf9Hw+BP1mFKmnkjBb6rwlSfF5DdYYOjQOoXeP7DQA=;
	b=/vIXob2ke2rk1ndD4sxj9OP9+YIA/iGZhbvFU/bnNmq5ey3RidVTuUReuBttOEZcye36CB
	4txUCXY2ZTggA1DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 348E013931;
	Tue, 29 Apr 2025 05:55:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UI3KCsdpEGhZVwAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 29 Apr 2025 05:55:19 +0000
Message-ID: <2132fd1e-2de1-4ba3-9ef4-575a9c09e390@suse.de>
Date: Tue, 29 Apr 2025 07:55:18 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missed rpc NULL response leads to hung mount command
To: Steve Sears <sjsorca@gmail.com>, Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
References: <CAPVZmxxw+zkn8xkc_xZK32xxFXNXJ=PZgdXrk6BD7Y5uziE6aA@mail.gmail.com>
 <b2c61dbf-33db-4914-8a1d-beac3b3036ea@oracle.com>
 <CAPVZmxxPihFEMhMh8ijD-KnUx9S=xqFd6SGxxNKbwinuZj7dWQ@mail.gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <CAPVZmxxPihFEMhMh8ijD-KnUx9S=xqFd6SGxxNKbwinuZj7dWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 675E81F7CB
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com,oracle.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 4/28/25 18:54, Steve Sears wrote:
> On Sun, Apr 27, 2025 at 11:35 AM Chuck Lever <chuck.lever@oracle.com> wrote:
>>
>> On 4/24/25 2:03 PM, Steve Sears wrote:
>>> Originally posted to the ktls-utils list and Chuck Lever recommended
>>> this list is more germaine to the problem I am trying to solve.
>>>
>>> I am implementing the NFS server side of a TLS connection using the
>>> OpenSSL library. There may be a bug in my implementation, but it isn't
>>> obvious given the data so I am reaching out to this list. Please
>>> respond if the problem sounds familiar or if you have ideas on how to
>>> pursue it.
>>>
>>> Here are some key datapoints:
>>> - Using a Linux 6.12.16-2 client
>>> - sudo mount -o xprtsec=tls,vers=4.2,hard,acregmin=0,acregmax=0
>>> testmachine.lab.space:/share1 /mnt/share1/
>>> - Looking at tlshd logs: the handshake always works. Always.
>>> - The client will hang on the mount most of the time, but maybe 1/50
>>> or so it works fine. And when the mount succeeds everything continues
>>> to work great and tcpdump shows all TLS 1.3 packets, etc.
>>> - The hang appears to be from an rpc_ping() when the rpc null reply is
>>> not processed.
>>
>> Hi Steve -
>>
>> What does this mean, exactly? Which side is not processing the ping?
>> If the ping does not work, then operation on the connection will not
>> proceed.
> 
> It is unclear if I am looking at the right problem, I am still trying
> to understand how the client works. The client sends two rpc null
> requests: an AUTH_TLS and an AUTH_SYS. The AUTH_TLS is received on the
> server and a reply sent, and the client sees the reply and does the
> TLS handshake successfully. This part works every time.
> 
> The, the AUTH_TLS is received on the server and a reply is sent. The
> bpf trace shows the null rpc being sent, but we see no evidence of a
> reply for this one. Or perhaps more accurately, we see a reply but the
> client doesn't think it is a reply to the rpc null AUTH_SYS it sent.
> 
> tcpdump confirms both rpc null messages are sent and replied to.
> 
> I have the same bpftrace output for a working mount, unfortunately
> without flag bits I recently added. In the non-working case we see:
> 
> 15:32:57.391762 [ 56273/0xffff8e9b80b70000        mount.nfs]
> rpc_create_xprt(args=0xffffb53c87ceb710, xprt=0xffff8e9c259bd800)
> sa_family: 2  port=264 addr 10.200.107.13 xprtsec policy:
> RPC_XPRTSEC_TLS_ANON flags=0x2a0 auth_flavor=1
> 15:32:57.391786 [ 56273/0xffff8e9b80b70000        mount.nfs]
> rpc_ping(clnt=0xffff8e9b81951e00)
> ...
> 15:32:57.391896 [ 53703/0xffff8e9c097bb600    kworker/u19:0]
> rpc_create_xprt(args=0xffffb53c9503fd70, xprt=0xffff8e9c259be800)
> sa_family: 2  port=264 addr 10.200.107.13 xprtsec policy:
> RPC_XPRTSEC_NONE flags=(nil) auth_flavor=7
> 15:32:57.391932 [ 53703/0xffff8e9c097bb600    kworker/u19:0]
> rpc_ping(clnt=0xffff8e9b80a53600)
> ...
> 15:32:57.392697 [ 53703/0xffff8e9c097bb600    kworker/u19:0]
> ->rpc_ping (rpc_create_xprt) return 0 [(nil)]
> 
> An rpc_ping is sent with an AUTH_SYS flavor. Shortly thereafter
> another rpc_ping is sent with AUTH_TLS, which completes relatively
> quickly.
> 
> This part is the same for working and non-working, the trace shows a
> set of nested rpc_pings. However, in the working case a reply to the
> first rpc_ping is processed by mount.nfs once it starts running again.
> In the non-working case mount.nfs never wakes up from
> rpc_wait_bit_killable().
> 
Could it be a stall in the TLS stack?
I've hit a similar issue during NVMe-TLS development; I found that the
->data_ready() callback needs to call the original 'data_ready' callback
first (as that produces the data in TLS layer).
Otherwise the ->data_ready() callback will be invoked with no data to 
process.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485E91F5834
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  7 May 2025 09:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610635; cv=none; b=PtZGtZ1fBKIyTFRovnXY9NzsHsd7VMxR3LPvJCX10mLSiu33CNY6Ca7lz6ZEfyHFGH8BBWJSnkQxedHCVjWFYzWDiHUzDJgT15vuMEJ2392KOOFwNxMKdkUtyWiMAeRVdqOtglEy9g7bWX44ocbHs2XUi6d4fOX7NXg7QkZfkHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610635; c=relaxed/simple;
	bh=Sd61N+xLrKXVvm5hw2graexbeGRLyieN5bYCxboAn1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aq5u14+QWbCFMeSBVjSzaV40WbADGqqi5euRgi0r8MUS3TDupSWZHsybvTswj915JyQaz9I8N94vq296SFl4eqWPB5hGqlUDxIXc5i9jZNuXy2zGAKJ/09PV9dh2FmS2Wf7V+ITAzTjxiVrI1OasFYoW3E9IokYDubbiyjhlJcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P8zipbW6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vm9pZDVe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P8zipbW6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vm9pZDVe; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P8zipbW6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vm9pZDVe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P8zipbW6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vm9pZDVe"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 54FD42115A;
	Wed,  7 May 2025 09:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746610632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ve0eAauMpTlI0sIjvMlpoNdCq9hG/CRz4Qjl9FkzLhw=;
	b=P8zipbW6yfXDEW/xO1ZNQSujeq3A1Vh5TbIdOo7ijFfusIYzKh8B2bxM7Xhi3kEVoT5AlZ
	eftRMUNKVIn8wB0Y+f/grj2TijCaOTuIlvKW7RlIZt73zdWXysh2u0QEf2yAKVKbVO21/S
	vgS3NyEaE499e8GmQhxRg5HkETT4d2A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746610632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ve0eAauMpTlI0sIjvMlpoNdCq9hG/CRz4Qjl9FkzLhw=;
	b=vm9pZDVefw4jE+wBPFSUAOL0RpvenHeSAmcV9AtFDmudPIIcWO/vAdZ3dGKCh/MjTDz86j
	n5xFG0jbXGLVOnAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746610632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ve0eAauMpTlI0sIjvMlpoNdCq9hG/CRz4Qjl9FkzLhw=;
	b=P8zipbW6yfXDEW/xO1ZNQSujeq3A1Vh5TbIdOo7ijFfusIYzKh8B2bxM7Xhi3kEVoT5AlZ
	eftRMUNKVIn8wB0Y+f/grj2TijCaOTuIlvKW7RlIZt73zdWXysh2u0QEf2yAKVKbVO21/S
	vgS3NyEaE499e8GmQhxRg5HkETT4d2A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746610632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ve0eAauMpTlI0sIjvMlpoNdCq9hG/CRz4Qjl9FkzLhw=;
	b=vm9pZDVefw4jE+wBPFSUAOL0RpvenHeSAmcV9AtFDmudPIIcWO/vAdZ3dGKCh/MjTDz86j
	n5xFG0jbXGLVOnAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3698413882;
	Wed,  7 May 2025 09:37:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sAloDMgpG2hDfgAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 07 May 2025 09:37:12 +0000
Message-ID: <de2b26ca-ea7c-40a1-8ebd-47b1f43aab5a@suse.de>
Date: Wed, 7 May 2025 11:37:11 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel TLS configuration, was: Re: [ANNOUNCE] ktls-utils 1.0.0
To: Christoph Hellwig <hch@infradead.org>
Cc: Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 linux-nvme@lists.infradead.org
References: <oracle/ktls-utils/push/refs/tags/ktls-utils-1.0.0/000000-c787cd@github.com>
 <32e4bd99-a85f-4f53-94bd-b8c3ecf2c66f@oracle.com>
 <aBoCELZ_x-C4talt@infradead.org>
 <cc795966-8c09-48ed-80e4-c70ff4143202@suse.de>
 <aBog09quIh39IL3W@infradead.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <aBog09quIh39IL3W@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On 5/6/25 16:46, Christoph Hellwig wrote:
> On Tue, May 06, 2025 at 03:03:10PM +0200, Hannes Reinecke wrote:
>> Hmm. We do that already:
>>
>>          dev_dbg(nctrl->device, "queue %d: start TLS with key %x\n",
>>                  qid, pskid);
>>          memset(&args, 0, sizeof(args));
>>          args.ta_sock = queue->sock;
>>          args.ta_done = nvme_tcp_tls_done;
>>          args.ta_data = queue;
>>          args.ta_my_peerids[0] = pskid;
>>          args.ta_num_peerids = 1;
>>          if (nctrl->opts->keyring)
>>                  keyring = key_serial(nctrl->opts->keyring);
>>          args.ta_keyring = keyring;
>>          args.ta_timeout_ms = tls_handshake_timeout * 1000;
>>          queue->tls_err = -EOPNOTSUPP;
>>          init_completion(&queue->tls_complete);
>>          ret = tls_client_hello_psk(&args, GFP_KERNEL);
>>
>> ... but we never evaluate the 'keyring' parameter from tlshd.
>> Should be easy enough to fix.
> 
> That is only used to link the keyrind in tls_handshake_private_keyring
> and never passed over netlink.
> 
> 
ktls-utils pull request #94.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D472D7BF
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  1 Jul 2025 06:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351371; cv=none; b=qFtNroBvYJXrIUhCe9ucYCzI7Kw5TqIdnWUAE8078tjjLHQfjbVvibrgjGSIg9ScC5qc+akL3Pv/NcillSMJPxA0ftbc49R9BsCPCKpkma9sdhU1IoBT6YXkRQPbp+M6QKepLlk8Pvmqpgmm81kiWh95l4hXVJaoREDqb7fV07g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351371; c=relaxed/simple;
	bh=/8jk/o9mXMKY7cjUbUwg1vjBXdCed47zQOYerAs5OLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7pFb9JtQygNTed92YFl7WTaZ0vushi/bdhDAv/vnsOV8DMKOST4gYvLbE5UdzLurUSUx+LQMn1tyFsK7FAZsdX+/T/Xw2818gKASltPtL3WT93E/siM9/smTG5rHHcdypSRspBgRBGmhDAZ+NHXet7maMoqHFttmn6qVVwwBrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HhOem1cH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Aj851LYf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HhOem1cH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Aj851LYf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HhOem1cH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Aj851LYf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HhOem1cH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Aj851LYf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DB49721163;
	Tue,  1 Jul 2025 06:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751351367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0NwuyHVAUKWuztRc6SQCHzHUMV+aScpvZMGeIGCmhs=;
	b=HhOem1cHO8g+KagMxLpzCYZmDq7DOWn8sHnuPghtSn9Um5X1wl629S8PeB6vUwjboOwIbE
	7uhUBqH3O84ret5xs8WQCeM3ofMsinWglIc6KwJkpn/pvWC8UxYx9GW5Gtf7e/o55SXu/u
	Oq9eXzNaeiFHjbkxo7Npt5Gk+C0Ppqw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751351367;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0NwuyHVAUKWuztRc6SQCHzHUMV+aScpvZMGeIGCmhs=;
	b=Aj851LYf2/bW+tN00qsIWEalD8lQbHbMT0GSYzzrVkrsJVEfclsKy17Upj7yeSGWpiDkjr
	Ik6V/BQhoz/yXWBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751351367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0NwuyHVAUKWuztRc6SQCHzHUMV+aScpvZMGeIGCmhs=;
	b=HhOem1cHO8g+KagMxLpzCYZmDq7DOWn8sHnuPghtSn9Um5X1wl629S8PeB6vUwjboOwIbE
	7uhUBqH3O84ret5xs8WQCeM3ofMsinWglIc6KwJkpn/pvWC8UxYx9GW5Gtf7e/o55SXu/u
	Oq9eXzNaeiFHjbkxo7Npt5Gk+C0Ppqw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751351367;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0NwuyHVAUKWuztRc6SQCHzHUMV+aScpvZMGeIGCmhs=;
	b=Aj851LYf2/bW+tN00qsIWEalD8lQbHbMT0GSYzzrVkrsJVEfclsKy17Upj7yeSGWpiDkjr
	Ik6V/BQhoz/yXWBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B62A71364B;
	Tue,  1 Jul 2025 06:29:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J7SkKUeAY2j8bwAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 01 Jul 2025 06:29:27 +0000
Message-ID: <8bcc132b-46b8-4de4-b001-beab7bf34dce@suse.de>
Date: Tue, 1 Jul 2025 08:29:27 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: netlink 'keyring' attribute
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <de3eebc8-26f8-4d91-92bd-9f37b54649c5@oracle.com>
 <c2a449f0-74db-4dcc-9c99-f1db16e07743@oracle.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <c2a449f0-74db-4dcc-9c99-f1db16e07743@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

On 6/30/25 16:43, Chuck Lever wrote:
> On 6/21/25 11:26 AM, Chuck Lever wrote:
>> Hallo Hannes -
>>
>> Do you happen to have a kernel patch that implements the new 'keyring'
>> attribute in the handshake netlink protocol? I'm about to add another
>> attribute, which might introduce some patch collisions.
> 
> ping...
> 
> If you don't have a patch, I can create an RFC and post it.
> 
> 
Sheesh. Fallen off the radar.

I had it posted at one point, let me check what happened to it...

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

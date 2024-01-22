Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BD440C19
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 Jan 2024 15:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705937093; cv=none; b=UFP+n+7VrC2Q2p6BdUY7kXkP/Xsvag75q/bg5ZZVZovzdt1B1BjieaSYY2FVlwZ3KvLUNYYm0ywhOclCgQtQZtY4oFAG8rSqWkoy2BNqMnCkaTv7B8wOicdbtQBS1v4YFgVB0bU4zLPE63BuHyexkCoDrsbcSdNitNzjYbMaPcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705937093; c=relaxed/simple;
	bh=B0jgB2QHbgjpw1hS61pnaP0Zayhj1Qaqr0CPx5akuf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hnOuof76UrToOGe98+eGfDhFvxitJpACsgCXa+QHPIYeBCQTx9BsKLzKok1a6Ibdgu1m+5RhF2aFFMca7RXuXusdBBZPjeKkC++36iferLyBh9UycDWPLnoUKPNnS+6XJcIE+TLGGIVaHXSgwLW75f53CcpPb2NVC3XsPTLvrH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s8sWsNVj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XYKzwF2p; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s8sWsNVj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XYKzwF2p; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s8sWsNVj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XYKzwF2p";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s8sWsNVj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XYKzwF2p"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BDECC2205F;
	Mon, 22 Jan 2024 15:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1705937089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9paaOcd92Sk9bGTcyQ7YJQogw/Gl5+KOC310kURRT8c=;
	b=s8sWsNVjgnHT/kHHhLwG05vAXef6rfhnNNDBR9q4Q96N/cGWraLHZQK78OrU3H+SooleKZ
	jasnpgb5bihY3KEag6BH4eyxyRjKUjzKxruDh9tV2JUv5ebIt2qR6rAtdFHjWA/Jc3Swi7
	TB6MXg7xIfoFEv6iqBrhXrvAu42J80s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705937089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9paaOcd92Sk9bGTcyQ7YJQogw/Gl5+KOC310kURRT8c=;
	b=XYKzwF2puB+iCZbn2SEtrm2Q6GWl0Iy4VCPBx7y2cAQDhQybF9pr3NAKZk5yAghmJZoq96
	Uypa30QLCNrPZfCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1705937089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9paaOcd92Sk9bGTcyQ7YJQogw/Gl5+KOC310kURRT8c=;
	b=s8sWsNVjgnHT/kHHhLwG05vAXef6rfhnNNDBR9q4Q96N/cGWraLHZQK78OrU3H+SooleKZ
	jasnpgb5bihY3KEag6BH4eyxyRjKUjzKxruDh9tV2JUv5ebIt2qR6rAtdFHjWA/Jc3Swi7
	TB6MXg7xIfoFEv6iqBrhXrvAu42J80s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705937089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9paaOcd92Sk9bGTcyQ7YJQogw/Gl5+KOC310kURRT8c=;
	b=XYKzwF2puB+iCZbn2SEtrm2Q6GWl0Iy4VCPBx7y2cAQDhQybF9pr3NAKZk5yAghmJZoq96
	Uypa30QLCNrPZfCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9EA87136A4;
	Mon, 22 Jan 2024 15:24:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3brDJMGIrmWFaAAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 22 Jan 2024 15:24:49 +0000
Message-ID: <4a73fc38-fa14-4383-8ceb-b9d12872e1c8@suse.de>
Date: Mon, 22 Jan 2024 16:24:32 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Pull Request review
To: Chuck Lever III <chuck.lever@oracle.com>,
 kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <C3BD1E65-F354-4DF3-A716-28A074B59C35@oracle.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <C3BD1E65-F354-4DF3-A716-28A074B59C35@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.42
X-Spamd-Result: default: False [-1.42 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 TO_DN_ALL(0.00)[];
	 NEURAL_HAM_SHORT(-0.20)[-0.986];
	 RCPT_COUNT_TWO(0.00)[2];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-0.14)[67.97%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

On 1/22/24 15:44, Chuck Lever III wrote:
> The contributor would like to add additional restrictions
> to tlshd in it's systemd unit file. Is there a way we can
> request review by distribution security teams?
> 
> https://github.com/oracle/ktls-utils/pull/45
> 
I would like to see the rationale behind it. Especially what are the 
defaults, and why we deviate from the defaults.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), GF: Ivo Totev, Andrew McDonald,
Werner Knoblich


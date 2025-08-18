Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96E75FDA7
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 18 Aug 2025 08:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755507179; cv=none; b=LNbYCgjZQZMlVeOtY502GtyMdJrVRlVtyc6H9PCdxViG5RGoRhIkOPlt7iO610ecpSNXvD/yxLSzQeGBa+Pnf4ePmIBI3tp2voyVQV6sGa5L0Cy55l6gMMYSkfifY5a/n9DbpA/AvUmcQfC2yhP4COV5qDYZLzYgGXqHAAgXx/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755507179; c=relaxed/simple;
	bh=pvbiI5KeDM39MxngcDhwzrngyrQ1zgif5cjSiZVAKqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O1ql4o0a9F8EKSrqnL9y9vwReVgIpS5qmODthMq045+ST7wUkb/FObApYAp2qu3k5jyuwl+vW4hKKfRoIBS/0W/b6N9k7Vf+W+oPkqBtG7xWt1dmYOOrm3atxWhJ06lueYW5KnqcX4o2h4i0z7rVfvQs3b9xlm5MNR8SRIN4Av4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=voMLJ8as; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wXQL1Zfn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=voMLJ8as; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wXQL1Zfn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="voMLJ8as";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wXQL1Zfn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="voMLJ8as";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wXQL1Zfn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 055041F45E;
	Mon, 18 Aug 2025 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755507176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P47WZvElMFgNyXJC+hdCX5eXSM6BWHFPK8xLxONFOJo=;
	b=voMLJ8asRYbP8kV+vcEbqKbxwhG1NXf98Nf/660iXGSkY/M8cL7UZb++FAMv9tDvUXtnFQ
	sYgDfbNu7P6un6/XBnXf+M3ITbSbFwmmiLyWn91NBPHgeRAQwkEeyW1Ef4yNQje2e2Vegr
	gphZV+rpnubIOfYlgaOYJkNx1BZRRhg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755507176;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P47WZvElMFgNyXJC+hdCX5eXSM6BWHFPK8xLxONFOJo=;
	b=wXQL1ZfnJEC2H0Dh6UXFKhrckrhkovJ1eUGZNdRiqOceeHhH3EIdxe40w8WZwJSWUr/3LO
	JovHyZsMx1UJWNDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=voMLJ8as;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wXQL1Zfn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755507176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P47WZvElMFgNyXJC+hdCX5eXSM6BWHFPK8xLxONFOJo=;
	b=voMLJ8asRYbP8kV+vcEbqKbxwhG1NXf98Nf/660iXGSkY/M8cL7UZb++FAMv9tDvUXtnFQ
	sYgDfbNu7P6un6/XBnXf+M3ITbSbFwmmiLyWn91NBPHgeRAQwkEeyW1Ef4yNQje2e2Vegr
	gphZV+rpnubIOfYlgaOYJkNx1BZRRhg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755507176;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P47WZvElMFgNyXJC+hdCX5eXSM6BWHFPK8xLxONFOJo=;
	b=wXQL1ZfnJEC2H0Dh6UXFKhrckrhkovJ1eUGZNdRiqOceeHhH3EIdxe40w8WZwJSWUr/3LO
	JovHyZsMx1UJWNDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EDED313686;
	Mon, 18 Aug 2025 08:52:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2rqsOefpomjYLgAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 18 Aug 2025 08:52:55 +0000
Message-ID: <98e1f182-4f5b-4eef-ad9b-697c846ff07e@suse.de>
Date: Mon, 18 Aug 2025 10:52:55 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: TLS session tags support for tlshd (rough draft)
To: Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <6c65b9cb-82cc-466e-ac48-3efea7258fe9@oracle.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <6c65b9cb-82cc-466e-ac48-3efea7258fe9@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 055041F45E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51

On 8/6/25 19:51, Chuck Lever wrote:
> I pushed my WIP branch that starts to implement TLS session tags
> to this branch:
> 
>    https://github.com/oracle/ktls-utils/tree/tls-session-tags
> 
> One of these patches has a man page tls-session-tags(7), that
> explains things at a high level. An example set of tags is
> defined in /etc/tlshd/tags.d/tags.example (added in one of
> the commits).
> 
> A lot of it is working, some isn't. But these patches serve to
> demonstrate some of the usability and coding issues that have
> come up while developing.
> 
Ach, well, I don't know.
Yet another certificate validation mechanism.
I would have hoped that we have enough validation methods already...
At the same time I do see the need for a selection mechanism
on the server.

But it's for X.509, so I'm not that concerned.
(For now ...). If it works for you, fine.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

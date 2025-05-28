Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F5B244688
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 28 May 2025 07:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748417342; cv=none; b=bOnuU5sQuQ1KV9yxTKWWZbr/uLir6DoQaWegrazqTti0cjgviXUmHwdI0RU8GO58af+izZtC8ScabXhCh28eQo3Gbn93RPqYW2XRD6XURrBW0BPirNk+N30OuMZX9AdVlh6JH65OYopyDltqPk0jjAs8ZjPNU5sPoSMHtMJj4AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748417342; c=relaxed/simple;
	bh=e7e5mhdTw04jd5TLsAkzfcLyWVxviG/4ZlTxBrraALY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ICJPfmlrYM0fhU8i2gIVlNIazJ4GmGIyCsiXLgZ772Zsh122PTbrgPV5YoBDXE9aj+ZpkqUirDYqm1kmKvN/Ga3Zfv4tIZbXwV2JZeXM4O/ieHrUEA4u8JLCoPWkHYq89gUYAwHxh2VVK3uneNyO3TwS78HKqJ6mlmECo+A5NaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cUEGUJ3k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kdrVubWV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cUEGUJ3k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kdrVubWV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cUEGUJ3k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kdrVubWV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cUEGUJ3k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kdrVubWV"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 576AB21D2E;
	Wed, 28 May 2025 07:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748417338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=96GTMKhahatJUBrDAGK0Bin48p07oNeEqjOtQoJqxQ4=;
	b=cUEGUJ3kFFkm2IR/U9K/PRWLeBYO6WCqB5Ew5cGg4RPrCnp6YI3iZZ0dlAaCiSiVNuvlyv
	aBgduKVLxhjE3NkVgBTgj9oukLoGyhJRies5zcZhTSYHgftvb3kXmWtzTYniGTRHrn8hGW
	x6UMK/hpdy4dE7Z6GhK4ntOp6OuA8tI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748417338;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=96GTMKhahatJUBrDAGK0Bin48p07oNeEqjOtQoJqxQ4=;
	b=kdrVubWV08szgyh2vycjKp7YsTjW+J9C1QucJnkHfrUQsshFHUja7beGfRjSWbJ3bff0Yl
	N8Oac7stqztr3wDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748417338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=96GTMKhahatJUBrDAGK0Bin48p07oNeEqjOtQoJqxQ4=;
	b=cUEGUJ3kFFkm2IR/U9K/PRWLeBYO6WCqB5Ew5cGg4RPrCnp6YI3iZZ0dlAaCiSiVNuvlyv
	aBgduKVLxhjE3NkVgBTgj9oukLoGyhJRies5zcZhTSYHgftvb3kXmWtzTYniGTRHrn8hGW
	x6UMK/hpdy4dE7Z6GhK4ntOp6OuA8tI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748417338;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=96GTMKhahatJUBrDAGK0Bin48p07oNeEqjOtQoJqxQ4=;
	b=kdrVubWV08szgyh2vycjKp7YsTjW+J9C1QucJnkHfrUQsshFHUja7beGfRjSWbJ3bff0Yl
	N8Oac7stqztr3wDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 385C9136E3;
	Wed, 28 May 2025 07:28:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /ji2DDq7Nmh3RQAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 28 May 2025 07:28:58 +0000
Message-ID: <5e97878d-e5e7-49b6-8061-95cec14838b7@suse.de>
Date: Wed, 28 May 2025 09:28:57 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Further changes to contribution process
To: Chuck Lever <chuck.lever@oracle.com>,
 Benjamin Coddington <bcodding@redhat.com>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <acad21c7-a9fe-4ef5-a277-3ab27586b56b@oracle.com>
 <23F7204F-02CB-4335-974E-EDF5FF01F03F@redhat.com>
 <0efa01d1-45f3-4d2f-b329-18c5b9a02619@oracle.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <0efa01d1-45f3-4d2f-b329-18c5b9a02619@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On 5/27/25 20:55, Chuck Lever wrote:
> On 5/27/25 1:34 PM, Benjamin Coddington wrote:
>> On 27 May 2025, at 11:23, Chuck Lever wrote:
>>
>>> Hi -
>>>
>>> Now that first-time contributors no longer have to sign the OCA, they
>>> have no need to interact with GitHub at all when contributing.
>>>
>>> I've heard several requests for ktls-utils to change to an email-only
>>> contribution and review process, similar to the one that the Linux
>>> kernel and nfs-utils uses. I've heard no comments in favor of staying
>>> with the GitHub PR style of review process.
>>>
>>> If there are no objections, I can merge a change to CONTRIBUTING.md
>>> that replaces the "GitHub pull request" process with an email-only
>>> process, and then as maintainer, I'll eat the steps of pushing
>>> each contribution to oracle/ktls-utils.
>>>
>>> Does that work for everyone?
>>
>> It works for me - one thing that was nice the last time around was that I
>> could see the automated gating tests for the MR pass or fail before having
>> to harass or request help from anyone.  I think you'll lose that part of
>> the workflow, or be forced to handle it yourself.
> 
> Those check-in tests will continue to be part of the steps I take as
> maintainer. They do seem to run when I push into in my personal copy of
> the ktls-utils repo, so if you fork oracle/ktls-utils you can still run
> those actions before posting.
> 
I would vote for having both methods. The github workflow is nice due to
automated testing and workflow handling, but at the same time imposes
another barrier for new contributors (especially those coming from the
linux kernel side).
So allowing them to send patches vie e-mail will have the advantage that
one can review changes to userland and kernel in one place instead of
having to switch back and forth between systems.
We're using this model for the blktest framework and it seems to work
out nicely.

Plus you can apply for hosting space on git.kernel.org, which will be
helpful, too.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

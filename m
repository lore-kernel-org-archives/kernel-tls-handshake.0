Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38501248F72
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  2 Oct 2025 05:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759382928; cv=none; b=jYb6cK1BvaKMQZZ7D95MTBn2YK1mg72a8hIaezHEwe0TKHfRIaMOJs/9s4DTrKJ580JVrS3LGD8ii0OgzXb7sc9wiUXqFtPjxaVrgpwIl5MEJHjPD3JYBBwG+Eddcitj5kiRSQhKVQp+jO4U2s7z+dpN2X1wBGrfSu/CuvXt2Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759382928; c=relaxed/simple;
	bh=/K7Uckik+yKNtki56loj4vsM/K+/hVx8DZ1Bjfa3PMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oVF4gw4xJdvTb9ZXwK6RisfJfcQoP/943MN8W7g5WNdL3RLF72BYsBTrclPlxAinGlmIUnbfufynoDESoNgLDyVdcgeCYukw9muvUi4nMG8uyneRxRPXJ5h0pYTq6C66ZmrN5hMaScS6inPtqkbtdI2W3OMckmtaETgC1XdMNnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=emZnisVo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o7tg9YQn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=emZnisVo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o7tg9YQn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="emZnisVo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o7tg9YQn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="emZnisVo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o7tg9YQn"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 66848337DA;
	Thu,  2 Oct 2025 05:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759382923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NeMNqIw7y9PJOBfIXYbEdSTLZfj+zDQiOS1qGvm2U/A=;
	b=emZnisVo8Bom3nsFKlre0OyDnB3llZUMCS0LYYdlKlHZE1BVbhCWzhJXlq+OFM8wqAe0UA
	9DndgkGVUsVt7+HsHQX0wPW+EV2PGS5kXGGDs2xrbQwITEUYJpLcf9hHcjQc3X+rrvuL3e
	sVRBTCEvFQGQyYsLXylqK5z3kx5gu+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759382923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NeMNqIw7y9PJOBfIXYbEdSTLZfj+zDQiOS1qGvm2U/A=;
	b=o7tg9YQnz/ZSdQoTgtKTnLTCBoT/vsDLxLCTYbDvJLFKiexftvegOlNC4MtJoWttj0CHen
	jyEkRVqYJC2J6oCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759382923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NeMNqIw7y9PJOBfIXYbEdSTLZfj+zDQiOS1qGvm2U/A=;
	b=emZnisVo8Bom3nsFKlre0OyDnB3llZUMCS0LYYdlKlHZE1BVbhCWzhJXlq+OFM8wqAe0UA
	9DndgkGVUsVt7+HsHQX0wPW+EV2PGS5kXGGDs2xrbQwITEUYJpLcf9hHcjQc3X+rrvuL3e
	sVRBTCEvFQGQyYsLXylqK5z3kx5gu+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759382923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NeMNqIw7y9PJOBfIXYbEdSTLZfj+zDQiOS1qGvm2U/A=;
	b=o7tg9YQnz/ZSdQoTgtKTnLTCBoT/vsDLxLCTYbDvJLFKiexftvegOlNC4MtJoWttj0CHen
	jyEkRVqYJC2J6oCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 24E4D139B0;
	Thu,  2 Oct 2025 05:28:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dELXBYsN3mjDHgAAD6G6ig
	(envelope-from <hare@suse.de>); Thu, 02 Oct 2025 05:28:43 +0000
Message-ID: <768e0842-09cc-47fb-9f66-2443f95094e4@suse.de>
Date: Thu, 2 Oct 2025 07:28:42 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tlshd: fix priority cache initialization
To: Scott Mayhew <smayhew@redhat.com>, alistair@alistair23.me
Cc: chuck.lever@oracle.com, kernel-tls-handshake@lists.linux.dev
References: <0c65e986-77d1-44b4-a4cb-c1a9c2213ba3@app.fastmail.com>
 <20251001233549.436746-1-smayhew@redhat.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20251001233549.436746-1-smayhew@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30

On 10/2/25 01:35, Scott Mayhew wrote:
> Commit 9253f9d added the use of the @SYSTEM keyword as the initial
> keyword in the priority string used by tlshd.  Unfortunately @SYSTEM
> doesn't appear to work on systems that do not have a system-wide
> library configuration set up.
> 
> Instead of trying to pick an initial keyword that will work on all
> systems, let's instead use gnutls_priority_init2() with the
> GNUTLS_PRIORITY_INIT_DEF_APPEND flag instead.  That will *append* our
> priority string to the default options.
> 
> Fixes: 9253f9d ("tlshd: Fix priority string to allow PQC")
> Signed-off-by: Scott Mayhew <smayhew@redhat.com>
> ---
> 
> Alistair, can you try this patch and see if it fixes your issue?
> 
>   src/tlshd/ktls.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
Thanks for doing this. Figuring out the init strings had been a major
pain, so I wasn't that happy with the initial patch.

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

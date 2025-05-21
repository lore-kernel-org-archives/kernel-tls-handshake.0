Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579CD22B8D0
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 21 May 2025 06:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747809796; cv=none; b=YzAq5A5HtUZbCik5807OMEdP8tJeon0Ol6X4MfhLhEhw4NQiy2UC+5zkuK3hYJl4Q2FSX8OBYIP2nUSu/5+HSjqDrJNG75gBcZqbRJa6gMZtDIUxMgRh3MTmnCxCTV/8w7ZAxhg1Xbg6x7MRZmlA9kIHTchBJNdEogCBHapZeGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747809796; c=relaxed/simple;
	bh=qGIXYQUqdoRD6iRlraWeyQRx3rZYGQqnTkyroJ3EeAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f8bAXerbH+bbuQOJ/O3zkSHl2SJ4gIBNixB76tAQv8PX46fT1qWuKkOokZqUAJiRF7IcboJmlYLWZJG76GiyuzVs2kHDqg4TVODliwGrG4U4uXaCalAONr8nXrTdDWQvQipZQi1OWAszZQH/uPEIn0GEJpBMxVJrF3yJnovzsIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X98YZeku; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yLXLvLFr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X98YZeku; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yLXLvLFr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X98YZeku";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yLXLvLFr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X98YZeku";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yLXLvLFr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 40B6C225B4;
	Wed, 21 May 2025 06:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747809792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hz6N4wgJ4V5BvT8mGz7u4HaCb09kr49Nt5vNzP9dzqo=;
	b=X98YZekuaMp3kv+ygQ8t1Yb1FU/WzZEx/sYGtQmF0zuHfp6hYZuafr8TZOInuWaEfepqq8
	ZdnmhnlZCkaze/ffNA4x6h8S1MX4IGjacVtdnRmxiGz/ircgxcwRt81cA+9EP+wLmR+xsn
	Ux7m3lODn/8AuRM9axUOqONhyfP0snI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747809792;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hz6N4wgJ4V5BvT8mGz7u4HaCb09kr49Nt5vNzP9dzqo=;
	b=yLXLvLFrS7kjhWrcCIIhK0TuS0dx92oLbPiyAh5s2GJZ6Vbjj0oCzIw36NPsb7Kuz4oPEr
	I2krfaimyuwgy8Cg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=X98YZeku;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yLXLvLFr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747809792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hz6N4wgJ4V5BvT8mGz7u4HaCb09kr49Nt5vNzP9dzqo=;
	b=X98YZekuaMp3kv+ygQ8t1Yb1FU/WzZEx/sYGtQmF0zuHfp6hYZuafr8TZOInuWaEfepqq8
	ZdnmhnlZCkaze/ffNA4x6h8S1MX4IGjacVtdnRmxiGz/ircgxcwRt81cA+9EP+wLmR+xsn
	Ux7m3lODn/8AuRM9axUOqONhyfP0snI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747809792;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hz6N4wgJ4V5BvT8mGz7u4HaCb09kr49Nt5vNzP9dzqo=;
	b=yLXLvLFrS7kjhWrcCIIhK0TuS0dx92oLbPiyAh5s2GJZ6Vbjj0oCzIw36NPsb7Kuz4oPEr
	I2krfaimyuwgy8Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F43C13AA0;
	Wed, 21 May 2025 06:43:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IJnvCQB2LWguEQAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 21 May 2025 06:43:12 +0000
Message-ID: <a6488280-54af-4127-adbc-65d0cfaad954@suse.de>
Date: Wed, 21 May 2025 08:43:11 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KeyUpdate Support
To: Alistair <alistair@alistair23.me>, kernel-tls-handshake@lists.linux.dev
References: <ba83aadd-8a2e-4080-a6b5-bef272fea606@app.fastmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <ba83aadd-8a2e-4080-a6b5-bef272fea606@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spam-Level: 
X-Rspamd-Queue-Id: 40B6C225B4
X-Spam-Score: -1.51
X-Spam-Flag: NO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.51 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]

On 5/21/25 03:00, Alistair wrote:
> Currently tlshd uses `fork()` to fork the entire process after the kernel
> sends a netlink message. tlshd then calls the `tlshd_service_socket()`
> function from the child process and exits.
> 
> This provides a high barrier between different handshake requests and
> ensures everything is freed when a handshake is complete.
> 
> The problem with the current setup is that it makes it very difficult to
> share information between `tlshd_service_socket()` and the parent process.
> For security and system resources that's great, but it has the large down
> side of not supporting the TLS KeyUpdate.
> 
> In the future we would like to support the TLS KeyUpdate mechanism, which
> means we need to maintain the `gnutls_session_t session` information for a
> connection to allow us to issue a KeyUpdate later on.
> 
> AFAIK there is no way to re-create the `gnutls_session_t session` so we need
> to store it somewhere. We could pass it to the kernel and have the kernel
> pass it back. But `gnutls_session_t session` is gnutls internal state, so
> it's not fixed size making that tricky to do. Plus it will break if gnutls
> updates between a handshake and KeyUpdate.
> 
> The other option is to pass the session data from the child process back
> to the tlshd parent process. The parent can then store the session data
> (maybe in a database?) and use it as required.
> 
> I submitted the first step towards supporting that as a PR [1]. The PR
> changes the current `fork()` multi-process mechanism to a `g_thread_new()`
> threading mechanism.
> 
> In the future this will allow us to maintain the gnutls_session_t session
> in the parent process, allowing KeyUpdate support. This could also be
> supported with `fork()` and IPC as well, but that is clunky-ier.
> 
> My approach [1] hasn't been accepted, so now I'm trying to see what
> ideas other people have for supporting KeyUpdate?
> 
> 1: https://github.com/oracle/ktls-utils/pull/95
> 
Hehe. I knew it would come up.
The reason we didn't implement it for now is that there's an overlap
with session reset. In NVMe any error will be causing a session reset,
which then will trigger a TLS handshake. And, what's more, with secure
concatenation we even generate a new set of TLS PSKs on every reset.
All of this is transparent to the upper layers, so they will only see
a (hopefully short) delay.
Additionally, with the current in-kernel TLS the connection will be
reset when the IV values are being changed, which again would trigger
a reconnect on the NVMe side.

So not that easy.

But if you insist on doing that, why don't you use the keyring to
store the temporary session key? That is persistent, and required
to be present for tlshd to work ...

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0307E1891AB
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 21 May 2025 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840528; cv=none; b=R5RXg5yLiOqIC3mzYVb5c/vw9ce/ZC5CPUUVvVE94634FIdfmpMGXZrvQwPXbV5cwZvoszZiOo4gqT/PbGrY2PNQ5em+1smpELbdGZqDWfyf4gjB+FzbhWZdNGXUgVN2Lovgvl91HvtuTjIMlCwdxPzmAtf4nHBfcfrr/wTtR6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840528; c=relaxed/simple;
	bh=jDbqbYzexECWuVmQXjLkWdqMRnx7cCGlbA+/Lpquuss=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=oybjUqg+gbO+HzkInA7DxU2iK1pr4IbZwX/6SRW9T29RSHw9/7PnpkYCQqedM0/kdzDkIUMhxWGVkVnwdgGF9W5ABAKLXRUfKnnb+/z9PSiPE1xxD1HD+Sn4Da0Q9IL8dmpty+w7r9UXbk1gGXLS3uOwTw+8mjL0Y34w2byi8B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gb8gSIfF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WLyk6v/g; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=elpgZ62L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dZTpLc6m; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gb8gSIfF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WLyk6v/g";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="elpgZ62L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dZTpLc6m"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CE6F71FB49;
	Wed, 21 May 2025 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747840524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HqNrHOpdqCcPEcvVaqG/SMAJPxVzzDBoAemEEBHHS5o=;
	b=Gb8gSIfF4U9bwgkRKX6kzrKt3R6aeKkeExEmEAqW83zwiH4UcmyZ42JzYm19dkXeXUHRIL
	rgUkWg345aS4iTlWaGE/HadJsOGEIVnw249AdErAYvM47nvCo/hobJdI47QT8e3UIY91fA
	dsbB5IqYdvX1kzln+fBWaK/cLyNJNhc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747840524;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HqNrHOpdqCcPEcvVaqG/SMAJPxVzzDBoAemEEBHHS5o=;
	b=WLyk6v/gY8DXRjKvJlDBVNxtxgcYHWruGynlixuoHHZSLTf/r5jE23GCdiBefjgVOmUByd
	HkNB6OD+O3FS+nCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=elpgZ62L;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dZTpLc6m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747840523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HqNrHOpdqCcPEcvVaqG/SMAJPxVzzDBoAemEEBHHS5o=;
	b=elpgZ62LHgCrWLnAq5ZRFZBosccq3eOOC2n9FlLm24l0NuXGUfMs/Vl/xF7+7f0Yt2NCE3
	zZhW2eIsEetKtO1ZcRok+0iI3i+Psg99jyq2CPpWJAiAA3qdRlNJU+A1eUbmkmI13Spu2b
	w2mRjuWU2wY/fUHpwFb1nGE4Mrmwlx0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747840523;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HqNrHOpdqCcPEcvVaqG/SMAJPxVzzDBoAemEEBHHS5o=;
	b=dZTpLc6msbx4WV40HQML/AU9U93DrV2uqn/m+UIN+b9rN5lp8tlBYVdrNGuCelweV8qsc2
	5+0CH+3m7ImGjyAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD65E13888;
	Wed, 21 May 2025 15:15:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NGNzLQvuLWgtIgAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 21 May 2025 15:15:23 +0000
Message-ID: <49a61a63-db9a-42cd-afa9-3f177400bd86@suse.de>
Date: Wed, 21 May 2025 17:15:19 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KeyUpdate Support
From: Hannes Reinecke <hare@suse.de>
To: Alistair <alistair@alistair23.me>, kernel-tls-handshake@lists.linux.dev
References: <ba83aadd-8a2e-4080-a6b5-bef272fea606@app.fastmail.com>
 <a6488280-54af-4127-adbc-65d0cfaad954@suse.de>
Content-Language: en-US
In-Reply-To: <a6488280-54af-4127-adbc-65d0cfaad954@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spam-Level: 
X-Rspamd-Queue-Id: CE6F71FB49
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]

On 5/21/25 08:43, Hannes Reinecke wrote:
[ .. ]
> Hehe. I knew it would come up.
> The reason we didn't implement it for now is that there's an overlap
> with session reset. In NVMe any error will be causing a session reset,
> which then will trigger a TLS handshake. And, what's more, with secure
> concatenation we even generate a new set of TLS PSKs on every reset.
> All of this is transparent to the upper layers, so they will only see
> a (hopefully short) delay.
> Additionally, with the current in-kernel TLS the connection will be
> reset when the IV values are being changed, which again would trigger
> a reconnect on the NVMe side.
> 
> So not that easy.
> 
> But if you insist on doing that, why don't you use the keyring to
> store the temporary session key? That is persistent, and required
> to be present for tlshd to work ...
> 
Oh, and I forgot the most crucial thing: NVMe-TCP can't do it with
the current implementation. It's using the ->read_sock() interface
which gets the skb (not the msg), so we won't be getting the control
message which we need to get notified about the KeyUpdate event.

Meaning we would need to switch over to a recvmsg-based receive
flow; I have patches for that, but they are on hold as we can't
easily do a digest calculation there.
But now that Eric Biggers send a patch series to use the 'crc32'
calculation directly I guess I should revisit those patches.

Unless someone beats me to it ...

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

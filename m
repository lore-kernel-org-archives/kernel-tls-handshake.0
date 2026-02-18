Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C93B342503
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Feb 2026 15:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771429954; cv=none; b=B/r3xeFWpXfyoEZqi2esMmsJNBFVWiGnpCih3pwdGdOI6qscwZnwFBtxgOkdpb4ADxW+4hvR+Z8tY+if0nPdPNzN8qllde0xW9lQ9bnJaIlWU1aNHrIapWVGmwr1zPQXXviurvtIYyu8JMeNsyHD3StzwMNzzxnakVf6Cc/JZIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771429954; c=relaxed/simple;
	bh=wfFK3cGxyBrr4jq+8xvXD0zZPhP8nSNGNrezkIJGmFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQBKwgvRHFGLu3fLNy1YWkNSnWcOs1uiqCizuUyw1sYhxV6pgWlJiBa4rv85y15xobW/1ughIk+d/mA+fh5V51IzSTcFr60HQ85fmUb1HGZ4ji5v3TqD5Yla4A1WswxNeZcWirqJ3z2IX/T2vgwobgvP19/ReToedQAkIrDlBrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RZrcD9wG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gxjki1LE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RZrcD9wG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gxjki1LE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RZrcD9wG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gxjki1LE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RZrcD9wG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gxjki1LE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 581235BCD9;
	Wed, 18 Feb 2026 15:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771429951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S4LnZ8fozSBHDp3UWHPpxMaxnm8O1Xfa+oTLBbs5nlc=;
	b=RZrcD9wGBeuaYyiM3tzcTnVSqwYP/X4UKtpFKnQg2CM9CFieeNkkLxImQC/Eo50iVl9wO3
	A4MMm9WxycZ9wc3ZH+mjIhnFEZ4LL7LQ/V9Dtc42BDt9AJOEBZB8g9vC1zddceuXbMsEEW
	uGtmkNhf0gvOtk/p5ophz0NX2S5PGz8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771429951;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S4LnZ8fozSBHDp3UWHPpxMaxnm8O1Xfa+oTLBbs5nlc=;
	b=gxjki1LEOIYPm6CPl3WE7xmrnEKMzvCD1ENoiWcNansN1EAXyM05XfyNq5kCCkC9Y1gaXx
	rrUA2I+JyuJp5iAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RZrcD9wG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gxjki1LE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771429951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S4LnZ8fozSBHDp3UWHPpxMaxnm8O1Xfa+oTLBbs5nlc=;
	b=RZrcD9wGBeuaYyiM3tzcTnVSqwYP/X4UKtpFKnQg2CM9CFieeNkkLxImQC/Eo50iVl9wO3
	A4MMm9WxycZ9wc3ZH+mjIhnFEZ4LL7LQ/V9Dtc42BDt9AJOEBZB8g9vC1zddceuXbMsEEW
	uGtmkNhf0gvOtk/p5ophz0NX2S5PGz8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771429951;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S4LnZ8fozSBHDp3UWHPpxMaxnm8O1Xfa+oTLBbs5nlc=;
	b=gxjki1LEOIYPm6CPl3WE7xmrnEKMzvCD1ENoiWcNansN1EAXyM05XfyNq5kCCkC9Y1gaXx
	rrUA2I+JyuJp5iAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F9823EA65;
	Wed, 18 Feb 2026 15:52:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lch7Bj/glWlBdgAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 18 Feb 2026 15:52:31 +0000
Message-ID: <1330bf39-196c-4ef5-8f36-fd407e7e6605@suse.de>
Date: Wed, 18 Feb 2026 16:52:30 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] net: Introduce read_sock_cmsg proto_ops for
 control message delivery
To: Chuck Lever <cel@kernel.org>, Olga Kornievskaia <okorniev@redhat.com>
Cc: kernel-tls-handshake@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
References: <20260217222033.1929211-1-cel@kernel.org>
 <20260217222033.1929211-2-cel@kernel.org>
 <29c55055-a7e9-485a-8290-4f0bc1543a59@suse.de>
 <c4c6ac9f-10d0-45ae-a35d-b1266f7a06d9@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <c4c6ac9f-10d0-45ae-a35d-b1266f7a06d9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 581235BCD9
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 

On 2/18/26 15:33, Chuck Lever wrote:
> On 2/18/26 2:29 AM, Hannes Reinecke wrote:
>> On 2/17/26 23:20, Chuck Lever wrote:
>>> From: Chuck Lever <chuck.lever@oracle.com>
>>>
>>> Kernel TCP consumers that use the read_sock interface
>>> (proto_ops.read_sock) cannot receive TLS control messages (Alerts,
>>> Handshake records) when kTLS is active. The current
>>> tls_sw_read_sock() method rejects non-data records with -EINVAL, and
>>> the sk_read_actor_t callback has no channel for delivering record-
>>> type metadata.
>>>
>>> Four kernel subsystems are affected: NFSD (sunrpc svcsock), NFS
>>> client (sunrpc xprtsock), NVMe target (nvmet-tcp), and NVMe host
>>> (nvme-tcp). Each of these either falls back to the slower
>>> sock_recvmsg() API or lacks TLS alert handling entirely.
>>>
>> And that is the contentious topic.
>> Is it really slower?
> 
> I measured 5-10% throughput increases and latency drops with NFSD,
> /without/ TLS. The primary benefit of this series is that it handles
> CMSG (TLS Alerts) much more cleanly.
> 
> 
>> The way I see it, ->read_sock() has an advantage when you can work
>> with skbuffs (ie network packets) directly. Then it has the benefit
>> of being paced with the packets arriving as they do on the network.
>>
>> But for TLS this is no longer true; the TLS skbuffs are synthesized
>> on top of the TCP stream, and the boundary of a TLS skbuff is completely
>> decoupled from the TCP skbuff (in theory, at least).
>>
>> This can result in TLS skbuff stalls when waiting for the remainder
>> of the TCP data stream to arrive.
> 
> An entire TLS Record has to be present before it can be decrypted and
> passed to the socket consumer. Is that what you mean?
> 
Yes. And that makes ->read_sock() a bit pointless (from my POV); looking
at the network stack the skbuffs are assembled/decoded by the TLS layer,
only to be converted into skbuffs again for ->read_sock().
Which seems a bit pointless.

But the main point with ->read_sock() is that we can only process
skbuffs, ie we have to wait for the TLS layer to assemble the entire
record.
With recvmsg() we at least have a theoretical choice of returning
a short read, allowing the code to do something clever in the meantime.

Mind you, that is all conjecture. Might well be that ->read_sock()
is beneficial for TLS, too. Or, at least, doesn't do any harm.
It's just that I don't trust the author of the TLS read_sock()
implementation; his network stack knowledge isn't _that_ great.

(Problem is that my performance measurements always ran into
some obnoxious occasional stall, rendering the entire measurement
pretty worthless. So I couldn't tell whether the recvmsg()
implementation delivers a benefit or not)

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

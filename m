Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA6130F53A
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Feb 2026 07:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771399754; cv=none; b=Anuhzwa3qB4ZXdRxnXTsaZ6IUQyRkyKGIpFnXjt4Kihm2BW8MHo06uTDQUBd9/V66QwfJhGiRiIlflMfyG66J+/XUuGCyvI1+UNGSHIqDbD3NYnUnhMYIACm7qIJVmU0S7SCQWqgFOG9FJHe5HtrLxKYzmeTPoatn8lHaYrKoSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771399754; c=relaxed/simple;
	bh=v5HI+qi9lIQAXfllWnC1Ot08HEj4ppXKS3Mbsi1nDp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SukOPntf9/mwT2/OfbJYN//SsLwRmeoLmnuRhmKp8VJ17JvJsiz3gX7NgulYomy/PcGkeMRhJsyTd5btvGibI/HcA71qOQ3NMyzL6OTu5uU22ZmPAVU8oWyVOE6ptniZbtJch1A1BHPQA1lM5yAu8RTy93+VrP1i14srShYJEjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=USE0jSZp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mL4CcfxP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=USE0jSZp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mL4CcfxP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="USE0jSZp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mL4CcfxP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="USE0jSZp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mL4CcfxP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4A6C33E6E7;
	Wed, 18 Feb 2026 07:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771399751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D14uKMxp8bqw5/nI26IlaVYlJ7j4dc/awhSMvmeiqkU=;
	b=USE0jSZpK8jWho2DvFYxPmUoTsVJtqKrm5rZGKYf5EoYi8UmBd+4+xdcUkD3n21xacnHKQ
	JWbRwiq7Lb8zs+HXqo0ENbXD44kVZeACeVMUXkTlTxvGl4CMTSq0FthGzevGje4mozIoDJ
	XZ1qFrzpvZP99IB+iGjdu1HU4KdXhfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771399751;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D14uKMxp8bqw5/nI26IlaVYlJ7j4dc/awhSMvmeiqkU=;
	b=mL4CcfxPjBCaLh8Akz//JBXnNQETjOaRnbdiiZqQynfiozjJq7/+a9Kc/Tn5kgSsx6/Kgg
	Mai0Hjlp6xijz4Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771399751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D14uKMxp8bqw5/nI26IlaVYlJ7j4dc/awhSMvmeiqkU=;
	b=USE0jSZpK8jWho2DvFYxPmUoTsVJtqKrm5rZGKYf5EoYi8UmBd+4+xdcUkD3n21xacnHKQ
	JWbRwiq7Lb8zs+HXqo0ENbXD44kVZeACeVMUXkTlTxvGl4CMTSq0FthGzevGje4mozIoDJ
	XZ1qFrzpvZP99IB+iGjdu1HU4KdXhfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771399751;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D14uKMxp8bqw5/nI26IlaVYlJ7j4dc/awhSMvmeiqkU=;
	b=mL4CcfxPjBCaLh8Akz//JBXnNQETjOaRnbdiiZqQynfiozjJq7/+a9Kc/Tn5kgSsx6/Kgg
	Mai0Hjlp6xijz4Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04D2A3EA65;
	Wed, 18 Feb 2026 07:29:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PFHuOkZqlWnXZAAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 18 Feb 2026 07:29:10 +0000
Message-ID: <29c55055-a7e9-485a-8290-4f0bc1543a59@suse.de>
Date: Wed, 18 Feb 2026 08:29:10 +0100
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
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260217222033.1929211-2-cel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 

On 2/17/26 23:20, Chuck Lever wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
> 
> Kernel TCP consumers that use the read_sock interface
> (proto_ops.read_sock) cannot receive TLS control messages (Alerts,
> Handshake records) when kTLS is active. The current
> tls_sw_read_sock() method rejects non-data records with -EINVAL, and
> the sk_read_actor_t callback has no channel for delivering record-
> type metadata.
> 
> Four kernel subsystems are affected: NFSD (sunrpc svcsock), NFS
> client (sunrpc xprtsock), NVMe target (nvmet-tcp), and NVMe host
> (nvme-tcp). Each of these either falls back to the slower
> sock_recvmsg() API or lacks TLS alert handling entirely.
> 
And that is the contentious topic.
Is it really slower?

The way I see it, ->read_sock() has an advantage when you can work
with skbuffs (ie network packets) directly. Then it has the benefit
of being paced with the packets arriving as they do on the network.

But for TLS this is no longer true; the TLS skbuffs are synthesized
on top of the TCP stream, and the boundary of a TLS skbuff is completely
decoupled from the TCP skbuff (in theory, at least).

This can result in TLS skbuff stalls when waiting for the remainder
of the TCP data stream to arrive.

So for TLS I _think_ it's beneficial to use recvmsg, as there you have
the full set of options available.

And actually I have a patch switching nvme over to recvmsg(), but that
has stalled due to precisely this question: read_sock() inherently
faster than recvmsg? Or is that just the perception (we are closer
to the hardware, so it _must_ be faster)?

(Speaking as the author of the ->read_sock() callback for TLS.
I never really liked it ;-)

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

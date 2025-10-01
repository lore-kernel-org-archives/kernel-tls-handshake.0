Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCD446BF
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  1 Oct 2025 15:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759332427; cv=none; b=O1V8qgSIvfqAiPy4jGZiODDh44MqAyD6HjO9KDv5fByWHW2VnfjWwh8CstqRayk1IbhzsdWWl0GUMsu8fSMZEBHyyeG4Is0I6KdITaP1LIm+G9miGNNxNIu5hxiXBd2LYyahNJzHmutSFgPCFdprVP/lGzcQ7+RESNyQZR83iws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759332427; c=relaxed/simple;
	bh=IK3fHpeHkWtKe3I/JfaOlsCfyljQDse5OQF2itteDbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LSqx9+7KdHse0W0JWYnJuudsTWOMJB2Na4t+UW29W0co6dRvYjA50+OSjsdrGCOKAjTs8iaMiC4o2omrR7XuZQbKPMuN/flrbZbx3RM7EB8GHE9ZAq18qNxov2yc0OKu9SAKawodwijT38u4OEHPIgk6nUMmjirwbgppwRdhUlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k7VAwG28; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b4C8+hN9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k7VAwG28; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b4C8+hN9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k7VAwG28";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b4C8+hN9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k7VAwG28";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b4C8+hN9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 231BE336D1;
	Wed,  1 Oct 2025 15:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759332422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BKZUISwdoOU6Vj///ruLs16WnJMK/nUU5zG9EE/ztUo=;
	b=k7VAwG28HgSpFdSO1NyMokkBUXZ/pWHUgrbEOwRKZtrOmVxmsG5wZimCVz6G1BOdyQzfMW
	7+pwJ5vwFZxkWPrmX8OnnyFQbhNd9ENyQkUC7SxxOQ+ARJ9kc6MAMucppMk1OHJyzd6ovo
	HGXu8+r0Q5jbuNdbq2syNwLAaTk6HgU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759332422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BKZUISwdoOU6Vj///ruLs16WnJMK/nUU5zG9EE/ztUo=;
	b=b4C8+hN9TiBuNqU94sMACUik4kNWD6ccDhhQoxR82GcPXwl2aNNLwVh5ujjkRXAOV8+MI2
	ZTVPaVWwkX7G3iBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759332422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BKZUISwdoOU6Vj///ruLs16WnJMK/nUU5zG9EE/ztUo=;
	b=k7VAwG28HgSpFdSO1NyMokkBUXZ/pWHUgrbEOwRKZtrOmVxmsG5wZimCVz6G1BOdyQzfMW
	7+pwJ5vwFZxkWPrmX8OnnyFQbhNd9ENyQkUC7SxxOQ+ARJ9kc6MAMucppMk1OHJyzd6ovo
	HGXu8+r0Q5jbuNdbq2syNwLAaTk6HgU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759332422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BKZUISwdoOU6Vj///ruLs16WnJMK/nUU5zG9EE/ztUo=;
	b=b4C8+hN9TiBuNqU94sMACUik4kNWD6ccDhhQoxR82GcPXwl2aNNLwVh5ujjkRXAOV8+MI2
	ZTVPaVWwkX7G3iBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E58E613A3F;
	Wed,  1 Oct 2025 15:27:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sCRqNUVI3WgLOQAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 01 Oct 2025 15:27:01 +0000
Message-ID: <9ca1828f-49a2-45e6-b8c4-dc64be71b33f@suse.de>
Date: Wed, 1 Oct 2025 17:26:57 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Support KeyUpdate
To: alistair23@gmail.com, kernel-tls-handshake@lists.linux.dev
Cc: Alistair Francis <alistair.francis@wdc.com>
References: <20251001042734.17307-1-alistair.francis@wdc.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20251001042734.17307-1-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30

On 10/1/25 06:27, alistair23@gmail.com wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The TLS 1.3 specification allows the TLS client or server to send a
> KeyUpdate. This is generally used when the sequence is about to
> overflow or after a certain amount of bytes have been encrypted.
> 
> Work is on going to add KeyUpdate support to Linux:
> https://lkml.org/lkml/2025/9/5/137
> 
> This series updates ktls-utils to handle the KeyUpdate request and
> update the keys.
> 
> As part of supporting KeyUpdate ktls-utils will need to save the
> connection state in the kernel keyring during the initial handshake.
> The kernel then provides the key serial back to userspace when handling a
> KeyUpdate. ktls-utils can use this to restore the gnutls session (using
> the patches mentioned below) and then update the keys.
> 
> This requires the following gnutls patches that aren't yet upstream:
>   - https://gitlab.com/gnutls/gnutls/-/merge_requests/2021
>   - https://gitlab.com/gnutls/gnutls/-/merge_requests/1968
> 
> and kernel support, which is added by: https://lkml.org/lkml/2025/9/5/137
> 
> Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3

Right. I've been too slow. Actually I have been working on a different
approach, as this approach has some pitfalls which I'm not that 
comfortable with:
- gnutls session restore is _actually_ tied to the 'NewTicket'
   TLS mechanism. While it _might_ work without having tickets enabled,
   I'm not sure if we don't run into unforeseen issues.
- From what I've seen, the gnutls 'key update' function will always
   update _both_ vectors, for TX _and_ RX. That works for the receiver
   side (as this side receives the TLS Keyupdate message, updates
   the RX keys, sends the TLS KeyUpdate, and updates the TX keys).
   But for the sender side we need to send the Keyupdate, update
   TX keys, _wait_ for the Keyupdate message, and then update the
   RX keys.
   And I haven't found a way how I could instruct gnutls to do that.
- The actual key update really just means to derive a new set of
   TX and RX keys from the traffic secrets. And the code for doing
   that already exists (in some form) in tlshd.

So my approach is slightly different: having tlshd handling the
keyupdate directly without invoking gnutls.
In order to do so we 'just' need to export the hkdf_expand_label()
function from gnutls. Once we have that we use a gnutls callback
to retrieve the resulting traffic application key from the handshake
and store that key in the keyring.
The key will then be passed with the 'session_id' setting in the
accept response, and stored in the kernel structure.
Then upon KeyUpdate we have this workflow:
Sender:
  - Call into tlshd to start KeyUpdate on the TX side with setting
    'session_id' in the 'accept' request.
  - tlshd sends KeyUpdate message with 'update' bit set
  - tlshd reads the key from 'session_id', derives a new traffic
    application key, stores it in the keyring, updates the
   'session_id' setting.
  - tlshd derives a new TX keys from the traffic application key
    and updates the ktls vectors.
Receiver:
   - kernel receives the KeyUpdate message
   - kernel calls into tlshd to start KeyUpdate on the RX side
     with setting 'session_id' in the 'accept' request
   - tlshd reads the key from 'session_id', derives a new traffic
     application key, stores it in the keyring, updates the
     'session_id' setting.
   - calling 'done' to return the the kernel

And then the receiver switches roles (and becomes the sender),
and starts the above process but without the 'update' bit
set in the KeyUpdate message.

The good thing here is that we don't need to modify tlshd
too much, and we have full control over the handling of the
KeyUpdate message.

Will see to send the patchset next week.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

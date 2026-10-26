Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001243;
	b=OnQD+n/nLz+m8E23J0S2Ib1kVIdXPSwcLhlGfO1AuIYDig4QU8QW4O8ZMHH/WwMu+C18
	 MIqfdByf8XqmlwU2z0mMo5qpSzL8iYul98mpW31SSGwVWSgJEMyZ6ZD0051KSBTr+05Kj
	 ARnyVF1AalQE996iJBq+As/tH98LmHdtf5kZZfun2YLmXyHx8r2yhMSwNxcpggVruQua9
	 yxRC9vaoJBUjym0fhEYHCmZZyuSjzIpf1c9CvwOGhwAUy2bRCTjO9V2fhw9vdR6N4VmmJ
	 38kPX+5dEMCnBsJa0664qTRSg8jcZjmRaDgLVh3ZcwwUd6M7cuoZByx/tNQgiSEgxOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001243;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=SIp4QR3vwRckjVLzjaMY1L4v9YZri4TNxdhX5Zxxs1s=;
	b=M2FYoF1oidb+8UxtxjRqkGaKnzYP4eQgSsA8HhSsCW/MILaqLmlyZ4pHZHaEjYVK50Qx
	 6rtkKn3iVX5vVTisriXuAUS9LUseTC20FegaWGsGBm05+hNn5Cxs3Jy9cOnxvVES0nymk
	 jZluRfF1m0h822Nf4MDujkAN7xOMH7wQleh1Co9frvTgscZzGNngDAUGFgmUfRI9ptLoB
	 CvuMEUxITIZrvjqxP3CPdmGv1fZTT396QjRwG77igkFgJ4nwphBG24lBHdQseP+8b0ENf
	 d/jgBQY1nEO0LFQTC6TwJYGCtFspzOlH/gnVQuC+fmNIRhp3ae0IwKp0yB2QR5tjvjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nxlmmU1U;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kneQ6wJY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nxlmmU1U;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kneQ6wJY;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87AE606A31E
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 26 Oct 2026 07:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C87AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nxlmmU1U;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kneQ6wJY;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nxlmmU1U;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kneQ6wJY
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 479551F7A2
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 26 Oct 2026 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793001241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIp4QR3vwRckjVLzjaMY1L4v9YZri4TNxdhX5Zxxs1s=;
	b=nxlmmU1UNqdsmwivBQPamoDr2WMEdnru/5Ak6papFzXVOLhWt5N9eP837W/d9qfMlTN4BS
	RPEI/JZy0/qMDC2Hd1xkfWIPU2gHuhLMM+oPiQlFIIuNc6LBCKuBrVVBybIoBUdgfTxI2Y
	laTkj5q/hJkQP6pCBtz/nEp6TB4WTfk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793001241;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIp4QR3vwRckjVLzjaMY1L4v9YZri4TNxdhX5Zxxs1s=;
	b=kneQ6wJYG0OAtbrLG9VpTcj/VHo/J0O+9FkiZkWdTYl72JRPDwAkCDPoRARFaH3jfkBw/k
	bh6Md9IqGXKyFdCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nxlmmU1U;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kneQ6wJY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793001241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIp4QR3vwRckjVLzjaMY1L4v9YZri4TNxdhX5Zxxs1s=;
	b=nxlmmU1UNqdsmwivBQPamoDr2WMEdnru/5Ak6papFzXVOLhWt5N9eP837W/d9qfMlTN4BS
	RPEI/JZy0/qMDC2Hd1xkfWIPU2gHuhLMM+oPiQlFIIuNc6LBCKuBrVVBybIoBUdgfTxI2Y
	laTkj5q/hJkQP6pCBtz/nEp6TB4WTfk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793001241;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIp4QR3vwRckjVLzjaMY1L4v9YZri4TNxdhX5Zxxs1s=;
	b=kneQ6wJYG0OAtbrLG9VpTcj/VHo/J0O+9FkiZkWdTYl72JRPDwAkCDPoRARFaH3jfkBw/k
	bh6Md9IqGXKyFdCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1014B13319
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 26 Oct 2026 07:54:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3g3WNRgH32qAEwAAD6G6ig
	(envelope-from <hare@suse.de>)
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 26 Oct 2026 07:54:01 +0000
Message-ID: <63937950-9739-4d93-884a-18eae575b190@suse.de>
Date: Mon, 26 Oct 2026 08:54:00 +0100
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Post: <mailto:kernel-tls-handshake@lists.linux.dev>
List-Help: <mailto:kernel-tls-handshake+help@lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernel-tls-handshake+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next 5/5] selftests/tls: add KeyUpdate tests
To: kernel-tls-handshake@lists.linux.dev
References: <20261025-keyupdate-rfc-v1-0-60b7756eccbd@gmail.com>
 <20261025-keyupdate-rfc-v1-5-60b7756eccbd@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261025-keyupdate-rfc-v1-5-60b7756eccbd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-13.50 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[kernel-tls-handshake@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -13.50
X-Spam-Level: 
X-Rspamd-Queue-Id: 479551F7A2

On 10/26/26 1:36 AM, Martin Belanger via B4 Relay wrote:
> From: Martin Belanger <martin.belanger@dell.com>
> 
> Test the in-kernel KeyUpdate on a bidirectional connection with both
> traffic secrets registered on each socket:
> 
> - registration errors: wrong length, missing key, TLS 1.2, SM4, and
>    the RX secret before the TX secret;
> - KeyUpdates in both directions with data around them;
> - a data record, a KeyUpdate and another data record queued before
>    the first read;
> - update_requested: the peer answers before its next data, and a
>    second request waits for the answer;
> - splice() across a KeyUpdate;
> - a key installed with TLS_TX removes the registered secrets;
> - more than 8 KeyUpdates in one second, and an invalid
>    request_update value, end the connection.
> 
> Assisted-by: LLM
> Signed-off-by: Martin Belanger <martin.belanger@dell.com>
> ---
>   tools/testing/selftests/net/tls.c | 249 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 249 insertions(+)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

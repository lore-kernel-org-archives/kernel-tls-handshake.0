Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E46F1917F1
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  6 Oct 2025 06:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759731419; cv=none; b=T5YBMYwbfgLEzZk/P9ypuxaiKQy2EFzDlKHWXREVcZHJpxbxsnwzgfUc9cQdSofDPk6u0NlQA5bWTKGcIgh5oAx3Ird2VKZeVLl7huBhLikvVh3AANQq3KzyAlXcQa/1Pf5k58p12Wk2iOGp/WH1IACcRgDR3Eo/D9xnM4lEmsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759731419; c=relaxed/simple;
	bh=Bp5YbdLLOV14CZTHoLMZ6w8RvhlK6LJl4sKvbYMzUOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P45TX/qpk53ynXl5Z6BzpZO7RQw867ocjiJ6uH+RNC2/bzQWLtcibMypAbw0jdtt2O7WBq4opeD7syenKRR3THDiCMDkLwyxLP1Nr8oR9LT3L/Es+Uzn/0W3slg+K3MXvSdMcDqXft2dleVRvShtb0ttD0h3uBwOpyZOsaPqNq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yd8faP8y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tCZiJcyJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yd8faP8y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tCZiJcyJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yd8faP8y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tCZiJcyJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yd8faP8y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tCZiJcyJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 540001F452;
	Mon,  6 Oct 2025 06:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759731414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fv+CbbzFMesNQPHeGpvHLilXY/hF3upC+Djo5qBtTW8=;
	b=yd8faP8ynzRwSg+nMc/Ed46aJXzJMn3JVmsdr2ERiziAaF3+Tp7C70qN39qHHJPTTQfBI2
	ZD6A2APQZAUj1+PPYWF8odwYiQo4MgLu7n08lCy11nyoyC04vPExU8MmaoUsy/AkyGqeq4
	uf18F5DVfJDbI6hwUfGUiVUK+xBxwj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759731414;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fv+CbbzFMesNQPHeGpvHLilXY/hF3upC+Djo5qBtTW8=;
	b=tCZiJcyJUYHR24sGd+wjOUI3JZENOPdOuSnrKgB54K+vkp3hSkJ8lmf3+wHJYW9XdLgIgQ
	GZLRaJSszJY7vCDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759731414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fv+CbbzFMesNQPHeGpvHLilXY/hF3upC+Djo5qBtTW8=;
	b=yd8faP8ynzRwSg+nMc/Ed46aJXzJMn3JVmsdr2ERiziAaF3+Tp7C70qN39qHHJPTTQfBI2
	ZD6A2APQZAUj1+PPYWF8odwYiQo4MgLu7n08lCy11nyoyC04vPExU8MmaoUsy/AkyGqeq4
	uf18F5DVfJDbI6hwUfGUiVUK+xBxwj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759731414;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fv+CbbzFMesNQPHeGpvHLilXY/hF3upC+Djo5qBtTW8=;
	b=tCZiJcyJUYHR24sGd+wjOUI3JZENOPdOuSnrKgB54K+vkp3hSkJ8lmf3+wHJYW9XdLgIgQ
	GZLRaJSszJY7vCDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8F4E13995;
	Mon,  6 Oct 2025 06:16:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dHRgM9Ve42j6BgAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 06 Oct 2025 06:16:53 +0000
Message-ID: <05d7ba0e-fe39-4f86-9e46-7ba95fccdce9@suse.de>
Date: Mon, 6 Oct 2025 08:16:53 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] net/handshake: Ensure the request is destructed on
 completion
To: alistair23@gmail.com, chuck.lever@oracle.com, hare@kernel.org,
 kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, Alistair Francis <alistair.francis@wdc.com>
References: <20251003043140.1341958-1-alistair.francis@wdc.com>
 <20251003043140.1341958-4-alistair.francis@wdc.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20251003043140.1341958-4-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com,oracle.com,kernel.org,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.30

On 10/3/25 06:31, alistair23@gmail.com wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> To avoid future handshake_req_hash_add() calls failing with EEXIST when
> performing a KeyUpdate let's make sure the old request is destructed
> as part of the completion.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> v3:
>   - New patch
> 
>   net/handshake/request.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/net/handshake/request.c b/net/handshake/request.c
> index 0d1c91c80478..194725a8aaca 100644
> --- a/net/handshake/request.c
> +++ b/net/handshake/request.c
> @@ -311,6 +311,8 @@ void handshake_complete(struct handshake_req *req, unsigned int status,
>   		/* Handshake request is no longer pending */
>   		sock_put(sk);
>   	}
> +
> +	handshake_sk_destruct_req(sk);
>   }
>   EXPORT_SYMBOL_IF_KUNIT(handshake_complete);
>   
Curious.
Why do we need it now? We had been happily using the handshake mechanism 
for quite some time now, so who had been destroying the request without
this patch?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

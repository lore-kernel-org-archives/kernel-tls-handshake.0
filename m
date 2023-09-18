Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29101F5E9
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 18 Sep 2023 17:35:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C76F02004B;
	Mon, 18 Sep 2023 17:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1695058516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2QwOZNKI5k0GBh9UCAuQXEFN4vsydEGsoSfFjC45jMM=;
	b=VtKSgOv4lIx7c/l2LExihuAyrzKDYcWzOpb91VhkR/+xmWrVbQFKkyTXvCNetewNqKz1Us
	sVBvP9L4gC+72LwL2MUOCpdDxpSRqHVOzNI9B5prw/Gt3wtuDhI8xyYJ6DIpZ6fWZB5PxV
	v/158ZgtJ03b9ttZYvWQu3GmYiMKeks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695058516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2QwOZNKI5k0GBh9UCAuQXEFN4vsydEGsoSfFjC45jMM=;
	b=lgY3PhWhTOaLSr5ZkmMVt18H8SuJemZy5K1hv/IzV4JTYNt8veadjaXuAMRgY3Ui6MRHMk
	571F+v2LHoWtUMCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 978381358A;
	Mon, 18 Sep 2023 17:35:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +AzOHVSKCGXTGgAAMHmgww
	(envelope-from <hare@suse.de>); Mon, 18 Sep 2023 17:35:16 +0000
Message-ID: <08cae189-0697-428f-a2e8-27ffd95c32e2@suse.de>
Date: Mon, 18 Sep 2023 19:35:16 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Reminder: In-kernel TLS task force meeting
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>,
 kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <C1CF4349-635C-4BD4-A0C4-7811E23A179B@oracle.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <C1CF4349-635C-4BD4-A0C4-7811E23A179B@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/18/23 15:48, Chuck Lever III wrote:
> Here's your friendly reminder that the in-kernel TLS task force
> meeting will be held tomorrow, Tuesday, September 19 at 10:30
> US/Eastern. The Zoom co-ordinates are:
> 
> Single click URL to join Zoom: https://oracle.zoom.us/j/97455381263?pwd=R0RvY0RRRnJGZUVJb1dMK2NBdURXZz09
> 
> Meeting ID: 974 5538 1263
> Password: 86875724
> 
> 
> Possible agenda topics include:
> • ktls-utils 0.10 next steps
> • Potential locations for x.509 certificate recipes
> • Patches for kTLS support for re-key:
>      https://lore.kernel.org/netdev/cover.1691584074.git.sd@queasysnail.net/
> 
> 
> Bring your favorite hot (or adult) beverage.
> 
Might be a tad tricky, what with me being in Bilbao at the Open Source 
Summit. But I see what I can do.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


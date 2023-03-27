Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307EE3C0F
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 27 Mar 2023 15:38:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 43B2421C31;
	Mon, 27 Mar 2023 15:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679931488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dyAG7yLIqGrnGfOdyaKCTZGuHC8VjX8gyJRXWqbgm2E=;
	b=qO5QT6OgcwuUxWU7bC2V+07pCfF2QREVDXiqLW0h0DgydoMDCtqIb918hpvJ4gEK7AYHK0
	z7G3boZkq0zJp3skG7CGhkRZDZztaButzRt3uqT0RhFowY6yjP8AndpLyGvPxjJCyBrUo/
	J7aEyS7MIgD2vzbfdblopO8oNGPZt5o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679931488;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dyAG7yLIqGrnGfOdyaKCTZGuHC8VjX8gyJRXWqbgm2E=;
	b=7cIhqhRegTJhViBG9U5pQl+E55e5/R74ZNDnINyBPfaUsZEVIqk5az75PlOtyaCZN7vuff
	4EbG7K5DIOClh4AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3076613329;
	Mon, 27 Mar 2023 15:38:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id rnavCmC4IWQOPQAAMHmgww
	(envelope-from <hare@suse.de>); Mon, 27 Mar 2023 15:38:08 +0000
Message-ID: <85c10c3e-fd89-c05c-2ed3-d8b81cf4f615@suse.de>
Date: Mon, 27 Mar 2023 17:38:07 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: ktls-utils update
To: Chuck Lever III <chuck.lever@oracle.com>, Jeff Layton <jlayton@redhat.com>
Cc: "kernel-tls-handshake@lists.linux.dev"
 <kernel-tls-handshake@lists.linux.dev>
References: <95A50C6B-435B-455E-BF18-4FEAF41F147F@oracle.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <95A50C6B-435B-455E-BF18-4FEAF41F147F@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/23 15:58, Chuck Lever III wrote:
> Hi-
> 
> I've applied all pending netlink patches to ktls-utils, and
> removed the netlink and netlink-v7 branches. This means any
> subsequent work will just go onto the main branch as a normal
> patch instead of the chaos we've had since ktls-utils 0.7.
> 
> I'd like to start preparing for two things:
> 
> - Release of ktls-utils 0.8
> 
> - Incorporation of ktls-utils in distributions. How can we start
> the process for Fedora and OpenSuSE ? I'd like to get any packaging
> nits resolved before the release of 0.8.
> 
I got one fix pending which I haven't submitted yet, so please hold off 
until then. Will get preparing a PR shortly.

> Will distributions want a tarball release, or can they pull a tag
> from a github repo? So far I've been providing both on github.
> 
We would prefer to have a tarball, as experience shows that git tags can 
be changed and might yield different results than the tarball itself.
Reproducible builds and all that ...

Cheers,

Hannes


Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055BA160
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 21 Apr 2023 06:32:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 19B5A1FDDB;
	Fri, 21 Apr 2023 06:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682058723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=anBXLsOH67TngonUM9cUYiFUalItWHQkLvb7KU6lRDA=;
	b=D62WDrk1RJWWq0aiGrAoYAmo2nJ0GNJ6eGwIrbMgTLkJD9M9sJKMMX27NPPYDqwkFp3h5T
	VGsyAC82LV58szBJb71TAA0l2XiLnwi6cUhN98Ju/gMqUKWfFGdMFctPGSO6OfMycCJJ1p
	y8+Frp+nLkdtI4kMKdXRzxUDz5dmHb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682058723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=anBXLsOH67TngonUM9cUYiFUalItWHQkLvb7KU6lRDA=;
	b=3eqQXoWEbG2YfRHwqH3zj0SEFPudsRJNVrH0gHtzoDIip4Sbrb55h8G07oYLT3pKE0t9cJ
	w1+q1kxgUhjFvsBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0863B13456;
	Fri, 21 Apr 2023 06:32:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UF0LAuMtQmR+cgAAMHmgww
	(envelope-from <dwagner@suse.de>); Fri, 21 Apr 2023 06:32:03 +0000
Date: Fri, 21 Apr 2023 08:32:02 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>, 
	Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, 
	Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
Subject: Re: [PATCH 13/17] nvme-fabrics: parse options 'keyring' and 'tls_key'
Message-ID: <bp3sinhr2fgfooryjbiezzsyuz2kwarxhldsgsbhij5uk7suct@hrdupmuv7jpn>
References: <20230419065714.52076-1-hare@suse.de>
 <20230419065714.52076-14-hare@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419065714.52076-14-hare@suse.de>

On Wed, Apr 19, 2023 at 08:57:10AM +0200, Hannes Reinecke wrote:
> Parse the fabrics options 'keyring' and 'tls_key' and store the
> referenced keys in the options structure.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>

Thanks!

Reviewed-by: Daniel Wagner <dwagner@suse.de>

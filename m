Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9806E1C31
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Mar 2023 08:53:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D8DFA21B2C;
	Thu, 30 Mar 2023 08:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680166418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SRg2ie3c/1WdpsjFl3BkEJIYLcootwhbqojGUyjMMpI=;
	b=pkgs2+VLqKP4z3VEMGoq6Ynu8X0JQpG/7Ss9MuDHeXRbB6XQvnc9ciHya6hsqEQKTnL5XJ
	0xwGk4nXnLE5nG65GBZ/gwYSdrosogxMb0hj72+PQ9FhYdxf0+BWvnDXIkCM6SG3oKu75X
	GgsjHNkQjrF3Em//ExladOMa6l4dkeg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680166418;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SRg2ie3c/1WdpsjFl3BkEJIYLcootwhbqojGUyjMMpI=;
	b=3aukwAWQDRqf3slKFjkoC4nB+q0KVFKaRJxF8h+FnSlnMX0Zh6an+CxHsZOJVak3flPq0j
	YYvu2yU7pHKwX8BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA941138FF;
	Thu, 30 Mar 2023 08:53:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SCJcMRJOJWSfJAAAMHmgww
	(envelope-from <dwagner@suse.de>); Thu, 30 Mar 2023 08:53:38 +0000
Date: Thu, 30 Mar 2023 10:53:38 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
	Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev
Subject: Re: [PATCH 01/18] nvme-keyring: register '.nvme' keyring and add
 CONFIG_NVME_TLS
Message-ID: <20230330085338.cf5z7zvy3elxiusm@carbon.lan>
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-2-hare@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329135938.46905-2-hare@suse.de>

On Wed, Mar 29, 2023 at 03:59:21PM +0200, Hannes Reinecke wrote:
> +++ b/drivers/nvme/host/core.c
> @@ -25,6 +25,9 @@
>  #include "nvme.h"
>  #include "fabrics.h"
>  #include <linux/nvme-auth.h>
> +#ifdef CONFIG_NVME_TLS
> +#include <linux/nvme-keyring.h>
> +#endif
>  
>  #define CREATE_TRACE_POINTS
>  #include "trace.h"
> @@ -3954,7 +3957,6 @@ static umode_t nvme_dev_attrs_are_visible(struct kobject *kobj,
>  	if (a == &dev_attr_dhchap_ctrl_secret.attr && !ctrl->opts)
>  		return 0;
>  #endif
> -
>  	return a->mode;
>  }
>  
> @@ -5414,13 +5416,21 @@ static int __init nvme_core_init(void)
>  		result = PTR_ERR(nvme_ns_chr_class);
>  		goto unregister_generic_ns;
>  	}
> -
> -	result = nvme_init_auth();
> +#ifdef CONFIG_NVME_TLS
> +	result = nvme_keyring_init();
>  	if (result)
>  		goto destroy_ns_chr;
> +#endif

Would it make sense to introduce empty nvme_keyring_init() function for
!CONFIG_NVME_TLS and avoid this ifdefery here?

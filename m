Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FF81FC4
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Mar 2023 12:54:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E02EB21A18;
	Thu, 30 Mar 2023 12:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680180864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CEbRUz/ElrqRxRFuU1BfEJQbWcHx5l+POx/F9f+fgwA=;
	b=MAh01rxkt3jKLYRuTWcScY8liVQvOxzNBNUQlElU56qbwx/O7y95U2xSqiuDw8Boqk2FE4
	KrFNfWiSehSRVpO7C6HMTY7+AYKZgyfMyCeC00+PLvjughRClyj/hvxghdk5iVfZTuvx76
	nlc2ZTTlANMgzWgLCdzWxWH3ceackgY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680180864;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CEbRUz/ElrqRxRFuU1BfEJQbWcHx5l+POx/F9f+fgwA=;
	b=a+NNppD5K48IsvWYWJHJHPGu8FVsPng+HmE0iwy179TTuBSi0Mafoz9U4m9f+fh5VFABI1
	drgF9XFsiIxTEUDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D28761348E;
	Thu, 30 Mar 2023 12:54:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8VFbM4CGJWSSdQAAMHmgww
	(envelope-from <dwagner@suse.de>); Thu, 30 Mar 2023 12:54:24 +0000
Date: Thu, 30 Mar 2023 14:54:24 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
	Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev
Subject: Re: [PATCH 09/18] nvme-tcp: enable TLS handshake upcall
Message-ID: <20230330125424.q65gcbu7rrmnmueb@carbon.lan>
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-10-hare@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329135938.46905-10-hare@suse.de>

On Wed, Mar 29, 2023 at 03:59:29PM +0200, Hannes Reinecke wrote:
 --- a/drivers/nvme/host/fabrics.c
> +++ b/drivers/nvme/host/fabrics.c
> @@ -609,6 +609,7 @@ static const match_table_t opt_tokens = {
>  	{ NVMF_OPT_DISCOVERY,		"discovery"		},
>  	{ NVMF_OPT_DHCHAP_SECRET,	"dhchap_secret=%s"	},
>  	{ NVMF_OPT_DHCHAP_CTRL_SECRET,	"dhchap_ctrl_secret=%s"	},
> +	{ NVMF_OPT_TLS,			"tls"			},
>  	{ NVMF_OPT_ERR,			NULL			}
>  };

This should be ifdef out for !CONFIG_NVME_TLS

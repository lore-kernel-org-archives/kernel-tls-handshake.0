Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5BD15C7
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 05:52:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8B9211F8D5;
	Tue, 18 Apr 2023 05:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681797169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sALavvPoXpZUPcg+b0trSrjfW0CKl7Mze8UtMWFCXbo=;
	b=m0TmtPtDvAwFGB8lGCOgC+CYmmpVqVhvFZ4ik2T2vi10+043acI24c3pV1rgctEf9wedWQ
	TZJwsg5DGFsXquGSn8rIlDM/ywSZZLx+/1eMvlPR0OI6fpr0+l7kaiGNixpNQTxJSwTlI5
	qtozCjERRR+6I1f8+uj9k9KSU4Iqwvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681797169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sALavvPoXpZUPcg+b0trSrjfW0CKl7Mze8UtMWFCXbo=;
	b=3GD+6AGdTTOjcMgwUY9TUbnQPsD2Jt/5/tL4u26DkQoiKaJ3hBqABu62amqgtyIaX6UMa/
	i174I1rgoVaiEGCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C65E13319;
	Tue, 18 Apr 2023 05:52:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id tvVXHjEwPmRfMgAAMHmgww
	(envelope-from <dwagner@suse.de>); Tue, 18 Apr 2023 05:52:49 +0000
Date: Tue, 18 Apr 2023 07:52:48 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>, 
	Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, 
	Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
Subject: Re: [PATCH 11/18] nvme-tcp: enable TLS handshake upcall
Message-ID: <msf6bjfbqiaj7s3ejxjwiueg7omvctsjftnux3qfvwadeg2jiq@hawgvoslzjo2>
References: <20230417130302.86274-1-hare@suse.de>
 <20230417130302.86274-12-hare@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417130302.86274-12-hare@suse.de>

On Mon, Apr 17, 2023 at 03:02:55PM +0200, Hannes Reinecke wrote:
 --- a/drivers/nvme/host/fabrics.c
> +++ b/drivers/nvme/host/fabrics.c
> @@ -609,6 +609,7 @@ static const match_table_t opt_tokens = {
>  	{ NVMF_OPT_DISCOVERY,		"discovery"		},
>  	{ NVMF_OPT_DHCHAP_SECRET,	"dhchap_secret=%s"	},
>  	{ NVMF_OPT_DHCHAP_CTRL_SECRET,	"dhchap_ctrl_secret=%s"	},
> +	{ NVMF_OPT_TLS,			"tls"			},
>  	{ NVMF_OPT_ERR,			NULL			}
>  };

Coming back to your previous discussion about this. 'tls' is always announced
but not always supported. This renders the unsupported option filtering added to
libnvme useles:

  https://github.com/linux-nvme/libnvme/issues/612

Let's assume we go ahead with this patch. The user set explicit the tls option
via 'nvme connect ... --tls' and the kernel will return EINVAL, but userland
can't really know what it was and drop --tls and retry again (or print some
useful information). It could be any other parameter provided by the user.

How is userland supposed to do any feature detection?

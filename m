Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD723AFFE
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 15:41:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1EAD81FDF9;
	Wed, 29 Mar 2023 15:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680104513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cEyC0/nrUS4sC4gtrmv2XP7UM5muRnnz2RETfLi85PM=;
	b=xCdDxHLPse7GKNRI2yW5ttRflbNFztxNvrTcRMjtVWVrDa64Dhie4sGX5/5hApPwwdn8Ji
	VZ8CThsfTzLVhPJ6VAGMGNTM8vAnWeHl9cCe1GIAa5yZeiE7UzOHiI2enPXtc9JrJli9wT
	ODUIccTtbbSSmCoqhgmoX3H5kYetv1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680104513;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cEyC0/nrUS4sC4gtrmv2XP7UM5muRnnz2RETfLi85PM=;
	b=LpSOXSAPOGWTT2cQOVj46iyOhm2A8HDo3GiNgSYCyNstBnX4edqbXzwXmwx/ij61h5RBND
	Z4ibSIy7U0YEy2BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EAA65139D3;
	Wed, 29 Mar 2023 15:41:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id BsJZOEBcJGQuXwAAMHmgww
	(envelope-from <hare@suse.de>); Wed, 29 Mar 2023 15:41:52 +0000
Message-ID: <d97fa181-077a-6183-bdd2-17ad51b0fbc9@suse.de>
Date: Wed, 29 Mar 2023 17:41:52 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 05/18] net/tls: implement ->read_sock()
Content-Language: en-US
To: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev,
 Boris Pismenny <boris.pismenny@gmail.com>
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-6-hare@suse.de>
 <d177a5d6-3f76-4eee-0cc5-2c6d995c2e8a@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <d177a5d6-3f76-4eee-0cc5-2c6d995c2e8a@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/29/23 17:37, Sagi Grimberg wrote:
> 
>> Implement ->read_sock() function for use with nvme-tcp.
> 
> Nice.
> 
>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>> Cc: Boris Pismenny <boris.pismenny@gmail.com>
> 
> Would be great to see a tls_device implementation as well.

Sheesh. But first we would need to update the tls_device implementation 
to TLS 1.3:

int tls_set_device_offload(struct sock *sk, struct tls_context *ctx)
[ .. ]
         crypto_info = &ctx->crypto_send.info;
         if (crypto_info->version != TLS_1_2_VERSION) {
                 rc = -EOPNOTSUPP;
                 goto release_netdev;
         }

which I'd rather defer to Boris or whoever maintains the hardware.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


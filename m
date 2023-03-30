Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D001FC4
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 30 Mar 2023 12:59:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8C0C11F37E;
	Thu, 30 Mar 2023 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680181191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lg25NWhnMP0gaisU2D0nCzZLd/UJpiz05GklhhcuxXE=;
	b=l5ZJ2+6JeSj/iiqEeaRLqeDnaWCfGv88hBpTCRZ7S1PpX4UGmZTa4mwtuNkzlB17wWoUbo
	44NLrqwP7d8qxssf+5mlgIDJD2CILVguVXq4+f0mNRKKzsP9zUqapeWI/wR7xn81oBwo+4
	7b+UQGmlB/xc+f/I9C0ubG9m/XCtft8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680181191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lg25NWhnMP0gaisU2D0nCzZLd/UJpiz05GklhhcuxXE=;
	b=ABLNih4ozBJ8NTfm3YwkiSsQu0Yq+dlimFWuHlgfEMcs3MmxRs1Mxj41woThi+U1GpgDP6
	086QcSMy1LlTpADw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A6171348E;
	Thu, 30 Mar 2023 12:59:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id x8qNHceHJWRQeAAAMHmgww
	(envelope-from <hare@suse.de>); Thu, 30 Mar 2023 12:59:51 +0000
Message-ID: <8b4125d6-62f0-8416-f11d-9b5f3f58c70b@suse.de>
Date: Thu, 30 Mar 2023 14:59:51 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 09/18] nvme-tcp: enable TLS handshake upcall
Content-Language: en-US
To: Daniel Wagner <dwagner@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-10-hare@suse.de>
 <20230330125424.q65gcbu7rrmnmueb@carbon.lan>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230330125424.q65gcbu7rrmnmueb@carbon.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/30/23 14:54, Daniel Wagner wrote:
> On Wed, Mar 29, 2023 at 03:59:29PM +0200, Hannes Reinecke wrote:
>   --- a/drivers/nvme/host/fabrics.c
>> +++ b/drivers/nvme/host/fabrics.c
>> @@ -609,6 +609,7 @@ static const match_table_t opt_tokens = {
>>   	{ NVMF_OPT_DISCOVERY,		"discovery"		},
>>   	{ NVMF_OPT_DHCHAP_SECRET,	"dhchap_secret=%s"	},
>>   	{ NVMF_OPT_DHCHAP_CTRL_SECRET,	"dhchap_ctrl_secret=%s"	},
>> +	{ NVMF_OPT_TLS,			"tls"			},
>>   	{ NVMF_OPT_ERR,			NULL			}
>>   };
> 
> This should be ifdef out for !CONFIG_NVME_TLS

No, I did that on purpose.
Error handling in the fabrics option parsing is notoriously bad, and if 
we disable that nvme-cli will fail with annoying interfaces.
As it stands, the 'tls' option will be accepted, but you'll get a kernel 
message telling you it's not compiled in, and the function returns -EINVAL.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		           Kernel Storage Architect
hare@suse.de			                  +49 911 74053 688
SUSE Software Solutions Germany GmbH, Frankenstr. 146, 90461 Nürnberg
Managing Directors: I. Totev, A. Myers, A. McDonald, M. B. Moerman
(HRB 36809, AG Nürnberg)


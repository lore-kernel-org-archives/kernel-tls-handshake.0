Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE6AAFFA
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 15:24:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CA2021FE01;
	Wed, 29 Mar 2023 15:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680103465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PC83zyI2MkiTdocQjSJCPagzOohj9//XCpX2Mc2SR7s=;
	b=zE9qbYxXiCR3yfYjvgdagddwRCw91K8ZNCTP64ttwLJuOeCUwqsFlJo/+S9kJiigOcyvp3
	R66G1BH//XBgVjnvkHRTGKa39DvV8cwegbyT9IBxBvuS3Za/J5DOn0HTHy2ZA1rcIyrFRz
	YsY7EUb/uiRE+ESLXRyahevnnAhRRno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680103465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PC83zyI2MkiTdocQjSJCPagzOohj9//XCpX2Mc2SR7s=;
	b=b7zCcl3/2fpCw1prWjZNAfMXmBTswLDl8IDiEelBs6nk3MvK1JNzR67On2BZx/gmxC63r7
	J2WSguhcIaN4a+CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 430F6139D3;
	Wed, 29 Mar 2023 15:24:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id l/lyDilYJGQLVQAAMHmgww
	(envelope-from <hare@suse.de>); Wed, 29 Mar 2023 15:24:25 +0000
Message-ID: <8fab4f74-cd27-3838-a4f9-6e5b3705d527@suse.de>
Date: Wed, 29 Mar 2023 17:24:24 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 01/18] nvme-keyring: register '.nvme' keyring and add
 CONFIG_NVME_TLS
Content-Language: en-US
To: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <chuck.lever@oracle.com>, kernel-tls-handshake@lists.linux.dev
References: <20230329135938.46905-1-hare@suse.de>
 <20230329135938.46905-2-hare@suse.de>
 <56ab2e76-1d5e-0002-cf23-6c7e9b82d233@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <56ab2e76-1d5e-0002-cf23-6c7e9b82d233@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/29/23 16:49, Sagi Grimberg wrote:
> 
>> Register a '.nvme' keyring to hold keys for TLS and DH-HMAC-CHAP and
>> add a new config option NVME_TLS to enable support for NVMe-TCP/TLS.
>> We need a separate keyring for NVMe as the configuration is done
>> via individual commands (eg for configfs), and the usual per-session
>> or per-process keyrings can't be used.
>>
>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>> ---
>>   drivers/nvme/common/Kconfig   |  9 +++++++++
>>   drivers/nvme/common/Makefile  |  1 +
>>   drivers/nvme/common/keyring.c | 36 +++++++++++++++++++++++++++++++++++
>>   drivers/nvme/host/core.c      | 19 +++++++++++++++---
>>   include/linux/nvme-keyring.h  | 12 ++++++++++++
>>   5 files changed, 74 insertions(+), 3 deletions(-)
>>   create mode 100644 drivers/nvme/common/keyring.c
>>   create mode 100644 include/linux/nvme-keyring.h
>>
>> diff --git a/drivers/nvme/common/Kconfig b/drivers/nvme/common/Kconfig
>> index 4514f44362dd..b6fff16da1fb 100644
>> --- a/drivers/nvme/common/Kconfig
>> +++ b/drivers/nvme/common/Kconfig
>> @@ -2,3 +2,12 @@
>>   config NVME_COMMON
>>          tristate
>> +
>> +config NVME_TLS
>> +    bool "NVMe/TCP TLS encryption support"
>> +    depends on NVME_COMMON
> 
> depends on TLS as well? Or maybe select would be more appropriate?
> 
I would argue 'depends', as we cannot use the standard 
session/process/thread keyrings, as they'll vanish after the initial 
'connect', and then there's no keyring to lookup keys for subsection 
reconnects.

>> +    select KEYS
>> +    help
>> +      Enables TLS encryption for NVMe/TCP using the netlink handshake 
>> API.
>> +
>> +      If unsure, say N.
> 
> Would it not make sense to default it to y?

Yeah.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


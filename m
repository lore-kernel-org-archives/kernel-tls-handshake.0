Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E163310E9
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 13:30:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 28E7821EAF;
	Tue, 21 Mar 2023 13:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679405401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uEitndIR6vyJoSrnYmZ0yeLcVZ8eG+GHXR0xzZiC3v8=;
	b=u4SIfw6IRVqZbie/ix7H+xAwabNT4TAzglBTkJjuCIdIWD8tRYg8wEt8Dg9UOKMb4nODif
	0leXlBt0uAUVAX4jg18XQ66phIW8JS4N1wVkrQrNn36yR/RvW7pfZoVVXjnnu7YSUGiRkv
	1S3RVkFvaZ9mA7lj7k0H4HFmnMC22JI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679405401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uEitndIR6vyJoSrnYmZ0yeLcVZ8eG+GHXR0xzZiC3v8=;
	b=7ns4uT6SycuGd4ozt/kpKxRiWeVqAAGOWHKk1Y8z8xzrDKtK/NHdCyrB4Lb6BDwKbljnbf
	nFOokqcXBSKnL6Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D33D13451;
	Tue, 21 Mar 2023 13:30:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cFHnBlmxGWS3DwAAMHmgww
	(envelope-from <hare@suse.de>); Tue, 21 Mar 2023 13:30:01 +0000
Message-ID: <f9630511-d843-89fe-64db-1a4c41dbbd08@suse.de>
Date: Tue, 21 Mar 2023 14:30:00 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 00/18] nvme: In-kernel TLS support for TCP
Content-Language: en-US
To: Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 Chuck Lever <cel@kernel.org>, kernel-tls-handshake@lists.linux.dev
References: <20230321124325.77385-1-hare@suse.de>
 <98884644-99f3-7b3c-387a-66fbdd98d4ed@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <98884644-99f3-7b3c-387a-66fbdd98d4ed@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/21/23 14:12, Sagi Grimberg wrote:
> 
>> Hi all,
>>
>> finally I've managed to put all things together and enable in-kernel
>> TLS support for NVMe-over-TCP.
> 
> Hannes (and Chuck) this is great, I'm very happy to see this!
> 
> I'll start a detailed review soon enough.
> 
> Thank you for doing this.
> 
>> The patchset is based on the TLS upcall mechanism from Chuck Lever
>> (cf '[PATCH v7 0/2] Another crack at a handshake upcall mechanism'
>> posted to the linux netdev list), and requires the 'tlshd' userspace
>> daemon (https://github.com/oracle/ktls-utils) for the actual TLS 
>> handshake.
> 
> Do you have an actual link to follow for this patch set?

Sure.

git.kernel.org:/pub/scm/linux/kernel/git/hare/scsi-devel.git
branch tls-netlink.v7

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		           Kernel Storage Architect
hare@suse.de			                  +49 911 74053 688
SUSE Software Solutions Germany GmbH, Frankenstr. 146, 90461 Nürnberg
Managing Directors: I. Totev, A. Myers, A. McDonald, M. B. Moerman
(HRB 36809, AG Nürnberg)


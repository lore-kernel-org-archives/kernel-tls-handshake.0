Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68951187D
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 28 Mar 2023 10:04:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AFF761F854;
	Tue, 28 Mar 2023 10:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679997860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1hAdGF97iIefDKJjwUntUBVqSwoqYbzmfxgyIOj18oM=;
	b=ilnxHT8PXyQAJ0nvssV0vKuCk6TIlU2D9pVliufpVhK5md5mjc71eFd6kIQLZSO+aCrD2t
	Jy5cSXHFX9oKo5fdgqSY/H/2ItGHg/KdfYuGKp5t9OFoA2KkQr3wkTH821J7XiFHVQ7e0g
	tQtInsHdrowvMlXf0c0Jex9hWzro5Ac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679997860;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1hAdGF97iIefDKJjwUntUBVqSwoqYbzmfxgyIOj18oM=;
	b=4KntcIRn3TV30MKiTKOsZ2ii2LJpxPy3wkOptDf7o4JmC441UTmDvNaOWk3YnWWSsHJ+uE
	p73Yx/tejPZd+DBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9BACD1390D;
	Tue, 28 Mar 2023 10:04:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CPawJaS7ImR8XQAAMHmgww
	(envelope-from <hare@suse.de>); Tue, 28 Mar 2023 10:04:20 +0000
Message-ID: <7ef60c30-d318-4656-3102-020560343ee9@suse.de>
Date: Tue, 28 Mar 2023 12:04:20 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 15/18] nvmet-tcp: enable TLS handshake upcall
Content-Language: en-US
To: Sagi Grimberg <sagi@grimberg.me>, Chuck Lever III <chuck.lever@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 Chuck Lever <cel@kernel.org>,
 "kernel-tls-handshake@lists.linux.dev" <kernel-tls-handshake@lists.linux.dev>
References: <20230321124325.77385-1-hare@suse.de>
 <20230321124325.77385-16-hare@suse.de>
 <6f69983c-17bd-dd72-b941-95f55db10180@grimberg.me>
 <b8a2e1d4-3571-447b-25c6-c6dd25fbad02@suse.de>
 <a1af3f6b-ec9e-4e91-ad70-57fcc9010a91@grimberg.me>
 <c426d104-b7f2-e736-c23a-b94fda54ed37@suse.de>
 <e0620d94-9729-014c-2cb8-8ff826ebbefa@grimberg.me>
 <e016af81-f77e-2eba-a805-838f62ba50f7@suse.de>
 <68AA3629-6B88-4098-AA03-BEDF614F8D0B@oracle.com>
 <ea181844-69f5-66eb-e64e-e9871916532b@grimberg.me>
 <3ad50302-6b3c-6d6a-669e-0b11c2df6a6b@suse.de>
 <c9b5bb2d-89d7-8805-6d60-2c53e13f5d58@grimberg.me>
 <7c3da604-251f-209e-db6d-d1bee5a838c5@suse.de>
 <8d0ddb2d-0b4e-e782-6507-a1d61b5d53f4@grimberg.me>
 <8fa65f04-7e82-77a6-00de-f51d20138ece@suse.de>
 <3962f9d9-2ee0-2065-827f-ca0cda881271@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <3962f9d9-2ee0-2065-827f-ca0cda881271@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/28/23 11:43, Sagi Grimberg wrote:
> 
>>>> But there might be the odd case where the data_ready
>>>> callback is invoked after kTLS has been started but before
>>>> we're setting it to nvmet_tcp_data_ready().
>>>
>>> What does nvmet_tcp_data_ready has to do with it?
>>> You are changing nvmet_tcp_listen_data_ready.
>>>
>> This is not a 'race;
>>>> Then we cannot guarantee that sk_user_data really is set
>>>> to the 'queue' pointer, so we should skip the function.
>>>
>>> nvme_tcp_listen_data_ready was invoked, then sk->sk_data_ready
>>> is nvme_tcp_listen_data_ready. Are you referring to the case
>>> where the callback has changed before the read lock ?
>>>
>> No. The callback is changed when the userspace daemon starts ktls, as
>> that will set sk->sk_data_ready to tls_data_ready().
>>
>> So before the userspace upcall we have the chain:
>>
>> sk_data_ready -> nvmet_tcp_listen_data_ready()
>>
>> and after a (successful) upcall we have the chain
>>
>> sk_data_ready -> tls_data_ready
>>    -> nvmet_tcp_listen_data_ready()
>>
>> once we set our callback we have
>>
>> sk_data_ready -> nvmet_tcp_data_ready
>>    -> tls_data_ready
>>      -> nvmet_tcp_listen_data_ready
>>
>> Calling into nvmet_tcp_listen_data_ready() is pointless here,
>> but we cannot remove the callback either. So we should to deactivate
>> it to avoid any side effects.
> 
> Thanks for the explanation.
> 
> First, I would like to understand how is this different from
> svc.
> 
> Second, we don't want nvmet_tcp_listen_data_ready keep being
> called from the datapath, especially as it is taking a read
> lock, for absolutly no good reason.
> 
> Why don't we restore the original socket callback before
> we trigger the handshake? then we wait for the handshake
> to complete, and then store nvmet_tcp_data_ready once it
> is done?

Yep, that works.

Will be updating the patch.

Cheers,

Hannes


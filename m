Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7378F23C0
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 18 Apr 2023 11:02:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A000321A91;
	Tue, 18 Apr 2023 11:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681815754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=16TFCdKk9HB5/zol6veJLssefZsUoa/IVdihclHV2cg=;
	b=gjLgF8TUJH9T/3PqD5TIgEY8acEebQv3j3z4278hL8wD70IEy7J8Y5bavZyq+97al6ADqQ
	DyV91a794I4Hi8kFnIUTPj1W4uwLL9e37CpyObJedvu8A1dgSx1ynOjZuioQeSL/aCjRMg
	0CKyM9+0EINT9dehVTg3Ak19upA3hFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681815754;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=16TFCdKk9HB5/zol6veJLssefZsUoa/IVdihclHV2cg=;
	b=pOAGseS1OR6/yuqfSgAiv2enhZ/kaBZutB5vP71ZVdKMR3KQdOQsEycp7rSboPfrpEkcnc
	/Jg4Omp/NyynXIAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 871C1139CC;
	Tue, 18 Apr 2023 11:02:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 1G+5IMp4PmS9XgAAMHmgww
	(envelope-from <hare@suse.de>); Tue, 18 Apr 2023 11:02:34 +0000
Message-ID: <ab73a25d-8b2c-17de-d4ea-edd844c600af@suse.de>
Date: Tue, 18 Apr 2023 13:02:34 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 07/18] net/tls: sanitize MSG_EOR handling
Content-Language: en-US
To: Sagi Grimberg <sagi@grimberg.me>, Jakub Kicinski <kuba@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, Chuck Lever <chuck.lever@oracle.com>,
 kernel-tls-handshake@lists.linux.dev
References: <20230417130302.86274-1-hare@suse.de>
 <20230417130302.86274-8-hare@suse.de>
 <20af9713-8d64-77de-dfbe-e9e732776d3c@grimberg.me>
 <20230417131048.66b6b3a0@kernel.org>
 <beb7b0e8-2cb5-0c0e-63f9-6a13b9dfb787@grimberg.me>
 <db39fd2d-6da2-852e-70aa-7499fedf8b48@suse.de>
 <b313144b-f510-f3d5-6066-6123c27039ed@suse.de>
 <392cfcc6-c4c7-da94-4e00-f6961c548867@grimberg.me>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <392cfcc6-c4c7-da94-4e00-f6961c548867@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/18/23 12:43, Sagi Grimberg wrote:
> 
> 
> On 4/18/23 13:39, Hannes Reinecke wrote:
>> On 4/18/23 12:24, Hannes Reinecke wrote:
>>> On 4/18/23 12:07, Sagi Grimberg wrote:
>>>>
>>>>>>> The TLS stack is using MSG_EOR internally, so the flag cannot be
>>>>>>> set for sendmsg()/sendpage(). But to avoid having the caller to
>>>>>>> check whether TLS is active modify the code to clear the MSG_EOR
>>>>>>> flag. And blank out MSG_MORE / MSG_SENDPAGE_NOTLAST, too, as they
>>>>>>> conflict with MSG_EOR anyway.
>>>>>>
>>>>>> This looks like a temporary workaround to me.
>>>>>>
>>>>>> The networking folks really need to be CC'd on this (same for 
>>>>>> patch 6).
>>>>>
>>>>> Thanks, when I said "we can support EOR" I obviously meant support
>>>>> not ignore it :(  No ack.
>>>>
>>>> Obviously neither Hannes or I have sufficient tls knowledge to properly
>>>> support it... It needs to be done by someone who knows the
>>>> implementation.
>>>>
>>>> Is this a large scope to add support for it? Because if it is, I'd
>>>> simply change nvme to clear MSG_EOR when tls is used (despite my
>>>> preference to not do special things for tls).
>>>
>>> There's a rather simple patch for tls_sw. It already paces the data 
>>> internally by an 'eor' variable, which is currently set to !MSG_MORE.
>>> So evaluating MSG_EOR here is really trivial, and doesn't seem to 
>>> cause any issues.
>>>
>>> Or, at least, none which would show up with NVMe-over-TLS :-)
>>>
>> Suggestion is to change it like this (sendpage follows suit):
>>
>> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
>> index 827292e29f99..7b28b11ff611 100644
>> --- a/net/tls/tls_sw.c
>> +++ b/net/tls/tls_sw.c
>> @@ -953,9 +953,12 @@ int tls_sw_sendmsg(struct sock *sk, struct msghdr 
>> *msg, size_t size)
>>          int pending;
>>
>>          if (msg->msg_flags & ~(MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL |
>> -                              MSG_CMSG_COMPAT))
>> +                              MSG_EOR | MSG_CMSG_COMPAT))
>>                  return -EOPNOTSUPP;
>>
>> +       if (MSG_EOR)
> 
> You probably meant if (msg->msg_flags & MSG_EOR)...
> 
Of course.

Cheers,

Hannes


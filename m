Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7390C2066F0
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  6 Dec 2024 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733495173; cv=none; b=lwzTNrEXlCLLOj07XRGfcckbU467KLn/On+AgISpG5ChplthDOEDPx5Z5YQufXPQWoaby4f1TqML5dMif0+RE5hXv0Mcg+cJ7mOT+ufjrdo2KdlM5PsIsYKcA9RJCUioNx4Eo3svAlDt+mlGqvqDkmLXfD7bGGxy48feGs4bgu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733495173; c=relaxed/simple;
	bh=wZPLRmu/+SMDmFQ8gxVi/i8J0WIEizYmfFd4WWPmACQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/AT9qp950PSKALi6mY7efvuni3357x7DNvQcRxFMnhYf9Mmg35qL+3o/IoXpzuyD/06S5Qnj9RmWfsfAH7iB9n3RGaxiCicyszSPlo/YWfRo46iA2fNsZspkIFG1lfy2QzWH3U9p0duGYkmVUc8byUtP6v6j8KmPiJ5ZkxN5Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H5XNjHES; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JjD9CEXj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H5XNjHES; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JjD9CEXj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H5XNjHES";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JjD9CEXj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H5XNjHES";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JjD9CEXj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 71E7321165;
	Fri,  6 Dec 2024 14:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733495169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FmZ1NcMvabpkz9TQaVNpaFak5LJnqLKKmrvguDB1/hw=;
	b=H5XNjHESO9AagdU602VwpxWgrIYpluL/wf4tF1dJZZQHhXQq9+qK/h0nysNPQ4v9cXsY40
	YJpAxVWcA623GeGIqA/MyLnPya4cctFRAmY+xqcxmw9MKqVzjDvPNmY5xOMzDfLuGQhtDU
	TiLvEdGYMJ6eWUH7HkTOaJjUVzt1WAA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733495169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FmZ1NcMvabpkz9TQaVNpaFak5LJnqLKKmrvguDB1/hw=;
	b=JjD9CEXje/lPTALDiJgncAAQ1eXq01ceJa4dBFcLI+vYZyVObTXJO+qHxcBHMS5yOcSA1M
	MZSwyqnusUNwRNDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=H5XNjHES;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JjD9CEXj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733495169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FmZ1NcMvabpkz9TQaVNpaFak5LJnqLKKmrvguDB1/hw=;
	b=H5XNjHESO9AagdU602VwpxWgrIYpluL/wf4tF1dJZZQHhXQq9+qK/h0nysNPQ4v9cXsY40
	YJpAxVWcA623GeGIqA/MyLnPya4cctFRAmY+xqcxmw9MKqVzjDvPNmY5xOMzDfLuGQhtDU
	TiLvEdGYMJ6eWUH7HkTOaJjUVzt1WAA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733495169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FmZ1NcMvabpkz9TQaVNpaFak5LJnqLKKmrvguDB1/hw=;
	b=JjD9CEXje/lPTALDiJgncAAQ1eXq01ceJa4dBFcLI+vYZyVObTXJO+qHxcBHMS5yOcSA1M
	MZSwyqnusUNwRNDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49A75138A7;
	Fri,  6 Dec 2024 14:26:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lyWMEYEJU2claQAAD6G6ig
	(envelope-from <hare@suse.de>); Fri, 06 Dec 2024 14:26:09 +0000
Message-ID: <de5448a1-c5a6-4dab-afca-484eb9d6c445@suse.de>
Date: Fri, 6 Dec 2024 15:26:08 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding TLS Key update for NVMe-TCP protocol
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: Chuck Lever III <chuck.lever@oracle.com>,
 Narayan Ayalasomayajula <Narayan.Ayalasomayajula@wdc.com>,
 "fkrenzel@redhat.com" <fkrenzel@redhat.com>,
 kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <BYAPR04MB6102F3173201AF0983DB6166FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <BYAPR04MB5398745DD2E7E66981384342EF292@BYAPR04MB5398.namprd04.prod.outlook.com>
 <BYAPR04MB61020B390B594196C8726D85FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <SN6PR04MB5406D4D68F82EBFFC1C580F3EF352@SN6PR04MB5406.namprd04.prod.outlook.com>
 <3EA96B2E-D195-4F81-A8D2-A2CD87A902C8@oracle.com>
 <335756f7-c0d7-4f4f-8329-d67e2740570f@suse.de>
 <6ED4312D-FA09-4BC2-82CE-A87C5DD7571C@oracle.com>
 <4c2b8312-a0a9-48f7-b5b3-acc73bcc538d@suse.de> <Z1LfX4S71BRvBKOW@hog>
 <709a55d9-b5a1-4d84-9760-796a8479aa64@suse.de> <Z1L2jQJ8Lr2kehXy@hog>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <Z1L2jQJ8Lr2kehXy@hog>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 71E7321165
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 12/6/24 14:05, Sabrina Dubroca wrote:
> 2024-12-06, 13:09:23 +0100, Hannes Reinecke wrote:
>> On 12/6/24 12:26, Sabrina Dubroca wrote:
>>> 2024-12-03, 16:20:12 +0100, Hannes Reinecke wrote:
[ .. ]
>>>> But: The new key is derived from the application secret, which is _not_ the
>>>> currently used Key/IV values used by the in-kernel TLS implementation (cf
>>>> section 7.3 'Traffic Key Calculation' in RFC 8446).
>>>> So we cannot compute the next set of application traffic secrets; the only
>>>> one who might have had this is the tlshd session, but that is destroyed once
>>>> the handshake is done (or, rather, I hope it is ...).
>>>>
>>>> So the original handshake traffic secrets are gone, and we cannot
>>>> derive the next set of traffic secrets from there. Plus I'm not sure
>>>> if we should keep that around in tlshd; that definitely would be prone
>>>> to leak secret material, inviting $RANDOM_HACKER to attack tlshd ...
>>>>
>>>> And that's before even checking whether we need to modify gnutls
>>>> for deriving updated traffic secrets ...
>>>
>>> I would expect all TLS libraries keep those secrets around to be able
>>> to implement KeyUpdate regardless of ktls (but I only work on the
>>> kernel, not gnutls/openssl).
>>>
>> They will keep secrets around as long as the program using these libraries
>> is running. So yeah, technically tlshd would be alive, and gnutls should
>> keep the secrets somehow.
>> There is a resolved issue for gnutls ('kTLS key update support'), which
>> seems to indicate that gnutls supports keyupdate.
>> And looking closer it seems to be transparent to the caller.
> 
> It makes sense to me. Which key is being used is an implementation
> detail that an application using TLS shouldn't have to care about.
> 
>> But how does userspace get the KeyUpdate message in the first place?
>> I _think_ we should get something like TLS_ALERT from the ktls stack.
>> How is that implemented?
> 
> (talking strictly about "pure" ktls, not tls-handshake/tlshd)
> 
> Data records are passed to userspace via a simple recv(). Non-data
> records (for example a KeyUpdate) need cmsg: the record type is
> stuffed into a cmsg, the payload goes in the usual buffer. If the next
> available record is non-data and no cmsg is provided, the read will
> fail. See Documentation/networking/tls.rst (or
> https://docs.kernel.org/networking/tls.html) for more details on how
> cmsg is used.
> 

Ah, right. And that's the issue.
NVMe-TLS is using the 'read_sock()' interface, which doesn't do control 
messages. And changing it over to recvmsg() would not only be a major 
churn, but we also lose the ability to calculate data digests.

So if you have ideas how to handle that ...

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

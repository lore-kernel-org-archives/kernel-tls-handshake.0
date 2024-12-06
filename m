Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB9E20E339
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  6 Dec 2024 16:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733502222; cv=none; b=sJTSruw371At6lZ7S1A3hGvquPwTG6C3gAVOSdaqv7VhZIgWrCocqQqNQFxoDIkBL+PTh1+idqVG2ASLQDZsK1p5UV8pOqNx5t/rpeNiIC/QG7jGtm74p01aGiKDYBGp90V5SAVGi4EPcBX8uGDbPsKkuOfNeNS5c//VzMz+Dxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733502222; c=relaxed/simple;
	bh=0Ja/ha65aKRbSza3kI0wdvj92fQlHGvC4gpzIDoPROE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXosPWAMGo+1V/M/r1ER/pk+CVMjjEqAssqCZ5m6yN6FJsYlQVhcWwpoRAEi27wG5kUK9EBWhhLSpIEGULhVV8BXEHv5fqPINdjiZiTyNQ1XYB2HXgXcdaUnNukuHRWs4PK/p4PBNGGdDejiOP5ebyDxoYHXdoRoO6XG5JVOm8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1/oIM1ki; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XqOfv4ny; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1/oIM1ki; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XqOfv4ny; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1/oIM1ki";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XqOfv4ny";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1/oIM1ki";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XqOfv4ny"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6FF8A21153;
	Fri,  6 Dec 2024 16:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733502218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2CWGteoa22yKYFSSHeHXchwGgI7x8RYgqSmPui317FU=;
	b=1/oIM1kif6fZQXvdmqPDnGbiho7N7ywnUyHn3ug1pmk41akJAzhskTR2Ob/OuQ2cX/B+PG
	NQiYG0qNhtPory+uOTf1rYkovWX0wFbm5n1/K887T/RkkOodvE5+JErWAdwPhAL/iYMpU7
	UopL25JG/m6ncbiA30x2ko+XBPyMqg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733502218;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2CWGteoa22yKYFSSHeHXchwGgI7x8RYgqSmPui317FU=;
	b=XqOfv4nyunfQ6bXOpgcKyNHADMFtuSARqFtMRiDEwm9lXaiODGvMvlI+GgppGQjRgPEr1M
	ewgSqQ+UNQMCYlCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="1/oIM1ki";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XqOfv4ny
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733502218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2CWGteoa22yKYFSSHeHXchwGgI7x8RYgqSmPui317FU=;
	b=1/oIM1kif6fZQXvdmqPDnGbiho7N7ywnUyHn3ug1pmk41akJAzhskTR2Ob/OuQ2cX/B+PG
	NQiYG0qNhtPory+uOTf1rYkovWX0wFbm5n1/K887T/RkkOodvE5+JErWAdwPhAL/iYMpU7
	UopL25JG/m6ncbiA30x2ko+XBPyMqg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733502218;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2CWGteoa22yKYFSSHeHXchwGgI7x8RYgqSmPui317FU=;
	b=XqOfv4nyunfQ6bXOpgcKyNHADMFtuSARqFtMRiDEwm9lXaiODGvMvlI+GgppGQjRgPEr1M
	ewgSqQ+UNQMCYlCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 36E8C138A7;
	Fri,  6 Dec 2024 16:23:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rRAOCwolU2dEDAAAD6G6ig
	(envelope-from <hare@suse.de>); Fri, 06 Dec 2024 16:23:38 +0000
Message-ID: <69b10d5f-646c-40ae-ad53-8d20bc5603b2@suse.de>
Date: Fri, 6 Dec 2024 17:23:37 +0100
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
References: <BYAPR04MB61020B390B594196C8726D85FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <SN6PR04MB5406D4D68F82EBFFC1C580F3EF352@SN6PR04MB5406.namprd04.prod.outlook.com>
 <3EA96B2E-D195-4F81-A8D2-A2CD87A902C8@oracle.com>
 <335756f7-c0d7-4f4f-8329-d67e2740570f@suse.de>
 <6ED4312D-FA09-4BC2-82CE-A87C5DD7571C@oracle.com>
 <4c2b8312-a0a9-48f7-b5b3-acc73bcc538d@suse.de> <Z1LfX4S71BRvBKOW@hog>
 <709a55d9-b5a1-4d84-9760-796a8479aa64@suse.de> <Z1L2jQJ8Lr2kehXy@hog>
 <de5448a1-c5a6-4dab-afca-484eb9d6c445@suse.de> <Z1MbCCLxxd9hWgCg@hog>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <Z1MbCCLxxd9hWgCg@hog>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6FF8A21153
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 12/6/24 16:40, Sabrina Dubroca wrote:
> 2024-12-06, 15:26:08 +0100, Hannes Reinecke wrote:
>> On 12/6/24 14:05, Sabrina Dubroca wrote:
>>> 2024-12-06, 13:09:23 +0100, Hannes Reinecke wrote:
>>>> But how does userspace get the KeyUpdate message in the first place?
>>>> I _think_ we should get something like TLS_ALERT from the ktls stack.
>>>> How is that implemented?
>>>
>>> (talking strictly about "pure" ktls, not tls-handshake/tlshd)
>>>
>>> Data records are passed to userspace via a simple recv(). Non-data
>>> records (for example a KeyUpdate) need cmsg: the record type is
>>> stuffed into a cmsg, the payload goes in the usual buffer. If the next
>>> available record is non-data and no cmsg is provided, the read will
>>> fail. See Documentation/networking/tls.rst (or
>>> https://docs.kernel.org/networking/tls.html) for more details on how
>>> cmsg is used.
>>>
>>
>> Ah, right. And that's the issue.
>> NVMe-TLS is using the 'read_sock()' interface, which doesn't do control
>> messages. And changing it over to recvmsg() would not only be a major churn,
>> but we also lose the ability to calculate data digests.
>>
>> So if you have ideas how to handle that ...
> 
> But you have to use recvmsg for the control record if read_sock can't
> read anything, which will happen when you hit a control record in the
> stream. At this point you have to call recvmsg() to dequeue the
> non-data record, process it, and then you can go back to read_sock
> until the next non-data record arrives. Like a splice-based userspace
> application, I guess. As long as you don't pop that control record
> from the socket, you can't read the rest of the stream.
> 
Ah. Right. Now I just need to find a way to forward that to nvme-tcp;
currently the read_sock() is implemented in net/tls, where I wasn't sure
how to deal with that.
But I guess I could return something like '-ENODATA', and then call 
recvmsg() from the receive loop in nvme-tcp.
Hmm.
But then I have that message in the kernel, and I guess I need to 
forward it to tlshd such that it can calculate the new key.
Chuck, I _think_ there is a bit of infrastructure missing...

> On the TX side, if you have to initiate a KeyUpdate because you've hit
> the limit on the current key (or the peer sent its own KeyUpdate and
> requested you to also update your key), you'll have to send that
> KeyUpdate with sendmsg and the correct cmsg (see the selftest patch
> for basic examples from a userspace program [1]).
> 
> [1] mainly TEST_F(tls, rekey), and maybe TEST_F(tls, splice_rekey) if
> read_sock is similar enough to splice
> https://lore.kernel.org/netdev/e00a6aed157b20573afbfc6c2353af2afa54f48e.1731597571.git.sd@queasysnail.net/
> 
Oh, _that_ we can easily tie into the initiator and/or target.
Formatting yet another cmsg is easy :-)

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

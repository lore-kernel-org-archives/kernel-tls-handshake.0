Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759651FF7A1
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  6 Dec 2024 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733486967; cv=none; b=hvZvLKnAgb5HEqCSbYjsJgJrn6eowp33fwlfOyHHtlC9JIneYgQETsyicvIaNM5McC0hrpStioW3WGscGpnZHk+17U7nVEEDJyEmzIMbpcE/3dGjoE84NdVWX5XmU44U68aDEtLf/iVMZzz9KaFybSJSuoWjseF7cy8gZ/7o070=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733486967; c=relaxed/simple;
	bh=i5NVtitggAhFYX11+t5GnpZGRG2D/q0NCV4O+5t6CEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nW7KCobBkrysJR8NCKt4BT7UkLep88QGrviAhhotLnPtgdUyUzizPST7Z2NnRPn4XepGRWtuk3J9NZ9lT9zZPOiJXEZmqG48PbFqlYx4O5sh9hfkerjjnu9vQNvw2Gusp+HNNHAs98Zl9L5qjYxOwllPR2K6dmdB2e6a6orngig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AleGyWbH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zn8oQtnL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AleGyWbH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zn8oQtnL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AleGyWbH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zn8oQtnL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AleGyWbH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zn8oQtnL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 87ED31F394;
	Fri,  6 Dec 2024 12:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733486963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PcBkBYAPQqEbh9C8zgNgapyDoH8Us4ethE5P+P/2lNY=;
	b=AleGyWbH0GTZ4IVCoh2l0T63uN/cyJqfnIQWe4tab4lTFbQIAIJIBFiHmbH/M44H++YtxX
	tPVPrXFncvM1UFaexP5VjZRMkQj18CvHNcXEPtEFdnjlu5qKap8ryoavRnScdLSLBnURNJ
	aYCOwwAobnSlGGM7h/GncRtcQYJZT98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733486963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PcBkBYAPQqEbh9C8zgNgapyDoH8Us4ethE5P+P/2lNY=;
	b=Zn8oQtnLx0+v8sQr3Nnkh89jZBdUxsKwBwpSgszpim1/9X2kwFzwdDmaOw0Swjj4scIdum
	1TLNcHdMlPnGLzAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733486963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PcBkBYAPQqEbh9C8zgNgapyDoH8Us4ethE5P+P/2lNY=;
	b=AleGyWbH0GTZ4IVCoh2l0T63uN/cyJqfnIQWe4tab4lTFbQIAIJIBFiHmbH/M44H++YtxX
	tPVPrXFncvM1UFaexP5VjZRMkQj18CvHNcXEPtEFdnjlu5qKap8ryoavRnScdLSLBnURNJ
	aYCOwwAobnSlGGM7h/GncRtcQYJZT98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733486963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PcBkBYAPQqEbh9C8zgNgapyDoH8Us4ethE5P+P/2lNY=;
	b=Zn8oQtnLx0+v8sQr3Nnkh89jZBdUxsKwBwpSgszpim1/9X2kwFzwdDmaOw0Swjj4scIdum
	1TLNcHdMlPnGLzAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 70D68138A7;
	Fri,  6 Dec 2024 12:09:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sCufGnPpUmfTPQAAD6G6ig
	(envelope-from <hare@suse.de>); Fri, 06 Dec 2024 12:09:23 +0000
Message-ID: <709a55d9-b5a1-4d84-9760-796a8479aa64@suse.de>
Date: Fri, 6 Dec 2024 13:09:23 +0100
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
References: <BYAPR04MB53982DF8F2777C6D28A23067EF282@BYAPR04MB5398.namprd04.prod.outlook.com>
 <BYAPR04MB6102F3173201AF0983DB6166FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <BYAPR04MB5398745DD2E7E66981384342EF292@BYAPR04MB5398.namprd04.prod.outlook.com>
 <BYAPR04MB61020B390B594196C8726D85FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <SN6PR04MB5406D4D68F82EBFFC1C580F3EF352@SN6PR04MB5406.namprd04.prod.outlook.com>
 <3EA96B2E-D195-4F81-A8D2-A2CD87A902C8@oracle.com>
 <335756f7-c0d7-4f4f-8329-d67e2740570f@suse.de>
 <6ED4312D-FA09-4BC2-82CE-A87C5DD7571C@oracle.com>
 <4c2b8312-a0a9-48f7-b5b3-acc73bcc538d@suse.de> <Z1LfX4S71BRvBKOW@hog>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <Z1LfX4S71BRvBKOW@hog>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 12/6/24 12:26, Sabrina Dubroca wrote:
> 2024-12-03, 16:20:12 +0100, Hannes Reinecke wrote:
>> On 12/3/24 15:33, Chuck Lever III wrote:
>>>> On Dec 3, 2024, at 2:17 AM, Hannes Reinecke <hare@suse.de> wrote:
>>>> But the current in-kernel TLS implementation doesn't allow to change
>>>> the cipher ( cf net/tls/tls_main.c: do_tls_setsockopt_conf() ), so
>>>> the only chance here is to close the connection and start from scratch.
>>>
>>> Have we asked Boris and friends if it would be possible to
>>> implement KeyUpdate via ktls? Just curious.
>>>
>> The immediate problem with KeyUpdate is here:
>>
>> net/tls/tls_main.c:tls_setsockopt_conf()
>>
>>          /* Currently we don't support set crypto info more than one time */
>>          if (TLS_CRYPTO_INFO_READY(crypto_info))
>>                  return -EBUSY;
> 
> And my patches (mentioned in the first email of this thread, but
> there's another version that I sent for review more recently [1])
> address that.
> 
> [1] https://lore.kernel.org/netdev/cover.1731597571.git.sd@queasysnail.net/
> 
Ah-ha.
So that worry is solved. Great work!

>> so we need to close the socket whenever we want to change the TLS key.
>> And that results in a call to the socket callbacks, which informs the
>> NVMe-TCP driver, and the connect is reset.
>>
>> KeyUpdate is a single message in the packet stream, transferring
>> the new key values encrypted with the original key.
> 
> nit: the KeyUpdate message doesn't contain the new key, it just says
> that the new key will be used from that point on (otherwise we
> wouldn't have to worry about keeping secrets around?).
> 
Yeah ... but that doesn't impact this issue, no?

>> But: The new key is derived from the application secret, which is _not_ the
>> currently used Key/IV values used by the in-kernel TLS implementation (cf
>> section 7.3 'Traffic Key Calculation' in RFC 8446).
>> So we cannot compute the next set of application traffic secrets; the only
>> one who might have had this is the tlshd session, but that is destroyed once
>> the handshake is done (or, rather, I hope it is ...).
>>
>> So the original handshake traffic secrets are gone, and we cannot
>> derive the next set of traffic secrets from there. Plus I'm not sure
>> if we should keep that around in tlshd; that definitely would be prone
>> to leak secret material, inviting $RANDOM_HACKER to attack tlshd ...
>>
>> And that's before even checking whether we need to modify gnutls
>> for deriving updated traffic secrets ...
> 
> I would expect all TLS libraries keep those secrets around to be able
> to implement KeyUpdate regardless of ktls (but I only work on the
> kernel, not gnutls/openssl).
> 
They will keep secrets around as long as the program using these 
libraries is running. So yeah, technically tlshd would be alive, and 
gnutls should keep the secrets somehow.
There is a resolved issue for gnutls ('kTLS key update support'), which 
seems to indicate that gnutls supports keyupdate.
And looking closer it seems to be transparent to the caller.

But how does userspace get the KeyUpdate message in the first place?
I _think_ we should get something like TLS_ALERT from the ktls stack.
How is that implemented?
Have you tested your implementation with gnutls?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

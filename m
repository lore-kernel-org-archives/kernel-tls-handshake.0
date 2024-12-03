Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A221F75A6
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  3 Dec 2024 15:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733239217; cv=none; b=uV4N9KBd7XI80L4A40hJo3JTucCuHJyxYg4kcxgg8pfY2azaDcfn2C18i3yctKDFNCXr84wWNmx+NP5bQMm3+p/Oi6VaD8MiHSml0e2oJA02PXl76DJmN7HtiP/T3EI+nt+tGbHkX2bq7rhQkhtlalzD2ivcKsOnZAd+voV0s3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733239217; c=relaxed/simple;
	bh=7sGA7iucEnZVwcOJOEsFxQ2yG91VuGWBKnsDTU+YbAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UhChcLUNZ2Meo9BIsrDEKnjX9uNDtOGKArH1qPeXb5/PhRIhVKpruR154rKIezESZqMCP42lIMwCFb1uzpBt+p/8VIJSSZuaS8vUkoKNseQ4zbgk38B4slL/1Rq7Dol+fGOEoKjv8u+VXbLFG1RzrRglA8/6ifjNUl3fZroP7Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v9UGw6n9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4Pxa8zse; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v9UGw6n9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4Pxa8zse; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v9UGw6n9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Pxa8zse";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v9UGw6n9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Pxa8zse"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 41BEA21109;
	Tue,  3 Dec 2024 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733239213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yxylF7w/N5qxFPWlP+rRY2lWs1QZa23C4/xg5MVY2/A=;
	b=v9UGw6n9BxfJYqVI4I94Ov+dOdFo4SWOF0Nc0m+Km9qAOtWKKyVGG0dCi6DEVk+wYUt/kM
	ODfC9lkH995PNHx5NHXl781WPV6FMlj1yrmCrQp5gGQKt6ttLlA8A1XIFB7+/tobRD6UPz
	ajl0FxAA1DAicjNt+kEvdjD2SrJLzAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733239213;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yxylF7w/N5qxFPWlP+rRY2lWs1QZa23C4/xg5MVY2/A=;
	b=4Pxa8zseaIeybxhjtCMGlRazLOIWuP91BRQSfSi1iuQwVUYx87jAwekL6OrOWWIz0LYgTg
	Nv28eI4Qd2yELDAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=v9UGw6n9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4Pxa8zse
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733239213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yxylF7w/N5qxFPWlP+rRY2lWs1QZa23C4/xg5MVY2/A=;
	b=v9UGw6n9BxfJYqVI4I94Ov+dOdFo4SWOF0Nc0m+Km9qAOtWKKyVGG0dCi6DEVk+wYUt/kM
	ODfC9lkH995PNHx5NHXl781WPV6FMlj1yrmCrQp5gGQKt6ttLlA8A1XIFB7+/tobRD6UPz
	ajl0FxAA1DAicjNt+kEvdjD2SrJLzAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733239213;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yxylF7w/N5qxFPWlP+rRY2lWs1QZa23C4/xg5MVY2/A=;
	b=4Pxa8zseaIeybxhjtCMGlRazLOIWuP91BRQSfSi1iuQwVUYx87jAwekL6OrOWWIz0LYgTg
	Nv28eI4Qd2yELDAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B6ED139C2;
	Tue,  3 Dec 2024 15:20:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id a5rdCa0hT2c/RQAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 03 Dec 2024 15:20:13 +0000
Message-ID: <4c2b8312-a0a9-48f7-b5b3-acc73bcc538d@suse.de>
Date: Tue, 3 Dec 2024 16:20:12 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding TLS Key update for NVMe-TCP protocol
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: Narayan Ayalasomayajula <Narayan.Ayalasomayajula@wdc.com>,
 "fkrenzel@redhat.com" <fkrenzel@redhat.com>,
 "sd@queasysnail.net" <sd@queasysnail.net>,
 kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <BYAPR04MB53982DF8F2777C6D28A23067EF282@BYAPR04MB5398.namprd04.prod.outlook.com>
 <BYAPR04MB6102F3173201AF0983DB6166FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <BYAPR04MB5398745DD2E7E66981384342EF292@BYAPR04MB5398.namprd04.prod.outlook.com>
 <BYAPR04MB61020B390B594196C8726D85FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <SN6PR04MB5406D4D68F82EBFFC1C580F3EF352@SN6PR04MB5406.namprd04.prod.outlook.com>
 <3EA96B2E-D195-4F81-A8D2-A2CD87A902C8@oracle.com>
 <335756f7-c0d7-4f4f-8329-d67e2740570f@suse.de>
 <6ED4312D-FA09-4BC2-82CE-A87C5DD7571C@oracle.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <6ED4312D-FA09-4BC2-82CE-A87C5DD7571C@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 41BEA21109
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 12/3/24 15:33, Chuck Lever III wrote:
> 
> 
>> On Dec 3, 2024, at 2:17 AM, Hannes Reinecke <hare@suse.de> wrote:
>>
>> On 12/2/24 19:50, Chuck Lever III wrote:
>>> Copying the ktls utils mailing list.
>>>> On Dec 2, 2024, at 1:02 PM, Narayan Ayalasomayajula <Narayan.Ayalasomayajula@wdc.com> wrote:
>>>>
>>>>   Sabrina, Frantisek, Chuck,
>>>>   I am looking for guidance regarding the TLS PSK KeyUpdate functionality in the context of
>>>>    NVMe-TCP transport. I work with a team in Western digital that
>>>>    develops NVMe-oF target adapters that support NVMe-TCP as well as
>>>>    RoCev2 transport protocols  TLS 1.3 species the requirements for
>>>>    KeyUpdate to occur under some events (bytes-transferred or time-
>>>>    elapsed events). When either event occurs, say at a sender node,
>>>>    the sender transmits a KeyUpdate message to indicate that the
>>>>    cryptographic key needs to be updated.  For NVMe-TCP transport
>>>>    protocol, for a host to establish a Fabric Secure Channel, the
>>>>    following sequence occurs between the host and the target:>> ·  3-way TCP handshake
>>>> ·      TLS session (this establishes a secure channel)
>>>> ·      Fabric Connect for Admin queue ·      Fabric Connect for associated IO queues
>>>>    I am not able to find a way for the Linux host to perform the TLS
>>>> KeyUpdate when the transport protocol is NVMe-TCP. It appears that
>>>> the only way to update the TLS keys for this scenario is by
>>>> disconnecting the transport as well as TCP connections and re-
>>>> establishing them using the new TLS keys.>>   I see that Sabrina and Frantisek were working on a patchset for the TLS KeyUpdate
>>>>    functionality over a year ago (and Chuck, Christoph Hellwig
>>>>    mentioned to me that you may have been involved in this functional
>>>>    area as well). I am trying to understand if Linux supports TLS
>>>>    KeyUpdate for NVMe-TCP. My understanding is that the only way for
>>>>    the TLS KeyUpdate to occur is by disconnecting the transport as
>>>>    well as TCP connections and re-establishing them using the new TLS
>>>>    keys.>> https://patchwork.kernel.org/project/netdevbpf/cover/cover.1691584074.git.sd@queasysnail.net/
>>>>   Is my understanding correct?
>>>>   Thanks,
>>>> Narayan
>>> IMO your understanding is correct. Currently a transport disconnect
>>> is the only way to handle this scenario. We recognize that key
>>> update needs to work without incurring a transport disconnect.
>> Well, actually, not.
>> It was a design choice quite early on when developing NVMe-over-TLS that
>> we will _not_ do transparent key updates.
> 
> OK. I was speaking only of KeyUpdate support in tlshd, which
> manages the TLS handshake. I didn't realize that NVMe-o-TLS
> was more restrictive.
> 
> 
>> Currently the only error-recovery mechanism NVMe-over-Fabrics has
 >> is a controller reset, which for fabrics means a complete teardown
 >> of all connections, including a TLS key-renegotiation.>> A 
transparent TLS key update would only improve the situation if we
 >> could make it completely transparent, ie that the actual 
connection>> would stay alive and would just be blocked for the time of 
the key
>> update itself.
>> But the current in-kernel TLS implementation doesn't allow to change
>> the cipher ( cf net/tls/tls_main.c: do_tls_setsockopt_conf() ), so
>> the only chance here is to close the connection and start from scratch.
> 
> Have we asked Boris and friends if it would be possible to
> implement KeyUpdate via ktls? Just curious.
> 
The immediate problem with KeyUpdate is here:

net/tls/tls_main.c:tls_setsockopt_conf()

         /* Currently we don't support set crypto info more than one time */
         if (TLS_CRYPTO_INFO_READY(crypto_info))
                 return -EBUSY;


so we need to close the socket whenever we want to change the TLS key.
And that results in a call to the socket callbacks, which informs the 
NVMe-TCP driver, and the connect is reset.

KeyUpdate is a single message in the packet stream, transferring
the new key values encrypted with the original key.

But: The new key is derived from the application secret, which is _not_ 
the currently used Key/IV values used by the in-kernel TLS 
implementation (cf section 7.3 'Traffic Key Calculation' in RFC 8446).
So we cannot compute the next set of application traffic secrets; the 
only one who might have had this is the tlshd session, but that is 
destroyed once the handshake is done (or, rather, I hope it is ...).

So the original handshake traffic secrets are gone, and we cannot
derive the next set of traffic secrets from there. Plus I'm not sure
if we should keep that around in tlshd; that definitely would be prone
to leak secret material, inviting $RANDOM_HACKER to attack tlshd ...

And that's before even checking whether we need to modify gnutls
for deriving updated traffic secrets ...

So really, not sure if it's worth it.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59F21862BB
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  3 Dec 2024 07:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733210267; cv=none; b=UrT07XxesfvjsLfTWk+SjfyxLHT1xCAQ+sxa2236TgBQ0NZkrIQTiSYyuyLmcXW9jHwDcqBpzJluuf9NntewzLov7GpfJD3B2EqnjR1h4VZ/d3qAzOc/G4mDs70dwOrzFC3elzfVY4Z5hubrgBkGbe09l46Kmz9Ihbk4+L2wvxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733210267; c=relaxed/simple;
	bh=HZzpOTTIhCLqmMsiJfF+yBrr3xp6F76OsjZMImhYdy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Weg4mYRYSo3OiNqDR52vcKZhCQZBEuEJeIh0KZtK+CYmJKDZr0pjQ2skzF0ERacYJLujis62XFyYDrcsv+ULObgidlNtgGWjiw1+fjHZgq5pgrjNawntxBnz4GpnW2M5B66EUgGLqOPQlnNSI4k0L9zBRvQM/LJ257sl7yhtsaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=snTcOVkl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yK6Z8utK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=snTcOVkl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yK6Z8utK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="snTcOVkl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yK6Z8utK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="snTcOVkl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yK6Z8utK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0E8AC2117B;
	Tue,  3 Dec 2024 07:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733210264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XkL9houJ/xeomZlL6bU6bHYND4jIIIuhZTaAocea1Vg=;
	b=snTcOVkl6VTLECjxQ3/dSQgJMoHTaggVFK0bIs4MVlVJimsADemPrVnzkqcRHmPb5prWsH
	nIK8cotrA86Farq3asvKiukd1HOcND9PMUALmKfhI8zpEYFKs8KYQYRAXwSBLLvoPTkU2K
	7BjcyPX5HpX+PPCKbdEnskktLdyJUHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733210264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XkL9houJ/xeomZlL6bU6bHYND4jIIIuhZTaAocea1Vg=;
	b=yK6Z8utK7hUzBqr6dMbOec0ydMZ2by2SK3DIZJsawPbBa3LX5+qWVrgvWOEJyp/bK4XQYs
	bRdwOXXHCvZARBCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733210264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XkL9houJ/xeomZlL6bU6bHYND4jIIIuhZTaAocea1Vg=;
	b=snTcOVkl6VTLECjxQ3/dSQgJMoHTaggVFK0bIs4MVlVJimsADemPrVnzkqcRHmPb5prWsH
	nIK8cotrA86Farq3asvKiukd1HOcND9PMUALmKfhI8zpEYFKs8KYQYRAXwSBLLvoPTkU2K
	7BjcyPX5HpX+PPCKbdEnskktLdyJUHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733210264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XkL9houJ/xeomZlL6bU6bHYND4jIIIuhZTaAocea1Vg=;
	b=yK6Z8utK7hUzBqr6dMbOec0ydMZ2by2SK3DIZJsawPbBa3LX5+qWVrgvWOEJyp/bK4XQYs
	bRdwOXXHCvZARBCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF791139C2;
	Tue,  3 Dec 2024 07:17:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jUbfLJewTmcLKAAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 03 Dec 2024 07:17:43 +0000
Message-ID: <335756f7-c0d7-4f4f-8329-d67e2740570f@suse.de>
Date: Tue, 3 Dec 2024 08:17:43 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding TLS Key update for NVMe-TCP protocol
To: Chuck Lever III <chuck.lever@oracle.com>,
 Narayan Ayalasomayajula <Narayan.Ayalasomayajula@wdc.com>
Cc: "fkrenzel@redhat.com" <fkrenzel@redhat.com>,
 "sd@queasysnail.net" <sd@queasysnail.net>,
 kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <BYAPR04MB53982DF8F2777C6D28A23067EF282@BYAPR04MB5398.namprd04.prod.outlook.com>
 <BYAPR04MB6102F3173201AF0983DB6166FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <BYAPR04MB5398745DD2E7E66981384342EF292@BYAPR04MB5398.namprd04.prod.outlook.com>
 <BYAPR04MB61020B390B594196C8726D85FF292@BYAPR04MB6102.namprd04.prod.outlook.com>
 <SN6PR04MB5406D4D68F82EBFFC1C580F3EF352@SN6PR04MB5406.namprd04.prod.outlook.com>
 <3EA96B2E-D195-4F81-A8D2-A2CD87A902C8@oracle.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <3EA96B2E-D195-4F81-A8D2-A2CD87A902C8@oracle.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 12/2/24 19:50, Chuck Lever III wrote:
> Copying the ktls utils mailing list.
> 
>> On Dec 2, 2024, at 1:02 PM, Narayan Ayalasomayajula <Narayan.Ayalasomayajula@wdc.com> wrote:
>>
>>   Sabrina, Frantisek, Chuck,
>>   I am looking for guidance regarding the TLS PSK KeyUpdate functionality in the context of
 >>   NVMe-TCP transport. I work with a team in Western digital that
 >>   develops NVMe-oF target adapters that support NVMe-TCP as well as
 >>   RoCev2 transport protocols  TLS 1.3 species the requirements for
 >>   KeyUpdate to occur under some events (bytes-transferred or time-
 >>   elapsed events). When either event occurs, say at a sender node,
 >>   the sender transmits a KeyUpdate message to indicate that the
 >>   cryptographic key needs to be updated.  For NVMe-TCP transport
 >>   protocol, for a host to establish a Fabric Secure Channel, the
 >>   following sequence occurs between the host and the target:>> · 
  3-way TCP handshake
>> ·      TLS session (this establishes a secure channel)
>> ·      Fabric Connect for Admin queue ·      Fabric Connect for associated IO queues
 >>   I am not able to find a way for the Linux host to perform the TLS
 >> KeyUpdate when the transport protocol is NVMe-TCP. It appears that
 >> the only way to update the TLS keys for this scenario is by
 >> disconnecting the transport as well as TCP connections and re-
 >> establishing them using the new TLS keys.>>   I see that Sabrina and 
Frantisek were working on a patchset for the TLS KeyUpdate
 >>   functionality over a year ago (and Chuck, Christoph Hellwig
 >>   mentioned to me that you may have been involved in this functional
 >>   area as well). I am trying to understand if Linux supports TLS
 >>   KeyUpdate for NVMe-TCP. My understanding is that the only way for
 >>   the TLS KeyUpdate to occur is by disconnecting the transport as
 >>   well as TCP connections and re-establishing them using the new TLS
 >>   keys.>> 
https://patchwork.kernel.org/project/netdevbpf/cover/cover.1691584074.git.sd@queasysnail.net/
>>   Is my understanding correct?
>>   Thanks,
>> Narayan
> 
> 
> IMO your understanding is correct. Currently a transport disconnect
> is the only way to handle this scenario. We recognize that key
> update needs to work without incurring a transport disconnect.
> 
> 
Well, actually, not.
It was a design choice quite early on when developing NVMe-over-TLS that
we will _not_ do transparent key updates.
Currently the only error-recovery mechanism NVMe-over-Fabrics has is a 
controller reset, which for fabrics means a complete teardown of all 
connections, including a TLS key-renegotiation.
A transparent TLS key update would only improve the situation if we 
could make it completely transparent, ie that the actual connection
would stay alive and would just be blocked for the time of the key
update itself.
But the current in-kernel TLS implementation doesn't allow to change
the cipher ( cf net/tls/tls_main.c: do_tls_setsockopt_conf() ), so
the only chance here is to close the connection and start from scratch.
And that means the a key update currently requires a connection reset,
so we might as well just do a controller reset for a TLS key rotation.

And also note for secure concatenation a connection reset is built into
the protocol, so again a key rotation requires a complete connection
reset.

Please don't hestitate to contact me for further questions.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

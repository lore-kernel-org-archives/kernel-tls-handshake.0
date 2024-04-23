Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2546286BD
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 23 Apr 2024 06:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713855188; cv=none; b=qfkilOeTeLYqJzHxiYo78cMT2Aj1ZadHLR1qllsModTARHbdruLk65lmTaC1Gs4atE0N7+OtDAx+GIRUOZjEPhbVCFRUS4ardY5hwBhwbYzQ5QQDThghOQbt3+u53qEn1UJCophm0HO9b/mu7bS+3j+YH0tKqGpNs3yuwasUr+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713855188; c=relaxed/simple;
	bh=e5d/wRlA/VmNigrPIIpVbqs0JjKes8CIQIsQABnmE1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n5ziZJm7sHWonbH1/iSkREKHkIIbZ3s0zolWFk9yyln+TmfIlOD4RhSG8sxUYWrxYcgYeXK0vWWAHykBcKiKHN7Vu4Cigu/jG0nUw6DSxOkxBXz5ILFk3+ZQd5YEkeGNrAJ5x7RYKDfSi01+Htcv2dhlheBDRwocTUwUrHgFWDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sCpt4znO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pX/I9lG7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sCpt4znO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pX/I9lG7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sCpt4znO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pX/I9lG7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sCpt4znO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pX/I9lG7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 924075FA48;
	Tue, 23 Apr 2024 06:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713855184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BUf/Z/+6v75HSYk6MSDPml6dGRkP6UUevnVjTPLkI6s=;
	b=sCpt4znO7FxTde/dn6iOVhh5qNo0Dw2h5zXjZKCwbgT9L3OjAQ+sP8D/0Z90djYlH+IBC+
	KhtjU4RIkxZ2R4DiYzbLD3KBUxWEXCZebDOKQYlF8C9vSLY6IigVexUKbWT6v5A18Rt5k4
	u6d6MhpYbZkeAkDsycT3d3wSpWRsDuw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713855184;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BUf/Z/+6v75HSYk6MSDPml6dGRkP6UUevnVjTPLkI6s=;
	b=pX/I9lG72amlLxbslqORYHgj48kllFKS+NBW/SvfjrEV8SMh4yhBiAf5h6nCPAYb8tjW4C
	C/I5cL5Ki4rT2PAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713855184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BUf/Z/+6v75HSYk6MSDPml6dGRkP6UUevnVjTPLkI6s=;
	b=sCpt4znO7FxTde/dn6iOVhh5qNo0Dw2h5zXjZKCwbgT9L3OjAQ+sP8D/0Z90djYlH+IBC+
	KhtjU4RIkxZ2R4DiYzbLD3KBUxWEXCZebDOKQYlF8C9vSLY6IigVexUKbWT6v5A18Rt5k4
	u6d6MhpYbZkeAkDsycT3d3wSpWRsDuw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713855184;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BUf/Z/+6v75HSYk6MSDPml6dGRkP6UUevnVjTPLkI6s=;
	b=pX/I9lG72amlLxbslqORYHgj48kllFKS+NBW/SvfjrEV8SMh4yhBiAf5h6nCPAYb8tjW4C
	C/I5cL5Ki4rT2PAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7457113894;
	Tue, 23 Apr 2024 06:53:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EPSUGtBaJ2aebQAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 23 Apr 2024 06:53:04 +0000
Message-ID: <ac997b67-ad82-4e98-81fd-ac01ea13159c@suse.de>
Date: Tue, 23 Apr 2024 08:53:03 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ktls-utils PR needs review
To: Chuck Lever III <chuck.lever@oracle.com>,
 Olga Kornievskaia <aglo@umich.edu>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <F55B5C06-82DF-4896-BBF6-EDF59ADC9693@oracle.com>
 <CAN-5tyEPHXXnCQZdnvsFvYENeCB=52afuebpfK323Goz+dHCXQ@mail.gmail.com>
 <AD446B51-7488-4F07-9637-39E8FD452D97@oracle.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <AD446B51-7488-4F07-9637-39E8FD452D97@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.29 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,oracle.com:email]
X-Spam-Score: -4.29
X-Spam-Flag: NO

On 4/22/24 17:59, Chuck Lever III wrote:
> 
> 
>> On Apr 22, 2024, at 11:55 AM, Olga Kornievskaia <aglo@umich.edu> wrote:
>>
>> On Mon, Apr 22, 2024 at 11:16 AM Chuck Lever III <chuck.lever@oracle.com> wrote:
>>>
>>> https://github.com/oracle/ktls-utils/pull/54
>>>
>>> I seem to recall a similar command line option that we
>>> removed because it was insecure.
>>>
>>> At the very least this needs a man page update, but I'm
>>> not convinced this setting should be allowed.
>>
>> I agree.
>>
>> Can we have this only available under some strict usage? Like it can
>> only work started in the foreground (with some -d flag) and it’ll only
>> run for 10mins and then it will exit… something like that would
>> prevent somebody from using it on a permanent basis.
> 
> Interesting idea, that would ensure it could be used only
> for debugging.
> 
> Reuben closed the PR because he is having trouble with the
> OCA signing. But you could add that suggestion to the PR
> and see what he thinks.
> 
I am not sure if I agree with the argument; after all, openssl and 
gnutls both have a standard option disabling the certificate check, too.
And you might be needing it under certain circumstances (Self-signed 
certificates? Initial deployment?).

What we could do is to delegate the functionality to be command-line
only (and not via the config file). That way it'll be immediately
obvious that this option is enabled, and we would avoid proliferation
via a forgotten config option setting.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich


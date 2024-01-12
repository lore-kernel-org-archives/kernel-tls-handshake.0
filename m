Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A4A6E2AA
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 12 Jan 2024 14:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KNQ9Gk5P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IJmsYDV+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KNQ9Gk5P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IJmsYDV+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7EE371FCDC;
	Fri, 12 Jan 2024 14:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1705069483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xq0kIG8MC71Dj1H294/pGSw4/6R34p8dRFDy51kpOV8=;
	b=KNQ9Gk5PKn2Y1aMA/v8JUH3reZtRjvpXKKVj8p6SjNdf3CiHVzG5a5n3RKoKv0eoB44XX/
	pzolRhS80Ybd+Sir50XrxZfCfthYlxgII1U0yTCyKcRJAUqvaCiqxp3qonmJztl1q3QYW8
	vzR9AsTJPR6tPwoA+V08Yrw9xzAjj20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705069483;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xq0kIG8MC71Dj1H294/pGSw4/6R34p8dRFDy51kpOV8=;
	b=IJmsYDV+i8TLCvrr6zAhSQz/dr2v0UYlYgfhg8rBh0GlTKeNZuK2Nk5rY6LJQImUYFxZQJ
	/SnuEL7CYnPRf9Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1705069483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xq0kIG8MC71Dj1H294/pGSw4/6R34p8dRFDy51kpOV8=;
	b=KNQ9Gk5PKn2Y1aMA/v8JUH3reZtRjvpXKKVj8p6SjNdf3CiHVzG5a5n3RKoKv0eoB44XX/
	pzolRhS80Ybd+Sir50XrxZfCfthYlxgII1U0yTCyKcRJAUqvaCiqxp3qonmJztl1q3QYW8
	vzR9AsTJPR6tPwoA+V08Yrw9xzAjj20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705069483;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xq0kIG8MC71Dj1H294/pGSw4/6R34p8dRFDy51kpOV8=;
	b=IJmsYDV+i8TLCvrr6zAhSQz/dr2v0UYlYgfhg8rBh0GlTKeNZuK2Nk5rY6LJQImUYFxZQJ
	/SnuEL7CYnPRf9Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 71E6313782;
	Fri, 12 Jan 2024 14:24:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /RRfG6tLoWWwBgAAD6G6ig
	(envelope-from <hare@suse.de>); Fri, 12 Jan 2024 14:24:43 +0000
Message-ID: <18007242-4dc7-45ed-905b-a3994f62e4e2@suse.de>
Date: Fri, 12 Jan 2024 15:24:43 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ktls-utils and gnutls
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>, Daiki Ueno <ueno@gnu.org>
Cc: kernel-tls-handshake <kernel-tls-handshake@lists.linux.dev>
References: <878r4v6j0t.fsf-ueno@gnu.org>
 <565BE265-C1C2-4AF5-A668-C5087D258017@oracle.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <565BE265-C1C2-4AF5-A668-C5087D258017@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-3.09 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 TO_DN_ALL(0.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.09

On 1/12/24 15:06, Chuck Lever III wrote:
> 
> 
>> On Jan 12, 2024, at 3:41 AM, Daiki Ueno <ueno@gnu.org> wrote:
>>
>> Hello Chuck,
>>
>> I am Daiki from the GnuTLS team; nice to meet you.
>>
>> We are currently collecting project ideas for GSoC[1] and I wonder if we
>> could include something related to ktls-utils (tlshd), as it currently
>> uses GnuTLS as the backend and I thought students may be interested in
>> getting hands-on experience with both kernel and security.
>>
>> A couple of things that come to my mind are:
>>
>> 1. make use of the GnuTLS handshake API to bypass record layer
>>    interaction as mentioned at [2]
>>
>> 2. provide some experimental mechanism (kernel module?) to allow
>>    userspace applications to use that facility sorely with the POSIX
>>    networking API (as in tlssock[3]), though I know that it's explicitly
>>    marked as out of scope of the project
>>
>> Before adding those to the ideas page I would like to hear your opinion;
>> any suggestions would be appreciated.
>>
>> Footnotes:
>> [1]  https://gitlab.com/gnutls/gnutls/-/wikis/Projects-for-newcomers
>>
>> [2]  https://bugzilla.redhat.com/show_bug.cgi?id=2182151#c61
>>
>> [3]  https://github.com/enarx-archive/tlssock
> 
> Hello Daiki -
> 
> I've copied a mailing list with my ktls-utils collaborators.
> Maybe Hans has a suggestion?
> 
There are some issues which could've been addressed:

1. Multiple PSK keys per ClientHello: the RFC allows for multiple
    PSKs to be sent with each ClientHello, yet gnutls implements
    only support for a single PSK. This is getting interesting
    when several cipher suites with different lengths or different
    scopes are supported, and the server could pick the appropriate
    one instead of having the client to retry a ClientHello with
    every available PSK.

2. Support for SPDM device attestation certificates: SPDM has defined
    the use of X.509 certificates for device attestation. But as these
    certificates are not bound to a network instance SPDM makes use
    of 'Subject Alternative Name' with a distinct OID. It would be
    good to implement support for SPDM X.509 certificates as chances
    are they will become more prevalent.
    And any implementor will need to generate valid SPDM certificates
    to test out the implementation ...

Cheers,

Hannes


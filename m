Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41351BC2F
	for <kernel-tls-handshake@lists.linux.dev>; Fri,  7 Jun 2024 06:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717740235; cv=none; b=FXYIAvQVe1CysnesSj8WpuEEH3/DGi6uhy79pdATfai2fQyFlRH6hp4uy6hpAgD/ZNWGcx/YZgx835jKxhqgrL/2PzkL/YReI51yIZzCMpveTKf8rHvMz67Jyns3S5h7lx1y8edDmVvbOEY4PQOrA4Z7skx5/AZv/zUR0+ZzNHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717740235; c=relaxed/simple;
	bh=yBNH7LgyDHYls+1F73RkifJKcvQ7eYSjDnt35lxqXn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1AuwdNaiZu+XwMbX+MR/JfGnrNLgjCdpUd1NYNNicSTgISoT9rwMMND/OT45pStyyFtm6zY6OGpiCFlERjQI2KN1sbtuazmHSJeoaD0KKMQif1R/3naEtqW4gKlAkcxW22k6edw1ZpWW3e97K6fVX99NGe4DEWpcSbkSCR1AVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d/7hlCOM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+3VqtgMb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PU4jDRu+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8xNtE+b+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d/7hlCOM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+3VqtgMb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PU4jDRu+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8xNtE+b+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 72A7D1FB81;
	Fri,  7 Jun 2024 06:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717740231; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HhzESO6Ehxp87RymfCaC2rlhnlcxPDta3Zm9GlWx+uY=;
	b=d/7hlCOMohC/gV04IpMmEdoMCqgfeFdDhLlzhLALiGCWsIwt8rlv+QsnwiGu9ygTyfRyOj
	vlj4PZmeatGUpfqn9/qIZW879S1w7lwKV54x8ljHBGQ4UtbQh8JjlkfcL0V/hlUz5t5yJL
	+t8cM0CQX1tgPv+bC9n6+7pK+n4UJto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717740231;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HhzESO6Ehxp87RymfCaC2rlhnlcxPDta3Zm9GlWx+uY=;
	b=+3VqtgMbv98LrgpgM7SVIOyfNgpjvxq57XMscetzP7PpM9jEfpoCoAxr35hsm5pnek10sW
	yw6ZC6nJm3EYsYDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PU4jDRu+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8xNtE+b+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717740230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HhzESO6Ehxp87RymfCaC2rlhnlcxPDta3Zm9GlWx+uY=;
	b=PU4jDRu+Q49NIqGX9NQrVZJKM70se8zdYNzItTYCCE1QtkSsvmEFof6lGGACQ6o1Qa6SYW
	+SPT3vU9q5qyxm2cHCJO6FOJslpWvX3aU7UKKZtzkUYy8JMmB1mVzPBUwPp7ID4sAtFKu8
	r0hjzNmtnW8tAr1sWkNwJhrpYvqWG44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717740230;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HhzESO6Ehxp87RymfCaC2rlhnlcxPDta3Zm9GlWx+uY=;
	b=8xNtE+b+UbPzI+qMklyapdr04pFwzfO6KZ7IVPo3PYB2tpdyCFU5FbYnON8A340V2FsBpb
	iFDdmWdHFnn0TaDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4AAD3133F3;
	Fri,  7 Jun 2024 06:03:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id F/y4D8aiYmYSXQAAD6G6ig
	(envelope-from <hare@suse.de>); Fri, 07 Jun 2024 06:03:50 +0000
Message-ID: <4de9a150-84bc-4d17-bc37-8e4abbde2067@suse.de>
Date: Fri, 7 Jun 2024 08:03:49 +0200
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] config: supply meaningful error for non-existing
 pathnames
Content-Language: en-US
To: Olga Kornievskaia <olga.kornievskaia@gmail.com>, chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
References: <20240606210044.42285-1-olga.kornievskaia@gmail.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20240606210044.42285-1-olga.kornievskaia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.50
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 72A7D1FB81
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.50 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com,oracle.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[netapp.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email]

On 6/6/24 23:00, Olga Kornievskaia wrote:
> From: Olga Kornievskaia <kolga@netapp.com>
> 
> If tlshd.conf had a non-exists pathname, the code would have a
> non-descriptive error:
> tlshd[64556]: open: No such file or directory
> 
> Such error can happen when a filename specified had trailing spaces
> after the name of the file.
> 
> Instead provide a more descriptive error such as:
> tlshd[64423]: server x509.certificate pathname "/root/server.crt " does not exist
> 
> In hope that the administrator would notice the error or extra spaces or
> some other typos in the pathname.
> 
> Signed-off-by: Olga Kornievskaia <kolga@netapp.com>
> ---
>   src/tlshd/config.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/src/tlshd/config.c b/src/tlshd/config.c
> index 20e914d..aeaba05 100644
> --- a/src/tlshd/config.c
> +++ b/src/tlshd/config.c
> @@ -184,6 +184,9 @@ bool tlshd_config_get_client_truststore(char **bundle)
>   	if (!pathname) {
>   		g_error_free(error);
>   		return false;
> +	} else if (access(pathname, F_OK)) {
> +		tlshd_log_debug("client x509.truststore pathname \"%s\" does not exist", pathname);
> +		return false;
>   	}
>   
>   	*bundle = strdup(pathname);
> @@ -217,6 +220,9 @@ bool tlshd_config_get_client_certs(gnutls_pcert_st *certs,
>   	if (!pathname) {
>   		g_error_free(error);
>   		return false;
> +	} else if (access(pathname, F_OK)) {
> +		tlshd_log_debug("client x509.certificate pathname \"%s\" does not exist", pathname);
> +		return false;
>   	}
>   
>   	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
> @@ -261,6 +267,9 @@ bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey)
>   	if (!pathname) {
>   		g_error_free(error);
>   		return false;
> +	} else if (access(pathname, F_OK)) {
> +		tlshd_log_debug("client x095.private_key pathname \"%s\" does not exist", pathname);
> +		return false;
>   	}
>   
>   	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
> @@ -310,6 +319,9 @@ bool tlshd_config_get_server_truststore(char **bundle)
>   	if (!pathname) {
>   		g_error_free(error);
>   		return false;
> +	} else if (access(pathname, F_OK)) {
> +		tlshd_log_debug("server x509.truststore pathname \"%s\" does not exist", pathname);
> +		return false;
>   	}
>   
>   	*bundle = strdup(pathname);
> @@ -343,6 +355,9 @@ bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
>   	if (!pathname) {
>   		g_error_free(error);
>   		return false;
> +	} else if (access(pathname, F_OK)) {
> +		tlshd_log_debug("server x509.certificate pathname \"%s\" does not exist", pathname);
> +		return false;
>   	}
>   
>   	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
> @@ -386,6 +401,9 @@ bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey)
>   	if (!pathname) {
>   		g_error_free(error);
>   		return false;
> +	} else if (access(pathname, F_OK)) {
> +		tlshd_log_debug("server x509.privkey pathname \"%s\" does not exist", pathname);
> +		return false;
>   	}
>   
>   	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,

I tend to use 'stat()' in these cases, to filter out the actual 
characteristic I'm interested in. But I guess that's a matter of
preference.

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich


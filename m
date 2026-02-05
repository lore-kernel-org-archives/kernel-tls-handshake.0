Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9712281376
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  5 Feb 2026 20:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770322134; cv=none; b=EaopPz2mhn447PdPsBD77XVGjoRAaRJyRBpaNZlmhxpvlIBqD5sJHHJauI4ITkwH148iIxHfipzGeHAonX6wNY31EbcAy+IzztA1rgSY+aHziBRThfhZ+CV8YABN2IV3K8jXlauyhjQre2AHbmobyOEjQvCYpL8N/b9/Eb5l91I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770322134; c=relaxed/simple;
	bh=moqbsgwllSa5wFWSMz/b9r+x1Rw8q4kGym5kD5orslw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=M42zejxLnoIzKYdXP+sLZc7GoUaIj3UHagNFDimX3qMhj5zO60TX3g8Nnq3/DjgAb8lUN1wHoU8K5qWaanjGBArx8vpT2TK7gWvToRrkkN4atDjhPoPlBrNFgxGPB9hFQFMiyNsWq7DYmJqpfrxqQwfCJPLJxNm6smq5KZsX0xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVed+XTN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVed+XTN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490C0C4CEF7
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  5 Feb 2026 20:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770322134;
	bh=moqbsgwllSa5wFWSMz/b9r+x1Rw8q4kGym5kD5orslw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=dVed+XTN8TLbSMhhEBGC1HC5HavI55kKhywR8hOehcBFu5hXCppZ5MLFFqih4AOY9
	 ORxc5jIt2QOsgvGVCPBo19Dmua9ttgu8ql+9jOQ6Iqr6V/A9nxsn+cND1TFnWonbHs
	 I7iSPLgTN9YKvX3Lb0Sze9PhhmOb+YgmWD5LgKYuBk5oP2HBbfGT6kY0mAavMvxz7p
	 8nBnTN6q06f9/1BMrWA5M25c7xFznCQeV/NzumdISpCycPVRGq03Vt2nAGYpfkM3n3
	 o7S5MZVy+l4FMRv0xm68hyY++xw7NsaZyRHdg5rNWxk8z/LektUgS+OZWaERWY/B3S
	 a9l4ko8dMDk9A==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 28B7DF40069;
	Thu,  5 Feb 2026 15:08:53 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Thu, 05 Feb 2026 15:08:53 -0500
X-ME-Sender: <xms:1fiEaQQ8fiDiGSwniMvUNM-J8OJ1HXI7lMGaP0VdPDvAELdjuDyPGA>
    <xme:1fiEaYn56eaqvKeK1CWO5t2tnMkrPZhJxu1-5c4KHCMrDyUPLQNbTTDSLJRTJEZ9H
    Gwnzn2y3ljElvW-EPZ-BM2c-LnffoXc3hfdNw0hpvonpxsIgP4qaYc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeeivddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfvehhuhgt
    khcunfgvvhgvrhdfuceotggvlheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpefhffekffeftdfgheeiveekudeuhfdvjedvfedvueduvdegleekgeetgfduhfefleen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegthhhutg
    hklhgvvhgvrhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeifeegleel
    leehledqfedvleekgeegvdefqdgtvghlpeepkhgvrhhnvghlrdhorhhgsehfrghsthhmrg
    hilhdrtghomhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepkhgvrhhnvghlqdhtlhhsqdhhrghnughshhgrkhgvsehlihhsthhsrdhlihhnuh
    igrdguvghvpdhrtghpthhtoheptghhuhgtkhdrlhgvvhgvrhesohhrrggtlhgvrdgtohhm
    pdhrtghpthhtohepshhmrgihhhgvfiesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:1fiEaTsqfgQLVAol_oIPKXy0C-G-GuQDpPaMMqAhsp3c75Y-kQIuBg>
    <xmx:1fiEacOA10SrvtCbS1IJlRvlMU88BW0hv6YcjWuWHE0zeO-RtxuU8w>
    <xmx:1fiEaZ2AliVAJYFE65y0Luj1CTiNfDh6jdQvRHPwII6m929W14NeWQ>
    <xmx:1fiEaQNS7_lgUqMtAUj7JFs0I4R4fCcIRnz4U4J9IDzVs4gxUAeOGw>
    <xmx:1fiEaR2nKxE5XKDY7SxRpJwCk0sKdGJTxF4BMoNVLQj89GFNmK1Ef-6P>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 00BB6780070; Thu,  5 Feb 2026 15:08:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Am1W6CbsKMOk
Date: Thu, 05 Feb 2026 15:08:32 -0500
From: "Chuck Lever" <cel@kernel.org>
To: "Scott Mayhew" <smayhew@redhat.com>,
 "Chuck Lever" <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
Message-Id: <fc92aba9-0498-418a-bd0f-a4e519c6651b@app.fastmail.com>
In-Reply-To: <20260205172843.1547285-1-smayhew@redhat.com>
References: <20260205172843.1547285-1-smayhew@redhat.com>
Subject: Re: [PATCH v2] tlshd: Send fatal alert to client when there are server config
 issues
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, Feb 5, 2026, at 12:28 PM, Scott Mayhew wrote:
> Currently if a client attempts an x.509 handshake and the server is
> misconfigured (no certificates, no private keys, etc), the server simply
> closes the connection.  Prior to b010190 ("tlshd: Pass ETIMEDOUT from
> gnutls to kernel"), this would result in a quick failure on the client.
> Now the client keeps retrying until the mount program times out, which
> takes several minutes.
>
> A misconfigured server isn't a self-correcting problem, so send a fatal
> alert to the client when this occurs so the client stops retrying
> immediately.  This requires some minor refactoring of
> tlshd_tls13_server_x509_handshake() so that the session is initialized
> before attempting to load the certs and keys (otherwise it is not
> possible to send an alert).  Also add some debug logging to help
> the admin take corrective action.
>
> Finally add some logging when an alert is received during the handshake.
> Following suit with handshake completions, alerts will only be logged if
> debug logging is enabled.
>
> Signed-off-by: Scott Mayhew <smayhew@redhat.com>
> ---
>  src/tlshd/handshake.c |  4 ++++
>  src/tlshd/log.c       | 15 ++++++++++++++
>  src/tlshd/server.c    | 48 ++++++++++++++++++++++++++++---------------
>  src/tlshd/tlshd.h     |  1 +
>  4 files changed, 51 insertions(+), 17 deletions(-)
>
> diff --git a/src/tlshd/handshake.c b/src/tlshd/handshake.c
> index e78f78f..511a369 100644
> --- a/src/tlshd/handshake.c
> +++ b/src/tlshd/handshake.c
> @@ -115,6 +115,10 @@ void tlshd_start_tls_handshake(gnutls_session_t 
> session,
>  			tlshd_log_error("Handshake timeout, retrying");
>  			parms->session_status = ETIMEDOUT;
>  			break;
> +		case GNUTLS_E_WARNING_ALERT_RECEIVED:
> +		case GNUTLS_E_FATAL_ALERT_RECEIVED:
> +			tlshd_log_alert(session);
> +			break;
>  		default:
>  			tlshd_log_gnutls_error(ret);
>  		}
> diff --git a/src/tlshd/log.c b/src/tlshd/log.c
> index b70d4af..a890b60 100644
> --- a/src/tlshd/log.c
> +++ b/src/tlshd/log.c
> @@ -188,6 +188,21 @@ void 
> tlshd_log_cert_verification_error(gnutls_session_t session)
>  			       tlshd_cert_status_names[i].name);
>  }
> 
> +/**
> + * @brief Report a TLS alert
> + * @param[in]     session  Controlling GnuTLS session
> + */
> +void tlshd_log_alert(gnutls_session_t session)
> +{
> +	gnutls_alert_description_t alert;
> +
> +	if (!tlshd_debug)
> +		return;
> +
> +	alert = gnutls_alert_get(session);
> +	tlshd_log_notice("Received alert: %s", gnutls_alert_get_name(alert));
> +}
> +
>  /**
>   * @brief Emit "library call failed" notification
>   * @param[in]     error  GnuTLS error code to log
> diff --git a/src/tlshd/server.c b/src/tlshd/server.c
> index 4850210..838c04b 100644
> --- a/src/tlshd/server.c
> +++ b/src/tlshd/server.c
> @@ -397,30 +397,50 @@ static void 
> tlshd_tls13_server_x509_handshake(struct tlshd_handshake_parms *parm
>  	gnutls_session_t session;
>  	int ret;
> 
> +	ret = gnutls_init(&session, GNUTLS_SERVER);
> +	if (ret != GNUTLS_E_SUCCESS) {
> +		tlshd_log_gnutls_error(ret);
> +		return;
> +	}
> +	gnutls_transport_set_int(session, parms->sockfd);
> +	gnutls_session_set_ptr(session, parms);
> +
> +	ret = tlshd_gnutls_priority_set(session, parms, 0);
> +	if (ret) {
> +		tlshd_log_gnutls_error(ret);
> +		gnutls_deinit(session);
> +		return;
> +	}
> +
>  	ret = gnutls_certificate_allocate_credentials(&xcred);
>  	if (ret != GNUTLS_E_SUCCESS) {
>  		tlshd_log_gnutls_error(ret);
> +		gnutls_deinit(session);
>  		return;
>  	}
>  	ret = tlshd_server_get_truststore(xcred);
> -	if (ret != GNUTLS_E_SUCCESS)
> +	if (ret != GNUTLS_E_SUCCESS) {
> +		tlshd_log_debug("Failed to initialize server trust store - check the 
> configuration");
> +		gnutls_alert_send(session, GNUTLS_AL_FATAL, GNUTLS_A_ACCESS_DENIED);
> +		gnutls_deinit(session);
>  		goto out_free_creds;
> +	}
> 
> -	if (!tlshd_x509_server_get_certs(parms))
> +	if (!tlshd_x509_server_get_certs(parms)) {
> +		tlshd_log_debug("No usable server certificates were found - check 
> the configuration");
> +		gnutls_alert_send(session, GNUTLS_AL_FATAL, GNUTLS_A_ACCESS_DENIED);
> +		gnutls_deinit(session);
>  		goto out_free_creds;
> -	if (!tlshd_x509_server_get_privkey(parms))
> +	}
> +	if (!tlshd_x509_server_get_privkey(parms)) {
> +		tlshd_log_debug("No usable private keys were found - check the 
> configuration");
> +		gnutls_alert_send(session, GNUTLS_AL_FATAL, GNUTLS_A_ACCESS_DENIED);
> +		gnutls_deinit(session);
>  		goto out_free_certs;
> +	}
>  	gnutls_certificate_set_retrieve_function2(xcred,
>  						  tlshd_x509_retrieve_key_cb);
> 
> -	ret = gnutls_init(&session, GNUTLS_SERVER);
> -	if (ret != GNUTLS_E_SUCCESS) {
> -		tlshd_log_gnutls_error(ret);
> -		goto out_free_certs;
> -	}
> -	gnutls_transport_set_int(session, parms->sockfd);
> -	gnutls_session_set_ptr(session, parms);
> -
>  	ret = gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
>  	if (ret != GNUTLS_E_SUCCESS) {
>  		tlshd_log_gnutls_error(ret);
> @@ -430,12 +450,6 @@ static void 
> tlshd_tls13_server_x509_handshake(struct tlshd_handshake_parms *parm
>  					       tlshd_tls13_server_x509_verify_function);
>  	gnutls_certificate_server_set_request(session, GNUTLS_CERT_REQUEST);
> 
> -	ret = tlshd_gnutls_priority_set(session, parms, 0);
> -	if (ret) {
> -		tlshd_log_gnutls_error(ret);
> -		goto out_free_certs;
> -	}
> -
>  	tlshd_start_tls_handshake(session, parms);
> 
>  	if (tlshd_debug &&
> diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
> index 75d9a4a..d00cfdf 100644
> --- a/src/tlshd/tlshd.h
> +++ b/src/tlshd/tlshd.h
> @@ -118,6 +118,7 @@ extern void tlshd_log_perror(const char *prefix);
>  extern void tlshd_log_gai_error(int error);
> 
>  extern void tlshd_log_cert_verification_error(gnutls_session_t session);
> +extern void tlshd_log_alert(gnutls_session_t session);
>  extern void tlshd_log_gnutls_error(int error);
>  extern void tlshd_gnutls_log_func(int level, const char *msg);
>  extern void tlshd_gnutls_audit_func(gnutls_session_t session, const char *msg);
> -- 
> 2.52.0

Merged into main with a couple of fixes.


-- 
Chuck Lever

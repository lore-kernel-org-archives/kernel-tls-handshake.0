Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825A0346AFC
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  4 Feb 2026 18:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770230863; cv=none; b=WTd9WMJ2Y+4GVG22sQIrRih1PKrTmn2Ycw9pp37bt7q21tXEaHzPzipB6D2pDsz0anlMwDErKopxBRGm0EYaaI0hjc3EnktgqpcxPqLvvC11x0+dithl3r692BhwbiT6AdXlQX2+gJn9bSN2kmWG08BicHyqw2hnXxlKnFDOV5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770230863; c=relaxed/simple;
	bh=RnpGbbQ0XMYc7tq08B6WoLkk5nY0afnu0KkuOxTtaVI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=vFzQ88eXwjpv0IzPi+15eD/OEWhmb07ImrzPGPzbLa14aZ28aFiAxROGD/mXZHZDg4OnLdEq2L//GDtd+oRMSLYUrCqD9aV3NzlSLbcB7jgECp+GSHtRawzVhlc9vLJU+LoJ0F3AdNFKX6xWtoisKw8YHbLUVHRSNZHtKlB9txM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0KW961c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0KW961c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E756BC116C6
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  4 Feb 2026 18:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770230863;
	bh=RnpGbbQ0XMYc7tq08B6WoLkk5nY0afnu0KkuOxTtaVI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=g0KW961c99pBYvkGPjTICRxBVoU86vC9udfLWFHlzPPX++jWIdL4iNuTv4uZfr9II
	 ZL/xkIOYVlzpo6nr91NRcLvShrl7iJIQ8EHCCmP2NK4te8TvLTSJshyG+jVJvYtihQ
	 pBRfoDv1gf65lPc665iN1DAo3Xo7ITD1cTagfdm5+KDoiRK1HtfCEkK9SavPNzKIPn
	 ligUjLYzeJXGF8TY+STx5qiY0hRifT+dt9XVxg/RHzidgy479UjH91bE4lOKUfFhJj
	 /Q6PODKu+YlZHLADDJm6WrR5sad4q7yd8favg8QNiisnoyWs4IQIu+fNEk/Fiyrrxf
	 wBS214ruLCZTQ==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id DD6CDF4006B;
	Wed,  4 Feb 2026 13:47:41 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Wed, 04 Feb 2026 13:47:41 -0500
X-ME-Sender: <xms:TZSDafk7Vvku3Z4lO1sa0DoWfTokzl27Xpj9LpTojgAUin4mHLjbvw>
    <xme:TZSDadoStLYDo3UaiKqmm-Y_PR8te7AMv06HWz2ClS3EEUaT7TIj2aopFpoT_G-d3
    OgE7ljXurTQJC9-QWT5pLNdC-r8P1s3lKAXzE_4oGlfw0KOIXAuhT7F>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeefudelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:TZSDacw75rNFBL5zeqY-sRG86NCcd2v6ddiakIxP339WgySP0NVoGA>
    <xmx:TZSDaXI5MuXqy3tInVe6c4XCqW7SIIE3WrnMTjXciqY_RSyC8Ut8Mw>
    <xmx:TZSDabRiqJELYTISZ5R9vssel59-_p_rrxHeTa8eZqUlufSlYwfDbw>
    <xmx:TZSDaXrIItExzf_7SRSlGTBU1l-VE769ZUmqElaQSJP2v8YinqFifw>
    <xmx:TZSDaYq4k0t4J2gj9F4xNe82JY7dbec8EUrX58tbFUHjm_UodP_6Cyhs>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BCA5B780070; Wed,  4 Feb 2026 13:47:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AyN2oax_Tyso
Date: Wed, 04 Feb 2026 13:47:08 -0500
From: "Chuck Lever" <cel@kernel.org>
To: "Scott Mayhew" <smayhew@redhat.com>,
 "Chuck Lever" <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
Message-Id: <d155013f-b9e6-4c51-bccc-f4e73cda5dff@app.fastmail.com>
In-Reply-To: <20260203231203.1393170-1-smayhew@redhat.com>
References: <20260203231203.1393170-1-smayhew@redhat.com>
Subject: Re: [PATCH] tlshd: Send fatal alert to client when there are server config
 issues
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Tue, Feb 3, 2026, at 6:12 PM, Scott Mayhew wrote:
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
>  src/tlshd/log.c       | 22 +++++++++++++++++++++
>  src/tlshd/server.c    | 46 +++++++++++++++++++++++++++----------------
>  src/tlshd/tlshd.h     |  1 +
>  4 files changed, 56 insertions(+), 17 deletions(-)
>
> diff --git a/src/tlshd/handshake.c b/src/tlshd/handshake.c
> index e78f78f..007339a 100644
> --- a/src/tlshd/handshake.c
> +++ b/src/tlshd/handshake.c
> @@ -115,6 +115,10 @@ void tlshd_start_tls_handshake(gnutls_session_t 
> session,
>  			tlshd_log_error("Handshake timeout, retrying");
>  			parms->session_status = ETIMEDOUT;
>  			break;
> +		case GNUTLS_E_WARNING_ALERT_RECEIVED:
> +		case GNUTLS_E_FATAL_ALERT_RECEIVED:
> +			tlshd_log_alert(session, ret);
> +			break;
>  		default:
>  			tlshd_log_gnutls_error(ret);
>  		}
> diff --git a/src/tlshd/log.c b/src/tlshd/log.c
> index b70d4af..bab390a 100644
> --- a/src/tlshd/log.c
> +++ b/src/tlshd/log.c
> @@ -188,6 +188,28 @@ void 
> tlshd_log_cert_verification_error(gnutls_session_t session)
>  			       tlshd_cert_status_names[i].name);
>  }
> 
> +/**
> + * @brief Report a TLS alert
> + * @param[in]     session  Controlling GnuTLS session
> + * @param[in]     level    TLS alert level (warning or fatal)

A TLS alert level would be GNUTLS_AL_WARNING or GNUTLS_AL_FATAL (protocol values 1 and 2). The actual @level values passed are GnuTLS error codes like -25 and -12 (negative integers indicating error conditions).


> + */
> +void tlshd_log_alert(gnutls_session_t session, int level)
> +{
> +	gnutls_alert_description_t alert;
> +
> +	if (level != GNUTLS_E_WARNING_ALERT_RECEIVED &&
> +			level != GNUTLS_E_FATAL_ALERT_RECEIVED) {
> +		tlshd_log_debug("%s called with invalid level", __func__);
> +		return;
> +	}
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
> index 4850210..3a72fc5 100644
> --- a/src/tlshd/server.c
> +++ b/src/tlshd/server.c
> @@ -397,30 +397,48 @@ static void 
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

Are you leaking the session handle in this error flow?
Might need a gnutls_deinit(session);


> +		return;
> +	}
> +
>  	ret = gnutls_certificate_allocate_credentials(&xcred);
>  	if (ret != GNUTLS_E_SUCCESS) {
>  		tlshd_log_gnutls_error(ret);

Ditto.


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
> @@ -430,12 +448,6 @@ static void 
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
> index 75d9a4a..686d861 100644
> --- a/src/tlshd/tlshd.h
> +++ b/src/tlshd/tlshd.h
> @@ -118,6 +118,7 @@ extern void tlshd_log_perror(const char *prefix);
>  extern void tlshd_log_gai_error(int error);
> 
>  extern void tlshd_log_cert_verification_error(gnutls_session_t session);
> +extern void tlshd_log_alert(gnutls_session_t session, int level);
>  extern void tlshd_log_gnutls_error(int error);
>  extern void tlshd_gnutls_log_func(int level, const char *msg);
>  extern void tlshd_gnutls_audit_func(gnutls_session_t session, const char *msg);
> -- 
> 2.52.0

-- 
Chuck Lever

Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44CB27B4FA
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  4 Feb 2026 20:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770237559; cv=none; b=WA6wCnKB/GKYdw+NtCq9MQlDCgdRwvKJrKKjx2Z16K34cv8uteyAcTbD+nlDq5pewDk7XV0bLg4hQv9K8IuUdEk5/m8D6OdOO4x9CNTgfbPCPB6I10gOtcvkUYH82OgdXnvO7Sz3pCE401gimgzG7I+u0JDlC7hIiNWHo+07hMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770237559; c=relaxed/simple;
	bh=ELIlhoTcpluYIgub2Pw2/PVH2bqVk78fyq+elegxQSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Mv+DXh5jx2UGggTrmKV2tCFb+KiqrlWPZHuB5ivManzlwdfvA12KUSortBA830I0mIKiatZhPPp7wy65P7JS+MkizE1WGHwURFDIhd79JWsUv8IiInjivKbqxwcqW8xEIiKcSMWhqf6FXCXpmBZlbsi/F0LcttzICSyJhjbD2Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X+Wgyoc+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X+Wgyoc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770237557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rVpyi7wv/3iTwodAY4zZNHpW88eIsEFid3HrDI4Iuc0=;
	b=X+Wgyoc+Mzdf+ffY2jp5GQeOdsbJcy5L/gcsnEhLgbhol5PSWBbN8HvMBQ/UKUXFrZpqn/
	UGZxsTCrYKfGY8+3Bx5kVZE1g6MiLQ9GUa38BlPV1daUVyhHIA79r/tZa+fBTGQi01CF9u
	3UQ9v0h1x5NmefEsDiXj0Vv/pE8C//M=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-137-ATdEYT6_OgqMHqNPi0oD_g-1; Wed,
 04 Feb 2026 15:39:13 -0500
X-MC-Unique: ATdEYT6_OgqMHqNPi0oD_g-1
X-Mimecast-MFC-AGG-ID: ATdEYT6_OgqMHqNPi0oD_g_1770237552
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7FE8818004BB;
	Wed,  4 Feb 2026 20:39:12 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.65.92])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DFCDE30001B9;
	Wed,  4 Feb 2026 20:39:11 +0000 (UTC)
Received: by aion.redhat.com (Postfix, from userid 1000)
	id 83ECA69F713; Wed, 04 Feb 2026 15:39:10 -0500 (EST)
Date: Wed, 4 Feb 2026 15:39:10 -0500
From: Scott Mayhew <smayhew@redhat.com>
To: Chuck Lever <cel@kernel.org>
Cc: Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev
Subject: Re: [PATCH] tlshd: Send fatal alert to client when there are server
 config issues
Message-ID: <aYOubhCOKmh77fCe@aion>
References: <20260203231203.1393170-1-smayhew@redhat.com>
 <d155013f-b9e6-4c51-bccc-f4e73cda5dff@app.fastmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d155013f-b9e6-4c51-bccc-f4e73cda5dff@app.fastmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tYUGqVcYQx_VTgs0wZeON5161mjy8vANC940NMeBbEU_1770237552
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 04 Feb 2026, Chuck Lever wrote:

> 
> 
> On Tue, Feb 3, 2026, at 6:12 PM, Scott Mayhew wrote:
> > Currently if a client attempts an x.509 handshake and the server is
> > misconfigured (no certificates, no private keys, etc), the server simply
> > closes the connection.  Prior to b010190 ("tlshd: Pass ETIMEDOUT from
> > gnutls to kernel"), this would result in a quick failure on the client.
> > Now the client keeps retrying until the mount program times out, which
> > takes several minutes.
> >
> > A misconfigured server isn't a self-correcting problem, so send a fatal
> > alert to the client when this occurs so the client stops retrying
> > immediately.  This requires some minor refactoring of
> > tlshd_tls13_server_x509_handshake() so that the session is initialized
> > before attempting to load the certs and keys (otherwise it is not
> > possible to send an alert).  Also add some debug logging to help
> > the admin take corrective action.
> >
> > Finally add some logging when an alert is received during the handshake.
> > Following suit with handshake completions, alerts will only be logged if
> > debug logging is enabled.
> >
> > Signed-off-by: Scott Mayhew <smayhew@redhat.com>
> > ---
> >  src/tlshd/handshake.c |  4 ++++
> >  src/tlshd/log.c       | 22 +++++++++++++++++++++
> >  src/tlshd/server.c    | 46 +++++++++++++++++++++++++++----------------
> >  src/tlshd/tlshd.h     |  1 +
> >  4 files changed, 56 insertions(+), 17 deletions(-)
> >
> > diff --git a/src/tlshd/handshake.c b/src/tlshd/handshake.c
> > index e78f78f..007339a 100644
> > --- a/src/tlshd/handshake.c
> > +++ b/src/tlshd/handshake.c
> > @@ -115,6 +115,10 @@ void tlshd_start_tls_handshake(gnutls_session_t 
> > session,
> >  			tlshd_log_error("Handshake timeout, retrying");
> >  			parms->session_status = ETIMEDOUT;
> >  			break;
> > +		case GNUTLS_E_WARNING_ALERT_RECEIVED:
> > +		case GNUTLS_E_FATAL_ALERT_RECEIVED:
> > +			tlshd_log_alert(session, ret);
> > +			break;
> >  		default:
> >  			tlshd_log_gnutls_error(ret);
> >  		}
> > diff --git a/src/tlshd/log.c b/src/tlshd/log.c
> > index b70d4af..bab390a 100644
> > --- a/src/tlshd/log.c
> > +++ b/src/tlshd/log.c
> > @@ -188,6 +188,28 @@ void 
> > tlshd_log_cert_verification_error(gnutls_session_t session)
> >  			       tlshd_cert_status_names[i].name);
> >  }
> > 
> > +/**
> > + * @brief Report a TLS alert
> > + * @param[in]     session  Controlling GnuTLS session
> > + * @param[in]     level    TLS alert level (warning or fatal)
> 
> A TLS alert level would be GNUTLS_AL_WARNING or GNUTLS_AL_FATAL (protocol values 1 and 2). The actual @level values passed are GnuTLS error codes like -25 and -12 (negative integers indicating error conditions).
> 

Ah, that's correct.  I think I should just drop the level altogether.
Initially I had in mind that we may want to do something different based
no the alert level, but right now it's serving no purpose there.

> 
> > + */
> > +void tlshd_log_alert(gnutls_session_t session, int level)
> > +{
> > +	gnutls_alert_description_t alert;
> > +
> > +	if (level != GNUTLS_E_WARNING_ALERT_RECEIVED &&
> > +			level != GNUTLS_E_FATAL_ALERT_RECEIVED) {
> > +		tlshd_log_debug("%s called with invalid level", __func__);
> > +		return;
> > +	}
> > +
> > +	if (!tlshd_debug)
> > +		return;
> > +
> > +	alert = gnutls_alert_get(session);
> > +	tlshd_log_notice("Received alert: %s", gnutls_alert_get_name(alert));
> > +}
> > +
> >  /**
> >   * @brief Emit "library call failed" notification
> >   * @param[in]     error  GnuTLS error code to log
> > diff --git a/src/tlshd/server.c b/src/tlshd/server.c
> > index 4850210..3a72fc5 100644
> > --- a/src/tlshd/server.c
> > +++ b/src/tlshd/server.c
> > @@ -397,30 +397,48 @@ static void 
> > tlshd_tls13_server_x509_handshake(struct tlshd_handshake_parms *parm
> >  	gnutls_session_t session;
> >  	int ret;
> > 
> > +	ret = gnutls_init(&session, GNUTLS_SERVER);
> > +	if (ret != GNUTLS_E_SUCCESS) {
> > +		tlshd_log_gnutls_error(ret);
> > +		return;
> > +	}
> > +	gnutls_transport_set_int(session, parms->sockfd);
> > +	gnutls_session_set_ptr(session, parms);
> > +
> > +	ret = tlshd_gnutls_priority_set(session, parms, 0);
> > +	if (ret) {
> > +		tlshd_log_gnutls_error(ret);
> 
> Are you leaking the session handle in this error flow?
> Might need a gnutls_deinit(session);

Yep.  I'll fix it up in v2.

> 
> 
> > +		return;
> > +	}
> > +
> >  	ret = gnutls_certificate_allocate_credentials(&xcred);
> >  	if (ret != GNUTLS_E_SUCCESS) {
> >  		tlshd_log_gnutls_error(ret);
> 
> Ditto.
> 
> 
> >  		return;
> >  	}
> >  	ret = tlshd_server_get_truststore(xcred);
> > -	if (ret != GNUTLS_E_SUCCESS)
> > +	if (ret != GNUTLS_E_SUCCESS) {
> > +		tlshd_log_debug("Failed to initialize server trust store - check the 
> > configuration");
> > +		gnutls_alert_send(session, GNUTLS_AL_FATAL, GNUTLS_A_ACCESS_DENIED);
> > +		gnutls_deinit(session);
> >  		goto out_free_creds;
> > +	}
> > 
> > -	if (!tlshd_x509_server_get_certs(parms))
> > +	if (!tlshd_x509_server_get_certs(parms)) {
> > +		tlshd_log_debug("No usable server certificates were found - check 
> > the configuration");
> > +		gnutls_alert_send(session, GNUTLS_AL_FATAL, GNUTLS_A_ACCESS_DENIED);
> > +		gnutls_deinit(session);
> >  		goto out_free_creds;
> > -	if (!tlshd_x509_server_get_privkey(parms))
> > +	}
> > +	if (!tlshd_x509_server_get_privkey(parms)) {
> > +		tlshd_log_debug("No usable private keys were found - check the 
> > configuration");
> > +		gnutls_alert_send(session, GNUTLS_AL_FATAL, GNUTLS_A_ACCESS_DENIED);
> > +		gnutls_deinit(session);
> >  		goto out_free_certs;
> > +	}
> >  	gnutls_certificate_set_retrieve_function2(xcred,
> >  						  tlshd_x509_retrieve_key_cb);
> > 
> > -	ret = gnutls_init(&session, GNUTLS_SERVER);
> > -	if (ret != GNUTLS_E_SUCCESS) {
> > -		tlshd_log_gnutls_error(ret);
> > -		goto out_free_certs;
> > -	}
> > -	gnutls_transport_set_int(session, parms->sockfd);
> > -	gnutls_session_set_ptr(session, parms);
> > -
> >  	ret = gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
> >  	if (ret != GNUTLS_E_SUCCESS) {
> >  		tlshd_log_gnutls_error(ret);
> > @@ -430,12 +448,6 @@ static void 
> > tlshd_tls13_server_x509_handshake(struct tlshd_handshake_parms *parm
> >  					       tlshd_tls13_server_x509_verify_function);
> >  	gnutls_certificate_server_set_request(session, GNUTLS_CERT_REQUEST);
> > 
> > -	ret = tlshd_gnutls_priority_set(session, parms, 0);
> > -	if (ret) {
> > -		tlshd_log_gnutls_error(ret);
> > -		goto out_free_certs;
> > -	}
> > -
> >  	tlshd_start_tls_handshake(session, parms);
> > 
> >  	if (tlshd_debug &&
> > diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
> > index 75d9a4a..686d861 100644
> > --- a/src/tlshd/tlshd.h
> > +++ b/src/tlshd/tlshd.h
> > @@ -118,6 +118,7 @@ extern void tlshd_log_perror(const char *prefix);
> >  extern void tlshd_log_gai_error(int error);
> > 
> >  extern void tlshd_log_cert_verification_error(gnutls_session_t session);
> > +extern void tlshd_log_alert(gnutls_session_t session, int level);
> >  extern void tlshd_log_gnutls_error(int error);
> >  extern void tlshd_gnutls_log_func(int level, const char *msg);
> >  extern void tlshd_gnutls_audit_func(gnutls_session_t session, const char *msg);
> > -- 
> > 2.52.0
> 
> -- 
> Chuck Lever
> 


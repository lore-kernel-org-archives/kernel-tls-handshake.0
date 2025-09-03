Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D60301462
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  3 Sep 2025 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906108; cv=none; b=ZlRDjSlybaoPuZeI/T9WWxrjIZP0ofuCsFo9grZJ6x7E2yx0y4ZDYqnNzdwhoA0fbyv2NgmpPtFNp5gtdBTxlFe3JW3mESD4dYCZGekvYBZ2q4CyZxmTmxANnCLVUounQ0p6LjrZDdVYVg9GOaP+ZX4JVskQX+0QOKVG4cv82xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906108; c=relaxed/simple;
	bh=TjHPKfREQ5frU3YyKa6FHScwup6bSxehxbxO4FmKo40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=AXJLTIg1mpH/SjE+Qr6LlAbKxv3MArpP9uivpwpY3tMqL77Tzqz4ojnVaH07V2/tL0UXT7sas3extR5yesIcJ2s7WoCYmUJahIIcrreApRTUw/sW9Az1Js1GjqDQU0OkrUo1mb7Fe63rMIG9CiycSSwRgzSD+Hvtu6poyO6cOeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fJV8j4RG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fJV8j4RG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756906104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gg8hgJrqBa3As7UiGkDtOEVjaeH5RGB9vOhMXwory+k=;
	b=fJV8j4RGfBVdBFh+R2KidJXgkval190KB9RlzNuULtFUVx1TfBm7PfcyfUwCFE8/9xUT0T
	ZPtxpFqGa0EKJWMz9oS/kGiAdqO35uYpcJT9ETDJ3IHTeyLE1RIi8JbJ8e61ChCscgINEB
	YT/MaIUclz7mtjOPEljc2LDvhOMtrFA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-253-qkgaoQuXMcWGVQcI6ueGpQ-1; Wed,
 03 Sep 2025 09:28:23 -0400
X-MC-Unique: qkgaoQuXMcWGVQcI6ueGpQ-1
X-Mimecast-MFC-AGG-ID: qkgaoQuXMcWGVQcI6ueGpQ_1756906102
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 176801800612;
	Wed,  3 Sep 2025 13:28:20 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.88.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ADC051800451;
	Wed,  3 Sep 2025 13:28:19 +0000 (UTC)
Received: by aion.redhat.com (Postfix, from userid 1000)
	id B112242EA80; Wed, 03 Sep 2025 09:28:17 -0400 (EDT)
Date: Wed, 3 Sep 2025 09:28:17 -0400
From: Scott Mayhew <smayhew@redhat.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev
Subject: Re: [PATCH 2/5] tlshd: Server-side dual certificate support
Message-ID: <aLhCcXmJV0VQaJGe@aion>
References: <20250828222348.601924-1-smayhew@redhat.com>
 <20250828222348.601924-3-smayhew@redhat.com>
 <cc649f61-f3a4-419c-a861-2b4d23aab38a@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cc649f61-f3a4-419c-a861-2b4d23aab38a@oracle.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6BeNtxsqmHz2uVuJAqhqgYU6EkaYQexy7SIIi097loA_1756906102
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, 29 Aug 2025, Chuck Lever wrote:

> On 8/28/25 6:23 PM, Scott Mayhew wrote:
> > Add two new config options, "x509.pq.certificate" and
> > "x509.pq.private_key" to configure tlshd to use an ML-DSA certificate.
> > If the cert callback determines that the client supports ML-DSA, it will
> > select this certificate.  Otherwise, it will fall back to the
> > traditional certficate (i.e. the certificate configured via
> > "x509.certificate" and "x509.private_key").
> > 
> > Link: https://github.com/oracle/ktls-utils/issues/113
> > Signed-off-by: Scott Mayhew <smayhew@redhat.com>
> > ---
> >  configure.ac             | 12 ++++++++
> >  src/tlshd/config.c       | 12 +++++---
> >  src/tlshd/server.c       | 59 ++++++++++++++++++++++++++++++++++++++--
> >  src/tlshd/tlshd.conf     |  2 ++
> >  src/tlshd/tlshd.conf.man | 13 +++++++++
> >  src/tlshd/tlshd.h        |  6 ++--
> >  6 files changed, 96 insertions(+), 8 deletions(-)
> > 
> > diff --git a/configure.ac b/configure.ac
> > index a6d9d09..0dd23f2 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -79,6 +79,18 @@ AC_CHECK_LIB([gnutls], [gnutls_get_system_config_file],
> >  AC_CHECK_LIB([gnutls], [gnutls_psk_allocate_client_credentials2],
> >               [AC_DEFINE([HAVE_GNUTLS_PSK_ALLOCATE_CREDENTIALS2], [1],
> >                          [Define to 1 if you have the gnutls_psk_allocate_client_credentials2 function.])])
> > +
> > +AC_MSG_CHECKING(for ML-DSA support in gnutls)
> > +AC_COMPILE_IFELSE(
> > +	[AC_LANG_PROGRAM([[ #include <gnutls/gnutls.h> ]],
> > +		[[ (void) GNUTLS_SIGN_MLDSA65; ]])],
> > +	[ have_mldsa=yes ],
> > +	[ have_mldsa=no ])
> > +AC_MSG_RESULT([$have_mldsa])
> > +if test "x$have_mldsa" = xyes ; then
> > +	AC_DEFINE([HAVE_GNUTLS_MLDSA], [1], [Define to 1 if gnutls supports ML-DSA])
> > +fi
> > +
> >  AC_SUBST([AM_CPPFLAGS])
> >  
> >  AC_CONFIG_FILES([Makefile src/Makefile src/tlshd/Makefile systemd/Makefile])
> 
> Nice.
> 
> 
> > diff --git a/src/tlshd/config.c b/src/tlshd/config.c
> > index 4c54d37..20634dd 100644
> > --- a/src/tlshd/config.c
> > +++ b/src/tlshd/config.c
> > @@ -403,6 +403,7 @@ bool tlshd_config_get_server_crl(char **result)
> >  
> >  /**
> >   * tlshd_config_get_server_certs - Get certs for ServerHello from .conf
> > + * @key: IN: the key field name from .conf
> 
> ETOOMANYTHINGSCALLEDKEY :-)
> 
> Can you find a less overloaded name for the new function parameter, here
> and below?

Yeah, I called it 'key' because that's what it's referred to in
https://docs.gtk.org/glib/method.KeyFile.get_string.html
I'm open to suggestions (gkey? gfile_key? option?)

> 
> But see below... perhaps the additional parameter isn't needed if all
> the configured certificates and private keys can be retrieved using the
> same functions.
> 
> 
> >   * @certs: OUT: in-memory certificates
> >   * @certs_len: IN: maximum number of certs to get, OUT: number of certs found
> >   *
> > @@ -410,7 +411,8 @@ bool tlshd_config_get_server_crl(char **result)
> >   *   %true: certificate retrieved successfully
> >   *   %false: certificate not retrieved
> >   */
> > -bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
> > +bool tlshd_config_get_server_certs(const gchar *key,
> > +				   gnutls_pcert_st *certs,
> >  				   unsigned int *certs_len)
> >  {
> >  	gnutls_datum_t data;
> > @@ -418,7 +420,7 @@ bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
> >  	int ret;
> >  
> >  	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
> > -					"x509.certificate", NULL);
> > +					key, NULL);
> >  	if (!pathname)
> >  		return false;
> >  
> > @@ -446,20 +448,22 @@ bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
> >  
> >  /**
> >   * tlshd_config_get_server_privkey - Get private key for ServerHello from .conf
> > + * @key: IN: the key field name from .conf
> >   * @privkey: OUT: in-memory private key
> >   *
> >   * Return values:
> >   *   %true: private key retrieved successfully
> >   *   %false: private key not retrieved
> >   */
> > -bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey)
> > +bool tlshd_config_get_server_privkey(const gchar *key,
> > +				     gnutls_privkey_t *privkey)
> >  {
> >  	gnutls_datum_t data;
> >  	gchar *pathname;
> >  	int ret;
> >  
> >  	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
> > -					"x509.private_key", NULL);
> > +					key, NULL);
> >  	if (!pathname)
> >  		return false;
> >  
> > diff --git a/src/tlshd/server.c b/src/tlshd/server.c
> > index 6b4535d..96b1b88 100644
> > --- a/src/tlshd/server.c
> > +++ b/src/tlshd/server.c
> > @@ -46,13 +46,25 @@ static gnutls_privkey_t tlshd_server_privkey;
> >  static unsigned int tlshd_server_certs_len = TLSHD_MAX_CERTS;
> >  static gnutls_pcert_st tlshd_server_certs[TLSHD_MAX_CERTS];
> >  
> > +#ifdef HAVE_GNUTLS_MLDSA
> > +static gnutls_privkey_t tlshd_server_pq_privkey;
> > +static unsigned int tlshd_server_pq_certs_len = TLSHD_MAX_CERTS;
> > +static gnutls_pcert_st tlshd_server_pq_certs[TLSHD_MAX_CERTS];
> > +#endif /* HAVE_GNUTLS_MLDSA */
> > +
> 
> Two architectural thoughts when seeing this:
> 
> 1. Generally, I'd rather see fewer "#ifdef HAVE_GNUTLS_MLDSA" throughout
>    and just leave things enabled all the time where it makes sense. That
>    makes for less clutter and better test coverage.

I should've sent v1 before I did any refactoring :/  There's much less
IFDEFery going on in this version.

> 
> 2. Does it make sense for tlshd_config_get_server_certs to retrieve both
>    types of certificates in the same array? Or, more generally speaking,
>    where it's sensible, try not to duplicate the logic, but combine it.

Yeah, when I did the last patch I noticed that each of the client &
server variants of the tlshd_config_get_* are pretty much identical
except for 1) which stanza/group_name of the config they're looking at
and 2) whether they have the word "client" or "server" in the log
message.

I was thinking of adding the group_name to the arg list, which would at
least allow us to use the same functions for the client and the server
side of things... or just adding a flag field to specify whether we're
looking for the configuration for client/server and
post-quantum/traditional.

I'm not sure if I could use a single list or not.  I guess I'd need to
either store the index of the PQ cert or I'd need to walk the list each
time in the cert callback each time to find it.  I thought it was
more straightforward this way.

But looking at the gnutls-serv program I'm wondering why we even need to
use a list at all.  gnutls-serv just pulls the cert and key directly into
the credentials structure (gnutls_certificate_credentials_t) using the
higher level gnutls_certificate_set_x509_key_file() API.  When you run it
with multiple certs it picks the right one, without any cert callback.  Is
there a reason tlshd needs to use the lower level functions
gnutls_pcert_list_import_x509_raw and gnutls_privkey_import_x509_raw (at
least for the server-side stuff)?  Also, why does tlshd parse the config
and set up the credentials structure every time we do a handshake instead
of just doing it once at startup and reusing it for each session?

-Scott

> 
> Similar comments in the client parts of the series. Overall the series
> looks like a reasonable direction.
> 
> 
> >  static bool tlshd_x509_server_get_certs(struct tlshd_handshake_parms *parms)
> >  {
> >  	if (parms->x509_cert != TLS_NO_CERT)
> >  		return tlshd_keyring_get_certs(parms->x509_cert,
> >  					       tlshd_server_certs,
> >  					       &tlshd_server_certs_len);
> > -	return tlshd_config_get_server_certs(tlshd_server_certs,
> > +#ifdef HAVE_GNUTLS_MLDSA
> > +	tlshd_config_get_server_certs("x509.pq.certificate",
> > +				      tlshd_server_pq_certs,
> > +				      &tlshd_server_pq_certs_len);
> > +#endif /* HAVE_GNUTLS_MLDSA */
> > +	return tlshd_config_get_server_certs("x509.certificate",
> > +					     tlshd_server_certs,
> >  					     &tlshd_server_certs_len);
> >  }
> >  
> > @@ -62,6 +74,11 @@ static void tlshd_x509_server_put_certs(void)
> >  
> >  	for (i = 0; i < tlshd_server_certs_len; i++)
> >  		gnutls_pcert_deinit(&tlshd_server_certs[i]);
> > +
> > +#ifdef HAVE_GNUTLS_MLDSA
> > +	for (i = 0; i < tlshd_server_pq_certs_len; i++)
> > +		gnutls_pcert_deinit(&tlshd_server_pq_certs[i]);
> > +#endif /* HAVE_GNUTLS_MLDSA */
> >  }
> >  
> >  static bool tlshd_x509_server_get_privkey(struct tlshd_handshake_parms *parms)
> > @@ -69,12 +86,18 @@ static bool tlshd_x509_server_get_privkey(struct tlshd_handshake_parms *parms)
> >  	if (parms->x509_privkey != TLS_NO_PRIVKEY)
> >  		return tlshd_keyring_get_privkey(parms->x509_privkey,
> >  						 &tlshd_server_privkey);
> > -	return tlshd_config_get_server_privkey(&tlshd_server_privkey);
> > +#ifdef HAVE_GNUTLS_MLDSA
> > +	tlshd_config_get_server_privkey("x509.pq.private_key", &tlshd_server_pq_privkey);
> > +#endif /* HAVE_GNUTLS_MLDSA */
> > +	return tlshd_config_get_server_privkey("x509.private_key", &tlshd_server_privkey);
> >  }
> >  
> >  static void tlshd_x509_server_put_privkey(void)
> >  {
> >  	gnutls_privkey_deinit(tlshd_server_privkey);
> > +#ifdef HAVE_GNUTLS_MLDSA
> > +	gnutls_privkey_deinit(tlshd_server_pq_privkey);
> > +#endif /* HAVE_GNUTLS_MLDSA */
> >  }
> >  
> >  static void tlshd_x509_log_issuers(const gnutls_datum_t *req_ca_rdn, int nreqs)
> > @@ -120,6 +143,11 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
> >  			   gnutls_privkey_t *privkey)
> >  {
> >  	gnutls_certificate_type_t type;
> > +#ifdef HAVE_GNUTLS_MLDSA
> > +	gnutls_sign_algorithm_t client_alg;
> > +	bool use_pq_cert = false;
> > +	int i, ret;
> > +#endif /* HAVE_GNUTLS_MLDSA */
> >  
> >  	tlshd_x509_log_issuers(req_ca_rdn, nreqs);
> >  
> > @@ -127,9 +155,36 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
> >  	if (type != GNUTLS_CRT_X509)
> >  		return -1;
> >  
> > +#ifdef HAVE_GNUTLS_MLDSA
> > +	for (i = 0; ; i++) {
> > +		ret = gnutls_sign_algorithm_get_requested(session, i, &client_alg);
> > +		if (ret != GNUTLS_E_SUCCESS)
> > +			break;
> > +		if (client_alg == GNUTLS_SIGN_MLDSA44
> > +				|| client_alg == GNUTLS_SIGN_MLDSA65
> > +				|| client_alg == GNUTLS_SIGN_MLDSA87) {
> > +			tlshd_log_debug("%s: Client supports ML-DSA", __func__);
> > +			use_pq_cert = true;
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (use_pq_cert == true && tlshd_server_pq_certs_len > 0) {
> > +		tlshd_log_debug("%s: Selecting x509.pq.certificate from conf file", __func__);
> > +		*pcert_length = tlshd_server_pq_certs_len;
> > +		*pcert = tlshd_server_pq_certs;
> > +		*privkey = tlshd_server_pq_privkey;
> > +	} else {
> > +		tlshd_log_debug("%s: Selecting x509.certificate from conf file", __func__);
> > +		*pcert_length = tlshd_server_certs_len;
> > +		*pcert = tlshd_server_certs;
> > +		*privkey = tlshd_server_privkey;
> > +	}
> > +#else
> >  	*pcert_length = tlshd_server_certs_len;
> >  	*pcert = tlshd_server_certs;
> >  	*privkey = tlshd_server_privkey;
> > +#endif /* HAVE_GNUTLS_MLDSA */
> >  	return 0;
> >  }
> >  
> > diff --git a/src/tlshd/tlshd.conf b/src/tlshd/tlshd.conf
> > index 620bd17..5419146 100644
> > --- a/src/tlshd/tlshd.conf
> > +++ b/src/tlshd/tlshd.conf
> > @@ -39,3 +39,5 @@ nl=0
> >  #x509.crl= <pathname>
> >  #x509.certificate= <pathname>
> >  #x509.private_key= <pathname>
> > +#x509.pq.certificate= <pathname>
> > +#x509.pq.private_key= <pathname>
> > diff --git a/src/tlshd/tlshd.conf.man b/src/tlshd/tlshd.conf.man
> > index 914261e..ed545e4 100644
> > --- a/src/tlshd/tlshd.conf.man
> > +++ b/src/tlshd/tlshd.conf.man
> > @@ -125,6 +125,19 @@ a handshake request when no other certificate is available.
> >  .B x509.private_key
> >  This option specifies the pathname of a file containing
> >  a PEM-encoded private key associated with the above certificate.
> > +.TP
> > +.B x509.pq.certificate
> > +This option specifies the pathname of a file containing
> > +a PEM-encoded x.509 certificate that is to be presented during
> > +a handshake request if the peer supports post-quantum cryptography.
> > +If the peer does not support post-quantum cryptography, the
> > +certificate configured in the
> > +.I x509.certificate
> > +option will be presented instead.
> > +.TP
> > +.B x509.pq.private_key
> > +This option specifies the pathname of a file containing
> > +a PEM-encoded private key associated with the above certificate.
> >  .SH SEE ALSO
> >  .BR tlshd (8)
> >  .SH AUTHOR
> > diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
> > index a0dd47e..d9b68ed 100644
> > --- a/src/tlshd/tlshd.h
> > +++ b/src/tlshd/tlshd.h
> > @@ -59,9 +59,11 @@ bool tlshd_config_get_client_certs(gnutls_pcert_st *certs,
> >  bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey);
> >  bool tlshd_config_get_server_truststore(char **bundle);
> >  bool tlshd_config_get_server_crl(char **result);
> > -bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
> > +bool tlshd_config_get_server_certs(const gchar *key,
> > +				   gnutls_pcert_st *certs,
> >  				   unsigned int *certs_len);
> > -bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey);
> > +bool tlshd_config_get_server_privkey(const gchar *key,
> > +				     gnutls_privkey_t *privkey);
> >  
> >  /* handshake.c */
> >  extern void tlshd_start_tls_handshake(gnutls_session_t session,
> 
> 
> -- 
> Chuck Lever
> 


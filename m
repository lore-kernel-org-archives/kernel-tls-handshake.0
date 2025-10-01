Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB7E2C11CC
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  1 Oct 2025 10:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759316295; cv=none; b=du1rBTr8MF7MR0aEhKFmEHdRJbCbzGm/6pMrMcWdWrb5DPnjll7v6CnTk+cBDu/WCb3n5S87gz18cxu3G7pYeRcauq4rUFONe1rnsoHgC8ROdgrVXPKRnFRSp/HwSCmRBfyUfgZ2tWS9j2NEOGDZLeIAp8wEXGM5s7yBWDyoMDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759316295; c=relaxed/simple;
	bh=z6rkWVo3JrefYWEz1jL5OoTUYDYc1KL9+Xqzjw+UVcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=s/7eErn7G0VD970cnsCYuU+tHPy+vEFx1ffsl8fJu+6g6jW+vRfJ2j5WUmURgWz2VkUU6lpecJd5j8K0GaiQP5ng4zajIBKCrI3RBjmDxjIJ9nIAP90FtyMuEjHzRC/4V/u2YE4/uBlNjhUWYkQjeK9HzKb1StIA3OWsq+3FLAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=an6lJtOE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="an6lJtOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759316293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dh5rJvbppA0tDith4Ih0Q1hNwIcSsa5fTKm9xJonerE=;
	b=an6lJtOE/itnZDMf2doIIOdTNRp2yhVl275RoRIvvW1H4JaAn8ViRijE3/i93XiBs8s48f
	e1bhHTOa17S/TvCkx7DkViEkUUMto9WS1C12RwEBB1drLChOMc2yfvpj7FjPl4HOh/S8+6
	see9RQWl/17/SwUwdQurHzrMezdhyOw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-338-a6R8VL-NMZ-gmn1hAzymfg-1; Wed,
 01 Oct 2025 06:58:11 -0400
X-MC-Unique: a6R8VL-NMZ-gmn1hAzymfg-1
X-Mimecast-MFC-AGG-ID: a6R8VL-NMZ-gmn1hAzymfg_1759316291
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CCCC61977533;
	Wed,  1 Oct 2025 10:58:10 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.64.123])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6B398195608E;
	Wed,  1 Oct 2025 10:58:10 +0000 (UTC)
Received: by aion.redhat.com (Postfix, from userid 1000)
	id DFB8047FF3A; Wed, 01 Oct 2025 06:58:08 -0400 (EDT)
Date: Wed, 1 Oct 2025 06:58:08 -0400
From: Scott Mayhew <smayhew@redhat.com>
To: Alistair <alistair@alistair23.me>
Cc: Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev
Subject: Re: [PATCH v2 2/4] tlshd: Fix priority string to allow PQC
Message-ID: <aN0JQCyV-M5ljTf8@aion>
References: <20250911212815.1414784-1-smayhew@redhat.com>
 <20250911212815.1414784-3-smayhew@redhat.com>
 <0c65e986-77d1-44b4-a4cb-c1a9c2213ba3@app.fastmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <0c65e986-77d1-44b4-a4cb-c1a9c2213ba3@app.fastmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KU7oJEDyRHRWjZvzEtQ8Rmg-4iDktWFZUfNXrLWZXHU_1759316291
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 01 Oct 2025, Alistair wrote:

> On Fri, 12 Sep 2025, at 7:28 AM, Scott Mayhew wrote:
> > Specifying either of the SECURE256 or SECURE128 keywords in the priority
> > string results in the ML-DSA algorithms being disabled because the
> > post-quantum algorithms do not map nicely to the security
> > classifications based on "bits of security" used for traditional
> > algorithms [1].
> > 
> > Use @SYSTEM instead, which will allow PQC on systems with newer versions
> > of GnuTLS.  It will also allow users to disable PQC via a policy module
> > (on systems with the crypto-policies package).
> > 
> > [1] https://csrc.nist.gov/CSRC/media/Projects/Post-Quantum-Cryptography/documents/call-for-proposals-final-dec-2016.pdf#page=15
> > 
> > Link: https://github.com/oracle/ktls-utils/issues/113
> > Signed-off-by: Scott Mayhew <smayhew@redhat.com>
> > ---
> > src/tlshd/ktls.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/src/tlshd/ktls.c b/src/tlshd/ktls.c
> > index 883256a..50381bf 100644
> > --- a/src/tlshd/ktls.c
> > +++ b/src/tlshd/ktls.c
> > @@ -357,7 +357,7 @@ static int tlshd_gnutls_priority_init_list(const unsigned int *ciphers,
> > const char *errpos;
> > int ret, i;
> >  
> > - pstring = strdup("SECURE256:+SECURE128:-COMP-ALL");
> > + pstring = strdup("@SYSTEM:-COMP-ALL");
> 
> This change is breaking traditional handshakes for me as _gnutls_resolve_priorities() fails to resolve a priority.
> 
> I'm not sure if it's a system config issue though, is anyone else seeing this?

What output do you get when you run these commands?

gnutls-cli --priority @SYSTEM -l
gnutls-cli --list-config

-Scott
> 
> Alistair
> 
> > if (!pstring)
> > return -ENOMEM;
> >  
> > -- 
> > 2.50.1
> > 
> > 
> > 
> 


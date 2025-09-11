Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F12226D1D
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 11 Sep 2025 21:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757626102; cv=none; b=iOiU8biLlHJev2zbOEINRFVpURP9AbHNI/g53t5lOzyd8DcUyOQurqnEXGJtkR+J75EYcAB6OEyKQ7QdtZl26hAd9MWBQjK03j3w5JM2SogjHzLebSC6+jCr7laPjbAWn7dhuf2Gau99fhTkLBcC/KqwPD5nzvIodeZzs9av2bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757626102; c=relaxed/simple;
	bh=irNpFlMqmMQ3+Ot8SOeMYBTQ1AFlppQk2eGRZ4aGzto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=pRqgk9YAycT2/75S0mYHl+dnECwJZhnnc032dxl+wS3I3oL+TOacmOL56uw2XEE3lwtAwl2+z5Ux7/5GJSC4THzeiz39ZIV+5HlXEjyaqehHhs4P5wt2UFihrUACYWrVIynG9TmXw8gon4SXDKpwPy8+E4CfBE02bKDk8Px6d9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=euFhqFFI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="euFhqFFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757626099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ESL7CxviWeacwLeHomrRxfxnM81dJNAKg3UlSZ6nd3E=;
	b=euFhqFFIOVDixY6Fsc2wCVlTrXbnu9fnku/LsVQbtNYZdkOW8MrOPZZYPu+gU+RxaxAQIg
	yncMNyEEU+LzkUSU1awW0mwKwEFUSANDibw4NoTcEA7ZUrUqxp8OM5+Bsw+3MsVqm+Jkzj
	fEJoAbgBBhEL0ck45IQ9CZEwIwQ6X5U=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-xGVL-tLlOyKmkkzdvNSRHw-1; Thu,
 11 Sep 2025 17:28:18 -0400
X-MC-Unique: xGVL-tLlOyKmkkzdvNSRHw-1
X-Mimecast-MFC-AGG-ID: xGVL-tLlOyKmkkzdvNSRHw_1757626097
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D42C1955E88;
	Thu, 11 Sep 2025 21:28:17 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.88.97])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 22E531944CEB;
	Thu, 11 Sep 2025 21:28:16 +0000 (UTC)
Received: from aion.redhat.com (localhost [IPv6:::1])
	by aion.redhat.com (Postfix) with ESMTP id 1B54B4301FF;
	Thu, 11 Sep 2025 17:28:15 -0400 (EDT)
From: Scott Mayhew <smayhew@redhat.com>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [PATCH v2 0/4] tlshd: Allow the use of post-quantum cryptography
Date: Thu, 11 Sep 2025 17:28:11 -0400
Message-ID: <20250911212815.1414784-1-smayhew@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7oYHeP7E6JY1kGfMoskPwTOv6UPMXwZIBJxf5xAjlsw_1757626097
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

These patches allow tlshd to use post-quantum cryptography.  The first
patch does a bit of refactoring to reduce some code duplication.  The 
second fixes the priority string and allows the PQ algorithms to be
used.  The other two implement dual certificate support.  Dual
certificates are necessary to enable a smooth transition period,
allowing servers to work with both clients that are PQ-enabled and
clients that are not.  The server will prefer the ML-DSA certificate but
will fall back to the traditional certificate for clients that do not
support ML-DSA.

Changes since v1:
- Refactoring to allow the client and server code to use the same
  tlshd_config_get_* functions
- Removed a lot of "#ifdef HAVE_GNUTLS_MLDSA" statements (I'm pretty
  sure the handful that are left are necessary)
- Store both the PQ and RSA certs in the same array.  The PQ certs (if
  present) will be first, followed by the RSA certs.  Note that I didn't
  increase TLSHD_MAX_CERTS though.

For those who prefer a web UI, these patches are also available in this
branch:
https://github.com/scottmayhew/ktls-utils/tree/pqc

To use these patches, you need a recent version of gnutls as well as
crypto-policies (if used by your distro).  These commands will help you
determine if your gnutls has the necessary stuff:

$ gnutls-cli -l | grep ML-DSA
$ gnutls-cli -l | grep MLKEM

You'll need to generate a cert using ML-DSA-44/ML-DSA-65/ML-DSA-87.  For
example, here's how I generate a self-signed cert using ML-DSA-65:

$ openssl req -new -x509 -newkey mldsa65 -days 365 \
	-keyout /etc/pki/tls/private/rhel10.smayhew.test.mldsa65.key \
	-out /etc/pki/tls/certs/rhel10.smayhew.test.mldsa65.pem \
	-subj "/CN=rhel10.smayhew.test" \
	-addext "subjectAltName=DNS:rhel10.smayhew.test,IP:192.168.124.69" \
	-noenc -quiet

Obviously if you're using openssl to generate your certs, you'll need a
recent openssl too.  Or you can use certtool if you prefer the gnutls
utilities.

You'll need to add the cert and key to the relevant sections of
tlshd.conf and you should be good to go.

If you have debug logging turned on, you should see this if you perform a
handshake with a PQ-enabled peer you should see something like this:

Aug 28 17:58:25 rhel10.smayhew.test tlshd[3291]: Session description: (TLS1.3)-(HYBRID-X25519-MLKEM768)-(ML-DSA-65)-(AES-256-GCM)

and if you perform a handshake with a non-PQ-enabled peer:

Aug 28 18:04:21 rhel10.smayhew.test tlshd[3352]: Session description: (TLS1.3)-(ECDHE-X25519)-(RSA-PSS-RSAE-SHA256)-(AES-256-GCM)

-Scott

Scott Mayhew (4):
  tlshd: deduplicate client and server config functions
  tlshd: Fix priority string to allow PQC
  tlshd: Server-side dual certificate support
  tlshd: Client-side dual certificate support

 configure.ac             |  12 ++
 src/tlshd/client.c       |  48 +++++--
 src/tlshd/config.c       | 281 +++++++++++++++++++--------------------
 src/tlshd/ktls.c         |   2 +-
 src/tlshd/server.c       |  74 ++++++++++-
 src/tlshd/tlshd.conf     |   4 +
 src/tlshd/tlshd.conf.man |  15 +++
 src/tlshd/tlshd.h        |  23 ++--
 8 files changed, 286 insertions(+), 173 deletions(-)

-- 
2.50.1


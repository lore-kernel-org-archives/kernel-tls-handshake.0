Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0242641F9
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 28 Aug 2025 22:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756419835; cv=none; b=H9jxbfv8CqC34DUJs71oNVL/JA66jVeXt+ebz5WsCkAkLbZfgJp7EBSkHCZIk10bTmLLZDhG3jfTSbZzkRgCwKgBh/iLVZSvaIoVR9oYzZj3C8MFJphlDfhs8lz1VPoM/76nRCRnCWk+Ux3iM6ACl8zBFkR95xFp23hWwdGIqR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756419835; c=relaxed/simple;
	bh=n9Rr/a5XLEf+0oaQD/z4MQ87Ya3ypnIDtCUrLERoA/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=hlOynJfr5CA0KRAVAThpDb3OKqO14W/rtICYkQ/GnzIdyVFV4QQs8EfLVRKJO/V9jY3Ajc2L6y7aPr0E8oeW9LlNdhDmSm4GtIdrlUHa1T6WGSWooyGTXV/Oc95EWA+YqWxW6tPojvJqRTFkalmcghRNsoxrCBfLiLW0y19fpBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E66qMVJm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E66qMVJm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756419832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AZ/ZH7bf9K9bfIHyga4B5zz49sXbeNt+KYfJYIuRya8=;
	b=E66qMVJmH1JRVjEj8AdPsJuOaKystNeVsdA1bhAnKtsIoWjqpRzXE5Cx5vx/ZjwYMtfMIN
	5OGkwM14GO7UiupGzu/2e3tvFHzDqDSKPD10Mza99Lrwb0tS5LKsuY15sXM0DAvLme15+1
	wPuIO5xTkY428KQTCoe58q+2nRHaU4U=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-Z8jTbLcKNXqWNAjkYF8MHw-1; Thu,
 28 Aug 2025 18:23:51 -0400
X-MC-Unique: Z8jTbLcKNXqWNAjkYF8MHw-1
X-Mimecast-MFC-AGG-ID: Z8jTbLcKNXqWNAjkYF8MHw_1756419830
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3D67E195E90D;
	Thu, 28 Aug 2025 22:23:50 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.88.80])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 118C91956095;
	Thu, 28 Aug 2025 22:23:50 +0000 (UTC)
Received: from aion.redhat.com (localhost [IPv6:::1])
	by aion.redhat.com (Postfix) with ESMTP id 77CFB41A7B3;
	Thu, 28 Aug 2025 18:23:48 -0400 (EDT)
From: Scott Mayhew <smayhew@redhat.com>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [PATCH 0/5] tlshd: Allow the use of post-quantum cryptography
Date: Thu, 28 Aug 2025 18:23:43 -0400
Message-ID: <20250828222348.601924-1-smayhew@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qIQmZjkVI0KQOU1dBmvCHJxIb56VmacfZXb5envfedw_1756419830
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

These patches allow tlshd to use post-quantum cryptography.  The first
patch fixes the priority string and allows the PQ algorithms to be used.
The remaining patches implement dual certificate support.  Dual
certificates are necessary to enable a smooth transition period,
allowing servers to work with both clients that are PQ-enabled and
clients that are not.  The server will prefer the ML-DSA certificate but
will fall back to the traditional certificate for clients that do not
support ML-DSA.

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


Scott Mayhew (5):
  tlshd: Fix priority string to allow PQC
  tlshd: Server-side dual certificate support
  tlshd: Make sure x509.pq.certificate is using a PQ public-key alg
  tlshd: Make sure the client supports the PQ pk alg used by the server
    cert
  tlshd: Client-side dual certificate support

 configure.ac             | 12 +++++
 src/tlshd/client.c       | 66 +++++++++++++++++++++++++--
 src/tlshd/config.c       | 97 +++++++++++++++++++++++++++++++++++-----
 src/tlshd/ktls.c         |  2 +-
 src/tlshd/server.c       | 86 +++++++++++++++++++++++++++++++++--
 src/tlshd/tlshd.conf     |  4 ++
 src/tlshd/tlshd.conf.man | 15 +++++++
 src/tlshd/tlshd.h        | 18 +++++---
 8 files changed, 276 insertions(+), 24 deletions(-)

-- 
2.50.1


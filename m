Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0DF267B9B
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 28 Aug 2025 22:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756419835; cv=none; b=ukXXH8obJm0c1NIicxznTJns1tE5ZcMEkeHR0om+LqkgjBQT4W0oGI/ACP//x4tsZWixWwc1eJeUYB3kV/BgjdLdB2ExHmbARWHoClEfyR8e049/7bLy4BkO1jGPJCByZFdDEMzYubAEgOPMxEuoe2xAMDKMuKsXgGHqWr6Y5oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756419835; c=relaxed/simple;
	bh=cj8WDIJqIlxkr5ZDtQeWIpq9KXWarrlvSnXvA029/Hk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=JGcPz5XDHK1y6uArxVtw2NQwD6D9Hz7af20f11ELifY/Wl1OfiGHMTp0HvU0EF29lIS6OsTyu3alIU9maAeGgWSwZ+GvGcKYRIkCK8eAowdCcJyx9NBszoUFgm0upBsl/MM6hbmUxJW+CcUn9z3MInSALhSptuzMG5jJzo5RiMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XWfYP7DN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XWfYP7DN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756419832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/cuyVksGUumnt0anJr3Gbsd7N3ev/cK50bfamTDRyHg=;
	b=XWfYP7DNBu6MPyX6ezy563G9BFcSbjo30dNGtDxm72XYutwG0iezD2/UKnt39jU8CC6Eu+
	n0ztw5mnBi+sNg8JCzatryCL5lJrc0GLbIQ54Py//dU7CCTQKigD9KZhcJHXeGYU3IdP3o
	jNYgDq9UTniGB6JtCjbY5WbI583Rg10=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-A3DqWeSMOVS5tb2G8GAb4A-1; Thu,
 28 Aug 2025 18:23:51 -0400
X-MC-Unique: A3DqWeSMOVS5tb2G8GAb4A-1
X-Mimecast-MFC-AGG-ID: A3DqWeSMOVS5tb2G8GAb4A_1756419830
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 287C11800352;
	Thu, 28 Aug 2025 22:23:50 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.88.80])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F1B0519560B4;
	Thu, 28 Aug 2025 22:23:49 +0000 (UTC)
Received: from aion.redhat.com (localhost [IPv6:::1])
	by aion.redhat.com (Postfix) with ESMTP id 8354241A7B4;
	Thu, 28 Aug 2025 18:23:48 -0400 (EDT)
From: Scott Mayhew <smayhew@redhat.com>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [PATCH 1/5] tlshd: Fix priority string to allow PQC
Date: Thu, 28 Aug 2025 18:23:44 -0400
Message-ID: <20250828222348.601924-2-smayhew@redhat.com>
In-Reply-To: <20250828222348.601924-1-smayhew@redhat.com>
References: <20250828222348.601924-1-smayhew@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8AzDS1SRZgyBh6uSgjNmZg7cMqUHm-JaGm69O6g5fuo_1756419830
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Specifying either of the SECURE256 or SECURE128 keywords in the priority
string results in the ML-DSA algorithms being disabled because the
post-quantum algorithms do not map nicely to the security
classifications based on "bits of security" used for traditional
algorithms [1].

Use @SYSTEM instead, which will allow PQC on systems with newer versions
of GnuTLS.  It will also allow users to disable PQC via a policy module
(on systems with the crypto-policies package).

[1] https://csrc.nist.gov/CSRC/media/Projects/Post-Quantum-Cryptography/documents/call-for-proposals-final-dec-2016.pdf#page=15

Link: https://github.com/oracle/ktls-utils/issues/113
Signed-off-by: Scott Mayhew <smayhew@redhat.com>
---
 src/tlshd/ktls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tlshd/ktls.c b/src/tlshd/ktls.c
index 40a26a4..866a023 100644
--- a/src/tlshd/ktls.c
+++ b/src/tlshd/ktls.c
@@ -357,7 +357,7 @@ static int tlshd_gnutls_priority_init_list(const unsigned int *ciphers,
 	const char *errpos;
 	int ret, i;
 
-	pstring = strdup("SECURE256:+SECURE128:-COMP-ALL");
+	pstring = strdup("@SYSTEM:-COMP-ALL");
 	if (!pstring)
 		return -ENOMEM;
 
-- 
2.50.1


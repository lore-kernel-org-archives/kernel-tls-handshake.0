Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D12226D1D
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 11 Sep 2025 21:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757626105; cv=none; b=r1GlKlt2HB27b4O6AfMnr3YC08Nfb/R1hi+bMq3uayXSmJDZnoyObUMeYS8O34CWd7Sv2Fvey637gBGRtRYDi8XNKmyJlFJiZPrFIdPSW6Z4nSQml6mathwjdjhEaF8gsO9F0cbR+ClKpAqrieuaRan18fXu3XG36gf9jjKhxcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757626105; c=relaxed/simple;
	bh=DFR+pTCSZLUDHW8zhDqoG2kVA8TTeZhO5NZNvSi2CnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=doD2zh2M8BdfWPA2n+UntO3jpKUgmw3ZIeyL8IxAThJPt76qKgQ91Z1bZj+lHm+MnCUv3evdwgz1WIAwKvCCbjAv9aMPeBb091kXHTpK1Pla3VCTAOtcEpRluC9kCeAaikKMYCSxoMOHy1v4QzrKRhJJXXVq1oA8QMM2izC7NnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eyKOZ9/N; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eyKOZ9/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757626102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MSZx6mJ6JeXEKp7J2Yk3mDYP+eM4iegrLY9I4WfHM8c=;
	b=eyKOZ9/NXGJqCbUmBs/1KPCIpTj4qW++1knceZgMtK63ZNNqwQgrmmCJ1uiXm+gdPBuHLH
	EqVI+SlDA+CNLQxVBvLsvzS1xUWYZ3vCxA0DrrT19bumJR1u+4WKYyyaiOB99VUtwNL5wG
	1v4pNzaalqcnlo9DkZSxX+ABHJ1V4Ws=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-345-xi0PguETNQODscL3kIkoqg-1; Thu,
 11 Sep 2025 17:28:18 -0400
X-MC-Unique: xi0PguETNQODscL3kIkoqg-1
X-Mimecast-MFC-AGG-ID: xi0PguETNQODscL3kIkoqg_1757626097
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 29B72180047F;
	Thu, 11 Sep 2025 21:28:17 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.88.97])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EFA8018003FC;
	Thu, 11 Sep 2025 21:28:16 +0000 (UTC)
Received: from aion.redhat.com (localhost [IPv6:::1])
	by aion.redhat.com (Postfix) with ESMTP id 32F0B430201;
	Thu, 11 Sep 2025 17:28:15 -0400 (EDT)
From: Scott Mayhew <smayhew@redhat.com>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [PATCH v2 2/4] tlshd: Fix priority string to allow PQC
Date: Thu, 11 Sep 2025 17:28:13 -0400
Message-ID: <20250911212815.1414784-3-smayhew@redhat.com>
In-Reply-To: <20250911212815.1414784-1-smayhew@redhat.com>
References: <20250911212815.1414784-1-smayhew@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kGQLcPbDhk1Vt9zglTD7tsnLeuOMbFp7-H9y_b5cN7U_1757626097
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
index 883256a..50381bf 100644
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


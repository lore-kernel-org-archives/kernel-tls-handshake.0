Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351A03594A
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  1 Oct 2025 23:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759361761; cv=none; b=ZUSjF0AFiHvmuJ587m0JPwlnFFLj+Xa1MYHU0vAoRbymextdbxbPyxk5UghUoOHbbhFsQLdLybSaLRBxh0g3atLa0C6pRoEhg097SRPIk3qQFdz6FfbDL+KgbRTXODQgdncbbcClfUBi7pN99aY8bpgVm1X4VPOIlmACjELVn3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759361761; c=relaxed/simple;
	bh=RHsOA242mB3W9u1Erfoqt4yILiVp9f+u4himC9a3+kU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=JbL4mGjqqcLAzO/F8SwtGaexkbGVD3cdKxRlAXOIkGNTKjZOErRtoGSU3qOwJEd9OXJ7a4fDe8ONsml0yVamtuFA0thnIvDBxRq33RWP3yJcvTs2e1msqtlkLaTmfrk8v59gpyn1ZQcGVOMl4hen8WdP/H8bIOtbfDPYKvryCFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dKUxRDmj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dKUxRDmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759361758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jq+PgLkdXkPl/QkfFHV+2F/bgVpi56UGeUAUTm1+go8=;
	b=dKUxRDmjvp5MQoza9I0TgOe4co82qS5r9cX891l7dsh4gSefiqsr7+QqssWJsIa/y6MRLA
	70KbssyZC0Pt5/wsO9Ij7sHpGuqvxSfHhdS/pLpIj/XWe0pSEWxwtiTCLzqSLIeQGHBgLa
	0pnGGJKXP2SffVTmcTCgrobEn5PvbzM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-182-NbX5GjelNXGgISYF69-DKQ-1; Wed,
 01 Oct 2025 19:35:52 -0400
X-MC-Unique: NbX5GjelNXGgISYF69-DKQ-1
X-Mimecast-MFC-AGG-ID: NbX5GjelNXGgISYF69-DKQ_1759361752
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A1B31180034D;
	Wed,  1 Oct 2025 23:35:51 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.64.123])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3DD03180035E;
	Wed,  1 Oct 2025 23:35:51 +0000 (UTC)
Received: from aion.redhat.com (localhost [IPv6:::1])
	by aion.redhat.com (Postfix) with ESMTP id 5E4D0483403;
	Wed, 01 Oct 2025 19:35:49 -0400 (EDT)
From: Scott Mayhew <smayhew@redhat.com>
To: alistair@alistair23.me
Cc: chuck.lever@oracle.com,
	kernel-tls-handshake@lists.linux.dev
Subject: [PATCH] tlshd: fix priority cache initialization
Date: Wed,  1 Oct 2025 19:35:49 -0400
Message-ID: <20251001233549.436746-1-smayhew@redhat.com>
In-Reply-To: <0c65e986-77d1-44b4-a4cb-c1a9c2213ba3@app.fastmail.com>
References: <0c65e986-77d1-44b4-a4cb-c1a9c2213ba3@app.fastmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ddkWJLmjyjA4sTwQh7BpZ8NMrRasphVZc20k5aL0NQE_1759361752
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Commit 9253f9d added the use of the @SYSTEM keyword as the initial
keyword in the priority string used by tlshd.  Unfortunately @SYSTEM
doesn't appear to work on systems that do not have a system-wide
library configuration set up.

Instead of trying to pick an initial keyword that will work on all
systems, let's instead use gnutls_priority_init2() with the
GNUTLS_PRIORITY_INIT_DEF_APPEND flag instead.  That will *append* our
priority string to the default options.

Fixes: 9253f9d ("tlshd: Fix priority string to allow PQC")
Signed-off-by: Scott Mayhew <smayhew@redhat.com>
---

Alistair, can you try this patch and see if it fixes your issue?

 src/tlshd/ktls.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/src/tlshd/ktls.c b/src/tlshd/ktls.c
index 50381bf..bc75313 100644
--- a/src/tlshd/ktls.c
+++ b/src/tlshd/ktls.c
@@ -357,7 +357,7 @@ static int tlshd_gnutls_priority_init_list(const unsigned int *ciphers,
 	const char *errpos;
 	int ret, i;
 
-	pstring = strdup("@SYSTEM:-COMP-ALL");
+	pstring = strdup("-COMP-ALL");
 	if (!pstring)
 		return -ENOMEM;
 
@@ -425,7 +425,8 @@ static int tlshd_gnutls_priority_init_list(const unsigned int *ciphers,
 	}
 
 	tlshd_log_debug("x.509 priority string: %s\n", pstring);
-	ret = gnutls_priority_init(&tlshd_gnutls_priority_x509, pstring, &errpos);
+	ret = gnutls_priority_init2(&tlshd_gnutls_priority_x509, pstring, &errpos,
+				    GNUTLS_PRIORITY_INIT_DEF_APPEND);
 	if (ret != GNUTLS_E_SUCCESS) {
 		free(pstring_sha256);
 		free(pstring_sha384);
@@ -442,7 +443,8 @@ static int tlshd_gnutls_priority_init_list(const unsigned int *ciphers,
 	}
 
 	tlshd_log_debug("PSK priority string: %s\n", pstring);
-	ret = gnutls_priority_init(&tlshd_gnutls_priority_psk, pstring, &errpos);
+	ret = gnutls_priority_init2(&tlshd_gnutls_priority_psk, pstring, &errpos,
+				    GNUTLS_PRIORITY_INIT_DEF_APPEND);
 	if (ret != GNUTLS_E_SUCCESS) {
 		free(pstring_sha256);
 		free(pstring_sha384);
@@ -461,8 +463,9 @@ static int tlshd_gnutls_priority_init_list(const unsigned int *ciphers,
 	}
 
 	tlshd_log_debug("PSK SHA256 priority string: %s\n", pstring);
-	ret = gnutls_priority_init(&tlshd_gnutls_priority_psk_sha256,
-				   pstring, &errpos);
+	ret = gnutls_priority_init2(&tlshd_gnutls_priority_psk_sha256,
+				   pstring, &errpos,
+				   GNUTLS_PRIORITY_INIT_DEF_APPEND);
 	if (ret != GNUTLS_E_SUCCESS) {
 		free(pstring);
 		free(pstring_sha384);
@@ -482,8 +485,9 @@ static int tlshd_gnutls_priority_init_list(const unsigned int *ciphers,
 	}
 
 	tlshd_log_debug("PSK SHA384 priority string: %s\n", pstring);
-	ret = gnutls_priority_init(&tlshd_gnutls_priority_psk_sha384,
-				   pstring, &errpos);
+	ret = gnutls_priority_init2(&tlshd_gnutls_priority_psk_sha384,
+				   pstring, &errpos,
+				   GNUTLS_PRIORITY_INIT_DEF_APPEND);
 	if (ret != GNUTLS_E_SUCCESS) {
 		free(pstring);
 		gnutls_priority_deinit(tlshd_gnutls_priority_psk_sha256);
-- 
2.51.0


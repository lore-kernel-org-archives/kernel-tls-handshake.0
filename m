Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD00306D2A
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  9 Dec 2025 19:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765308627; cv=none; b=DqiMU4R0T0KOequNwBGZVLEtFOYSXHYb7srQ8IAt8Jyjp3A29U+em1gvMqGBYFEmtlRp68Bbv4pIjOaenfR2uE9aVXjIU8f8fahVL2ig8B5OD/tSW6d50MVHcfGPxVuRQJ6MSOazpicasaGL+dZUiCY/yJO7Qpa8L2jdX+NHOIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765308627; c=relaxed/simple;
	bh=7Wb9drLCp5rlsg3gVoLUsSjWlF01VVLONyUMWshXHkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uOgHPD8Ijyhk2UrEgCgd4qvUVeLJ9P5Z4ak5JONtbMKhtx4RSwWJDl511cYDvNaToHfh6kKrh7g7HGTMyNDLEDNyCky8OfUbw9Znm4M7SbaKClIHcJhks0T9fSLsqaSTVvsWJkC6Z/VGMDIfnxYvoaf/o3XCX3Pmd8BJnAVEGpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cx/OWuk8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cx/OWuk8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765308623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5NxTS4LxE4qH94Xw5LGwiw1iH2nY+WessKDIWX82CLk=;
	b=Cx/OWuk8NRZsn/7oT74SQskAs6aXFJpwP0lUJIu9l8T1cyMfEtf9ZV8sTiRmhEKZko8+0q
	EnQ3sM5gviQVEd+JWipahNKhdVEO+nj0nKmpLIChzw0erSFtoyk//hOLamNYmfsi8mynkh
	oJgHRnXR3CAQAh7u5EqtGMq1ohhxUPk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-439--vlABgrBN1GuFxII7y4-cQ-1; Tue,
 09 Dec 2025 14:30:19 -0500
X-MC-Unique: -vlABgrBN1GuFxII7y4-cQ-1
X-Mimecast-MFC-AGG-ID: -vlABgrBN1GuFxII7y4-cQ_1765308617
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8DC25195606F;
	Tue,  9 Dec 2025 19:30:17 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.80.38])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3D3741956095;
	Tue,  9 Dec 2025 19:30:17 +0000 (UTC)
Received: from aion.redhat.com (localhost [IPv6:::1])
	by aion.redhat.com (Postfix) with ESMTP id 84F0A54CA77;
	Tue, 09 Dec 2025 14:30:15 -0500 (EST)
From: Scott Mayhew <smayhew@redhat.com>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org
Subject: [PATCH] net/handshake: duplicate handshake cancellations leak socket
Date: Tue,  9 Dec 2025 14:30:15 -0500
Message-ID: <20251209193015.3032058-1-smayhew@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

When a handshake request is cancelled it is removed from the
handshake_net->hn_requests list, but it is still present in the
handshake_rhashtbl until it is destroyed.

If a second cancellation request arrives for the same handshake request,
then remove_pending() will return false... and assuming
HANDSHAKE_F_REQ_COMPLETED isn't set in req->hr_flags, we'll continue
processing through the out_true label, where we put another reference on
the sock and a refcount underflow occurs.

This can happen for example if a handshake times out - particularly if
the SUNRPC client sends the AUTH_TLS probe to the server but doesn't
follow it up with the ClientHello due to a problem with tlshd.  When the
timeout is hit on the server, the server will send a FIN, which triggers
a cancellation request via xs_reset_transport().  When the timeout is
hit on the client, another cancellation request happens via
xs_tls_handshake_sync().

Add a test_and_set_bit(HANDSHAKE_F_REQ_COMPLETED) in the pending cancel
path so duplicate cancels can be detected.

Fixes: 3b3009ea8abb ("net/handshake: Create a NETLINK service for handling handshake requests")
Suggested-by: Chuck Lever <chuck.lever@oracle.com>
Signed-off-by: Scott Mayhew <smayhew@redhat.com>
---
 net/handshake/request.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/handshake/request.c b/net/handshake/request.c
index 274d2c89b6b2..f78091680bca 100644
--- a/net/handshake/request.c
+++ b/net/handshake/request.c
@@ -324,7 +324,11 @@ bool handshake_req_cancel(struct sock *sk)
 
 	hn = handshake_pernet(net);
 	if (hn && remove_pending(hn, req)) {
-		/* Request hadn't been accepted */
+		/* Request hadn't been accepted - mark cancelled */
+		if (test_and_set_bit(HANDSHAKE_F_REQ_COMPLETED, &req->hr_flags)) {
+			trace_handshake_cancel_busy(net, req, sk);
+			return false;
+		}
 		goto out_true;
 	}
 	if (test_and_set_bit(HANDSHAKE_F_REQ_COMPLETED, &req->hr_flags)) {
-- 
2.51.0


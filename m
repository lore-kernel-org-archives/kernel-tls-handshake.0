Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4542F0C78
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 22 Sep 2025 22:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758578833; cv=none; b=PAL03YatHQXoInMixag6xgJiOnwlT4k24jzPj45aUffik+ETrB5ajXGax+sLUBOQnDJ8MaZxo0FTQaprU3P8t6T5K9qOUJeMI8dl8FqdCRcNrwRySQHick08se6DmTZIbYNTrJ6L7gNxKUTD8PnlZt+RWOPsVQfn/LRI2pbZyLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758578833; c=relaxed/simple;
	bh=m4JRNwt+9JziUCONy+hzcpk2qYCky0ppV+E5FTQ90XY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MwAsuWb5vz3k73A2JZZlW+Sb6OELtcpOpBWam8+XMekEbX6X3jD/GP1eOBQBwTL9UgheS6cATCaLIxvA5DkkN9VT6YSSzaDIGjkLGUfzT/6L7S7YXxp2944z/NagAIQUKCDD0Orv/Ay9QY7bs6Roh1wJpAUnHONDA2J2sfEuuK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTji3Fe1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTji3Fe1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4232C4CEF0;
	Mon, 22 Sep 2025 22:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758578832;
	bh=m4JRNwt+9JziUCONy+hzcpk2qYCky0ppV+E5FTQ90XY=;
	h=From:To:Cc:Subject:Date:From;
	b=NTji3Fe19qb1qdGBwA23iDQK/McsencIkpJPva5uEHmmfIkl6Zgk4oSwCvnDbiU6q
	 UNkMnNa7V5xcQfQkSyWEpDCApWTHSFMAg29AKQzmHdGowxsoc8ADabFfddSceanV+O
	 gp8yB1lbxCE+PI3XtaZKV//oF7wflUw3MpLaBSJXC6E9QZQQnYkWfHujlVwnnL4OaM
	 HXYUVJo7CMvmtv7c8jLskK/8hgTZzHMj1cSLiAuFAd3brnpaub7ZyB8WhvH+rO+6bd
	 ko++8WUkVCWSLdiODNh9dMDk5waIXdTo1+V4VxwPRD8sfDt8RF/OTCkx/8fkWXxNRK
	 hmeKT6ZWMIT+A==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Chuck Lever <chuck.lever@oracle.com>,
	Xin Long <lucien.xin@gmail.com>
Subject: [PATCH] tlshd: Return errnos from QUIC helper functions
Date: Mon, 22 Sep 2025 18:07:10 -0400
Message-ID: <20250922220710.1255102-1-cel@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuck Lever <chuck.lever@oracle.com>

Static analysis tools have noticed that
tlshd_quic_serverhello_handshake() expects its helper functions to
return errno values, but two of them return GNUTLS_E_* values in
most cases. Convert those functions to always return errno values
or zero (on success).

Cc: Xin Long <lucien.xin@gmail.com>
Fixes: 43a15fed2f33 ("tlshd: add support for quic handshake")
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/server.c | 54 +++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index 6531f0819d2b..8c8295caedf1 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -575,45 +575,47 @@ static int tlshd_quic_server_set_x509_session(struct tlshd_quic_conn *conn)
 		return ret;
 	}
 
-	ret = gnutls_certificate_allocate_credentials(&cred);
-	if (ret)
+	ret = -ENOMEM;
+	if (gnutls_certificate_allocate_credentials(&cred) != GNUTLS_E_SUCCESS)
 		goto err;
-	ret = tlshd_server_get_truststore(cred);
-	if (ret)
+	ret = -EINVAL;
+	if (tlshd_server_get_truststore(cred) != GNUTLS_E_SUCCESS)
 		goto err;
 
 	gnutls_certificate_set_retrieve_function2(cred, tlshd_x509_retrieve_key_cb);
 
 	gnutls_certificate_set_verify_function(cred, tlshd_quic_server_x509_verify_function);
 
-	ret = gnutls_init(&session, GNUTLS_SERVER | GNUTLS_NO_AUTO_SEND_TICKET |
-				    GNUTLS_ENABLE_EARLY_DATA | GNUTLS_NO_END_OF_EARLY_DATA);
-	if (ret)
+	ret = -ENOMEM;
+	if (gnutls_init(&session, GNUTLS_SERVER | GNUTLS_NO_AUTO_SEND_TICKET |
+			GNUTLS_ENABLE_EARLY_DATA |
+			GNUTLS_NO_END_OF_EARLY_DATA) != GNUTLS_E_SUCCESS)
 		goto err_cred;
 
 	if (!tlshd_quic_server_anti_replay) {
-		ret = gnutls_anti_replay_init(&tlshd_quic_server_anti_replay);
-		if (ret)
+		if (gnutls_anti_replay_init(&tlshd_quic_server_anti_replay) != GNUTLS_E_SUCCESS)
 			goto err_session;
 		gnutls_anti_replay_set_add_function(tlshd_quic_server_anti_replay,
 						    tlshd_quic_server_anti_replay_db_add_func);
 		gnutls_anti_replay_set_ptr(tlshd_quic_server_anti_replay, NULL);
 	}
 	gnutls_anti_replay_enable(session, tlshd_quic_server_anti_replay);
-	ret = gnutls_record_set_max_early_data_size(session, 0xffffffffu);
-	if (ret)
+	ret = -EINVAL;
+	if (gnutls_record_set_max_early_data_size(session,
+						  0xffffffffu) != GNUTLS_E_SUCCESS)
 		goto err_session;
 
 	gnutls_session_set_ptr(session, conn);
 	ticket_key.data = conn->ticket;
 	ticket_key.size = conn->ticket_len;
-	ret = gnutls_session_ticket_enable_server(session, &ticket_key);
-	if (ret)
+	if (gnutls_session_ticket_enable_server(session,
+						&ticket_key) != GNUTLS_E_SUCCESS)
 		goto err_session;
 	gnutls_handshake_set_hook_function(session, GNUTLS_HANDSHAKE_CLIENT_HELLO,
 					   GNUTLS_HOOK_POST, tlshd_quic_server_alpn_verify);
-	ret = gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, cred);
-	if (ret)
+	ret = -ENOMEM;
+	if (gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE,
+				   cred) != GNUTLS_E_SUCCESS)
 		goto err_session;
 	gnutls_certificate_server_set_request(session, conn->cert_req);
 
@@ -635,21 +637,29 @@ static int tlshd_quic_server_set_psk_session(struct tlshd_quic_conn *conn)
 {
 	gnutls_psk_server_credentials_t cred;
 	gnutls_session_t session;
-	int ret;
+	int ret, err;
 
-	ret = gnutls_psk_allocate_server_credentials(&cred);
-	if (ret)
+	switch (gnutls_psk_allocate_server_credentials(&cred)) {
+	case GNUTLS_E_SUCCESS:
+		break;
+	case GNUTLS_E_MEMORY_ERROR:
+		ret = -ENOMEM;
 		goto err;
+	case GNUTLS_E_INVALID_REQUEST:
+		ret = -EINVAL;
+		goto err;
+	}
 	gnutls_psk_set_server_credentials_function(cred, tlshd_quic_server_psk_cb);
 
-	ret = gnutls_init(&session, GNUTLS_SERVER | GNUTLS_NO_AUTO_SEND_TICKET);
-	if (ret)
+	ret = -ENOMEM;
+	if (gnutls_init(&session, GNUTLS_SERVER |
+			GNUTLS_NO_AUTO_SEND_TICKET) != GNUTLS_E_SUCCESS)
 		goto err_cred;
 	gnutls_session_set_ptr(session, conn);
 	gnutls_handshake_set_hook_function(session, GNUTLS_HANDSHAKE_CLIENT_HELLO,
 					   GNUTLS_HOOK_POST, tlshd_quic_server_alpn_verify);
-	ret = gnutls_credentials_set(session, GNUTLS_CRD_PSK, cred);
-	if (ret)
+	if (gnutls_credentials_set(session, GNUTLS_CRD_PSK,
+				   cred) != GNUTLS_E_SUCCESS)
 		goto err_session;
 
 	conn->is_serv = 1;
-- 
2.51.0


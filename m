Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779DA186294
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 26 Sep 2025 01:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849731; cv=none; b=mGLTXw8BePSsarHoIug5HFV0psrCP5iwmQ0FANl15/2EhNZlAGT1R3Qdl6SrJiG4+fqsBR7fH4/eOe0AsY36o8ohufZovXm4/NaZ6jjV6q6geyiqLPb4ULOaN70nZAslh8qiThnJSj86Rk+zK9P5Qp+2tZHRJiAstfq+eitf5ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849731; c=relaxed/simple;
	bh=pn0h2F7L0J/kGetlUZxfoM7uHsWzuSjuo5Dl6/tahts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSTlJwdgnYIMMew03PuRrxwAc24+fOEU7TVCqjDYO5gzZsr8AvlvTkapEcvtZulqaj380fpEAq6mo6/FMZ8jKi24I42O2hSe6emsvwgQHyqHUgUkyO3GnDTmG2TOKF8G/ECBD9IDrfJeZlq7nihuYcog9cvqJRXmDtbEiGLiA70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rPi9M8nH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPi9M8nH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5692C113CF;
	Fri, 26 Sep 2025 01:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758849731;
	bh=pn0h2F7L0J/kGetlUZxfoM7uHsWzuSjuo5Dl6/tahts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rPi9M8nHI5jfEbykdsvk7Aq0FmcSLn0gofwBtY3THnvoXV5EbLTKVz+6vWx9o9D7i
	 5NN16JOZbIkov4LdWvTLqcbt9SThjV6QkjJ7gF1F5rHPkyymCc9u6ITN7pT2qA3lKe
	 CvJDHiUolj5seE6CCExh1qfzeMc94B9DVsu8nQaOKWUHq1323m6/bm5kiYWwXmJTAs
	 OmzOsWoBFv6sk73mpGGK87hxvxhU7r5U3Y3K0uUnjMgr/wfUPZ9bnjmQi7heODuhW+
	 2E33KCHp6A6BBP6IxchHu+MambeF4a+etwQTELffPePPkHlmgn42q0eDl7MSNBB4Jy
	 47IYhsMmUuPOQ==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Xin Long <lucien.xin@gmail.com>
Subject: [PATCH v1 02/16] tlshd: leave session_status as EIO on GnuTLS failure in QUIC session setup
Date: Thu, 25 Sep 2025 21:21:51 -0400
Message-ID: <20250926012207.3642990-3-cel@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926012207.3642990-1-cel@kernel.org>
References: <20250926012207.3642990-1-cel@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xin Long <lucien.xin@gmail.com>

Align the QUIC session setup error handling with the TLS 1.3 code paths:

- tlshd_tls13_client_x509_handshake()
- tlshd_tls13_client_psk_handshake()
- tlshd_tls13_server_x509_handshake()
- tlshd_tls13_server_psk_handshake()

The QUIC session setup functions:

- tlshd_quic_client_set_x509_session()
- tlshd_quic_client_set_psk_session()
- tlshd_quic_server_set_x509_session()
- tlshd_quic_server_set_psk_session()

will no longer return an error directly. Instead, if a GnuTLS API call
fails, session_status is left as EIO after logging the Gnutls errors.

Signed-off-by: Xin Long <lucien.xin@gmail.com>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/client.c | 42 ++++++++++++++++++++----------------------
 src/tlshd/server.c | 29 +++++++++++++----------------
 2 files changed, 33 insertions(+), 38 deletions(-)

diff --git a/src/tlshd/client.c b/src/tlshd/client.c
index ad9a7931a6cd..3415fddfa0c4 100644
--- a/src/tlshd/client.c
+++ b/src/tlshd/client.c
@@ -530,17 +530,17 @@ static int tlshd_quic_client_x509_verify_function(gnutls_session_t session)
 
 #define TLSHD_QUIC_NO_CERT_AUTH	3
 
-static int tlshd_quic_client_set_x509_session(struct tlshd_quic_conn *conn)
+static void tlshd_quic_client_set_x509_session(struct tlshd_quic_conn *conn)
 {
 	struct tlshd_handshake_parms *parms = conn->parms;
 	gnutls_certificate_credentials_t cred;
 	gnutls_session_t session;
-	int ret = -EINVAL;
+	int ret;
 
 	if (conn->cert_req != TLSHD_QUIC_NO_CERT_AUTH) {
 		if (!tlshd_x509_client_get_certs(parms) || !tlshd_x509_client_get_privkey(parms)) {
-			tlshd_log_error("cert/privkey get error %d", -ret);
-			return ret;
+			tlshd_log_error("Failed to get cert or privkey");
+			return;
 		}
 	}
 	ret = gnutls_certificate_allocate_credentials(&cred);
@@ -581,7 +581,8 @@ static int tlshd_quic_client_set_x509_session(struct tlshd_quic_conn *conn)
 			goto err_session;
 	}
 	conn->session = session;
-	return 0;
+	return;
+
 err_session:
 	gnutls_deinit(session);
 err_cred:
@@ -590,29 +591,28 @@ err:
 	tlshd_x509_client_put_privkey();
 	tlshd_x509_client_put_certs();
 	tlshd_log_gnutls_error(ret);
-	return ret;
 }
 
-static int tlshd_quic_client_set_anon_session(struct tlshd_quic_conn *conn)
+static void tlshd_quic_client_set_anon_session(struct tlshd_quic_conn *conn)
 {
 	conn->cert_req = TLSHD_QUIC_NO_CERT_AUTH;
-	return tlshd_quic_client_set_x509_session(conn);
+	tlshd_quic_client_set_x509_session(conn);
 }
 
-static int tlshd_quic_client_set_psk_session(struct tlshd_quic_conn *conn)
+static void tlshd_quic_client_set_psk_session(struct tlshd_quic_conn *conn)
 {
 	key_serial_t peerid = g_array_index(conn->parms->peerids, key_serial_t, 0);
 	gnutls_psk_client_credentials_t cred;
 	gnutls_session_t session;
 	char *identity = NULL;
 	gnutls_datum_t key;
-	int ret = -EINVAL;
+	int ret;
 
 	if (!tlshd_keyring_get_psk_username(peerid, &identity) ||
 	    !tlshd_keyring_get_psk_key(peerid, &key)) {
 		free(identity);
-		tlshd_log_error("identity/key get error %d", -ret);
-		return ret;
+		tlshd_log_error("Failed to get key identity or read key");
+		return;
 	}
 
 	ret = gnutls_psk_allocate_client_credentials(&cred);
@@ -630,7 +630,8 @@ static int tlshd_quic_client_set_psk_session(struct tlshd_quic_conn *conn)
 	if (ret)
 		goto err_session;
 	conn->session = session;
-	return 0;
+	return;
+
 err_session:
 	gnutls_deinit(session);
 err_cred:
@@ -638,7 +639,6 @@ err_cred:
 err:
 	free(identity);
 	tlshd_log_gnutls_error(ret);
-	return ret;
 }
 
 /**
@@ -659,26 +659,24 @@ void tlshd_quic_clienthello_handshake(struct tlshd_handshake_parms *parms)
 
 	switch (parms->auth_mode) {
 	case HANDSHAKE_AUTH_UNAUTH:
-		ret = tlshd_quic_client_set_anon_session(conn);
+		tlshd_quic_client_set_anon_session(conn);
 		break;
 	case HANDSHAKE_AUTH_X509:
-		ret = tlshd_quic_client_set_x509_session(conn);
+		tlshd_quic_client_set_x509_session(conn);
 		break;
 	case HANDSHAKE_AUTH_PSK:
-		ret = tlshd_quic_client_set_psk_session(conn);
+		tlshd_quic_client_set_psk_session(conn);
 		break;
 	default:
-		ret = -EINVAL;
 		tlshd_log_debug("Unrecognized auth mode (%d)", parms->auth_mode);
 	}
-	if (ret) {
-		conn->errcode = -ret;
+
+	if (!conn->session)
 		goto out;
-	}
 
 	tlshd_quic_start_handshake(conn);
-out:
 	parms->session_status = conn->errcode;
+out:
 	tlshd_quic_conn_destroy(conn);
 }
 #else
diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index 6531f0819d2b..8bb769ff9f74 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -562,17 +562,17 @@ found:
 	return 0;
 }
 
-static int tlshd_quic_server_set_x509_session(struct tlshd_quic_conn *conn)
+static void tlshd_quic_server_set_x509_session(struct tlshd_quic_conn *conn)
 {
 	struct tlshd_handshake_parms *parms = conn->parms;
 	gnutls_certificate_credentials_t cred;
 	gnutls_datum_t ticket_key;
 	gnutls_session_t session;
-	int ret = -EINVAL;
+	int ret;
 
 	if (!tlshd_x509_server_get_certs(parms) || !tlshd_x509_server_get_privkey(parms)) {
-		tlshd_log_error("cert/privkey get error %d", -ret);
-		return ret;
+		tlshd_log_error("Failed to get cert or privkey");
+		return;
 	}
 
 	ret = gnutls_certificate_allocate_credentials(&cred);
@@ -619,7 +619,8 @@ static int tlshd_quic_server_set_x509_session(struct tlshd_quic_conn *conn)
 
 	conn->is_serv = 1;
 	conn->session = session;
-	return 0;
+	return;
+
 err_session:
 	gnutls_deinit(session);
 err_cred:
@@ -628,10 +629,9 @@ err:
 	tlshd_x509_server_put_privkey();
 	tlshd_x509_server_put_certs();
 	tlshd_log_gnutls_error(ret);
-	return ret;
 }
 
-static int tlshd_quic_server_set_psk_session(struct tlshd_quic_conn *conn)
+static void tlshd_quic_server_set_psk_session(struct tlshd_quic_conn *conn)
 {
 	gnutls_psk_server_credentials_t cred;
 	gnutls_session_t session;
@@ -654,14 +654,14 @@ static int tlshd_quic_server_set_psk_session(struct tlshd_quic_conn *conn)
 
 	conn->is_serv = 1;
 	conn->session = session;
-	return 0;
+	return;
+
 err_session:
 	gnutls_deinit(session);
 err_cred:
 	gnutls_psk_free_server_credentials(cred);
 err:
 	tlshd_log_gnutls_error(ret);
-	return ret;
 }
 
 /**
@@ -682,23 +682,20 @@ void tlshd_quic_serverhello_handshake(struct tlshd_handshake_parms *parms)
 
 	switch (parms->auth_mode) {
 	case HANDSHAKE_AUTH_X509:
-		ret = tlshd_quic_server_set_x509_session(conn);
+		tlshd_quic_server_set_x509_session(conn);
 		break;
 	case HANDSHAKE_AUTH_PSK:
-		ret = tlshd_quic_server_set_psk_session(conn);
+		tlshd_quic_server_set_psk_session(conn);
 		break;
 	default:
-		ret = -EINVAL;
 		tlshd_log_debug("Unrecognized auth mode (%d)", parms->auth_mode);
 	}
-	if (ret) {
-		conn->errcode = -ret;
+	if (!conn->session)
 		goto out;
-	}
 
 	tlshd_quic_start_handshake(conn);
-out:
 	parms->session_status = conn->errcode;
+out:
 	tlshd_quic_conn_destroy(conn);
 }
 #else
-- 
2.51.0


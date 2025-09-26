Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F865186294
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 26 Sep 2025 01:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849732; cv=none; b=Ky1qVlqzyz46/Ru7EBCEe8ar9u6Pg7i0yG0GMcSK1n1kfXe2vw546BtPlU4DEgwMazXEdbkjhmG/KJJFmU9QI9ZL2AaKSGU7Jk3CqxDP0trLxZoa7tN2AyCLBFZaUKYLEmlS36PwO5twDIt+nOkarJAROxlWZi7w6e6YtIdPxHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849732; c=relaxed/simple;
	bh=SOXzZrkyJawHC6hr/w4BSJBGiXmI3slY5qRi7F1skm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhRcSDH2/gMJLIE/9ThmjbU6noRuGLSHO88LAuEwix9n8Wn7XrQloNOtATwLw9XSff/zR6l9FFKQwcwRfYlml4PMX+8rF8J0vRnIwlAw8Hbguhlz7T/L6gYEbDjAHgeT7DrhUIRG2BhY90JQ17CCU8TIp7uKyWB0H6r5BgB7ImA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GO5rlJZA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GO5rlJZA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4985CC4CEF0;
	Fri, 26 Sep 2025 01:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758849731;
	bh=SOXzZrkyJawHC6hr/w4BSJBGiXmI3slY5qRi7F1skm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GO5rlJZAIkyi0SeMX56bbhsxgMkOZVz2nB35DZE7DjuINCBa2kwcZWPTF16/mXC7R
	 RLsLG9LAI3gx0CK/CoHtjXG/Ig/KWwHJlc4WS+qcZrQrFwW6trHhrq9cgIamal9/fs
	 BLShx5uc0YVl0N1QStkDk7c/6p/9g2FbPn96paelnyGetl6eNPeMHtpwbJY0A+2t6l
	 nwg47Z7dvalfTiAyV1KPnOwZxEnFH9f/GAqaONRNVP287B9y7UmuTazEt5kKatpcVC
	 OurJftXisaSE8YV1a9LVRZZQog8rD24kwO8TNmCvnVPsapvbBNW2zVj4yIk5ekx8rU
	 CbAIwL66wNPQA==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Xin Long <lucien.xin@gmail.com>
Subject: [PATCH v1 03/16] tlshd: set conn errcode to EACCES on GnuTLS failure in QUIC handshake
Date: Thu, 25 Sep 2025 21:21:52 -0400
Message-ID: <20250926012207.3642990-4-cel@kernel.org>
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

Align QUIC handshake error handling with the TLS 1.3 path in
tlshd_start_tls_handshake(). In tlshd_quic_start_handshake(), any error
returned from the GnuTLS API is now logged and mapped to conn->errcode =
EACCES (session_status).

Note: unlike TLS 1.3, the QUIC handshake manages its own packet send/recv.
Timeouts are handled separately, with conn->errcode set to ETIMEDOUT
by quic_timer_handler().

Signed-off-by: Xin Long <lucien.xin@gmail.com>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/quic.c | 66 +++++++++++++++++++++++++++---------------------
 1 file changed, 37 insertions(+), 29 deletions(-)

diff --git a/src/tlshd/quic.c b/src/tlshd/quic.c
index f19e1db6a164..0e0852e8fa55 100644
--- a/src/tlshd/quic.c
+++ b/src/tlshd/quic.c
@@ -188,7 +188,7 @@ static int quic_tp_send_func(gnutls_session_t session, gnutls_buffer_t extdata)
 	ret = gnutls_buffer_append_data(extdata, buf, len);
 	if (ret) {
 		tlshd_log_gnutls_error(ret);
-		return ret;
+		return -1;
 	}
 
 	return 0;
@@ -230,6 +230,7 @@ static char quic_priority[] =
 static int quic_session_set_priority(gnutls_session_t session, uint32_t cipher)
 {
 	char p[136] = {};
+	int ret;
 
 	memcpy(p, quic_priority, strlen(quic_priority));
 	switch (cipher) {
@@ -249,14 +250,19 @@ static int quic_session_set_priority(gnutls_session_t session, uint32_t cipher)
 		strcat(p, "AES-128-GCM:+AES-256-GCM:+AES-128-CCM:+CHACHA20-POLY1305");
 	}
 
-	return gnutls_priority_set_direct(session, p, NULL);
+	ret = gnutls_priority_set_direct(session, p, NULL);
+	if (ret) {
+		tlshd_log_gnutls_error(ret);
+		return -1;
+	}
+	return 0;
 }
 
 static int quic_session_set_alpns(gnutls_session_t session, char *alpn_data)
 {
 	gnutls_datum_t alpns[TLSHD_QUIC_MAX_ALPNS_LEN / 2];
 	char *alpn = strtok(alpn_data, ",");
-	int count = 0;
+	int count = 0, ret;
 
 	while (alpn) {
 		while (*alpn == ' ')
@@ -267,7 +273,12 @@ static int quic_session_set_alpns(gnutls_session_t session, char *alpn_data)
 		alpn = strtok(NULL, ",");
 	}
 
-	return gnutls_alpn_set_protocols(session, alpns, count, GNUTLS_ALPN_MANDATORY);
+	ret = gnutls_alpn_set_protocols(session, alpns, count, GNUTLS_ALPN_MANDATORY);
+	if (ret) {
+		tlshd_log_gnutls_error(ret);
+		return -1;
+	}
+	return 0;
 }
 
 static gnutls_record_encryption_level_t quic_get_encryption_level(uint8_t level)
@@ -401,7 +412,7 @@ static int quic_handshake_crypto_data(const struct tlshd_quic_conn *conn,
 	level = quic_get_encryption_level(level);
 	if (datalen > 0) {
 		ret = gnutls_handshake_write(session, level, data, datalen);
-		if (ret != 0) {
+		if (ret) {
 			if (!gnutls_error_is_fatal(ret))
 				return 0;
 			goto err;
@@ -418,7 +429,7 @@ static int quic_handshake_crypto_data(const struct tlshd_quic_conn *conn,
 err:
 	gnutls_alert_send_appropriate(session, ret);
 	tlshd_log_gnutls_error(ret);
-	return ret;
+	return -1;
 }
 
 /**
@@ -486,24 +497,25 @@ static int tlshd_quic_session_configure(struct tlshd_quic_conn *conn)
 	gnutls_session_t session = conn->session;
 	int ret;
 
-	ret = quic_session_set_priority(session, conn->cipher);
-	if (ret)
-		return ret;
+	if (quic_session_set_priority(session, conn->cipher))
+		return -1;
 
-	if (conn->alpns[0]) {
-		ret = quic_session_set_alpns(session, conn->alpns);
-		if (ret)
-			return ret;
-	}
+	if (conn->alpns[0] && quic_session_set_alpns(session, conn->alpns))
+		return -1;
 
 	gnutls_handshake_set_secret_function(session, quic_secret_func);
 	gnutls_handshake_set_read_function(session, quic_read_func);
 	gnutls_alert_set_read_function(session, quic_alert_read_func);
 
-	return gnutls_session_ext_register(
+	ret = gnutls_session_ext_register(
 		session, "QUIC Transport Parameters", QUIC_TLSEXT_TP_PARAM,
 		GNUTLS_EXT_TLS, quic_tp_recv_func, quic_tp_send_func, NULL, NULL, NULL,
 		GNUTLS_EXT_FLAG_TLS | GNUTLS_EXT_FLAG_CLIENT_HELLO | GNUTLS_EXT_FLAG_EE);
+	if (ret) {
+		tlshd_log_gnutls_error(ret);
+		return -1;
+	}
+	return 0;
 }
 
 static void tlshd_quic_recv_session_ticket(struct tlshd_quic_conn *conn)
@@ -532,16 +544,16 @@ static void tlshd_quic_recv_session_ticket(struct tlshd_quic_conn *conn)
 		return;
 
 	/* process new session ticket msg and get the generated session data */
-	ret = quic_handshake_crypto_data(conn, QUIC_CRYPTO_APP, conn->ticket, len);
-	if (ret) {
-		conn->errcode = -ret;
+	if (quic_handshake_crypto_data(conn, QUIC_CRYPTO_APP, conn->ticket, len)) {
+		conn->errcode = EACCES;
 		return;
 	}
+
 	size = sizeof(conn->ticket);
 	ret = gnutls_session_get_data(session, conn->ticket, &size);
 	if (ret) {
 		tlshd_log_gnutls_error(ret);
-		conn->errcode = -ret;
+		conn->errcode = EACCES;
 		return;
 	}
 
@@ -569,17 +581,14 @@ void tlshd_quic_start_handshake(struct tlshd_quic_conn *conn)
 	FD_ZERO(&readfds);
 	FD_SET(sockfd, &readfds);
 
-	ret = tlshd_quic_session_configure(conn);
-	if (ret) {
-		tlshd_log_gnutls_error(ret);
-		conn->errcode = -ret;
+	if (tlshd_quic_session_configure(conn)) {
+		conn->errcode = EACCES;
 		return;
 	}
 
 	if (!conn->is_serv) {
-		ret = quic_handshake_crypto_data(conn, QUIC_CRYPTO_INITIAL, NULL, 0);
-		if (ret) {
-			conn->errcode = -ret;
+		if (quic_handshake_crypto_data(conn, QUIC_CRYPTO_INITIAL, NULL, 0)) {
+			conn->errcode = EACCES;
 			return;
 		}
 
@@ -614,9 +623,8 @@ void tlshd_quic_start_handshake(struct tlshd_quic_conn *conn)
 				return tlshd_log_error("socket recvmsg error %d", errno);
 			}
 			tlshd_log_debug("> Handshake RECV: %u %u", msg->len, msg->level);
-			ret = quic_handshake_crypto_data(conn, msg->level, msg->data, msg->len);
-			if (ret) {
-				conn->errcode = -ret;
+			if (quic_handshake_crypto_data(conn, msg->level, msg->data, msg->len)) {
+				conn->errcode = EACCES;
 				return;
 			}
 		}
-- 
2.51.0


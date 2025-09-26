Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A64C1632DD
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 26 Sep 2025 01:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849736; cv=none; b=n2cJB56VrmRbP2DWREIT/zlfhI82Zzi08ApUnYImuHUc7feHn6b9zHirfSB3KLo1lgIx7cZkTLxIJwC2bevz5c0rjv5XrCGoxbM9ZVCFUnHMfHmBd6O2eBoFt58UO0wTKbPiTPUTm2WXJpA68FbREcaTRAKEZqKtwO54cKab1t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849736; c=relaxed/simple;
	bh=ejWZNzFzNgDPVGw9wiFPKWs2fMwlsEZiXL4uzv2IiXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s3ciIKPlN644/MxZa6jfk9gMwzwXo8/P1UW1zxckMHedH7WHqLgNBP0rRstmbRRacja6c3rX+ZqZScdhFbVncFY6/RJN1OnphZRnyuC8J/RC8tMe4oj5lmMCQhv88BmbTataHa7P7+wUIiH98RQNSA2xYEbPenwsEB52NgNdl+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k13qm9+G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k13qm9+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08F0C113CF;
	Fri, 26 Sep 2025 01:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758849735;
	bh=ejWZNzFzNgDPVGw9wiFPKWs2fMwlsEZiXL4uzv2IiXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k13qm9+Ga5DCoXbTfxog/v5bE+pSPF2LKYmCallOddKIxWUh3Bm7sAfnxiMiDyl7X
	 +J29xyGaQ8Dwf6RDW65N3YXN/6DlA0duzYuwBbQ5Zsy4Y9tS1S+pjoi6+66YuHdd7y
	 0FjBhl8kOd4RAJkCDnAPwHjMhwVhU1cLs/5Kua0DSVNAtVxQNcU5FywgtfMBp5Eznu
	 INDmcGfbc2PbTf6kdVnFlzkeHCGMKR+KQdM5fH6BwcbMObfLIZSYE3bt2tmAr1sFR+
	 ugqHT/OfFCGoJZEXBuO2DVlZLPp6aVwLqV1u3Lf21qtJqwOPssphtNsR8qu9YOfyyt
	 W451fZktLcqzQ==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Xin Long <lucien.xin@gmail.com>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH v1 12/16] tlshd: Translate kernel-style Doxygen comments in src/tlshd/quic.c
Date: Thu, 25 Sep 2025 21:22:01 -0400
Message-ID: <20250926012207.3642990-13-cel@kernel.org>
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

From: Chuck Lever <chuck.lever@oracle.com>

I started the ktls-utils project using the Linux kernel flavor of
Doxygen commenting which user-space Doxygen does not recognize by
default.

Convert existing comments in quic.c to what a normal user space
Doxygen run expects to see. This will enable deployment of an
automatically-generated documentation web site.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/quic.c | 180 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 166 insertions(+), 14 deletions(-)

diff --git a/src/tlshd/quic.c b/src/tlshd/quic.c
index 0e0852e8fa55..a9b096ad93f4 100644
--- a/src/tlshd/quic.c
+++ b/src/tlshd/quic.c
@@ -1,8 +1,12 @@
-/*
- * Perform a QUIC server or client side handshake.
+/**
+ * @file quic.c
+ * @brief Utility functions for QUIC handshakes
  *
+ * @copyright
  * Copyright (c) 2024 Red Hat, Inc.
- *
+ */
+
+/*
  * ktls-utils is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
  * published by the Free Software Foundation; version 2.
@@ -31,6 +35,10 @@
 #include "tlshd.h"
 
 #ifdef HAVE_GNUTLS_QUIC
+/**
+ * @brief Callback to handle a timer expiry
+ * @param[in,out] arg  user data
+ */
 static void quic_timer_handler(union sigval arg)
 {
 	struct tlshd_quic_conn *conn = arg.sival_ptr;
@@ -39,6 +47,13 @@ static void quic_timer_handler(union sigval arg)
 	conn->errcode = ETIMEDOUT;
 }
 
+/**
+ * @brief Set a handshake timer
+ * @param[in,out] conn  QUIC handshake context
+ *
+ * @retval 0   Timer configured successfully
+ * @retval -1  Failed to configure timer
+ */
 static int quic_conn_setup_timer(struct tlshd_quic_conn *conn)
 {
 	uint64_t msec = conn->parms->timeout_ms;
@@ -62,11 +77,21 @@ static int quic_conn_setup_timer(struct tlshd_quic_conn *conn)
 	return 0;
 }
 
+/**
+ * @brief Delete a handshake timer
+ * @param[in,out] conn  QUIC handshake context
+ */
 static void quic_conn_delete_timer(struct tlshd_quic_conn *conn)
 {
 	timer_delete(conn->timer);
 }
 
+/**
+ * @brief Convert a GnuTLS cipher number to a kTLS cipher number
+ * @param[in]     cipher   kTLS cipher number to be converted
+ *
+ * @returns a kTLS cipher number.
+ */
 static uint32_t quic_get_tls_cipher_type(gnutls_cipher_algorithm_t cipher)
 {
 	switch (cipher) {
@@ -84,6 +109,12 @@ static uint32_t quic_get_tls_cipher_type(gnutls_cipher_algorithm_t cipher)
 	}
 }
 
+/**
+ * @brief Convert a GnuTLS encryption level number
+ * @param[in]     level    GnuTLS encryption level
+ *
+ * @returns a QUIC encryption level number.
+ */
 static enum quic_crypto_level quic_get_crypto_level(gnutls_record_encryption_level_t level)
 {
 	switch (level) {
@@ -101,6 +132,17 @@ static enum quic_crypto_level quic_get_crypto_level(gnutls_record_encryption_lev
 	}
 }
 
+/**
+ * @brief Callback to process a new traffic secret
+ * @param[in,out] session    GnuTLS session
+ * @param[in]     level      GnuTLS encryption level
+ * @param[in]     rx_secret  Receive secret, or NULL
+ * @param[in]     tx_secret  Transmit secret, or NULL
+ * @param[in]     secretlen  Length of secrets, in bytes
+ *
+ * @retval 0   Callback completed successfully
+ * @retval -1  Callback failed
+ */
 static int quic_secret_func(gnutls_session_t session, gnutls_record_encryption_level_t level,
 			    const void *rx_secret, const void *tx_secret, size_t secretlen)
 {
@@ -150,6 +192,15 @@ static int quic_secret_func(gnutls_session_t session, gnutls_record_encryption_l
 	return 0;
 }
 
+/**
+ * @brief Callback to handle an outgoing alert
+ * @param[in,out] session      GnuTLS session
+ * @param[in]     level        GnuTLS encryption level
+ * @param[in]     alert_level  TLS alert level number
+ * @param[in]     alert_desc   TLS alert description number
+ *
+ * @retval 0   Callback completed successfully
+ */
 static int quic_alert_read_func(gnutls_session_t session,
 				gnutls_record_encryption_level_t gtls_level,
 				gnutls_alert_level_t alert_level,
@@ -160,6 +211,15 @@ static int quic_alert_read_func(gnutls_session_t session,
 	return 0;
 }
 
+/**
+ * @brief Callback to receive handshake data
+ * @param[in,out] session  GnuTLS session
+ * @param[in]     buf      Buffer containing received data
+ * @param[in]     len      Length of content in "buf", in bytes
+ *
+ * @retval 0   Callback completed successfully
+ * @retval -1  Callback failed
+ */
 static int quic_tp_recv_func(gnutls_session_t session, const uint8_t *buf, size_t len)
 {
 	struct tlshd_quic_conn *conn = gnutls_session_get_ptr(session);
@@ -172,6 +232,14 @@ static int quic_tp_recv_func(gnutls_session_t session, const uint8_t *buf, size_
 	return 0;
 }
 
+/**
+ * @brief Callback to send handshake data
+ * @param[in,out] session  GnuTLS session
+ * @param[in]     buf      Buffer to be filled in with data to send
+ *
+ * @retval 0   Callback completed successfully
+ * @retval -1  Callback failed
+ */
 static int quic_tp_send_func(gnutls_session_t session, gnutls_buffer_t extdata)
 {
 	struct tlshd_quic_conn *conn = gnutls_session_get_ptr(session);
@@ -194,6 +262,17 @@ static int quic_tp_send_func(gnutls_session_t session, gnutls_buffer_t extdata)
 	return 0;
 }
 
+/**
+ * @brief Callback to handle an outgoing handshake message
+ * @param[in,out] session  GnuTLS session
+ * @param[in]     level    GnuTLS encryption level
+ * @param[in]     htype    GnuTLS handshake description
+ * @param[in]     data     message to be processed
+ * @param[in]     datalen  length of "data" in bytes
+ *
+ * @retval 0   Callback completed successfully
+ * @retval -1  Callback failed
+ */
 static int quic_read_func(gnutls_session_t session, gnutls_record_encryption_level_t level,
 			  gnutls_handshake_description_t htype, const void *data, size_t datalen)
 {
@@ -224,9 +303,21 @@ static int quic_read_func(gnutls_session_t session, gnutls_record_encryption_lev
 	return 0;
 }
 
+/**
+ * @var char quic_priority
+ * Default GnuTLS priority string for QUIC connections
+ */
 static char quic_priority[] =
 	"%DISABLE_TLS13_COMPAT_MODE:NORMAL:-VERS-ALL:+VERS-TLS1.3:+PSK:-CIPHER-ALL:+";
 
+/**
+ * @brief Set the GnuTLS priority string for a session
+ * @param[in,out] session  GnuTLS session
+ * @param[in]     cipher   kTLS cipher number to set
+ *
+ * @retval 0   GnuTLS priority string set successfully
+ * @retval -1  Failed to set GnuTLS priority string
+ */
 static int quic_session_set_priority(gnutls_session_t session, uint32_t cipher)
 {
 	char p[136] = {};
@@ -258,6 +349,14 @@ static int quic_session_set_priority(gnutls_session_t session, uint32_t cipher)
 	return 0;
 }
 
+/**
+ * @brief Set the ALPN information on a session
+ * @param[in,out] session    GnuTLS session
+ * @param[in]     alpn_data  ALPN string to set
+ *
+ * @retval 0   ALPN string set successfully
+ * @retval -1  Failed to set ALPN string
+ */
 static int quic_session_set_alpns(gnutls_session_t session, char *alpn_data)
 {
 	gnutls_datum_t alpns[TLSHD_QUIC_MAX_ALPNS_LEN / 2];
@@ -281,6 +380,12 @@ static int quic_session_set_alpns(gnutls_session_t session, char *alpn_data)
 	return 0;
 }
 
+/**
+ * @brief Translate the encryption level value
+ * @param[in]     level  QUIC encryption level
+ *
+ * @returns an equivalent GNUTLS_ENCRYPTION value
+ */
 static gnutls_record_encryption_level_t quic_get_encryption_level(uint8_t level)
 {
 	switch (level) {
@@ -298,6 +403,13 @@ static gnutls_record_encryption_level_t quic_get_encryption_level(uint8_t level)
 	}
 }
 
+/**
+ * @brief Retrieve QUIC connection configuration
+ * @param[in]     conn  QUIC handshake context
+ *
+ * @retval 0   Connection configuration retrieved successfully
+ * @retval -1  Failed to retrieve configuration
+ */
 static int quic_conn_get_config(struct tlshd_quic_conn *conn)
 {
 	int sockfd = conn->parms->sockfd;
@@ -326,6 +438,13 @@ static int quic_conn_get_config(struct tlshd_quic_conn *conn)
 	return 0;
 }
 
+/**
+ * @brief Send one QUIC handshake message on a socket
+ * @param[in]     sockfd  Socket on which to send
+ * @param[in]     msg     Buffer containing message to send
+ *
+ * @returns the number of bytes sent, or -1 if an error occurred.
+ */
 static int quic_handshake_sendmsg(int sockfd, struct tlshd_quic_msg *msg)
 {
 	char outcmsg[CMSG_SPACE(sizeof(struct quic_handshake_info))];
@@ -359,6 +478,13 @@ static int quic_handshake_sendmsg(int sockfd, struct tlshd_quic_msg *msg)
 	return sendmsg(sockfd, &outmsg, flags);
 }
 
+/**
+ * @brief Receive one QUIC handshake message on a socket
+ * @param[in]     sockfd  Socket on which to receive
+ * @param[in,out] msg     Buffer in which to receive a message
+ *
+ * @returns the number of bytes received, or -1 if an error occurred.
+ */
 static int quic_handshake_recvmsg(int sockfd, struct tlshd_quic_msg *msg)
 {
 	char incmsg[CMSG_SPACE(sizeof(struct quic_handshake_info))];
@@ -397,11 +523,28 @@ static int quic_handshake_recvmsg(int sockfd, struct tlshd_quic_msg *msg)
 	return ret;
 }
 
-static int quic_handshake_completed(const struct tlshd_quic_conn *conn)
+/**
+ * @brief Predicate: Has the QUIC handshake completed
+ * @param[in]     conn     QUIC handshake context
+ *
+ * @retval true   The handshake completed
+ * @retval false  The handshake has not completed
+ */
+static bool quic_handshake_completed(const struct tlshd_quic_conn *conn)
 {
 	return conn->completed || conn->errcode;
 }
 
+/**
+ * @brief Get the generated session data
+ * @param[in]     conn     QUIC handshake context
+ * @param[in]     level    Encryption level
+ * @param[in]     data     Ticket blob
+ * @param[in]     datalen  length of "data" in bytes
+ *
+ * @retval 0   Session data retrieved successfully
+ * @retval -1  Session data is not available
+ */
 static int quic_handshake_crypto_data(const struct tlshd_quic_conn *conn,
 				      uint8_t level, const uint8_t *data,
 				      size_t datalen)
@@ -433,11 +576,11 @@ err:
 }
 
 /**
- * tlshd_quic_conn_create - Create a context for QUIC handshake
- * @conn_p: pointer to accept the QUIC handshake context created
- * @parms: handshake parameters
+ * @brief Create a context for QUIC handshake
+ * @param[out]    conn_p  Pointer to accept the QUIC handshake context created
+ * @param[in]     parms   Handshake parameters
  *
- * Returns: %0 on success, or a negative error code
+ * @returns 0 on success, or a negative error code
  */
 int tlshd_quic_conn_create(struct tlshd_quic_conn **conn_p, struct tlshd_handshake_parms *parms)
 {
@@ -471,9 +614,8 @@ err:
 }
 
 /**
- * tlshd_quic_conn_destroy - Destroy a context for QUIC handshake
- * @conn: QUIC handshake context to destroy
- *
+ * @brief Destroy a context for QUIC handshake
+ * @param[in]     conn  QUIC handshake context to destroy
  */
 void tlshd_quic_conn_destroy(struct tlshd_quic_conn *conn)
 {
@@ -492,6 +634,13 @@ void tlshd_quic_conn_destroy(struct tlshd_quic_conn *conn)
 
 #define QUIC_TLSEXT_TP_PARAM	0x39u
 
+/**
+ * @brief Configure a tlshd_quic_conn
+ * @param[in,out] conn  QUIC handshake context
+ *
+ * @retval 0   Connection configured successfully
+ * @retval -1  Failed to configure the connection
+ */
 static int tlshd_quic_session_configure(struct tlshd_quic_conn *conn)
 {
 	gnutls_session_t session = conn->session;
@@ -518,6 +667,10 @@ static int tlshd_quic_session_configure(struct tlshd_quic_conn *conn)
 	return 0;
 }
 
+/**
+ * @brief Set up a QUIC receive session ticket
+ * @param[in,out] conn  QUIC handshake context
+ */
 static void tlshd_quic_recv_session_ticket(struct tlshd_quic_conn *conn)
 {
 	gnutls_session_t session = conn->session;
@@ -567,9 +720,8 @@ static void tlshd_quic_recv_session_ticket(struct tlshd_quic_conn *conn)
 }
 
 /**
- * tlshd_quic_start_handshake - Drive the handshake interaction
- * @conn: QUIC handshake context
- *
+ * @brief Drive a QUIC handshake interaction
+ * @param[in,out] conn  QUIC handshake context
  */
 void tlshd_quic_start_handshake(struct tlshd_quic_conn *conn)
 {
-- 
2.51.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F0A1991B6
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 26 Sep 2025 01:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849736; cv=none; b=IkZlzI8Q1AAl7W+lFK8qXtX7xZatTlqyq6bCvIyJ2DZy+3JDkIeE23jhXld/xduS67UXvzjNzMzSktLng+45z6JVx04RplkjSKn1Z+evN+fIB7lHWLBl7r0hLkK4wGV9kY0rDUBv4wh4AGMsWmyt4j68/8LUBr6CB9Bg83JsU2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849736; c=relaxed/simple;
	bh=NmOqyPdYlgxdOlOx0nJWeEdLfu9K+n6AMHB88sjPYKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u2O9/608FyeEDvn8Tn6gC6jO1ZWBXmzH7bnihWRGLBFOR6htBSU7Gho6ZOGVhgvEQ09BjvU5B6YDFS3Uv2ZEzJlOF9A06uEdAiMS5i6A3gxlkZa2Z1+1hvxiJFwwJMzMta7yZR7fYpVo7hODy2hghBJL9tWt9vIGEXhH8zLqTIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZEYoFokh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZEYoFokh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23622C4CEF0;
	Fri, 26 Sep 2025 01:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758849736;
	bh=NmOqyPdYlgxdOlOx0nJWeEdLfu9K+n6AMHB88sjPYKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZEYoFokhOEQJnr25G89yARXMHGfHix7iTMR6Jir9oXqGgj1SPC7f7W7AdhyEu2HCl
	 ILyfvurnaUwWpp0poENMRDp0vmsx4rtylcLYYBrhhv++aVaSK4E5bnORqS1YXJfWCa
	 BOxhilTzmZnEts8HMN5X39ZpNSctEODhDoNMYg3YWiEsavHNGNMsfeIymV/UMupWCu
	 7AonkTyu/fPcBEKUDsP16vmAPrbFr0dTh/qAwjl6Gl7LaWcL/KyF+UBQ/gkKql85Vb
	 ENLrvU/r6+vGWnwqEmBHXDDPBQkOoMMfF2h2SOf8Sz1ZSx+8PB5sqB5u9eLEa1nUNy
	 gIf0yAypopayQ==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Xin Long <lucien.xin@gmail.com>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH v1 13/16] tlshd: Translate kernel-style Doxygen comments in src/tlshd/server.c
Date: Thu, 25 Sep 2025 21:22:02 -0400
Message-ID: <20250926012207.3642990-14-cel@kernel.org>
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

Convert existing comments in server.c to what a normal user space
Doxygen run expects to see. This will enable deployment of an
automatically-generated documentation web site.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/server.c | 203 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 177 insertions(+), 26 deletions(-)

diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index 8bb769ff9f74..ca084a1a754b 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -1,9 +1,13 @@
-/*
- * Perform a TLSv1.3 server-side handshake.
+/**
+ * @file server.c
+ * @brief Perform a TLSv1.3 server-side handshake
  *
+ * @copyright
  * Copyright (c) 2023 Oracle and/or its affiliates.
  * Copyright (c) 2024 Red Hat, Inc.
- *
+ */
+
+/*
  * ktls-utils is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
  * published by the Free Software Foundation; version 2.
@@ -42,13 +46,50 @@
 #include "tlshd.h"
 #include "netlink.h"
 
+/**
+ * @var gnutls_privkey_t tlshd_server_pq_privkey
+ * Server peer's post-quantum private key
+ */
 static gnutls_privkey_t tlshd_server_pq_privkey;
+
+/**
+ * @var gnutls_privkey_t tlshd_server_privkey
+ * Server peer's RSA private key
+ */
 static gnutls_privkey_t tlshd_server_privkey;
+
+/**
+ * @var unsigned int tlshd_server_pq_certs_len
+ * Count of server peer's PQ certificates
+ */
 static unsigned int tlshd_server_pq_certs_len = TLSHD_MAX_CERTS;
+
+/**
+ * @var unsigned int tlshd_server_certs_len
+ * Count of server peer's certificates
+ */
 static unsigned int tlshd_server_certs_len = TLSHD_MAX_CERTS;
+
+/**
+ * @var gnutls_pcert_st tlshd_server_certs
+ * Server peer's certificates
+ */
 static gnutls_pcert_st tlshd_server_certs[TLSHD_MAX_CERTS];
+
+/**
+ * @var gnutls_pk_algorithm_t tlshd_server_pq_pkalg
+ * Server peer certificate's public key algorithms
+ */
 static gnutls_pk_algorithm_t tlshd_server_pq_pkalg = GNUTLS_PK_UNKNOWN;
 
+/**
+ * @brief Retrieve server certificates to be used for ServerHello
+ * @param[in]     parms  Handshake parameters
+ *
+ * @retval true   Server certificates were found. Caller must release
+ *		  the certificates using tlshd_x509_server_put_certs.
+ * @retval false  No usable server certificates were found
+ */
 static bool tlshd_x509_server_get_certs(struct tlshd_handshake_parms *parms)
 {
 	if (parms->x509_cert != TLS_NO_CERT)
@@ -61,6 +102,9 @@ static bool tlshd_x509_server_get_certs(struct tlshd_handshake_parms *parms)
 				      &tlshd_server_pq_pkalg);
 }
 
+/**
+ * @brief Release server certificates that were used for ServerHello
+ */
 static void tlshd_x509_server_put_certs(void)
 {
 	unsigned int i;
@@ -69,6 +113,14 @@ static void tlshd_x509_server_put_certs(void)
 		gnutls_pcert_deinit(&tlshd_server_certs[i]);
 }
 
+/**
+ * @brief Retrieve the private key to be used for ServerHello
+ * @param[in]     parms  Handshake parameters
+ *
+ * @retval true   Private key was found. Caller must release the
+ *		  private key using tlshd_x509_server_put_privkey.
+ * @retval false  No usable private key was found
+ */
 static bool tlshd_x509_server_get_privkey(struct tlshd_handshake_parms *parms)
 {
 	if (parms->x509_privkey != TLS_NO_PRIVKEY)
@@ -79,12 +131,20 @@ static bool tlshd_x509_server_get_privkey(struct tlshd_handshake_parms *parms)
 					&tlshd_server_privkey);
 }
 
+/**
+ * @brief Release the private key that was used for ServerHello
+ */
 static void tlshd_x509_server_put_privkey(void)
 {
 	gnutls_privkey_deinit(tlshd_server_pq_privkey);
 	gnutls_privkey_deinit(tlshd_server_privkey);
 }
 
+/**
+ * @brief Audit trust chain of incoming client certificate
+ * @param[in]     req_ca_rdn
+ * @param[in]     nreqs
+ */
 static void tlshd_x509_log_issuers(const gnutls_datum_t *req_ca_rdn, int nreqs)
 {
 	char issuer_dn[256];
@@ -107,7 +167,18 @@ static void tlshd_x509_log_issuers(const gnutls_datum_t *req_ca_rdn, int nreqs)
 }
 
 /**
- * tlshd_x509_retrieve_key_cb - Initialize client's x.509 identity
+ * @brief Initialize the server peer's x.509 identity
+ * @param[in]     session  session in the midst of a handshake
+ * @param[in]     req_ca_rdn
+ * @param[in]     nreqs
+ * @param[in]     pk_algos
+ * @param[in]     pk_algos_length
+ * @param[out]    pcert
+ * @param[out]    pcert_length
+ * @param[out]    privkey
+ *
+ * @retval 0   Success; output parameters are set accordingly
+ * @retval -1  Failure
  *
  * Callback function is of type gnutls_certificate_retrieve_function2
  *
@@ -115,10 +186,6 @@ static void tlshd_x509_log_issuers(const gnutls_datum_t *req_ca_rdn, int nreqs)
  * gnutls/doc/examples/ex-cert-select.c.
  *
  * Sketched-in and untested.
- *
- * Return values:
- *   %0: Success; output parameters are set accordingly
- *   %-1: Failure
  */
 static int
 tlshd_x509_retrieve_key_cb(gnutls_session_t session,
@@ -197,6 +264,13 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
 	return 0;
 }
 
+/**
+ * @brief Initialize server-side trust store
+ * @param[out]    cred  Trust store to initialize
+ *
+ * @returns a GnuTLS error code. Caller must release credentials
+ * using gnutls_certificate_free_credentials(3).
+ */
 static int tlshd_server_get_truststore(gnutls_certificate_credentials_t cred)
 {
 	char *pathname;
@@ -227,9 +301,9 @@ static int tlshd_server_get_truststore(gnutls_certificate_credentials_t cred)
 }
 
 /**
- * tlshd_server_x509_verify_function - Verify remote's x.509 certificate
- * @session: session in the midst of a handshake
- * @parms: handshake parameters
+ * @brief Verify remote's x.509 certificate
+ * @param[in]     session  Session in the midst of a handshake
+ * @param[in]     parms    Handshake parameters
  *
  * A return value of %GNUTLS_E_SUCCESS indicates that the TLS session
  * has been allowed to continue. tlshd either sets the peerid array if
@@ -299,6 +373,13 @@ certificate_error:
 	return GNUTLS_E_CERTIFICATE_ERROR;
 }
 
+/**
+ * @brief Verify a remote peer's x.509 certificate (TLSv1.3)
+ * @param[in]     session  session in the midst of a handshake
+ *
+ * @retval GNUTLS_E_SUCCESS            Certificate has been successfully verified
+ * @retval GNUTLS_E_CERTIFICATE_ERROR  Certificate verification failed
+ */
 static int tlshd_tls13_server_x509_verify_function(gnutls_session_t session)
 {
 	struct tlshd_handshake_parms *parms = gnutls_session_get_ptr(session);
@@ -306,6 +387,10 @@ static int tlshd_tls13_server_x509_verify_function(gnutls_session_t session)
 	return tlshd_server_x509_verify_function(session, parms);
 }
 
+/**
+ * @brief Process an x.509-based TLS handshake with a server certificate
+ * @param[in]     parms  Handshake parameters
+ */
 static void tlshd_tls13_server_x509_handshake(struct tlshd_handshake_parms *parms)
 {
 	gnutls_certificate_credentials_t xcred;
@@ -386,17 +471,16 @@ out_free_creds:
 }
 
 /**
- * tlshd_server_psk_cb - Validate remote's username
- * @session: session in the midst of a handshake
- * @username: remote's username
- * @key: PSK matching @username
+ * @brief Validate the remote peer's username
+ * @param[in]     session   Session in the midst of a handshake
+ * @param[in]     username  Remote peer's username
+ * @param[in]     key       PSK matching "username"
  *
- * Searches for a key with description @username in the session
- * keyring, and stores the PSK data in @key if found.
+ * Searches for a key with description "username" in the session
+ * keyring, and stores the PSK data in "key" if found.
  *
- * Return values:
- *   %0: Matching key has been stored in @key
- *   %-1: Error during lookup, @key is not updated
+ * @retval 0  Matching key has been stored in "key"
+ * @retval -1 Error during lookup, "key" is not updated
  */
 static int tlshd_server_psk_cb(gnutls_session_t session,
 			       const char *username, gnutls_datum_t *key)
@@ -426,6 +510,10 @@ static int tlshd_server_psk_cb(gnutls_session_t session,
 	return 0;
 }
 
+/**
+ * @brief Process an PSK-based TLS handshake (TLSv1.3)
+ * @param[in]     parms   Handshake parameters
+ */
 static void tlshd_tls13_server_psk_handshake(struct tlshd_handshake_parms *parms)
 {
 	gnutls_psk_server_credentials_t psk_cred;
@@ -471,9 +559,8 @@ out_free_creds:
 }
 
 /**
- * tlshd_tls13_serverhello_handshake - send a TLSv1.3 ServerHello
- * @parms: handshake parameters
- *
+ * @brief Send a TLSv1.3 ServerHello
+ * @param[in]     parms  Handshake parameters
  */
 void tlshd_tls13_serverhello_handshake(struct tlshd_handshake_parms *parms)
 {
@@ -491,6 +578,17 @@ void tlshd_tls13_serverhello_handshake(struct tlshd_handshake_parms *parms)
 }
 
 #ifdef HAVE_GNUTLS_QUIC
+/**
+ * @brief Verify the ALPNs presented by a remote peer
+ * @param[in]      session
+ * @param[in]      htype
+ * @param[in]      when
+ * @param[in]      incoming
+ * @param[in]      msg
+ *
+ * @retval 0   ALPN verification was successful
+ * @retval -1  ALPN verification failed
+ */
 static int tlshd_quic_server_alpn_verify(gnutls_session_t session, unsigned int htype,
 					 unsigned int when, unsigned int incoming,
 					 const gnutls_datum_t *msg)
@@ -515,6 +613,25 @@ static int tlshd_quic_server_alpn_verify(gnutls_session_t session, unsigned int
 	return 0;
 }
 
+/**
+ * @brief Anti-reply protection
+ * @param[in]     dbf
+ * @param[in]     exp_time
+ * @param[in]     key
+ * @param[in]     data
+ *
+ * Currently, tlshd handles each handshake request in a new process
+ * rather than a thread. As a result, it cannot share the
+ * gnutls_anti_replay_t object across processes. This causes 0-RTT
+ * data to be automatically disabled, since
+ * _gnutls_anti_replay_check() fails validation in the absence of a
+ * shared anti-replay context.
+ *
+ * To properly support 0-RTT data, we need to enable sharing of the
+ * gnutls_anti_replay_t object across processes in some way.
+ *
+ * @retval 0  Not a replay
+ */
 static int tlshd_quic_server_anti_replay_db_add_func(void *dbf, time_t exp_time,
 						     const gnutls_datum_t *key,
 						     const gnutls_datum_t *data)
@@ -523,8 +640,19 @@ static int tlshd_quic_server_anti_replay_db_add_func(void *dbf, time_t exp_time,
 	return 0;
 }
 
+/**
+ * @var gnutls_anti_replay_t tlshd_quic_server_anti_replay
+ * Shared anti-replay context
+ */
 static gnutls_anti_replay_t tlshd_quic_server_anti_replay;
 
+/**
+ * @brief Verify a remote peer's x.509 certificate (QUIC)
+ * @param[in]     session  session in the midst of a handshake
+ *
+ * @retval GNUTLS_E_SUCCESS            Certificate has been successfully verified
+ * @retval GNUTLS_E_CERTIFICATE_ERROR  Certificate verification failed
+ */
 static int tlshd_quic_server_x509_verify_function(gnutls_session_t session)
 {
 	struct tlshd_quic_conn *conn = gnutls_session_get_ptr(session);
@@ -532,6 +660,18 @@ static int tlshd_quic_server_x509_verify_function(gnutls_session_t session)
 	return tlshd_server_x509_verify_function(session, conn->parms);
 }
 
+/**
+ * @brief Validate the remote peer's username
+ * @param[in]     session   Session in the midst of a handshake
+ * @param[in]     username  Remote peer's username
+ * @param[in]     key       PSK matching "username"
+ *
+ * Searches for a key with description "username" in the session
+ * keyring, and stores the PSK data in "key" if found.
+ *
+ * @retval 0  Matching key has been stored in "key"
+ * @retval -1 Error during lookup, "key" is not updated
+ */
 static int tlshd_quic_server_psk_cb(gnutls_session_t session, const char *username,
 				    gnutls_datum_t *key)
 {
@@ -562,6 +702,10 @@ found:
 	return 0;
 }
 
+/**
+ * @brief Prepare a session for a QUIC server handshake using an x.509 cert
+ * @param[in]     conn
+ */
 static void tlshd_quic_server_set_x509_session(struct tlshd_quic_conn *conn)
 {
 	struct tlshd_handshake_parms *parms = conn->parms;
@@ -631,6 +775,10 @@ err:
 	tlshd_log_gnutls_error(ret);
 }
 
+/**
+ * @brief Prepare a session for a QUIC client handshake using a pre-shared key
+ * @param[in]     conn
+ */
 static void tlshd_quic_server_set_psk_session(struct tlshd_quic_conn *conn)
 {
 	gnutls_psk_server_credentials_t cred;
@@ -665,9 +813,8 @@ err:
 }
 
 /**
- * tlshd_quic_serverhello_handshake - send a QUIC Server Initial
- * @parms: handshake parameters
- *
+ * @brief Send a QUIC Server Initial
+ * @param[in]     parms  Handshake parameters
  */
 void tlshd_quic_serverhello_handshake(struct tlshd_handshake_parms *parms)
 {
@@ -699,6 +846,10 @@ out:
 	tlshd_quic_conn_destroy(conn);
 }
 #else
+/**
+ * @brief Send a QUIC Server Initial
+ * @param[in]     parms  Handshake parameters
+ */
 void tlshd_quic_serverhello_handshake(struct tlshd_handshake_parms *parms)
 {
 	tlshd_log_debug("QUIC handshake is not enabled (%d)", parms->auth_mode);
-- 
2.51.0


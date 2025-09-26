Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7E81632DD
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 26 Sep 2025 01:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849732; cv=none; b=svvtrWISXc37m/V5/b9nhc5DUifTG4cYgBOhyLrx4Duu1ln/KNzZJ8ZLoR66ptckTxncNSHkX2uH2GayDs0iTm6KDG+sClXVEQ/u4nqQ+NOpH5j7QBskY54nAefAlHJVxBkhntgMs2POSFf+Reog9A/fGXMO631rTPu06VLf2SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849732; c=relaxed/simple;
	bh=P7aL/yHcrz1MPFYujellBTfrwzc5IOi7RhBvss9b1w0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOpaPlTuyG2AZK5tNnvCxckdxMZe4jb6F2kOlYSt0BFdAI3EKdfl3hnswCzD7PU1GQc1sr5/SX6Yv3/AjZjBw06bABWx693NYmJdJMq1vvwQ233w8XGiTDLsHMu2u8EUwGWPSp7a63xtycthaJNxvFbsAI63sI3ZIYU1eGToXPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiQ8D8xa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiQ8D8xa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13DCC113CF;
	Fri, 26 Sep 2025 01:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758849732;
	bh=P7aL/yHcrz1MPFYujellBTfrwzc5IOi7RhBvss9b1w0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jiQ8D8xah6SUvbAvrN3Y+Sw8A0dIPAKK1dncGfS7HjfqWcz0uUEoMsDhKLrJFKXEZ
	 OBQoZwzoTvDJJ4MdKPLtZ0K2BG4J3SNuBjuPyZ/tjIt1/smWAF+EzbQBibfahMkbUM
	 I6gLvUEvIK0PFQ2nLCpGUG2gI8HXFGmwPpVGQo73tx8WsX2tRr4zBbTREoSw9yUsPB
	 bfSnpiyxssB0tiIr/wTKNdKsMSKw3pHoV1c96ktH2+b5TjNryNYSGpqEEtCw/8xe9v
	 dMgyGUreaVsXdYieTNvT/eH6nnKP1d4qkGWjf4hF5yQ3qjQ3R4vd/9viz0HbljbAat
	 oOytAYS+VJWWw==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Xin Long <lucien.xin@gmail.com>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH v1 04/16] tlshd: Translate kernel-style Doxygen comments in src/tlshd/client.c
Date: Thu, 25 Sep 2025 21:21:53 -0400
Message-ID: <20250926012207.3642990-5-cel@kernel.org>
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

Convert existing comments in client.c to what a normal user space
Doxygen run expects to see. This will enable deployment of an
automatically-generated documentation web site.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/client.c | 158 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 138 insertions(+), 20 deletions(-)

diff --git a/src/tlshd/client.c b/src/tlshd/client.c
index 3415fddfa0c4..2664ffb18ab3 100644
--- a/src/tlshd/client.c
+++ b/src/tlshd/client.c
@@ -1,10 +1,14 @@
-/*
- * Perform a TLSv1.3 handshake.
+/**
+ * @file client.c
+ * @brief Perform a client-side TLS handshake
  *
+ * @copyright
  * Copyright (c) 2022 Oracle and/or its affiliates.
  * Copyright (c) 2022 SUSE LLC.
  * Copyright (c) 2024 Red Hat, Inc.
- *
+ */
+
+/*
  * ktls-utils is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
  * published by the Free Software Foundation; version 2.
@@ -43,6 +47,13 @@
 #include "tlshd.h"
 #include "netlink.h"
 
+/**
+ * @brief Initialize client side trust store
+ * @param[out]    cred  Trust store to initialize
+ *
+ * @returns a GnuTLS error code. Caller must release credentials
+ * using gnutls_certificate_free_credentials(3).
+ */
 static int tlshd_client_get_truststore(gnutls_certificate_credentials_t cred)
 {
 	char *pathname;
@@ -74,6 +85,10 @@ static int tlshd_client_get_truststore(gnutls_certificate_credentials_t cred)
 	return GNUTLS_E_SUCCESS;
 }
 
+/**
+ * @brief Initiate an x.509-based TLS handshake without a client certificate
+ * @param[in]     parms  Handshake parameters
+ */
 static void tlshd_tls13_client_anon_handshake(struct tlshd_handshake_parms *parms)
 {
 	gnutls_certificate_credentials_t xcred;
@@ -134,13 +149,50 @@ out_free_creds:
 	gnutls_certificate_free_credentials(xcred);
 }
 
+/**
+ * @var gnutls_privkey_t tlshd_pq_privkey
+ * Client peer's post-quantum private key
+ */
 static gnutls_privkey_t tlshd_pq_privkey;
+
+/**
+ * @var gnutls_privkey_t tlshd_privkey
+ * Client peer's private key
+ */
 static gnutls_privkey_t tlshd_privkey;
+
+/**
+ * @var unsigned int tlshd_pq_certs_len
+ * Count of client peer's post-quantum certificates
+ */
 static unsigned int tlshd_pq_certs_len = TLSHD_MAX_CERTS;
+
+/**
+ * @var unsigned int tlshd_certs_len
+ * Count of client peer's certificates
+ */
 static unsigned int tlshd_certs_len = TLSHD_MAX_CERTS;
+
+/**
+ * @var gnutls_pcert_st tlshd_certs
+ * Client peer's certificates
+ */
 static gnutls_pcert_st tlshd_certs[TLSHD_MAX_CERTS];
+
+/**
+ * @var gnutls_pk_algorithm_t tlshd_pq_pkalg
+ * Client peer certificate's public key algorithms
+ */
 static gnutls_pk_algorithm_t tlshd_pq_pkalg = GNUTLS_PK_UNKNOWN;
 
+/**
+ * @brief Retrieve client certificates to be used for ClientHello
+ * @param[in]     parms  Handshake parameters
+ *
+ * @retval true   Client certificates were found. Caller must release
+ *		  the certificates using tlshd_x509_client_put_certs.
+ * @retval false  No usable client certificates were found
+ */
 static bool tlshd_x509_client_get_certs(struct tlshd_handshake_parms *parms)
 {
 	if (parms->x509_cert != TLS_NO_CERT)
@@ -151,6 +203,9 @@ static bool tlshd_x509_client_get_certs(struct tlshd_handshake_parms *parms)
 				      &tlshd_pq_pkalg);
 }
 
+/**
+ * @brief Release client certificates that were used for ClientHello
+ */
 static void tlshd_x509_client_put_certs(void)
 {
 	unsigned int i;
@@ -159,6 +214,14 @@ static void tlshd_x509_client_put_certs(void)
 		gnutls_pcert_deinit(&tlshd_certs[i]);
 }
 
+/**
+ * @brief Retrieve the private key to be used for ClientHello
+ * @param[in]     parms  Handshake parameters
+ *
+ * @retval true   Private key was found. Caller must release the
+ *		  private key using tlshd_x509_client_put_privkey.
+ * @retval false  No usable private key was found
+ */
 static bool tlshd_x509_client_get_privkey(struct tlshd_handshake_parms *parms)
 {
 	if (parms->x509_privkey != TLS_NO_PRIVKEY)
@@ -168,12 +231,20 @@ static bool tlshd_x509_client_get_privkey(struct tlshd_handshake_parms *parms)
 					&tlshd_privkey);
 }
 
+/**
+ * @brief Release the private key that was used for ClientHello
+ */
 static void tlshd_x509_client_put_privkey(void)
 {
 	gnutls_privkey_deinit(tlshd_privkey);
 	gnutls_privkey_deinit(tlshd_pq_privkey);
 }
 
+/**
+ * @brief Audit trust chain of incoming server certificate
+ * @param[in]     req_ca_rdn
+ * @param[in]     nreqs
+ */
 static void tlshd_x509_log_issuers(const gnutls_datum_t *req_ca_rdn, int nreqs)
 {
 	char issuer_dn[256];
@@ -196,7 +267,18 @@ static void tlshd_x509_log_issuers(const gnutls_datum_t *req_ca_rdn, int nreqs)
 }
 
 /**
- * tlshd_x509_retrieve_key_cb - Initialize client's x.509 identity
+ * @brief Initialize the client peer's x.509 identity
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
@@ -204,10 +286,6 @@ static void tlshd_x509_log_issuers(const gnutls_datum_t *req_ca_rdn, int nreqs)
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
@@ -256,13 +334,12 @@ tlshd_x509_retrieve_key_cb(gnutls_session_t session,
 }
 
 /**
- * tlshd_client_x509_verify_function - Verify remote's x.509 certificate
- * @session: session in the midst of a handshake
- * @parms: handshake parameters
+ * @brief Verify the remote peer's x.509 certificate
+ * @param[in]     session  session in the midst of a handshake
+ * @param[in]     parms  Handshake parameters
  *
- * Return values:
- *   %GNUTLS_E_SUCCESS: Incoming certificate has been successfully verified
- *   %GNUTLS_E_CERTIFICATE_ERROR: certificate verification failed
+ * @retval GNUTLS_E_SUCCESS            Certificate has been successfully verified
+ * @retval GNUTLS_E_CERTIFICATE_ERROR  Certificate verification failed
  */
 static int tlshd_client_x509_verify_function(gnutls_session_t session,
 					     struct tlshd_handshake_parms *parms)
@@ -313,6 +390,13 @@ static int tlshd_client_x509_verify_function(gnutls_session_t session,
 	return GNUTLS_E_SUCCESS;
 }
 
+/**
+ * @brief Verify the remote peer's x.509 certificate (TLSv1.3)
+ * @param[in]     session  session in the midst of a handshake
+ *
+ * @retval GNUTLS_E_SUCCESS            Certificate has been successfully verified
+ * @retval GNUTLS_E_CERTIFICATE_ERROR  Certificate verification failed
+ */
 static int tlshd_tls13_client_x509_verify_function(gnutls_session_t session)
 {
 	struct tlshd_handshake_parms *parms = gnutls_session_get_ptr(session);
@@ -320,6 +404,10 @@ static int tlshd_tls13_client_x509_verify_function(gnutls_session_t session)
 	return tlshd_client_x509_verify_function(session, parms);
 }
 
+/**
+ * @brief Initiate an x.509-based TLS handshake with a client certificate
+ * @param[in]     parms  Handshake parameters
+ */
 static void tlshd_tls13_client_x509_handshake(struct tlshd_handshake_parms *parms)
 {
 	gnutls_certificate_credentials_t xcred;
@@ -384,6 +472,11 @@ out_free_creds:
 	gnutls_certificate_free_credentials(xcred);
 }
 
+/**
+ * @brief Initiate one PSK-based handshake
+ * @param[in]     parms   Handshake parameters
+ * @param[in]     peerid  Serial number of local peer ID to present
+ */
 static void tlshd_tls13_client_psk_handshake_one(struct tlshd_handshake_parms *parms,
 						 key_serial_t peerid)
 {
@@ -475,6 +568,10 @@ out_free_creds:
 	free(identity);
 }
 
+/**
+ * @brief Initiate an PSK-based TLS handshake
+ * @param[in]     parms  Handshake parameters
+ */
 static void tlshd_tls13_client_psk_handshake(struct tlshd_handshake_parms *parms)
 {
 	key_serial_t peerid;
@@ -498,9 +595,8 @@ static void tlshd_tls13_client_psk_handshake(struct tlshd_handshake_parms *parms
 }
 
 /**
- * tlshd_tls13_clienthello_handshake - send a TLSv1.3 ClientHello
- * @parms: handshake parameters
- *
+ * @brief Send a TLSv1.3 ClientHello
+ * @param[in]     parms  Handshake parameters
  */
 void tlshd_tls13_clienthello_handshake(struct tlshd_handshake_parms *parms)
 {
@@ -521,6 +617,13 @@ void tlshd_tls13_clienthello_handshake(struct tlshd_handshake_parms *parms)
 }
 
 #ifdef HAVE_GNUTLS_QUIC
+/**
+ * @brief Verify the remote peer's x.509 certificate (QUIC)
+ * @param[in]     session  session in the midst of a handshake
+ *
+ * @retval GNUTLS_E_SUCCESS            Certificate has been successfully verified
+ * @retval GNUTLS_E_CERTIFICATE_ERROR  Certificate verification failed
+ */
 static int tlshd_quic_client_x509_verify_function(gnutls_session_t session)
 {
 	struct tlshd_quic_conn *conn = gnutls_session_get_ptr(session);
@@ -530,6 +633,10 @@ static int tlshd_quic_client_x509_verify_function(gnutls_session_t session)
 
 #define TLSHD_QUIC_NO_CERT_AUTH	3
 
+/**
+ * @brief Prepare a session for a QUIC client handshake using an x.509 cert
+ * @param[in]     conn
+ */
 static void tlshd_quic_client_set_x509_session(struct tlshd_quic_conn *conn)
 {
 	struct tlshd_handshake_parms *parms = conn->parms;
@@ -593,12 +700,20 @@ err:
 	tlshd_log_gnutls_error(ret);
 }
 
+/**
+ * @brief Prepare a session for a QUIC client handshake using no authentication
+ * @param[in]     conn
+ */
 static void tlshd_quic_client_set_anon_session(struct tlshd_quic_conn *conn)
 {
 	conn->cert_req = TLSHD_QUIC_NO_CERT_AUTH;
 	tlshd_quic_client_set_x509_session(conn);
 }
 
+/**
+ * @brief Prepare a session for a QUIC client handshake using a pre-shared key
+ * @param[in]     conn
+ */
 static void tlshd_quic_client_set_psk_session(struct tlshd_quic_conn *conn)
 {
 	key_serial_t peerid = g_array_index(conn->parms->peerids, key_serial_t, 0);
@@ -642,9 +757,8 @@ err:
 }
 
 /**
- * tlshd_quic_clienthello_handshake - send a QUIC Client Initial
- * @parms: handshake parameters
- *
+ * @brief Send a QUIC Client Initial
+ * @param[in]     parms  Handshake parameters
  */
 void tlshd_quic_clienthello_handshake(struct tlshd_handshake_parms *parms)
 {
@@ -680,6 +794,10 @@ out:
 	tlshd_quic_conn_destroy(conn);
 }
 #else
+/**
+ * @brief Send a QUIC Client Initial
+ * @param[in]     parms  Handshake parameters
+ */
 void tlshd_quic_clienthello_handshake(struct tlshd_handshake_parms *parms)
 {
 	tlshd_log_debug("QUIC handshake is not enabled (%d)", parms->auth_mode);
-- 
2.51.0


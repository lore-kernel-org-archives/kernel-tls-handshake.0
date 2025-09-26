Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F591186294
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 26 Sep 2025 01:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849734; cv=none; b=Isz+j85pRKovbvOYAa5TsaJpE5DnJvX4hRZw8fokDYp7B8fWZr2TJc7RnZNoU/uIM+aNQE13/d07eFqT6VznI/4U2x2C8FJZs6PnXBUQ8T33nlfhCHqc4cI7x94Yxfpn5ptYVeEm5fCuRRkP6sQq8JsbF+sXpz6Yvo/fCWfi2no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849734; c=relaxed/simple;
	bh=pG577NTVmtwep6o2/7/EPXV2Fly/lCCdwCaYChJE0fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uE6hhcNiS4urF6gHV1pXLHb7j5fIBwoxnImYSSVhr3QPAabBBAvtJEJ4Tq9tB3/WGh4u1W6RFgxhl7C0tRvLaRYvWCXWw1dKqu67xgS8o1Dt91vDJCMmelp+Id2yjQfpdMJkmh7hL67q0lk2JE4QBQm3t8VbgSMSZwynbz6Bj2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RP2pzc91; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RP2pzc91"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD880C4CEF0;
	Fri, 26 Sep 2025 01:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758849734;
	bh=pG577NTVmtwep6o2/7/EPXV2Fly/lCCdwCaYChJE0fw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RP2pzc91No2KxXDsGIehHBJO7APxI1j8jLR5nANheqnJ9RhjPI5F5fX2J3g3RljWx
	 DydIiCbeysDClmQs84EqjvXLXex5xGuZyLzYWzG/jvjScEUjLiuM8tRqujsXVklwyy
	 HfMLoUnUuLhJPj05B53G5Jh9kLI3VqYY51YDDVK7faXQqevj0VzOkP0Zq4aJSD4aIR
	 cyLus7nsMAH102MSoTUHkfovcIBZMx5H5JkHSC0nxMo6YOh0icSPsDOBq5nQZk3kAB
	 2R5QmDgmjSqjQWCdWVVkTEj+luQLl3xEgPtc/74pzfeo09g3TuwiQALKNCZH4295hu
	 ZQHNsQ2RoaL6g==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Xin Long <lucien.xin@gmail.com>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH v1 08/16] tlshd: Translate kernel-style Doxygen comments in src/tlshd/ktls.c
Date: Thu, 25 Sep 2025 21:21:57 -0400
Message-ID: <20250926012207.3642990-9-cel@kernel.org>
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

Convert existing comments in ktls.c to what a normal user space
Doxygen run expects to see. This will enable deployment of an
automatically-generated documentation web site.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/ktls.c | 118 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 102 insertions(+), 16 deletions(-)

diff --git a/src/tlshd/ktls.c b/src/tlshd/ktls.c
index 50381bf3fd4b..810460ada721 100644
--- a/src/tlshd/ktls.c
+++ b/src/tlshd/ktls.c
@@ -1,9 +1,13 @@
-/*
- * Initialize a kTLS socket. In some cases initialization might
- * be handled by the TLS library.
+/**
+ * @file ktls.c
+ * @brief Initialize a kTLS socket. In some cases initialization might
+ *	  be handled by the TLS library
  *
+ * @copyright
  * Copyright (c) 2022 Oracle and/or its affiliates.
- *
+ */
+
+/*
  * ktls-utils is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
  * published by the Free Software Foundation; version 2.
@@ -42,6 +46,13 @@
 #include "tlshd.h"
 #include "netlink.h"
 
+/**
+ * @brief Concatenate two NUL-terminated C strings
+ * @param[in]     str1  left-hand string
+ * @param[in]     str2  right-hand string
+ *
+ * @returns "str1" followed by "str2"
+ */
 static char *tlshd_string_concat(char *str1, const char *str2)
 {
 	size_t len = 0;
@@ -69,6 +80,14 @@ static char *tlshd_string_concat(char *str1, const char *str2)
 }
 
 #ifdef HAVE_GNUTLS_TRANSPORT_IS_KTLS_ENABLED
+/**
+ * @brief Determine if a session is kTLS-enabled
+ * @param[in]     session  An established TLS session
+ * @param[in]     read     Which side of the duplex to check
+ *
+ * @retval  true   The session is prepared to use kTLS
+ * @retval  false  The session is not prepared to use kTLS
+ */
 static bool tlshd_is_ktls_enabled(gnutls_session_t session, unsigned read)
 {
 	int ret;
@@ -90,6 +109,14 @@ static bool tlshd_is_ktls_enabled(gnutls_session_t session, unsigned read)
 }
 
 #else
+/**
+ * @brief Determine if a session is kTLS-enabled
+ * @param[in]     session  An established TLS session
+ * @param[in]     read     Which side of the duplex to check
+ *
+ * @retval  true   The session is prepared to use kTLS
+ * @retval  false  The session is not prepared to use kTLS
+ */
 static bool tlshd_is_ktls_enabled(__attribute__ ((unused)) gnutls_session_t session,
 				  __attribute__ ((unused)) unsigned read)
 {
@@ -97,6 +124,16 @@ static bool tlshd_is_ktls_enabled(__attribute__ ((unused)) gnutls_session_t sess
 }
 #endif
 
+/**
+ * @brief Call setsockopt(3), with error logging
+ * @param[in]     sock     An open socket descriptor
+ * @param[in]     read     Read or write side
+ * @param[in]     info     The value to set
+ * @param[in]     infolen  The size of "info", in bytes
+ *
+ * @retval  true   The option was set successfully
+ * @retval  false  The option was not set
+ */
 static bool tlshd_setsockopt(int sock, unsigned read, const void *info,
 			     socklen_t infolen)
 {
@@ -123,6 +160,15 @@ static bool tlshd_setsockopt(int sock, unsigned read, const void *info,
 }
 
 #if defined(TLS_CIPHER_AES_GCM_128)
+/**
+ * @brief Configure TLS session for AES-GCM-128 encryption
+ * @param[in]     session  An established TLS session
+ * @param[in]     sock     An open socket descriptor
+ * @param[in]     read     Read or write side
+ *
+ * @retval  true   The session was configured successfully
+ * @retval  false  The session was not configured
+ */
 static bool tlshd_set_aes_gcm128_info(gnutls_session_t session, int sock,
 				      unsigned read)
 {
@@ -162,6 +208,15 @@ static bool tlshd_set_aes_gcm128_info(gnutls_session_t session, int sock,
 #endif
 
 #if defined(TLS_CIPHER_AES_GCM_256)
+/**
+ * @brief Configure TLS session for AES-GCM-256 encryption
+ * @param[in]     session  An established TLS session
+ * @param[in]     sock     An open socket descriptor
+ * @param[in]     read     Read or write side
+ *
+ * @retval  true   The session was configured successfully
+ * @retval  false  The session was not configured
+ */
 static bool tlshd_set_aes_gcm256_info(gnutls_session_t session, int sock,
 				      unsigned read)
 {
@@ -201,6 +256,15 @@ static bool tlshd_set_aes_gcm256_info(gnutls_session_t session, int sock,
 #endif
 
 #if defined(TLS_CIPHER_AES_CCM_128)
+/**
+ * @brief Configure TLS session for AES-CCM-128 encryption
+ * @param[in]     session  An established TLS session
+ * @param[in]     sock     An open socket descriptor
+ * @param[in]     read     Read or write side
+ *
+ * @retval  true   The session was configured successfully
+ * @retval  false  The session was not configured
+ */
 static bool tlshd_set_aes_ccm128_info(gnutls_session_t session, int sock,
 				      unsigned read)
 {
@@ -240,6 +304,15 @@ static bool tlshd_set_aes_ccm128_info(gnutls_session_t session, int sock,
 #endif
 
 #if defined(TLS_CIPHER_CHACHA20_POLY1305)
+/**
+ * @brief Configure TLS session for ChaCha-Poly1305 encryption
+ * @param[in]     session  An established TLS session
+ * @param[in]     sock     An open socket descriptor
+ * @param[in]     read     Read or write side
+ *
+ * @retval  true   The session was configured successfully
+ * @retval  false  The session was not configured
+ */
 static bool tlshd_set_chacha20_poly1305_info(gnutls_session_t session, int sock,
 					     unsigned read)
 {
@@ -275,10 +348,10 @@ static bool tlshd_set_chacha20_poly1305_info(gnutls_session_t session, int sock,
 #endif
 
 /**
- * tlshd_initialize_ktls - Initialize socket for use by kTLS
- * @session: TLS session descriptor
+ * @brief Initialize a socket for use by kTLS
+ * @param[in]     session  TLS session descriptor
  *
- * Returns zero on success, or a positive errno value.
+ * @returns zero on success, or a positive errno value.
  */
 unsigned int tlshd_initialize_ktls(gnutls_session_t session)
 {
@@ -320,6 +393,13 @@ unsigned int tlshd_initialize_ktls(gnutls_session_t session)
 	return EIO;
 }
 
+/**
+ * @brief Concatenate a cipher name to a string
+ * @param[in]     pstring  NUL-terminated C string
+ * @param[in]     cipher   GnuTLS cipher number
+ *
+ * @retval A NUL-terminated C string; caller must free the string with free(3)
+ */
 static char *tlshd_cipher_string_emit(char *pstring, unsigned int cipher)
 {
 	switch (cipher) {
@@ -350,6 +430,13 @@ static gnutls_priority_t	tlshd_gnutls_priority_psk;
 static gnutls_priority_t	tlshd_gnutls_priority_psk_sha256;
 static gnutls_priority_t	tlshd_gnutls_priority_psk_sha384;
 
+/**
+ * @brief Initialize GnuTLS priority caches
+ * @param[in]     ciphers       Array of GnuTLS cipher numbers
+ * @param[in]     cipher_count  count of elements in "ciphers"
+ *
+ * @retval Zero on success; a negative errno if a failure occurred.
+ */
 static int tlshd_gnutls_priority_init_list(const unsigned int *ciphers,
 					   int cipher_count)
 {
@@ -498,9 +585,9 @@ static int tlshd_gnutls_priority_init_list(const unsigned int *ciphers,
 }
 
 /**
- * tlshd_gnutls_priority_init - Initialize GnuTLS priority caches
+ * @brief Initialize GnuTLS priority caches
  *
- * Returns zero on success, or a negative errno value if a failure
+ * @returns zero on success, or a negative errno value if a failure
  * occurred.
  */
 int tlshd_gnutls_priority_init(void)
@@ -532,12 +619,12 @@ out:
 }
 
 /**
- * tlshd_gnutls_priority_set - Initialize priorities per-session
- * @session: session to initialize
- * @parms: handshake parameters
- * @psk_len: size of pre-shared key in bytes, or zero
+ * @brief Select GnuTLS priority cache to use for "session"
+ * @param[in]     session  Session to initialize
+ * @param[in]     parms    Handshake parameters
+ * @param[in]     psk_len  Size of pre-shared key in bytes, or zero
  *
- * Returns GNUTLS_E_SUCCESS on success, otherwise an error code.
+ * @returns GNUTLS_E_SUCCESS on success, otherwise an error code.
  */
 int tlshd_gnutls_priority_set(gnutls_session_t session,
 			      const struct tlshd_handshake_parms *parms,
@@ -558,8 +645,7 @@ int tlshd_gnutls_priority_set(gnutls_session_t session,
 }
 
 /**
- * tlshd_gnutls_priority_deinit - Free GnuTLS priority caches
- *
+ * @brief Free GnuTLS priority caches
  */
 void tlshd_gnutls_priority_deinit(void)
 {
-- 
2.51.0


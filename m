Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CEC186294
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 26 Sep 2025 01:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849733; cv=none; b=InjnZIIty7PAtZwVZwUubRODjvMAmRdPNUqKxBOkqyISi4dpwz1owliQFmdLFskay+qJCnIS46w+2Cko59I6lAsMLEP7q15W5/7qd91cuRhtiWTnGIrARq2xL7lxivdam69473VJuMjrItfC8IWXNw/XcYq4qGjO/grNgB2tyRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849733; c=relaxed/simple;
	bh=oC2FpcPXLTDq/XHTdtx6HRANVd+Rt/HpOeYq92ifYAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvQxDiCKYuVACGPD4lsnD7Gg0Tv/dLtKWbE2gpwKRn8LyEgeRNjFyUn3YDCNCmwVpm95uqsvYK5C3F0UHR47JPQJdqoPpBE6bqXusCFJauy+mLLnhLSI6+lnKyOqNKeTlfpA8rkA2xhDKw+73FcdIfWfTj7A1TuxGv1177dT/CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPiHC9z1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPiHC9z1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3226CC4CEF4;
	Fri, 26 Sep 2025 01:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758849733;
	bh=oC2FpcPXLTDq/XHTdtx6HRANVd+Rt/HpOeYq92ifYAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bPiHC9z1w8mR9txmYZkctRWu+JRhEv9syQKd4JQuIPzPlriUpgBZepFSaMdgP+dVH
	 Aumhv8vlzucPPIVXXOWupyvmwlopzzGGXEfboaBn9nIzowpABo4aFWBAN4slyypqWx
	 ML59ZdN3QtXlPB8BOGaQA/IKOppooVy7RlgJWUWTSuw5T7LkBcQX/76jOtpTNuiX3q
	 6G/fOZJKfOKZaokM3gNPatccwEFnpuoyN3ktIM/HgkRWiIdAmdkgXmFPCyii8Bhpkd
	 buN3IP5kX61ydmjO7lRfOc03GCcfC+1be1ObSFgQYtp0OwubqipmF/fh8ZDbGwvMzj
	 Mm8bNyENNNRXA==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Xin Long <lucien.xin@gmail.com>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH v1 07/16] tlshd: Translate kernel-style Doxygen comments in src/tlshd/keyring.c
Date: Thu, 25 Sep 2025 21:21:56 -0400
Message-ID: <20250926012207.3642990-8-cel@kernel.org>
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

Convert existing comments in keyring.c to what a normal user space
Doxygen run expects to see. This will enable deployment of an
automatically-generated documentation web site.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/keyring.c | 79 +++++++++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 39 deletions(-)

diff --git a/src/tlshd/keyring.c b/src/tlshd/keyring.c
index 32f2d273a7c1..fb2024cad8a1 100644
--- a/src/tlshd/keyring.c
+++ b/src/tlshd/keyring.c
@@ -1,8 +1,12 @@
-/*
- * Scrape authentication information from kernel keyring.
+/**
+ * @file keyring.c
+ * @brief Linux keyring management
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
@@ -40,15 +44,14 @@
 #include "tlshd.h"
 
 /**
- * tlshd_keyring_get_psk_username - Retrieve username for PSK handshake
- * @serial: Key serial number to look up
- * @username: On success, filled in with NUL-terminated user name
+ * @brief Retrieve username for PSK handshake
+ * @param[in]     serial    Key serial number to look up
+ * @param[out]    username  Filled in with NUL-terminated user name
  *
- * Caller must use gnutls_free() to free @username when finished.
+ * Caller must use gnutls_free() to free "username" when finished.
  *
- * Return values:
- *   %true: Success; @username has been initialized
- *   %false: Failure
+ * @retval true  Success; "username" has been initialized
+ * @retval false Failure
  */
 bool tlshd_keyring_get_psk_username(key_serial_t serial, char **username)
 {
@@ -80,15 +83,14 @@ bool tlshd_keyring_get_psk_username(key_serial_t serial, char **username)
 }
 
 /**
- * tlshd_keyring_get_psk_key - Retrieve pre-shared key for PSK handshake
- * @serial: Key serial number to look up
- * @key: On success, filled in with pre-shared key
+ * @brief Retrieve pre-shared key for PSK handshake
+ * @param[in]     serial   Key serial number to look up
+ * @param[out]    key      Filled in with pre-shared key
  *
- * Caller must use free() to free @key->data when finished.
+ * Caller must use free() to free "key->data" when finished.
  *
- * Return values:
- *   %true: Success; @key has been initialized
- *   %false: Failure
+ * @retval true   Success; "key" has been initialized
+ * @retval false  Failure
  */
 bool tlshd_keyring_get_psk_key(key_serial_t serial, gnutls_datum_t *key)
 {
@@ -111,15 +113,14 @@ bool tlshd_keyring_get_psk_key(key_serial_t serial, gnutls_datum_t *key)
 }
 
 /**
- * tlshd_keyring_get_privkey - Retrieve privkey for x.509 handshake
- * @serial: Key serial number to look up
- * @privkey: On success, filled in with a private key
+ * @brief Retrieve privkey for x.509 handshake
+ * @param[in]     serial   Key serial number to look up
+ * @param[out]    privkey  Filled in with a private key
  *
- * Caller must use gnutls_privkey_deinit() to free @privkey when finished.
+ * Caller must use gnutls_privkey_deinit() to free "privkey" when finished.
  *
- * Return values:
- *   %true: Success; @privkey has been initialized
- *   %false: Failure
+ * @retval true   Success; "privkey" has been initialized
+ * @retval false  Failure
  */
 bool tlshd_keyring_get_privkey(key_serial_t serial, gnutls_privkey_t *privkey)
 {
@@ -157,16 +158,15 @@ bool tlshd_keyring_get_privkey(key_serial_t serial, gnutls_privkey_t *privkey)
 }
 
 /**
- * tlshd_keyring_get_certs - Retrieve certs for x.509 handshake
- * @serial: Key serial number to look up
- * @certs: On success, filled in with certificates
- * @certs_len: IN: maximum number of certs to get, OUT: number of certs found
+ * @brief Retrieve certs for x.509 handshake
+ * @param[in]     serial     Key serial number to look up
+ * @param[out]    certs      On success, filled in with certificates
+ * @param[in,out] certs_len  Maximum number of certs to get, number of certs found
  *
- * Caller must use gnutls_pcert_deinit() to free @cert when finished.
+ * Caller must use gnutls_pcert_deinit() to free "cert" when finished.
  *
- * Return values:
- *   %true: Success; @cert has been initialized
- *   %false: Failure
+ * @retval true   Success; "cert" has been initialized
+ * @retval false  Failure
  */
 bool tlshd_keyring_get_certs(key_serial_t serial, gnutls_pcert_st *certs,
 			     unsigned int *certs_len)
@@ -205,11 +205,11 @@ bool tlshd_keyring_get_certs(key_serial_t serial, gnutls_pcert_st *certs,
 }
 
 /**
- * tlshd_keyring_create_cert - Create key containing peer's certificate
- * @cert: Initialized x.509 certificate
- * @peername: hostname of the remote peer
+ * @brief Create key containing peer's certificate
+ * @param[in]     cert      Initialized x.509 certificate
+ * @param[in]     peername  Hostname of the remote peer
  *
- * Returns a positive key serial number on success; otherwise
+ * @returns a positive key serial number on success; otherwise
  * TLS_NO_PEERID.
  */
 key_serial_t tlshd_keyring_create_cert(gnutls_x509_crt_t cert,
@@ -246,10 +246,11 @@ out:
 }
 
 /**
- * tlshd_keyring_link_session - Link a keyring into the session keyring
- * @keyring: keyring to be linked
+ * @brief Link a keyring into the session keyring
+ * @param[in]     keyring  keyring to be linked
  *
- * Returns 0 on success and -1 on error.
+ * @retval 0   Success
+ * @retval -1  Failure
  */
 int tlshd_keyring_link_session(const char *keyring)
 {
-- 
2.51.0


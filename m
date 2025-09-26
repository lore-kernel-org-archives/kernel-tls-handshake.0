Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC172186294
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 26 Sep 2025 01:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849732; cv=none; b=PhDaS6fJEB1+QftDq6XzZRrzu1+gG6SM2/nSLpWwtgjiturWCGnB44No+5SEq2fedIY/aPUWArMx9dKjJk5iCJYs85wBMwLr3t4R1FnYxUMGi655RG2DaEMCOSXAQOBGkd2CUCpwnqC4Y3D/+7e/1d+1VE9kRGMJKFlGTdavwrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849732; c=relaxed/simple;
	bh=wbcr+jIS8G/PA1+lGPOLvYncxi9/VFElNQXZlkFF+wY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UAjRwmNazt4TMyV9x/D71kVig2E6S0xWuaLIj9YZU3YjpkQvVEr3pwyYSAPbk7smUxU+E9b+BP+bcOMcWXKDBgQB01cC1cq2cluRwTeBL7W4mVt8AyF3K0RLyiticUkEiQy2MzHemiyJqDoCUwUFhmiey5eMw3CGMWd0vBikfl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYlC+Gx8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYlC+Gx8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34214C4CEF4;
	Fri, 26 Sep 2025 01:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758849732;
	bh=wbcr+jIS8G/PA1+lGPOLvYncxi9/VFElNQXZlkFF+wY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WYlC+Gx8F/DX2nijnYLm5fd88yIwfpdWvAxqwaD3x9aCL2F/AAZXt796XBvgn64KM
	 9gDwSmJ1KiMsP7UkLFoIQJzHsH5sNVa3EPFdm2kTLn9/HIMVgZeJbZxTzUo0t+Y5lG
	 5r15uYax2/u8zskWo9v1DDY4n2DmLJxf7Jp8H27QdyktZ8smTQDmg3idz910/GhOpY
	 XCyHbrmxMelO0UvaEBz3h+vV+PcrK5yhPdwA8HPjP9BEX+3v8LpJb/juVR9pLAcVOr
	 0eP3vD7OsuP+fRZQeuQ50uwMHdJEEurBeL0KlvN7t78zZ77JLGVWAWU0CmcqFrvU/g
	 rLLV09DjYAEsg==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Xin Long <lucien.xin@gmail.com>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH v1 05/16] tlshd: Translate kernel-style Doxygen comments in src/tlshd/config.c
Date: Thu, 25 Sep 2025 21:21:54 -0400
Message-ID: <20250926012207.3642990-6-cel@kernel.org>
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

Convert existing comments in config.c to what a normal user space
Doxygen run expects to see. This will enable deployment of an
automatically-generated documentation web site.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/config.c | 152 ++++++++++++++++++++++++++-------------------
 1 file changed, 88 insertions(+), 64 deletions(-)

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index bf57df17f48c..1afe1ff9bca0 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -1,6 +1,10 @@
+/**
+ * @file config.c
+ * @brief Parse tlshd's config file
+ */
+
 /*
- * Parse tlshd's config file.
- *
+ * @copyright
  * Copyright (c) 2022 Oracle and/or its affiliates.
  *
  * ktls-utils is free software; you can redistribute it and/or
@@ -44,16 +48,20 @@
 
 #include "tlshd.h"
 
+/**
+ * @var GKeyFile *tlshd_configuration
+ * In-memory parsed config file
+ */
 static GKeyFile *tlshd_configuration;
 
 /**
- * tlshd_config_init - Read tlshd's config file
- * @pathname: Pathname to config file
- * @legacy: Don't generate an error if the config file doesn't exist
+ * @brief Parse tlshd's config file
+ * @param[in]    pathname  Pathname to config file
+ * @param[in]    legacy    Don't generate an error if the specified
+ *			   config file doesn't exist
  *
- * Return values:
- *   %true: Config file read successfully
- *   %false: Unable to read config file
+ * @retval true   Config file parsed successfully
+ * @retval false  Unable to read config file
  */
 bool tlshd_config_init(const gchar *pathname, bool legacy)
 {
@@ -111,26 +119,49 @@ bool tlshd_config_init(const gchar *pathname, bool legacy)
 	return true;
 }
 
+/**
+ * @brief Release parsed config file data
+ */
 void tlshd_config_shutdown(void)
 {
 	g_key_file_free(tlshd_configuration);
 }
 
 /**
- * ALLPERMS exists in glibc, but not on musl, so we manually
- * define TLSHD_ACCESSPERMS instead of using ALLPERMS.
+ * @def TLSHD_ACCESSPERMS
+ * @brief ALLPERMS exists in glibc, but not on musl, so we manually
+ *	  define TLSHD_ACCESSPERMS instead of using ALLPERMS.
  */
 #define TLSHD_ACCESSPERMS	(S_IRWXU|S_IRWXG|S_IRWXO)
 
-/*
- * Expected file attributes
+/**
+ * @def TLSHD_OWNER
+ * @brief Expected owner of certificate and private key files
  */
 #define TLSHD_OWNER		0	/* root */
+
+/**
+ * @def TLSHD_CERT_MODE
+ * @brief Expected mode of certificate files
+ */
 #define TLSHD_CERT_MODE		(S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)
+
+/**
+ * @def TLSHD_PRIVKEY_MODE
+ * @brief Expected mode of private key files
+ */
 #define TLSHD_PRIVKEY_MODE	(S_IRUSR|S_IWUSR)
 
-/*
- * On success, caller must release buffer returned in @data by calling free(3)
+/**
+ * @brief Read one configuration file
+ * @param[in]    pathname  Pathname to file that is to be read
+ * @param[out]   data      Buffer containing all file content
+ * @param[in]    owner     Expected owner of file
+ * @param[in]    mode      Expected mode of file
+ *
+ * @retval true   File content retrieved successfully. Caller must
+ *		  release "data->data" by calling free(3)
+ * @retval false  File content not retrieved
  */
 static bool tlshd_config_read_datum(const char *pathname, gnutls_datum_t *data,
 				    uid_t owner, mode_t mode)
@@ -189,13 +220,13 @@ out:
 }
 
 /**
- * tlshd_config_get_truststore - Get truststore for {Client,Server}Hello from .conf
- * @peer_type: IN: peer type
- * @bundle: OUT: pathname to truststore
+ * @brief Get truststore to use for {Client,Server}Hello
+ * @param[in]     peer_type  peer type
+ * @param[out]    bundle     pathname to truststore
  *
- * Return values:
- *   %false: pathname not retrieved
- *   %true: pathname retrieved successfully; caller must free @bundle using free(3)
+ * @retval true   Trust store retrieved successfully. Caller must free
+ *		  "*bundle" using free(3)
+ * @retval false  Trust store not retrieved
  */
 bool tlshd_config_get_truststore(int peer_type, char **bundle)
 {
@@ -226,13 +257,13 @@ bool tlshd_config_get_truststore(int peer_type, char **bundle)
 }
 
 /**
- * tlshd_config_get_crl - Get CRL for {Client,Server}Hello from .conf
- * @peer_type: IN: peer type
- * @result: OUT: pathname to CRL
+ * @brief Get CRL for {Client,Server}Hello from .conf
+ * @param[in]     peer_type  peer type
+ * @param[out]    result     pathname to CRL
  *
- * Return values:
- *   %false: pathname not retrieved
- *   %true: pathname retrieved successfully; caller must free @result using free(3)
+ * @retval true   CRL retrieved successfully. Caller must free
+ *		  "*result" using free(3)
+ * @retval false  CRL not retrieved
  */
 bool tlshd_config_get_crl(int peer_type, char **result)
 {
@@ -308,16 +339,14 @@ static bool tlshd_cert_check_pk_alg(__attribute__ ((unused)) gnutls_datum_t *dat
 #endif /* HAVE_GNUTLS_MLDSA */
 
 /**
- * __tlshd_config_get_certs - Helper for tlshd_config_get_certs()
- * @peer_type: IN: peer type
- * @certs: OUT: in-memory certificates
- * @certs_len: IN: maximum number of certs to get, OUT: number of certs found
- * @pkgalg: IN: if non-NULL, indicates we want to retrieve the PQ cert,
- *	 OUT: if non-NULL, store the PQ public-key alg that was used in the PQ cert
+ * @brief Helper for tlshd_config_get_certs()
+ * @param[in]      peer_type  peer type
+ * @param[out]     certs      in-memory certificates
+ * @param[in,out]  certs_len  maximum number of certs to get, number of certs found
+ * @param[out]     pkalg      buffer for returning PQ algorithm
  *
- * Return values:
- *   %true: certificate retrieved successfully
- *   %false: certificate not retrieved
+ * @retval true   Certificate(s) retrieved successfully
+ * @retval false  Certificate(s) not retrieved
  */
 static bool __tlshd_config_get_certs(int peer_type, gnutls_pcert_st *certs,
 				     unsigned int *certs_len,
@@ -372,21 +401,20 @@ static bool __tlshd_config_get_certs(int peer_type, gnutls_pcert_st *certs,
 }
 
 /**
- * tlshd_config_get_certs - Get certs for {Client,Server} Hello from .conf
- * @peer_type: IN: peer type
- * @certs: OUT: in-memory certificates
- * @pq_certs_len: IN: maximum number of PQ certs to get, OUT: number of PQ certs found
- * @certs_len: IN: maximum number of certs to get, OUT: number of certs found
- * @pkgalg: OUT: the PQ public-key alg that was used in the PQ cert
+ * @brief Get certs for {Client,Server} Hello
+ * @param[in]      peer_type     peer type
+ * @param[out]     certs         in-memory certificates
+ * @param[in,out]  pq_certs_len  maximum number of PQ certs to get, number of PQ certs found
+ * @param[in,out]  certs_len     maximum number of certs to get, number of certs found
+ * @param[out]     pkalg         the PQ public-key alg that was used in the PQ cert
  *
- * Retrieve the PQ cert(s) first, then the RSA cert(s).  Both are stored in the
- * same list.  Note that @pq_certs_len is deducted from the available @certs_len
- * and is also used to determine the offset to store the RSA cert(s) in the
- * @certs array.
+ * Retrieve the PQ cert(s) first, then the RSA cert(s).  Both are
+ * stored in the same list.  Note that "pq_certs_len" is deducted
+ * from the available "certs_len" and is also used to determine
+ * the offset to store the RSA cert(s) in the "certs array".
  *
- * Return values:
- *   %true: certificate retrieved successfully
- *   %false: certificate not retrieved
+ * @retval true   Certificate(s) retrieved successfully
+ * @retval false  Certificate(s) not retrieved
  */
 bool tlshd_config_get_certs(int peer_type, gnutls_pcert_st *certs,
 			    unsigned int *pq_certs_len,
@@ -407,14 +435,13 @@ bool tlshd_config_get_certs(int peer_type, gnutls_pcert_st *certs,
 }
 
 /**
- * __tlshd_config_get_privkey - Helper for tlshd_config_get_privkey()
- * @peer_type: IN: peer type
- * @privkey: OUT: in-memory private key
- * @pq: IN: if true, retrieve the PQ private key
+ * @brief Helper for tlshd_config_get_privkey()
+ * @param[in]      peer_type  peer type
+ * @param[out]     privkey    in-memory private key
+ * @param[in]      pq         if true, retrieve the PQ private key
  *
- * Return values:
- *   %true: private key retrieved successfully
- *   %false: private key not retrieved
+ * @retval true   Private key retrieved successfully
+ * @retval false  Private key not retrieved
  */
 static bool __tlshd_config_get_privkey(int peer_type, gnutls_privkey_t *privkey, bool pq)
 {
@@ -463,16 +490,13 @@ static bool __tlshd_config_get_privkey(int peer_type, gnutls_privkey_t *privkey,
 }
 
 /**
- * tlshd_config_get_privkey - Get private key for {Client,Server}Hello from .conf
- * @peer_type: IN: peer type
- * @pq_privkey: OUT: in-memory PQ private key
- * @privkey: OUT: in-memory private key
+ * @brief Get private key for {Client,Server}Hello
+ * @param[in]      peer_type   peer type
+ * @param[out]     pq_privkey  in-memory PQ private key
+ * @param[out]     privkey     in-memory private key
  *
- * Retrieve the PQ private key first, then the RSA private key.
- *
- * Return values:
- *   %true: private key retrieved successfully
- *   %false: private key not retrieved
+ * @retval true   Private key retrieved successfully
+ * @retval false  Private key not retrieved
  */
 bool tlshd_config_get_privkey(int peer_type, gnutls_privkey_t *pq_privkey,
 			      gnutls_privkey_t *privkey)
-- 
2.51.0


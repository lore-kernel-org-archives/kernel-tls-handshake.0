Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91190186294
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 26 Sep 2025 01:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849734; cv=none; b=t5zIt+bzkfd+RlUgp7Rn3PBSSoFo9lfJuRJQzrK2iGlqrQQDeMDmmfFykO7J986ebrM4NbqmR9js8JQKJz0GDhgeu7/8GuigF1yoCDV14HjTkOfQkyP1K0tuTKrqffm0/z0ZRAiePwnAth31J1bf1YY5kOWQHaqaHYjnUc83UYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849734; c=relaxed/simple;
	bh=tTr56Z28GpLRkJO3uro208Y/LxT6PgghftTpGINR4u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qWhUJxvNZvTitrnJasiroLhoA4gBY4gGCgTk8ZfbMqJrN5EJE6bZGbXmcGeZxel0E/i445kkOt0kNcKUdnAwc/zwHBN0veNvUxxquG4tcg5tsnkmfB01iYTEpGCmckLQant4gHJ6NHQ9cK1/5wCCoqTl2N2m6BeaUOeYj9u8uk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8uVPPBn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8uVPPBn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322D7C113D0;
	Fri, 26 Sep 2025 01:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758849734;
	bh=tTr56Z28GpLRkJO3uro208Y/LxT6PgghftTpGINR4u8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y8uVPPBnTcPB+y5rw08390fFY7aHrfdN9C0QR8ivpgIyzaiG1250cp/fezqstV3zW
	 x+4NUX3I5+v4IzV6yNQFVwp3KbK8i5a4pBh/sMP8qD3sfnX32AJ5LQLh/USuPRP5qY
	 n1mLLHE5J7FjjrqFYHIO7V1ze5Qy2SliG+5AD/m69xMlQ4+i6zu5b3NijxtgneLWmb
	 zo7y7b1XToHY3eV93SGOAgkEQ4EIJpTt6Ug82PV0zV5A7NItxNJ/Lf0ZU/YFrIpoJ+
	 gogq46UAidl4Z7FxKpp90nQ8frh8GiGF64AWTMuc3kAu1LBTwjE15Gb32xPT6JePeJ
	 r9Kt5NlocNN0A==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Xin Long <lucien.xin@gmail.com>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH v1 09/16] tlshd: Translate kernel-style Doxygen comments in src/tlshd/log.c
Date: Thu, 25 Sep 2025 21:21:58 -0400
Message-ID: <20250926012207.3642990-10-cel@kernel.org>
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

Convert existing comments in log.c to what a normal user space
Doxygen run expects to see. This will enable deployment of an
automatically-generated documentation web site.
---
 src/tlshd/log.c | 102 +++++++++++++++++++++++++-----------------------
 1 file changed, 53 insertions(+), 49 deletions(-)

diff --git a/src/tlshd/log.c b/src/tlshd/log.c
index ad39d3642f62..b70d4af15bec 100644
--- a/src/tlshd/log.c
+++ b/src/tlshd/log.c
@@ -1,8 +1,12 @@
-/*
- * Record audit and debugging information in the system log.
+/**
+ * @file log.c
+ * @brief Record audit and debugging information in the system log
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
@@ -40,14 +44,27 @@
 
 #include "tlshd.h"
 
+/**
+ * @var int tlshd_debug
+ * Global debug verbosity setting
+ */
 int tlshd_debug;
+
+/**
+ * @var int tlshd_tls_debug
+ * Global debug verbosity setting for TLS library calls
+ */
 int tlshd_tls_debug;
+
+/**
+ * @var int tlshd_stderr
+ * Global setting to output on stderr as well as syslog
+ */
 int tlshd_stderr;
 
 /**
- * tlshd_log_completion - Emit completion notification
- * @parms: handshake parameters
- *
+ * @brief Emit completion notification
+ * @param[in]     parms  Handshake parameters
  */
 void tlshd_log_completion(struct tlshd_handshake_parms *parms)
 {
@@ -69,9 +86,8 @@ void tlshd_log_completion(struct tlshd_handshake_parms *parms)
 }
 
 /**
- * tlshd_log_debug - Emit a debugging notification
- * @fmt - printf-style format string
- *
+ * @brief Emit a debugging notification
+ * @param[in]     fmt  printf-style format string
  */
 void tlshd_log_debug(const char *fmt, ...)
 {
@@ -86,9 +102,8 @@ void tlshd_log_debug(const char *fmt, ...)
 }
 
 /**
- * tlshd_log_error - Emit a generic error notification
- * @fmt - printf-style format string
- *
+ * @brief Emit a generic error notification
+ * @param[in]     fmt  printf-style format string
  */
 void tlshd_log_error(const char *fmt, ...)
 {
@@ -100,9 +115,8 @@ void tlshd_log_error(const char *fmt, ...)
 }
 
 /**
- * tlshd_log_notice - Emit a generic warning
- * @fmt - printf-style format string
- *
+ * @brief Emit a generic warning
+ * @param[in]     fmt  printf-style format string
  */
 void tlshd_log_notice(const char *fmt, ...)
 {
@@ -114,9 +128,8 @@ void tlshd_log_notice(const char *fmt, ...)
 }
 
 /**
- * tlshd_log_perror - Emit "system call failed" notification
- * @sap: remote address to log
- *
+ * @brief Emit "system call failed" notification
+ * @param[in]     prefix  Identifier string
  */
 void tlshd_log_perror(const char *prefix)
 {
@@ -124,9 +137,8 @@ void tlshd_log_perror(const char *prefix)
 }
 
 /**
- * tlshd_log_gai_error - Emit "getaddr/nameinfo failed" notification
- * @error: error code returned by getaddrinfo(3) or getnameinfo(3)
- *
+ * @brief Emit "getaddr/nameinfo failed" notification
+ * @param[in]      error  error code returned by getaddrinfo(3) or getnameinfo(3)
  */
 void tlshd_log_gai_error(int error)
 {
@@ -160,9 +172,8 @@ static const struct tlshd_cert_status_bit tlshd_cert_status_names[] = {
 };
 
 /**
- * tlshd_log_cert_verification_error - Report a failed certificate verification
- * @session: Session with a failed handshake
- *
+ * @brief Report a failed certificate verification
+ * @param[in]     session  Session with a failed handshake
  */
 void tlshd_log_cert_verification_error(gnutls_session_t session)
 {
@@ -178,9 +189,8 @@ void tlshd_log_cert_verification_error(gnutls_session_t session)
 }
 
 /**
- * tlshd_log_gnutls_error - Emit "library call failed" notification
- * @error: GnuTLS error code to log
- *
+ * @brief Emit "library call failed" notification
+ * @param[in]     error  GnuTLS error code to log
  */
 void tlshd_log_gnutls_error(int error)
 {
@@ -188,10 +198,9 @@ void tlshd_log_gnutls_error(int error)
 }
 
 /**
- * tlshd_gnutls_log_func - Library callback function to log a message
- * @level: log level
- * @msg: message to log
- *
+ * @brief Library callback function to log a message
+ * @param[in]     level  Log level
+ * @param[in]     msg    Message to log
  */
 void tlshd_gnutls_log_func(int level, const char *msg)
 {
@@ -199,10 +208,9 @@ void tlshd_gnutls_log_func(int level, const char *msg)
 }
 
 /**
- * tlshd_gnutls_audit_func - Library callback function to log an audit message
- * @session: controlling GnuTLS session
- * @msg: message to log
- *
+ * @brief Library callback function to log an audit message
+ * @param[in]     session  Controlling GnuTLS session
+ * @param[in]     msg      Message to log
  */
 void tlshd_gnutls_audit_func(__attribute__ ((unused)) gnutls_session_t session,
 			     const char *msg)
@@ -211,10 +219,9 @@ void tlshd_gnutls_audit_func(__attribute__ ((unused)) gnutls_session_t session,
 }
 
 /**
- * tlshd_log_gerror - Emit glib2 "library call failed" notification
- * @msg: message to log
- * @error: error information
- *
+ * @brief Emit glib2 "library call failed" notification
+ * @param[in]     msg    Message to log
+ * @param[in]     error  Error information
  */
 void tlshd_log_gerror(const char *msg, GError *error)
 {
@@ -222,10 +229,9 @@ void tlshd_log_gerror(const char *msg, GError *error)
 }
 
 /**
- * tlshd_log_nl_error - Log a netlink error
- * @msg: message to log
- * @err: error number
- *
+ * @brief Log a netlink error
+ * @param[in]     msg  Message to log
+ * @param[in]     err  Error number
  */
 void tlshd_log_nl_error(const char *msg, int err)
 {
@@ -233,8 +239,8 @@ void tlshd_log_nl_error(const char *msg, int err)
 }
 
 /**
- * tlshd_log_init - Initialize audit logging
- * @progname: NUL-terminated string containing program name
+ * @brief Initialize audit logging
+ * @param[in]     progname  NUL-terminated string containing program name
  *
  */
 void tlshd_log_init(const char *progname)
@@ -250,8 +256,7 @@ void tlshd_log_init(const char *progname)
 }
 
 /**
- * tlshd_log_shutdown - Log a tlshd shutdown notice
- *
+ * @brief Log a tlshd shutdown notice
  */
 void tlshd_log_shutdown(void)
 {
@@ -259,8 +264,7 @@ void tlshd_log_shutdown(void)
 }
 
 /**
- * tlshd_log_close - Release audit logging resources
- *
+ * @brief Release audit logging resources
  */
 void tlshd_log_close(void)
 {
-- 
2.51.0


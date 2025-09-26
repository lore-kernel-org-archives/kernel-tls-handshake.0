Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885741632DD
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 26 Sep 2025 01:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849735; cv=none; b=BHbYc8fMZ/++o96TDmfbjejq2Mmi2mwxynR7OSS2SACECRXBlbohzfM/YrXNydXq05bh2rZ8xrd+HffalDZgdjs9O/boaasY5FK2aCM1IzrtV5mqkSlZzh4Qq+7Ftx2cgcyyLov1j23M1rZaSkb6L5BNIALgIX3hFCHXfBaGB7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849735; c=relaxed/simple;
	bh=/HDjx5lrmnkkASlzPbCMLHaqvL3ERXqxG8aQyeruWgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BMRffs8XhjuXuwxsKiZiIi5zzWvC++NhJEaBf+NRqYeFCJ8kYfwYp/7A6K5niEcics8xrRzrKcwL3ubWMAs1MZ2DuRh+1LjcOKoVoPYFViis5UFuJfJbyzQgCS6A+TXC32K7YMRBeO0sqSE7RKqWOTiOP5Fg/F7DX6qim5OgQ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQjNYe0T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQjNYe0T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1F1C4CEF0;
	Fri, 26 Sep 2025 01:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758849735;
	bh=/HDjx5lrmnkkASlzPbCMLHaqvL3ERXqxG8aQyeruWgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MQjNYe0T7Q0zNrs1mLMwY5549wnicJFOUtob5/cZIm6BKNqQ88YgpQM9CMF9ddp/Q
	 XN2COA5wteblE0QsCN8zHoWUd8MqqwgoE1dA+4MxA3oBhPdaio/djg/R4oowE4V19M
	 oqnHiW1LoCKDf4Xbo9zIwDuSR5L72LBCf0zIi2ZT5AlJIlh5PAT9dGs+7U/W7pj00d
	 qsj8l6Bf54wko3CXjKceNgDee2UbpKKp5T2Oy6m9p7kAfwmsesDcIJHaIqzaHyQ8uq
	 jDq1dn6t2bMEtGR+r0xFyRG5amuT0Ldc5uTKtN8aczUS3pKZQU+f/AAJfgqKhWBeI9
	 vby2Tw2kobjJw==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Xin Long <lucien.xin@gmail.com>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH v1 11/16] tlshd: Translate kernel-style Doxygen comments in src/tlshd/netlink.c
Date: Thu, 25 Sep 2025 21:22:00 -0400
Message-ID: <20250926012207.3642990-12-cel@kernel.org>
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

Convert existing comments in netlink.c to what a normal user space
Doxygen run expects to see. This will enable deployment of an
automatically-generated documentation web site.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/netlink.c | 110 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 95 insertions(+), 15 deletions(-)

diff --git a/src/tlshd/netlink.c b/src/tlshd/netlink.c
index e59c94581494..25ade9482a8b 100644
--- a/src/tlshd/netlink.c
+++ b/src/tlshd/netlink.c
@@ -1,8 +1,12 @@
-/*
- * Netlink operations for tlshd
+/**
+ * @file netlink.c
+ * @brief Handle communication with the kernel via netlink
  *
+ * @copyright
  * Copyright (c) 2023 Oracle and/or its affiliates.
- *
+ */
+
+/*
  * ktls-utils is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
  * published by the Free Software Foundation; version 2.
@@ -51,8 +55,20 @@
 #include "tlshd.h"
 #include "netlink.h"
 
+/**
+ * @var unsigned int tlshd_delay_done
+ * Global number of seconds to delay each handshake completion
+ */
 unsigned int tlshd_delay_done;
 
+/**
+ * @brief Open a netlink socket
+ * @param [out]    sock  A netlink socket descriptor
+ *
+ * @retval  0        Success; caller must close "sock" with tlshd_genl_sock_close
+ * @retval  ENOMEM   Failed to allocate the socket
+ * @retval  ENOLINK  Failed to connect to the netlink service
+ */
 static int tlshd_genl_sock_open(struct nl_sock **sock)
 {
 	struct nl_sock *nls;
@@ -79,6 +95,10 @@ out:
 	return ret;
 }
 
+/**
+ * @brief Close a netlink socket
+ * @param[in]     nls  A netlink socket descriptor
+ */
 static void tlshd_genl_sock_close(struct nl_sock *nls)
 {
 	if (!nls)
@@ -88,6 +108,10 @@ static void tlshd_genl_sock_close(struct nl_sock *nls)
 	nl_socket_free(nls);
 }
 
+/**
+ * @var struct nla_policy tlshd_accept_nl_policy
+ * Netlink policies for ACCEPT arguments
+ */
 #if LIBNL_VER_NUM >= LIBNL_VER(3,5)
 static const struct nla_policy
 #else
@@ -105,11 +129,33 @@ tlshd_accept_nl_policy[HANDSHAKE_A_ACCEPT_MAX + 1] = {
 	[HANDSHAKE_A_ACCEPT_KEYRING]		= { .type = NLA_U32, },
 };
 
+/**
+ * @var struct nl_sock *tlshd_notification_nls
+ * Netlink socket on which notification events arrive
+ */
 static struct nl_sock *tlshd_notification_nls;
 
+/**
+ * @var sigset_t tlshd_sig_poll_mask
+ * Daemon's signal poll mask
+ */
 static sigset_t tlshd_sig_poll_mask;
+
+/**
+ * @var int tlshd_sig_poll_fd
+ * Daemon's signal poll file descriptor
+ */
 static int tlshd_sig_poll_fd;
 
+/**
+ * @brief Process one netlink notification event
+ * @param[in]     msg  A netlink event to be handled
+ * @param[in]     arg  Additional arguments
+ *
+ * @retval NL_OK    Proceed with the next message
+ * @retval NL_SKIP  Skip this message.
+ * @retval NL_STOP  Stop and discard remaining messages.
+ */
 static int tlshd_genl_event_handler(struct nl_msg *msg,
 				    __attribute__ ((unused)) void *arg)
 {
@@ -148,8 +194,7 @@ static int tlshd_genl_event_handler(struct nl_msg *msg,
 }
 
 /**
- * tlshd_genl_dispatch - handle notification events
- *
+ * @brief Handle notification events
  */
 void tlshd_genl_dispatch(void)
 {
@@ -231,6 +276,11 @@ out_close:
 	tlshd_genl_sock_close(tlshd_notification_nls);
 }
 
+/**
+ * @brief Extract the key serial number of the key with the remote peerid
+ * @param[in]     parms  Handshake parameters
+ * @param[in]     head   List of nlattrs to parse
+ */
 static void tlshd_parse_peer_identity(struct tlshd_handshake_parms *parms,
 				      struct nlattr *head)
 {
@@ -245,6 +295,10 @@ static void tlshd_parse_peer_identity(struct tlshd_handshake_parms *parms,
 	g_array_append_val(parms->peerids, peerid);
 }
 
+/**
+ * @var struct nla_policy tlshd_x509_nl_policy
+ * Netlink policies for x.509 key serial numbers
+ */
 #if LIBNL_VER_NUM >= LIBNL_VER(3,5)
 static const struct nla_policy
 #else
@@ -255,6 +309,11 @@ tlshd_x509_nl_policy[HANDSHAKE_A_X509_MAX + 1] = {
 	[HANDSHAKE_A_X509_PRIVKEY]	= { .type = NLA_U32, },
 };
 
+/**
+ * @brief Extract the key serial number of the key with the cert / privkey
+ * @param[in]     parms  Handshake parameters
+ * @param[in]     head   List of nlattrs to parse
+ */
 static void tlshd_parse_certificate(struct tlshd_handshake_parms *parms,
 				     struct nlattr *head)
 {
@@ -277,6 +336,15 @@ static void tlshd_parse_certificate(struct tlshd_handshake_parms *parms,
 		parms->x509_privkey = nla_get_s32(tb[HANDSHAKE_A_X509_PRIVKEY]);
 }
 
+/**
+ * @brief Process an ACCESS argument
+ * @param[in]     msg  Message to be processed
+ * @param[out]    arg  Handshake parms to be filled in
+ *
+ * @retval NL_OK    Proceed with the next message
+ * @retval NL_SKIP  Skip this message.
+ * @retval NL_STOP  Stop and discard remaining messages.
+ */
 static int tlshd_genl_valid_handler(struct nl_msg *msg, void *arg)
 {
 	struct nlattr *tb[HANDSHAKE_A_ACCEPT_MAX + 1];
@@ -363,6 +431,10 @@ static int tlshd_genl_valid_handler(struct nl_msg *msg, void *arg)
 	return NL_SKIP;
 }
 
+/**
+ * @var struct tlshd_handshake_parms tlshd_default_handshake_parms
+ * Starting parameter values for each handshake
+ */
 static const struct tlshd_handshake_parms tlshd_default_handshake_parms = {
 	.peername		= NULL,
 	.peeraddr		= NULL,
@@ -379,13 +451,15 @@ static const struct tlshd_handshake_parms tlshd_default_handshake_parms = {
 };
 
 /**
- * tlshd_genl_get_handshake_parms - Retrieve handshake parameters
- * @parms: buffer to fill in with parameters
+ * @brief Retrieve handshake parameters
+ * @param[in]     parms  Buffer to fill in with parameters
  *
- * Returns 0 if handshake parameters were retrieved successfully.
+ * Caller must release handshake resources by calling
+ * tlshd_genl_put_handshake_parms when finished.
  *
+ * @returns 0 if handshake parameters were retrieved successfully.
  * Otherwise a positive errno is returned, and the content of
- * @parms is indeterminant.
+ * "parms" is indeterminant.
  */
 int tlshd_genl_get_handshake_parms(struct tlshd_handshake_parms *parms)
 {
@@ -460,9 +534,8 @@ out_close:
 }
 
 /**
- * tlshd_genl_put_handshake_parms - Release handshake resources
- * @parms: handshake parameters to be released
- *
+ * @brief Release handshake resources
+ * @param[in]     parms  Handshake parameters to be released
  */
 void tlshd_genl_put_handshake_parms(struct tlshd_handshake_parms *parms)
 {
@@ -474,6 +547,14 @@ void tlshd_genl_put_handshake_parms(struct tlshd_handshake_parms *parms)
 	free(parms->peeraddr);
 }
 
+/**
+ * @brief Format all remote peerid arguments
+ * @param[in]     msg
+ * @param[in]     parms  Handshake parameters
+ *
+ * retval 0   Formatted all remote peerid arguments successfully
+ * retval -1  Failed to format
+ */
 static int tlshd_genl_put_remote_peerids(struct nl_msg *msg,
 					 struct tlshd_handshake_parms *parms)
 {
@@ -494,9 +575,8 @@ static int tlshd_genl_put_remote_peerids(struct nl_msg *msg,
 }
 
 /**
- * tlshd_genl_done - Indicate handshake has completed successfully
- * @parms: buffer filled in with parameters
- *
+ * @brief Indicate handshake has completed successfully
+ * @param[in]     parms  Buffer filled in with parameters
  */
 void tlshd_genl_done(struct tlshd_handshake_parms *parms)
 {
-- 
2.51.0


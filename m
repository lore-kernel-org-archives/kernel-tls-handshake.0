Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FD96ADD
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 26 Sep 2025 01:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849735; cv=none; b=oOTxvZPPwbXxzYxP3V/JH/q9Wsj8B4ksGRb8D8aSliQSaiWqXmviAAMZyJKavR3NEPwVKoFaUAcCXrBZn1i9YzGR3BvWXyFZwxvWuCXjTDJarZb08l9v5eQSg0SMVklXBRWm8ILc4S5C5SKFDDhSmCu4Uzo73wbfD2BRz4IkXSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849735; c=relaxed/simple;
	bh=CWV61frK25LGa1bELbjGOEvU5zP6ib+5Ym77VufbPw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gs5jjBWrYmi0yCnvh+dFBeTDPbfaaNPaw6F76lvNprn9/3IGwbbpeujLIoiavKuRxaMv+fpYMImjt+XjLtZJvnmkdJVlf/dNJVvGo9URKOoy8yLQ2c0X7rKidOqWdPLPSRzV1zjIxlyOW5FXQmLAXBR+AOZXIjBPKvvHR/VhrlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gol5poSr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gol5poSr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE167C113CF;
	Fri, 26 Sep 2025 01:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758849733;
	bh=CWV61frK25LGa1bELbjGOEvU5zP6ib+5Ym77VufbPw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gol5poSrbwKui450wM3bYtAg7Es6YMWhVd7dTkLbm0d0dx1gG7vijMpWhE7ROonON
	 T9hjmoo96qfXHxcyp4NkQsacrt9FjGZpqjKQ0UcnPeda2GzmdNHLFlQgpTZifvP7RK
	 AI1ZrkJYwtHRngXWCtAVHGfBH8wycm1WyYV99DfElfUDxHBK8NlJdxOyx6/JHlV5zd
	 n01NU0ZrnhUII1YeoqlpgY+jowkRvI6NOhJdsZZlBcmVA8xvxspFGCbuKnB+KPZgRJ
	 BPd3N460oAjWAKa2SO47mzoz+BbyjEvAbt8eCXCYpndmo5qe/pBrc85ZvaMwYTLkxP
	 IvK8B/q8jMEFA==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Xin Long <lucien.xin@gmail.com>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH v1 06/16] tlshd: Translate kernel-style Doxygen comments in src/tlshd/handshake.c
Date: Thu, 25 Sep 2025 21:21:55 -0400
Message-ID: <20250926012207.3642990-7-cel@kernel.org>
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

Convert existing comments in handshake.c to what a normal user space
Doxygen run expects to see. This will enable deployment of an
automatically-generated documentation web site.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/handshake.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/src/tlshd/handshake.c b/src/tlshd/handshake.c
index f68893283b61..07a37d90e3d7 100644
--- a/src/tlshd/handshake.c
+++ b/src/tlshd/handshake.c
@@ -1,9 +1,13 @@
-/*
- * Service a request for a TLS handshake on behalf of an
- * in-kernel TLS consumer.
+/**
+ * @file handshake.c
+ * @brief Service a request for a TLS handshake on behalf of an
+ *	  in-kernel TLS consumer
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
@@ -43,6 +47,11 @@
 #include "tlshd.h"
 #include "netlink.h"
 
+/**
+ * @brief Toggle the use of the Nagle algorithm
+ * @param[in]     session  TLS session to modify
+ * @param[in]     val      new setting
+ */
 static void tlshd_set_nagle(gnutls_session_t session, int val)
 {
 	int ret;
@@ -53,6 +62,11 @@ static void tlshd_set_nagle(gnutls_session_t session, int val)
 		tlshd_log_perror("setsockopt (NODELAY)");
 }
 
+/**
+ * @brief Retrieve the current Nagle algorithm setting
+ * @param[in]     session  TLS session to modify
+ * @param[out]    saved    where to save the current setting
+ */
 static void tlshd_save_nagle(gnutls_session_t session, int *saved)
 {
 	socklen_t len;
@@ -72,10 +86,9 @@ static void tlshd_save_nagle(gnutls_session_t session, int *saved)
 }
 
 /**
- * tlshd_start_tls_handshake - Drive the handshake interaction
- * @session: TLS session to initialize
- * @parms: handshake parameters
- *
+ * @brief Kick off a handshake interaction
+ * @param[in]     session  TLS session to initialize
+ * @param[in]     parms    Handshake parameters
  */
 void tlshd_start_tls_handshake(gnutls_session_t session,
 			       struct tlshd_handshake_parms *parms)
@@ -115,8 +128,7 @@ void tlshd_start_tls_handshake(gnutls_session_t session,
 }
 
 /**
- * tlshd_service_socket - Service a kernel socket needing a key operation
- *
+ * @brief Service a kernel socket needing a handshake operation
  */
 void tlshd_service_socket(void)
 {
-- 
2.51.0


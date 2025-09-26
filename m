Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241AE1632DD
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 26 Sep 2025 01:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849735; cv=none; b=FylHnvMEOw2SWYu79i7MYqhbs/O9k0mnsLTdXUlIfE2KBwTz49nqQtK3Nrqq0GmrsWC491dnYfkiZdZ8MtscQkrNDGheW8Y1cVjit9enk6p4y2ybblDu2hQmBBRPpUiPTdN/CEq39II3GwxgmML++MB17cA5O5uqZiXPd+KkxCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849735; c=relaxed/simple;
	bh=RiaZqVfCL1OZ+tqhn8sB5Cwa7vrvk+fmGqCCkDrzioY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LXNccE8UQysgNoFQyN25VVyYEB9ecrZ9STsvJyizej45T5wvLuG/9U6Csw5wLjPrIVFXuANPuMudSA0418f5drsUVVdB8+jVYh0O+FFH13d3wh0OQb2Enc1FDUlAbG3gKiqTaQ7NW6ygQa/fU2FgJmmhgf/i1MAqYuH4QRnYR44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AE7MMZ6C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AE7MMZ6C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94D7C4CEF4;
	Fri, 26 Sep 2025 01:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758849735;
	bh=RiaZqVfCL1OZ+tqhn8sB5Cwa7vrvk+fmGqCCkDrzioY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AE7MMZ6CUuSmjUhqnweKfbGfcmXM1ULd+cMPfU3q9irBY+9mzjvVxr0wnxDdrO9Xq
	 kK2V0gAoB+tp0pKeACJDTTxMu/MLsS7hFjTzUx8iAHssOwZ4r0BE5sfIiceL/wBbAb
	 nzxYEjchYQ1+8oCWFq5S+JUrMYPIn2nnIwDKBkZLVVnnRXu7vqM4/Gp9ooFo/Jui8w
	 lRCwxrgBAjs4/ax5sC2fD+yMWco6uGzQbea6wwanetq5iOyX5GK+TUXuUBEA68BNib
	 HQpo8R6IWdw65MxDQuehin3m2SK34HcvcQNpeY7unWoN+MRiqdu9fFG9SiXVkq1fVX
	 x85r1oFk0nM9A==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Xin Long <lucien.xin@gmail.com>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH v1 10/16] tlshd: Translate kernel-style Doxygen comments in src/tlshd/main.c
Date: Thu, 25 Sep 2025 21:21:59 -0400
Message-ID: <20250926012207.3642990-11-cel@kernel.org>
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

Convert existing comments in main.c to what a normal user space
Doxygen run expects to see. This will enable deployment of an
automatically-generated documentation web site.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/main.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/src/tlshd/main.c b/src/tlshd/main.c
index 00ba99033ed2..add3492926d5 100644
--- a/src/tlshd/main.c
+++ b/src/tlshd/main.c
@@ -1,9 +1,13 @@
-/*
- * Handle a request for a TLS handshake on behalf of an
- * in-kernel TLS consumer.
+/**
+ * @file main.c
+ * @brief Handle a request for a TLS handshake on behalf of an
+ *	  in-kernel TLS consumer
  *
+ * @copyright
  * Copyright (c) 2022 - 2023 Oracle and/or its affiliates.
- *
+ */
+
+/*
  * ktls-utils is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
  * published by the Free Software Foundation; version 2.
@@ -56,11 +60,23 @@ static const struct option longopts[] = {
 	{ NULL,		0,			NULL,	 0 }
 };
 
-static void usage(const char *progname)
+/**
+ * @brief Emit a program usage message on stderr
+ * @param[in]     progname  NUL-terminated C string containing program name
+ */
+static void usage(char *progname)
 {
 	fprintf(stderr, "usage: %s [-chsv]\n", progname);
 }
 
+/**
+ * @brief tlshd program entry point
+ * @param[in]     argc  Count of elements in "argv"
+ * @param[in]     argv  Command line parameters
+ *
+ * @retval EXIT_SUCCESS  Program terminated normally
+ * @retval EXIT_FAILURE  Program encountered an error
+ */
 int main(int argc, char **argv)
 {
 	static gchar config_file[PATH_MAX + 1];
-- 
2.51.0


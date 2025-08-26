Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E6126D4DD
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222691; cv=none; b=tNHDt6zzkoB+ii7ditd53TtQe5tSMv4Ev1ilSqqYwvusC8+9SCsiAflGWPm6mY/8moud4LflKcN2VTZBWABOWiZ234aIv9jWIT6G6nFfHDmWY3BjsdA11bHYjJIEw2RFTdMaTglQD4CJCTdwa8YuhCxwd2GQDinJyecFCd9C5/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222691; c=relaxed/simple;
	bh=zViGg/D4eyV6yDSwiqLvS4CPQy95AKURSC3bt8t6fGE=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MihXfo+EQ/ErytckSwstxSd1GpvxHjuH0+aw96J5Bc2sdZKUuRKJ7xpyRL82VDR+X0Tx/ZuJgDhmAzNjVZ30CpTA7bNtXxlEh6CmgM3efeVdWUjZ4PEyV39sKkRVwMRXxpi6j+yhGv2+IeO1EP2JXncmpCFAfdiFUWyzKpZ+FMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1jc0oek; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1jc0oek"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE0EC4CEF1
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756222690;
	bh=zViGg/D4eyV6yDSwiqLvS4CPQy95AKURSC3bt8t6fGE=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=R1jc0oek9X9Emry0y1yZ9OW9xgmu2AE7GrzbztdvcXX+6DWVEYr5/x20QfbygOWRz
	 s2iZ+RBCEuer9N1tPOqbsTJFbNYUF2YVufSDwkW3Ow+FEWyptthQJ5y37poBqYtAOU
	 n9+NllFGNTF6gFutuX+oBLTnGA0q9eoHbarUulnC0zJwNsvyHHbtMoe5Oc6tGXcx0F
	 TOQlzWhQP/oufughFCeBiRUO2qh/fOa84PqDkXmAnP+bRTRpWn3v18AT83gPGQui91
	 t4QkwUT9GJnlKQH3AP2UQaxYL/jt+Cr87SixfJl+IVZuK4MuDulD6+tf7pNq+I6mjG
	 v9u1F5f5iD/Sw==
Subject: [PATCH v2 03/11] tlshd: Add init/shutdown hooks for the session
 tagging subsystem
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Tue, 26 Aug 2025 11:38:09 -0400
Message-ID: 
 <175622268919.6197.13581951492126274128.stgit@91.116.238.104.host.secureserver.net>
In-Reply-To: 
 <175622197574.6197.17170424685161235821.stgit@91.116.238.104.host.secureserver.net>
References: 
 <175622197574.6197.17170424685161235821.stgit@91.116.238.104.host.secureserver.net>
User-Agent: StGit/1.5
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Chuck Lever <chuck.lever@oracle.com>

TLS session tags will be managed in functions contained in a new
source file, tags.c.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/Makefile.am |    5 +++--
 src/tlshd/config.c    |    3 +++
 src/tlshd/tags.c      |   50 +++++++++++++++++++++++++++++++++++++++++++++++++
 src/tlshd/tlshd.h     |    4 ++++
 4 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 src/tlshd/tags.c

diff --git a/src/tlshd/Makefile.am b/src/tlshd/Makefile.am
index 1150c168e62f..288aec89c59f 100644
--- a/src/tlshd/Makefile.am
+++ b/src/tlshd/Makefile.am
@@ -23,8 +23,9 @@ sbin_PROGRAMS		= tlshd
 tlshd_CFLAGS		= -Werror -Wall -Wextra $(LIBGNUTLS_CFLAGS) \
 			  $(LIBKEYUTILS_CFLAGS) $(GLIB_CFLAGS) $(LIBNL3_CFLAGS) \
 			  $(LIBNL_GENL3_CFLAGS) $(LIBYAML_CFLAGS)
-tlshd_SOURCES		= client.c config.c handshake.c keyring.c ktls.c log.c \
-			  main.c netlink.c netlink.h server.c tlshd.h quic.c
+tlshd_SOURCES		= client.c config.c handshake.c keyring.c ktls.c \
+			  log.c main.c netlink.c netlink.h quic.c server.c \
+			  tags.c tlshd.h
 tlshd_LDADD		= $(LIBGNUTLS_LIBS) $(LIBKEYUTILS_LIBS) $(GLIB_LIBS) \
 			  $(LIBNL3_LIBS) $(LIBNL_GENL3_LIBS) $(LIBYAML_LIBS)
 
diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index 19b37035b1a4..edfbe39387a7 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -108,11 +108,14 @@ bool tlshd_config_init(const gchar *pathname, bool legacy)
 	tlshd_keyring_link_session(".nfs");
 	tlshd_keyring_link_session(".nfsd");
 
+	/* Eventually the tags directory might become a tlshd config option */
+	tlshd_tags_config_init("/etc/tlshd/tags.d");
 	return true;
 }
 
 void tlshd_config_shutdown(void)
 {
+	tlshd_tags_config_shutdown();
 	g_key_file_free(tlshd_configuration);
 }
 
diff --git a/src/tlshd/tags.c b/src/tlshd/tags.c
new file mode 100644
index 000000000000..3f8631240281
--- /dev/null
+++ b/src/tlshd/tags.c
@@ -0,0 +1,50 @@
+/*
+ * TLS session tagging
+ *
+ * Copyright (c) 2025 Oracle and/or its affiliates.
+ *
+ * ktls-utils is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; version 2.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
+ * 02110-1301, USA.
+ */
+
+#include "config.h"
+
+#include <stdbool.h>
+#include <keyutils.h>
+
+#include <gnutls/gnutls.h>
+#include <gnutls/abstract.h>
+
+#include <glib.h>
+
+#include "tlshd.h"
+
+/* --- Subsystem start-up / shutdown APIs --- */
+
+/**
+ * tlshd_tags_config_init - Initialize the TLS session tags configuration
+ * @tagsdir: pathname of directory containing files that define tags
+ *
+ */
+void tlshd_tags_config_init(__attribute__ ((unused)) const char *tagsdir)
+{
+}
+
+/**
+ * tlshd_tags_config_shutdown - Release all tag-related resources
+ *
+ */
+void tlshd_tags_config_shutdown(void)
+{
+}
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index b98f77d7328a..816b85f63291 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -119,6 +119,10 @@ extern void tlshd_genl_done(struct tlshd_handshake_parms *parms);
 extern void tlshd_tls13_serverhello_handshake(struct tlshd_handshake_parms *parms);
 extern void tlshd_quic_serverhello_handshake(struct tlshd_handshake_parms *parms);
 
+/* tags.c */
+extern void tlshd_tags_config_init(const char *tagsdir);
+extern void tlshd_tags_config_shutdown(void);
+
 #ifdef HAVE_GNUTLS_QUIC
 #include <linux/quic.h>
 



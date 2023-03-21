Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DAC10E9
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 12:44:05 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id D4E901FFFD;
	Tue, 21 Mar 2023 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679402637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v2A74WtsIK29Gu2jzeKTfRlCeRbGVc/9x6v650hC+A0=;
	b=mPBqJi9DFGuu1fwYjBh0cxKor2KHyvEaXw9oSKAU+0HOeY/61/k4bD547qjOcmL3F/FyaM
	Sc7SjQv97SIwVjI22RP8IlZvWS73YZz5jZTJyjj94XOxnGkWmvSEJx1mnM2wGNtDVPht/5
	UlbN2WjgeIC18pwTNQXSH3aCl/oLWKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679402637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v2A74WtsIK29Gu2jzeKTfRlCeRbGVc/9x6v650hC+A0=;
	b=iozcyBfzOsFFS7oMfVQnz5CiYB5dNZIoWPHkxHx7YNo4f7ZmiKwpxNPMzkMk7hddlqwZPw
	KySYYof2Jsf4NWCA==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id BA72E2C142;
	Tue, 21 Mar 2023 12:43:57 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id A3C1251BEE96; Tue, 21 Mar 2023 13:43:57 +0100 (CET)
From: Hannes Reinecke <hare@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <cel@kernel.org>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 01/18] nvme-keyring: register '.nvme' keyring
Date: Tue, 21 Mar 2023 13:43:08 +0100
Message-Id: <20230321124325.77385-2-hare@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230321124325.77385-1-hare@suse.de>
References: <20230321124325.77385-1-hare@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register a '.nvme' keyring to hold keys for TLS and DH-HMAC-CHAP.
We need a separate keyring as for NVMe the might not be a userspace
process attached (eg during reconnect), and so the use of a session
keyring or any other process-related keyrings might not be possible.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/nvme/common/Makefile  |  2 +-
 drivers/nvme/common/keyring.c | 36 +++++++++++++++++++++++++++++++++++
 drivers/nvme/host/core.c      | 10 +++++++++-
 include/linux/nvme-keyring.h  | 12 ++++++++++++
 4 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 drivers/nvme/common/keyring.c
 create mode 100644 include/linux/nvme-keyring.h

diff --git a/drivers/nvme/common/Makefile b/drivers/nvme/common/Makefile
index 720c625b8a52..c4e3b312d2cc 100644
--- a/drivers/nvme/common/Makefile
+++ b/drivers/nvme/common/Makefile
@@ -4,4 +4,4 @@ ccflags-y			+= -I$(src)
 
 obj-$(CONFIG_NVME_COMMON)	+= nvme-common.o
 
-nvme-common-y			+= auth.o
+nvme-common-y			+= auth.o keyring.o
diff --git a/drivers/nvme/common/keyring.c b/drivers/nvme/common/keyring.c
new file mode 100644
index 000000000000..3a6e8a0b38e2
--- /dev/null
+++ b/drivers/nvme/common/keyring.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Hannes Reinecke, SUSE Linux
+ */
+
+#include <linux/module.h>
+#include <linux/nvme.h>
+#include <linux/seq_file.h>
+#include <linux/key-type.h>
+#include <keys/user-type.h>
+
+static struct key *nvme_keyring;
+
+int nvme_keyring_init(void)
+{
+	int err;
+
+	nvme_keyring = keyring_alloc(".nvme",
+				     GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
+				     current_cred(),
+				     (KEY_POS_ALL & ~KEY_POS_SETATTR) |
+				     (KEY_USR_ALL & ~KEY_USR_SETATTR),
+				     KEY_ALLOC_NOT_IN_QUOTA, NULL, NULL);
+	if (IS_ERR(nvme_keyring))
+		return PTR_ERR(nvme_keyring);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nvme_keyring_init);
+
+void nvme_keyring_exit(void)
+{
+	key_revoke(nvme_keyring);
+	key_put(nvme_keyring);
+}
+EXPORT_SYMBOL_GPL(nvme_keyring_exit);
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index d4be525f8100..839bc7587f54 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -25,6 +25,7 @@
 #include "nvme.h"
 #include "fabrics.h"
 #include <linux/nvme-auth.h>
+#include <linux/nvme-keyring.h>
 
 #define CREATE_TRACE_POINTS
 #include "trace.h"
@@ -5415,11 +5416,17 @@ static int __init nvme_core_init(void)
 		goto unregister_generic_ns;
 	}
 
-	result = nvme_init_auth();
+	result = nvme_keyring_init();
 	if (result)
 		goto destroy_ns_chr;
+
+	result = nvme_init_auth();
+	if (result)
+		goto keyring_exit;
 	return 0;
 
+keyring_exit:
+	nvme_keyring_exit();
 destroy_ns_chr:
 	class_destroy(nvme_ns_chr_class);
 unregister_generic_ns:
@@ -5443,6 +5450,7 @@ static int __init nvme_core_init(void)
 static void __exit nvme_core_exit(void)
 {
 	nvme_exit_auth();
+	nvme_keyring_exit();
 	class_destroy(nvme_ns_chr_class);
 	class_destroy(nvme_subsys_class);
 	class_destroy(nvme_class);
diff --git a/include/linux/nvme-keyring.h b/include/linux/nvme-keyring.h
new file mode 100644
index 000000000000..a875c06cc922
--- /dev/null
+++ b/include/linux/nvme-keyring.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 Hannes Reinecke, SUSE Software Solutions
+ */
+
+#ifndef _NVME_KEYRING_H
+#define _NVME_KEYRING_H
+
+int nvme_keyring_init(void);
+void nvme_keyring_exit(void);
+
+#endif
-- 
2.35.3


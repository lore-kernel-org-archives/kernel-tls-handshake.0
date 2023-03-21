Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443AC945B
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 12:44:06 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id D47D421DB7;
	Tue, 21 Mar 2023 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679402637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlN1jLoxtX6o47jXrUOBXWD+qJPRlUnShbsW1te+xyI=;
	b=n2O+acqv0VZptsGkUuqa8PZ/jkmdTMd9sHtRF6vLpzRkVvP7YC8xnrWzqv4Qcy20cFgkaa
	0J+efCtKeOZemIjZcC6ahbV+xQwBJWQaVwrSyP3mR8YzjWdlYX2DeeuIKpaeCtVVKVT5KD
	/SaXIppN0P6NTnqe6icDB7/a5SM2Mcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679402637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlN1jLoxtX6o47jXrUOBXWD+qJPRlUnShbsW1te+xyI=;
	b=M2ZWltiq00wwa5Xa8/vfOZWuJqAtQcSP6t0szIfTG+9wEboYXx/hYVmkETMB5hxG7wFiZl
	AbWX993G4LhjgZCQ==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id BA6002C141;
	Tue, 21 Mar 2023 12:43:57 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id AB7F251BEE98; Tue, 21 Mar 2023 13:43:57 +0100 (CET)
From: Hannes Reinecke <hare@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <cel@kernel.org>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 02/18] nvme-keyring: define a 'psk' keytype
Date: Tue, 21 Mar 2023 13:43:09 +0100
Message-Id: <20230321124325.77385-3-hare@suse.de>
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

Define a 'psk' keytype to hold the NVMe TLS PSKs.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/nvme/common/keyring.c | 96 +++++++++++++++++++++++++++++++++++
 include/linux/nvme-keyring.h  |  8 +++
 2 files changed, 104 insertions(+)

diff --git a/drivers/nvme/common/keyring.c b/drivers/nvme/common/keyring.c
index 3a6e8a0b38e2..6cbb9d66e0f6 100644
--- a/drivers/nvme/common/keyring.c
+++ b/drivers/nvme/common/keyring.c
@@ -11,6 +11,96 @@
 
 static struct key *nvme_keyring;
 
+key_serial_t nvme_keyring_id(void)
+{
+	return nvme_keyring->serial;
+}
+EXPORT_SYMBOL_GPL(nvme_keyring_id);
+
+static void nvme_tls_psk_describe(const struct key *key, struct seq_file *m)
+{
+	seq_puts(m, key->description);
+	seq_printf(m, ": %u", key->datalen);
+}
+
+static bool nvme_tls_psk_match(const struct key *key,
+			       const struct key_match_data *match_data)
+{
+	const char *match_id;
+	size_t match_len;
+
+	if (!key->description) {
+		pr_debug("%s: no key description\n", __func__);
+		return false;
+	}
+	match_len = strlen(key->description);
+	pr_debug("%s: id %s len %zd\n", __func__, key->description, match_len);
+
+	if (!match_data->raw_data) {
+		pr_debug("%s: no match data\n", __func__);
+		return false;
+	}
+	match_id = match_data->raw_data;
+	pr_debug("%s: match '%s' '%s' len %lu\n",
+		 __func__, match_id, key->description, match_len);
+	return !memcmp(key->description, match_id, match_len);
+}
+
+static int nvme_tls_psk_match_preparse(struct key_match_data *match_data)
+{
+	match_data->lookup_type = KEYRING_SEARCH_LOOKUP_ITERATE;
+	match_data->cmp = nvme_tls_psk_match;
+	return 0;
+}
+
+static struct key_type nvme_tls_psk_key_type = {
+	.name           = "psk",
+	.flags          = KEY_TYPE_NET_DOMAIN,
+	.preparse       = user_preparse,
+	.free_preparse  = user_free_preparse,
+	.match_preparse = nvme_tls_psk_match_preparse,
+	.instantiate    = generic_key_instantiate,
+	.revoke         = user_revoke,
+	.destroy        = user_destroy,
+	.describe       = nvme_tls_psk_describe,
+	.read           = user_read,
+};
+
+struct key *nvme_tls_psk_lookup(key_ref_t keyring,
+		const char *hostnqn, const char *subnqn,
+		int hmac, bool generated)
+{
+	char *identity;
+	size_t identity_len = (NVMF_NQN_SIZE) * 2 + 11;
+	key_ref_t keyref;
+	key_serial_t keyring_id;
+
+	identity = kzalloc(identity_len, GFP_KERNEL);
+	if (!identity)
+		return ERR_PTR(-ENOMEM);
+
+	snprintf(identity, identity_len, "NVMe0%c%02d %s %s",
+		 generated ? 'G' : 'R', hmac, hostnqn, subnqn);
+
+	if (!keyring)
+		keyring = make_key_ref(nvme_keyring, true);
+	keyring_id = key_serial(key_ref_to_ptr(keyring));
+	pr_debug("keyring %x lookup tls psk '%s'\n",
+		 keyring_id, identity);
+	keyref = keyring_search(keyring, &nvme_tls_psk_key_type,
+				identity, false);
+	if (IS_ERR(keyref)) {
+		pr_debug("lookup tls psk '%s' failed, error %ld\n",
+			 identity, PTR_ERR(keyref));
+		kfree(identity);
+		return ERR_PTR(-ENOKEY);
+	}
+	kfree(identity);
+
+	return key_ref_to_ptr(keyref);
+}
+EXPORT_SYMBOL_GPL(nvme_tls_psk_lookup);
+
 int nvme_keyring_init(void)
 {
 	int err;
@@ -24,12 +114,18 @@ int nvme_keyring_init(void)
 	if (IS_ERR(nvme_keyring))
 		return PTR_ERR(nvme_keyring);
 
+	err = register_key_type(&nvme_tls_psk_key_type);
+	if (err) {
+		key_put(nvme_keyring);
+		return err;
+	}
 	return 0;
 }
 EXPORT_SYMBOL_GPL(nvme_keyring_init);
 
 void nvme_keyring_exit(void)
 {
+	unregister_key_type(&nvme_tls_psk_key_type);
 	key_revoke(nvme_keyring);
 	key_put(nvme_keyring);
 }
diff --git a/include/linux/nvme-keyring.h b/include/linux/nvme-keyring.h
index a875c06cc922..c0c3d934f474 100644
--- a/include/linux/nvme-keyring.h
+++ b/include/linux/nvme-keyring.h
@@ -6,6 +6,14 @@
 #ifndef _NVME_KEYRING_H
 #define _NVME_KEYRING_H
 
+#include <linux/key.h>
+
+struct key *nvme_tls_psk_lookup(key_ref_t keyring,
+				const char *hostnqn, const char *subnqn,
+				int hmac, bool generated);
+
+key_serial_t nvme_keyring_id(void);
+
 int nvme_keyring_init(void);
 void nvme_keyring_exit(void);
 
-- 
2.35.3


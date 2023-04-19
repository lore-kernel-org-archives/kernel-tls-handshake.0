Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142A523C3
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 19 Apr 2023 06:57:20 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 341BA21996;
	Wed, 19 Apr 2023 06:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681887438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AqKYZvI6RJyVRFvDbH3P26X6fCQ91hG+739kibdKL5Q=;
	b=K0ue0dIQOemkxKbgRiUzyVYCL5EkCZ3wXQAsbEn7+aeosaBTE7qGAnpMya1RJrNbC3Soyd
	N2CZvlvfK7pghdmYtzjwEwdI7SVdzjtl3Rxpgl1GE7dUsjhxJDjmbQMyA13XE0gJU7cYRS
	yMi9iFsghbPd8cNiK8PlI6yrIiiJ7ng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681887438;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AqKYZvI6RJyVRFvDbH3P26X6fCQ91hG+739kibdKL5Q=;
	b=6ir+Im/sCvEVhpTSn3zOirpR1Q3X4GZIHigdgB07nro0FvKTca0yxYurUqzrPsECHgZ1Lx
	YTs88NvPUxkCNkBQ==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id DBA2D2C143;
	Wed, 19 Apr 2023 06:57:17 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id CEAE651C26CB; Wed, 19 Apr 2023 08:57:17 +0200 (CEST)
From: Hannes Reinecke <hare@suse.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 02/17] nvme-keyring: define a 'psk' keytype
Date: Wed, 19 Apr 2023 08:56:59 +0200
Message-Id: <20230419065714.52076-3-hare@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230419065714.52076-1-hare@suse.de>
References: <20230419065714.52076-1-hare@suse.de>
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
 drivers/nvme/common/keyring.c | 94 +++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/nvme/common/keyring.c b/drivers/nvme/common/keyring.c
index 5cf64b278119..494dd365052e 100644
--- a/drivers/nvme/common/keyring.c
+++ b/drivers/nvme/common/keyring.c
@@ -8,6 +8,8 @@
 #include <linux/key-type.h>
 #include <keys/user-type.h>
 #include <linux/nvme.h>
+#include <linux/nvme-tcp.h>
+#include <linux/nvme-keyring.h>
 
 static struct key *nvme_keyring;
 
@@ -17,8 +19,94 @@ key_serial_t nvme_keyring_id(void)
 }
 EXPORT_SYMBOL_GPL(nvme_keyring_id);
 
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
+	pr_debug("%s: match '%s' '%s' len %zd\n",
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
+static struct key *nvme_tls_psk_lookup(struct key *keyring,
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
+		keyring = nvme_keyring;
+	keyring_id = key_serial(keyring);
+	pr_debug("keyring %x lookup tls psk '%s'\n",
+		 keyring_id, identity);
+	keyref = keyring_search(make_key_ref(keyring, true),
+				&nvme_tls_psk_key_type,
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
+
 int nvme_keyring_init(void)
 {
+	int err;
+
 	nvme_keyring = keyring_alloc(".nvme",
 				     GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
 				     current_cred(),
@@ -28,12 +116,18 @@ int nvme_keyring_init(void)
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
-- 
2.35.3


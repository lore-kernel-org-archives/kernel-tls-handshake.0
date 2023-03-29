Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651E733E5
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 29 Mar 2023 14:00:01 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id DF8781FDFA;
	Wed, 29 Mar 2023 13:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680098389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZEBhBxe83M9g3nGPBLqbGpaLZMKsONMomoNpfQhwhM=;
	b=BLdNOqYFCK1Z5jXh68Q9QP04W9gACo+zF1qDzqNGpYQLsBzFoyHgbyEqEITHZqFsmVFNU3
	4DGI5UFiYQV8PZgypZAPpXWR5HIq9q2sYsn2HvNsErMJlhA54rBJqB/zQCtr/pK6T+27w9
	/w29WW+Ptjue2yOtrFpHGzKg0U6Y8Uw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680098389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZEBhBxe83M9g3nGPBLqbGpaLZMKsONMomoNpfQhwhM=;
	b=X5EbkbI1zIJVHeiWPZrWNmBCptV2768Hq8MDRsaUYujA3B9VMzTdu0CFL/e6MJnx73HuBy
	3OdvOMgg7oI2lRCQ==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id CE7F82C180;
	Wed, 29 Mar 2023 13:59:49 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id CC89751BF38A; Wed, 29 Mar 2023 15:59:49 +0200 (CEST)
From: Hannes Reinecke <hare@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 12/18] nvme-fabrics: parse options 'keyring' and 'tls_key'
Date: Wed, 29 Mar 2023 15:59:32 +0200
Message-Id: <20230329135938.46905-13-hare@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230329135938.46905-1-hare@suse.de>
References: <20230329135938.46905-1-hare@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse the fabrics options 'keyring' and 'tls_key' and store the
referenced keys in the options structure.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/nvme/host/fabrics.c | 79 ++++++++++++++++++++++++++++++++++++-
 drivers/nvme/host/fabrics.h |  6 +++
 drivers/nvme/host/tcp.c     | 20 +++++++---
 3 files changed, 98 insertions(+), 7 deletions(-)

diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
index 3e4f0e45b58f..5f5e487d498c 100644
--- a/drivers/nvme/host/fabrics.c
+++ b/drivers/nvme/host/fabrics.c
@@ -605,6 +605,8 @@ static const match_table_t opt_tokens = {
 	{ NVMF_OPT_NR_WRITE_QUEUES,	"nr_write_queues=%d"	},
 	{ NVMF_OPT_NR_POLL_QUEUES,	"nr_poll_queues=%d"	},
 	{ NVMF_OPT_TOS,			"tos=%d"		},
+	{ NVMF_OPT_KEYRING,		"keyring=%d"		},
+	{ NVMF_OPT_TLS_KEY,		"tls_key=%d"		},
 	{ NVMF_OPT_FAIL_FAST_TMO,	"fast_io_fail_tmo=%d"	},
 	{ NVMF_OPT_DISCOVERY,		"discovery"		},
 	{ NVMF_OPT_DHCHAP_SECRET,	"dhchap_secret=%s"	},
@@ -620,8 +622,9 @@ static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
 	char *options, *o, *p;
 	int token, ret = 0;
 	size_t nqnlen  = 0;
-	int ctrl_loss_tmo = NVMF_DEF_CTRL_LOSS_TMO;
+	int ctrl_loss_tmo = NVMF_DEF_CTRL_LOSS_TMO, key_id;
 	uuid_t hostid;
+	struct key *key = NULL;
 
 	/* Set defaults */
 	opts->queue_size = NVMF_DEF_QUEUE_SIZE;
@@ -889,6 +892,74 @@ static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
 			}
 			opts->tos = token;
 			break;
+		case NVMF_OPT_KEYRING:
+#ifdef CONFIG_NVME_TLS
+			if (match_int(args, &key_id)) {
+				ret = -EINVAL;
+				goto out;
+			}
+			if (key_id < 0) {
+				pr_err("Invalid keyring id %d\n", key_id);
+				ret = -EINVAL;
+				goto out;
+			}
+			if (!key_id) {
+				pr_debug("Using default keyring\n");
+				if (opts->keyring) {
+					key_put(opts->keyring);
+					opts->keyring = NULL;
+				}
+				break;
+			}
+			key = key_lookup(key_id);
+			if (!key) {
+				pr_err("Keyring id %08x not found\n", key_id);
+				ret = -ENOKEY;
+				goto out;
+			}
+			if (opts->keyring)
+				key_put(opts->keyring);
+			opts->keyring = key;
+			break;
+#else
+			pr_err("TLS is not supported\n");
+			ret = -EINVAL;
+			goto out;
+#endif
+		case NVMF_OPT_TLS_KEY:
+#ifdef CONFIG_NVME_TLS
+			if (match_int(args, &key_id)) {
+				ret = -EINVAL;
+				goto out;
+			}
+			if (key_id < 0) {
+				pr_err("Invalid key id %d\n", key_id);
+				ret = -EINVAL;
+				goto out;
+			}
+			if (!key_id) {
+				pr_debug("Using 'best' PSK\n");
+				if (opts->tls_key) {
+					key_put(opts->tls_key);
+					opts->tls_key = NULL;
+				}
+				break;
+			}
+			key = key_lookup(key_id);
+			if (!key) {
+				pr_err("Key id %08x not found\n", key_id);
+				ret = -ENOKEY;
+				goto out;
+			}
+			if (opts->tls_key)
+				key_put(opts->tls_key);
+			opts->tls_key = key;
+#else
+			pr_err("TLS is not supported\n");
+			ret = -EINVAL;
+			goto out;
+#endif
+			break;
 		case NVMF_OPT_DISCOVERY:
 			opts->discovery_nqn = true;
 			break;
@@ -1054,6 +1125,12 @@ static int nvmf_check_allowed_opts(struct nvmf_ctrl_options *opts,
 void nvmf_free_options(struct nvmf_ctrl_options *opts)
 {
 	nvmf_host_put(opts->host);
+#ifdef CONFIG_NVME_TLS
+	if (opts->keyring)
+		key_put(opts->keyring);
+	if (opts->tls_key)
+		key_put(opts->tls_key);
+#endif
 	kfree(opts->transport);
 	kfree(opts->traddr);
 	kfree(opts->trsvcid);
diff --git a/drivers/nvme/host/fabrics.h b/drivers/nvme/host/fabrics.h
index 5db36e250e7a..2ff7b7168a40 100644
--- a/drivers/nvme/host/fabrics.h
+++ b/drivers/nvme/host/fabrics.h
@@ -71,6 +71,8 @@ enum {
 	NVMF_OPT_DHCHAP_SECRET	= 1 << 23,
 	NVMF_OPT_DHCHAP_CTRL_SECRET = 1 << 24,
 	NVMF_OPT_TLS		= 1 << 25,
+	NVMF_OPT_KEYRING	= 1 << 26,
+	NVMF_OPT_TLS_KEY	= 1 << 27,
 };
 
 /**
@@ -103,6 +105,8 @@ enum {
  * @dhchap_secret: DH-HMAC-CHAP secret
  * @dhchap_ctrl_secret: DH-HMAC-CHAP controller secret for bi-directional
  *              authentication
+ * @keyring:    Keyring to use for key lookups
+ * @tls_key:    TLS key for encrypted connections (TCP)
  * @tls:        Start TLS encrypted connections (TCP)
  * @disable_sqflow: disable controller sq flow control
  * @hdr_digest: generate/verify header digest (TCP)
@@ -130,6 +134,8 @@ struct nvmf_ctrl_options {
 	int			max_reconnects;
 	char			*dhchap_secret;
 	char			*dhchap_ctrl_secret;
+	struct key		*keyring;
+	struct key		*tls_key;
 	bool			tls;
 	bool			disable_sqflow;
 	bool			hdr_digest;
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 2e15fa83b725..00a3f18a69af 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1596,6 +1596,8 @@ static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
 
 	dev_dbg(nctrl->device, "queue %d: start TLS with key %x\n",
 		qid, peerid);
+	if (nctrl->opts->keyring)
+		keyring = key_serial(nctrl->opts->keyring);
 	args.ta_sock = queue->sock;
 	args.ta_done = nvme_tcp_tls_done;
 	args.ta_data = queue;
@@ -1908,9 +1910,12 @@ static int nvme_tcp_alloc_admin_queue(struct nvme_ctrl *ctrl)
 
 #ifdef CONFIG_NVME_TLS
 	if (ctrl->opts->tls) {
-		psk_id = nvme_tls_psk_default(NULL,
-					      ctrl->opts->host->nqn,
-					      ctrl->opts->subsysnqn);
+		if (ctrl->opts->tls_key)
+			psk_id = key_serial(ctrl->opts->tls_key);
+		else
+			psk_id = nvme_tls_psk_default(ctrl->opts->keyring,
+						      ctrl->opts->host->nqn,
+						      ctrl->opts->subsysnqn);
 		if (!psk_id) {
 			dev_err(ctrl->device, "no valid PSK found\n");
 			ret = -ENOKEY;
@@ -1940,9 +1945,12 @@ static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
 
 #ifdef CONFIG_NVME_TLS
 	if (ctrl->opts->tls) {
-		psk_id = nvme_tls_psk_default(NULL,
-					      ctrl->opts->host->nqn,
-					      ctrl->opts->subsysnqn);
+		if (ctrl->opts->tls_key)
+			psk_id = key_serial(ctrl->opts->tls_key);
+		else
+			psk_id = nvme_tls_psk_default(ctrl->opts->keyring,
+						      ctrl->opts->host->nqn,
+						      ctrl->opts->subsysnqn);
 		if (!psk_id) {
 			dev_err(ctrl->device, "no valid PSK found\n");
 			return -ENOKEY;
-- 
2.35.3


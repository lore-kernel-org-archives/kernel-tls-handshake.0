Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3967A221F11
	for <kernel-tls-handshake@lists.linux.dev>; Sat,  5 Jul 2025 19:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751744337; cv=none; b=E0kHrbMHJvJLKQbmNI0hL9LfSTytgzUA5/1WZzXPNg9uw3BhDomBC7qIJOyZYXsTONQxwx/JVL5Ifel0pBA3HLS0i20/b/sUCkBHFnt3/fFe1M/cKyuTuGT1t/MokLISL9K5A0Vex6pU9eNJOp009E5aFZQ66cGoTxoHrH2gwWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751744337; c=relaxed/simple;
	bh=SCH5xdP6p94N5k6tIAew5mjEqTxkEohaURDzLj8KLlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0t5mtZLUJAjDVQ0bZ+TwlhSMG9M+/qWnkl2EGAKYIiYxBl1exUChvwVQptJp7s/XFWbSyi7y8Jkv1oaurCW4wcU+g93VnTN30MItF9BuRK2KNI1d4uuEWWupwgvp/jOrollOScAP9w6QQ8jrSPrs+9aLwCJVCUbzuZ7iRPxWsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJATrV74; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJATrV74"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fd1b2a57a0so21024996d6.1
        for <kernel-tls-handshake@lists.linux.dev>; Sat, 05 Jul 2025 12:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751744334; x=1752349134; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v68Nfo8e3y8b2K3ogfKV/2MC0vfYrKfgPz18YH1NkOw=;
        b=SJATrV7442sRQNFclnmwwTbcp0lABA01LFYJ4KpW7sU2K2A96qlqqCb2sNsW76MDIb
         fhhyz0OrPJ6xRaHFZ3Z5PaN5r7hLFOaUpol3vFwiXXEZU7xzx2hNzMn6AioJvPc9SFrR
         eA7yHytQMMPNKv+il+T/aB37BnDe3rGA0FTP0/FQByzu0UxggHX2cMqSACxkoElThny9
         EWg8ZEvslgIW47RCd0G+R2EJJAmPgmGm4d7EXLEd1aOkQyhg3uFjzSPriyLchycz5Cz4
         9cYRp1+tE2qcb8ZV2eRV2BYgxOT3NF1iQQR8ZFKxnBlCsENjYCMwadUhR+sYGBbMezPF
         iiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751744334; x=1752349134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v68Nfo8e3y8b2K3ogfKV/2MC0vfYrKfgPz18YH1NkOw=;
        b=HTuJp2b3TSljC9as5QZcg9xBnp2Wgd1Ly+6cx3ML+s68SNyTybuiRWeOOW3lRV9+qm
         VqFBDF+YCFcKssfZnwztecDT8kmfZd146iKQP3zghK6fxixrXq8lSjenHozAJuGfqQrj
         mNv2HV57JK+9mXzipDxv4nxRtsOomTkStdxD4jOABjy1IM5KFsWXixRlSn9bu+sgjvj6
         beDwK3+sZdswTI6FIhYOB8ZWiS8zEX43rDMkz/ZDFB6d0JknazqC4gi1Pj7FfV88jcUp
         wR3nNXxM2+lDA63NZljYWZxI8Oja0QsCqaN0zpn4Cs5jfiDRiXBuORz+oVBJwg243Sr0
         aL9g==
X-Forwarded-Encrypted: i=1; AJvYcCXAqkra/8tNJJppu5L7Q2vemZaS6ovwS149gXddHUUNbWsL/P8E7aOKx7hDl1IlQRKDBFBUz0Nb89yN+Mu1ZDhNtMRJfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQiaWicPxEZY+IbW9YxFsJJQmdbgowhNTSj1YtcTF2a8e/6SzQ
	YBJ4hiB+jDf/3gPG50Vpv8OB7uCzByghM7jdo90hjJXOUY7Zg+S46+aH
X-Gm-Gg: ASbGncsZQcD7sTjt1neMq4ir2DzVIflvn6tbwgJFfgkJxfvNF4EVDxF1oI3OFrgSUvB
	dN9hbcYybxPJrzDSvAJ6c6OVUNwOUlDUpXcjJ3QfgvwnjSp9QrfTophMA6yChHUMWFDfyTBSgCh
	X7c8XhCzDGdWQUY7NgFaRzxo/GmapJGQ/fzKa7JMMCa02OOpm+QKULfcthzJxe4ip4jMhEGFV5Y
	6g0Yp7dPdr9OgUzC7jDdFaGk0bg3CoaT2nGIBnUY331sZ2Bdx3WQaimrqaPqVEQVjRh8dDus+M6
	2Y1qgn0FqTH2UnUi7kGPG6pJyYQNhOrPF6rt1LnSbzrjQlkWx0Y8eTGusAKa+AgkDXcaW9i+xk/
	zo7HSdFTT/oNs+9z+TW7KT9LmK44=
X-Google-Smtp-Source: AGHT+IEkrzUJc+g8z7vqgigD7TE6yM46UNHPMjG/aMmDo/TcgFCFtvoKnJRNTGieZodaMBt80Y/XJQ==
X-Received: by 2002:a05:6214:248a:b0:6fd:24e8:7b04 with SMTP id 6a1803df08f44-702d1a2eac4mr48270386d6.33.1751744334003;
        Sat, 05 Jul 2025 12:38:54 -0700 (PDT)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d6019csm32999146d6.106.2025.07.05.12.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:38:53 -0700 (PDT)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>
Cc: davem@davemloft.net,
	kuba@kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefan Metzmacher <metze@samba.org>,
	Moritz Buhl <mbuhl@openbsd.org>,
	Tyler Fanelli <tfanelli@redhat.com>,
	Pengtao He <hepengtao@xiaomi.com>,
	linux-cifs@vger.kernel.org,
	Steve French <smfrench@gmail.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Tom Talpey <tom@talpey.com>,
	kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>,
	Benjamin Coddington <bcodding@redhat.com>,
	Steve Dickson <steved@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Alexander Aring <aahringo@redhat.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	"D . Wythe" <alibuda@linux.alibaba.com>,
	Jason Baron <jbaron@akamai.com>,
	illiliti <illiliti@protonmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Daniel Stenberg <daniel@haxx.se>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Subject: [PATCH net-next 07/15] quic: add connection id management
Date: Sat,  5 Jul 2025 15:31:46 -0400
Message-ID: <a5ffbfaa8c4b32985aa86b3ecca10f079ab8a6e1.1751743914.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1751743914.git.lucien.xin@gmail.com>
References: <cover.1751743914.git.lucien.xin@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces 'struct quic_conn_id_set' for managing Connection
IDs (CIDs), which are represented by 'struct quic_source_conn_id'
and 'struct quic_dest_conn_id'.

It provides helpers to add and remove CIDs from the set, and handles
insertion of source CIDs into the global connection ID hash table
when necessary.

- quic_conn_id_add(): Add a new Connection ID to the set, and inserts
  it to conn_id hash table if it is a source conn_id.

- quic_conn_id_remove(): Remove connection IDs the set with sequence
  numbers less than or equal to a number.

It also adds utilities to look up CIDs by value or sequence number,
search the global hash table for incoming packets, and check for
stateless reset tokens among destination CIDs. These functions are
essential for RX path connection lookup and stateless reset processing.

- quic_conn_id_find(): Find a Connection ID in the set by seq number.

- quic_conn_id_lookup(): Lookup a Connection ID from global hash table
  using the ID value, typically used for socket lookup on the RX path.

- quic_conn_id_token_exists(): Check if a stateless reset token exists
  in any dest Connection ID (used during stateless reset processing).

Signed-off-by: Xin Long <lucien.xin@gmail.com>
---
 net/quic/Makefile |   2 +-
 net/quic/connid.c | 218 ++++++++++++++++++++++++++++++++++++++++++++++
 net/quic/connid.h | 162 ++++++++++++++++++++++++++++++++++
 net/quic/socket.c |   6 ++
 net/quic/socket.h |  13 +++
 5 files changed, 400 insertions(+), 1 deletion(-)
 create mode 100644 net/quic/connid.c
 create mode 100644 net/quic/connid.h

diff --git a/net/quic/Makefile b/net/quic/Makefile
index 094e9da5d739..eee7501588d3 100644
--- a/net/quic/Makefile
+++ b/net/quic/Makefile
@@ -5,4 +5,4 @@
 
 obj-$(CONFIG_IP_QUIC) += quic.o
 
-quic-y := common.o family.o protocol.o socket.o stream.o
+quic-y := common.o family.o protocol.o socket.o stream.o connid.o
diff --git a/net/quic/connid.c b/net/quic/connid.c
new file mode 100644
index 000000000000..1d5db524127e
--- /dev/null
+++ b/net/quic/connid.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* QUIC kernel implementation
+ * (C) Copyright Red Hat Corp. 2023
+ *
+ * This file is part of the QUIC kernel implementation
+ *
+ * Initialization/cleanup for QUIC protocol support.
+ *
+ * Written or modified by:
+ *    Xin Long <lucien.xin@gmail.com>
+ */
+
+#include <linux/quic.h>
+#include <net/sock.h>
+
+#include "common.h"
+#include "connid.h"
+
+/* Lookup a source connection ID (scid) in the global source connection ID hash table. */
+struct quic_conn_id *quic_conn_id_lookup(struct net *net, u8 *scid, u32 len)
+{
+	struct quic_hash_head *head = quic_source_conn_id_head(net, scid);
+	struct quic_source_conn_id *s_conn_id;
+
+	spin_lock(&head->s_lock);
+	hlist_for_each_entry(s_conn_id, &head->head, node) {
+		if (net == sock_net(s_conn_id->sk) && s_conn_id->common.id.len == len &&
+		    !memcmp(scid, &s_conn_id->common.id.data, s_conn_id->common.id.len))
+			break;
+	}
+
+	spin_unlock(&head->s_lock);
+	return &s_conn_id->common.id;
+}
+
+/* Check if a given stateless reset token exists in any connection ID in the connection ID set. */
+bool quic_conn_id_token_exists(struct quic_conn_id_set *id_set, u8 *token)
+{
+	struct quic_common_conn_id *common;
+	struct quic_dest_conn_id *dcid;
+
+	dcid = (struct quic_dest_conn_id *)id_set->active;
+	if (!memcmp(dcid->token, token, QUIC_CONN_ID_TOKEN_LEN)) /* Fast path. */
+		return true;
+
+	list_for_each_entry(common, &id_set->head, list) {
+		dcid = (struct quic_dest_conn_id *)common;
+		if (common == id_set->active)
+			continue;
+		if (!memcmp(dcid->token, token, QUIC_CONN_ID_TOKEN_LEN))
+			return true;
+	}
+	return false;
+}
+
+static void quic_source_conn_id_free_rcu(struct rcu_head *head)
+{
+	struct quic_source_conn_id *s_conn_id;
+
+	s_conn_id = container_of(head, struct quic_source_conn_id, rcu);
+	kfree(s_conn_id);
+}
+
+static void quic_source_conn_id_free(struct quic_source_conn_id *s_conn_id)
+{
+	u8 *data = s_conn_id->common.id.data;
+	struct quic_hash_head *head;
+
+	if (!hlist_unhashed(&s_conn_id->node)) {
+		head = quic_source_conn_id_head(sock_net(s_conn_id->sk), data);
+		spin_lock_bh(&head->s_lock);
+		hlist_del_init(&s_conn_id->node);
+		spin_unlock_bh(&head->s_lock);
+	}
+
+	/* Freeing is deferred via RCU to avoid use-after-free during concurrent lookups. */
+	call_rcu(&s_conn_id->rcu, quic_source_conn_id_free_rcu);
+}
+
+static void quic_conn_id_del(struct quic_common_conn_id *common)
+{
+	list_del(&common->list);
+	if (!common->hashed) {
+		kfree(common);
+		return;
+	}
+	quic_source_conn_id_free((struct quic_source_conn_id *)common);
+}
+
+/* Add a connection ID with sequence number and associated private data to the connection ID set. */
+int quic_conn_id_add(struct quic_conn_id_set *id_set,
+		     struct quic_conn_id *conn_id, u32 number, void *data)
+{
+	struct quic_source_conn_id *s_conn_id;
+	struct quic_dest_conn_id *d_conn_id;
+	struct quic_common_conn_id *common;
+	struct quic_hash_head *head;
+	struct list_head *list;
+
+	/* Locate insertion point to keep list ordered by number. */
+	list = &id_set->head;
+	list_for_each_entry(common, list, list) {
+		if (number == common->number)
+			return 0; /* Ignore if it is already exists on the list. */
+		if (number < common->number) {
+			list = &common->list;
+			break;
+		}
+	}
+
+	if (conn_id->len > QUIC_CONN_ID_MAX_LEN)
+		return -EINVAL;
+	common = kzalloc(id_set->entry_size, GFP_ATOMIC);
+	if (!common)
+		return -ENOMEM;
+	common->id = *conn_id;
+	common->number = number;
+	if (id_set->entry_size == sizeof(struct quic_dest_conn_id)) {
+		/* For destination connection IDs, copy the stateless reset token if available. */
+		if (data) {
+			d_conn_id = (struct quic_dest_conn_id *)common;
+			memcpy(d_conn_id->token, data, QUIC_CONN_ID_TOKEN_LEN);
+		}
+	} else {
+		/* For source connection IDs, mark as hashed and insert into the global source
+		 * connection ID hashtable.
+		 */
+		common->hashed = 1;
+		s_conn_id = (struct quic_source_conn_id *)common;
+		s_conn_id->sk = data;
+
+		head = quic_source_conn_id_head(sock_net(s_conn_id->sk), common->id.data);
+		spin_lock_bh(&head->s_lock);
+		hlist_add_head(&s_conn_id->node, &head->head);
+		spin_unlock_bh(&head->s_lock);
+	}
+	list_add_tail(&common->list, list);
+
+	if (number == quic_conn_id_last_number(id_set) + 1) {
+		if (!id_set->active)
+			id_set->active = common;
+		id_set->count++;
+
+		/* Increment count for consecutive following IDs. */
+		list_for_each_entry_continue(common, &id_set->head, list) {
+			if (common->number != ++number)
+				break;
+			id_set->count++;
+		}
+	}
+	return 0;
+}
+
+/* Remove connection IDs from the set with sequence numbers less than or equal to a number. */
+void quic_conn_id_remove(struct quic_conn_id_set *id_set, u32 number)
+{
+	struct quic_common_conn_id *common, *tmp;
+	struct list_head *list;
+
+	list = &id_set->head;
+	list_for_each_entry_safe(common, tmp, list, list) {
+		if (common->number <= number) {
+			if (id_set->active == common)
+				id_set->active = tmp;
+			quic_conn_id_del(common);
+			id_set->count--;
+		}
+	}
+}
+
+struct quic_conn_id *quic_conn_id_find(struct quic_conn_id_set *id_set, u32 number)
+{
+	struct quic_common_conn_id *common;
+
+	list_for_each_entry(common, &id_set->head, list)
+		if (common->number == number)
+			return &common->id;
+	return NULL;
+}
+
+void quic_conn_id_update_active(struct quic_conn_id_set *id_set, u32 number)
+{
+	struct quic_conn_id *conn_id;
+
+	if (number == id_set->active->number)
+		return;
+	conn_id = quic_conn_id_find(id_set, number);
+	if (!conn_id)
+		return;
+	quic_conn_id_set_active(id_set, conn_id);
+}
+
+void quic_conn_id_set_init(struct quic_conn_id_set *id_set, bool source)
+{
+	id_set->entry_size = source ? sizeof(struct quic_source_conn_id)
+				    : sizeof(struct quic_dest_conn_id);
+	INIT_LIST_HEAD(&id_set->head);
+}
+
+void quic_conn_id_set_free(struct quic_conn_id_set *id_set)
+{
+	struct quic_common_conn_id *common, *tmp;
+
+	list_for_each_entry_safe(common, tmp, &id_set->head, list)
+		quic_conn_id_del(common);
+	id_set->count = 0;
+	id_set->active = NULL;
+}
+
+void quic_conn_id_get_param(struct quic_conn_id_set *id_set, struct quic_transport_param *p)
+{
+	p->active_connection_id_limit = id_set->max_count;
+}
+
+void quic_conn_id_set_param(struct quic_conn_id_set *id_set, struct quic_transport_param *p)
+{
+	id_set->max_count = p->active_connection_id_limit;
+}
diff --git a/net/quic/connid.h b/net/quic/connid.h
new file mode 100644
index 000000000000..cff37b2fb95b
--- /dev/null
+++ b/net/quic/connid.h
@@ -0,0 +1,162 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* QUIC kernel implementation
+ * (C) Copyright Red Hat Corp. 2023
+ *
+ * This file is part of the QUIC kernel implementation
+ *
+ * Written or modified by:
+ *    Xin Long <lucien.xin@gmail.com>
+ */
+
+#define QUIC_CONN_ID_LIMIT	8
+#define QUIC_CONN_ID_DEF	7
+#define QUIC_CONN_ID_LEAST	2
+
+#define QUIC_CONN_ID_TOKEN_LEN	16
+
+/* Common fields shared by both source and destination Connection IDs */
+struct quic_common_conn_id {
+	struct quic_conn_id id;	/* The actual Connection ID value and its length */
+	struct list_head list;	/* Linked list node for conn_id list management */
+	u32 number;		/* Sequence number assigned to this Connection ID */
+	u8 hashed;		/* Non-zero if this ID is stored in source_conn_id hashtable */
+};
+
+struct quic_source_conn_id {
+	struct quic_common_conn_id common;
+	struct hlist_node node; /* Hash table node for fast lookup by Connection ID */
+	struct rcu_head rcu;	/* RCU header for deferred destruction */
+	struct sock *sk;	/* Pointer to sk associated with this Connection ID */
+};
+
+struct quic_dest_conn_id {
+	struct quic_common_conn_id common;
+	u8 token[QUIC_CONN_ID_TOKEN_LEN];	/* Stateless reset token in rfc9000#section-10.3 */
+};
+
+struct quic_conn_id_set {
+	/* Connection ID in use on the current path */
+	struct quic_common_conn_id *active;
+	/* Connection ID to use for a new path (e.g., after migration) */
+	struct quic_common_conn_id *alt;
+	struct list_head head;	/* Head of the linked list of available connection IDs */
+	u8 entry_size;		/* Size of each connection ID entry (in bytes) in the list */
+	u8 max_count;		/* active_connection_id_limit in rfc9000#section-18.2 */
+	u8 count;		/* Current number of connection IDs in the list */
+};
+
+static inline u32 quic_conn_id_first_number(struct quic_conn_id_set *id_set)
+{
+	struct quic_common_conn_id *common;
+
+	common = list_first_entry(&id_set->head, struct quic_common_conn_id, list);
+	return common->number;
+}
+
+static inline u32 quic_conn_id_last_number(struct quic_conn_id_set *id_set)
+{
+	return quic_conn_id_first_number(id_set) + id_set->count - 1;
+}
+
+static inline void quic_conn_id_generate(struct quic_conn_id *conn_id)
+{
+	get_random_bytes(conn_id->data, QUIC_CONN_ID_DEF_LEN);
+	conn_id->len = QUIC_CONN_ID_DEF_LEN;
+}
+
+/* Select an alternate destination Connection ID for a new path (e.g., after migration). */
+static inline bool quic_conn_id_select_alt(struct quic_conn_id_set *id_set, bool active)
+{
+	if (id_set->alt)
+		return true;
+	/* NAT rebinding: peer keeps using the current source conn_id.
+	 * In this case, continue using the same dest conn_id for the new path.
+	 */
+	if (active) {
+		id_set->alt = id_set->active;
+		return true;
+	}
+	/* Treat the prev conn_ids as used.
+	 * Try selecting the next conn_id in the list, unless at the end.
+	 */
+	if (id_set->active->number != quic_conn_id_last_number(id_set)) {
+		id_set->alt = list_next_entry(id_set->active, list);
+		return true;
+	}
+	/* If there's only one conn_id in the list, reuse the active one. */
+	if (id_set->active->number == quic_conn_id_first_number(id_set)) {
+		id_set->alt = id_set->active;
+		return true;
+	}
+	/* No alternate conn_id could be selected.  Caller should send a
+	 * QUIC_FRAME_RETIRE_CONNECTION_ID frame to request new connection IDs from the peer.
+	 */
+	return false;
+}
+
+static inline void quic_conn_id_set_alt(struct quic_conn_id_set *id_set, struct quic_conn_id *alt)
+{
+	id_set->alt = (struct quic_common_conn_id *)alt;
+}
+
+/* Swap the active and alternate destination Connection IDs after path migration completes,
+ * since the path has already been switched accordingly.
+ */
+static inline void quic_conn_id_swap_active(struct quic_conn_id_set *id_set)
+{
+	void *active = id_set->active;
+
+	id_set->active = id_set->alt;
+	id_set->alt = active;
+}
+
+/* Choose which destination Connection ID to use for a new path migration if alt is true. */
+static inline struct quic_conn_id *quic_conn_id_choose(struct quic_conn_id_set *id_set, u8 alt)
+{
+	return (alt && id_set->alt) ? &id_set->alt->id : &id_set->active->id;
+}
+
+static inline struct quic_conn_id *quic_conn_id_active(struct quic_conn_id_set *id_set)
+{
+	return &id_set->active->id;
+}
+
+static inline void quic_conn_id_set_active(struct quic_conn_id_set *id_set,
+					   struct quic_conn_id *active)
+{
+	id_set->active = (struct quic_common_conn_id *)active;
+}
+
+static inline u32 quic_conn_id_number(struct quic_conn_id *conn_id)
+{
+	return ((struct quic_common_conn_id *)conn_id)->number;
+}
+
+static inline struct sock *quic_conn_id_sk(struct quic_conn_id *conn_id)
+{
+	return ((struct quic_source_conn_id *)conn_id)->sk;
+}
+
+static inline void quic_conn_id_set_token(struct quic_conn_id *conn_id, u8 *token)
+{
+	memcpy(((struct quic_dest_conn_id *)conn_id)->token, token, QUIC_CONN_ID_TOKEN_LEN);
+}
+
+static inline int quic_conn_id_cmp(struct quic_conn_id *a, struct quic_conn_id *b)
+{
+	return a->len != b->len || memcmp(a->data, b->data, a->len);
+}
+
+int quic_conn_id_add(struct quic_conn_id_set *id_set, struct quic_conn_id *conn_id,
+		     u32 number, void *data);
+bool quic_conn_id_token_exists(struct quic_conn_id_set *id_set, u8 *token);
+void quic_conn_id_remove(struct quic_conn_id_set *id_set, u32 number);
+
+struct quic_conn_id *quic_conn_id_find(struct quic_conn_id_set *id_set, u32 number);
+struct quic_conn_id *quic_conn_id_lookup(struct net *net, u8 *scid, u32 len);
+void quic_conn_id_update_active(struct quic_conn_id_set *id_set, u32 number);
+
+void quic_conn_id_get_param(struct quic_conn_id_set *id_set, struct quic_transport_param *p);
+void quic_conn_id_set_param(struct quic_conn_id_set *id_set, struct quic_transport_param *p);
+void quic_conn_id_set_init(struct quic_conn_id_set *id_set, bool source);
+void quic_conn_id_set_free(struct quic_conn_id_set *id_set);
diff --git a/net/quic/socket.c b/net/quic/socket.c
index 3357acecc9d6..f03e19c6f73c 100644
--- a/net/quic/socket.c
+++ b/net/quic/socket.c
@@ -42,6 +42,9 @@ static int quic_init_sock(struct sock *sk)
 	sk->sk_write_space = quic_write_space;
 	sock_set_flag(sk, SOCK_USE_WRITE_QUEUE);
 
+	quic_conn_id_set_init(quic_source(sk), 1);
+	quic_conn_id_set_init(quic_dest(sk), 0);
+
 	if (quic_stream_init(quic_streams(sk)))
 		return -ENOMEM;
 
@@ -58,6 +61,9 @@ static int quic_init_sock(struct sock *sk)
 
 static void quic_destroy_sock(struct sock *sk)
 {
+	quic_conn_id_set_free(quic_source(sk));
+	quic_conn_id_set_free(quic_dest(sk));
+
 	quic_stream_free(quic_streams(sk));
 
 	quic_data_free(quic_ticket(sk));
diff --git a/net/quic/socket.h b/net/quic/socket.h
index 43ffc55a8a61..20101de43638 100644
--- a/net/quic/socket.h
+++ b/net/quic/socket.h
@@ -17,6 +17,7 @@
 #include "common.h"
 #include "family.h"
 #include "stream.h"
+#include "connid.h"
 
 #include "protocol.h"
 
@@ -40,6 +41,8 @@ struct quic_sock {
 	struct quic_data		alpn;
 
 	struct quic_stream_table	streams;
+	struct quic_conn_id_set		source;
+	struct quic_conn_id_set		dest;
 };
 
 struct quic6_sock {
@@ -82,6 +85,16 @@ static inline struct quic_stream_table *quic_streams(const struct sock *sk)
 	return &quic_sk(sk)->streams;
 }
 
+static inline struct quic_conn_id_set *quic_source(const struct sock *sk)
+{
+	return &quic_sk(sk)->source;
+}
+
+static inline struct quic_conn_id_set *quic_dest(const struct sock *sk)
+{
+	return &quic_sk(sk)->dest;
+}
+
 static inline bool quic_is_establishing(struct sock *sk)
 {
 	return sk->sk_state == QUIC_SS_ESTABLISHING;
-- 
2.47.1


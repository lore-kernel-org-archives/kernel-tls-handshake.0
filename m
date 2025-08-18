Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085EB340DA5
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 18 Aug 2025 14:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755526358; cv=none; b=S06v/CD5drDRNha+pTI+kXdcx7hKaGy32tT59MELmtv55yvWbGHf+q80Y+/HDbgOTE34mQ1FASa915vY2k0P14DS2+ldg0ieFvmaUpN3PDlwDsk/iEPHI4DJ8HFOp5ckzL1wwOZ4mv6irqjjZKl/xAJp050+opCn1EA4caxZTGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755526358; c=relaxed/simple;
	bh=3lFFxCkxGaQZIoCnA5iVmGQkVlDDIwwjx5Oy8cSPoyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fbsM0NEoam7HjvbYciqWbBO46g9uFHa5+hbf2cJh6F1bisGo/GKsjNoWSj37Lrxg6PcUfmZMHBePKM3FKG18FZEQK2AOBQEAntlC9ug+ATlxfzHcWO0c2a7xoIf3uFsC7KVM3QxP0zd/7R4O3llvDYyWNesu3WLRk6f/VlIw/gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YG90UWbs; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YG90UWbs"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e934c8f9751so1232168276.2
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 18 Aug 2025 07:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755526355; x=1756131155; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHIOGLWxmyG3tAGQOep0nAmn5ewaZRIzD7b+J5aj1f0=;
        b=YG90UWbswdXU9hC16Ov/jJ8JF+GrXYqzqdtvWZV7WSHE3qZ1/Kyc037lXJgNPp9+11
         O3Xw5lPPZTnwihKkdWDSxTRHwRoypICsYVKY7d81MymUJDf2ql/zl3SD6DhXPjzVCaj2
         VlToEe9ZFm6lN4Nmy2GrdQVEDc/MIgqz40R5nvJ+CBA3x2bkoyYKhOfl+DTBatdS2hLY
         lg+GQ4556Q0hQHDwQPJ3kI/4WuTiiONegPD/1WmTISo2oqZWj4sJ5ykkR1h8qOisiNHp
         2ie9S67pHyi7AZpaq5Sfmxj1UKF+rK8y9sDDzZedmMPlhTw4OokUkuNm45EfZD3J+cIm
         qHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755526355; x=1756131155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHIOGLWxmyG3tAGQOep0nAmn5ewaZRIzD7b+J5aj1f0=;
        b=QfYEkstWzq4M8DZ7VuMIsDN2hXGAGWMMfULMMOiLbV3OD5NLhDnmGkQlnc52x/Qdf8
         /OkRBqSk4ZkQEwHMBeNrWXeqf5ons7LO5Q1NNMu2HxIvhNzNNvfPv1Nao/23YKVaEEk+
         Ky7NDWOcPqGoewynqf79WJpcGfOxxIEogMS5wp2dKvZvg/bjTz3ZbWPZ6AEwAE37W9Mr
         wV6y/6kkt5JmPZCfCdsmUW1/OKkcj0aajxQ1xRGQx+hfmILWtmlNSqugaF2NAhrlJnVk
         MQe8puLzjywgPkoeg8y/NvBaO5yd9q4xLvzpkavpsEl3EImmnhSSsK6Hs8OpNFdxoEpG
         I3fg==
X-Forwarded-Encrypted: i=1; AJvYcCV/+1ObuS4B4iOamOQ+CJdAJBSfXkaBq1SD0clJ2Eb09VmOz0vf5z05AZqDieB6Pvq/cTNN1FUo7EAedltD+SuAveYsgg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXDZgk4/l3GyNwQ0j2vGO6ODu02Fs/4Fr89m/7QYfR71HPNZzB
	pty+rOqoxBVbVLOE0UMRg448cNCJd7k+UB3LuGzTC7qegNp1AtfMARUr
X-Gm-Gg: ASbGncvpkukGI9ZhQjexeVWW/3WztE/hk7dHktwaBpJqAbbziKtcTJ0Q00If6WWlpUD
	4esGteRqQVRdmO+3HbQOxAYudMqhBYUtqVczVk6YPGnzUChc5cOboBhwS2cSzmgFRmE9oXYWC6r
	TWKBvnba14zEqHcy/6G0XQtthynKh+24hjuWYw9fKboywoiGPEBmQrDNlSqRj89hBNq8cKVhRjn
	EGMMil0DWKdBrvRvP4d4XP/qXKG9D9PqZQzpsBfJfGcbKWa4F3TIT2djYK/PGJ1CuZ3AxV56+QU
	cHsEcVMjc3EqZtzhiEv5jz90xFP5bINRbCfYlDRkD+0ru44bBJDDu38r236u6MXdOgLIZdfodTQ
	WDJqcUiPE12wpY+sztFN4AxfDG+Oa+JHCMR5wpzoiOkBDkhiBbkUcDc6mVDcUExeym14DT/tyZQ
	==
X-Google-Smtp-Source: AGHT+IGp5BjPRnzVuYk3/SxzpC8PCm3Fsiu5O8QusqrSMVNSIatO4OKaUknDeGLP3fvHgPVRAuOEew==
X-Received: by 2002:a05:6902:15ca:b0:e8d:fa00:4d53 with SMTP id 3f1490d57ef6-e93324ab75amr14502264276.26.1755526354575;
        Mon, 18 Aug 2025 07:12:34 -0700 (PDT)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e933261c40bsm3157451276.8.2025.08.18.07.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 07:12:34 -0700 (PDT)
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
	David Howells <dhowells@redhat.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	"D . Wythe" <alibuda@linux.alibaba.com>,
	Jason Baron <jbaron@akamai.com>,
	illiliti <illiliti@protonmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Daniel Stenberg <daniel@haxx.se>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Subject: [PATCH net-next v2 06/15] quic: add stream management
Date: Mon, 18 Aug 2025 10:04:29 -0400
Message-ID: <a2cd3192c7f301a7370c223d23c9deefecda8a22.1755525878.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1755525878.git.lucien.xin@gmail.com>
References: <cover.1755525878.git.lucien.xin@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces 'struct quic_stream_table' for managing QUIC streams,
each represented by 'struct quic_stream'.

It implements mechanisms for acquiring and releasing streams on both the
send and receive paths, ensuring efficient lifecycle management during
transmission and reception.

- quic_stream_send_get(): Acquire a send-side stream by ID and flags
  during TX path.

- quic_stream_recv_get(): Acquire a receive-side stream by ID during
  RX path.

- quic_stream_send_put(): Release a send-side stream when sending is
  done.

- quic_stream_recv_put(): Release a receive-side stream when receiving
  is done.

It includes logic to detect when stream ID limits are reached and when
control frames should be sent to update or request limits from the peer.

- quic_stream_id_send_exceeds(): Determines whether a
  STREAMS_BLOCKED_UNI/BIDI frame should be sent to the peer.

- quic_stream_max_streams_update(): Determines whether a
  MAX_STREAMS_UNI/BIDI frame should be sent to the peer.

Signed-off-by: Xin Long <lucien.xin@gmail.com>
---
 net/quic/Makefile |   2 +-
 net/quic/socket.c |   5 +
 net/quic/socket.h |   8 +
 net/quic/stream.c | 549 ++++++++++++++++++++++++++++++++++++++++++++++
 net/quic/stream.h | 135 ++++++++++++
 5 files changed, 698 insertions(+), 1 deletion(-)
 create mode 100644 net/quic/stream.c
 create mode 100644 net/quic/stream.h

diff --git a/net/quic/Makefile b/net/quic/Makefile
index 13bf4a4e5442..094e9da5d739 100644
--- a/net/quic/Makefile
+++ b/net/quic/Makefile
@@ -5,4 +5,4 @@
 
 obj-$(CONFIG_IP_QUIC) += quic.o
 
-quic-y := common.o family.o protocol.o socket.o
+quic-y := common.o family.o protocol.o socket.o stream.o
diff --git a/net/quic/socket.c b/net/quic/socket.c
index 58711a224bfd..0ac51cc0c249 100644
--- a/net/quic/socket.c
+++ b/net/quic/socket.c
@@ -42,6 +42,9 @@ static int quic_init_sock(struct sock *sk)
 	sk->sk_write_space = quic_write_space;
 	sock_set_flag(sk, SOCK_USE_WRITE_QUEUE);
 
+	if (quic_stream_init(quic_streams(sk)))
+		return -ENOMEM;
+
 	WRITE_ONCE(sk->sk_sndbuf, READ_ONCE(sysctl_quic_wmem[1]));
 	WRITE_ONCE(sk->sk_rcvbuf, READ_ONCE(sysctl_quic_rmem[1]));
 
@@ -55,6 +58,8 @@ static int quic_init_sock(struct sock *sk)
 
 static void quic_destroy_sock(struct sock *sk)
 {
+	quic_stream_free(quic_streams(sk));
+
 	quic_data_free(quic_ticket(sk));
 	quic_data_free(quic_token(sk));
 	quic_data_free(quic_alpn(sk));
diff --git a/net/quic/socket.h b/net/quic/socket.h
index aeaefc677973..3eba18514ae6 100644
--- a/net/quic/socket.h
+++ b/net/quic/socket.h
@@ -13,6 +13,7 @@
 
 #include "common.h"
 #include "family.h"
+#include "stream.h"
 
 #include "protocol.h"
 
@@ -34,6 +35,8 @@ struct quic_sock {
 	struct quic_data		ticket;
 	struct quic_data		token;
 	struct quic_data		alpn;
+
+	struct quic_stream_table	streams;
 };
 
 struct quic6_sock {
@@ -71,6 +74,11 @@ static inline struct quic_data *quic_alpn(const struct sock *sk)
 	return &quic_sk(sk)->alpn;
 }
 
+static inline struct quic_stream_table *quic_streams(const struct sock *sk)
+{
+	return &quic_sk(sk)->streams;
+}
+
 static inline bool quic_is_establishing(struct sock *sk)
 {
 	return sk->sk_state == QUIC_SS_ESTABLISHING;
diff --git a/net/quic/stream.c b/net/quic/stream.c
new file mode 100644
index 000000000000..f0558ee8d645
--- /dev/null
+++ b/net/quic/stream.c
@@ -0,0 +1,549 @@
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
+
+#include "common.h"
+#include "stream.h"
+
+/* Check if a stream ID is valid for sending. */
+static bool quic_stream_id_send(s64 stream_id, bool is_serv)
+{
+	u8 type = (stream_id & QUIC_STREAM_TYPE_MASK);
+
+	if (is_serv) {
+		if (type == QUIC_STREAM_TYPE_CLIENT_UNI)
+			return false;
+	} else if (type == QUIC_STREAM_TYPE_SERVER_UNI) {
+		return false;
+	}
+	return true;
+}
+
+/* Check if a stream ID is valid for receiving. */
+static bool quic_stream_id_recv(s64 stream_id, bool is_serv)
+{
+	u8 type = (stream_id & QUIC_STREAM_TYPE_MASK);
+
+	if (is_serv) {
+		if (type == QUIC_STREAM_TYPE_SERVER_UNI)
+			return false;
+	} else if (type == QUIC_STREAM_TYPE_CLIENT_UNI) {
+		return false;
+	}
+	return true;
+}
+
+/* Check if a stream ID was initiated locally. */
+static bool quic_stream_id_local(s64 stream_id, u8 is_serv)
+{
+	return is_serv ^ !(stream_id & QUIC_STREAM_TYPE_SERVER_MASK);
+}
+
+/* Check if a stream ID represents a unidirectional stream. */
+static bool quic_stream_id_uni(s64 stream_id)
+{
+	return stream_id & QUIC_STREAM_TYPE_UNI_MASK;
+}
+
+struct quic_stream *quic_stream_find(struct quic_stream_table *streams, s64 stream_id)
+{
+	struct quic_hash_head *head = quic_stream_head(&streams->ht, stream_id);
+	struct quic_stream *stream;
+
+	hlist_for_each_entry(stream, &head->head, node) {
+		if (stream->id == stream_id)
+			break;
+	}
+	return stream;
+}
+
+static void quic_stream_add(struct quic_stream_table *streams, struct quic_stream *stream)
+{
+	struct quic_hash_head *head;
+
+	head = quic_stream_head(&streams->ht, stream->id);
+	hlist_add_head(&stream->node, &head->head);
+}
+
+static void quic_stream_delete(struct quic_stream *stream)
+{
+	hlist_del_init(&stream->node);
+	kfree(stream);
+}
+
+/* Create and register new streams for sending. */
+static struct quic_stream *quic_stream_send_create(struct quic_stream_table *streams,
+						   s64 max_stream_id, u8 is_serv)
+{
+	struct quic_stream *stream;
+	s64 stream_id;
+
+	stream_id = streams->send.next_bidi_stream_id;
+	if (quic_stream_id_uni(max_stream_id))
+		stream_id = streams->send.next_uni_stream_id;
+
+	/* rfc9000#section-2.1: A stream ID that is used out of order results in all streams
+	 * of that type with lower-numbered stream IDs also being opened.
+	 */
+	while (stream_id <= max_stream_id) {
+		stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+		if (!stream)
+			return NULL;
+
+		stream->id = stream_id;
+		if (quic_stream_id_uni(stream_id)) {
+			stream->send.max_bytes = streams->send.max_stream_data_uni;
+
+			if (streams->send.next_uni_stream_id < stream_id + QUIC_STREAM_ID_STEP)
+				streams->send.next_uni_stream_id = stream_id + QUIC_STREAM_ID_STEP;
+			streams->send.streams_uni++;
+
+			quic_stream_add(streams, stream);
+			stream_id += QUIC_STREAM_ID_STEP;
+			continue;
+		}
+
+		if (streams->send.next_bidi_stream_id < stream_id + QUIC_STREAM_ID_STEP)
+			streams->send.next_bidi_stream_id = stream_id + QUIC_STREAM_ID_STEP;
+		streams->send.streams_bidi++;
+
+		if (quic_stream_id_local(stream_id, is_serv)) {
+			stream->send.max_bytes = streams->send.max_stream_data_bidi_remote;
+			stream->recv.max_bytes = streams->recv.max_stream_data_bidi_local;
+		} else {
+			stream->send.max_bytes = streams->send.max_stream_data_bidi_local;
+			stream->recv.max_bytes = streams->recv.max_stream_data_bidi_remote;
+		}
+		stream->recv.window = stream->recv.max_bytes;
+
+		quic_stream_add(streams, stream);
+		stream_id += QUIC_STREAM_ID_STEP;
+	}
+	return stream;
+}
+
+/* Create and register new streams for receiving. */
+static struct quic_stream *quic_stream_recv_create(struct quic_stream_table *streams,
+						   s64 max_stream_id, u8 is_serv)
+{
+	struct quic_stream *stream;
+	s64 stream_id;
+
+	stream_id = streams->recv.next_bidi_stream_id;
+	if (quic_stream_id_uni(max_stream_id))
+		stream_id = streams->recv.next_uni_stream_id;
+
+	/* rfc9000#section-2.1: A stream ID that is used out of order results in all streams
+	 * of that type with lower-numbered stream IDs also being opened.
+	 */
+	while (stream_id <= max_stream_id) {
+		stream = kzalloc(sizeof(*stream), GFP_ATOMIC);
+		if (!stream)
+			return NULL;
+
+		stream->id = stream_id;
+		if (quic_stream_id_uni(stream_id)) {
+			stream->recv.window = streams->recv.max_stream_data_uni;
+			stream->recv.max_bytes = stream->recv.window;
+
+			if (streams->recv.next_uni_stream_id < stream_id + QUIC_STREAM_ID_STEP)
+				streams->recv.next_uni_stream_id = stream_id + QUIC_STREAM_ID_STEP;
+			streams->recv.streams_uni++;
+
+			quic_stream_add(streams, stream);
+			stream_id += QUIC_STREAM_ID_STEP;
+			continue;
+		}
+
+		if (streams->recv.next_bidi_stream_id < stream_id + QUIC_STREAM_ID_STEP)
+			streams->recv.next_bidi_stream_id = stream_id + QUIC_STREAM_ID_STEP;
+		streams->recv.streams_bidi++;
+
+		if (quic_stream_id_local(stream_id, is_serv)) {
+			stream->send.max_bytes = streams->send.max_stream_data_bidi_remote;
+			stream->recv.max_bytes = streams->recv.max_stream_data_bidi_local;
+		} else {
+			stream->send.max_bytes = streams->send.max_stream_data_bidi_local;
+			stream->recv.max_bytes = streams->recv.max_stream_data_bidi_remote;
+		}
+		stream->recv.window = stream->recv.max_bytes;
+
+		quic_stream_add(streams, stream);
+		stream_id += QUIC_STREAM_ID_STEP;
+	}
+	return stream;
+}
+
+/* Check if a send stream ID is already closed. */
+static bool quic_stream_id_send_closed(struct quic_stream_table *streams, s64 stream_id)
+{
+	if (quic_stream_id_uni(stream_id)) {
+		if (stream_id < streams->send.next_uni_stream_id)
+			return true;
+	} else {
+		if (stream_id < streams->send.next_bidi_stream_id)
+			return true;
+	}
+	return false;
+}
+
+/* Check if a receive stream ID is already closed. */
+static bool quic_stream_id_recv_closed(struct quic_stream_table *streams, s64 stream_id)
+{
+	if (quic_stream_id_uni(stream_id)) {
+		if (stream_id < streams->recv.next_uni_stream_id)
+			return true;
+	} else {
+		if (stream_id < streams->recv.next_bidi_stream_id)
+			return true;
+	}
+	return false;
+}
+
+/* Check if a receive stream ID exceeds would exceed local's limits. */
+static bool quic_stream_id_recv_exceeds(struct quic_stream_table *streams, s64 stream_id)
+{
+	if (quic_stream_id_uni(stream_id)) {
+		if (stream_id > streams->recv.max_uni_stream_id)
+			return true;
+	} else {
+		if (stream_id > streams->recv.max_bidi_stream_id)
+			return true;
+	}
+	return false;
+}
+
+/* Check if a send stream ID would exceed peer's limits. */
+bool quic_stream_id_send_exceeds(struct quic_stream_table *streams, s64 stream_id)
+{
+	u64 nstreams;
+
+	if (quic_stream_id_uni(stream_id)) {
+		if (stream_id > streams->send.max_uni_stream_id)
+			return true;
+	} else {
+		if (stream_id > streams->send.max_bidi_stream_id)
+			return true;
+	}
+
+	if (quic_stream_id_uni(stream_id)) {
+		stream_id -= streams->send.next_uni_stream_id;
+		nstreams = quic_stream_id_to_streams(stream_id);
+		if (nstreams + streams->send.streams_uni > streams->send.max_streams_uni)
+			return true;
+	} else {
+		stream_id -= streams->send.next_bidi_stream_id;
+		nstreams = quic_stream_id_to_streams(stream_id);
+		if (nstreams + streams->send.streams_bidi > streams->send.max_streams_bidi)
+			return true;
+	}
+	return false;
+}
+
+/* Get or create a send stream by ID. */
+struct quic_stream *quic_stream_send_get(struct quic_stream_table *streams, s64 stream_id,
+					 u32 flags, bool is_serv)
+{
+	struct quic_stream *stream;
+
+	if (!quic_stream_id_send(stream_id, is_serv))
+		return ERR_PTR(-EINVAL);
+
+	stream = quic_stream_find(streams, stream_id);
+	if (stream) {
+		if ((flags & MSG_STREAM_NEW) &&
+		    stream->send.state != QUIC_STREAM_SEND_STATE_READY)
+			return ERR_PTR(-EINVAL);
+		return stream;
+	}
+
+	if (quic_stream_id_send_closed(streams, stream_id))
+		return ERR_PTR(-ENOSTR);
+
+	if (!(flags & MSG_STREAM_NEW))
+		return ERR_PTR(-EINVAL);
+
+	if (quic_stream_id_send_exceeds(streams, stream_id))
+		return ERR_PTR(-EAGAIN);
+
+	stream = quic_stream_send_create(streams, stream_id, is_serv);
+	if (!stream)
+		return ERR_PTR(-ENOSTR);
+	streams->send.active_stream_id = stream_id;
+	return stream;
+}
+
+/* Get or create a receive stream by ID. */
+struct quic_stream *quic_stream_recv_get(struct quic_stream_table *streams, s64 stream_id,
+					 bool is_serv)
+{
+	struct quic_stream *stream;
+
+	if (!quic_stream_id_recv(stream_id, is_serv))
+		return ERR_PTR(-EINVAL);
+
+	stream = quic_stream_find(streams, stream_id);
+	if (stream)
+		return stream;
+
+	if (quic_stream_id_local(stream_id, is_serv)) {
+		if (quic_stream_id_send_closed(streams, stream_id))
+			return ERR_PTR(-ENOSTR);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (quic_stream_id_recv_closed(streams, stream_id))
+		return ERR_PTR(-ENOSTR);
+
+	if (quic_stream_id_recv_exceeds(streams, stream_id))
+		return ERR_PTR(-EAGAIN);
+
+	stream = quic_stream_recv_create(streams, stream_id, is_serv);
+	if (!stream)
+		return ERR_PTR(-ENOSTR);
+	if (quic_stream_id_send(stream_id, is_serv))
+		streams->send.active_stream_id = stream_id;
+	return stream;
+}
+
+/* Release or clean up a send stream. This function updates stream counters and state when
+ * a send stream has either successfully sent all data or has been reset.
+ */
+void quic_stream_send_put(struct quic_stream_table *streams, struct quic_stream *stream,
+			  bool is_serv)
+{
+	if (quic_stream_id_uni(stream->id)) {
+		/* For unidirectional streams, decrement uni count and delete immediately. */
+		streams->send.streams_uni--;
+		quic_stream_delete(stream);
+		return;
+	}
+
+	/* For bidi streams, only proceed if receive side is in a final state. */
+	if (stream->recv.state != QUIC_STREAM_RECV_STATE_RECVD &&
+	    stream->recv.state != QUIC_STREAM_RECV_STATE_READ &&
+	    stream->recv.state != QUIC_STREAM_RECV_STATE_RESET_RECVD)
+		return;
+
+	if (quic_stream_id_local(stream->id, is_serv)) {
+		/* Local-initiated stream: mark send done and decrement send.bidi count. */
+		if (!stream->send.done) {
+			stream->send.done = 1;
+			streams->send.streams_bidi--;
+		}
+		goto out;
+	}
+	/* Remote-initiated stream: mark recv done and decrement recv bidi count. */
+	if (!stream->recv.done) {
+		stream->recv.done = 1;
+		streams->recv.streams_bidi--;
+		streams->recv.bidi_pending = 1;
+	}
+out:
+	/* Delete stream if fully read or no data received. */
+	if (stream->recv.state == QUIC_STREAM_RECV_STATE_READ || !stream->recv.offset)
+		quic_stream_delete(stream);
+}
+
+/* Release or clean up a receive stream. This function updates stream counters and state when
+ * the receive side has either consumed all data or has been reset.
+ */
+void quic_stream_recv_put(struct quic_stream_table *streams, struct quic_stream *stream,
+			  bool is_serv)
+{
+	if (quic_stream_id_uni(stream->id)) {
+		/* For uni streams, decrement uni count and mark done. */
+		if (!stream->recv.done) {
+			stream->recv.done = 1;
+			streams->recv.streams_uni--;
+			streams->recv.uni_pending = 1;
+		}
+		goto out;
+	}
+
+	/* For bidi streams, only proceed if send side is in a final state. */
+	if (stream->send.state != QUIC_STREAM_SEND_STATE_RECVD &&
+	    stream->send.state != QUIC_STREAM_SEND_STATE_RESET_RECVD)
+		return;
+
+	if (quic_stream_id_local(stream->id, is_serv)) {
+		/* Local-initiated stream: mark send done and decrement send.bidi count. */
+		if (!stream->send.done) {
+			stream->send.done = 1;
+			streams->send.streams_bidi--;
+		}
+		goto out;
+	}
+	/* Remote-initiated stream: mark recv done and decrement recv bidi count. */
+	if (!stream->recv.done) {
+		stream->recv.done = 1;
+		streams->recv.streams_bidi--;
+		streams->recv.bidi_pending = 1;
+	}
+out:
+	/* Delete stream if fully read or no data received. */
+	if (stream->recv.state == QUIC_STREAM_RECV_STATE_READ || !stream->recv.offset)
+		quic_stream_delete(stream);
+}
+
+/* Updates the maximum allowed incoming stream IDs if any streams were recently closed.
+ * Recalculates the max_uni and max_bidi stream ID limits based on the number of open
+ * streams and whether any were marked for deletion.
+ *
+ * Returns true if either max_uni or max_bidi was updated, indicating that a
+ * MAX_STREAMS_UNI or MAX_STREAMS_BIDI frame should be sent to the peer.
+ */
+bool quic_stream_max_streams_update(struct quic_stream_table *streams, s64 *max_uni, s64 *max_bidi)
+{
+	if (streams->recv.uni_pending) {
+		streams->recv.max_uni_stream_id =
+			streams->recv.next_uni_stream_id - QUIC_STREAM_ID_STEP +
+			((streams->recv.max_streams_uni - streams->recv.streams_uni) <<
+			 QUIC_STREAM_TYPE_BITS);
+		*max_uni = quic_stream_id_to_streams(streams->recv.max_uni_stream_id);
+		streams->recv.uni_pending = 0;
+	}
+	if (streams->recv.bidi_pending) {
+		streams->recv.max_bidi_stream_id =
+			streams->recv.next_bidi_stream_id - QUIC_STREAM_ID_STEP +
+			((streams->recv.max_streams_bidi - streams->recv.streams_bidi) <<
+			 QUIC_STREAM_TYPE_BITS);
+		*max_bidi = quic_stream_id_to_streams(streams->recv.max_bidi_stream_id);
+		streams->recv.bidi_pending = 0;
+	}
+
+	return *max_uni || *max_bidi;
+}
+
+int quic_stream_init(struct quic_stream_table *streams)
+{
+	struct quic_hash_table *ht = &streams->ht;
+	struct quic_hash_head *head;
+	int i, size = QUIC_HT_SIZE;
+
+	head = kmalloc_array(size, sizeof(*head), GFP_KERNEL);
+	if (!head)
+		return -ENOMEM;
+	for (i = 0; i < size; i++)
+		INIT_HLIST_HEAD(&head[i].head);
+	ht->size = size;
+	ht->hash = head;
+	return 0;
+}
+
+void quic_stream_free(struct quic_stream_table *streams)
+{
+	struct quic_hash_table *ht = &streams->ht;
+	struct quic_hash_head *head;
+	struct quic_stream *stream;
+	struct hlist_node *tmp;
+	int i;
+
+	for (i = 0; i < ht->size; i++) {
+		head = &ht->hash[i];
+		hlist_for_each_entry_safe(stream, tmp, &head->head, node) {
+			hlist_del_init(&stream->node);
+			kfree(stream);
+		}
+	}
+	kfree(ht->hash);
+}
+
+/* Populate transport parameters from stream hash table. */
+void quic_stream_get_param(struct quic_stream_table *streams, struct quic_transport_param *p,
+			   bool is_serv)
+{
+	if (p->remote) {
+		p->max_stream_data_bidi_remote = streams->send.max_stream_data_bidi_remote;
+		p->max_stream_data_bidi_local = streams->send.max_stream_data_bidi_local;
+		p->max_stream_data_uni = streams->send.max_stream_data_uni;
+		p->max_streams_bidi = streams->send.max_streams_bidi;
+		p->max_streams_uni = streams->send.max_streams_uni;
+		return;
+	}
+
+	p->max_stream_data_bidi_remote = streams->recv.max_stream_data_bidi_remote;
+	p->max_stream_data_bidi_local = streams->recv.max_stream_data_bidi_local;
+	p->max_stream_data_uni = streams->recv.max_stream_data_uni;
+	p->max_streams_bidi = streams->recv.max_streams_bidi;
+	p->max_streams_uni = streams->recv.max_streams_uni;
+}
+
+/* Configure stream hashtable from transport parameters. */
+void quic_stream_set_param(struct quic_stream_table *streams, struct quic_transport_param *p,
+			   bool is_serv)
+{
+	u8 type;
+
+	if (p->remote) {
+		streams->send.max_stream_data_bidi_local = p->max_stream_data_bidi_local;
+		streams->send.max_stream_data_bidi_remote = p->max_stream_data_bidi_remote;
+		streams->send.max_stream_data_uni = p->max_stream_data_uni;
+		streams->send.max_streams_bidi = p->max_streams_bidi;
+		streams->send.max_streams_uni = p->max_streams_uni;
+		streams->send.active_stream_id = -1;
+
+		if (is_serv) {
+			type = QUIC_STREAM_TYPE_SERVER_BIDI;
+			streams->send.max_bidi_stream_id =
+				quic_stream_streams_to_id(p->max_streams_bidi, type);
+			streams->send.next_bidi_stream_id = type;
+
+			type = QUIC_STREAM_TYPE_SERVER_UNI;
+			streams->send.max_uni_stream_id =
+				quic_stream_streams_to_id(p->max_streams_uni, type);
+			streams->send.next_uni_stream_id = type;
+			return;
+		}
+
+		type = QUIC_STREAM_TYPE_CLIENT_BIDI;
+		streams->send.max_bidi_stream_id =
+			quic_stream_streams_to_id(p->max_streams_bidi, type);
+		streams->send.next_bidi_stream_id = type;
+
+		type = QUIC_STREAM_TYPE_CLIENT_UNI;
+		streams->send.max_uni_stream_id =
+			quic_stream_streams_to_id(p->max_streams_uni, type);
+		streams->send.next_uni_stream_id = type;
+		return;
+	}
+
+	streams->recv.max_stream_data_bidi_local = p->max_stream_data_bidi_local;
+	streams->recv.max_stream_data_bidi_remote = p->max_stream_data_bidi_remote;
+	streams->recv.max_stream_data_uni = p->max_stream_data_uni;
+	streams->recv.max_streams_bidi = p->max_streams_bidi;
+	streams->recv.max_streams_uni = p->max_streams_uni;
+
+	if (is_serv) {
+		type = QUIC_STREAM_TYPE_CLIENT_BIDI;
+		streams->recv.max_bidi_stream_id =
+			quic_stream_streams_to_id(p->max_streams_bidi, type);
+		streams->recv.next_bidi_stream_id = type;
+
+		type = QUIC_STREAM_TYPE_CLIENT_UNI;
+		streams->recv.max_uni_stream_id =
+			quic_stream_streams_to_id(p->max_streams_uni, type);
+		streams->recv.next_uni_stream_id = type;
+		return;
+	}
+
+	type = QUIC_STREAM_TYPE_SERVER_BIDI;
+	streams->recv.max_bidi_stream_id =
+		quic_stream_streams_to_id(p->max_streams_bidi, type);
+	streams->recv.next_bidi_stream_id = type;
+
+	type = QUIC_STREAM_TYPE_SERVER_UNI;
+	streams->recv.max_uni_stream_id =
+		quic_stream_streams_to_id(p->max_streams_uni, type);
+	streams->recv.next_uni_stream_id = type;
+}
diff --git a/net/quic/stream.h b/net/quic/stream.h
new file mode 100644
index 000000000000..4f570fdc55f2
--- /dev/null
+++ b/net/quic/stream.h
@@ -0,0 +1,135 @@
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
+#define QUIC_DEF_STREAMS	100
+#define QUIC_MAX_STREAMS	4096ULL
+
+/*
+ * rfc9000#section-2.1:
+ *
+ *   The least significant bit (0x01) of the stream ID identifies the initiator of the stream.
+ *   Client-initiated streams have even-numbered stream IDs (with the bit set to 0), and
+ *   server-initiated streams have odd-numbered stream IDs (with the bit set to 1).
+ *
+ *   The second least significant bit (0x02) of the stream ID distinguishes between bidirectional
+ *   streams (with the bit set to 0) and unidirectional streams (with the bit set to 1).
+ */
+#define QUIC_STREAM_TYPE_BITS	2
+#define QUIC_STREAM_ID_STEP	BIT(QUIC_STREAM_TYPE_BITS)
+
+#define QUIC_STREAM_TYPE_CLIENT_BIDI	0x00
+#define QUIC_STREAM_TYPE_SERVER_BIDI	0x01
+#define QUIC_STREAM_TYPE_CLIENT_UNI	0x02
+#define QUIC_STREAM_TYPE_SERVER_UNI	0x03
+
+struct quic_stream {
+	struct hlist_node node;
+	s64 id;				/* Stream ID as defined in RFC 9000 Section 2.1 */
+	struct {
+		/* Sending-side stream level flow control */
+		u64 last_max_bytes;	/* Maximum send offset advertised by peer at last update */
+		u64 max_bytes;		/* Current maximum offset we are allowed to send to */
+		u64 bytes;		/* Bytes already sent to peer */
+
+		u32 errcode;		/* Application error code to send in RESET_STREAM */
+		u32 frags;		/* Number of sent STREAM frames not yet acknowledged */
+		u8 state;		/* Send stream state, per rfc9000#section-3.1 */
+
+		u8 data_blocked:1;	/* True if flow control blocks sending more data */
+		u8 stop_sent:1;		/* True if STOP_SENDING has been sent, not acknowledged */
+		u8 done:1;		/* True if application indicated end of stream (FIN sent) */
+	} send;
+	struct {
+		/* Receiving-side stream level flow control */
+		u64 max_bytes;		/* Maximum offset peer is allowed to send to */
+		u64 window;		/* Remaining receive window before advertise a new limit */
+		u64 bytes;		/* Bytes consumed by application from the stream */
+
+		u64 highest;		/* Highest received offset */
+		u64 offset;		/* Offset up to which data is in buffer or consumed */
+		u64 finalsz;		/* Final size of the stream if FIN received */
+
+		u32 frags;		/* Number of received STREAM frames pending reassembly */
+		u8 state;		/* Receive stream state, per rfc9000#section-3.2 */
+		u8 done:1;		/* True if FIN received and final size validated */
+	} recv;
+};
+
+struct quic_stream_table {
+	struct quic_hash_table ht;	/* Hash table storing all active streams */
+
+	struct {
+		/* Parameters received from peer, defined in rfc9000#section-18.2 */
+		u64 max_stream_data_bidi_remote;	/* initial_max_stream_data_bidi_remote */
+		u64 max_stream_data_bidi_local;		/* initial_max_stream_data_bidi_local */
+		u64 max_stream_data_uni;		/* initial_max_stream_data_uni */
+		u64 max_streams_bidi;			/* initial_max_streams_bidi */
+		u64 max_streams_uni;			/* initial_max_streams_uni */
+
+		s64 next_bidi_stream_id;	/* Next bidi stream ID to be opened */
+		s64 next_uni_stream_id;		/* Next uni stream ID to be opened */
+		s64 max_bidi_stream_id;		/* Highest allowed bidi stream ID */
+		s64 max_uni_stream_id;		/* Highest allowed uni stream ID */
+		s64 active_stream_id;		/* Most recently opened stream ID */
+
+		u8 bidi_blocked:1;	/* True if STREAMS_BLOCKED_BIDI was sent and not ACKed */
+		u8 uni_blocked:1;	/* True if STREAMS_BLOCKED_UNI was sent and not ACKed */
+		u16 streams_bidi;	/* Number of currently active bidi streams */
+		u16 streams_uni;	/* Number of currently active uni streams */
+	} send;
+	struct {
+		 /* Our advertised limits to the peer, per rfc9000#section-18.2 */
+		u64 max_stream_data_bidi_remote;	/* initial_max_stream_data_bidi_remote */
+		u64 max_stream_data_bidi_local;		/* initial_max_stream_data_bidi_local */
+		u64 max_stream_data_uni;		/* initial_max_stream_data_uni */
+		u64 max_streams_bidi;			/* initial_max_streams_bidi */
+		u64 max_streams_uni;			/* initial_max_streams_uni */
+
+		s64 next_bidi_stream_id;	/* Next expected bidi stream ID from peer */
+		s64 next_uni_stream_id;		/* Next expected uni stream ID from peer */
+		s64 max_bidi_stream_id;		/* Current allowed bidi stream ID range */
+		s64 max_uni_stream_id;		/* Current allowed uni stream ID range */
+
+		u8 bidi_pending:1;	/* True if MAX_STREAMS_BIDI needs to be sent */
+		u8 uni_pending:1;	/* True if MAX_STREAMS_UNI needs to be sent */
+		u16 streams_bidi;	/* Number of currently open bidi streams */
+		u16 streams_uni;	/* Number of currently open uni streams */
+	} recv;
+};
+
+static inline u64 quic_stream_id_to_streams(s64 stream_id)
+{
+	return (u64)(stream_id >> QUIC_STREAM_TYPE_BITS) + 1;
+}
+
+static inline s64 quic_stream_streams_to_id(u64 streams, u8 type)
+{
+	return (s64)((streams - 1) << QUIC_STREAM_TYPE_BITS) | type;
+}
+
+struct quic_stream *quic_stream_send_get(struct quic_stream_table *streams, s64 stream_id,
+					 u32 flags, bool is_serv);
+struct quic_stream *quic_stream_recv_get(struct quic_stream_table *streams, s64 stream_id,
+					 bool is_serv);
+void quic_stream_send_put(struct quic_stream_table *streams, struct quic_stream *stream,
+			  bool is_serv);
+void quic_stream_recv_put(struct quic_stream_table *streams, struct quic_stream *stream,
+			  bool is_serv);
+
+bool quic_stream_max_streams_update(struct quic_stream_table *streams, s64 *max_uni, s64 *max_bidi);
+struct quic_stream *quic_stream_find(struct quic_stream_table *streams, s64 stream_id);
+bool quic_stream_id_send_exceeds(struct quic_stream_table *streams, s64 stream_id);
+
+void quic_stream_get_param(struct quic_stream_table *streams, struct quic_transport_param *p,
+			   bool is_serv);
+void quic_stream_set_param(struct quic_stream_table *streams, struct quic_transport_param *p,
+			   bool is_serv);
+void quic_stream_free(struct quic_stream_table *streams);
+int quic_stream_init(struct quic_stream_table *streams);
-- 
2.47.1


Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D83A1531F2
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Sep 2024 02:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725935511; cv=none; b=RstvTfzPIAqX27xjk3bDgUQnrMEwl8leqa1hAn7J9Cta1c9GAw/pNxI9kxW+qJhCONp7afKRlrO4IB18P8MIKaUVsgRZeqEo/j4hi15CHrAIvH5as4eipcWPYucsXBcDQm48+BYk52+xdZc3NfUv9ZigbVCVk2jFqEQzgl/BYF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725935511; c=relaxed/simple;
	bh=jpuzbIhb7je/iBljgORmUy5tR3CprUXlqNxn3+UBeAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p43JaDmjwkLPbb9YMHCH+TrEeLSeIYyYltAu0URxZGsFHx9+27aiGtSTyveK7D2EwdjSYLjzXBAK1mlnflGF8j+7+sV5zzSAJg9kGyuwFUKDDAjfRpTg9OC/nu5elhs8sZeeZR2ennYr+vL8YAzAoaeCS6iNv5oPEuYg+ui4J60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+ZxXQNu; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+ZxXQNu"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a9ae8fc076so168976885a.2
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 09 Sep 2024 19:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725935508; x=1726540308; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNNtw40uQSQZbwWWnLBGkGiKcVvxU2yrFk6Vg0kaCjQ=;
        b=f+ZxXQNuSpn9E49MogDayLv6qRaShqLRB+0jAB8KwxzzammGPJZ9Xt1Lo4sn0i9cwQ
         tqR2Znwt6DazWoNqNfVjQHFQhibW2Abs/5Z1K0xlUGHBBmnAW5tOe/MNoqzelhCGnF1A
         5e+ihUH9OErqBJKFuWxaztxzpkSrcsCdb1DslONhod7xg+8KAzBr+pX57sxoeZ6+LhKu
         t8cfkf4us4KDbyHy1jXUuywdExfN70AQHOJBL/kdzoIO1Jk0xzQFiwWRT985kzsgB8im
         DPA0lXgiuOGlPdo6m5fG2D7Skw12A+RrNDs/4nHp4HLk4PoDLShSdt0fD9zd5girNnTj
         wpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725935508; x=1726540308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNNtw40uQSQZbwWWnLBGkGiKcVvxU2yrFk6Vg0kaCjQ=;
        b=wWl9e9hkZCWsshhkd7FFjn5cm3dX7tAiERlDLUF65IpSZaaNN5VlWJ9/l52ZXev17G
         vhWr7Io3hZAydPFGqyg5F4UPlfIHC6H1VwBYm6BKvdRv9mq0a78i+cBYMy7YhnTo8IOm
         CkXVGEjMFnixC/wk5Kf95pZmM1l516BLMHWsxXEryQiuUyjrMPbPc40eFTu+K74pcXTt
         rHWucOZe7rtUERpsenzOtx9fSzXXOLu2yxJFkHxbs/TJc1k84PC38ekZ+kw0vR+QPa2s
         3Oz2YR5DtGt3m/gKOGlSt7pLH4fF/jkyjh8i3XsAGmpBZwdeWOZ3VpnrhSW4M42Pop0G
         9TvA==
X-Forwarded-Encrypted: i=1; AJvYcCVWRBG9NynxJFk8doE3DoUN+Kkk1bL+PudTmoA7IiWj0HHqClu8lCgWGTkJj5b6F9K8Jr+4KHJsagKirOK4MAKcPL577g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNFqHVqKg8/wwGxkJMjuVkIvJd/HnSjkOgjELo1614/PKG4sSt
	llPNNKcilaDHGxCQtaZNzLVXkLdq6OTtlC2pegPC/PCe3/vGx51/
X-Google-Smtp-Source: AGHT+IEQNq+bqPRE+PDVk/zG6vGoRkF3aXnhQWmCJ0jFFnL23iYwfcidZakjYG/TWYtozs7KtqlSZg==
X-Received: by 2002:a05:620a:4005:b0:7a9:be8f:5c65 with SMTP id af79cd13be357-7a9be8f5fddmr353265285a.15.1725935508339;
        Mon, 09 Sep 2024 19:31:48 -0700 (PDT)
Received: from wsfd-netdev15.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a9a7a1f594sm270429885a.121.2024.09.09.19.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 19:31:48 -0700 (PDT)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Moritz Buhl <mbuhl@openbsd.org>,
	Tyler Fanelli <tfanelli@redhat.com>,
	Pengtao He <hepengtao@xiaomi.com>,
	linux-cifs@vger.kernel.org,
	Steve French <smfrench@gmail.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Stefan Metzmacher <metze@samba.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Tom Talpey <tom@talpey.com>,
	kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>,
	Steve Dickson <steved@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Alexander Aring <aahringo@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Daniel Stenberg <daniel@haxx.se>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Subject: [PATCH net-next 2/5] net: include quic.h in include/uapi/linux for QUIC protocol
Date: Mon,  9 Sep 2024 22:30:17 -0400
Message-ID: <69a652ff40f0a9c6ca6894ed0a815515a949861a.1725935420.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1725935420.git.lucien.xin@gmail.com>
References: <cover.1725935420.git.lucien.xin@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit introduces quic.h to the include/uapi/linux directory,
providing header file with necessary definitions for QUIC. Including
quic.h enables both user space applications and kernel consumers to
access QUIC-related Send/Receive Control Messages, Socket Options and
Events/Notifications APIs.

Signed-off-by: Xin Long <lucien.xin@gmail.com>
Signed-off-by: Moritz Buhl <mbuhl@openbsd.org>
Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
Signed-off-by: Pengtao He <hepengtao@xiaomi.com>
---
 include/uapi/linux/quic.h | 192 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)
 create mode 100644 include/uapi/linux/quic.h

diff --git a/include/uapi/linux/quic.h b/include/uapi/linux/quic.h
new file mode 100644
index 000000000000..aab7b85838d6
--- /dev/null
+++ b/include/uapi/linux/quic.h
@@ -0,0 +1,192 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/* QUIC kernel implementation
+ * (C) Copyright Red Hat Corp. 2023
+ *
+ * This file is part of the QUIC kernel implementation
+ *
+ * Written or modified by:
+ *    Xin Long <lucien.xin@gmail.com>
+ */
+
+#ifndef __uapi_quic_h__
+#define __uapi_quic_h__
+
+#include <linux/socket.h>
+#ifdef __KERNEL__
+#include <linux/types.h>
+#else
+#include <stdint.h>
+#endif
+
+/* Send or Receive Options APIs */
+enum quic_cmsg_type {
+	QUIC_STREAM_INFO,
+	QUIC_HANDSHAKE_INFO,
+};
+
+#define QUIC_STREAM_TYPE_SERVER_MASK	0x01
+#define QUIC_STREAM_TYPE_UNI_MASK	0x02
+#define QUIC_STREAM_TYPE_MASK		0x03
+
+enum quic_msg_flags {
+	/* flags for stream_flags */
+	MSG_STREAM_NEW		= 0x400,
+	MSG_STREAM_FIN		= 0x200,
+	MSG_STREAM_UNI		= 0x800,
+	MSG_STREAM_DONTWAIT	= 0x10000,
+
+	/* extented flags for msg_flags */
+	MSG_DATAGRAM		= 0x10,
+	MSG_NOTIFICATION	= 0x8000,
+};
+
+enum quic_crypto_level {
+	QUIC_CRYPTO_APP,
+	QUIC_CRYPTO_INITIAL,
+	QUIC_CRYPTO_HANDSHAKE,
+	QUIC_CRYPTO_EARLY,
+	QUIC_CRYPTO_MAX,
+};
+
+struct quic_handshake_info {
+	uint8_t	crypto_level;
+};
+
+struct quic_stream_info {
+	int64_t  stream_id;
+	uint32_t stream_flags;
+};
+
+/* Socket Options APIs */
+#define QUIC_SOCKOPT_EVENT				0
+#define QUIC_SOCKOPT_STREAM_OPEN			1
+#define QUIC_SOCKOPT_STREAM_RESET			2
+#define QUIC_SOCKOPT_STREAM_STOP_SENDING		3
+#define QUIC_SOCKOPT_CONNECTION_CLOSE			4
+#define QUIC_SOCKOPT_CONNECTION_MIGRATION		5
+#define QUIC_SOCKOPT_KEY_UPDATE				6
+#define QUIC_SOCKOPT_TRANSPORT_PARAM			7
+#define QUIC_SOCKOPT_CONFIG				8
+#define QUIC_SOCKOPT_TOKEN				9
+#define QUIC_SOCKOPT_ALPN				10
+#define QUIC_SOCKOPT_SESSION_TICKET			11
+#define QUIC_SOCKOPT_CRYPTO_SECRET			12
+#define QUIC_SOCKOPT_TRANSPORT_PARAM_EXT		13
+#define QUIC_SOCKOPT_RETIRE_CONNECTION_ID		14
+#define QUIC_SOCKOPT_ACTIVE_CONNECTION_ID		15
+
+#define QUIC_VERSION_V1			0x1
+#define QUIC_VERSION_V2			0x6b3343cf
+
+struct quic_transport_param {
+	uint8_t		remote;
+	uint8_t		disable_active_migration;
+	uint8_t		grease_quic_bit;
+	uint8_t		stateless_reset;
+	uint8_t		disable_1rtt_encryption;
+	uint8_t		disable_compatible_version;
+	uint64_t	max_udp_payload_size;
+	uint64_t	ack_delay_exponent;
+	uint64_t	max_ack_delay;
+	uint64_t	active_connection_id_limit;
+	uint64_t	max_idle_timeout;
+	uint64_t	max_datagram_frame_size;
+	uint64_t	max_data;
+	uint64_t	max_stream_data_bidi_local;
+	uint64_t	max_stream_data_bidi_remote;
+	uint64_t	max_stream_data_uni;
+	uint64_t	max_streams_bidi;
+	uint64_t	max_streams_uni;
+};
+
+struct quic_config {
+	uint32_t	version;
+	uint32_t	plpmtud_probe_interval;
+	uint64_t	initial_smoothed_rtt;
+	uint8_t		congestion_control_algo;
+	uint8_t		validate_peer_address;
+	uint32_t	payload_cipher_type;
+	uint8_t		receive_session_ticket;
+	uint8_t		certificate_request;
+};
+
+struct quic_crypto_secret {
+	uint8_t send;  /* send or recv */
+	uint8_t level; /* crypto level */
+	uint32_t type; /* TLS_CIPHER_* */
+	uint8_t secret[48];
+};
+
+enum {
+	QUIC_CONG_ALG_RENO,
+	QUIC_CONG_ALG_CUBIC,
+	QUIC_CONG_ALG_MAX,
+};
+
+struct quic_errinfo {
+	uint64_t stream_id;
+	uint32_t errcode;
+};
+
+struct quic_connection_id_info {
+	uint32_t source;
+	uint32_t dest;
+};
+
+struct quic_event_option {
+	uint8_t type;
+	uint8_t on;
+};
+
+/* Event APIs */
+enum quic_event_type {
+	QUIC_EVENT_NONE,
+	QUIC_EVENT_STREAM_UPDATE,
+	QUIC_EVENT_STREAM_MAX_STREAM,
+	QUIC_EVENT_CONNECTION_CLOSE,
+	QUIC_EVENT_CONNECTION_MIGRATION,
+	QUIC_EVENT_KEY_UPDATE,
+	QUIC_EVENT_NEW_TOKEN,
+	QUIC_EVENT_NEW_SESSION_TICKET,
+	QUIC_EVENT_END,
+	QUIC_EVENT_MAX = QUIC_EVENT_END - 1,
+};
+
+enum {
+	QUIC_STREAM_SEND_STATE_READY,
+	QUIC_STREAM_SEND_STATE_SEND,
+	QUIC_STREAM_SEND_STATE_SENT,
+	QUIC_STREAM_SEND_STATE_RECVD,
+	QUIC_STREAM_SEND_STATE_RESET_SENT,
+	QUIC_STREAM_SEND_STATE_RESET_RECVD,
+
+	QUIC_STREAM_RECV_STATE_RECV,
+	QUIC_STREAM_RECV_STATE_SIZE_KNOWN,
+	QUIC_STREAM_RECV_STATE_RECVD,
+	QUIC_STREAM_RECV_STATE_READ,
+	QUIC_STREAM_RECV_STATE_RESET_RECVD,
+	QUIC_STREAM_RECV_STATE_RESET_READ,
+};
+
+struct quic_stream_update {
+	uint64_t id;
+	uint32_t state;
+	uint32_t errcode;
+	uint64_t finalsz;
+};
+
+struct quic_connection_close {
+	uint32_t errcode;
+	uint8_t frame;
+	uint8_t phrase[];
+};
+
+union quic_event {
+	struct quic_stream_update update;
+	struct quic_connection_close close;
+	uint64_t max_stream;
+	uint8_t local_migration;
+	uint8_t key_update_phase;
+};
+
+#endif /* __uapi_quic_h__ */
-- 
2.43.0


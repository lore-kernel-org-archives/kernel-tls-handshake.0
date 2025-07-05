Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4F7217F35
	for <kernel-tls-handshake@lists.linux.dev>; Sat,  5 Jul 2025 19:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751744334; cv=none; b=YlAQJgg85/a20YHpwJvGrRxnMiLKgyph6eNlPtw4oj/FsVDKzb7GkIp2lrXfW8gVXQxIC+fvHfj+7xjkYQmwKYXMLT+qXIce3doj/5ZL5cZG01ChMLknHt8xalpMzmROsgTGHMLmQccCXiTTDiXCx2VJwcCznDcyug8EM6m3h/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751744334; c=relaxed/simple;
	bh=bmjPzA2BCOwrD+QKu541jc9Ab0UMkXPP2PFocR7fo8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N7bzNQVjsHkwfHiGAP0ed0Q69INEWbW4TALuKlLqwI5bBVf10RSqCbC7mOpVgaTGdpu2dwgAC6VHvKFAR3X3iGpGhCKnEB2TRkDLY4civ57PpggGHwfwUIsD4sh8Gl0CmhsdqlVxPt8f8hYjHb/N8kVYxBdepbA8IZzhtzFRMJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJZqJ/4i; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJZqJ/4i"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-700c7e4c048so37781946d6.3
        for <kernel-tls-handshake@lists.linux.dev>; Sat, 05 Jul 2025 12:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751744332; x=1752349132; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMmkHBgsZ108YewyulwaZdOHr12XBKqkl08TzF6+sCE=;
        b=mJZqJ/4iqH6BkcT616eOz3VbX7ZO/WTWgZDo7gTqmBIfCQyG4dMRvMgIIyghA7Wii6
         vZ5wNtNwulSCCcljivMJRpG5AvwbOMavZ88Phf/ZilBniLDSIeCPWkWOd1JlINQvAOxS
         6g5QhDSbQVuYhL7YXoEJ0G2biwouCb/fYZnSJ31qDd1+MZn2c7V+5bFaZolrxjLhh13I
         YMMnV3AjDFuxH6TZf31cd5EFZyDlmvLVlU2vncFS/gwT+rtepISWnZfuhBGcQmBmlkW0
         Cibw9HrPWPaEZLYfehbGEQ0NaCEjNnsYGi1IIPi/u/ufAsn1YlmqYP+zTthib+a9lfwc
         KzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751744332; x=1752349132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMmkHBgsZ108YewyulwaZdOHr12XBKqkl08TzF6+sCE=;
        b=DRHcFTABQHV2mLsDtiQ+9HW508RerRZ2bvb7AVy39jYai21Sk/qeE9AplLBU9hJ2Jd
         +tQsmJxeFEPSMMPJcx+2iNLqz76wTpFCOVtbsn/d0+gMzc9izfSBBfzQ3o5xRPJHS8AX
         y4gYb/VXd9kOHwN3E6U+tCeoOxgiomMcEzDpZwV6/ubE3ahI+3k9wwaPrSgTfJcPzchK
         1/KoVjjPAJ4UfIYGcRV7leoiJWp31Y5HbA+7WJM3NK7UCBX2lpKN0nRo39mpckkgLeBj
         kEDCdBqvw9yieus2GM92kYKsvHw+ZcLudOQjjz6C8WAiFycvFkFhzKUfljtytQ7Yt1dQ
         y9OQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXJb+bjjqS/5NeDF7kHV6pUmQE4SL6ZoYy1iPgjRH/5Gl6uA6FmCaD1UTpj9JG8qgPC0CEdhOI4J6YWXgUNJSqCbu4Dg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgMxVxH/6fQzXEco2y6k69ezHJuhc4qXuLY14v/hvvJGNJm7yo
	GgK//RMle+dE06He7LsaKe5+xNrRqHCmguFRfHfnIBVg/zQvIltaghOS
X-Gm-Gg: ASbGnculMA6ThIQZODDXSrBFJc1XQVqok2UYdyBMJOzEid0elnlWQfI4vi1lwEsm0IN
	GzaNppDcXG2oCFTCiuAyTmyonzFX6qWGqQnhN8EylHb/R8UiSDavWGU+mBaoDr9OblXhDtOaii2
	HI8J7z0ic4O1FN+UqKlTRVlTMnn914J4YN1yUeDU+eGvhTk8Q+vjILqGmLa6tIo/DPnmsgT5bFJ
	4BTy/7HDd5ZdkK3fl3LvTBs0xrAuAriDXUjcmsN9Fgpmfsety5h0E8l9WQAEEsaGALwfZwInd2X
	pwS0zKmpOE6ZfN6aSATRHaMgAnBfq+m11sHDzPls79WeKVHr12/pW3EnTQ+TxRloZivwKGrSxoJ
	r1cMrYC1J7gXj54ULWvuHQl2cQh4=
X-Google-Smtp-Source: AGHT+IHlCr2pJT2WWfnP+0fsQr/nSfxE7X9LJrhWNzK9Dss2/Xd6Jbu1d4D4GHlZHTaqlkcphNphuQ==
X-Received: by 2002:a05:6214:5885:b0:6fd:3a4d:363a with SMTP id 6a1803df08f44-702d1684ec1mr44424346d6.25.1751744331707;
        Sat, 05 Jul 2025 12:38:51 -0700 (PDT)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d6019csm32999146d6.106.2025.07.05.12.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:38:51 -0700 (PDT)
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
Subject: [PATCH net-next 05/15] quic: provide quic.h header files for kernel and userspace
Date: Sat,  5 Jul 2025 15:31:44 -0400
Message-ID: <74b62316e4a265bf2e5c0b3cf7061b4a6fde68b1.1751743914.git.lucien.xin@gmail.com>
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

This commit adds quic.h to include/uapi/linux, providing the necessary
definitions for the QUIC socket API. Exporting this header allows both
user space applications and kernel subsystems to access QUIC-related
control messages, socket options, and event/notification interfaces.

Since kernel_get/setsockopt() is no longer available to kernel consumers,
a corresponding internal header, include/linux/quic.h, is added. This
provides kernel subsystems with the necessary declarations to handle
QUIC socket options directly.

Detailed descriptions of these structures are available in [1], and will
be also provided when adding corresponding socket interfaces in the
later patches.

[1] https://datatracker.ietf.org/doc/html/draft-lxin-quic-socket-apis

Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Xin Long <lucien.xin@gmail.com>
---
 include/linux/quic.h      |  19 +++
 include/uapi/linux/quic.h | 238 ++++++++++++++++++++++++++++++++++++++
 net/quic/socket.c         |  38 ++++++
 net/quic/socket.h         |   7 ++
 4 files changed, 302 insertions(+)
 create mode 100644 include/linux/quic.h
 create mode 100644 include/uapi/linux/quic.h

diff --git a/include/linux/quic.h b/include/linux/quic.h
new file mode 100644
index 000000000000..50d18625974c
--- /dev/null
+++ b/include/linux/quic.h
@@ -0,0 +1,19 @@
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
+#ifndef __linux_quic_h__
+#define __linux_quic_h__
+
+#include <uapi/linux/quic.h>
+
+int quic_kernel_setsockopt(struct sock *sk, int optname, void *optval, unsigned int optlen);
+int quic_kernel_getsockopt(struct sock *sk, int optname, void *optval, unsigned int *optlen);
+
+#endif
diff --git a/include/uapi/linux/quic.h b/include/uapi/linux/quic.h
new file mode 100644
index 000000000000..789c5a205f8f
--- /dev/null
+++ b/include/uapi/linux/quic.h
@@ -0,0 +1,238 @@
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
+#ifdef __KERNEL__
+#include <linux/socket.h>
+#include <linux/types.h>
+#else
+#include <sys/socket.h>
+#include <stdint.h>
+#endif
+
+/* NOTE: Structure descriptions are specified in:
+ * https://datatracker.ietf.org/doc/html/draft-lxin-quic-socket-apis
+ */
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
+	MSG_STREAM_NEW		= MSG_SYN,
+	MSG_STREAM_FIN		= MSG_FIN,
+	MSG_STREAM_UNI		= MSG_CONFIRM,
+	MSG_STREAM_DONTWAIT	= MSG_WAITFORONE,
+	MSG_STREAM_SNDBLOCK	= MSG_ERRQUEUE,
+
+	/* extented flags for msg_flags */
+	MSG_DATAGRAM		= MSG_RST,
+	MSG_NOTIFICATION	= MSG_MORE,
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
+#define QUIC_SOCKOPT_CONNECTION_ID			4
+#define QUIC_SOCKOPT_CONNECTION_CLOSE			5
+#define QUIC_SOCKOPT_CONNECTION_MIGRATION		6
+#define QUIC_SOCKOPT_KEY_UPDATE				7
+#define QUIC_SOCKOPT_TRANSPORT_PARAM			8
+#define QUIC_SOCKOPT_CONFIG				9
+#define QUIC_SOCKOPT_TOKEN				10
+#define QUIC_SOCKOPT_ALPN				11
+#define QUIC_SOCKOPT_SESSION_TICKET			12
+#define QUIC_SOCKOPT_CRYPTO_SECRET			13
+#define QUIC_SOCKOPT_TRANSPORT_PARAM_EXT		14
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
+	uint8_t		active_connection_id_limit;
+	uint8_t		ack_delay_exponent;
+	uint16_t	max_datagram_frame_size;
+	uint16_t	max_udp_payload_size;
+	uint32_t	max_idle_timeout;
+	uint32_t	max_ack_delay;
+	uint16_t	max_streams_bidi;
+	uint16_t	max_streams_uni;
+	uint64_t	max_data;
+	uint64_t	max_stream_data_bidi_local;
+	uint64_t	max_stream_data_bidi_remote;
+	uint64_t	max_stream_data_uni;
+	uint64_t	reserved;
+};
+
+struct quic_config {
+	uint32_t	version;
+	uint32_t	plpmtud_probe_interval;
+	uint32_t	initial_smoothed_rtt;
+	uint32_t	payload_cipher_type;
+	uint8_t		congestion_control_algo;
+	uint8_t		validate_peer_address;
+	uint8_t		stream_data_nodelay;
+	uint8_t		receive_session_ticket;
+	uint8_t		certificate_request;
+	uint8_t		reserved[3];
+};
+
+struct quic_crypto_secret {
+	uint8_t send;  /* send or recv */
+	uint8_t level; /* crypto level */
+	uint32_t type; /* TLS_CIPHER_* */
+#define QUIC_CRYPTO_SECRET_BUFFER_SIZE 48
+	uint8_t secret[QUIC_CRYPTO_SECRET_BUFFER_SIZE];
+};
+
+enum quic_cong_algo {
+	QUIC_CONG_ALG_RENO,
+	QUIC_CONG_ALG_CUBIC,
+	QUIC_CONG_ALG_MAX,
+};
+
+struct quic_errinfo {
+	int64_t  stream_id;
+	uint32_t errcode;
+};
+
+struct quic_connection_id_info {
+	uint8_t  dest;
+	uint32_t active;
+	uint32_t prior_to;
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
+	QUIC_EVENT_STREAM_MAX_DATA,
+	QUIC_EVENT_STREAM_MAX_STREAM,
+	QUIC_EVENT_CONNECTION_ID,
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
+	int64_t  id;
+	uint8_t  state;
+	uint32_t errcode;
+	uint64_t finalsz;
+};
+
+struct quic_stream_max_data {
+	int64_t  id;
+	uint64_t max_data;
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
+	struct quic_stream_max_data max_data;
+	struct quic_connection_close close;
+	struct quic_connection_id_info info;
+	uint64_t max_stream;
+	uint8_t local_migration;
+	uint8_t key_update_phase;
+};
+
+enum {
+	QUIC_TRANSPORT_ERROR_NONE,
+	QUIC_TRANSPORT_ERROR_INTERNAL,
+	QUIC_TRANSPORT_ERROR_CONNECTION_REFUSED,
+	QUIC_TRANSPORT_ERROR_FLOW_CONTROL,
+	QUIC_TRANSPORT_ERROR_STREAM_LIMIT,
+	QUIC_TRANSPORT_ERROR_STREAM_STATE,
+	QUIC_TRANSPORT_ERROR_FINAL_SIZE,
+	QUIC_TRANSPORT_ERROR_FRAME_ENCODING,
+	QUIC_TRANSPORT_ERROR_TRANSPORT_PARAM,
+	QUIC_TRANSPORT_ERROR_CONNECTION_ID_LIMIT,
+	QUIC_TRANSPORT_ERROR_PROTOCOL_VIOLATION,
+	QUIC_TRANSPORT_ERROR_INVALID_TOKEN,
+	QUIC_TRANSPORT_ERROR_APPLICATION,
+	QUIC_TRANSPORT_ERROR_CRYPTO_BUF_EXCEEDED,
+	QUIC_TRANSPORT_ERROR_KEY_UPDATE,
+	QUIC_TRANSPORT_ERROR_AEAD_LIMIT_REACHED,
+	QUIC_TRANSPORT_ERROR_NO_VIABLE_PATH,
+
+	/* The cryptographic handshake failed. A range of 256 values is reserved
+	 * for carrying error codes specific to the cryptographic handshake that
+	 * is used. Codes for errors occurring when TLS is used for the
+	 * cryptographic handshake are described in Section 4.8 of [QUIC-TLS].
+	 */
+	QUIC_TRANSPORT_ERROR_CRYPTO = 0x0100,
+};
+
+#endif /* __uapi_quic_h__ */
diff --git a/net/quic/socket.c b/net/quic/socket.c
index 025fb3ae2941..da0fded4d79c 100644
--- a/net/quic/socket.c
+++ b/net/quic/socket.c
@@ -126,6 +126,25 @@ static int quic_setsockopt(struct sock *sk, int level, int optname,
 	return quic_do_setsockopt(sk, optname, optval, optlen);
 }
 
+/**
+ * quic_kernel_setsockopt - set a QUIC socket option from within the kernel
+ * @sk: socket to configure
+ * @optname: option name (QUIC-level)
+ * @optval: pointer to the option value
+ * @optlen: size of the option value
+ *
+ * Sets a QUIC socket option on a kernel socket without involving user space.
+ *
+ * Return values:
+ * - On success, 0 is returned.
+ * - On error, a negative error value is returned.
+ */
+int quic_kernel_setsockopt(struct sock *sk, int optname, void *optval, unsigned int optlen)
+{
+	return quic_do_setsockopt(sk, optname, KERNEL_SOCKPTR(optval), optlen);
+}
+EXPORT_SYMBOL_GPL(quic_kernel_setsockopt);
+
 static int quic_do_getsockopt(struct sock *sk, int optname, sockptr_t optval, sockptr_t optlen)
 {
 	return -EOPNOTSUPP;
@@ -140,6 +159,25 @@ static int quic_getsockopt(struct sock *sk, int level, int optname,
 	return quic_do_getsockopt(sk, optname, USER_SOCKPTR(optval), USER_SOCKPTR(optlen));
 }
 
+/**
+ * quic_kernel_getsockopt - get a QUIC socket option from within the kernel
+ * @sk: socket to query
+ * @optname: option name (QUIC-level)
+ * @optval: pointer to the buffer to receive the option value
+ * @optlen: pointer to the size of the buffer; updated to actual length on return
+ *
+ * Gets a QUIC socket option from a kernel socket, bypassing user space.
+ *
+ * Return values:
+ * - On success, 0 is returned.
+ * - On error, a negative error value is returned.
+ */
+int quic_kernel_getsockopt(struct sock *sk, int optname, void *optval, unsigned int *optlen)
+{
+	return quic_do_getsockopt(sk, optname, KERNEL_SOCKPTR(optval), KERNEL_SOCKPTR(optlen));
+}
+EXPORT_SYMBOL_GPL(quic_kernel_getsockopt);
+
 static void quic_release_cb(struct sock *sk)
 {
 }
diff --git a/net/quic/socket.h b/net/quic/socket.h
index 40e48a783d76..2b9eb5aeb7a4 100644
--- a/net/quic/socket.h
+++ b/net/quic/socket.h
@@ -12,6 +12,7 @@
 #define __net_quic_h__
 
 #include <net/udp_tunnel.h>
+#include <linux/quic.h>
 
 #include "common.h"
 #include "family.h"
@@ -32,6 +33,7 @@ struct quic_sock {
 	struct inet_sock		inet;
 	struct list_head		reqs;
 
+	struct quic_config		config;
 	struct quic_data		ticket;
 	struct quic_data		token;
 	struct quic_data		alpn;
@@ -52,6 +54,11 @@ static inline struct list_head *quic_reqs(const struct sock *sk)
 	return &quic_sk(sk)->reqs;
 }
 
+static inline struct quic_config *quic_config(const struct sock *sk)
+{
+	return &quic_sk(sk)->config;
+}
+
 static inline struct quic_data *quic_token(const struct sock *sk)
 {
 	return &quic_sk(sk)->token;
-- 
2.47.1


Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9C333290C
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  5 Jan 2026 15:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767628262; cv=none; b=rglKoCz03FO9FQFHVqJcF/0O5OuANB1HhUlPw6XbCvlGgRgln81u6yh4IT/5YVg/L2Bb3YHHDujOSRpeo3t4eWHme1IXobbj1Q4LNaKGsnjsKkzZLk0hwLHHlrxcnMbw12TzpH7h5Ol3DUmw6/x1rDqSQpNr/7oNTodxMWf74Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767628262; c=relaxed/simple;
	bh=dedmq9oA3Uxp1hz02UjVP58Oc3MfLUICc/mgyUjuXlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nF0JFI+YVmUCKvHm+0d9m4u4aGfbntWOzMD/lxVwKHX41Op8UqyOH8xrHZC/2updOMTOSz6z2bdvfXWntHZPJbeTdb0n2UWOrL2dvOxJmnVo+cpjvJWQEhoN3D/vstC46JZcgXyMhURcaFNiTjRDCBbEtFbhYE7lUwUBtr1b9ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRDY38gZ; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRDY38gZ"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4510974a8cdso59850b6e.0
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 05 Jan 2026 07:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767628255; x=1768233055; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JQRhuITwgdpIDm9XPhLtfU8C2yVQD+uhPAJ7zUKDmU=;
        b=bRDY38gZy3kl/ZSh/N5dSTUmZH4Qaj0NJUtkf8Bx8iTO39NTMZ1GHtjfD4NueRoOgr
         JPUnuK/3nzXbH/otTlf5n7Usm/tF1XAcg5a8Ri20/SFvFYmvbZ9QPefy64CiAtxC/Vus
         L3y2OfRTYBfWH+255CD5U3rRMwIZOnPRxWCfwN75s78GFpkMi2s5WbbHr9NM+XyUdqfu
         inw+o9iLh6cqsTIkdn09BPbquR8vNBxImKm0sqvQ0PIXxi9qf3ATZIEWxqmNFhvlZlMH
         1cBgsQ66sKhq9d4tLP57iFm4zY5OZ/CIo6zFaPHlfVAoxaqm0H0psIebYsa7pvHL4cFN
         afTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767628255; x=1768233055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8JQRhuITwgdpIDm9XPhLtfU8C2yVQD+uhPAJ7zUKDmU=;
        b=ppWLGusMGMg4a1WSb1kWqMVY3XRl0C6zf1nHjdA5txkKtA6cmyYUYsxrbYaNAYIx0d
         Usev5qZtl1eu7Qr4SRKGM++fL5nCzt8sgOQ6gZMN0VWuFcAz7ZqwGdytQf1NK7tfqWT3
         yuplpTDYSz3OntkF1HG9vef6r3jYneRflMwK8fRlv/bAntdnmRPx70bA4qgfHps11RKx
         Hmaa/7XKjr/CeKiSfGH11zjcSNP4+0zrejbEH/aExZne0J1D2W3HKodz4hNHvzlEfaYB
         QGDd9J7wdyPGQVm9qDWVlml/j9i28Zt7A6IVzjLO/vAv5t0UxlOcpHBFtR0txhLFAEnJ
         NuiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe0Z35DTbXaiGpC57TGmVrHDo/SCAz0/PwSuvQQvLhB5eNHu66RcFmGF6//7+j6izYmTYJMNnBybevn+SC4K/yyMfUng==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJGkLMhukXBAD7/Lmj2Y1FWrQhJNq+IJD2pAeSo2XkVLc+Vp9N
	uxQwtjdDZrpJSzFpdBAH0ePalGXyQenRc8zfBR/9Ko57ccPH3WNojttH2KDhsIOz
X-Gm-Gg: AY/fxX6NdsAmHOgqYrGlUAtKdgHAHOf3KBTAokzUamrCpT4PiPGgIwz8q9QUBf7wsOY
	mjh05kO+OqjX0nN0mHgIvU/PCqy94h1ZpmeX7CPtSNiSI7/wHm1LNo4tT/rIRI+i87lJ9mauyxa
	oMUszipcgpN1hBU8niPbyLHwX/Bi3PBM9GIrBxfZXflzgELiGyWROEKLncpyJ7g2PSEwtsPO/1x
	teT41/CW/VpPaQQe+UYvN4fZG47fzULURuTJu4CoMZJZbYW2WWnxp3a4yeTADnk+jin8PuFhUM4
	f250l2r90WfoFnkbLdWyDAtNVD8CHWAyPekqTsZKS8neMxFrQlkXhL1s8H8nb1QfVTOuOzoNKAz
	d59nXMkJqJESD7Ly0mtb2gf/QFOwqgiRPy4vnNrw3fQ5OdyM52/XD0ldJGV8YauwL4kXv6f8ntN
	RHGG7B1jpX9JNTDONgIa4zATJi2xdpUUxjiJocJ16CqkipI9zCfAQcnIOY82VlGQ==
X-Google-Smtp-Source: AGHT+IGeEsTFIrTJi5hCm3w/m4jcI+cpLXH/s7ZIBGDhKnf5dJnQ/xyKHyZHWLvVCbdCzsDOtksUuQ==
X-Received: by 2002:a05:622a:4cce:b0:4ff:7efd:54f6 with SMTP id d75a77b69052e-4ff7efd56f3mr93328791cf.20.1767622097613;
        Mon, 05 Jan 2026 06:08:17 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac64a47esm368957221cf.24.2026.01.05.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:08:17 -0800 (PST)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>,
	quic@lists.linux.dev
Cc: davem@davemloft.net,
	kuba@kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefan Metzmacher <metze@samba.org>,
	Moritz Buhl <mbuhl@openbsd.org>,
	Tyler Fanelli <tfanelli@redhat.com>,
	Pengtao He <hepengtao@xiaomi.com>,
	Thomas Dreibholz <dreibh@simula.no>,
	linux-cifs@vger.kernel.org,
	Steve French <smfrench@gmail.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Tom Talpey <tom@talpey.com>,
	kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>,
	Steve Dickson <steved@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Alexander Aring <aahringo@redhat.com>,
	David Howells <dhowells@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	John Ericson <mail@johnericson.me>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	"D . Wythe" <alibuda@linux.alibaba.com>,
	Jason Baron <jbaron@akamai.com>,
	illiliti <illiliti@protonmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Daniel Stenberg <daniel@haxx.se>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Subject: [PATCH net-next v6 05/16] quic: provide quic.h header files for kernel and userspace
Date: Mon,  5 Jan 2026 09:04:31 -0500
Message-ID: <127ed26fc7689a580c52316a2a82d8f418228b23.1767621882.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1767621882.git.lucien.xin@gmail.com>
References: <cover.1767621882.git.lucien.xin@gmail.com>
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
Signed-off-by: Thomas Dreibholz <dreibh@simula.no>
Signed-off-by: Xin Long <lucien.xin@gmail.com>
---
v2:
  - Fix a kernel API description warning, found by Jakub.
  - Replace uintN_t with __uN, capitalize _UAPI_LINUX_QUIC_H, and
    assign explicit values for QUIC_TRANSPORT_ERROR_ enum in UAPI
    quic.h, suggested by David Howells.
v4:
  - Use MSG_QUIC_ prefix for MSG_* flags to avoid conflicts with other
    protocols, such as MSG_NOTIFICATION in SCTP (reported by Thomas).
  - Remove QUIC_CONG_ALG_CUBIC; only NEW RENO congestion control is
    supported in this version.
v5:
  - Add include/linux/quic.h and include/uapi/linux/quic.h to the
    QUIC PROTOCOL entry in MAINTAINERS.
v6:
  - Fix the copy/pasted the uAPI path for SCTP to the QUIC entry (noted
    by Jakub).
---
 MAINTAINERS               |   2 +
 include/linux/quic.h      |  19 +++
 include/uapi/linux/quic.h | 235 ++++++++++++++++++++++++++++++++++++++
 net/quic/socket.c         |  38 ++++++
 net/quic/socket.h         |   7 ++
 5 files changed, 301 insertions(+)
 create mode 100644 include/linux/quic.h
 create mode 100644 include/uapi/linux/quic.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 46c28f087fd8..8d6187187978 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21387,6 +21387,8 @@ M:	Xin Long <lucien.xin@gmail.com>
 L:	quic@lists.linux.dev
 S:	Maintained
 W:	https://github.com/lxin/quic
+F:	include/linux/quic.h
+F:	include/uapi/linux/quic.h
 F:	net/quic/
 
 RADEON and AMDGPU DRM DRIVERS
diff --git a/include/linux/quic.h b/include/linux/quic.h
new file mode 100644
index 000000000000..d35ff40bb005
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
+#ifndef _LINUX_QUIC_H
+#define _LINUX_QUIC_H
+
+#include <uapi/linux/quic.h>
+
+int quic_kernel_setsockopt(struct sock *sk, int optname, void *optval, unsigned int optlen);
+int quic_kernel_getsockopt(struct sock *sk, int optname, void *optval, unsigned int *optlen);
+
+#endif
diff --git a/include/uapi/linux/quic.h b/include/uapi/linux/quic.h
new file mode 100644
index 000000000000..990b70c3afb0
--- /dev/null
+++ b/include/uapi/linux/quic.h
@@ -0,0 +1,235 @@
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
+#ifndef _UAPI_LINUX_QUIC_H
+#define _UAPI_LINUX_QUIC_H
+
+#include <linux/types.h>
+#ifdef __KERNEL__
+#include <linux/socket.h>
+#else
+#include <sys/socket.h>
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
+	MSG_QUIC_STREAM_NEW		= MSG_SYN,
+	MSG_QUIC_STREAM_FIN		= MSG_FIN,
+	MSG_QUIC_STREAM_UNI		= MSG_CONFIRM,
+	MSG_QUIC_STREAM_DONTWAIT	= MSG_WAITFORONE,
+	MSG_QUIC_STREAM_SNDBLOCK	= MSG_ERRQUEUE,
+
+	/* extented flags for msg_flags */
+	MSG_QUIC_DATAGRAM		= MSG_RST,
+	MSG_QUIC_NOTIFICATION		= MSG_MORE,
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
+	__u8	crypto_level;
+};
+
+struct quic_stream_info {
+	__s64	stream_id;
+	__u32	stream_flags;
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
+	__u8	remote;
+	__u8	disable_active_migration;
+	__u8	grease_quic_bit;
+	__u8	stateless_reset;
+	__u8	disable_1rtt_encryption;
+	__u8	disable_compatible_version;
+	__u8	active_connection_id_limit;
+	__u8	ack_delay_exponent;
+	__u16	max_datagram_frame_size;
+	__u16	max_udp_payload_size;
+	__u32	max_idle_timeout;
+	__u32	max_ack_delay;
+	__u16	max_streams_bidi;
+	__u16	max_streams_uni;
+	__u64	max_data;
+	__u64	max_stream_data_bidi_local;
+	__u64	max_stream_data_bidi_remote;
+	__u64	max_stream_data_uni;
+	__u64	reserved;
+};
+
+struct quic_config {
+	__u32	version;
+	__u32	plpmtud_probe_interval;
+	__u32	initial_smoothed_rtt;
+	__u32	payload_cipher_type;
+	__u8	congestion_control_algo;
+	__u8	validate_peer_address;
+	__u8	stream_data_nodelay;
+	__u8	receive_session_ticket;
+	__u8	certificate_request;
+	__u8	reserved[3];
+};
+
+struct quic_crypto_secret {
+	__u8	send;  /* send or recv */
+	__u8	level; /* crypto level */
+	__u32	type; /* TLS_CIPHER_* */
+#define QUIC_CRYPTO_SECRET_BUFFER_SIZE 48
+	__u8	secret[QUIC_CRYPTO_SECRET_BUFFER_SIZE];
+};
+
+enum quic_cong_algo {
+	QUIC_CONG_ALG_RENO,
+	QUIC_CONG_ALG_MAX,
+};
+
+struct quic_errinfo {
+	__s64	stream_id;
+	__u32	errcode;
+};
+
+struct quic_connection_id_info {
+	__u8	dest;
+	__u32	active;
+	__u32	prior_to;
+};
+
+struct quic_event_option {
+	__u8	type;
+	__u8	on;
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
+	QUIC_EVENT_MAX,
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
+	__s64	id;
+	__u8	state;
+	__u32	errcode;
+	__u64	finalsz;
+};
+
+struct quic_stream_max_data {
+	__s64	id;
+	__u64	max_data;
+};
+
+struct quic_connection_close {
+	__u32	errcode;
+	__u8	frame;
+	__u8	phrase[];
+};
+
+union quic_event {
+	struct quic_stream_update	update;
+	struct quic_stream_max_data	max_data;
+	struct quic_connection_close	close;
+	struct quic_connection_id_info	info;
+	__u64	max_stream;
+	__u8	local_migration;
+	__u8	key_update_phase;
+};
+
+enum {
+	QUIC_TRANSPORT_ERROR_NONE			= 0x00,
+	QUIC_TRANSPORT_ERROR_INTERNAL			= 0x01,
+	QUIC_TRANSPORT_ERROR_CONNECTION_REFUSED		= 0x02,
+	QUIC_TRANSPORT_ERROR_FLOW_CONTROL		= 0x03,
+	QUIC_TRANSPORT_ERROR_STREAM_LIMIT		= 0x04,
+	QUIC_TRANSPORT_ERROR_STREAM_STATE		= 0x05,
+	QUIC_TRANSPORT_ERROR_FINAL_SIZE			= 0x06,
+	QUIC_TRANSPORT_ERROR_FRAME_ENCODING		= 0x07,
+	QUIC_TRANSPORT_ERROR_TRANSPORT_PARAM		= 0x08,
+	QUIC_TRANSPORT_ERROR_CONNECTION_ID_LIMIT	= 0x09,
+	QUIC_TRANSPORT_ERROR_PROTOCOL_VIOLATION		= 0x0a,
+	QUIC_TRANSPORT_ERROR_INVALID_TOKEN		= 0x0b,
+	QUIC_TRANSPORT_ERROR_APPLICATION		= 0x0c,
+	QUIC_TRANSPORT_ERROR_CRYPTO_BUF_EXCEEDED	= 0x0d,
+	QUIC_TRANSPORT_ERROR_KEY_UPDATE			= 0x0e,
+	QUIC_TRANSPORT_ERROR_AEAD_LIMIT_REACHED		= 0x0f,
+	QUIC_TRANSPORT_ERROR_NO_VIABLE_PATH		= 0x10,
+
+	/* The cryptographic handshake failed. A range of 256 values is reserved
+	 * for carrying error codes specific to the cryptographic handshake that
+	 * is used. Codes for errors occurring when TLS is used for the
+	 * cryptographic handshake are described in Section 4.8 of [QUIC-TLS].
+	 */
+	QUIC_TRANSPORT_ERROR_CRYPTO			= 0x0100,
+};
+
+#endif /* _UAPI_LINUX_QUIC_H */
diff --git a/net/quic/socket.c b/net/quic/socket.c
index a0eedf59545a..a0ebc6b56879 100644
--- a/net/quic/socket.c
+++ b/net/quic/socket.c
@@ -121,6 +121,25 @@ static int quic_setsockopt(struct sock *sk, int level, int optname,
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
+ * Return:
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
@@ -135,6 +154,25 @@ static int quic_getsockopt(struct sock *sk, int level, int optname,
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
+ * Return:
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
index 0aa642e3b0ae..7ee190af4454 100644
--- a/net/quic/socket.h
+++ b/net/quic/socket.h
@@ -9,6 +9,7 @@
  */
 
 #include <net/udp_tunnel.h>
+#include <linux/quic.h>
 
 #include "common.h"
 #include "family.h"
@@ -29,6 +30,7 @@ struct quic_sock {
 	struct inet_sock		inet;
 	struct list_head		reqs;
 
+	struct quic_config		config;
 	struct quic_data		ticket;
 	struct quic_data		token;
 	struct quic_data		alpn;
@@ -49,6 +51,11 @@ static inline struct list_head *quic_reqs(const struct sock *sk)
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


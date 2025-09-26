Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779891632DD
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 26 Sep 2025 01:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849731; cv=none; b=YnVXR9N4ryPxGUqtSmxnZQlnqKtLSyxwooXqTxCRrx24IrHE+adYGuF6LP7P4JBU0l/lS4YoLTtWQANH9jnMrutznBlZzDu3RSE1f6OzO3ORr0p7xlSUt9U7KFdnSVtZdn6+eP9388fPDAUhrwg2WPj+39VpSwLs1dsoT0bWJVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849731; c=relaxed/simple;
	bh=JP0pd1IH5TwIWhgYmD1htOiCGydD8fcOv7YY7CL1s+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQ+/RJbbGwRibz8U2hLHFdIeSIZ1FUyNDWrgP53DHGAUWguXZtge6LZBOI8h9ApNmh2v8mo/gd96OW2iAW/DMWbcmR7sISMneACeHvoYx98Cwdy4oTtyI3WB3Pu7ZUERqoocs5hNyxQUJ2I0rf7tdyqCOOPCEwWmfdSY38etznw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u8uznHZL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u8uznHZL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5861AC4CEF4;
	Fri, 26 Sep 2025 01:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758849730;
	bh=JP0pd1IH5TwIWhgYmD1htOiCGydD8fcOv7YY7CL1s+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u8uznHZLEZhyP3O+Z7M5YtBVoNEFwmjto2akwE4+BUHPb70VIXu1PLctXT//ikrUp
	 /vIvlV+IIIUqlnGXd9/wQdVCLUw9YsJa13CNdnnkE4yZ1bUYQztsGzJ0p6pERGwoRJ
	 8G8SIdXlu5067qC5l3MkVs0wnfTwwfkc8ZCGPpSqbIAW34XqlZZUT8gkWS+iM6bs9W
	 MVvhPzWl8gGvx1zlW+sw+BxfBWslTql6AKkmVut4ytXg5IVW3FUaScBYaZ7aVOVrvu
	 u7eiGK8QOflTtWUvjVsots+fUeGwYMmVjj/ACFTC7GoJfUk+BoNBkhvcx6PeZJcQ/6
	 bBNrJdsjdnjmg==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Xin Long <lucien.xin@gmail.com>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH v1 01/16] tlshd: Add kernel's quic.h
Date: Thu, 25 Sep 2025 21:21:50 -0400
Message-ID: <20250926012207.3642990-2-cel@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926012207.3642990-1-cel@kernel.org>
References: <20250926012207.3642990-1-cel@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuck Lever <chuck.lever@oracle.com>

Currently, QUIC support is disabled in tlshd unless the kernel's
uapi/linux/quic.h file is present on the system. Since that work
is not yet upstream, pretty much no build environment has this
file.

Including this header now enables the oracle/ktls-utils testing
workflows for the code in quic.c, and also enables development for
tlshd code near the quic.c code -- ie, at least now building fails
immediately if you've done something incompatible with what's in
quic.c.

This copy of quic.h can be updated periodically or removed entirely
when the kernel version of this file becomes reliably available.

I pulled the file from:

https://lore.kernel.org/netdev/cover.1758234904.git.lucien.xin@gmail.com/T/#m377dc3b337c5bcfef79dc64400fec3a5e41cdbe0

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 configure.ac          |   7 +-
 src/tlshd/Makefile.am |   3 +-
 src/tlshd/quic.h      | 236 ++++++++++++++++++++++++++++++++++++++++++
 src/tlshd/tlshd.h     |   9 +-
 4 files changed, 249 insertions(+), 6 deletions(-)
 create mode 100644 src/tlshd/quic.h

diff --git a/configure.ac b/configure.ac
index f59bead6f8d5..da03e76cf2b8 100644
--- a/configure.ac
+++ b/configure.ac
@@ -64,10 +64,9 @@ PKG_CHECK_MODULES([LIBNL_GENL3], libnl-genl-3.0 >= 3.1)
 AC_SUBST([LIBNL_GENL3_CFLAGS])
 AC_SUBST([LIBNL_GENL3_LIBS])
 
-AC_CHECK_HEADER([linux/quic.h],
-              [AC_CHECK_LIB([gnutls], [gnutls_handshake_set_secret_function],
-                            [AC_DEFINE([HAVE_GNUTLS_QUIC], [1], [Define to 1 if QUIC is found.])])])
-
+AC_CHECK_LIB([gnutls], [gnutls_handshake_set_secret_function],
+             [AC_DEFINE([HAVE_GNUTLS_QUIC], [1],
+			[Define to 1 if you have the gnutls_handshake_set_secret_function function.])])
 AC_CHECK_LIB([gnutls], [gnutls_transport_is_ktls_enabled],
              [AC_DEFINE([HAVE_GNUTLS_TRANSPORT_IS_KTLS_ENABLED], [1],
                         [Define to 1 if you have the gnutls_transport_is_ktls_enabled function.])])
diff --git a/src/tlshd/Makefile.am b/src/tlshd/Makefile.am
index 2f6aeba53b15..3151ebe367c0 100644
--- a/src/tlshd/Makefile.am
+++ b/src/tlshd/Makefile.am
@@ -21,7 +21,8 @@ tlshd_CFLAGS		= -Werror -Wall -Wextra $(LIBGNUTLS_CFLAGS) \
 			  $(LIBKEYUTILS_CFLAGS) $(GLIB_CFLAGS) $(LIBNL3_CFLAGS) \
 			  $(LIBNL_GENL3_CFLAGS)
 tlshd_SOURCES		= client.c config.c handshake.c keyring.c ktls.c log.c \
-			  main.c netlink.c netlink.h server.c tlshd.h quic.c
+			  main.c netlink.c netlink.h server.c tlshd.h quic.c \
+			  quic.h
 tlshd_LDADD		= $(LIBGNUTLS_LIBS) $(LIBKEYUTILS_LIBS) $(GLIB_LIBS) \
 			  $(LIBNL3_LIBS) $(LIBNL_GENL3_LIBS)
 
diff --git a/src/tlshd/quic.h b/src/tlshd/quic.h
new file mode 100644
index 000000000000..f7c85399ac4a
--- /dev/null
+++ b/src/tlshd/quic.h
@@ -0,0 +1,236 @@
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
+	QUIC_CONG_ALG_CUBIC,
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
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 6ee950d5b234..7f3ec40add4c 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -122,7 +122,14 @@ extern void tlshd_tls13_serverhello_handshake(struct tlshd_handshake_parms *parm
 extern void tlshd_quic_serverhello_handshake(struct tlshd_handshake_parms *parms);
 
 #ifdef HAVE_GNUTLS_QUIC
-#include <linux/quic.h>
+#include "quic.h"
+
+#ifndef SOL_QUIC
+#define SOL_QUIC	288
+#endif
+#ifndef IPPROTO_QUIC
+#define IPPROTO_QUIC	261
+#endif
 
 #define TLSHD_QUIC_MAX_DATA_LEN		4096
 #define TLSHD_QUIC_MAX_ALPNS_LEN	128
-- 
2.51.0


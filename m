Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080A31991B6
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 26 Sep 2025 01:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849737; cv=none; b=Zp8L9GmiDNaqeho4I4T7GnrN3YIxN6y8fGiilX0HKtOz+5HkCB34PoMwoGg6TOIps0LN2DSmq0vn39f/2v8ZiJKNvG9S2ZCVOS0qYXdtsNc5E7LvY+pzTxgReiC4kk+h/4IqQw6WNkf0ep+jWpP3WVOJYhu3uj9B/OuSYHpO09M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849737; c=relaxed/simple;
	bh=CBLhA6DbcFWzRfX7DF4v7lHdLRCxtmY8Y2W9FCHVG5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EurBLKWN0ybjZ7CsJTadcL/FW/B3ETWoWx67vWFjx9cCHCjTCsXAFOIC7TD0nZlbnnjw8eBw6cvuO2FUYUfI48tIV4Rcgps0NdsabgL/orZwFHCFiJ7h/mXkq/P1g/VEJVzw/xgfmxZCBx7eaPL2jNPSUJFk7EgDmbvGB/JcPBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxfhROxC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxfhROxC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99BE6C113CF;
	Fri, 26 Sep 2025 01:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758849736;
	bh=CBLhA6DbcFWzRfX7DF4v7lHdLRCxtmY8Y2W9FCHVG5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jxfhROxCk9hq+KX++bNOmudL5QAv7RyjIzSvxQZgwMh5E7IpEZEgmV4Lh+cc8Q+LY
	 A2hGqFn4vwGmflkC1wYv2tL3Vz4LYGOOcTyaQVGf7LmF5aCa1QnFVOsXmKdS0PhYbs
	 ivDH11JDUiDUpyRgQmXPmBKVOcLRPIGW8fsIh8akgvZ22QtEMg7s1jCKUGCnfQ2GFk
	 QYdWAFs/pGsYr+UHJuGwhM9uZQeYyj+W+PCsVO6kgUEI3c3j9G19ZrTH0NzOIuH/Lx
	 g8OHQLBdlHqfrVz5yUysHk+LehREG00SjWuaJAWtA9YVOrJXm/ruFTWPN5ZW9IL9Jt
	 cGpyf51r/dw0A==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Xin Long <lucien.xin@gmail.com>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH v1 14/16] tlshd: Translate kernel-style Doxygen comments in src/tlshd/tlshd.h
Date: Thu, 25 Sep 2025 21:22:03 -0400
Message-ID: <20250926012207.3642990-15-cel@kernel.org>
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

I started the ktls-utils project using the Linux kernel flavor of
Doxygen commenting which user-space Doxygen does not recognize by
default.

Convert existing comments in tlshd.h to what a normal user space
Doxygen run expects to see. This will enable deployment of an
automatically-generated documentation web site.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/tlshd.h | 78 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 61 insertions(+), 17 deletions(-)

diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 7f3ec40add4c..5d8965be322c 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -1,6 +1,9 @@
+/**
+ * @file tlshd.h
+ * @brief Generic definitions and forward declarations for tlshd
+ */
+
 /*
- * Generic definitions and forward declarations for tlshd.
- *
  * ktls-utils is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
  * published by the Free Software Foundation; version 2.
@@ -18,6 +21,10 @@
 
 #include <linux/netlink.h>
 
+/**
+ * @def ARRAY_SIZE
+ * @brief Generate the number of elements in an array
+ */
 #define ARRAY_SIZE(a)		(sizeof(a) / sizeof((a)[0]))
 
 extern int tlshd_debug;
@@ -27,21 +34,27 @@ extern int tlshd_stderr;
 
 struct nl_sock;
 
+/**
+ * @struct tlshd_handshake_parms
+ * @brief Handshake parameters (global)
+ */
 struct tlshd_handshake_parms {
-	char		*peername;
-	char		*peeraddr;
-	int		sockfd;
-	int		ip_proto;
-	uint32_t	handshake_type;
-	unsigned int	timeout_ms;
-	uint32_t	auth_mode;
-	key_serial_t	keyring;
-	key_serial_t	x509_cert;
-	key_serial_t	x509_privkey;
-	GArray		*peerids;
-	GArray		*remote_peerids;
+	/*@{*/
+	char		*peername;	/**< Remote's DNS label */
+	char		*peeraddr;	/**< Remote's IP address */
+	int		sockfd;		/**< Socket on which to perform the handshake */
+	int		ip_proto;	/**< Transport protocol number */
+	uint32_t	handshake_type;	/**< Handshake interaction to perform */
+	unsigned int	timeout_ms;	/**< How long to wait for completion */
+	uint32_t	auth_mode;	/**< x.509, PSK, etc. */
+	key_serial_t	keyring;	/**< Keyring containing auth material */
+	key_serial_t	x509_cert;	/**< Key serial of our x.509 cert */
+	key_serial_t	x509_privkey;	/**< Key serial of our x.509 private key */
+	GArray		*peerids;	/**< Peer identities to present to servers */
+	GArray		*remote_peerids; /**< Peer identities presented by clients */
 
-	unsigned int	session_status;
+	unsigned int	session_status;	/**< Handshake completion status */
+	/*@}*/
 };
 
 enum peer_type {
@@ -134,6 +147,10 @@ extern void tlshd_quic_serverhello_handshake(struct tlshd_handshake_parms *parms
 #define TLSHD_QUIC_MAX_DATA_LEN		4096
 #define TLSHD_QUIC_MAX_ALPNS_LEN	128
 
+/**
+ * @struct tlshd_quic_msg
+ * @brief QUIC message format
+ */
 struct tlshd_quic_msg {
 	struct tlshd_quic_msg *next;
 	uint8_t data[TLSHD_QUIC_MAX_DATA_LEN];
@@ -141,6 +158,10 @@ struct tlshd_quic_msg {
 	uint8_t level;
 };
 
+/**
+ * @struct tlshd_quic_conn
+ * @brief QUIC connection object
+ */
 struct tlshd_quic_conn {
 	struct tlshd_handshake_parms *parms;
 	char alpns[TLSHD_QUIC_MAX_ALPNS_LEN];
@@ -161,16 +182,39 @@ struct tlshd_quic_conn {
 	struct tlshd_quic_msg recv_msg;
 };
 
-/* quic.c */
 extern int tlshd_quic_conn_create(struct tlshd_quic_conn **conn_p,
 				  struct tlshd_handshake_parms *parms);
 extern void tlshd_quic_conn_destroy(struct tlshd_quic_conn *conn);
 extern void tlshd_quic_start_handshake(struct tlshd_quic_conn *conn);
+
 #endif
 
+/**
+ * @def TLS_DEFAULT_PSK_TYPE
+ * @brief Default type of pre-shared key
+ */
 #define TLS_DEFAULT_PSK_TYPE	"psk"
+
+/**
+ * @def TLS_NO_PEERID
+ * @brief No peer ID provided via keyring
+ */
 #define TLS_NO_PEERID		(0)
+
+/**
+ * @def TLS_NO_CERT
+ * @brief No certificate provided via keyring
+ */
 #define TLS_NO_CERT		(0)
+
+/**
+ * @def TLS_NO_PRIVKEY
+ * @brief No private key provided via keyring
+ */
 #define TLS_NO_PRIVKEY		(0)
-/* Max number of (chained) certs to load */
+
+/**
+ * @def TLSHD_MAX_CERTS
+ * @brief Maximum number of (chained) certs to load
+ */
 #define TLSHD_MAX_CERTS		10
-- 
2.51.0


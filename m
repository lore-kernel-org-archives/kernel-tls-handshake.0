Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB01E3FC2
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 17:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749404667; cv=none; b=kHM68t5GWxa4ZYQGmgtq1LSVi3XZXZrjkonzytaoQxQpnB7E9/mMW9cxjSjTEN57aEokEJ5k7PL21TO/gaSVOkp+QyHJ7uOZvXo28+P2j9Nfu169UgB3oLCQyUVWfgEyv03anPBLu2mfUz6e0QrhzVMOxsw4CDlxBoAIGtviPOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749404667; c=relaxed/simple;
	bh=KhwJ6HOV7krQWvQtgYTTSx1HLY6pWv/XskXteLuCkdg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=lRAsxiePZ088ju2r5xFDrWuKMud9u6gZlg9TcpHTK6q3JueRJwNw9zqp8yBxyh0EdBP1K749iVMBM9t0t+WOIFVppvAi9MBYl7sEj+ni30ZUahnkekdS+c41h9qbizIKUXnP5HrkcQTledWbrsVT/UWmq6DscZu6rdEz2qr34qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAfvRLoA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAfvRLoA"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450cf214200so34046255e9.1
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 08 Jun 2025 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749404664; x=1750009464; darn=lists.linux.dev;
        h=content-transfer-encoding:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1v6PJcvHM4kNLUaTbrZtGiNKzznWIaZaIqDgFvsEfo=;
        b=IAfvRLoA4HgFfSWU5i1OBcMoRxETWuSNPfPizC6XQcOa0qtedhwWetewfrJ3nkLeZ3
         09AmRqw9anIPQmA+PDsrRCG/91AHpP+Sq2PNNqq/7ysqnOq6BIXmGjGgROk/CY0MWq6/
         rzdhH/3Qp2LeGJAT0l+qpuw4NO0/amqfiedsVu3v6/fDledP+WFNKqnhdUFiVSHZXg88
         Ct5vyF8FsX7vZ7mpIw5i/8kykL8E6OwYU/pnAKWSOMz7bob3fZfA/IuGx5mBHrOmHT6U
         RBTdMb/UDp1+g+Cqhbl8SXGC8CMgJYNl0vpqcW/Ji/lVSdx5ieDxyWIVDbygGO0j2PXV
         BECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749404664; x=1750009464;
        h=content-transfer-encoding:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z1v6PJcvHM4kNLUaTbrZtGiNKzznWIaZaIqDgFvsEfo=;
        b=b4/VltVgeDbdLI7bKNwzSUzKNfVfpRLQIpZs7XTaiyHOquSR3fyiYKESIvYQhECP+4
         D1MP2fy5m/RlXfeySFK0srTN70nR1npzXiEJxYXVYedXGvsL1d7g48111+artIXVuNWf
         OMKefgtE/IFPnlH1NvdFA+Z5ayNuDoDjS0ovDBISfQ+C2lMoCrkyjJR/a/64PJy33f3L
         VBMVedAL7gBkR+pn8F287FXVS0lY7HM7d4HY5GGY+HLQBmkELzpDHHdcGXR6hTZmhX0n
         5DR8KYEMda3pE55Hh6beKqkRsNQxPy0bp6OCKcQlUxSn2u9V527vYY9Hc5GVbSF+KNp8
         Q04g==
X-Gm-Message-State: AOJu0YzhOLDKcJauTw+D3uK2OBHGY2FvrCqewZG+2jNxogrOE1ULtKuV
	hbGWgOKmSWWTfRYoi+//i9XRVlgJCapkxsiFzYLDQoi8nnzelb2XRVMEtmQRpQ==
X-Gm-Gg: ASbGncsuxFNeLrqjOes1uQNbkBt4f+5L5XowsVPP6ZTKpGSO67GEuxZw5zs7+z3GyaX
	8ljwzQpDpJX3gouXsND6Dw5BdCZe0trauY1poXipS7BBi3r7nepEi1EZMJcJOVbokApfdktgW50
	MQ5V/AMXkCcEWIaKYf8cgXOFLeKevOYP8K99HtLs2+MQmFGWWO9MEHZBSYp9mWZvJ/xRa2uVMtG
	GTN0b7hi7jAIpoCXThr7Fiw2+oHDpWOlsuzlsCiodi1C+wg+cMHH3UbDssFdfd3AwUILPJWweEs
	AFS8xV8D61+9Qy/BJ5NsEOFbmrZsNeN1AkKtNNiVhEoiQqibL4R2Qa6fkM9y4uQzRRCzY38XHyZ
	rSjDIFeMphtj+n17dPHY=
X-Google-Smtp-Source: AGHT+IFcvprPpGt160Rl+IK+llSFLYMlNWA+v0kRW1ojEPX9gdZbC+Bo2Y4Ds5FiJKczv6emhNs9uQ==
X-Received: by 2002:a05:600c:548d:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-45201437aa8mr92241625e9.6.1749404664032;
        Sun, 08 Jun 2025 10:44:24 -0700 (PDT)
Received: from [192.168.1.227] (40.135.90.146.dyn.plus.net. [146.90.135.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730d15f4sm89658495e9.40.2025.06.08.10.44.23
        for <kernel-tls-handshake@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 10:44:23 -0700 (PDT)
Message-ID: <3c282c63-fd7c-48a9-be8b-02f101796a22@gmail.com>
Date: Sun, 8 Jun 2025 18:44:23 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ken Milmore <ken.milmore@gmail.com>
Subject: [PATCH 7/7] client: Add boolean config option "relax_sni" under
 "[authenticate.client]".
Content-Language: en-GB
To: kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If this option is set to true, then the client will avoid using Server Name Indication (SNI) in cases where a numeric IPv4 or IPv6 address is being used to connect to the server.
This prevents failure of certificate exchange with the server in such cases.

Signed-off-by: Ken Milmore <ken.milmore@gmail.com>
---
 src/tlshd/client.c | 76 +++++++++++++++++++++++++++++++++++++++++-----
 src/tlshd/config.c |  3 ++
 src/tlshd/tlshd.h  |  1 +
 3 files changed, 72 insertions(+), 8 deletions(-)

diff --git a/src/tlshd/client.c b/src/tlshd/client.c
index 80107b2..90cce6a 100644
--- a/src/tlshd/client.c
+++ b/src/tlshd/client.c
@@ -32,6 +32,7 @@
 #include <stdio.h>
 #include <errno.h>
 #include <keyutils.h>
+#include <netdb.h>
 
 #include <gnutls/gnutls.h>
 #include <gnutls/abstract.h>
@@ -43,6 +44,62 @@
 #include "tlshd.h"
 #include "netlink.h"
 
+bool tlshd_client_relax_sni = false;
+
+/**
+ * tlshd_is_hostname_numeric - Determine if the given string represents a
+ * valid numerical IPv4 or IPv6 address rather than an actual host name.
+ *
+ * Return values:
+ * %true: @hostname corresponds to a numerical IPv4 or IPv6 address.
+ * %false: @hostname is not a valid numerical address, or an error occurred.
+ */
+static bool tlshd_is_hostname_numeric(const char *hostname)
+{
+	struct addrinfo hints = { 0 };
+	struct addrinfo *res;
+	int err;
+
+	/* An empty host name is not a numeric address. */
+	if (hostname[0] == '\0')
+		return false;
+
+	hints.ai_flags = AI_NUMERICHOST;
+	hints.ai_socktype = SOCK_RAW; /* To avoid duplicate results. */
+
+	/* Try to convert peername into a textualized IP/IPv6 address. */
+	err = getaddrinfo(hostname, NULL, &hints, &res);
+	if (err) {
+		tlshd_log_gai_error(err);
+		return false;
+	}
+
+	freeaddrinfo(res);
+	return true;
+}
+
+/**
+ * tlshd_client_is_sni_required - Determine if we want GnuTLS to send the peer
+ * name to the server for purposes of Server Name Indication (SNI).
+ *
+ * Return values:
+ * %true: Send peer name to server.
+ * %false: Do not send peer name to server.
+ */
+static bool tlshd_client_is_sni_required(struct tlshd_handshake_parms *parms)
+{
+	bool sni_required = true;
+
+	if (tlshd_client_relax_sni && tlshd_is_hostname_numeric(parms->peername)) {
+		tlshd_log_debug("client: Not using SNI for numeric peer name '%s'",
+				parms->peername);
+		sni_required = false;
+	}
+
+	return sni_required;
+}
+
+
 static void tlshd_tls13_client_anon_handshake(struct tlshd_handshake_parms *parms)
 {
 	gnutls_certificate_credentials_t xcred;
@@ -85,8 +142,9 @@ static void tlshd_tls13_client_anon_handshake(struct tlshd_handshake_parms *parm
 	}
 	gnutls_transport_set_int(session, parms->sockfd);
 
-	gnutls_server_name_set(session, GNUTLS_NAME_DNS,
-			       parms->peername, strlen(parms->peername));
+	if (tlshd_client_is_sni_required(parms))
+		gnutls_server_name_set(session, GNUTLS_NAME_DNS,
+				       parms->peername, strlen(parms->peername));
 
 	gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
 
@@ -311,11 +369,13 @@ static void tlshd_tls13_client_x509_handshake(struct tlshd_handshake_parms *parm
 	gnutls_transport_set_int(session, parms->sockfd);
 	gnutls_session_set_ptr(session, parms);
 
-	ret = gnutls_server_name_set(session, GNUTLS_NAME_DNS,
-				     parms->peername, strlen(parms->peername));
-	if (ret != GNUTLS_E_SUCCESS) {
-		tlshd_log_gnutls_error(ret);
-		goto out_free_creds;
+	if (tlshd_client_is_sni_required(parms)) {
+		ret = gnutls_server_name_set(session, GNUTLS_NAME_DNS,
+					     parms->peername, strlen(parms->peername));
+		if (ret != GNUTLS_E_SUCCESS) {
+			tlshd_log_gnutls_error(ret);
+			goto out_free_creds;
+		}
 	}
 	ret = gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
 	if (ret != GNUTLS_E_SUCCESS) {
@@ -533,7 +593,7 @@ static int tlshd_quic_client_set_x509_session(struct tlshd_quic_conn *conn)
 	ret = gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, cred);
 	if (ret)
 		goto err_session;
-	if (parms->peername) {
+	if (parms->peername && tlshd_client_is_sni_required(parms)) {
 		ret = gnutls_server_name_set(session, GNUTLS_NAME_DNS,
 					     parms->peername, strlen(parms->peername));
 		if (ret)
diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index 9599e1b..b912614 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -92,6 +92,9 @@ bool tlshd_config_init(const gchar *pathname)
 				     "delay_done", NULL);
 	tlshd_delay_done = tmp > 0 ? (unsigned int)tmp : 0;
 
+	tlshd_client_relax_sni = g_key_file_get_string(tlshd_configuration,
+					"authenticate.client", "relax_sni", NULL);
+
 	tlshd_server_verify_peername = g_key_file_get_string(tlshd_configuration,
 					"authenticate.server", "verify_peername", NULL);
 	tlshd_server_verify_peeraddr = g_key_file_get_string(tlshd_configuration,
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index d0602bf..3ed2567 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -24,6 +24,7 @@ extern int tlshd_debug;
 extern int tlshd_tls_debug;
 extern unsigned int tlshd_delay_done;
 extern int tlshd_stderr;
+extern bool tlshd_client_relax_sni;
 extern bool tlshd_server_verify_peername;
 extern bool tlshd_server_verify_peeraddr;
 
-- 
2.47.2


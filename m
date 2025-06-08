Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB19C3FC2
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 17:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749404642; cv=none; b=tXitdCCT2usJ9fFGlK+4xC4ucHhOHUcoMns84jKk0xNexnv56GPY/qGiX/3HbQsnFMglZUSslumF/qMTDSawBKCFKMDIoQ1mXaUrFFkVGVK73bZGUDHzjuzcWS8lrqDG4xS8Ur6zJGN8JF4o4+Fa1RvPSQljZYiMKQCqIxAkyFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749404642; c=relaxed/simple;
	bh=YqeVprum4gWGXslfh5d0gKHs+wBhLeeXU1eUW80ZrOs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=N6qsz2T+XiEXpx4z1B9coNDY6M6FM0dPSBmK3sSyRVCrIrElOvznhsWjVqdfXNm1wfEA+bo9i6Yk17ZSl7teb3oX8bUszuZv3WYrMJj9/oCdK08GsXM8EvmmpfNznW3StssN4mvzDkf27WQYoEq3Vl8qZfmxfCo3xQiM4hujc/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RI7UcLbF; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RI7UcLbF"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so3201448f8f.1
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 08 Jun 2025 10:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749404639; x=1750009439; darn=lists.linux.dev;
        h=content-transfer-encoding:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdmeVS0q8eo2MWXWH2hWu2MKzifTKYqnjrGCgfewBKs=;
        b=RI7UcLbFgkx8gC3fSgwuIHTw197I6YaJCw4J6SSF76JbYqFpHT61odS2m15hGJKzAu
         Q32O8M2y8xMwvPdiqeNbIAQIT+lHaA6GJuopSFHYHfX9dyrXhxCcQSJP5UGysHYL0enz
         p+4dJ39batsAUB1ivNd9Y9XfbYUL08jpdOSAFdVwnc8/wq7XZZvp4KEbNa8l7OIDuy88
         JNx0wecFXT/Gh/1v5NJBP1utSRAa6saXUcIJcWzICKSBMkGR0cgUfHoqiQpyFH9n9xhO
         jk+2zdQxGFZpXcl/z3Flp5OM2IjjVY4aJPYNqHL5yd78jvfWTBRgQYyUPLO2N15eD4hF
         go2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749404639; x=1750009439;
        h=content-transfer-encoding:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jdmeVS0q8eo2MWXWH2hWu2MKzifTKYqnjrGCgfewBKs=;
        b=O7E+2uIy1v0rlD3X63HR8LKS7xKqXXxRAg+5PbxHzVZzMRKUaHf+yt0ILmshIpVpng
         piaZjWi6wynbueHXeEsr9UqlUXJzilxOLqU9IVTUWBEIGM95UvpQR0YYh54DbPE1dMyN
         quDJDR50x3UkQht1K0o710yGHOsoTkrictrgyBlubNQZCU3nC52V6IadNRvhdwv3/Vd7
         Ifb0P66GjVVunNjBeQfyzjVH4khkcEUTCGvtekDI1lIIJqQH236pT7nV4H9sDriX4Jh7
         DYIIxvnqA+0zTC01BchA/LsDhKHEcQSTcjuGuhu/qZ28SL3McUs5YE63y8LQwd0V8gBV
         FFUw==
X-Gm-Message-State: AOJu0Yyo8fyabpTqWz1ujo9wLyOFjCEMys4evHdlTSJ0eVxJAK7GzJDt
	0k8xNFzqHOFFBttbQKPPzzNIO74qmPShf642B6MU7v9biCxPvZ7E39+7xFHS6w==
X-Gm-Gg: ASbGncuaZhIDdshYBlcGYcHwA5ZdweumeRSSABFPZc1Qx5FEqM2UWOeGDIkkp2zNndF
	pPLDt60ciOxYB15hh4xGC/tqzBzgPRPPeVGwauCER+VJQdczd4BHQKD/iFWmJZPRvhfOfrUB2ow
	MBwBa5atYW0wg0v6ea7gBI8eqy7X7elqW4R8Wsre68Qgzn3hY7HuvjAPuydgBZthXQmHWUXCpRc
	5YzP/VIKmYHuiiY2ufpvxxOJy4QQV3KVvb8eMHviv5YodKp+GO7fQJdXZH5S0SgJih3RE/bC6qP
	D2OMgKWKM8zWdqhYhPBIQ3lOJmQd+I1Gf53nE+dq+TD3/uvDYFtBivOe3zuhDzLryf5WXfEyaI2
	AqY8Jl3V5Q8kK0QPDiPI=
X-Google-Smtp-Source: AGHT+IE0Kzaag8xMgq/JIrqI5d4rN1Ui+mxG1W4X7mzN4SFghfKOfyuvMuLHna8J1BjBKLQiRtjwcw==
X-Received: by 2002:a05:6000:2285:b0:3a4:f7ae:77c9 with SMTP id ffacd0b85a97d-3a531315562mr8886434f8f.5.1749404638957;
        Sun, 08 Jun 2025 10:43:58 -0700 (PDT)
Received: from [192.168.1.227] (40.135.90.146.dyn.plus.net. [146.90.135.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532468360sm7542202f8f.100.2025.06.08.10.43.58
        for <kernel-tls-handshake@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 10:43:58 -0700 (PDT)
Message-ID: <4b17224c-0525-4e30-9ff3-4c0abaacab89@gmail.com>
Date: Sun, 8 Jun 2025 18:43:58 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ken Milmore <ken.milmore@gmail.com>
Subject: [PATCH 5/7] server: Add boolean config option "verify_peername" under
 "[authenticate.server]".
Content-Language: en-GB
To: kernel-tls-handshake@lists.linux.dev
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If this option is set to true, then the server will pass the client hostname to GnuTLS to be verified against the client certificate.
A forward address lookup using getaddrinfo() is first performed to confirm that the client hostname maps to the client network address.
Should this forward confirmation fail, the client certificate is rejected out of hand.

Signed-off-by: Ken Milmore <ken.milmore@gmail.com>
---
 src/tlshd/config.c |   3 ++
 src/tlshd/server.c | 124 ++++++++++++++++++++++++++++++++++++++++++++-
 src/tlshd/tlshd.h  |   1 +
 3 files changed, 127 insertions(+), 1 deletion(-)

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index be5d472..c647681 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -92,6 +92,9 @@ bool tlshd_config_init(const gchar *pathname)
 				     "delay_done", NULL);
 	tlshd_delay_done = tmp > 0 ? (unsigned int)tmp : 0;
 
+	tlshd_server_verify_peername = g_key_file_get_string(tlshd_configuration,
+					"authenticate.server", "verify_peername", NULL);
+
 	keyrings = g_key_file_get_string_list(tlshd_configuration,
 					      "authenticate",
 					      "keyrings", &length, NULL);
diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index 72ff6f5..4a47fe8 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -31,6 +31,7 @@
 #include <stdio.h>
 #include <errno.h>
 #include <keyutils.h>
+#include <netdb.h>
 
 #include <gnutls/gnutls.h>
 #include <gnutls/abstract.h>
@@ -42,10 +43,127 @@
 #include "tlshd.h"
 #include "netlink.h"
 
+bool tlshd_server_verify_peername = false;
+
 static gnutls_privkey_t tlshd_server_privkey;
 static unsigned int tlshd_server_certs_len = TLSHD_MAX_CERTS;
 static gnutls_pcert_st tlshd_server_certs[TLSHD_MAX_CERTS];
 
+/**
+ * tlshd_forward_confirm_hostname - Confirm that the given host name can be
+ * mapped to the given socket address by forward address lookup.
+ *
+ * Return values:
+ * %true: Forward lookup successfully mapped @hostname to @hostaddr.
+ * %false: No such mapping was found, or an error occurred.
+ */
+static bool tlshd_forward_confirm_hostname(const char *hostname,
+					   const struct sockaddr *hostaddr,
+					   socklen_t hostaddr_len)
+{
+	const struct sockaddr_in *ha4, *ai4;
+	const struct sockaddr_in6 *ha6, *ai6;
+	struct addrinfo hints = { 0 };
+	struct addrinfo *res, *ai;
+	bool matched = false;
+	int err;
+
+	/* Refuse to confirm an empty host name. */
+	if (hostname[0] == '\0')
+		return false;
+
+	/* Check that the supplied address is reasonable. */
+	if (hostaddr_len < sizeof(struct sockaddr_in))
+		return false;
+	if (hostaddr->sa_family == AF_INET6) {
+		if (hostaddr_len < sizeof(struct sockaddr_in6))
+			return false;
+		ha6 = (const struct sockaddr_in6 *)hostaddr;
+		/* Refuse to confirm a link-local address. */
+		if (IN6_IS_ADDR_LINKLOCAL(&ha6->sin6_addr))
+			return false;
+		if (IN6_IS_ADDR_MC_LINKLOCAL(&ha6->sin6_addr))
+			return false;
+	}
+
+	hints.ai_family = hostaddr->sa_family;
+	hints.ai_socktype = SOCK_RAW; /* To avoid duplicate results. */
+
+	/* Fetch a list of addresses matching the host name. */
+	err = getaddrinfo(hostname, NULL, &hints, &res);
+	if (err) {
+		tlshd_log_gai_error(err);
+		return false;
+	}
+
+	/* Search the returned addresses for a match against the supplied address. */
+	switch(hostaddr->sa_family) {
+	case AF_INET:
+		ha4 = (const struct sockaddr_in *)hostaddr;
+		for (ai = res; ai && !matched; ai = res->ai_next) {
+			if (ai->ai_family != AF_INET)
+				continue;
+			if (ai->ai_addrlen < sizeof(struct sockaddr_in))
+				continue;
+			ai4 = (const struct sockaddr_in *)ai->ai_addr;
+			if (ha4->sin_addr.s_addr == ai4->sin_addr.s_addr)
+				matched = true;
+		}
+		break;
+
+	case AF_INET6:
+		ha6 = (const struct sockaddr_in6 *)hostaddr;
+		for (ai = res; ai && !matched; ai = res->ai_next) {
+			if (ai->ai_family != AF_INET6)
+				continue;
+			if (ai->ai_addrlen < sizeof(struct sockaddr_in6))
+				continue;
+			ai6 = (const struct sockaddr_in6 *)ai->ai_addr;
+			if (IN6_ARE_ADDR_EQUAL(&ha6->sin6_addr, &ai6->sin6_addr))
+				matched = true;
+		}
+		break;
+	}
+
+	freeaddrinfo(res);
+	return matched;
+}
+
+/**
+ * tlshd_server_get_verify_hostname - Determine the client host name which will
+ * be passed to GnuTLS for client certificate verification.
+ *
+ * @parms: handshake parameters
+ * @hostname_p: Receives a pointer to the host name to use, which may be NULL.
+ *
+ * Return values:
+ * %true: Proceed with certificate verification.
+ * %false: Force a certificate error.
+ */
+static bool tlshd_server_get_verify_hostname(struct tlshd_handshake_parms *parms,
+					     const char **hostname_p)
+{
+	const char *hostname = NULL;
+	bool verify_hostname = true;
+
+	if (tlshd_server_verify_peername) {
+		tlshd_log_debug("server: Forward-confirm peer name '%s' against address '%s'",
+				parms->peername, parms->peeraddr_txt);
+		if (tlshd_forward_confirm_hostname(parms->peername, parms->peeraddr,
+						   parms->peeraddr_len)) {
+			tlshd_log_debug("server: Verify forward-confirmed peer name '%s'",
+					parms->peername);
+			hostname = parms->peername;
+		} else {
+			tlshd_log_debug("server: Peer name unconfirmed: Forcing error.");
+			verify_hostname = false;
+		}
+	}
+
+	*hostname_p = hostname;
+	return verify_hostname;
+}
+
 /*
  * XXX: After this point, tlshd_server_certs should be deinited on error.
  */
@@ -146,11 +264,15 @@ static int tlshd_server_x509_verify_function(gnutls_session_t session,
 {
 	const gnutls_datum_t *peercerts;
 	gnutls_certificate_type_t type;
+	const char *hostname = NULL;
 	unsigned int i, status;
 	gnutls_datum_t out;
 	int ret;
 
-	ret = gnutls_certificate_verify_peers3(session, NULL, &status);
+	if (!tlshd_server_get_verify_hostname(parms, &hostname))
+		goto certificate_error;
+
+	ret = gnutls_certificate_verify_peers3(session, hostname, &status);
 	switch (ret) {
 	case GNUTLS_E_SUCCESS:
 		break;
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 29b0715..9e5b221 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -24,6 +24,7 @@ extern int tlshd_debug;
 extern int tlshd_tls_debug;
 extern unsigned int tlshd_delay_done;
 extern int tlshd_stderr;
+extern bool tlshd_server_verify_peername;
 
 struct nl_sock;
 
-- 
2.47.2


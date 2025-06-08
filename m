Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCD63FC2
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 17:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749404621; cv=none; b=M7oUce4tCfii857bZgqysN4vmu9NR5iqEBqnSnURzuzuoCulWbA2H0lYWhYyTtUoRxWGRBz4Dda0beLHiHoVQvs/4Y9gzR7QKMBuUOLfgm4qbarXrKyr84N9XeMLOkPRG2FQ+xCHFwoFG/fnYiFf/OBXRXP4PdeJViWHbo12gSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749404621; c=relaxed/simple;
	bh=RlSkbxR37uPkjD2xrq4x2rn+yLmo/7M6jCChVDtmBZY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=nHL+CzOa8gML6gUemx+UnWKd/4qXEyqnW6rozXQtVhddVZiWHBXuRAPMG3BrBeJrJC2a5cq69ZOr2WoVzCU9bKntJlLIGILH53JVaFh4Bua8DiYc0i6MUDHKePn17tbv+47j8VLvF74m2hMHw4Hokd/knts+Z47p8NP128ULfi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/b0FrvK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/b0FrvK"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d54214adso30671165e9.3
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 08 Jun 2025 10:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749404617; x=1750009417; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Uqlzpj58DHRzjFFq/KAaVdXDbxnOhHHnG9AT7wjRqg=;
        b=C/b0FrvK21gsSHrlAYkeXfeBci2pb9ULH5H6TZD3zpsdCsRsHfT0joVrWAnllt/vgp
         9sZNstEjlNwDCosud/Nnt5a8LbXEle26PzsfBJzYwu/XGFZ8qBnqQWJyHkS2wLClnIAz
         D5clYYE2qoOvwwWQXIZaRfLEseFcGM06Z7RQCFrApYYoCIDUZ8GSqAomxAsfZds9D3HW
         YlLlu8Rx3M6rvYz/88TPqK23ewdNJaFZcmbTK813deQWleQgsb7ii9aoIP9qw1TiL6QU
         QxpHah+EkHJ+yv8zRgoWKT4aVjKUns59MkQ9FtvNXNVxHLAlkpFPaYdffjb4nfvl/clD
         VWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749404617; x=1750009417;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Uqlzpj58DHRzjFFq/KAaVdXDbxnOhHHnG9AT7wjRqg=;
        b=SBYqi9M5HPLKcjLWiYkp6uVz0mt+8i5aeDa/KwY/mk3zuzEQYMKhsKFQg3TP+Fdfd7
         nol2DG28jkkOmgfofAd4ysjKIR4ZeKbfzgxnit28fMH/BZ0z4HIDtP0rolrlfh5rxdfu
         f2l+ziRYNOLI0Lzs10bDKr/SinWC9ufi0rcQ13eT+GVgN+lwstaJgnQr8A95KpcKyShf
         eIRzPOkZBTdpyl8/As0huQoPTO2Xz/yzIBHGJP1eMqj49GNylvcTnEuJAhF1g7YIbOxW
         nOS3YDShj8ymVDAoTgLiErC9NLcSfDWQvsQftVnTawXqCy5vuI1VUqjDb9r18uZ1JEeg
         kptQ==
X-Gm-Message-State: AOJu0YzKWzzd5bQTgZCGtEc7wpnTJVpa9FKLlhisg4De6Nt393gpaz8y
	AkQNKki2TeI6XORRztKLVoBn8eqPCgSaKS7xNQh2TwYEkp5E1xPKLY+ZxMok+A==
X-Gm-Gg: ASbGnctz1HMcuGVL/bKWfZGJO+Zx2YciNhqxtKQSZPINiXvGnhuGeszby7ZcWu3HoZw
	S7ZPOdhKWhVpxHFMleUt7PdJP9UWZmGg1zAmsf+VdE6raRl7h6+6Rgx5Bjc+rhB+2Jue4dmw9mu
	TdF/rOFeOb3Y5ubpVr0lpul6wHFBcCcwTPwhwjElVfw0VYfapF7+6njWZnmhyexjGgPjA3F5hvT
	WUKBwtxEViaPKxJLEeE1Wh8g5+jnxkk366SUEil+5cec6SFUqzqUvDQiOpk8lZiknYga+rPCfZr
	S27tieOpGAhdApoCC6zk8C8uzhMmaAUecnqDpuHtzko7vJjvSFYEdfmbVz2NQRzmkezGJ90cMkX
	OOpZr98j9IOsHcNp/zqI=
X-Google-Smtp-Source: AGHT+IEymH+DGwaZaOznL6tTaKi64e6cqu4waFSxkXbUD79fkHDqC6JTrq2odnzoGLuMT8YU117Rjg==
X-Received: by 2002:a05:6000:4282:b0:3a5:42:b17b with SMTP id ffacd0b85a97d-3a531cb33eemr7936446f8f.29.1749404616880;
        Sun, 08 Jun 2025 10:43:36 -0700 (PDT)
Received: from [192.168.1.227] (40.135.90.146.dyn.plus.net. [146.90.135.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229da18sm7766015f8f.19.2025.06.08.10.43.36
        for <kernel-tls-handshake@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 10:43:36 -0700 (PDT)
Message-ID: <eb6edfbe-ae2e-4824-8853-792c59a103ee@gmail.com>
Date: Sun, 8 Jun 2025 18:43:36 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ken Milmore <ken.milmore@gmail.com>
Subject: [PATCH 4/7] tlshd_handshake_parms: Add a textualised peer address and
 populate it from peeraddr.
To: kernel-tls-handshake@lists.linux.dev
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Make use of this in the logging instead of calling getnameinfo() on the fly.
We may also need this later if we want GnuTLS to verify the host address.

Signed-off-by: Ken Milmore <ken.milmore@gmail.com>
---
 src/tlshd/handshake.c |  5 ++---
 src/tlshd/log.c       | 18 +++++-------------
 src/tlshd/netlink.c   | 12 ++++++++++++
 src/tlshd/tlshd.h     |  7 +++----
 4 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/src/tlshd/handshake.c b/src/tlshd/handshake.c
index 6d10eaf..ca4e79a 100644
--- a/src/tlshd/handshake.c
+++ b/src/tlshd/handshake.c
@@ -186,9 +186,8 @@ out:
 		keyctl_unlink(parms.keyring, KEY_SPEC_SESSION_KEYRING);
 
 	if (parms.session_status) {
-		tlshd_log_failure(parms.peername, parms.peeraddr,
-				  parms.peeraddr_len);
+		tlshd_log_failure(parms.peername, parms.peeraddr_txt);
 		return;
 	}
-	tlshd_log_success(parms.peername, parms.peeraddr, parms.peeraddr_len);
+	tlshd_log_success(parms.peername, parms.peeraddr_txt);
 }
diff --git a/src/tlshd/log.c b/src/tlshd/log.c
index 77e2d29..87f3943 100644
--- a/src/tlshd/log.c
+++ b/src/tlshd/log.c
@@ -51,16 +51,12 @@ int tlshd_stderr;
  * @salen: length of IP address
  *
  */
-void tlshd_log_success(const char *hostname, const struct sockaddr *sap,
-		       socklen_t salen)
+void tlshd_log_success(const char *hostname, const char *addr_txt)
 {
-	char buf[NI_MAXHOST];
-
-	getnameinfo(sap, salen, buf, sizeof(buf), NULL, 0, NI_NUMERICHOST);
 	if (hostname[0] == '\0')
 		hostname = "<unknown>";
 	syslog(LOG_INFO, "Handshake with '%s' (%s) was successful\n",
-		hostname, buf);
+		hostname, addr_txt);
 }
 
 /**
@@ -70,17 +66,13 @@ void tlshd_log_success(const char *hostname, const struct sockaddr *sap,
  * @salen: length of IP address
  *
  */
-void tlshd_log_failure(const char *hostname, const struct sockaddr *sap,
-		       socklen_t salen)
+void tlshd_log_failure(const char *hostname, const char *addr_txt)
 {
-	if (salen) {
-		char buf[NI_MAXHOST];
-
-		getnameinfo(sap, salen, buf, sizeof(buf), NULL, 0, NI_NUMERICHOST);
+	if (addr_txt[0] != '\0') {
 		if (hostname[0] == '\0')
 			hostname = "<unknown>";
 		syslog(LOG_ERR, "Handshake with '%s' (%s) failed\n",
-		       hostname, buf);
+		       hostname, addr_txt);
 	} else
 		syslog(LOG_ERR, "Handshake request failed\n");
 }
diff --git a/src/tlshd/netlink.c b/src/tlshd/netlink.c
index 0f4a797..512f30e 100644
--- a/src/tlshd/netlink.c
+++ b/src/tlshd/netlink.c
@@ -224,6 +224,7 @@ static void tlshd_parse_certificate(struct tlshd_handshake_parms *parms,
 }
 
 static char tlshd_peername[NI_MAXHOST] = "";
+static char tlshd_peeraddr_txt[NI_MAXHOST] = "";
 static struct sockaddr_storage tlshd_peeraddr = { 0 };
 
 static int tlshd_genl_valid_handler(struct nl_msg *msg, void *arg)
@@ -281,6 +282,16 @@ static int tlshd_genl_valid_handler(struct nl_msg *msg, void *arg)
 	tlshd_parse_peer_identity(parms, tb[HANDSHAKE_A_ACCEPT_PEER_IDENTITY]);
 	tlshd_parse_certificate(parms, tb[HANDSHAKE_A_ACCEPT_CERTIFICATE]);
 
+	/* Textualize the peer address */
+	err = getnameinfo(parms->peeraddr, parms->peeraddr_len,
+			  tlshd_peeraddr_txt, sizeof(tlshd_peeraddr_txt),
+			  NULL, 0, NI_NUMERICHOST);
+	if (err) {
+		tlshd_log_gai_error(err);
+		tlshd_peeraddr_txt[0] = '\0';
+		return NL_STOP;
+	}
+
 	if (peername)
 		strncpy(tlshd_peername, peername, sizeof(tlshd_peername) - 1);
 	else {
@@ -299,6 +310,7 @@ static int tlshd_genl_valid_handler(struct nl_msg *msg, void *arg)
 
 static const struct tlshd_handshake_parms tlshd_default_handshake_parms = {
 	.peername		= tlshd_peername,
+	.peeraddr_txt		= tlshd_peeraddr_txt,
 	.peeraddr		= (struct sockaddr *)&tlshd_peeraddr,
 	.peeraddr_len		= 0,
 	.sockfd			= -1,
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index f058a1a..29b0715 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -29,6 +29,7 @@ struct nl_sock;
 
 struct tlshd_handshake_parms {
 	char		*peername;
+	char		*peeraddr_txt;
 	struct sockaddr *peeraddr;
 	socklen_t	peeraddr_len;
 	int		sockfd;
@@ -96,10 +97,8 @@ extern void tlshd_log_init(const char *progname);
 extern void tlshd_log_shutdown(void);
 extern void tlshd_log_close(void);
 
-extern void tlshd_log_success(const char *hostname,
-			      const struct sockaddr *sap, socklen_t salen);
-extern void tlshd_log_failure(const char *hostname,
-			      const struct sockaddr *sap, socklen_t salen);
+extern void tlshd_log_success(const char *hostname, const char *addr_txt);
+extern void tlshd_log_failure(const char *hostname, const char *addr_txt);
 
 extern void tlshd_log_debug(const char *fmt, ...);
 extern void tlshd_log_notice(const char *fmt, ...);
-- 
2.47.2


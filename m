Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715DF3FC2
	for <kernel-tls-handshake@lists.linux.dev>; Sun,  8 Jun 2025 17:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749404653; cv=none; b=t0YgGIpvHxVsw0ZFRJI1NFrXp13iBq1JIkjjDYrRkCPBDk6FrRGm2UbZQFzI/+pRYMCRd440G7x5BiRUIqgHyK//+ow4zvc6u3e8W3lqjHOPIatarTARFjTwzyjN/czQc/AkuWDYYuyuVc5LaWwLD0xFXZXjliBk453TRJBi8Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749404653; c=relaxed/simple;
	bh=/aDeiR3exKai8l8JQGa0JiF6AhlbbwMqOY2J9Y/GGHA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=r81rQ00t8qnLXT8o3hdeTU4E1QBqA+KqMJ6iOR4Rqs+xojBXyC11UmnFMLlE1BTvQLJVThUh+68AskK1YMOXT7EKqy7EuvdgdbYXO3Sjwf4zqcxa82X7TNYAyxFepM6P0wAKnqeFKYPo7xKFZP7vaHV/MpRIBUDDH0hg2YR9UvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qv1UNRCX; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qv1UNRCX"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a54690d369so450525f8f.3
        for <kernel-tls-handshake@lists.linux.dev>; Sun, 08 Jun 2025 10:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749404650; x=1750009450; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kCA/jnEJQKUUB+F1gqnS2dtzGh/LoiDGsnkKqWltkQ=;
        b=Qv1UNRCXXWKzd+9JrFKPAjRw/8QN+wg+ReFHERMO3o41gQVGoaPnhrq3Pn4f+QSWl/
         D02Ts/C3c89iNczRKJekPDckiTXunu2kaOF+3Th5a6t2Is+jhjicz2/bQeZRTDVqIz6s
         1qXu1KrSuuonZJK6nGN7tByoR3Lq40rRd3qfonWucn4dVswpF3tzrMyFC9FFUrE2YSON
         KSkR8X7uvUdKJb0K1BGfKVqo+UmdyabrwiiT6u0KnVZxqspCmqxS88JrU8h5arFH/jNq
         JBMNky99JE70NxReT+8JYh36wXkJ9zre/ztf8wUm8rhD8N4B8uzGHTGsGFB/i+BX6bCt
         1DDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749404650; x=1750009450;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1kCA/jnEJQKUUB+F1gqnS2dtzGh/LoiDGsnkKqWltkQ=;
        b=WAR57s7iibUN/xVl2WanTqX8ZjAUJ/xRmVdP9CQr+hPxaFuEs/nMCDK6Z3VtkO4sVK
         SddBgBHpGreCAnImfJx/crqaanLueLcXgNBSjSD2s+Epb3bjkZpLcMOFlbxYZOoPCnSV
         xB16RlfrLvrPYJiSKFGA8G5mG2uKzT4CUSXMkepPXNxq3YH1lGqc0pHe12M+oC20K4Db
         UhaXxkSBKu4zmgPAHplpB/N0neMFzq5zCcGCd9ywx1JZrppAaJRztEbZh/K8q+rrhGvD
         K4mHWtEwMbNkV0QPk7/L9i8OPasPsjH+UJuA/qleua9dh+Oq2zsy7Bab6CewNVPveM+q
         sT0Q==
X-Gm-Message-State: AOJu0YxSI8tftcdHkTfOx9QEVJj34ap/vonQ2rwrQcCBaxAsl/Lus8wc
	SYuo9tWk+Z/tTDr9e2PgtzTE6x0a6nU+c/O0F9+rjJ9Zs128bO7ApAE6lKylbg==
X-Gm-Gg: ASbGnctuaGcpsfiugVhLv2wkvbUL0maSnH1xcghBMhbrk9bOk6dnd/mZZzt70u1B8jB
	DiAnWBI/PQkOyC6DSHgW8grWRVi8B5HmjgOeo1zs5l4dLV9mCXwrkSTenUaNgXFiQOM3l5hlzFe
	Dd6tLWauOBqKvcq5scNTRfNmLnw6kWZynqSnJk+zXOUbuwfkI/L6sngp+E1MkOFt+0PDxPIXPZ5
	32lYabD9vwSJ5tWHcTv8yZ0WKt/2n7fiBPIGDVA2f8GBmMPszW6Vj+FpVzDfk+VuHIV+CYSefby
	t9RYtbkHxkEZ+NwaFwfirKDF8wVFnRNAzb18kp9sK3ZLBzB3g//Qr0bQ6YTTuzY+tfwRPImPjIr
	xKAiCwNupCkWZO+wnUHI=
X-Google-Smtp-Source: AGHT+IEfGLYTHzV/c37sACMZZ8sGdkCYagMEaHPyCEx3iQUWARp5mCNiP0HxXTIUN6Xv4K5rFFTICQ==
X-Received: by 2002:a05:6000:26cd:b0:3a3:5f36:33ee with SMTP id ffacd0b85a97d-3a531cb5562mr8156431f8f.32.1749404649611;
        Sun, 08 Jun 2025 10:44:09 -0700 (PDT)
Received: from [192.168.1.227] (40.135.90.146.dyn.plus.net. [146.90.135.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm89741795e9.5.2025.06.08.10.44.09
        for <kernel-tls-handshake@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 10:44:09 -0700 (PDT)
Message-ID: <cf10aa27-39a4-42a8-8c33-8e0c0e933fb8@gmail.com>
Date: Sun, 8 Jun 2025 18:44:08 +0100
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ken Milmore <ken.milmore@gmail.com>
Subject: [PATCH 6/7] server: Add boolean config option "verify_peeraddr" under
 "[authenticate.server]".
To: kernel-tls-handshake@lists.linux.dev
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If this option is set to true, then the server will pass the textualized client IP/IPv6 address to GnuTLS to be verified against the client certificate.
This is intended to allow the server to verify client certificates which include an IP/IPv6 address as a Subject Alternative Name.

If this option is set together with the "verify_peername" option, then a forward-confirmed hostname will be used for the client if one can be found,
with the IP address being used as a fallback rather than rejecting the certificate.

Signed-off-by: Ken Milmore <ken.milmore@gmail.com>
---
 src/tlshd/config.c | 2 ++
 src/tlshd/server.c | 8 ++++++++
 src/tlshd/tlshd.h  | 1 +
 3 files changed, 11 insertions(+)

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index c647681..9599e1b 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -94,6 +94,8 @@ bool tlshd_config_init(const gchar *pathname)
 
 	tlshd_server_verify_peername = g_key_file_get_string(tlshd_configuration,
 					"authenticate.server", "verify_peername", NULL);
+	tlshd_server_verify_peeraddr = g_key_file_get_string(tlshd_configuration,
+					"authenticate.server", "verify_peeraddr", NULL);
 
 	keyrings = g_key_file_get_string_list(tlshd_configuration,
 					      "authenticate",
diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index 4a47fe8..2043f23 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -44,6 +44,7 @@
 #include "netlink.h"
 
 bool tlshd_server_verify_peername = false;
+bool tlshd_server_verify_peeraddr = false;
 
 static gnutls_privkey_t tlshd_server_privkey;
 static unsigned int tlshd_server_certs_len = TLSHD_MAX_CERTS;
@@ -154,10 +155,17 @@ static bool tlshd_server_get_verify_hostname(struct tlshd_handshake_parms *parms
 			tlshd_log_debug("server: Verify forward-confirmed peer name '%s'",
 					parms->peername);
 			hostname = parms->peername;
+		} else if (tlshd_server_verify_peeraddr) {
+			tlshd_log_debug("server: Peer name unconfirmed: Verify peer address '%s'",
+					parms->peeraddr_txt);
+			hostname = parms->peeraddr_txt;
 		} else {
 			tlshd_log_debug("server: Peer name unconfirmed: Forcing error.");
 			verify_hostname = false;
 		}
+	} else if (tlshd_server_verify_peeraddr) {
+		tlshd_log_debug("server: Verify peer address '%s' per configuration.");
+		hostname = parms->peeraddr_txt;
 	}
 
 	*hostname_p = hostname;
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 9e5b221..d0602bf 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -25,6 +25,7 @@ extern int tlshd_tls_debug;
 extern unsigned int tlshd_delay_done;
 extern int tlshd_stderr;
 extern bool tlshd_server_verify_peername;
+extern bool tlshd_server_verify_peeraddr;
 
 struct nl_sock;
 
-- 
2.47.2


Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6456A307AF9
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 25 Sep 2025 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758818340; cv=none; b=XywUqQiELXYubqkRjma1LItGBAqXPsf4ZRYLFGRXE3FByLzw+kmsiQQFPA4CXZUZctJQLUvhPsZKLHm9W1FMMqDzgewfqnfqHBul3Tvv2znoZmQJm93BTENedBSgn4UJ+tpI7VunJ98VTJNngNibxlqKLXybAvIa/eMIbyb3yNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758818340; c=relaxed/simple;
	bh=U8vfTgZFLGK+OHCSkdrC93KkpnQQ8+Vkii+UB78bJAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y7umKgtGwGa8CHmOPeY74sRKSyluaZCvUCpeXN7iBS3iTzXiToyHeTkO+h2SPRdEpyuKLgtXnZubhLZg70h53DsEcHC6hqyXb6UYH/57qFE/VtE/K73J6MPlbvonag5EeS3iTEMyhNztEFVuw+QVv2lYfB4psd1fNp+gEwOHC/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mvh1Bzev; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mvh1Bzev"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4c7de9cc647so12015221cf.2
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 25 Sep 2025 09:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758818337; x=1759423137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlzcuNXQECW5OMCLhaxm8Czozvl5CF3RcgQulqAUqXU=;
        b=Mvh1BzevpR1mXAhLC7b0RH0+/npbOwoDON2eAkEuMdHPiWLs831CDDCJ50EQOK9d+3
         Vc3S0JNnmS0zZrTYx0Hi7TeDwFDWjVmig0wRJ0EjFqhUBuVzME02h7upGGFj1xEGbbr7
         HoZNqx8ZHnD2OnGOS1ZANGfz16i5m3qRaYh8Hm2WRpDfvXjgDHYBu+27ZAoiNSAVwgwV
         uMqeaPDZ3rmQXJRBOLBj7O++z4Q37Bn1aG7noGVncsGImCgSLnH144s2qsoltK6jsVUH
         WZnfR+/iNggQU6PenAzaSCVoF8YKeRXocP0Usgbe79GDE5NSEjSH0TZ0E9oHplGAMaUU
         81MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818337; x=1759423137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RlzcuNXQECW5OMCLhaxm8Czozvl5CF3RcgQulqAUqXU=;
        b=omkZsNmcbu6igEMLrJH1RNmotRHYk4O8C+sKBFbA2le32kI/scKyEpFXKsR4TN7QEQ
         B21tfGtJi8BKRqLdESAKbAl9xkVJpB4gWaQ5EGu9A6XceqsgJSfLk9QmzMjmnWP2Eflv
         DirOJyE0PgZIaukCp1p+2bzl//Vj2XMeRQnHPURiyNbnxWNsBsM5MMoalPbnM0ooKXqE
         Fdvr2iTSE2lnSKSL0HoEZeu9DhNKyUOLHq/b+0kgrLqefcmCX0xm3+qC3MoY0UfGIzUP
         Mxx2EMsFTm2Zr3SDQxOW27hvG21awPB/HByXhdcMMy1VhjobzVUrXXClL/uW1jF6fIPH
         X2kA==
X-Gm-Message-State: AOJu0Yx+QxDzeAKsYaWKGU3p9ahELQDjRgn8pI4UPpra4myBjYqpYfYl
	mMpYYs1FRYw0WgoFEhkEn2STX0kaSzwR6W5ofdkH9GuO0aHOxNfyF0EHVQlh9w==
X-Gm-Gg: ASbGncttACQk0yNJbfI+k/r68eR1RKOeMePVdC1Ke2lJUjLSCpV32nNhhx3sQNUc4N/
	mTGIvj8Tsn+hzg/Z25PfHrK/86brzxZJ9xkic5o72uuyNQsyidStrNd2+7OOJ3mBQsW/tyYMv3m
	RSpYgrcmLXNdJ6n3bXJvJGQAZaTrcLoge9NHptse4EN9/33GAMKHEepK5818HBpyGfMfTsz8Ud5
	22P2C6Hnx1NSLbzXIO7pu8Jlpg54x7mf7ooP03xeH2mPRWqzECPwuI6WjElc8S5YnnOhuioAUOZ
	0vTz5eAcsR9xBcDJvefVqF1chFK7/k9+o53a1tLD1vlyohtfRWkuaEWLjZ4WriIbRMXieIwABFn
	5aDq+kVL/6Ijj34erSLgktyCUZXuGGRZVRtsoEugtfCAtCh5Sk//zLmTWDVVG0Gk=
X-Google-Smtp-Source: AGHT+IH5YzLIHojDoS0nuQMy4KfY/vwtBBMFaA+NyhlMe7Rcpgg+o5ZvIjl/LcIMWJ9RjFJFAdXouw==
X-Received: by 2002:ac8:7d10:0:b0:4b7:b1cb:5bd8 with SMTP id d75a77b69052e-4da4dcc644fmr49375181cf.73.1758818335795;
        Thu, 25 Sep 2025 09:38:55 -0700 (PDT)
Received: from wsfd-netdev64.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db108726a2sm12764951cf.34.2025.09.25.09.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:38:55 -0700 (PDT)
From: Xin Long <lucien.xin@gmail.com>
To: kernel-tls-handshake@lists.linux.dev
Cc: Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH 2/2] tlshd: set conn errcode to EACCES on GnuTLS failure in QUIC handshake
Date: Thu, 25 Sep 2025 12:38:06 -0400
Message-ID: <2d229b049efa2140e129392386870bf231dae5bf.1758818286.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1758818286.git.lucien.xin@gmail.com>
References: <cover.1758818286.git.lucien.xin@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align QUIC handshake error handling with the TLS 1.3 path in
tlshd_start_tls_handshake(). In tlshd_quic_start_handshake(), any error
returned from the GnuTLS API is now logged and mapped to conn->errcode =
EACCES (session_status).

Note: unlike TLS 1.3, the QUIC handshake manages its own packet send/recv.
Timeouts are handled separately, with conn->errcode set to ETIMEDOUT
by quic_timer_handler().

Signed-off-by: Xin Long <lucien.xin@gmail.com>
---
 src/tlshd/quic.c | 66 +++++++++++++++++++++++++++---------------------
 1 file changed, 37 insertions(+), 29 deletions(-)

diff --git a/src/tlshd/quic.c b/src/tlshd/quic.c
index f19e1db..0e0852e 100644
--- a/src/tlshd/quic.c
+++ b/src/tlshd/quic.c
@@ -188,7 +188,7 @@ static int quic_tp_send_func(gnutls_session_t session, gnutls_buffer_t extdata)
 	ret = gnutls_buffer_append_data(extdata, buf, len);
 	if (ret) {
 		tlshd_log_gnutls_error(ret);
-		return ret;
+		return -1;
 	}
 
 	return 0;
@@ -230,6 +230,7 @@ static char quic_priority[] =
 static int quic_session_set_priority(gnutls_session_t session, uint32_t cipher)
 {
 	char p[136] = {};
+	int ret;
 
 	memcpy(p, quic_priority, strlen(quic_priority));
 	switch (cipher) {
@@ -249,14 +250,19 @@ static int quic_session_set_priority(gnutls_session_t session, uint32_t cipher)
 		strcat(p, "AES-128-GCM:+AES-256-GCM:+AES-128-CCM:+CHACHA20-POLY1305");
 	}
 
-	return gnutls_priority_set_direct(session, p, NULL);
+	ret = gnutls_priority_set_direct(session, p, NULL);
+	if (ret) {
+		tlshd_log_gnutls_error(ret);
+		return -1;
+	}
+	return 0;
 }
 
 static int quic_session_set_alpns(gnutls_session_t session, char *alpn_data)
 {
 	gnutls_datum_t alpns[TLSHD_QUIC_MAX_ALPNS_LEN / 2];
 	char *alpn = strtok(alpn_data, ",");
-	int count = 0;
+	int count = 0, ret;
 
 	while (alpn) {
 		while (*alpn == ' ')
@@ -267,7 +273,12 @@ static int quic_session_set_alpns(gnutls_session_t session, char *alpn_data)
 		alpn = strtok(NULL, ",");
 	}
 
-	return gnutls_alpn_set_protocols(session, alpns, count, GNUTLS_ALPN_MANDATORY);
+	ret = gnutls_alpn_set_protocols(session, alpns, count, GNUTLS_ALPN_MANDATORY);
+	if (ret) {
+		tlshd_log_gnutls_error(ret);
+		return -1;
+	}
+	return 0;
 }
 
 static gnutls_record_encryption_level_t quic_get_encryption_level(uint8_t level)
@@ -401,7 +412,7 @@ static int quic_handshake_crypto_data(const struct tlshd_quic_conn *conn,
 	level = quic_get_encryption_level(level);
 	if (datalen > 0) {
 		ret = gnutls_handshake_write(session, level, data, datalen);
-		if (ret != 0) {
+		if (ret) {
 			if (!gnutls_error_is_fatal(ret))
 				return 0;
 			goto err;
@@ -418,7 +429,7 @@ static int quic_handshake_crypto_data(const struct tlshd_quic_conn *conn,
 err:
 	gnutls_alert_send_appropriate(session, ret);
 	tlshd_log_gnutls_error(ret);
-	return ret;
+	return -1;
 }
 
 /**
@@ -486,24 +497,25 @@ static int tlshd_quic_session_configure(struct tlshd_quic_conn *conn)
 	gnutls_session_t session = conn->session;
 	int ret;
 
-	ret = quic_session_set_priority(session, conn->cipher);
-	if (ret)
-		return ret;
+	if (quic_session_set_priority(session, conn->cipher))
+		return -1;
 
-	if (conn->alpns[0]) {
-		ret = quic_session_set_alpns(session, conn->alpns);
-		if (ret)
-			return ret;
-	}
+	if (conn->alpns[0] && quic_session_set_alpns(session, conn->alpns))
+		return -1;
 
 	gnutls_handshake_set_secret_function(session, quic_secret_func);
 	gnutls_handshake_set_read_function(session, quic_read_func);
 	gnutls_alert_set_read_function(session, quic_alert_read_func);
 
-	return gnutls_session_ext_register(
+	ret = gnutls_session_ext_register(
 		session, "QUIC Transport Parameters", QUIC_TLSEXT_TP_PARAM,
 		GNUTLS_EXT_TLS, quic_tp_recv_func, quic_tp_send_func, NULL, NULL, NULL,
 		GNUTLS_EXT_FLAG_TLS | GNUTLS_EXT_FLAG_CLIENT_HELLO | GNUTLS_EXT_FLAG_EE);
+	if (ret) {
+		tlshd_log_gnutls_error(ret);
+		return -1;
+	}
+	return 0;
 }
 
 static void tlshd_quic_recv_session_ticket(struct tlshd_quic_conn *conn)
@@ -532,16 +544,16 @@ static void tlshd_quic_recv_session_ticket(struct tlshd_quic_conn *conn)
 		return;
 
 	/* process new session ticket msg and get the generated session data */
-	ret = quic_handshake_crypto_data(conn, QUIC_CRYPTO_APP, conn->ticket, len);
-	if (ret) {
-		conn->errcode = -ret;
+	if (quic_handshake_crypto_data(conn, QUIC_CRYPTO_APP, conn->ticket, len)) {
+		conn->errcode = EACCES;
 		return;
 	}
+
 	size = sizeof(conn->ticket);
 	ret = gnutls_session_get_data(session, conn->ticket, &size);
 	if (ret) {
 		tlshd_log_gnutls_error(ret);
-		conn->errcode = -ret;
+		conn->errcode = EACCES;
 		return;
 	}
 
@@ -569,17 +581,14 @@ void tlshd_quic_start_handshake(struct tlshd_quic_conn *conn)
 	FD_ZERO(&readfds);
 	FD_SET(sockfd, &readfds);
 
-	ret = tlshd_quic_session_configure(conn);
-	if (ret) {
-		tlshd_log_gnutls_error(ret);
-		conn->errcode = -ret;
+	if (tlshd_quic_session_configure(conn)) {
+		conn->errcode = EACCES;
 		return;
 	}
 
 	if (!conn->is_serv) {
-		ret = quic_handshake_crypto_data(conn, QUIC_CRYPTO_INITIAL, NULL, 0);
-		if (ret) {
-			conn->errcode = -ret;
+		if (quic_handshake_crypto_data(conn, QUIC_CRYPTO_INITIAL, NULL, 0)) {
+			conn->errcode = EACCES;
 			return;
 		}
 
@@ -614,9 +623,8 @@ void tlshd_quic_start_handshake(struct tlshd_quic_conn *conn)
 				return tlshd_log_error("socket recvmsg error %d", errno);
 			}
 			tlshd_log_debug("> Handshake RECV: %u %u", msg->len, msg->level);
-			ret = quic_handshake_crypto_data(conn, msg->level, msg->data, msg->len);
-			if (ret) {
-				conn->errcode = -ret;
+			if (quic_handshake_crypto_data(conn, msg->level, msg->data, msg->len)) {
+				conn->errcode = EACCES;
 				return;
 			}
 		}
-- 
2.47.1


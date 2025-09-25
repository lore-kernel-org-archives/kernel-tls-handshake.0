Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ABE1BD9D0
	for <kernel-tls-handshake@lists.linux.dev>; Thu, 25 Sep 2025 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758818338; cv=none; b=IZ0ikGH5leDJ6hx0RHuaIx53lcQ8aIkTLGIF8ZijO1QH5FZQuC9fK6wZIY/J/BGVg/Q3SJYjB63Gv6RcjL9ligJD4kzyzUMfOB3uX1ADvZPu04QUQi9pvqvqiA0uikFE9AI5GL/fE+w89qP7IwXQoBO6ZNVn4CdS6rXDLkL0caM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758818338; c=relaxed/simple;
	bh=HNSaEqW0k5jzHtHO+45KxJpJcFa+xDTkqDhgdVIq1xY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SfIn5jx56DMDw+7gi2eXVfcqltjhrMXgebcvARnXhYJ5tq7mY5NoZJNfasULrht9uKcImMP4CDNGx6kqge4J5/DvPA+AOZAMnvv7A815VoDzlFx34DIfl0xLs/f27l7TwsXSU/SGxw7LuwvDAE23m+C02bCObTBXBM0IXgl1JOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiHpwsBG; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiHpwsBG"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4b61161dd37so7991651cf.3
        for <kernel-tls-handshake@lists.linux.dev>; Thu, 25 Sep 2025 09:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758818335; x=1759423135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+71+IHuMjPV5qLRcuEroteNIIktj5akG697pSxycB4Q=;
        b=hiHpwsBGgD0LR+nX38OBxo6zVDSj1CAtoGYDcjp9TrFgJOt7aNJiBP+5hzM3yQyb3V
         w7TQqAjPZs9WjM/4w909Gp4ANux+Gf8MQdAd6vg+3tl5DLMIGj+QM6FyQ4geXaQS7h07
         j06hIbek0ftsthpDIbm6eAh4iF0lNiuDo6+4cPMGLruITlMWXkg++UrrKntVlKy7bUPw
         ylkRQrvGhKkAZz5sSu1RmjQp261PJPbhxpWHgr8ImrZuF0vxV8CBDrvl3AOYqAKuG/bx
         Y0wwVbbHtrHc3jFI1BEPdGsR6h3HY/529P8S4BUaeImlsBmv6hbGjq6SC39ydUCmjW7N
         aQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818335; x=1759423135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+71+IHuMjPV5qLRcuEroteNIIktj5akG697pSxycB4Q=;
        b=q33DXsywxw5KvilLAAchAQbX13PLWoc2sbsNb42N+v5iZoprw4Sitjj6klPaV2NIju
         bRoUtTSNJRfHg4nCK2OQoo2SAI8QUSeiyBVx8AWgDPC7bYamy0sChVwd4KRUDZ8Vf9e8
         m7UbK4uQHszI5EaKXcUIWZosOWWUZb0XmJqP0XfZ3pIeZxihUbx2EyUomJtvjYQZ5F0Q
         QMOJDbcRrbueCb8mbZUMibE9zJTMxKJQh5Xhd1qs5gc/9OpGa0hM+etpwN498dm9R+sm
         2toPJ19nQkx36DrYkxnfrS/FS2lKgHd3Nx+K/y35Sptd+kyaY2yHe0koSJOseyC0iLGr
         r1sQ==
X-Gm-Message-State: AOJu0YxLnhJ0dRB2GKrWZb0cwriS0YR8mrqx0oUs2zdMRZrOU//4/Rnj
	CGr/tdKo+R1e+pt0KEtWAa0JQ0a5qJU1olDSA7cyIDnG7gN5j0Pnw1Xm3fRJAw==
X-Gm-Gg: ASbGncsml2pgSv3QtuEQDMLd8T032XmjXzm4hBcYTbGsP8O0L/YKDrOiXAbSIAIf/B5
	YcqFWUjn60uqvFuY1AQHAAY4VHU2mLbh31g7m1+1LQuOdvJsvx5cW9iQTSgyNe1ItbjJcouCulG
	YWWzN16HLWOfK6FqOr6eRZX4jFwDHr3C+GTBYNUTZGimwGTXMVzlmPmQFLL20f+/M5YP/bouhgi
	82QQjsloAHZyenZBkiT6ElmsTWkFS2GfunSe3ize/cWZwwDbRnSG9u9AbtGfL/TY7gsbGxBxrnV
	EeR1yBiurGLY1gmuj/dWfs2XBTxYqhsEYaCMduLrk9LYZQur28YONExGnrO2GJb6O58SqSYBjzG
	zOpGifIvQhUE+pcpnJqihIVftupJOWquMzVy33TNvgckCcBVR1QEQ/REw3RITvU4tgLEZe03s2A
	==
X-Google-Smtp-Source: AGHT+IFTvAuC2s9zUskQPKTFithaUfC3kHf1JROdLtalLjZxmpaX+A5SJyVYQFzii7jYdnwN3ybRig==
X-Received: by 2002:ac8:7d10:0:b0:4d8:b9b9:932e with SMTP id d75a77b69052e-4da4b13f6eemr52671721cf.44.1758818335067;
        Thu, 25 Sep 2025 09:38:55 -0700 (PDT)
Received: from wsfd-netdev64.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db108726a2sm12764951cf.34.2025.09.25.09.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:38:54 -0700 (PDT)
From: Xin Long <lucien.xin@gmail.com>
To: kernel-tls-handshake@lists.linux.dev
Cc: Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH 1/2] tlshd: leave session_status as EIO on GnuTLS failure in QUIC session setup
Date: Thu, 25 Sep 2025 12:38:05 -0400
Message-ID: <dc0dd45cdbea826f9716f76a070ba8312adc7ca7.1758818286.git.lucien.xin@gmail.com>
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

Align the QUIC session setup error handling with the TLS 1.3 code paths:

- tlshd_tls13_client_x509_handshake()
- tlshd_tls13_client_psk_handshake()
- tlshd_tls13_server_x509_handshake()
- tlshd_tls13_server_psk_handshake()

The QUIC session setup functions:

- tlshd_quic_client_set_x509_session()
- tlshd_quic_client_set_psk_session()
- tlshd_quic_server_set_x509_session()
- tlshd_quic_server_set_psk_session()

will no longer return an error directly. Instead, if a GnuTLS API call
fails, session_status is left as EIO after logging the Gnutls errors.

Signed-off-by: Xin Long <lucien.xin@gmail.com>
---
 src/tlshd/client.c | 42 ++++++++++++++++++++----------------------
 src/tlshd/server.c | 29 +++++++++++++----------------
 2 files changed, 33 insertions(+), 38 deletions(-)

diff --git a/src/tlshd/client.c b/src/tlshd/client.c
index ad9a793..3415fdd 100644
--- a/src/tlshd/client.c
+++ b/src/tlshd/client.c
@@ -530,17 +530,17 @@ static int tlshd_quic_client_x509_verify_function(gnutls_session_t session)
 
 #define TLSHD_QUIC_NO_CERT_AUTH	3
 
-static int tlshd_quic_client_set_x509_session(struct tlshd_quic_conn *conn)
+static void tlshd_quic_client_set_x509_session(struct tlshd_quic_conn *conn)
 {
 	struct tlshd_handshake_parms *parms = conn->parms;
 	gnutls_certificate_credentials_t cred;
 	gnutls_session_t session;
-	int ret = -EINVAL;
+	int ret;
 
 	if (conn->cert_req != TLSHD_QUIC_NO_CERT_AUTH) {
 		if (!tlshd_x509_client_get_certs(parms) || !tlshd_x509_client_get_privkey(parms)) {
-			tlshd_log_error("cert/privkey get error %d", -ret);
-			return ret;
+			tlshd_log_error("Failed to get cert or privkey");
+			return;
 		}
 	}
 	ret = gnutls_certificate_allocate_credentials(&cred);
@@ -581,7 +581,8 @@ static int tlshd_quic_client_set_x509_session(struct tlshd_quic_conn *conn)
 			goto err_session;
 	}
 	conn->session = session;
-	return 0;
+	return;
+
 err_session:
 	gnutls_deinit(session);
 err_cred:
@@ -590,29 +591,28 @@ err:
 	tlshd_x509_client_put_privkey();
 	tlshd_x509_client_put_certs();
 	tlshd_log_gnutls_error(ret);
-	return ret;
 }
 
-static int tlshd_quic_client_set_anon_session(struct tlshd_quic_conn *conn)
+static void tlshd_quic_client_set_anon_session(struct tlshd_quic_conn *conn)
 {
 	conn->cert_req = TLSHD_QUIC_NO_CERT_AUTH;
-	return tlshd_quic_client_set_x509_session(conn);
+	tlshd_quic_client_set_x509_session(conn);
 }
 
-static int tlshd_quic_client_set_psk_session(struct tlshd_quic_conn *conn)
+static void tlshd_quic_client_set_psk_session(struct tlshd_quic_conn *conn)
 {
 	key_serial_t peerid = g_array_index(conn->parms->peerids, key_serial_t, 0);
 	gnutls_psk_client_credentials_t cred;
 	gnutls_session_t session;
 	char *identity = NULL;
 	gnutls_datum_t key;
-	int ret = -EINVAL;
+	int ret;
 
 	if (!tlshd_keyring_get_psk_username(peerid, &identity) ||
 	    !tlshd_keyring_get_psk_key(peerid, &key)) {
 		free(identity);
-		tlshd_log_error("identity/key get error %d", -ret);
-		return ret;
+		tlshd_log_error("Failed to get key identity or read key");
+		return;
 	}
 
 	ret = gnutls_psk_allocate_client_credentials(&cred);
@@ -630,7 +630,8 @@ static int tlshd_quic_client_set_psk_session(struct tlshd_quic_conn *conn)
 	if (ret)
 		goto err_session;
 	conn->session = session;
-	return 0;
+	return;
+
 err_session:
 	gnutls_deinit(session);
 err_cred:
@@ -638,7 +639,6 @@ err_cred:
 err:
 	free(identity);
 	tlshd_log_gnutls_error(ret);
-	return ret;
 }
 
 /**
@@ -659,26 +659,24 @@ void tlshd_quic_clienthello_handshake(struct tlshd_handshake_parms *parms)
 
 	switch (parms->auth_mode) {
 	case HANDSHAKE_AUTH_UNAUTH:
-		ret = tlshd_quic_client_set_anon_session(conn);
+		tlshd_quic_client_set_anon_session(conn);
 		break;
 	case HANDSHAKE_AUTH_X509:
-		ret = tlshd_quic_client_set_x509_session(conn);
+		tlshd_quic_client_set_x509_session(conn);
 		break;
 	case HANDSHAKE_AUTH_PSK:
-		ret = tlshd_quic_client_set_psk_session(conn);
+		tlshd_quic_client_set_psk_session(conn);
 		break;
 	default:
-		ret = -EINVAL;
 		tlshd_log_debug("Unrecognized auth mode (%d)", parms->auth_mode);
 	}
-	if (ret) {
-		conn->errcode = -ret;
+
+	if (!conn->session)
 		goto out;
-	}
 
 	tlshd_quic_start_handshake(conn);
-out:
 	parms->session_status = conn->errcode;
+out:
 	tlshd_quic_conn_destroy(conn);
 }
 #else
diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index 6531f08..8bb769f 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -562,17 +562,17 @@ found:
 	return 0;
 }
 
-static int tlshd_quic_server_set_x509_session(struct tlshd_quic_conn *conn)
+static void tlshd_quic_server_set_x509_session(struct tlshd_quic_conn *conn)
 {
 	struct tlshd_handshake_parms *parms = conn->parms;
 	gnutls_certificate_credentials_t cred;
 	gnutls_datum_t ticket_key;
 	gnutls_session_t session;
-	int ret = -EINVAL;
+	int ret;
 
 	if (!tlshd_x509_server_get_certs(parms) || !tlshd_x509_server_get_privkey(parms)) {
-		tlshd_log_error("cert/privkey get error %d", -ret);
-		return ret;
+		tlshd_log_error("Failed to get cert or privkey");
+		return;
 	}
 
 	ret = gnutls_certificate_allocate_credentials(&cred);
@@ -619,7 +619,8 @@ static int tlshd_quic_server_set_x509_session(struct tlshd_quic_conn *conn)
 
 	conn->is_serv = 1;
 	conn->session = session;
-	return 0;
+	return;
+
 err_session:
 	gnutls_deinit(session);
 err_cred:
@@ -628,10 +629,9 @@ err:
 	tlshd_x509_server_put_privkey();
 	tlshd_x509_server_put_certs();
 	tlshd_log_gnutls_error(ret);
-	return ret;
 }
 
-static int tlshd_quic_server_set_psk_session(struct tlshd_quic_conn *conn)
+static void tlshd_quic_server_set_psk_session(struct tlshd_quic_conn *conn)
 {
 	gnutls_psk_server_credentials_t cred;
 	gnutls_session_t session;
@@ -654,14 +654,14 @@ static int tlshd_quic_server_set_psk_session(struct tlshd_quic_conn *conn)
 
 	conn->is_serv = 1;
 	conn->session = session;
-	return 0;
+	return;
+
 err_session:
 	gnutls_deinit(session);
 err_cred:
 	gnutls_psk_free_server_credentials(cred);
 err:
 	tlshd_log_gnutls_error(ret);
-	return ret;
 }
 
 /**
@@ -682,23 +682,20 @@ void tlshd_quic_serverhello_handshake(struct tlshd_handshake_parms *parms)
 
 	switch (parms->auth_mode) {
 	case HANDSHAKE_AUTH_X509:
-		ret = tlshd_quic_server_set_x509_session(conn);
+		tlshd_quic_server_set_x509_session(conn);
 		break;
 	case HANDSHAKE_AUTH_PSK:
-		ret = tlshd_quic_server_set_psk_session(conn);
+		tlshd_quic_server_set_psk_session(conn);
 		break;
 	default:
-		ret = -EINVAL;
 		tlshd_log_debug("Unrecognized auth mode (%d)", parms->auth_mode);
 	}
-	if (ret) {
-		conn->errcode = -ret;
+	if (!conn->session)
 		goto out;
-	}
 
 	tlshd_quic_start_handshake(conn);
-out:
 	parms->session_status = conn->errcode;
+out:
 	tlshd_quic_conn_destroy(conn);
 }
 #else
-- 
2.47.1


Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D98720AF9C
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Jun 2025 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237304; cv=none; b=MwnX7neJdQ5zqHBLD5/q33zjy1IvRSrlAF46qw81MgchE2QTSwWanVcrZNpeXiqXrK2SdsPc79p0QcEXV1VHAHzlEhANBBuwO20S+So9su1HNAICD5oyM68t6yEaFWkoPznsNQkmIOMBBg3DQk54fIAWvVUnxF4qmgC/tQgU1AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237304; c=relaxed/simple;
	bh=BQhuA/263/5oC2S7GbxMSsx5da+tM2mld6xkdnMGCpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glsQWUuNHbNg8Vj2GVeoqfQkeRx6XQMwA79uQh4kYCft7NYpPA3GVXO5mC8n1x1P/jMM96qnERcEEN6T3EOM0PQS8rwxSouuggDfc8Bmaat8LFUNmHTuWq/5Vwq8qiH3AZd2Cu9i+Tq1dHpxjnLLjwPlEdXVO3j4c+YolFN023U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzCPwb+J; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzCPwb+J"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so37367085e9.2
        for <kernel-tls-handshake@lists.linux.dev>; Wed, 18 Jun 2025 02:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750237301; x=1750842101; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBpnWfmoxPx6lbRkTJkXZSe8s7xbNri5uT2CW9L6piQ=;
        b=RzCPwb+JchjPeH6OH9E/SS3M7pnJ1nf0N1WELZ44Nb5hS8LaCs23DliFvOtEnDfyAV
         Ny0JL6ReHsqxRC/gmkprx9NWpLTO2Ja0EPzmRMQBuSXtIKlCFPVBzlbTnjm6vVbVgFLM
         sXskukE+wOIyE0skzZGpPH464ZAll9RqkDIC27Pu06c/MmB3I+PdDFl72K49qfMBeApX
         CvZDH16tmdr3A82mxhqLWzuZBD8fMsRR6NvVaqDhBqBbaF7Qfp8eHnWgVwvyYNfcfSLV
         C842d2de2VpAVLYwjI8suP6/ZzJICCJydcPDOwKL2nTr2ZaIZCYv7Ubi8E8cMjMOn58B
         IEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750237301; x=1750842101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBpnWfmoxPx6lbRkTJkXZSe8s7xbNri5uT2CW9L6piQ=;
        b=dCIRfHtWOy3HB5oCDpp2Qxn0jEJRwf1Ph4MHbIFE2uOEgbrH7Sx+3B8nG+G6e18bcs
         UsK5fqx8gp1ksvz4K9jliuh0WI/i8JacXGsy+UFr+BToSgN76NvwhMgxY52Yl9ndVjpK
         9jpm890WxuNYIKCkBQTB7CdlUoE50kZEHyphIN3FWJPCi+qHkq3H03lgoQK9d/MJ9xUy
         eHQUURA1iCvvNBZo1vzECdxqsRi5s6ZWOxo2t6Julw4bmpeXBTxao+BlFhDzCibxBGzh
         kOV386sRduhqlAthU3KWjTrmlE/Ls4dIZKm1jG0nMGme+rUrGnrrZ4mNje7+JVrmL3dU
         iyOg==
X-Gm-Message-State: AOJu0YwTU+xs+mNSBS8fhPDh1VXFylzRz0kBsHs5WzFuauZfGZz207Kv
	v/5cEkfr/BWIAYfsywuPgcoCIFHQHhRH3sUkcH9pCnlVg97CFnsPwwX0jijOh5jY
X-Gm-Gg: ASbGncuXrOpq9f9hSSo4lMwSDIz8f/iM/E+JUt72TEvOZD/0Nu8MiJSbbWcU8VwpuPu
	J99CssQCNMWUdYu4WBwPpHAhQfrzobmHw314gFAPuuWokzdJte2YgyanDktbTI6466wie6+8knh
	nFwBXi+KnwAaZJjwfnOplssY7tQB7aEK4CMdc0UQJrfwXqrxHrFQzLfe+CIOQIE95EScUPG579A
	KRYtyaaFJAa4EOuqe7qbCkcdpbacxf53FcukPfALNrrGJvLgOyfRf9v9LO9KMQEOhn/tAyH5Wt1
	PVPqJXvofR1kePo/ebghGkJOfcjizGTQZIspTOu28BPTPvmFsUK9deAjL5E6otbvZhJiAlhEwEd
	nbEWZPISX9La4ykO433jzDS9ypOr+4ADemenAUg==
X-Google-Smtp-Source: AGHT+IGmqjXAufeeMOcqpvI7uW25YtsBgA/CPtLoTYLGmIlRJI04tNyvqIGs0Rj+SRrRa7o1aXpj1g==
X-Received: by 2002:a05:6000:4211:b0:3a4:dd02:f724 with SMTP id ffacd0b85a97d-3a5723af87amr14584706f8f.43.1750237300684;
        Wed, 18 Jun 2025 02:01:40 -0700 (PDT)
Received: from uranus.home.lan (ptr-4yvyxu9ibhltaxz47ht.18120a2.ip6.access.telenet.be. [2a02:1810:a59b:eff1::5f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5780c5004sm12774737f8f.56.2025.06.18.02.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:01:40 -0700 (PDT)
From: Rik Theys <rik.theys@gmail.com>
X-Google-Original-From: Rik Theys <Rik.Theys@gmail.com>
To: kernel-tls-handshake@lists.linux.dev
Cc: Rik Theys <Rik.Theys@gmail.com>
Subject: [PATCH 4/5] Move server-side CRL code to common function
Date: Wed, 18 Jun 2025 11:00:39 +0200
Message-ID: <20250618090040.566838-5-Rik.Theys@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618090040.566838-1-Rik.Theys@gmail.com>
References: <20250618090040.566838-1-Rik.Theys@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code that configures the CRL is needed in both the TLS
and QUIC setup functions. Move the code that configures the
certificate and CRL into a separate function and call it from
tlshd_tls13_server_x509_handshake for TLS and
tlshd_quic_server_set_x509_session for QUIC.

Signed-off-by: Rik Theys <Rik.Theys@gmail.com>
---
 src/tlshd/server.c | 73 +++++++++++++++++++++++++---------------------
 1 file changed, 39 insertions(+), 34 deletions(-)

diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index bf4b740..f0e83ff 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -207,27 +207,13 @@ certificate_error:
 	return GNUTLS_E_CERTIFICATE_ERROR;
 }
 
-static int tlshd_tls13_server_x509_verify_function(gnutls_session_t session)
-{
-	struct tlshd_handshake_parms *parms = gnutls_session_get_ptr(session);
-
-	return tlshd_server_x509_verify_function(session, parms);
-}
-
-static void tlshd_tls13_server_x509_handshake(struct tlshd_handshake_parms *parms)
+static int tlshd_server_configure_credentials(gnutls_certificate_credentials_t
+					      xcred)
 {
-	gnutls_certificate_credentials_t xcred;
-	gnutls_session_t session;
-	char *cafile;
 	char *crlfile;
+	char *cafile;
 	int ret;
 
-	ret = gnutls_certificate_allocate_credentials(&xcred);
-	if (ret != GNUTLS_E_SUCCESS) {
-		tlshd_log_gnutls_error(ret);
-		return;
-	}
-
 	if (tlshd_config_get_server_truststore(&cafile)) {
 		ret = gnutls_certificate_set_x509_trust_file(xcred, cafile,
 							     GNUTLS_X509_FMT_PEM);
@@ -235,8 +221,7 @@ static void tlshd_tls13_server_x509_handshake(struct tlshd_handshake_parms *parm
 	} else
 		ret = gnutls_certificate_set_x509_system_trust(xcred);
 	if (ret < 0) {
-		tlshd_log_gnutls_error(ret);
-		goto out_free_creds;
+		return ret;
 	}
 	tlshd_log_debug("System trust: Loaded %d certificate(s).", ret);
 
@@ -245,22 +230,50 @@ static void tlshd_tls13_server_x509_handshake(struct tlshd_handshake_parms *parm
 							   GNUTLS_X509_FMT_PEM);
 		free(crlfile);
 		if (ret < 0 ) {
-			tlshd_log_gnutls_error(ret);
-			goto out_free_creds;
+			return ret;
 		}
 		tlshd_log_debug("System CRL: Loaded %d CRL(s).", ret);
 	} else {
 		tlshd_log_debug("System CRL: No CRL file configured.");
 	}
 
+	gnutls_certificate_set_retrieve_function2(xcred,
+						  tlshd_x509_retrieve_key_cb);
+
+	return GNUTLS_E_SUCCESS;
+}
+
+static int tlshd_tls13_server_x509_verify_function(gnutls_session_t session)
+{
+	struct tlshd_handshake_parms *parms = gnutls_session_get_ptr(session);
+
+	return tlshd_server_x509_verify_function(session, parms);
+}
+
+static void tlshd_tls13_server_x509_handshake(struct tlshd_handshake_parms *parms)
+{
+	gnutls_certificate_credentials_t xcred;
+	gnutls_session_t session;
+	int ret;
+
+	ret = gnutls_certificate_allocate_credentials(&xcred);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		return;
+	}
+
+	ret = tlshd_server_configure_credentials(xcred);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		goto out_free_creds;
+	}
+
 	if (!tlshd_x509_server_get_certs(parms)) {
 		goto out_free_creds;
 	}
 	if (!tlshd_x509_server_get_privkey(parms)) {
 		goto out_free_creds;
 	}
-	gnutls_certificate_set_retrieve_function2(xcred,
-						  tlshd_x509_retrieve_key_cb);
 
 	ret = gnutls_init(&session, GNUTLS_SERVER);
 	if (ret != GNUTLS_E_SUCCESS) {
@@ -479,7 +492,6 @@ static int tlshd_quic_server_set_x509_session(struct tlshd_quic_conn *conn)
 	gnutls_datum_t ticket_key;
 	gnutls_session_t session;
 	int ret = -EINVAL;
-	char *cafile;
 
 	if (!tlshd_x509_server_get_certs(parms) || !tlshd_x509_server_get_privkey(parms)) {
 		tlshd_log_error("cert/privkey get error %d", -ret);
@@ -489,17 +501,10 @@ static int tlshd_quic_server_set_x509_session(struct tlshd_quic_conn *conn)
 	ret = gnutls_certificate_allocate_credentials(&cred);
 	if (ret)
 		goto err;
-	if (tlshd_config_get_server_truststore(&cafile)) {
-		ret = gnutls_certificate_set_x509_trust_file(cred, cafile,
-							     GNUTLS_X509_FMT_PEM);
-		free(cafile);
-	} else
-		ret = gnutls_certificate_set_x509_system_trust(cred);
-	if (ret < 0)
-		goto err_cred;
-	tlshd_log_debug("System trust: Loaded %d certificate(s).", ret);
 
-	gnutls_certificate_set_retrieve_function2(cred, tlshd_x509_retrieve_key_cb);
+	ret = tlshd_server_configure_credentials(cred);
+	if (ret != GNUTLS_E_SUCCESS)
+		goto err;
 
 	gnutls_certificate_set_verify_function(cred, tlshd_quic_server_x509_verify_function);
 
-- 
2.49.0


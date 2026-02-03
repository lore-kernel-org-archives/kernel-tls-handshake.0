Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7944F30FC26
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  3 Feb 2026 23:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160333; cv=none; b=lxEZ9PJ/dnuMQL0TSuzx3OpwNKVjg1cjDI77hn8TEEfCpUyX6QBnPo7JNvjwy8QI0tU3bciskfyeNffb9edTpj7j45/XJKJ1S5YF91Jvihk/PH2m+PKgKd+7L8/T0qjiLYXbrobKsM7rhiNztqQ6WU7jDR2eKx5l3OKN1L2mDxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160333; c=relaxed/simple;
	bh=wuKwI5q8uDDdNwGelGxLE3XSOpV5v1XEDF9R0Xq0Xvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=XvZvyV2X2Hr4ymthGwx0DJTSy7K9VLsBoJQVxLGFgeeNgQj9RbtPZ3Wwe8zES4gsvSWWzcrQlWX+r3jmUC4vJb7VkTDleKbaa2ZujJbWQrI/xlI3ms15djmTaEzYbITZnahsXLMUGinSSrLvvLimg/NRiakNn3UkMhJvrbgoZVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q2RYwwq4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q2RYwwq4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770160329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hE/vqnJ5cJqWCYEbxjNoiZkdsAcceGOcNX7IXQH0er0=;
	b=Q2RYwwq4r3xTTfiTFduKklzYte9AEOp0JF+8N2MUc70s9gVaULNYVFYAaQ23pdg9BZHDI0
	+Ewgo8tJj1YZwCXBteFqTq1jNq0RRWyiXpxqrGbkdCx0j5JT2SI0/gDojPWM0p+hJCm12R
	lP+wQlvrtdb1DlAK05gRG0NwVPPK3BA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606-PdnVrwkbPoimr4rKb6mZNQ-1; Tue,
 03 Feb 2026 18:12:06 -0500
X-MC-Unique: PdnVrwkbPoimr4rKb6mZNQ-1
X-Mimecast-MFC-AGG-ID: PdnVrwkbPoimr4rKb6mZNQ_1770160325
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7089D195608D;
	Tue,  3 Feb 2026 23:12:05 +0000 (UTC)
Received: from aion.redhat.com (unknown [10.22.65.92])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0917F19560B4;
	Tue,  3 Feb 2026 23:12:04 +0000 (UTC)
Received: from aion.redhat.com (localhost [IPv6:::1])
	by aion.redhat.com (Postfix) with ESMTP id 51E40690664;
	Tue, 03 Feb 2026 18:12:03 -0500 (EST)
From: Scott Mayhew <smayhew@redhat.com>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev
Subject: [PATCH] tlshd: Send fatal alert to client when there are server config issues
Date: Tue,  3 Feb 2026 18:12:03 -0500
Message-ID: <20260203231203.1393170-1-smayhew@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mhD5xSA4gvKQcNSVRxtQMcc-xE_muTMknu99qEDJeis_1770160325
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Currently if a client attempts an x.509 handshake and the server is
misconfigured (no certificates, no private keys, etc), the server simply
closes the connection.  Prior to b010190 ("tlshd: Pass ETIMEDOUT from
gnutls to kernel"), this would result in a quick failure on the client.
Now the client keeps retrying until the mount program times out, which
takes several minutes.

A misconfigured server isn't a self-correcting problem, so send a fatal
alert to the client when this occurs so the client stops retrying
immediately.  This requires some minor refactoring of
tlshd_tls13_server_x509_handshake() so that the session is initialized
before attempting to load the certs and keys (otherwise it is not
possible to send an alert).  Also add some debug logging to help
the admin take corrective action.

Finally add some logging when an alert is received during the handshake.
Following suit with handshake completions, alerts will only be logged if
debug logging is enabled.

Signed-off-by: Scott Mayhew <smayhew@redhat.com>
---
 src/tlshd/handshake.c |  4 ++++
 src/tlshd/log.c       | 22 +++++++++++++++++++++
 src/tlshd/server.c    | 46 +++++++++++++++++++++++++++----------------
 src/tlshd/tlshd.h     |  1 +
 4 files changed, 56 insertions(+), 17 deletions(-)

diff --git a/src/tlshd/handshake.c b/src/tlshd/handshake.c
index e78f78f..007339a 100644
--- a/src/tlshd/handshake.c
+++ b/src/tlshd/handshake.c
@@ -115,6 +115,10 @@ void tlshd_start_tls_handshake(gnutls_session_t session,
 			tlshd_log_error("Handshake timeout, retrying");
 			parms->session_status = ETIMEDOUT;
 			break;
+		case GNUTLS_E_WARNING_ALERT_RECEIVED:
+		case GNUTLS_E_FATAL_ALERT_RECEIVED:
+			tlshd_log_alert(session, ret);
+			break;
 		default:
 			tlshd_log_gnutls_error(ret);
 		}
diff --git a/src/tlshd/log.c b/src/tlshd/log.c
index b70d4af..bab390a 100644
--- a/src/tlshd/log.c
+++ b/src/tlshd/log.c
@@ -188,6 +188,28 @@ void tlshd_log_cert_verification_error(gnutls_session_t session)
 			       tlshd_cert_status_names[i].name);
 }
 
+/**
+ * @brief Report a TLS alert
+ * @param[in]     session  Controlling GnuTLS session
+ * @param[in]     level    TLS alert level (warning or fatal)
+ */
+void tlshd_log_alert(gnutls_session_t session, int level)
+{
+	gnutls_alert_description_t alert;
+
+	if (level != GNUTLS_E_WARNING_ALERT_RECEIVED &&
+			level != GNUTLS_E_FATAL_ALERT_RECEIVED) {
+		tlshd_log_debug("%s called with invalid level", __func__);
+		return;
+	}
+
+	if (!tlshd_debug)
+		return;
+
+	alert = gnutls_alert_get(session);
+	tlshd_log_notice("Received alert: %s", gnutls_alert_get_name(alert));
+}
+
 /**
  * @brief Emit "library call failed" notification
  * @param[in]     error  GnuTLS error code to log
diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index 4850210..3a72fc5 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -397,30 +397,48 @@ static void tlshd_tls13_server_x509_handshake(struct tlshd_handshake_parms *parm
 	gnutls_session_t session;
 	int ret;
 
+	ret = gnutls_init(&session, GNUTLS_SERVER);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		return;
+	}
+	gnutls_transport_set_int(session, parms->sockfd);
+	gnutls_session_set_ptr(session, parms);
+
+	ret = tlshd_gnutls_priority_set(session, parms, 0);
+	if (ret) {
+		tlshd_log_gnutls_error(ret);
+		return;
+	}
+
 	ret = gnutls_certificate_allocate_credentials(&xcred);
 	if (ret != GNUTLS_E_SUCCESS) {
 		tlshd_log_gnutls_error(ret);
 		return;
 	}
 	ret = tlshd_server_get_truststore(xcred);
-	if (ret != GNUTLS_E_SUCCESS)
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_debug("Failed to initialize server trust store - check the configuration");
+		gnutls_alert_send(session, GNUTLS_AL_FATAL, GNUTLS_A_ACCESS_DENIED);
+		gnutls_deinit(session);
 		goto out_free_creds;
+	}
 
-	if (!tlshd_x509_server_get_certs(parms))
+	if (!tlshd_x509_server_get_certs(parms)) {
+		tlshd_log_debug("No usable server certificates were found - check the configuration");
+		gnutls_alert_send(session, GNUTLS_AL_FATAL, GNUTLS_A_ACCESS_DENIED);
+		gnutls_deinit(session);
 		goto out_free_creds;
-	if (!tlshd_x509_server_get_privkey(parms))
+	}
+	if (!tlshd_x509_server_get_privkey(parms)) {
+		tlshd_log_debug("No usable private keys were found - check the configuration");
+		gnutls_alert_send(session, GNUTLS_AL_FATAL, GNUTLS_A_ACCESS_DENIED);
+		gnutls_deinit(session);
 		goto out_free_certs;
+	}
 	gnutls_certificate_set_retrieve_function2(xcred,
 						  tlshd_x509_retrieve_key_cb);
 
-	ret = gnutls_init(&session, GNUTLS_SERVER);
-	if (ret != GNUTLS_E_SUCCESS) {
-		tlshd_log_gnutls_error(ret);
-		goto out_free_certs;
-	}
-	gnutls_transport_set_int(session, parms->sockfd);
-	gnutls_session_set_ptr(session, parms);
-
 	ret = gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
 	if (ret != GNUTLS_E_SUCCESS) {
 		tlshd_log_gnutls_error(ret);
@@ -430,12 +448,6 @@ static void tlshd_tls13_server_x509_handshake(struct tlshd_handshake_parms *parm
 					       tlshd_tls13_server_x509_verify_function);
 	gnutls_certificate_server_set_request(session, GNUTLS_CERT_REQUEST);
 
-	ret = tlshd_gnutls_priority_set(session, parms, 0);
-	if (ret) {
-		tlshd_log_gnutls_error(ret);
-		goto out_free_certs;
-	}
-
 	tlshd_start_tls_handshake(session, parms);
 
 	if (tlshd_debug &&
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 75d9a4a..686d861 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -118,6 +118,7 @@ extern void tlshd_log_perror(const char *prefix);
 extern void tlshd_log_gai_error(int error);
 
 extern void tlshd_log_cert_verification_error(gnutls_session_t session);
+extern void tlshd_log_alert(gnutls_session_t session, int level);
 extern void tlshd_log_gnutls_error(int error);
 extern void tlshd_gnutls_log_func(int level, const char *msg);
 extern void tlshd_gnutls_audit_func(gnutls_session_t session, const char *msg);
-- 
2.52.0


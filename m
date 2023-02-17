Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DC75697
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 11:31:53 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 5B06B1FEB3;
	Fri, 17 Feb 2023 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676633506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDfj1ceAlKg+RrA69npl0WXDl55485JHZF0xoIE5f6g=;
	b=f48HTYeJ69+uexasSfFwKstEWbJ5GeS0yDmeL2twt0AR6wq5Pazi+EzKJ3GRbAw1WgQ8A9
	8SgCMBYRQEw4+doa0uBsRN0V6WDW/En4Y2kHcx4vgNBA4l7Wnsll6NtCdKzfJwPNZed1LK
	djGtkMG12OPoZhbdrCIDdhtkQWl14XU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676633506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDfj1ceAlKg+RrA69npl0WXDl55485JHZF0xoIE5f6g=;
	b=iU9V3EULiD3GU+WycNntokd+jv/qWxe3Nm5VMa2b4CfqbHw043kZnOV/AXV11RCJWumeuY
	BywetT4Fy1hOYICw==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id 4D8132C145;
	Fri, 17 Feb 2023 11:31:46 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 4370C51BD98D; Fri, 17 Feb 2023 12:31:46 +0100 (CET)
From: Hannes Reinecke <hare@suse.de>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 3/4] net/tls_handshake: split tls_server_hello()
Date: Fri, 17 Feb 2023 12:31:44 +0100
Message-Id: <20230217113145.18916-4-hare@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217113145.18916-1-hare@suse.de>
References: <20230217113145.18916-1-hare@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split tls_server_hello() into 'tls_server_hello_x509()' and 'tls_server_hello_psk()'
to handle X.509 and PSK serverhandshakes.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 include/net/tls.h       |  8 ++++--
 net/tls/tls_handshake.c | 55 ++++++++++++++++++++++++++++++++++++-----
 2 files changed, 55 insertions(+), 8 deletions(-)

diff --git a/include/net/tls.h b/include/net/tls.h
index f4baf3b4b179..be65cbf72f8a 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -540,7 +540,11 @@ int tls_client_hello_x509(struct socket *sock, tls_done_func_t done,
 int tls_client_hello_psk(struct socket *sock, tls_done_func_t done,
 			 void *data, const char *priorities,
 			 key_serial_t peerid, unsigned int timeout);
-int tls_server_hello(struct socket *sock, tls_done_func_t done,
-		     void *data, const char *priorities, unsigned int timeout);
+int tls_server_hello_x509(struct socket *sock, tls_done_func_t done,
+			  void *data, const char *priorities,
+			  unsigned int timeout);
+int tls_server_hello_psk(struct socket *sock, tls_done_func_t done,
+			 void *data, const char *priorities,
+			 unsigned int timeout);
 
 #endif /* _TLS_OFFLOAD_H */
diff --git a/net/tls/tls_handshake.c b/net/tls/tls_handshake.c
index 8171b3c8f3a5..93bb3deaf2fb 100644
--- a/net/tls/tls_handshake.c
+++ b/net/tls/tls_handshake.c
@@ -141,7 +141,7 @@ static int tls_handshake_put_accept_resp(struct sk_buff *msg,
 		goto out;
 
 	ret = nla_put_u32(msg, HANDSHAKE_GENL_ATTR_TLS_TYPE,
-			  HANDSHAKE_GENL_TLS_TYPE_CLIENTHELLO);
+			  treq->th_type);
 	if (ret < 0)
 		goto out;
 	ret = nla_put_u32(msg, HANDSHAKE_GENL_ATTR_TLS_AUTH,
@@ -377,7 +377,7 @@ int tls_client_hello_psk(struct socket *sock, tls_done_func_t done,
 EXPORT_SYMBOL(tls_client_hello_psk);
 
 /**
- * tls_server_hello - request a server TLS handshake on a socket
+ * tls_server_hello_x509 - request a X.509 server TLS handshake on a socket
  * @sock: connected socket on which to perform the handshake
  * @done: function to call when the handshake has completed
  * @data: token to pass back to @done
@@ -389,8 +389,9 @@ EXPORT_SYMBOL(tls_client_hello_psk);
  *   %-ENOENT: No user agent is available
  *   %-ENOMEM: Memory allocation failed
  */
-int tls_server_hello(struct socket *sock, tls_done_func_t done,
-		     void *data, const char *priorities, unsigned int timeout)
+int tls_server_hello_x509(struct socket *sock, tls_done_func_t done,
+			  void *data, const char *priorities,
+			  unsigned int timeout)
 {
 	struct tls_handshake_req *treq;
 	struct handshake_req *req;
@@ -409,10 +410,52 @@ int tls_server_hello(struct socket *sock, tls_done_func_t done,
 
 	treq = tls_handshake_req_init(req, done, data, tp);
 	treq->th_type = HANDSHAKE_GENL_TLS_TYPE_SERVERHELLO;
-	treq->th_auth_type = HANDSHAKE_GENL_TLS_AUTH_UNSPEC;
+	treq->th_auth_type = HANDSHAKE_GENL_TLS_AUTH_X509;
+	if (timeout)
+		treq->th_timeout = timeout;
+
+	return handshake_req_submit(req, flags);
+}
+EXPORT_SYMBOL(tls_server_hello_x509);
+
+/**
+ * tls_server_hello_psk - request a PSK server TLS handshake on a socket
+ * @sock: connected socket on which to perform the handshake
+ * @done: function to call when the handshake has completed
+ * @data: token to pass back to @done
+ * @priorities: GnuTLS TLS priorities string
+ * @timeout: TLS handshake timeout (in seconds)
+ *
+ * Return values:
+ *   %0: Handshake request enqueue; ->done will be called when complete
+ *   %-ENOENT: No user agent is available
+ *   %-ENOMEM: Memory allocation failed
+ */
+int tls_server_hello_psk(struct socket *sock, tls_done_func_t done,
+			 void *data, const char *priorities,
+			 unsigned int timeout)
+{
+	struct tls_handshake_req *treq;
+	struct handshake_req *req;
+	gfp_t flags = GFP_KERNEL;
+	const char *tp;
+
+	tp = tls_handshake_dup_priorities(priorities, flags);
+	if (!tp)
+		return -ENOMEM;
+
+	req = handshake_req_alloc(sock, &tls_handshake_proto, flags);
+	if (!req) {
+		kfree(tp);
+		return -ENOMEM;
+	}
+
+	treq = tls_handshake_req_init(req, done, data, tp);
+	treq->th_type = HANDSHAKE_GENL_TLS_TYPE_SERVERHELLO;
+	treq->th_auth_type = HANDSHAKE_GENL_TLS_AUTH_PSK;
 	if (timeout)
 		treq->th_timeout = timeout;
 
 	return handshake_req_submit(req, flags);
 }
-EXPORT_SYMBOL(tls_server_hello);
+EXPORT_SYMBOL(tls_server_hello_psk);
-- 
2.35.3


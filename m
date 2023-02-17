Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFA55692
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 11:31:53 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 61DA71FEB6;
	Fri, 17 Feb 2023 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676633506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NoGqWRWiJtDCM++Py3IzHPAVVlUe+oJvFYpPUegrX/8=;
	b=SKwR2C0D81zmFC3981lcYeCnyPfr8WkYR/0p/NFoWu02Pzs+KXDZOwLXYGpHByjL7gQcAa
	sUaIDQkmk1vwhYgYQfM829x0EnO4/d2W+hJ0EOMzMeChCj9Uf3izkLRcBOnR+eyIIKtIfd
	tnz7B6BSg1eHogGsi8DISGXXat72zx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676633506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NoGqWRWiJtDCM++Py3IzHPAVVlUe+oJvFYpPUegrX/8=;
	b=XNSL8oGkmdqHU56519KdmhB1zvzLeyFoXNIZ8ZGLsxoBE1M4aVxEmSLSA4W9Xtirg6LKjs
	AZNtU5h1BavjmFBQ==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id 54D7C2C146;
	Fri, 17 Feb 2023 11:31:46 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 4ADC351BD98F; Fri, 17 Feb 2023 12:31:46 +0100 (CET)
From: Hannes Reinecke <hare@suse.de>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 4/4] tls_handshake: add 'keyring' argument to server hello
Date: Fri, 17 Feb 2023 12:31:45 +0100
Message-Id: <20230217113145.18916-5-hare@suse.de>
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

For ServerHello the TLS handshake has to validate the username/identity
with the keys stored on the server, but these might be stored on a
separate keyring. So add an argument 'keyring' to the server hello
functions to transport this information to the userspace daemon.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 include/net/tls.h       |  4 ++--
 net/tls/tls_handshake.c | 10 ++++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/include/net/tls.h b/include/net/tls.h
index be65cbf72f8a..2d33e883f7d0 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -542,9 +542,9 @@ int tls_client_hello_psk(struct socket *sock, tls_done_func_t done,
 			 key_serial_t peerid, unsigned int timeout);
 int tls_server_hello_x509(struct socket *sock, tls_done_func_t done,
 			  void *data, const char *priorities,
-			  unsigned int timeout);
+			  unsigned int timeout, key_serial_t keyring);
 int tls_server_hello_psk(struct socket *sock, tls_done_func_t done,
 			 void *data, const char *priorities,
-			 unsigned int timeout);
+			 unsigned int timeout, key_serial_t keyring);
 
 #endif /* _TLS_OFFLOAD_H */
diff --git a/net/tls/tls_handshake.c b/net/tls/tls_handshake.c
index 93bb3deaf2fb..7fa2baa323e4 100644
--- a/net/tls/tls_handshake.c
+++ b/net/tls/tls_handshake.c
@@ -383,6 +383,7 @@ EXPORT_SYMBOL(tls_client_hello_psk);
  * @data: token to pass back to @done
  * @priorities: GnuTLS TLS priorities string
  * @timeout: TLS handshake timeout (in seconds)
+ * @keyring: keyring with the keys to be accepted
  *
  * Return values:
  *   %0: Handshake request enqueue; ->done will be called when complete
@@ -391,7 +392,7 @@ EXPORT_SYMBOL(tls_client_hello_psk);
  */
 int tls_server_hello_x509(struct socket *sock, tls_done_func_t done,
 			  void *data, const char *priorities,
-			  unsigned int timeout)
+			  unsigned int timeout, key_serial_t keyring)
 {
 	struct tls_handshake_req *treq;
 	struct handshake_req *req;
@@ -413,6 +414,8 @@ int tls_server_hello_x509(struct socket *sock, tls_done_func_t done,
 	treq->th_auth_type = HANDSHAKE_GENL_TLS_AUTH_X509;
 	if (timeout)
 		treq->th_timeout = timeout;
+	if (keyring)
+		treq->th_keyring = keyring;
 
 	return handshake_req_submit(req, flags);
 }
@@ -425,6 +428,7 @@ EXPORT_SYMBOL(tls_server_hello_x509);
  * @data: token to pass back to @done
  * @priorities: GnuTLS TLS priorities string
  * @timeout: TLS handshake timeout (in seconds)
+ * @keyring: keyring with the keys to be accepted
  *
  * Return values:
  *   %0: Handshake request enqueue; ->done will be called when complete
@@ -433,7 +437,7 @@ EXPORT_SYMBOL(tls_server_hello_x509);
  */
 int tls_server_hello_psk(struct socket *sock, tls_done_func_t done,
 			 void *data, const char *priorities,
-			 unsigned int timeout)
+			 unsigned int timeout, key_serial_t keyring)
 {
 	struct tls_handshake_req *treq;
 	struct handshake_req *req;
@@ -455,6 +459,8 @@ int tls_server_hello_psk(struct socket *sock, tls_done_func_t done,
 	treq->th_auth_type = HANDSHAKE_GENL_TLS_AUTH_PSK;
 	if (timeout)
 		treq->th_timeout = timeout;
+	if (keyring)
+		treq->th_keyring = keyring;
 
 	return handshake_req_submit(req, flags);
 }
-- 
2.35.3


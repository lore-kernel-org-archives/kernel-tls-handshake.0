Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506E25692
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 11:31:48 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 52E24338EE;
	Fri, 17 Feb 2023 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676633506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RKlVIKtQ8D/fnl5eISXrE8BDYZBubu8qSX/CUKqTuHo=;
	b=oKEvqZmpzaQxq9bdWfCNWk7hb6niZ/bHHjy42t8P/NU07M4Zr+5JaRdGRmDpbcHMKRKVgh
	jBEBV2Hf97g+tqL6pjBRmkQw4NhGpkRHRuvf4CocOUFco/ISHE7ySOnIC3FsQ8mj5bQKym
	LKAUo/LxfahUl0HNHVeRp1J4nV1of2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676633506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RKlVIKtQ8D/fnl5eISXrE8BDYZBubu8qSX/CUKqTuHo=;
	b=3tCyYFqNCeFpoXwPNCRL/KGHEWTWuXC8+bd/mQTQcOFqq3qsSTaUvqQPwlJFIqBYgqYWzP
	vbAenrY2HznmHnCA==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id 40E3D2C142;
	Fri, 17 Feb 2023 11:31:46 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 3487651BD989; Fri, 17 Feb 2023 12:31:46 +0100 (CET)
From: Hannes Reinecke <hare@suse.de>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 1/4] tls-handshake: add 'timeout' netlink attribute
Date: Fri, 17 Feb 2023 12:31:42 +0100
Message-Id: <20230217113145.18916-2-hare@suse.de>
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

Add a 'timeout' netlink attribute to the 'request' netlink
message to allow the kernel to communicate an internal timeout
to userspace.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 include/net/tls.h              | 11 +++++++----
 include/uapi/linux/handshake.h |  1 +
 net/tls/tls_handshake.c        | 30 ++++++++++++++++++++++++++----
 3 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/include/net/tls.h b/include/net/tls.h
index f613feb64da8..51bf5a083cce 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -523,20 +523,23 @@ enum {
 	TLS_NO_PEERID = 0,
 	TLS_NO_CERT = 0,
 	TLS_NO_PRIVKEY = 0,
+	TLS_NO_TIMEOUT = 0,
 };
 
 typedef void	(*tls_done_func_t)(void *data, int status,
 				   key_serial_t peerid);
 
 int tls_client_hello_anon(struct socket *sock, tls_done_func_t done,
-			  void *data, const char *priorities);
+			  void *data, const char *priorities,
+			  unsigned int timeout);
 int tls_client_hello_x509(struct socket *sock, tls_done_func_t done,
 			  void *data, const char *priorities,
-			  key_serial_t cert, key_serial_t privkey);
+			  key_serial_t cert, key_serial_t privkey,
+			  unsigned int timeout);
 int tls_client_hello_psk(struct socket *sock, tls_done_func_t done,
 			 void *data, const char *priorities,
-			 key_serial_t peerid);
+			 key_serial_t peerid, unsigned int timeout);
 int tls_server_hello(struct socket *sock, tls_done_func_t done,
-		     void *data, const char *priorities);
+		     void *data, const char *priorities, unsigned int timeout);
 
 #endif /* _TLS_OFFLOAD_H */
diff --git a/include/uapi/linux/handshake.h b/include/uapi/linux/handshake.h
index 33c417cadfcb..b007e346cfc8 100644
--- a/include/uapi/linux/handshake.h
+++ b/include/uapi/linux/handshake.h
@@ -64,6 +64,7 @@ enum handshake_tls_accept_attrs {
 	HANDSHAKE_GENL_ATTR_TLS_X509_CERT,
 	HANDSHAKE_GENL_ATTR_TLS_X509_PRIVKEY,
 	HANDSHAKE_GENL_ATTR_TLS_PSK,
+	HANDSHAKE_GENL_ATTR_TLS_TIMEOUT,
 
 	__HANDSHAKE_GENL_ATTR_TLS_ACCEPT_MAX
 };
diff --git a/net/tls/tls_handshake.c b/net/tls/tls_handshake.c
index 007308727395..66adac8d660a 100644
--- a/net/tls/tls_handshake.c
+++ b/net/tls/tls_handshake.c
@@ -42,6 +42,7 @@ struct tls_handshake_req {
 	const char		*th_priorities;
 	int			th_type;
 	int			th_auth_type;
+	unsigned int		th_timeout;
 	key_serial_t		th_peerid;
 	key_serial_t		th_certificate;
 	key_serial_t		th_privkey;
@@ -72,6 +73,7 @@ tls_handshake_req_init(struct handshake_req *req, tls_done_func_t done,
 	treq->th_peerid = TLS_NO_PEERID;
 	treq->th_certificate = TLS_NO_CERT;
 	treq->th_privkey = TLS_NO_PRIVKEY;
+	treq->th_timeout = TLS_NO_TIMEOUT;
 	return treq;
 }
 
@@ -162,6 +164,12 @@ static int tls_handshake_put_accept_resp(struct sk_buff *msg,
 		if (ret < 0)
 			goto out;
 	}
+	if (treq->th_timeout != TLS_NO_TIMEOUT) {
+		ret = nla_put_u32(msg, HANDSHAKE_GENL_ATTR_TLS_TIMEOUT,
+				  treq->th_timeout);
+		if (ret < 0)
+			goto out;
+	}
 
 	ret = nla_put_string(msg, HANDSHAKE_GENL_ATTR_TLS_PRIORITIES,
 			     treq->th_priorities);
@@ -233,6 +241,7 @@ static const struct handshake_proto tls_handshake_proto = {
  * @done: function to call when the handshake has completed
  * @data: token to pass back to @done
  * @priorities: GnuTLS TLS priorities string, or NULL
+ * @timeout: TLS handshake timeout (in seconds)
  *
  * Return values:
  *   %0: Handshake request enqueue; ->done will be called when complete
@@ -240,7 +249,8 @@ static const struct handshake_proto tls_handshake_proto = {
  *   %-ENOMEM: Memory allocation failed
  */
 int tls_client_hello_anon(struct socket *sock, tls_done_func_t done,
-			  void *data, const char *priorities)
+			  void *data, const char *priorities,
+			  unsigned int timeout)
 {
 	struct tls_handshake_req *treq;
 	struct handshake_req *req;
@@ -260,6 +270,8 @@ int tls_client_hello_anon(struct socket *sock, tls_done_func_t done,
 	treq = tls_handshake_req_init(req, done, data, tp);
 	treq->th_type = HANDSHAKE_GENL_TLS_TYPE_CLIENTHELLO;
 	treq->th_auth_type = HANDSHAKE_GENL_TLS_AUTH_UNAUTH;
+	if (timeout)
+		treq->th_timeout = timeout;
 
 	return handshake_req_submit(req, flags);
 }
@@ -273,6 +285,7 @@ EXPORT_SYMBOL(tls_client_hello_anon);
  * @priorities: GnuTLS TLS priorities string
  * @cert: serial number of key containing client's x.509 certificate
  * @privkey: serial number of key containing client's private key
+ * @timeout: TLS handshake timeout (in seconds)
  *
  * Return values:
  *   %0: Handshake request enqueue; ->done will be called when complete
@@ -281,7 +294,8 @@ EXPORT_SYMBOL(tls_client_hello_anon);
  */
 int tls_client_hello_x509(struct socket *sock, tls_done_func_t done,
 			  void *data, const char *priorities,
-			  key_serial_t cert, key_serial_t privkey)
+			  key_serial_t cert, key_serial_t privkey,
+			  unsigned int timeout)
 {
 	struct tls_handshake_req *treq;
 	struct handshake_req *req;
@@ -303,6 +317,8 @@ int tls_client_hello_x509(struct socket *sock, tls_done_func_t done,
 	treq->th_auth_type = HANDSHAKE_GENL_TLS_AUTH_X509;
 	treq->th_certificate = cert;
 	treq->th_privkey = privkey;
+	if (timeout)
+		treq->th_timeout = timeout;
 
 	return handshake_req_submit(req, flags);
 }
@@ -315,6 +331,7 @@ EXPORT_SYMBOL(tls_client_hello_x509);
  * @data: token to pass back to @done
  * @priorities: GnuTLS TLS priorities string
  * @peerid: serial number of key containing TLS identity
+ * @timeout: TLS handshake timeout (in seconds)
  *
  * Return values:
  *   %0: Handshake request enqueue; ->done will be called when complete
@@ -323,7 +340,7 @@ EXPORT_SYMBOL(tls_client_hello_x509);
  */
 int tls_client_hello_psk(struct socket *sock, tls_done_func_t done,
 			 void *data, const char *priorities,
-			 key_serial_t peerid)
+			 key_serial_t peerid, unsigned int timeout)
 {
 	struct tls_handshake_req *treq;
 	struct handshake_req *req;
@@ -344,6 +361,8 @@ int tls_client_hello_psk(struct socket *sock, tls_done_func_t done,
 	treq->th_type = HANDSHAKE_GENL_TLS_TYPE_CLIENTHELLO;
 	treq->th_auth_type = HANDSHAKE_GENL_TLS_AUTH_PSK;
 	treq->th_peerid = peerid;
+	if (timeout)
+		treq->th_timeout = timeout;
 
 	return handshake_req_submit(req, flags);
 }
@@ -355,6 +374,7 @@ EXPORT_SYMBOL(tls_client_hello_psk);
  * @done: function to call when the handshake has completed
  * @data: token to pass back to @done
  * @priorities: GnuTLS TLS priorities string
+ * @timeout: TLS handshake timeout (in seconds)
  *
  * Return values:
  *   %0: Handshake request enqueue; ->done will be called when complete
@@ -362,7 +382,7 @@ EXPORT_SYMBOL(tls_client_hello_psk);
  *   %-ENOMEM: Memory allocation failed
  */
 int tls_server_hello(struct socket *sock, tls_done_func_t done,
-		     void *data, const char *priorities)
+		     void *data, const char *priorities, unsigned int timeout)
 {
 	struct tls_handshake_req *treq;
 	struct handshake_req *req;
@@ -382,6 +402,8 @@ int tls_server_hello(struct socket *sock, tls_done_func_t done,
 	treq = tls_handshake_req_init(req, done, data, tp);
 	treq->th_type = HANDSHAKE_GENL_TLS_TYPE_SERVERHELLO;
 	treq->th_auth_type = HANDSHAKE_GENL_TLS_AUTH_UNSPEC;
+	if (timeout)
+		treq->th_timeout = timeout;
 
 	return handshake_req_submit(req, flags);
 }
-- 
2.35.3


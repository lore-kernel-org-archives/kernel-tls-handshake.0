Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72883613D
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Sep 2023 14:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9609DC433C7;
	Wed,  6 Sep 2023 14:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694009137;
	bh=72NntF7di2oAdK+0aaORs9gkWAhBrYQkZZXWm9Yn7Q4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=OjEMkg61AwMlwh3dd96uJL9THUagX6KelxlXtQZ7ZHNoLLFmrNHDXJWAiVZ/u0M5V
	 SNwLuPMwvP76m0IpJV9QdKMS3Dl15x9kmvbvk95iVVkF2sEX2iUtUDbQkAiTMGuYTb
	 L2AGrxKl7P1hQC8RAkIsILBeqb9/Nu4SUWQdY1k9qqq6K5uSGhkrWeHY/lE3n+v94i
	 wLNbkbxtSejL+cyv7TDsAeVlZSIeKF9hP1XJOPnBgvxuov6SvNEHxiOYCX8Gn4katT
	 2Gq6NeFUr9OPuJiKj7soH8bmjDAVVceKQwJGJv6xAwZED6Nh2yRb1FhX52+tZcxbLT
	 hI8aS6bYr1urw==
Subject: [PATCH v1 1/6] tlshd: Check return values of non-void gnutls library
 functions
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Cc: Olga Kornievskaia <kolga@netapp.com>, Chuck Lever <chuck.lever@oracle.com>
Date: Wed, 06 Sep 2023 10:05:26 -0400
Message-ID: 
 <169400911631.10079.5928557976120702988.stgit@oracle-102.nfsv4bat.org>
In-Reply-To: 
 <169400879020.10079.2238873524435794665.stgit@oracle-102.nfsv4bat.org>
References: 
 <169400879020.10079.2238873524435794665.stgit@oracle-102.nfsv4bat.org>
User-Agent: StGit/1.5
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Chuck Lever <chuck.lever@oracle.com>

Ensure library problems are not ignored during certificate
verification.

Suggested-by: Olga Kornievskaia <kolga@netapp.com>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/client.c |   22 ++++++++++++++++++----
 src/tlshd/server.c |   14 ++++++++++++--
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/src/tlshd/client.c b/src/tlshd/client.c
index f485d4ea2457..19b07844513c 100644
--- a/src/tlshd/client.c
+++ b/src/tlshd/client.c
@@ -239,7 +239,13 @@ static int tlshd_client_x509_verify_function(gnutls_session_t session)
 		gnutls_x509_crt_t cert;
 
 		gnutls_x509_crt_init(&cert);
-		gnutls_x509_crt_import(cert, &peercerts[i], GNUTLS_X509_FMT_DER);
+		ret = gnutls_x509_crt_import(cert, &peercerts[i],
+					     GNUTLS_X509_FMT_DER);
+		if (ret != GNUTLS_E_SUCCESS) {
+			tlshd_log_gnutls_error(ret);
+			gnutls_x509_crt_deinit(cert);
+			return GNUTLS_E_CERTIFICATE_ERROR;
+		}
 		parms->remote_peerid[i] =
 			tlshd_keyring_create_cert(cert, parms->peername);
 		gnutls_x509_crt_deinit(cert);
@@ -290,9 +296,17 @@ static void tlshd_client_x509_handshake(struct tlshd_handshake_parms *parms)
 	gnutls_transport_set_int(session, parms->sockfd);
 	gnutls_session_set_ptr(session, parms);
 
-	gnutls_server_name_set(session, GNUTLS_NAME_DNS,
-			       parms->peername, strlen(parms->peername));
-	gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
+	ret = gnutls_server_name_set(session, GNUTLS_NAME_DNS,
+				     parms->peername, strlen(parms->peername));
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		goto out_free_creds;
+	}
+	ret = gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		goto out_free_creds;
+	}
 	gnutls_certificate_set_verify_function(xcred,
 					       tlshd_client_x509_verify_function);
 
diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index 19bdd06f6001..3fddb34fc15e 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -184,7 +184,13 @@ static int tlshd_server_x509_verify_function(gnutls_session_t session)
 		gnutls_x509_crt_t cert;
 
 		gnutls_x509_crt_init(&cert);
-		gnutls_x509_crt_import(cert, &peercerts[i], GNUTLS_X509_FMT_DER);
+		ret = gnutls_x509_crt_import(cert, &peercerts[i],
+					     GNUTLS_X509_FMT_DER);
+		if (ret != GNUTLS_E_SUCCESS) {
+			tlshd_log_gnutls_error(ret);
+			gnutls_x509_crt_deinit(cert);
+			return GNUTLS_E_CERTIFICATE_ERROR;
+		}
 		parms->remote_peerid[i] =
 			tlshd_keyring_create_cert(cert, parms->peername);
 		gnutls_x509_crt_deinit(cert);
@@ -239,7 +245,11 @@ static void tlshd_server_x509_handshake(struct tlshd_handshake_parms *parms)
 	gnutls_transport_set_int(session, parms->sockfd);
 	gnutls_session_set_ptr(session, parms);
 
-	gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
+	ret = gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		goto out_free_creds;
+	}
 	gnutls_certificate_set_verify_function(xcred,
 					       tlshd_server_x509_verify_function);
 	gnutls_certificate_server_set_request(session, GNUTLS_CERT_REQUEST);



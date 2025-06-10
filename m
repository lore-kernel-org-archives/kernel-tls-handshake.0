Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32314A06
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Jun 2025 13:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561955; cv=none; b=EfFx5nvIJhvxYdZQ7x2FrKqyAfN/CshfwRwA8gtU5YbynpLmMVIc3OKlQFi/NbFUFFfxEi1W+mnynwmcHnWNTUIwVHv9Nj+uFjqvDXQNk062idUfAoWfWWWDmwU5jVgSMTfF+dITIdVPMpCZt9IwLym4ltUNF05ZF4tsXM3oP8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561955; c=relaxed/simple;
	bh=hrxd3PxGuoZETtFebJ5ETTIuzQThgrgupOg8lMr9pw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eq5nvlc5mXjyGTCI2IP8SOxASZg2sqUfFdzsxPOmHc/hM9hOs5LeDEQIoTzSben+PemgExQcb6C7zjwi/chF9BWXb9JJXCcnOOl95ASFDX3cAeSRjB7uqmsSOPvfilBuXw9QRF1gJnq4TFFi+bqOXka/tC5QgR6rkk6L4qI3pPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjkCOVcf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjkCOVcf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C691C4CEEF;
	Tue, 10 Jun 2025 13:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749561954;
	bh=hrxd3PxGuoZETtFebJ5ETTIuzQThgrgupOg8lMr9pw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mjkCOVcf5ovCHUw95y3nHjw6DZ7nny2x6H7yL2f6W3uJyXfyUCnJKdM80NnhC51sv
	 DdDk2Ptiv3MrAjwE0hry8rV314m2/CMANyBADPDiLiEg82bzIFXyS1ycJWM+94Gs0H
	 2pMqFZyKSQu70qex4WMffEsUadCHu66828QEP/hy7/A76EzxJ/FvrBnG/0n4sw0KTH
	 aJsrw9CK5pHtb67b57eab9+kppouPwvYy6zDgteiky1dtEkGerzcOYKSQqBqtH/fU1
	 vpremd03yY66Vsxq7o9A8z36De5HSrY+aIE5IYuPmw53YFVZFwEVrv6P72xl84b2Hv
	 wuSDVLSgWKOpQ==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH 2/5] tlshd: Remove unneeded variable "error"
Date: Tue, 10 Jun 2025 09:25:47 -0400
Message-ID: <20250610132550.39715-3-cel@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610132550.39715-1-cel@kernel.org>
References: <20250610132550.39715-1-cel@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuck Lever <chuck.lever@oracle.com>

Clean up: Commit c380357cf8f1 ("tlshd: Demote warnings about missing
options") removed some debug messages that used the local "error"
variable. "error" is passed to glib, but the returned value is no
longer checked or used.

Fixes: c380357cf8f1 ("tlshd: Demote warnings about missing options")
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/config.c | 44 ++++++++++++++------------------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index f4907ebb1a54..e050d3df6050 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -193,15 +193,13 @@ out:
  */
 bool tlshd_config_get_client_truststore(char **bundle)
 {
-	GError *error = NULL;
 	gchar *pathname;
 
 	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.client",
-					 "x509.truststore", &error);
-	if (!pathname) {
-		g_error_free(error);
+					 "x509.truststore", NULL);
+	if (!pathname)
 		return false;
-	} else if (access(pathname, F_OK)) {
+	if (access(pathname, F_OK)) {
 		tlshd_log_debug("tlshd cannot access \"%s\"", pathname);
 		g_free(pathname);
 		return false;
@@ -228,17 +226,14 @@ bool tlshd_config_get_client_truststore(char **bundle)
 bool tlshd_config_get_client_certs(gnutls_pcert_st *certs,
 				   unsigned int *certs_len)
 {
-	GError *error = NULL;
 	gnutls_datum_t data;
 	gchar *pathname;
 	int ret;
 
 	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.client",
-					"x509.certificate", &error);
-	if (!pathname) {
-		g_error_free(error);
+					"x509.certificate", NULL);
+	if (!pathname)
 		return false;
-	}
 
 	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
 				     TLSHD_CERT_MODE)) {
@@ -272,17 +267,14 @@ bool tlshd_config_get_client_certs(gnutls_pcert_st *certs,
  */
 bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey)
 {
-	GError *error = NULL;
 	gnutls_datum_t data;
 	gchar *pathname;
 	int ret;
 
 	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.client",
-					"x509.private_key", &error);
-	if (!pathname) {
-		g_error_free(error);
+					"x509.private_key", NULL);
+	if (!pathname)
 		return false;
-	}
 
 	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
 				     TLSHD_PRIVKEY_MODE)) {
@@ -323,15 +315,13 @@ bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey)
  */
 bool tlshd_config_get_server_truststore(char **bundle)
 {
-	GError *error = NULL;
 	gchar *pathname;
 
 	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
-					 "x509.truststore", &error);
-	if (!pathname) {
-		g_error_free(error);
+					 "x509.truststore", NULL);
+	if (!pathname)
 		return false;
-	} else if (access(pathname, F_OK)) {
+	if (access(pathname, F_OK)) {
 		tlshd_log_debug("tlshd cannot access \"%s\"", pathname);
 		g_free(pathname);
 		return false;
@@ -358,17 +348,14 @@ bool tlshd_config_get_server_truststore(char **bundle)
 bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
 				   unsigned int *certs_len)
 {
-	GError *error = NULL;
 	gnutls_datum_t data;
 	gchar *pathname;
 	int ret;
 
 	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
-					"x509.certificate", &error);
-	if (!pathname) {
-		g_error_free(error);
+					"x509.certificate", NULL);
+	if (!pathname)
 		return false;
-	}
 
 	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
 				     TLSHD_CERT_MODE)) {
@@ -402,17 +389,14 @@ bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
  */
 bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey)
 {
-	GError *error = NULL;
 	gnutls_datum_t data;
 	gchar *pathname;
 	int ret;
 
 	pathname = g_key_file_get_string(tlshd_configuration, "authenticate.server",
-					"x509.private_key", &error);
-	if (!pathname) {
-		g_error_free(error);
+					"x509.private_key", NULL);
+	if (!pathname)
 		return false;
-	}
 
 	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
 				     TLSHD_PRIVKEY_MODE)) {
-- 
2.49.0


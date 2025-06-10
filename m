Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EB8246BBD
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Jun 2025 13:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561954; cv=none; b=BusFKtLBFTPpkRjlvUcNIytDsMoO4qH/AbVVG1dgT3vEBtYEeIy+ELQsr4HwzfYYK9m3vMBlUBjXXtGRzdg9RBkzaXppjjt26E4XqGYJ4xlN25gD7rLNyY203KAutkdojT2fNLd+FiMn3vubWIQswWjQlcEnhK6SQfRAmUYPwnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561954; c=relaxed/simple;
	bh=d4xRNwXKZvyQOwa1wU7bYyHPQbUMHI8EwCXvUueQ5sU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/Fjikl22CFDxAbBy4Y18RBLeg4BSEHeNMGdYHVMGUAba/rEA06PDLwcjs6JISIbv0qVIyRfefc8wqdftn3irfSZBry7QfEauCZ4ULsbvYMSBRWNcGOIRr2byFDu/g4PQk+TL5+MUtf9FZs4qqOmF5n/5+aKVBUC4lbMdYIZFeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=me9yUQG/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="me9yUQG/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7194C4CEF1;
	Tue, 10 Jun 2025 13:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749561954;
	bh=d4xRNwXKZvyQOwa1wU7bYyHPQbUMHI8EwCXvUueQ5sU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=me9yUQG/UAoQH3nvqWCqLTiAT+Jen1F1+D2Cgu6yz+2WhuOjgKx9xCo2hZqXmWAX4
	 UrnETxZPAQ9+N+oUnt4v1IzajZiGlUh7M/JZt17V+haufTT41f1gKjfpt9MzyYNML6
	 rJoqPRZcSskbByjE94KiLEcuVZ/i59owsEQ7GrrOtNVzaQGLhcegP5e5ft8nOvWnVE
	 JaZlbeGJaZ7PoXgs8X4BW34zcopVHdyIm1V3aOVtTkm0q2iyeE1CzlkLsbjof8ixE1
	 jco3hISzr7PbQs09RbbOE8N4N8XJZMFF5IhwcmYWdSGBj0bAjNYEBk4UhG1dpKAaSM
	 bAzmzUGianE+Q==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH 1/5] tlshd: Fix a minor race
Date: Tue, 10 Jun 2025 09:25:46 -0400
Message-ID: <20250610132550.39715-2-cel@kernel.org>
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

Parfait complains about using a pathname to perform an access(2)
and then passing the same pathname to open(2). Between the access(2)
and the open(2) calls, the permissions can change. I think this is
harmless for tlshd, but all the same, let's clean this up.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/config.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index be5d472c466a..f4907ebb1a54 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -140,7 +140,11 @@ static bool tlshd_config_read_datum(const char *pathname, gnutls_datum_t *data,
 
 	fd = open(pathname, O_RDONLY);
 	if (fd == -1) {
-		tlshd_log_perror("open");
+		if (access(pathname, F_OK))
+			tlshd_log_debug("tlshd cannot access \"%s\"",
+					pathname);
+		else
+			tlshd_log_perror("open");
 		goto out;
 	}
 	if (fstat(fd, &statbuf)) {
@@ -198,7 +202,7 @@ bool tlshd_config_get_client_truststore(char **bundle)
 		g_error_free(error);
 		return false;
 	} else if (access(pathname, F_OK)) {
-		tlshd_log_debug("client x509.truststore pathname \"%s\" is not accessible", pathname);
+		tlshd_log_debug("tlshd cannot access \"%s\"", pathname);
 		g_free(pathname);
 		return false;
 	}
@@ -234,10 +238,6 @@ bool tlshd_config_get_client_certs(gnutls_pcert_st *certs,
 	if (!pathname) {
 		g_error_free(error);
 		return false;
-	} else if (access(pathname, F_OK)) {
-		tlshd_log_debug("client x509.certificate pathname \"%s\" is not accessible", pathname);
-		g_free(pathname);
-		return false;
 	}
 
 	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
@@ -282,10 +282,6 @@ bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey)
 	if (!pathname) {
 		g_error_free(error);
 		return false;
-	} else if (access(pathname, F_OK)) {
-		tlshd_log_debug("client x509.private_key pathname \"%s\" is not accessible", pathname);
-		g_free(pathname);
-		return false;
 	}
 
 	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
@@ -336,7 +332,7 @@ bool tlshd_config_get_server_truststore(char **bundle)
 		g_error_free(error);
 		return false;
 	} else if (access(pathname, F_OK)) {
-		tlshd_log_debug("server x509.truststore pathname \"%s\" is not accessible", pathname);
+		tlshd_log_debug("tlshd cannot access \"%s\"", pathname);
 		g_free(pathname);
 		return false;
 	}
@@ -372,10 +368,6 @@ bool tlshd_config_get_server_certs(gnutls_pcert_st *certs,
 	if (!pathname) {
 		g_error_free(error);
 		return false;
-	} else if (access(pathname, F_OK)) {
-		tlshd_log_debug("server x509.certificate pathname \"%s\" is not accessible", pathname);
-		g_free(pathname);
-		return false;
 	}
 
 	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
@@ -420,10 +412,6 @@ bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey)
 	if (!pathname) {
 		g_error_free(error);
 		return false;
-	} else if (access(pathname, F_OK)) {
-		tlshd_log_debug("server x509.privkey pathname \"%s\" is not accessible", pathname);
-		g_free(pathname);
-		return false;
 	}
 
 	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
-- 
2.49.0


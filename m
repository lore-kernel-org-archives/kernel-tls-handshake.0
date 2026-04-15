Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FBC1E9B3D
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 15 Apr 2026 17:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776273499; cv=none; b=cMZHN7NouAuR4VR8grEhlamSrU3k1olZLOUP5UhoKoSC5AJihvDZcCI8EQ78DraX3rM/zbgmePilULDJhMtcKlK/ixQheHDZsrbKItGp4gI1BTgDkBjwLIUFPOiSWrD7C6Nczo4AV5gBapTmEG0FsP3jVcUY1g519/LTCYvfR5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776273499; c=relaxed/simple;
	bh=TRIQbqDDFEUHvGM4a4OepWRgRWTQZ7Sg+sQS8v2HSUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qa7VaCybniudA/+Mzy1zWbNQxYv/NnHGzatH3yyDxKG1JZRAsehinJ+qEnv2jZp3Boq0B6sAOJJE7PsrhOMZfRGqC97Tx50LIp4sm7dP3/7Y1hBs3PoGPXTlFuHBfJYAmrFSlOYU/ij6egVaa4yNTFZxdoTv3uYpwmtRkLlVwH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCLjyvIz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCLjyvIz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0883BC19424;
	Wed, 15 Apr 2026 17:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776273499;
	bh=TRIQbqDDFEUHvGM4a4OepWRgRWTQZ7Sg+sQS8v2HSUU=;
	h=From:To:Cc:Subject:Date:From;
	b=CCLjyvIzbLZ9LxOY3Wyy4gSj3gjchaj2/OYGARc4dblkPPktRJuk4vL4+VfWWM1pH
	 npzwBuaM1c0wQ0txOJZ/DocxThb8xL56mZKMAN8dbZpMB63Nz0d4n2T1xATKR13pxl
	 g7X/w9fGM+t3np5cqD99tu+9nQcBFr28mrAQ1hb4pdp8NlsRV/l/WwSjAwTa+FqLUt
	 glM4DVMPCSY2pQwlzZ6s5xr+dJX4NSa1jJR8rpeaYq9t6/TwU42ROUasG+wsx+vOtv
	 Zy7yTAlzCgKnpsnFbwzfa2WlDOCLIRyGfWY6yCj1KJntGl2EJ7MGw6K2JHm9UNC8uF
	 IDCwqP1CKroHA==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH] tlshd: Add runtime check for ML-DSA support in gnutls
Date: Wed, 15 Apr 2026 13:18:17 -0400
Message-ID: <20260415171817.1408-1-cel@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuck Lever <chuck.lever@oracle.com>

Fedora 42 ships gnutls 3.8.11, which defines GNUTLS_PK_MLDSA*
and GNUTLS_SIGN_MLDSA* enum constants in its headers and can
parse ML-DSA certificates and import ML-DSA private keys.
However, it does not register SHAKE-256 as an available digest
algorithm: gnutls_hash_get_len(GNUTLS_DIG_SHAKE_256) returns 0
and SHAKE-256 is absent from gnutls_digest_list().  Because the
ML-DSA sign algorithm table entries specify GNUTLS_DIG_SHAKE_256
as their hash, all ML-DSA signing operations fail at the hash
step during TLS handshakes.

RHEL 10's gnutls 3.8.10 carries downstream patches that wire
up SHAKE-256 in the digest framework, so ML-DSA works there.
The existing compile-time configure check (AC_COMPILE_IFELSE on
the GNUTLS_SIGN_MLDSA65 constant) cannot distinguish these two
cases: both define the constant, but only one has a functional
implementation.

The symptom on Fedora 42 is that tlshd's server-side
retrieve_key callback selects the ML-DSA certificate (because
the client's gnutls also advertises ML-DSA signature algorithms
in its ClientHello), gnutls fails at cert_select_sign_algorithm
for every cipher suite, and the handshake fails with "No
supported cipher suites have been found. (-87)".  The RSA
fallback never runs because gnutls retries the callback for
each cipher suite and gets the same unusable ML-DSA certificate
each time.

Probe gnutls_hash_get_len(GNUTLS_DIG_SHAKE_256) at certificate
load time to detect whether the hash prerequisite for ML-DSA is
present.  When it returns zero, tlshd_cert_check_pk_alg()
returns false, disabling the post-quantum certificate so the
RSA certificate is used instead.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/config.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index ce48a4d17fc2..1ed94a7776ad 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -41,6 +41,7 @@
 
 #include <gnutls/gnutls.h>
 #include <gnutls/abstract.h>
+#include <gnutls/crypto.h>
 
 #include <netlink/netlink.h>
 
@@ -384,6 +385,7 @@ static bool tlshd_cert_check_pk_alg(gnutls_datum_t *data,
 {
 	gnutls_x509_crt_t cert;
 	gnutls_pk_algorithm_t pk_alg;
+	bool result = false;
 	int ret;
 
 	ret = gnutls_x509_crt_init(&cert);
@@ -391,10 +393,8 @@ static bool tlshd_cert_check_pk_alg(gnutls_datum_t *data,
 		return false;
 
 	ret = gnutls_x509_crt_import(cert, data, GNUTLS_X509_FMT_PEM);
-	if (ret < 0) {
-		gnutls_x509_crt_deinit(cert);
-		return false;
-	}
+	if (ret < 0)
+		goto out;
 
 	pk_alg = gnutls_x509_crt_get_pk_algorithm(cert, NULL);
 	tlshd_log_debug("%s: certificate pk algorithm %s", __func__,
@@ -403,15 +403,23 @@ static bool tlshd_cert_check_pk_alg(gnutls_datum_t *data,
 	case GNUTLS_PK_MLDSA44:
 	case GNUTLS_PK_MLDSA65:
 	case GNUTLS_PK_MLDSA87:
+		if (!gnutls_hash_get_len(GNUTLS_DIG_SHAKE_256)) {
+			tlshd_log_notice("%s: gnutls lacks SHAKE-256 support, "
+					 "disabling %s",
+					 __func__,
+					 gnutls_pk_algorithm_get_name(pk_alg));
+			goto out;
+		}
 		*pkalg = pk_alg;
+		result = true;
 		break;
 	default:
-		gnutls_x509_crt_deinit(cert);
-		return false;
+		break;
 	}
 
+out:
 	gnutls_x509_crt_deinit(cert);
-	return true;
+	return result;
 }
 #else
 static bool tlshd_cert_check_pk_alg(__attribute__ ((unused)) gnutls_datum_t *data,
-- 
2.53.0


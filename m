Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C20D3E4C74
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 15 Apr 2026 18:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776276841; cv=none; b=gENnWCUy8XSf3pDeS1HgCdlP0nzJLRQFmhVGi2YdVjlgAyn02w2sHXAGyDjzNjraEVXV1Zm43AHBkK5tgIgXtcxJLKPl9LLMg9SfnV8IJci9cV6vvDvitmZiJyJKg71puw+G8wR/sfuLeZPG/awb8kSlVKiUBb3hvE+aM/eFJz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776276841; c=relaxed/simple;
	bh=e2T36Qh6p1j+PLp+Nz/xvbgWGUjeQfsy9J7qAKWLlnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xr08dKrqY1dvvSdGFZWPhQJ/MlQsjASB90n9L+QifhFD2DyvWGwJMQU1ZfyRSXZWwAIQjc7/BmKIPSqaFSCpGAjbPsX31JpeRdoST19QcsbYTOy65T41R9LVCetyrOsNNp9wInYoDKBuhYwdblji/JFmNMq7kbbFxF+PaHW98K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKwsF5Ph; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKwsF5Ph"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECCAC2BCB5;
	Wed, 15 Apr 2026 18:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776276841;
	bh=e2T36Qh6p1j+PLp+Nz/xvbgWGUjeQfsy9J7qAKWLlnY=;
	h=From:To:Cc:Subject:Date:From;
	b=AKwsF5Phw+cOTix5sflNSlBns6hS4SiM/+M+nFuHkDmIeJVDssYHf8uMSKN+8JXpW
	 2gQnfh3ucDVpVvh25jZp7FWt+5tHVPHa0BPlMVv/7LkyTBWtZz74xXNzuycWh2uHIX
	 SgX+Q7QDt44JR1dy7eWdLSa0UdawBLa07gRN2BxWNUHzPyIuYaxkp1SzNlg5SedQ0d
	 suKtuGVr496bLylLeBitGw9UsRFqWGMGaJ/BVkuKOYJDGmkn45FUtiiR4AEfxlvEsA
	 bQGf33iL+nrxjOGc85vpYMzaB+AaEepE/7jAp9IGiorC4EBTIyUfHUklwWEwm7S71n
	 SwdjBJn3Kt5QA==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH v2] tlshd: Add runtime check for ML-DSA support in gnutls
Date: Wed, 15 Apr 2026 14:13:59 -0400
Message-ID: <20260415181359.5115-1-cel@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuck Lever <chuck.lever@oracle.com>

Fedora's TEST-PQ crypto-policy submodule adds ML-DSA to the
high-level sign list but does not add the corresponding entries
to the gnutls backend configuration.  Because the gnutls
backend operates in allowlist mode, ML-DSA signature algorithms
are absent from the session's priority list, and
cert_select_sign_algorithm rejects every cipher suite during
handshakes that present an ML-DSA certificate.

The symptom is that tlshd's server-side retrieve_key callback
selects the ML-DSA certificate (because the client advertises
ML-DSA in its ClientHello), gnutls then fails
cert_select_sign_algorithm for every cipher suite, and the
handshake fails with "No supported cipher suites have been
found. (-87)".  The RSA fallback never runs because gnutls
retries the callback for each cipher suite and gets the same
unusable ML-DSA certificate each time.

After the x.509 priority cache is built at startup, check
whether the ML-DSA sign algorithm corresponding to the
certificate's PK algorithm appears in
gnutls_priority_sign_list().  When absent,
tlshd_cert_check_pk_alg() returns false with a notice
directing the administrator to the crypto-policies
configuration, and the RSA certificate is used instead.

Administrators can resolve the issue by ensuring ML-DSA
signature algorithms and SHAKE-256 are present in
/etc/crypto-policies/back-ends/gnutls.config.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/config.c | 48 +++++++++++++++++++++++++++++++---------------
 src/tlshd/ktls.c   | 18 +++++++++++++++++
 src/tlshd/tlshd.h  |  1 +
 3 files changed, 52 insertions(+), 15 deletions(-)

Changes since v1:
- ML-DSA sig algorithms aren't listed in the usual places

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index ce48a4d17fc2..efb8bb227c9e 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -379,11 +379,27 @@ bool tlshd_config_get_crl(int peer_type, char **result)
 }
 
 #ifdef HAVE_GNUTLS_MLDSA
+static gnutls_sign_algorithm_t tlshd_pk_to_sign(gnutls_pk_algorithm_t pk)
+{
+	switch (pk) {
+	case GNUTLS_PK_MLDSA44:
+		return GNUTLS_SIGN_MLDSA44;
+	case GNUTLS_PK_MLDSA65:
+		return GNUTLS_SIGN_MLDSA65;
+	case GNUTLS_PK_MLDSA87:
+		return GNUTLS_SIGN_MLDSA87;
+	default:
+		return GNUTLS_SIGN_UNKNOWN;
+	}
+}
+
 static bool tlshd_cert_check_pk_alg(gnutls_datum_t *data,
 				    gnutls_pk_algorithm_t *pkalg)
 {
+	gnutls_sign_algorithm_t sign_alg;
 	gnutls_x509_crt_t cert;
 	gnutls_pk_algorithm_t pk_alg;
+	bool result = false;
 	int ret;
 
 	ret = gnutls_x509_crt_init(&cert);
@@ -391,27 +407,29 @@ static bool tlshd_cert_check_pk_alg(gnutls_datum_t *data,
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
 			gnutls_pk_algorithm_get_name(pk_alg));
-	switch (pk_alg) {
-	case GNUTLS_PK_MLDSA44:
-	case GNUTLS_PK_MLDSA65:
-	case GNUTLS_PK_MLDSA87:
-		*pkalg = pk_alg;
-		break;
-	default:
-		gnutls_x509_crt_deinit(cert);
-		return false;
-	}
 
+	sign_alg = tlshd_pk_to_sign(pk_alg);
+	if (sign_alg == GNUTLS_SIGN_UNKNOWN)
+		goto out;
+	if (!tlshd_gnutls_priority_have_sign(sign_alg)) {
+		tlshd_log_notice("%s: %s is not in the GnuTLS priority list; "
+				 "check crypto-policies configuration",
+				 __func__,
+				 gnutls_sign_get_name(sign_alg));
+		goto out;
+	}
+	*pkalg = pk_alg;
+	result = true;
+
+out:
 	gnutls_x509_crt_deinit(cert);
-	return true;
+	return result;
 }
 #else
 static bool tlshd_cert_check_pk_alg(__attribute__ ((unused)) gnutls_datum_t *data,
diff --git a/src/tlshd/ktls.c b/src/tlshd/ktls.c
index e3e0ec94e6e7..311847df2377 100644
--- a/src/tlshd/ktls.c
+++ b/src/tlshd/ktls.c
@@ -673,6 +673,24 @@ int tlshd_gnutls_priority_set(gnutls_session_t session,
 	return gnutls_priority_set(session, priority);
 }
 
+/**
+ * @brief Check whether a sign algorithm is in the x.509 priority list
+ * @param[in]     sign  GnuTLS sign algorithm constant
+ *
+ * @retval true if the algorithm is present; false otherwise
+ */
+bool tlshd_gnutls_priority_have_sign(unsigned int sign)
+{
+	const unsigned int *list;
+	int i, n;
+
+	n = gnutls_priority_sign_list(tlshd_gnutls_priority_x509, &list);
+	for (i = 0; i < n; i++)
+		if (list[i] == sign)
+			return true;
+	return false;
+}
+
 /**
  * @brief Free GnuTLS priority caches
  */
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index d00cfdfb9e59..02ccab299e1b 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -103,6 +103,7 @@ extern int tlshd_gnutls_priority_init(void);
 extern int tlshd_gnutls_priority_set(gnutls_session_t session,
 				     const struct tlshd_handshake_parms *parms,
 				     unsigned int psk_len);
+extern bool tlshd_gnutls_priority_have_sign(unsigned int sign);
 extern void tlshd_gnutls_priority_deinit(void);
 
 /* log.c */
-- 
2.53.0


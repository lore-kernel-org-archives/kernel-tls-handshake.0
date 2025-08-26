Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BB32417D9
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222727; cv=none; b=QljomVikR5bFzJrvvsvsAxI/uHFjp0jKYTizkbWrN3W+5bt8/jXE3HgV+QsyzAytRX1gjwrNRb2ZsVW6TbhpWTYbCtDYJrV8pBtqlYgchxLdIcmfCRySze2bhYnuwfROzVIcYk/IOvVh1y6+EzQzi9B7NgLzl+uyEq4QRDoP8zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222727; c=relaxed/simple;
	bh=xCohJeSUmuEGnkNfCRj69K5QsxsMfSBaoVionD8qIAA=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ikwF4uyGwOm8oFf47rlzGbUFQjQg9eYHbkYiA+fcHYZqxbzn1fW83sP84o3Ox6W3Xb8XoilQkAKt5a+n/hjuiPtG2D7Hdobo56MopTppN4NIk3RUjigzWsM0y5GF1hP0Mv7Osw258pMVZTKbrtO2pr1av835dwUu+jv/rvDA1wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4Wnurg9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4Wnurg9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD0FC4CEF1
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756222726;
	bh=xCohJeSUmuEGnkNfCRj69K5QsxsMfSBaoVionD8qIAA=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=a4Wnurg96y1CGtwIzc22tBeS24dvoDoxMIaAOCLodmGvSQiDz2+eBLnD1DMw9tTTl
	 L8V8SirlkLtHREvdyVb1+hUpVKJ9PfdJjyi6dKfE16Zv/uRz7WN7qMVIIuh5Gl1Csb
	 NEKHpGZ/yQoFFSd18KffIYAzu5jby+pSDp0dZKtlU4vujxP+DjO8+xn+EIgPEdafN/
	 PsMf06VqgHhGsgZIiL+DWR5X979xPH94fMD9IdIOIvusBY1OWyCCzC5N28+prwneaP
	 yvy+0v4C34h+PEmQoeJG8DQvtTR2wFakq9PnQeGdCyP/WxQngSvYwk7oh6HbbjrZzh
	 NAiCZEP1qIrXw==
Subject: [PATCH v2 09/11] tlshd: Match ingress certificates with defined TLS
 session tags
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Tue, 26 Aug 2025 11:38:45 -0400
Message-ID: 
 <175622272582.6197.11387853761894950682.stgit@91.116.238.104.host.secureserver.net>
In-Reply-To: 
 <175622197574.6197.17170424685161235821.stgit@91.116.238.104.host.secureserver.net>
References: 
 <175622197574.6197.17170424685161235821.stgit@91.116.238.104.host.secureserver.net>
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

TLS session tags are defined in /etc/tlshd/tags.d. Each tag one or
more filter expressions that match against fields in the x.509
certificate presented by a client peer.

When a handshake is successful, tlshd parses the peer's certificate
and applies the filters to the fields in the certificate. When the
tag's set of filters all match, the tag's name is added to the tag
list for the session.

A subsequent patch will pass the list to the kernel upon handshake
completion.

Suggested-by: Benjamin Coddington <bcodding@redhat.com>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 configure.ac       |    4 
 src/tlshd/server.c |    2 
 src/tlshd/tags.c   |  530 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 src/tlshd/tlshd.h  |    1 
 4 files changed, 537 insertions(+)

diff --git a/configure.ac b/configure.ac
index 4db7c677eb91..5d72e82cdaed 100644
--- a/configure.ac
+++ b/configure.ac
@@ -82,6 +82,10 @@ AC_CHECK_LIB([gnutls], [gnutls_get_system_config_file],
 AC_CHECK_LIB([gnutls], [gnutls_psk_allocate_client_credentials2],
              [AC_DEFINE([HAVE_GNUTLS_PSK_ALLOCATE_CREDENTIALS2], [1],
                         [Define to 1 if you have the gnutls_psk_allocate_client_credentials2 function.])])
+AC_CHECK_LIB([glib-2.0], [g_pattern_spec_match],
+             [AC_DEFINE([HAVE_GLIB_G_PATTERN_SPEC_MATCH], [1],
+                        [Define to 1 if you have the g_pattern_spec_match function.])])
+
 AC_SUBST([AM_CPPFLAGS])
 
 AC_CONFIG_FILES([Makefile src/Makefile src/tlshd/Makefile src/tlshd/etc/Makefile systemd/Makefile])
diff --git a/src/tlshd/server.c b/src/tlshd/server.c
index 6b4535d5f1a1..211d8fd5eda4 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -311,6 +311,8 @@ static void tlshd_tls13_server_x509_handshake(struct tlshd_handshake_parms *parm
 		}
 	}
 
+	tlshd_tags_match_session(session);
+
 	gnutls_deinit(session);
 
 out_free_certs:
diff --git a/src/tlshd/tags.c b/src/tlshd/tags.c
index 672ae3350e3d..07aba2c74220 100644
--- a/src/tlshd/tags.c
+++ b/src/tlshd/tags.c
@@ -34,6 +34,8 @@
 //#include <string.h>
 //#include <libgen.h>
 #include <keyutils.h>
+//#define _XOPEN_SOURCE
+#include <time.h>
 
 #include <gnutls/gnutls.h>
 //#include <gnutls/x509.h>
@@ -826,6 +828,8 @@ tlshd_tags_filter_type_validate_time(struct tlshd_tags_filter *filter)
 	struct tm tm;
 	char *ret;
 
+	/* strftime(s, max, "%a %b %d %H:%M:%S UTC %Y", &t) == 0) */
+
 	memset(&tm, 0, sizeof(tm));
 	ret = strptime(filter->fi_pattern, "%Y-%m-%d %H:%M:%S", &tm);
 	if (!ret) {
@@ -840,6 +844,465 @@ tlshd_tags_filter_type_validate_time(struct tlshd_tags_filter *filter)
 	return true;
 }
 
+static gchar *
+tlshd_tags_raw_to_hex(const uint8_t *input, size_t input_size)
+{
+	size_t i, output_size = (input_size * 2) + 1;
+	gchar *c, *output;
+
+	output = g_malloc(output_size);
+	if (!output)
+		return NULL;
+
+	c = output;
+	for (i = 0; i < input_size; i++) {
+		snprintf(c, output_size, "%.2x", input[i]);
+		c += 2;
+		output_size -= 2;
+		if (output_size < 2)
+			break;
+	}
+	*c = '\0';
+
+	return output;
+}
+
+static bool
+tlshd_tags_filter_type_match_x509_cert_signaturealgorithm(struct tlshd_tags_filter *filter,
+							  gnutls_session_t session)
+{
+	const gnutls_datum_t *cert_list;
+	unsigned int num_certs = 0;
+	gnutls_x509_crt_t peercert;
+	bool res = false;
+	gchar *name;
+	int ret;
+
+	if (gnutls_certificate_type_get(session) != GNUTLS_CRT_X509)
+		goto out;
+	cert_list = gnutls_certificate_get_peers(session, &num_certs);
+	if (num_certs == 0)
+		goto out;
+
+	gnutls_x509_crt_init(&peercert);
+	gnutls_x509_crt_import(peercert, &cert_list[0], GNUTLS_X509_FMT_DER);
+
+	name = NULL;
+	ret = gnutls_x509_crt_get_signature_algorithm(peercert);
+	if (ret != GNUTLS_SIGN_UNKNOWN)
+		name = g_strdup(gnutls_sign_get_name(ret));
+	if (!name) {
+		char oid[128];
+		size_t oid_size = sizeof(oid);
+
+		ret = gnutls_x509_crt_get_signature_oid(peercert, oid, &oid_size);
+		if (ret != GNUTLS_E_SUCCESS) {
+			tlshd_log_error("Unknown signature algorithm");
+			goto deinit;
+		}
+		name = g_strdup(oid);
+	}
+
+#ifdef HAVE_GLIB_G_PATTERN_SPEC_MATCH
+	res = g_pattern_spec_match(filter->fi_pattern_spec,
+				   strlen(name), name, NULL);
+#else
+	res = g_pattern_match(filter->fi_pattern_spec,
+			      strlen(name), name, NULL);
+#endif
+
+	tlshd_log_debug("Filter '%s' %s algorithm '%s'",
+			filter->fi_name,
+			res ? "matched" : "did not match",
+			name);
+	g_free(name);
+deinit:
+	gnutls_x509_crt_deinit(peercert);
+out:
+	return res;
+}
+
+static bool
+tlshd_tags_filter_type_match_x509_tbs_version(struct tlshd_tags_filter *filter,
+					      gnutls_session_t session)
+{
+	const gnutls_datum_t *cert_list;
+	unsigned int num_certs = 0;
+	gnutls_x509_crt_t peercert;
+	bool res = false;
+	char version[16];
+	int ret;
+
+	if (gnutls_certificate_type_get(session) != GNUTLS_CRT_X509)
+		goto out;
+	cert_list = gnutls_certificate_get_peers(session, &num_certs);
+	if (num_certs == 0)
+		goto out;
+
+	gnutls_x509_crt_init(&peercert);
+	gnutls_x509_crt_import(peercert, &cert_list[0], GNUTLS_X509_FMT_DER);
+
+	ret = gnutls_x509_crt_get_version(peercert);
+	if (ret < 0) {
+		tlshd_log_gnutls_error(ret);
+		goto deinit;
+	}
+
+	snprintf(version, sizeof(version), "%u", ret);
+#ifdef HAVE_GLIB_G_PATTERN_SPEC_MATCH
+	res = g_pattern_spec_match(filter->fi_pattern_spec,
+				   strlen(version), version, NULL);
+#else
+	res = g_pattern_match(filter->fi_pattern_spec,
+			      strlen(version), version, NULL);
+#endif
+
+	tlshd_log_debug("Filter '%s' %s version '%s'",
+			filter->fi_name,
+			res ? "matched" : "did not match",
+			version);
+deinit:
+	gnutls_x509_crt_deinit(peercert);
+out:
+	return res;
+}
+
+static bool
+tlshd_tags_filter_type_match_x509_tbs_serial(struct tlshd_tags_filter *filter,
+					     gnutls_session_t session)
+{
+	const gnutls_datum_t *cert_list;
+	unsigned int num_certs = 0;
+	gnutls_x509_crt_t peercert;
+	uint8_t serial[128];
+	size_t serial_size;
+	bool res = false;
+	gchar *hex;
+	int ret;
+
+	if (gnutls_certificate_type_get(session) != GNUTLS_CRT_X509)
+		goto out;
+	cert_list = gnutls_certificate_get_peers(session, &num_certs);
+	if (num_certs == 0)
+		goto out;
+
+	gnutls_x509_crt_init(&peercert);
+	gnutls_x509_crt_import(peercert, &cert_list[0], GNUTLS_X509_FMT_DER);
+
+	serial_size = sizeof(serial);
+	ret = gnutls_x509_crt_get_serial(peercert, serial, &serial_size);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		goto deinit;
+	}
+
+	hex = tlshd_tags_raw_to_hex(serial, serial_size);
+	if (!hex) {
+		tlshd_log_error("No memory\n");
+		goto deinit;
+	}
+#ifdef HAVE_GLIB_G_PATTERN_SPEC_MATCH
+	res = g_pattern_spec_match(filter->fi_pattern_spec,
+				   strlen(hex), hex, NULL);
+#else
+	res = g_pattern_match(filter->fi_pattern_spec,
+			      strlen(hex), hex, NULL);
+#endif
+
+	tlshd_log_debug("Filter '%s' %s serial '%s'",
+			filter->fi_name,
+			res ? "matched" : "did not match",
+			hex);
+	g_free(hex);
+deinit:
+	gnutls_x509_crt_deinit(peercert);
+out:
+	return res;
+}
+
+static bool
+tlshd_tags_filter_type_match_x509_tbs_issuer(struct tlshd_tags_filter *filter,
+					      gnutls_session_t session)
+{
+	const gnutls_datum_t *cert_list;
+	unsigned int num_certs = 0;
+	gnutls_x509_crt_t peercert;
+	gnutls_datum_t dn;
+	bool res = false;
+	int ret;
+
+	if (gnutls_certificate_type_get(session) != GNUTLS_CRT_X509)
+		goto out;
+	cert_list = gnutls_certificate_get_peers(session, &num_certs);
+	if (num_certs == 0)
+		goto out;
+
+	gnutls_x509_crt_init(&peercert);
+	gnutls_x509_crt_import(peercert, &cert_list[0], GNUTLS_X509_FMT_DER);
+
+	ret = gnutls_x509_crt_get_issuer_dn3(peercert, &dn, 0);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		goto deinit;
+	}
+
+#ifdef HAVE_GLIB_G_PATTERN_SPEC_MATCH
+	if (!g_pattern_spec_match(filter->fi_pattern_spec, dn.size,
+			     (const gchar *)dn.data, NULL))
+#else
+	if (!g_pattern_match(filter->fi_pattern_spec, dn.size,
+			     (const gchar *)dn.data, NULL))
+#endif
+		goto free;
+	res = true;
+
+free:
+	tlshd_log_debug("Filter '%s' %s issuer '%s'",
+			filter->fi_name,
+			res ? "matched" : "did not match",
+			dn.data);
+	gnutls_free(dn.data);
+deinit:
+	gnutls_x509_crt_deinit(peercert);
+out:
+	return res;
+}
+
+static bool
+tlshd_tags_filter_type_match_x509_tbs_validity_notbefore(struct tlshd_tags_filter *filter,
+							 gnutls_session_t session)
+{
+	const gnutls_datum_t *cert_list;
+	unsigned int num_certs = 0;
+	gnutls_x509_crt_t peercert;
+	time_t activation_time;
+	bool res = false;
+
+	if (gnutls_certificate_type_get(session) != GNUTLS_CRT_X509)
+		goto out;
+	cert_list = gnutls_certificate_get_peers(session, &num_certs);
+	if (num_certs == 0)
+		goto out;
+
+	gnutls_x509_crt_init(&peercert);
+	gnutls_x509_crt_import(peercert, &cert_list[0], GNUTLS_X509_FMT_DER);
+
+	activation_time = gnutls_x509_crt_get_activation_time(peercert);
+	if (activation_time == (time_t)-1) {
+		tlshd_log_error("Failed to retrieve activation time.");
+		goto deinit;
+	}
+
+	res = (filter->fi_time >= activation_time);
+
+	tlshd_log_debug("Filter '%s' %s validity.notBefore '%s'",
+			filter->fi_name,
+			res ? "matched" : "did not match",
+			filter->fi_pattern);
+deinit:
+	gnutls_x509_crt_deinit(peercert);
+out:
+	return res;
+}
+
+static bool
+tlshd_tags_filter_type_match_x509_tbs_validity_notafter(struct tlshd_tags_filter *filter,
+							gnutls_session_t session)
+{
+	const gnutls_datum_t *cert_list;
+	unsigned int num_certs = 0;
+	gnutls_x509_crt_t peercert;
+	time_t expiration_time;
+	bool res = false;
+
+	if (gnutls_certificate_type_get(session) != GNUTLS_CRT_X509)
+		goto out;
+	cert_list = gnutls_certificate_get_peers(session, &num_certs);
+	if (num_certs == 0)
+		goto out;
+
+	gnutls_x509_crt_init(&peercert);
+	gnutls_x509_crt_import(peercert, &cert_list[0], GNUTLS_X509_FMT_DER);
+
+	expiration_time = gnutls_x509_crt_get_expiration_time(peercert);
+	if (expiration_time == (time_t)-1) {
+		tlshd_log_error("Failed to retrieve expiration time.");
+		goto deinit;
+	}
+
+	res = (filter->fi_time <= expiration_time);
+
+	tlshd_log_debug("Filter '%s' %s validity.notBefore '%s'",
+			filter->fi_name,
+			res ? "matched" : "did not match",
+			filter->fi_pattern);
+deinit:
+	gnutls_x509_crt_deinit(peercert);
+out:
+	return res;
+
+}
+
+static bool
+tlshd_tags_filter_type_match_x509_tbs_subject(struct tlshd_tags_filter *filter,
+					      gnutls_session_t session)
+{
+	const gnutls_datum_t *cert_list;
+	unsigned int num_certs = 0;
+	gnutls_x509_crt_t peercert;
+	gnutls_datum_t dn;
+	bool res = false;
+	int ret;
+
+	if (gnutls_certificate_type_get(session) != GNUTLS_CRT_X509)
+		goto out;
+	cert_list = gnutls_certificate_get_peers(session, &num_certs);
+	if (num_certs == 0)
+		goto out;
+
+	gnutls_x509_crt_init(&peercert);
+	gnutls_x509_crt_import(peercert, &cert_list[0], GNUTLS_X509_FMT_DER);
+
+	ret = gnutls_x509_crt_get_dn3(peercert, &dn, 0);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		goto deinit;
+	}
+
+#ifdef HAVE_GLIB_G_PATTERN_SPEC_MATCH
+	ret = g_pattern_spec_match(filter->fi_pattern_spec, dn.size,
+				   (const gchar *)dn.data, NULL);
+#else
+	ret = g_pattern_match(filter->fi_pattern_spec, dn.size,
+			      (const gchar *)dn.data, NULL);
+#endif
+
+	tlshd_log_debug("Filter '%s' %s subject '%s'",
+			filter->fi_name,
+			res ? "matched" : "did not match",
+			dn.data);
+	gnutls_free(dn.data);
+deinit:
+	gnutls_x509_crt_deinit(peercert);
+out:
+	return res;
+}
+
+static bool
+tlshd_tags_filter_type_match_x509_extension_keyusage(struct tlshd_tags_filter *filter,
+						      gnutls_session_t session)
+{
+	unsigned int key_usage, critical;
+	const gnutls_datum_t *cert_list;
+	unsigned int num_certs = 0;
+	gnutls_x509_crt_t peercert;
+	bool res = false;
+	int ret;
+
+	if (gnutls_certificate_type_get(session) != GNUTLS_CRT_X509)
+		goto out;
+	cert_list = gnutls_certificate_get_peers(session, &num_certs);
+	if (num_certs == 0)
+		goto out;
+
+	gnutls_x509_crt_init(&peercert);
+	gnutls_x509_crt_import(peercert, &cert_list[0], GNUTLS_X509_FMT_DER);
+
+	ret = gnutls_x509_crt_get_key_usage (peercert, &key_usage, &critical);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		goto deinit;
+	}
+
+	res = (filter->fi_purpose_mask & key_usage) == filter->fi_purpose_mask;
+
+	tlshd_log_debug("Filter '%s' %s key usage",
+			filter->fi_name,
+			res ? "matched" : "did not match");
+
+deinit:
+	gnutls_x509_crt_deinit(peercert);
+out:
+	return res;
+}
+
+static bool
+tlshd_tags_filter_type_match_x509_derived_fingerprint(struct tlshd_tags_filter *filter,
+						      gnutls_session_t session)
+{
+	bool sha1_res, sha256_res, res = false;
+	const gnutls_datum_t *cert_list;
+	uint8_t fingerprint[64];
+	size_t size = sizeof(fingerprint);
+	unsigned int num_certs = 0;
+	gnutls_x509_crt_t peercert;
+	gchar *hex;
+	int ret;
+
+	if (gnutls_certificate_type_get(session) != GNUTLS_CRT_X509)
+		goto out;
+	cert_list = gnutls_certificate_get_peers(session, &num_certs);
+	if (num_certs == 0)
+		goto out;
+
+	gnutls_x509_crt_init(&peercert);
+	gnutls_x509_crt_import(peercert, &cert_list[0], GNUTLS_X509_FMT_DER);
+
+	ret = gnutls_x509_crt_get_fingerprint(peercert, GNUTLS_DIG_SHA1,
+					      fingerprint, &size);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		goto deinit;
+	}
+
+	hex = tlshd_tags_raw_to_hex(fingerprint, size);
+	if (!hex) {
+		tlshd_log_error("No memory\n");
+		goto deinit;
+	}
+#ifdef HAVE_GLIB_G_PATTERN_SPEC_MATCH
+	sha1_res = g_pattern_spec_match(filter->fi_pattern_spec,
+					strlen(hex), hex, NULL);
+#else
+	sha1_res = g_pattern_match(filter->fi_pattern_spec,
+				   strlen(hex), hex, NULL);
+#endif
+	g_free(hex);
+
+	size = sizeof(fingerprint);
+	ret = gnutls_x509_crt_get_fingerprint(peercert, GNUTLS_DIG_SHA256,
+					      fingerprint, &size);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		goto deinit;
+	}
+
+	hex = tlshd_tags_raw_to_hex(fingerprint, size);
+	if (!hex) {
+		tlshd_log_error("No memory\n");
+		goto deinit;
+	}
+#ifdef HAVE_GLIB_G_PATTERN_SPEC_MATCH
+	sha256_res = g_pattern_spec_match(filter->fi_pattern_spec,
+					  strlen(hex), hex, NULL);
+#else
+	sha256_res = g_pattern_match(filter->fi_pattern_spec,
+				     strlen(hex), hex, NULL);
+#endif
+	g_free(hex);
+
+	res = sha1_res | sha256_res;
+
+	tlshd_log_debug("Filter '%s' %s fingerprint '%s'",
+			filter->fi_name,
+			res ? "matched" : "did not match",
+			filter->fi_pattern);
+deinit:
+	gnutls_x509_crt_deinit(peercert);
+out:
+	return res;
+}
+
 static const struct tlshd_tags_filter_type tlshd_tags_static_filter_types[] = {
 
 	/* Certificate fields, RFC 5280, Section 4.1.1 */
@@ -847,6 +1310,8 @@ static const struct tlshd_tags_filter_type tlshd_tags_static_filter_types[] = {
 	{
 		/* RFC 5280, Section 4.1.1.2 */
 		.ft_name		= "x509.cert.signatureAlgorithm",
+		.ft_validate		= tlshd_tags_filter_type_validate_pattern,
+		.ft_match		= tlshd_tags_filter_type_match_x509_cert_signaturealgorithm,
 	},
 
 	/* To-Be-Signed fields, RFC 5280, Section 4.1.2 */
@@ -854,35 +1319,43 @@ static const struct tlshd_tags_filter_type tlshd_tags_static_filter_types[] = {
 	{
 		/* RFC 5280, Section 4.1.2.1 */
 		.ft_name		= "x509.tbs.version",
+		.ft_validate		= tlshd_tags_filter_type_validate_pattern,
+		.ft_match		= tlshd_tags_filter_type_match_x509_tbs_version,
 	},
 	{
 		/* RFC 5280, Section 4.1.2.2 */
 		.ft_name		= "x509.tbs.serialNumber",
 		.ft_validate		= tlshd_tags_filter_type_validate_pattern,
+		.ft_match		= tlshd_tags_filter_type_match_x509_tbs_serial,
 	},
 	{
 		/* RFC 5280, Section 4.1.2.3 */
 		.ft_name		= "x509.tbs.signature",
+		/* NYI */
 	},
 	{
 		/* RFC 5280, Section 4.1.2.4 */
 		.ft_name		= "x509.tbs.issuer",
 		.ft_validate		= tlshd_tags_filter_type_validate_pattern,
+		.ft_match		= tlshd_tags_filter_type_match_x509_tbs_issuer,
 	},
 	{
 		/* RFC 5280, Section 4.1.2.5 */
 		.ft_name		= "x509.tbs.validity.notBefore",
 		.ft_validate		= tlshd_tags_filter_type_validate_time,
+		.ft_match		= tlshd_tags_filter_type_match_x509_tbs_validity_notbefore,
 	},
 	{
 		/* RFC 5280, Section 4.1.2.5 */
 		.ft_name		= "x509.tbs.validity.notAfter",
 		.ft_validate		= tlshd_tags_filter_type_validate_time,
+		.ft_match		= tlshd_tags_filter_type_match_x509_tbs_validity_notafter,
 	},
 	{
 		/* RFC 5280, Section 4.1.2.6 */
 		.ft_name		= "x509.tbs.subject",
 		.ft_validate		= tlshd_tags_filter_type_validate_pattern,
+		.ft_match		= tlshd_tags_filter_type_match_x509_tbs_subject,
 	},
 
 	/* Standard certificate extensions, RFC 5280, Section 4.2.1 */
@@ -891,10 +1364,12 @@ static const struct tlshd_tags_filter_type tlshd_tags_static_filter_types[] = {
 		/* RFC 5280, Section 4.2.1.3 */
 		.ft_name		= "x509.extension.keyUsage",
 		.ft_validate		= tlshd_tags_filter_type_validate_purpose,
+		.ft_match		= tlshd_tags_filter_type_match_x509_extension_keyusage,
 	},
 	{
 		/* RFC 5280, Secttion 4.2.1.12 */
 		.ft_name		= "x509.extension.extendedKeyUsage",
+		/* NYI */
 	},
 
 	/* Derived fields */
@@ -903,10 +1378,12 @@ static const struct tlshd_tags_filter_type tlshd_tags_static_filter_types[] = {
 		/* Locally implemented */
 		.ft_name		= "x509.derived.fingerprint",
 		.ft_validate		= tlshd_tags_filter_type_validate_pattern,
+		.ft_match		= tlshd_tags_filter_type_match_x509_derived_fingerprint,
 	},
 	{
 		/* Locally implemented */
 		.ft_name		= "x509.derived.selfSigned",
+		/* NYI */
 	},
 };
 
@@ -945,6 +1422,59 @@ static bool tlshd_tags_filter_type_hash_init(void)
 	return true;
 }
 
+struct tlshd_tags_match_args {
+	struct tlshd_tags_tag		*ma_tag;
+	gnutls_session_t		ma_session;
+	bool				ma_filter_matched;
+};
+
+static void tlshd_tags_x509_match_filters_cb(gpointer data, gpointer user_data)
+{
+	struct tlshd_tags_filter *filter = (struct tlshd_tags_filter *)data;
+	struct tlshd_tags_match_args *args = (struct tlshd_tags_match_args *)user_data;
+
+	/* A previous filter failed to match. No need to check any further. */
+	if (!args->ma_filter_matched)
+		return;
+
+	if (!filter->fi_filter_type->ft_match) {
+		args->ma_filter_matched = true;
+		return;
+	}
+	args->ma_filter_matched = filter->fi_filter_type->ft_match(filter, args->ma_session);
+}
+
+/**
+ * tlshd_tags_match_session - match certificate against configured tags
+ * @session: session to assign tags to
+ *
+ * Side-effect: The ta_matched boolean is set in each tag in the
+ * global tag list that is matched. When this function is called in
+ * a child process, the parent process's tag list is not changed
+ * (the parent's tag list is copied-on-write by fork(2)).
+ */
+void tlshd_tags_match_session(gnutls_session_t session)
+{
+	GHashTableIter iter;
+	gpointer key, value;
+
+	if (!tlshd_tags_tag_hash)
+		return;
+
+	g_hash_table_iter_init(&iter, tlshd_tags_tag_hash);
+	while (g_hash_table_iter_next(&iter, &key, &value)) {
+		struct tlshd_tags_match_args args = {
+			.ma_tag			= (struct tlshd_tags_tag *)value,
+			.ma_session		= session,
+			.ma_filter_matched	= true,
+		};
+
+		g_ptr_array_foreach(args.ma_tag->ta_filters,
+				    tlshd_tags_x509_match_filters_cb, (gpointer)&args);
+		args.ma_tag->ta_matched = args.ma_filter_matched;
+	}
+}
+
 /* --- Subsystem start-up / shutdown APIs --- */
 
 /**
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 816b85f63291..38777a7e94a2 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -122,6 +122,7 @@ extern void tlshd_quic_serverhello_handshake(struct tlshd_handshake_parms *parms
 /* tags.c */
 extern void tlshd_tags_config_init(const char *tagsdir);
 extern void tlshd_tags_config_shutdown(void);
+extern void tlshd_tags_match_session(gnutls_session_t session);
 
 #ifdef HAVE_GNUTLS_QUIC
 #include <linux/quic.h>



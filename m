Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A041FC0F3
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Aug 2025 19:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754507143; cv=none; b=oXLe2+dqMdNgtTjaHrwpyOFMrEC9ub+WwamldzEWQWSepuGdUHjv/HIDMiNzRaM+7RMc0MONcAqcNpDVzXt7JgTPew0aWw40s2+bPomFj2BXuOISNeDqDK//aTGclIhHPUICa2Ljep1RZKihlU/xFNksuHQTN2PrHS71r5oiHVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754507143; c=relaxed/simple;
	bh=hCVWVds1GkG45X1IhpqkQT3KsWvfzg9g64n6csPbEZ4=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ReuDO3pR2L+y5uguw9tDDMn7Q/emHHpJTd9prQSdfS5dhaJn9oWPJS5Ozlgs+aRG8TLYBCYdXyqZ0H56OCFaQdvOD2Y12eaLCEXzyN18Q4DnGFprQYatMR56/hbgLbcUcrcLN1i8OwgIqofn5t9vgzTdgrJZVrANYp299u13hm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jt7q6wGK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jt7q6wGK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C222BC4CEE7
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Aug 2025 19:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754507142;
	bh=hCVWVds1GkG45X1IhpqkQT3KsWvfzg9g64n6csPbEZ4=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=Jt7q6wGKlqryb9FM3t7+/9u54g7TZRDPwcGA67NgCppeNGnJ7drgwHo3Xg1TV45Q8
	 rEDaPikjpZojFUDm+n45xxmHBKCib/C1o0HqKxPGdeZYIvvcneTM9eFd/RY+dCANWW
	 1MUMVKio+hce+UUonn70aEqo0uhZos1C9Xod77GoKAFz2sdJ9YbozhxFt4yhZRWcYS
	 IycXIh735b/qdRDvJWiYMZe9mA31LJjPo7NK7KepoOxhE0mNfF/saJM4yZ+3iiPeQS
	 Rw1eVOxPT/WUGk39BJE3yjFxB4oJZ9j8TgRnq21FFTwsXMu8sageNTGjBckBT+KLg5
	 jZ/VZV4t/P83w==
Subject: [PATCH 6/8] tlshd: Match ingress certificates with defined TLS
 session tags
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Wed, 06 Aug 2025 15:05:41 -0400
Message-ID: 
 <175450714192.1882.9671434855565874921.stgit@91.116.238.104.host.secureserver.net>
In-Reply-To: 
 <175450711047.1882.7241796438866009852.stgit@91.116.238.104.host.secureserver.net>
References: 
 <175450711047.1882.7241796438866009852.stgit@91.116.238.104.host.secureserver.net>
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
 configure.ac       |    4 +
 src/tlshd/server.c |    2 
 src/tlshd/tags.c   |  235 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 src/tlshd/tlshd.h  |    1 
 4 files changed, 242 insertions(+)

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
index 56416dc53caa..c3e7eadae9ee 100644
--- a/src/tlshd/server.c
+++ b/src/tlshd/server.c
@@ -313,6 +313,8 @@ static void tlshd_tls13_server_x509_handshake(struct tlshd_handshake_parms *parm
 		}
 	}
 
+	tlsdh_tags_x509_match_session(session);
+
 	gnutls_deinit(session);
 
 out_free_certs:
diff --git a/src/tlshd/tags.c b/src/tlshd/tags.c
index b929beff6f58..de79ad6a0f3a 100644
--- a/src/tlshd/tags.c
+++ b/src/tlshd/tags.c
@@ -1006,3 +1006,238 @@ void tlshd_tags_shutdown(void)
 				    NULL);
 	g_ptr_array_free(tlshd_tags_filter_all, TRUE);
 }
+
+static bool tlshd_tags_x509_match_subject(struct tlshd_tags_filter *filter,
+					  gnutls_x509_crt_t *cert)
+{
+	gnutls_datum_t dn;
+	int ret;
+
+	ret = gnutls_x509_crt_get_dn3(*cert, &dn, 0);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		return false;
+	}
+
+	/* XXX: Do we need to consult filter->fi_match_type here ? */
+
+#ifdef HAVE_GLIB_G_PATTERN_SPEC_MATCH
+	if (!g_pattern_spec_match(filter->fi_pattern, dn.size,
+			     (const gchar *)dn.data, NULL)) {
+#else
+	if (!g_pattern_match(filter->fi_pattern, dn.size,
+			     (const gchar *)dn.data, NULL)) {
+#endif
+		tlshd_log_debug("Filter '%s' did not match subject '%s'",
+				filter->fi_name, dn.data);
+		gnutls_free(dn.data);
+		return false;
+	}
+	tlshd_log_debug("Filter '%s' matched subject '%s'",
+			filter->fi_name, dn.data);
+	gnutls_free(dn.data);
+	return true;
+}
+
+static bool tlshd_tags_x509_match_issuer(struct tlshd_tags_filter *filter,
+					 gnutls_x509_crt_t *cert)
+{
+	gnutls_datum_t dn;
+	int ret;
+
+	ret = gnutls_x509_crt_get_issuer_dn3(*cert, &dn, 0);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		return false;
+	}
+
+	/* XXX: Do we need to consult filter->fi_match_type here ? */
+
+#ifdef HAVE_GLIB_G_PATTERN_SPEC_MATCH
+	if (!g_pattern_spec_match(filter->fi_pattern, dn.size,
+			     (const gchar *)dn.data, NULL)) {
+#else
+	if (!g_pattern_match(filter->fi_pattern, dn.size,
+			     (const gchar *)dn.data, NULL)) {
+#endif
+		tlshd_log_debug("Filter '%s' did not match issuer '%s'",
+				filter->fi_name, dn.data);
+		gnutls_free(dn.data);
+		return false;
+	}
+	tlshd_log_debug("Filter '%s' matched issuer '%s'",
+			filter->fi_name, dn.data);
+	gnutls_free(dn.data);
+	return true;
+}
+
+static bool tlshd_tags_x509_match_serial(struct tlshd_tags_filter *filter,
+					 gnutls_x509_crt_t *cert)
+{
+	unsigned char raw[40];
+	char *c, buf[100];
+	size_t i, size;
+	int ret;
+
+	size = sizeof(raw);
+	ret = gnutls_x509_crt_get_serial(*cert, raw, &size);
+	if (ret != GNUTLS_E_SUCCESS) {
+		tlshd_log_gnutls_error(ret);
+		return false;
+	}
+
+	c = buf;
+	for (i = 0; i < size; i++) {
+		sprintf(c, "%.2x", raw[i]);
+		c += 2;
+	}
+	*c = '\0';
+
+	/* XXX: Do we need to consult filter->fi_match_type here ? */
+
+#ifdef HAVE_GLIB_G_PATTERN_SPEC_MATCH
+	if (!g_pattern_spec_match(filter->fi_pattern, strlen(buf), buf, NULL)) {
+#else
+	if (!g_pattern_match(filter->fi_pattern, strlen(buf), buf, NULL)) {
+#endif
+		tlshd_log_debug("Filter '%s' did not match serial '%s'",
+				filter->fi_name, buf);
+		return false;
+	}
+	tlshd_log_debug("Filter '%s' matched serial '%s'",
+			filter->fi_name, buf);
+	return true;
+}
+
+static bool tlshd_tags_x509_match_san(struct tlshd_tags_filter *filter,
+				      gnutls_x509_crt_t *cert)
+{
+	char buf[256];	/* XXX: Dynamically-allocate this buffer */
+	unsigned int i;
+	size_t size;
+	int ret;
+
+	tlshd_log_debug("SAN filter: '%s'", filter->fi_name);
+
+	for (ret = 0, i = 0; ret >= 0; i++) {
+		size = sizeof(buf);
+		ret = gnutls_x509_crt_get_subject_alt_name(*cert, i, buf,
+							   &size, NULL);
+		if (ret == GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE)
+			break;
+
+		switch (ret) {
+		case GNUTLS_SAN_DNSNAME:
+			tlshd_log_debug("DNS: %s", buf);
+			break;
+		case GNUTLS_SAN_RFC822NAME:
+			tlshd_log_debug("RFC822: %s", buf);
+			break;
+		case GNUTLS_SAN_URI:
+			tlshd_log_debug("URI: %s", buf);
+			break;
+		case GNUTLS_SAN_IPADDRESS:
+			tlshd_log_debug("IP: %s", buf);
+			break;
+		case GNUTLS_SAN_OTHERNAME:
+			tlshd_log_debug("Other: %s", buf);
+			break;
+		case GNUTLS_SAN_DN:
+			tlshd_log_debug("DN: %s", buf);
+			break;
+		case GNUTLS_SAN_REGISTERED_ID:
+			tlshd_log_debug("Registered ID: %s", buf);
+			break;
+		case GNUTLS_SAN_OTHERNAME_XMPP:
+			tlshd_log_debug("Other XMPP: %s", buf);
+			break;
+		case GNUTLS_SAN_OTHERNAME_KRB5PRINCIPAL:
+			tlshd_log_debug("Other Krb5: %s", buf);
+			break;
+		case GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL:
+			tlshd_log_debug("Other MS User principal: %s", buf);
+			break;
+
+		default:
+			if (ret < 0) {
+				tlshd_log_gnutls_error(ret);
+				break;
+			}
+		}
+	}
+
+	return false;
+}
+
+struct tlshd_tags_match_args {
+	struct tlshd_tags_tag		*ma_tag;
+	gnutls_x509_crt_t		*ma_cert;
+	bool				ma_matched;
+};
+
+static void tlshd_tags_x509_match_filters_cb(gpointer data, gpointer user_data)
+{
+	struct tlshd_tags_filter *filter = (struct tlshd_tags_filter *)data;
+	struct tlshd_tags_match_args *args = (struct tlshd_tags_match_args *)user_data;
+
+	/* A previous filter failed to match, no need to check any further */
+	if (!args->ma_matched)
+		return;
+
+	if (strcmp(filter->fi_field, "subject") == 0)
+		args->ma_matched = tlshd_tags_x509_match_subject(filter, args->ma_cert);
+	else if (strcmp(filter->fi_field, "issuer") == 0)
+		args->ma_matched = tlshd_tags_x509_match_issuer(filter, args->ma_cert);
+	else if (strcmp(filter->fi_field, "serial") == 0)
+		args->ma_matched = tlshd_tags_x509_match_serial(filter, args->ma_cert);
+	else if (strcmp(filter->fi_field, "san") == 0)
+		args->ma_matched = tlshd_tags_x509_match_san(filter, args->ma_cert);
+}
+
+static void tlshd_tags_x509_match_cb(gpointer data, gpointer user_data)
+{
+	struct tlshd_tags_match_args args = {
+		.ma_tag		= (struct tlshd_tags_tag *)data,
+		.ma_cert	= (gnutls_x509_crt_t *)user_data,
+		.ma_matched	= true,
+	};
+
+	g_ptr_array_foreach(args.ma_tag->ta_filters,
+			    tlshd_tags_x509_match_filters_cb, (gpointer)&args);
+	args.ma_tag->ta_matched = args.ma_matched;
+}
+
+/**
+ * tlshd_tags_x509_match_session - match certificate against configured tags
+ * @session: session with incoming x.509 certificates
+ *
+ * Side-effect: The tt_matched boolean is set in each tag in the
+ * global tag list that is matched. When this function is called
+ * in a child process, the parent's tag list is not changed (the
+ * parent's tag list is copied-on-write after the child forks).
+ */
+void tlsdh_tags_x509_match_session(gnutls_session_t session)
+{
+	const gnutls_datum_t *cert_list;
+	unsigned int num_certs = 0;
+	gnutls_x509_crt_t peercert;
+
+	if (!tlshd_tags_tag_all)
+		return;
+	if (gnutls_certificate_type_get(session) != GNUTLS_CRT_X509)
+		return;
+	cert_list = gnutls_certificate_get_peers(session, &num_certs);
+	if (num_certs == 0)
+		return;
+
+	/*
+	 * The first certificate in the returned list is the peer's
+	 * certificate. That is the only one that is checked against
+	 * our tags list.
+	 */
+	gnutls_x509_crt_init(&peercert);
+	gnutls_x509_crt_import(peercert, &cert_list[0], GNUTLS_X509_FMT_DER);
+	g_ptr_array_foreach(tlshd_tags_tag_all,
+			    tlshd_tags_x509_match_cb, (gpointer)&peercert);
+	gnutls_x509_crt_deinit(peercert);
+}
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 69f26dd7a00a..173b291d0a5d 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -121,6 +121,7 @@ extern void tlshd_quic_serverhello_handshake(struct tlshd_handshake_parms *parms
 
 /* tags.c */
 extern void tlshd_tags_read_configuration(const char *tagsdir);
+extern void tlsdh_tags_x509_match_session(gnutls_session_t session);
 extern void tlshd_tags_shutdown(void);
 
 #ifdef HAVE_GNUTLS_QUIC



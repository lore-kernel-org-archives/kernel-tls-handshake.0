Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49ED262FDC
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222702; cv=none; b=Q1W1dMDUPzhCsX+oiZ3HRyn/0dTonm3F1tR0BhHNEn1/GfrpoclScZ2LLIw55+GyCdpi1CFl7RYoAXC4ag/fXhdd09bR3CYc+QMXfp53zITCL1Xfk25THUzDCHGDhz0P6HKUKwwtYTWZNgbaQhDNylJaDZkpY4maFSLD4eLR/x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222702; c=relaxed/simple;
	bh=RQc2wv+cP201/GwClQ5OuzMW37HTYgOf/JJSGrCA1mY=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mgDCMNLVp5wRKzMYpAwGPDRAONyiu0HdT7idl1K2Y+igpGygUSxum8GULzO3uzdB7PPrJmr4KU9WvQkjR1kYC9OF8dIWWKAnDTfewtsBXMTm156UbaM0flekjrJDQaIdvzF+2mD/Adyk2OQlkMYYqgeezvVvg2xei1VkJNmmvjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5f8nQqx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5f8nQqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31234C4CEF1
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756222702;
	bh=RQc2wv+cP201/GwClQ5OuzMW37HTYgOf/JJSGrCA1mY=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=W5f8nQqx8R2R6kliQB581Wp3fQ57wjaEXHEDiE7xPHRCD6Sb7o+YOf5yr5Qr0fvJK
	 vxkGrh9Omm6FWK+5DbaQeeSlMIMxEgOtZIWHkVUzgpylebUuvseIIB3spmXPxv+OW5
	 QTp46TmSOrrdS9/14nX/3AmcLQKPbDBQ0VnExXXisPdBedDmXQnUpJ5//BC6ihSR/q
	 fiHRdAVYjAOwl51iPP7VQRY4fVNzK1ElLwz17PK4W65UJSrXYgXYqWOVYCOFh/UE2Q
	 o5UWAuA2riQYHA8XEnQZwzmvyOFiuuuxKBVUA9yHGMBbc+y0n+8LXO+coNSdZ04IKb
	 t2LmF9zyldG3Q==
Subject: [PATCH v2 05/11] tlshd: Add tag filter types
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Tue, 26 Aug 2025 11:38:21 -0400
Message-ID: 
 <175622270143.6197.4955935053738478046.stgit@91.116.238.104.host.secureserver.net>
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

To start, define a filter type for each x.509 certificate field that
someone might want to match. These are defined in a table for easy
extensibility, and read into a hash table at start-up so they can be
looked up quickly by filter type name. (The filter type names will
eventually be exposed to users).

The filter types are introduced separately to give a sense of what
kind of matching can be done.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/etc/tls-session-tags.man |  123 ++++++++++++++++++++++++++++++++++++
 src/tlshd/tags.c                   |  114 +++++++++++++++++++++++++++++++++
 2 files changed, 237 insertions(+)

diff --git a/src/tlshd/etc/tls-session-tags.man b/src/tlshd/etc/tls-session-tags.man
index 5ee58f6d2289..c5a73d881773 100644
--- a/src/tlshd/etc/tls-session-tags.man
+++ b/src/tlshd/etc/tls-session-tags.man
@@ -99,6 +99,129 @@ Each tag is a list of one or more filters (defined in the
 dictionary)
 that all must be matched in order for the tag to be assigned to a
 new TLS session.
+.SS Filter types
+A filter's
+.I type
+determines the part of the incoming authentication material that the
+.B tlshd
+program examines to determine if ther is a match.
+For example, for the
+.I x509.tbs.subject
+filter type, a string argument specifies a simple wildcard pattern
+that is matched against an incoming x.509 certificate's subject field.
+A complete list of filter types appears in the
+.B FILTER TYPE REFERENCE
+section below.
+
+.SH FILTER TYPE REFERENCE
+The
+.B tlshd
+program currently implements the following filter types:
+.TP
+.B x509.cert.signatureAlgorithm
+Filters of this type examine an incoming x.509 certificate's
+signatureAlgorithm field,
+as defined in RFC 5280, Section 4.1.1.2.
+The filter takes an additional string wildcard pattern that
+can be an algorithm name or an algorithm OID.
+.TP
+.B x509.tbs.version
+Filters of this type examine an incoming x.509 certificate's
+version field,
+part of the To-Be-Signed section of the certificate,
+as defined in RFC 5280, Section 4.1.2.1.
+The filter takes an additional numeric value that is matched
+against the certificate's version.
+.TP
+.B x509.tbs.serialNumber
+Filters of this type examine an incoming x.509 certificate's
+serialNumber field,
+part of the To-Be-Signed section of the certificate,
+as defined in RFC 5280, Section 4.1.2.2.
+The filter takes an additional string wildcard pattern that
+matches a hexadecimal number.
+.TP
+.B x509.tbs.signature
+Filters of this type examine an incoming x.509 certificate's
+signature field,
+part of the To-Be-Signed section of the certificate,
+as defined in RFC 5280, Section 4.1.2.3.
+The filter takes an additional string wildcard pattern that
+matches, well, something.
+.TP
+.B x509.tbs.issuer
+Filters of this type examine an incoming x.509 certificate's
+issuer field,
+part of the To-Be-Signed section of the certificate,
+as defined in RFC 5280, Section 4.1.2.4.
+The filter takes an additional string wildcard pattern that
+matches the distinguished name part of the certificate's
+issuer field.
+.TP
+.B x509.tbs.validity.notBefore
+Filters of this type examine an incoming x.509 certificate's
+activation time field,
+part of the To-Be-Signed section of the certificate,
+as defined in RFC 5280, Section 4.1.2.5.
+The filter takes an additional string that
+contains a date and time. If the certificate's activation
+timestamp is earlier than the date and time specified in
+this filter, the filter does not match.
+.TP
+.B x509.tbs.validity.notAfter
+Filters of this type examine an incoming x.509 certificate's
+expiration time field,
+part of the To-Be-Signed section of the certificate,
+as defined in RFC 5280, Section 4.1.2.5.
+The filter takes an additional string that
+contains a date and time. If the certificate's expiry
+timestamp is later than the date and time specified in
+this filter, the filter does not match.
+.TP
+.B x509.tbs.subject
+Filters of this type examine an incoming x.509 certificate's
+subject field,
+part of the To-Be-Signed section of the certificate,
+as defined in RFC 5280, Section 4.1.2.6.
+The filter takes an additional string wildcard pattern that
+matches the distinguished name part of the certificate's
+subject field.
+
+.TP
+.B x509.extension.keyUsage
+Filters of this type examine an incoming x.509 certificate's
+keyUsage field,
+one of the standard certificate extensions.
+The filter takes a list of bit names that must be set in the
+field in order for the filter to match.
+This list contains zero or one of the following bit names:
+.IR digitalSignature ,
+.IR nonRepudiation ,
+.IR keyEncipherment ,
+.IR dataEncipherment ,
+.IR keyAgreement ,
+.IR keyCertSign ,
+.IR cRLSign ,
+.IR encipherOnly ", or"
+.IR decipherOnly .
+.TP
+.B x509.extension.extendedKeyUsage
+Filters of this type examine an incoming x.509 certificate's
+extendedKeyUsage field,
+one of the standard certificate extensions.
+This filter type is not yet implemented.
+.TP
+.B x509.derived.fingerprint
+Filters of this type locally compute an incoming x.509 certificate's
+SHA1 and SHA256 fingerprint.
+The filter takes an additional string wildcard pattern that
+matches the hexadecimal value of either the derived SHA1 or
+derived SHA256 fingerrint.
+.TP
+.B x509.derived.selfSigned
+Filters of this type match when an incoming x.509 certificate's
+issuer and subject distinguished names are exactly equal.
+This filter type is not yet implemented.
 .SH STANDARDS
 x.509
 .BR
diff --git a/src/tlshd/tags.c b/src/tlshd/tags.c
index 3f8631240281..2d2f72f036f4 100644
--- a/src/tlshd/tags.c
+++ b/src/tlshd/tags.c
@@ -30,6 +30,117 @@
 
 #include "tlshd.h"
 
+struct tlshd_tags_filter;
+
+struct tlshd_tags_filter_type {
+	gchar				*ft_name;
+	bool				(*ft_validate)(struct tlshd_tags_filter *filter);
+	bool				(*ft_match)(struct tlshd_tags_filter *filter,
+						    gnutls_session_t session);
+};
+
+static GHashTable *tlshd_tags_filter_type_hash;
+
+/* --- Filter Types --- */
+
+static const struct tlshd_tags_filter_type tlshd_tags_static_filter_types[] = {
+
+	/* Certificate fields, RFC 5280, Section 4.1.1 */
+
+	{
+		/* RFC 5280, Section 4.1.1.2 */
+		.ft_name		= "x509.cert.signatureAlgorithm",
+	},
+
+	/* To-Be-Signed fields, RFC 5280, Section 4.1.2 */
+
+	{
+		/* RFC 5280, Section 4.1.2.1 */
+		.ft_name		= "x509.tbs.version",
+	},
+	{
+		/* RFC 5280, Section 4.1.2.2 */
+		.ft_name		= "x509.tbs.serialNumber",
+	},
+	{
+		/* RFC 5280, Section 4.1.2.3 */
+		.ft_name		= "x509.tbs.signature",
+	},
+	{
+		/* RFC 5280, Section 4.1.2.4 */
+		.ft_name		= "x509.tbs.issuer",
+	},
+	{
+		/* RFC 5280, Section 4.1.2.5 */
+		.ft_name		= "x509.tbs.validity.notBefore",
+	},
+	{
+		/* RFC 5280, Section 4.1.2.5 */
+		.ft_name		= "x509.tbs.validity.notAfter",
+	},
+	{
+		/* RFC 5280, Section 4.1.2.6 */
+		.ft_name		= "x509.tbs.subject",
+	},
+
+	/* Standard certificate extensions, RFC 5280, Section 4.2.1 */
+
+	{
+		/* RFC 5280, Section 4.2.1.3 */
+		.ft_name		= "x509.extension.keyUsage",
+	},
+	{
+		/* RFC 5280, Secttion 4.2.1.12 */
+		.ft_name		= "x509.extension.extendedKeyUsage",
+	},
+
+	/* Derived fields */
+
+	{
+		/* Locally implemented */
+		.ft_name		= "x509.derived.fingerprint",
+	},
+	{
+		/* Locally implemented */
+		.ft_name		= "x509.derived.selfSigned",
+	},
+};
+
+static void tlshd_tags_filter_type_hash_destroy(void)
+{
+	if (!tlshd_tags_filter_type_hash)
+		return;
+
+	g_hash_table_destroy(tlshd_tags_filter_type_hash);
+	tlshd_tags_filter_type_hash = NULL;
+}
+
+/*
+ * Add the internally-implemented filter types to a hash table for
+ * fast lookup by name.
+ */
+static bool tlshd_tags_filter_type_hash_init(void)
+{
+	size_t i;
+
+	tlshd_tags_filter_type_hash = g_hash_table_new(g_str_hash, g_str_equal);
+	if (!tlshd_tags_filter_type_hash) {
+		tlshd_log_error("Failed to allocate 'filter type' hash table\n");
+		tlshd_tags_filter_type_hash = NULL;
+		return false;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(tlshd_tags_static_filter_types); ++i) {
+		const struct tlshd_tags_filter_type *filter_type;
+
+		filter_type = &tlshd_tags_static_filter_types[i];
+		g_hash_table_insert(tlshd_tags_filter_type_hash,
+				    filter_type->ft_name,
+				    (gpointer)filter_type);
+	}
+	return true;
+}
+
 /* --- Subsystem start-up / shutdown APIs --- */
 
 /**
@@ -39,6 +150,8 @@
  */
 void tlshd_tags_config_init(__attribute__ ((unused)) const char *tagsdir)
 {
+	if (!tlshd_tags_filter_type_hash_init())
+		return;
 }
 
 /**
@@ -47,4 +160,5 @@ void tlshd_tags_config_init(__attribute__ ((unused)) const char *tagsdir)
  */
 void tlshd_tags_config_shutdown(void)
 {
+	tlshd_tags_filter_type_hash_destroy();
 }



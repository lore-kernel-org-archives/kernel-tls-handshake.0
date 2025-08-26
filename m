Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B142275846
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222718; cv=none; b=ROKFIjJn11T+7+8AesrYVBHTuKT/HLySaFcRN4emPEhhIT3ArIbJdZXCZU907irGhmHzqJGg6i1Mzs/YlW9RZTQiXqGSSeY6R4g5cIKzIkYpkSpmf68V5dAes5/CNPLreFwer05iHVMwtE+xEAWDD6AyKfMFp9l6ebtSXZh4sVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222718; c=relaxed/simple;
	bh=/XtsBfHhsvaDmJG3mr72Yt4GajYxQ5SlfhCRgkq/bvk=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QR7++m6X561tkrBPjmXuCdcdTU3UqSK8XEbAH5WoZH2cjRKcH7RWGznHAGi3xsXd4Encs6mhcDm17aVILS4nJ9f46VE2M6GY1p29kjaXtMEjr4eGxVltrkki3q+0kFb6hYmOHjIN3Hkt0h0HAlmAN/A1CkFdTsWNtqsZbf1W+0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p3rPiZZG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p3rPiZZG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64BC3C4CEF1
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756222714;
	bh=/XtsBfHhsvaDmJG3mr72Yt4GajYxQ5SlfhCRgkq/bvk=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=p3rPiZZGTNVnSRkpil5zEODpDxu0Nz4Ea8eaj3xQ2BeSXOILu/2GQXczAb1jscQEi
	 T6N7hjhUtKPBTRKkg4OyW9WubGiFA41SZb9IY0YdrcSqS/Q3CJGnQASA4QBqwUqPcy
	 cfzmOaFQvl8hM943PNcQ/eR6WtotG0BP7ri7UQ2Qy3EGl5qwzGi6yra2tPys4Xeoow
	 qIg/FPllKD8EAonRPAstMroVzGUBC89c9OOzCLrTQtk3GUTeQM82imssCiDURkhrYB
	 GaTpHBvGGahzvxZgVFrT3fcIt2Yn+QUutgZJPJUowbt447rS3b62XIiEq+rRow1C+l
	 xa4nDRfmI31Xw==
Subject: [PATCH v2 07/11] tlshd: Parse filter definitions
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Tue, 26 Aug 2025 11:38:33 -0400
Message-ID: 
 <175622271361.6197.7592125464581705643.stgit@91.116.238.104.host.secureserver.net>
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

Administrators can define filters which specify a filter type (e.g.,
which x.509 field is to be checked) and filter arguments (e.g., what
content is to be matched).

A subsequent patch will add the ability to specify the tags which
are added to a TLS session based on filter matches.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/etc/tls-session-tags.man |   18 ++
 src/tlshd/tags.c                   |  269 ++++++++++++++++++++++++++++++++++++
 2 files changed, 286 insertions(+), 1 deletion(-)

diff --git a/src/tlshd/etc/tls-session-tags.man b/src/tlshd/etc/tls-session-tags.man
index c5a73d881773..e6603138fe10 100644
--- a/src/tlshd/etc/tls-session-tags.man
+++ b/src/tlshd/etc/tls-session-tags.man
@@ -222,6 +222,24 @@ derived SHA256 fingerrint.
 Filters of this type match when an incoming x.509 certificate's
 issuer and subject distinguished names are exactly equal.
 This filter type is not yet implemented.
+.SS Filters
+The definition of each filter is YAML mapping that specifies
+the unique name of the filter,
+its filter type,
+and
+zero or more specific match arguments to be used.
+For example:
+
+  filters:
+    ...
+    monsters-university:
+      type: "x509.tbs.issuer"
+      pattern: "*,O=Monsters University,*"
+    ...
+
+This blurb defines a filter named "monsters-university".
+It uses a wildcard match that looks for "O=Monsters Univerity"
+in the "issuer" field of each incoming x.509 certificate.
 .SH STANDARDS
 x.509
 .BR
diff --git a/src/tlshd/tags.c b/src/tlshd/tags.c
index 12d8f6ca00b1..9bbbf8cf1b88 100644
--- a/src/tlshd/tags.c
+++ b/src/tlshd/tags.c
@@ -64,6 +64,15 @@ enum tlshd_tags_fsm_state_index {
 	PS_DOCUMENT,
 	PS_TOP_LEVEL,
 
+	PS_FILTERS,
+	PS_FILTER,
+	PS_FILTER_KEYS,
+	PS_FILTER_KEY,
+	PS_FILTER_TYPE_VALUE,
+	PS_FILTER_PATTERN_VALUE,
+	PS_FILTER_PURPOSE_LIST,
+	PS_FILTER_KEY_USAGE,
+
 	PS_UNEXPECTED_INPUT_TOKEN,
 	PS_FAILURE,
 };
@@ -79,10 +88,25 @@ struct tlshd_tags_filter_type {
 
 static GHashTable *tlshd_tags_filter_type_hash;
 
+struct tlshd_tags_filter {
+	gchar				*fi_name;
+	struct tlshd_tags_filter_type	*fi_filter_type;
+
+	/* filter arguments */
+	gchar				*fi_pattern;
+	GPatternSpec			*fi_pattern_spec;
+	unsigned int			fi_purpose_mask;
+	time_t				fi_time;
+};
+
+static GHashTable *tlshd_tags_filter_hash;
+
 struct tlshd_tags_parser_state {
 	yaml_event_t			ps_yaml_event;
 
 	enum tlshd_tags_fsm_state_index	ps_fsm_state;
+
+	struct tlshd_tags_filter	*ps_current_filter;
 };
 
 static enum tlshd_tags_fsm_state_index
@@ -91,10 +115,205 @@ tlshd_tags_top_level(struct tlshd_tags_parser_state *current)
 	const yaml_event_t *event = &current->ps_yaml_event;
 	const char *mapping = (const char *)event->data.scalar.value;
 
+	if (strcmp(mapping, "filters") == 0)
+		return PS_FILTERS;
+
 	tlshd_log_error("Unexpected mapping name: %s\n", mapping);
 	return PS_UNEXPECTED_INPUT_TOKEN;
 }
 
+/* --- Filters --- */
+
+static void tlshd_tags_filter_free(struct tlshd_tags_filter *filter)
+{
+	if (!filter)
+		return;
+
+	if (tlshd_debug > 3)
+		tlshd_log_debug("Removing filter '%s' from the filter hash",
+				filter->fi_name);
+
+	if (filter->fi_pattern_spec)
+		g_pattern_spec_free(filter->fi_pattern_spec);
+	g_free(filter->fi_pattern);
+	g_free(filter->fi_name);
+	g_free(filter);
+}
+
+static void tlshd_tags_filter_hash_destroy(void)
+{
+	GHashTableIter iter;
+	gpointer key, value;
+
+	if (!tlshd_tags_filter_hash)
+		return;
+
+	g_hash_table_iter_init(&iter, tlshd_tags_filter_hash);
+	while (g_hash_table_iter_next(&iter, &key, &value))
+		tlshd_tags_filter_free((struct tlshd_tags_filter *)value);
+
+	g_hash_table_destroy(tlshd_tags_filter_hash);
+	tlshd_tags_filter_hash = NULL;
+}
+
+static bool
+tlshd_tags_filter_hash_init(void)
+{
+	tlshd_tags_filter_hash = g_hash_table_new(g_str_hash, g_str_equal);
+	return tlshd_tags_filter_hash != NULL;
+}
+
+static enum tlshd_tags_fsm_state_index
+tlshd_tags_filter_create(struct tlshd_tags_parser_state *current)
+{
+	const yaml_event_t *event = &current->ps_yaml_event;
+	struct tlshd_tags_filter *filter;
+
+	filter = g_malloc0(sizeof(*filter));
+	if (!filter) {
+		tlshd_log_error("Failed to allocate new filter\n");
+		return PS_FAILURE;
+	}
+
+	filter->fi_name = g_strdup((const char *)event->data.scalar.value);
+	if (!filter->fi_name) {
+		free(filter);
+		tlshd_log_error("Failed to allocate new filter\n");
+		return PS_FAILURE;
+	}
+
+	current->ps_current_filter = filter;
+	return PS_FILTER_KEYS;
+}
+
+static enum tlshd_tags_fsm_state_index
+tlshd_tags_filter_type_add(struct tlshd_tags_parser_state *current)
+{
+	const yaml_event_t *event = &current->ps_yaml_event;
+	const char *name = (const char *)event->data.scalar.value;
+
+	if (!current->ps_current_filter) {
+		tlshd_log_error("No current filter\n");
+		return PS_FAILURE;
+	}
+
+	if (current->ps_current_filter->fi_filter_type) {
+		tlshd_log_error("Filter type already set for filter '%s'\n",
+				name);
+		return PS_FAILURE;
+	}
+
+	gconstpointer key = (gconstpointer)name;
+	gpointer filter_type;
+
+	filter_type = g_hash_table_lookup(tlshd_tags_filter_type_hash, key);
+	if (!filter_type) {
+		tlshd_log_debug("Filter type '%s' is not supported", name);
+		return PS_UNEXPECTED_INPUT_TOKEN;
+	}
+
+	current->ps_current_filter->fi_filter_type = filter_type;
+	return PS_FILTER_KEY;
+}
+
+static enum tlshd_tags_fsm_state_index
+tlshd_tags_filter_key_set(struct tlshd_tags_parser_state *current)
+{
+	const yaml_event_t *event = &current->ps_yaml_event;
+	const char *key = (const char *)event->data.scalar.value;
+
+	if (strcmp(key, "type") == 0)
+		return PS_FILTER_TYPE_VALUE;
+	else if (strcmp(key, "pattern") == 0)
+		return PS_FILTER_PATTERN_VALUE;
+	else if (strcmp(key, "purpose") == 0)
+		return PS_FILTER_PURPOSE_LIST;
+
+	tlshd_log_error("Unexpected token: %s\n", key);
+	return PS_UNEXPECTED_INPUT_TOKEN;
+}
+
+static enum tlshd_tags_fsm_state_index
+tlshd_tags_filter_pattern_set(struct tlshd_tags_parser_state *current)
+{
+	const yaml_event_t *event = &current->ps_yaml_event;
+	const char *pattern = (const char *)event->data.scalar.value;
+
+	if (!current->ps_current_filter) {
+		tlshd_log_error("No current filter\n");
+		return PS_FAILURE;
+	}
+
+	current->ps_current_filter->fi_pattern = g_strdup(pattern);
+	if (!current->ps_current_filter->fi_pattern) {
+		tlshd_log_error("Failed to allocate filter pattern\n");
+		return PS_FAILURE;
+	}
+
+	return PS_FILTER_KEY;
+}
+
+static enum tlshd_tags_fsm_state_index
+tlshd_tags_filter_key_usage_set(struct tlshd_tags_parser_state *current)
+{
+	const yaml_event_t *event = &current->ps_yaml_event;
+	const char *name = (const char *)event->data.scalar.value;
+	unsigned int key_usage = 0;
+
+	if (strcmp(name, "digitalSignature") == 0)
+		key_usage = GNUTLS_KEY_DIGITAL_SIGNATURE;
+	else if (strcmp(name, "nonRepudiation") == 0)
+		key_usage = GNUTLS_KEY_NON_REPUDIATION;
+	else if (strcmp(name, "keyEncipherment") == 0)
+		key_usage = GNUTLS_KEY_KEY_ENCIPHERMENT;
+	else if (strcmp(name, "dataEncipherment") == 0)
+		key_usage = GNUTLS_KEY_DATA_ENCIPHERMENT;
+	else if (strcmp(name, "keyAgreement") == 0)
+		key_usage = GNUTLS_KEY_KEY_AGREEMENT;
+	else if (strcmp(name, "keyCertSign") == 0)
+		key_usage = GNUTLS_KEY_KEY_CERT_SIGN;
+	else if (strcmp(name, "cRLSign") == 0)
+		key_usage = GNUTLS_KEY_CRL_SIGN;
+	else if (strcmp(name, "encipherOnly") == 0)
+		key_usage = GNUTLS_KEY_ENCIPHER_ONLY;
+	else if (strcmp(name, "decipherOnly") == 0)
+		key_usage = GNUTLS_KEY_DECIPHER_ONLY;
+	else {
+		tlshd_log_error("Unrecognized key usage: %s\n", name);
+		return PS_UNEXPECTED_INPUT_TOKEN;
+	}
+
+	current->ps_current_filter->fi_purpose_mask |= key_usage;
+	return PS_FILTER_KEY_USAGE;
+}
+
+static enum tlshd_tags_fsm_state_index
+tlshd_tags_filter_finalize(struct tlshd_tags_parser_state *current)
+{
+	struct tlshd_tags_filter *filter = current->ps_current_filter;
+
+	if (!filter) {
+		tlshd_log_error("No current filter\n");
+		return PS_FAILURE;
+	}
+
+	if (!filter->fi_filter_type->ft_validate) {
+		tlshd_log_error("Filter '%s' filter type is not yet implemented.",
+				filter->fi_name);
+		return PS_FILTER;
+	}
+	if (!filter->fi_filter_type->ft_validate(filter))
+		return PS_FAILURE;
+
+	if (tlshd_debug > 3)
+		tlshd_log_debug("Adding filter '%s' to the filter hash",
+				filter->fi_name);
+	g_hash_table_insert(tlshd_tags_filter_hash, filter->fi_name,
+			    (gpointer)filter);
+	current->ps_current_filter = NULL;
+	return PS_FILTER;
+}
+
 /* --- FSM states --- */
 
 typedef enum tlshd_tags_fsm_state_index
@@ -137,6 +356,41 @@ static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_top_level[]
 	NEXT_STATE(YAML_MAPPING_END_EVENT, PS_DOCUMENT),
 };
 
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_filters[] = {
+	NEXT_STATE(YAML_MAPPING_START_EVENT, PS_FILTER),
+};
+
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_filter[] = {
+	NEXT_ACTION(YAML_SCALAR_EVENT, tlshd_tags_filter_create),
+	NEXT_STATE(YAML_MAPPING_END_EVENT, PS_TOP_LEVEL),
+};
+
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_filter_keys[] = {
+	NEXT_STATE(YAML_MAPPING_START_EVENT, PS_FILTER_KEY),
+};
+
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_filter_key[] = {
+	NEXT_ACTION(YAML_SCALAR_EVENT, tlshd_tags_filter_key_set),
+	NEXT_ACTION(YAML_MAPPING_END_EVENT, tlshd_tags_filter_finalize),
+};
+
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_filter_type_value[] = {
+	NEXT_ACTION(YAML_SCALAR_EVENT, tlshd_tags_filter_type_add),
+};
+
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_filter_pattern_value[] = {
+	NEXT_ACTION(YAML_SCALAR_EVENT, tlshd_tags_filter_pattern_set),
+};
+
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_filter_purpose_list[] = {
+	NEXT_STATE(YAML_SEQUENCE_START_EVENT, PS_FILTER_KEY_USAGE),
+};
+
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_filter_key_usage[] = {
+	NEXT_ACTION(YAML_SCALAR_EVENT, tlshd_tags_filter_key_usage_set),
+	NEXT_STATE(YAML_SEQUENCE_END_EVENT, PS_FILTER_KEY),
+};
+
 struct tlshd_tags_fsm_state {
 	const char			*ts_name;
 	const struct tlshd_tags_fsm_transition *ts_transitions;
@@ -162,6 +416,14 @@ static const struct tlshd_tags_fsm_state tlshd_tags_fsm_state_table[] = {
 	FSM_STATE(PS_STREAM, tlshd_tags_transitions_stream),
 	FSM_STATE(PS_DOCUMENT, tlshd_tags_transitions_document),
 	FSM_STATE(PS_TOP_LEVEL, tlshd_tags_transitions_top_level),
+	FSM_STATE(PS_FILTERS, tlshd_tags_transitions_filters),
+	FSM_STATE(PS_FILTER, tlshd_tags_transitions_filter),
+	FSM_STATE(PS_FILTER_KEYS, tlshd_tags_transitions_filter_keys),
+	FSM_STATE(PS_FILTER_KEY, tlshd_tags_transitions_filter_key),
+	FSM_STATE(PS_FILTER_TYPE_VALUE, tlshd_tags_transitions_filter_type_value),
+	FSM_STATE(PS_FILTER_PATTERN_VALUE, tlshd_tags_transitions_filter_pattern_value),
+	FSM_STATE(PS_FILTER_PURPOSE_LIST, tlshd_tags_transitions_filter_purpose_list),
+	FSM_STATE(PS_FILTER_KEY_USAGE, tlshd_tags_transitions_filter_key_usage),
 	TERMINAL_STATE(PS_UNEXPECTED_INPUT_TOKEN),
 	TERMINAL_STATE(PS_FAILURE),
 };
@@ -396,12 +658,16 @@ void tlshd_tags_config_init(const char *tagsdir)
 {
 	if (!tlshd_tags_filter_type_hash_init())
 		return;
+	if (!tlshd_tags_filter_hash_init())
+		goto filter_type_hash;
 
 	if (!tlshd_tags_read_directory(tagsdir))
-		goto filter_type_hash;
+		goto filter_hash;
 
 	return;
 
+filter_hash:
+	tlshd_tags_filter_hash_destroy();
 filter_type_hash:
 	tlshd_tags_filter_type_hash_destroy();
 }
@@ -412,5 +678,6 @@ filter_type_hash:
  */
 void tlshd_tags_config_shutdown(void)
 {
+	tlshd_tags_filter_hash_destroy();
 	tlshd_tags_filter_type_hash_destroy();
 }



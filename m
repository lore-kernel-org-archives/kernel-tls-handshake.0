Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E4E2C0F7C
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222721; cv=none; b=P23LnSxJHaB/FHEH1g5qXuTGBCwm0oH/IGYabXHPuevF1BjzqwqAP5Nw8BBaP7i7S5WcgCtzg8jWw40Syuiy1UK0y0x0WofYOPvlJFkJGyUFQSaKJ5F0FKDmJ/nMRoSm7EdTzRZAzJQwkp05eYY3wd5UnKrDBGEYyusq+oOEDdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222721; c=relaxed/simple;
	bh=waHrDgMKdLrPkabs5yAVj4eaK9tCWxsSTXAZmHAYCVA=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RdmN/Hlgxa9NqyPsdgF8h6dn5qf4hZVUnRbbh/O7dPk06HJbhdLwREB8ni2rnwdTQKwn5izvzuWLYgLJGLClcuT/G/81rS7WHYyFDG5lHU+h35/CU47alxOnB56fQKo2A4LMpx+0ytHSdDZwe7eaNe485fBfjW8PZGNoaVg8nzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTMAqj9G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTMAqj9G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745DEC4CEF1
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756222720;
	bh=waHrDgMKdLrPkabs5yAVj4eaK9tCWxsSTXAZmHAYCVA=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=oTMAqj9GVXGyZ90n4nwYlADdwe0C1ZNmHFzlyYRZoC+HVzzPR2jFLppF8itiqTzpY
	 9OCOzn8Vuyjd5z8e4rH52Wx6ru942bE9j8CXbdB/FZE+ItjPRiNxkRJP/4USh2AQlc
	 NyyENG1iSIbeFJtw0GovzfGnMZhS+XhFCG1zvUYLb9c/ByjjxgjpRS2TqLb7xcmD9k
	 889RS6M0mUA5Mb/380j6q47qPUZkLPNnKP/N3GlCowoOK7lVOdT2gpfAceLscXV3hc
	 QdwQlNoC9RHaOobfaU0sdTr0PnpPDXG+WJXTEJmEXDrVFw85MMvs2IPODwWK2SVNZP
	 ArYlQGGzJDl3Q==
Subject: [PATCH v2 08/11] tlshd: Add parsing for tag definitions
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Tue, 26 Aug 2025 11:38:39 -0400
Message-ID: 
 <175622271971.6197.11464333463480198323.stgit@91.116.238.104.host.secureserver.net>
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

TLS session tags are defined in files that reside in
/etc/tlshd/tags.d/*.{yaml,yml}. On daemon start-up, the tag
definitions are read into a data structure that is shared with
forked children processes.

Unfortunately the libyaml parser is nothing more than a token
emitter. A nicer API exists in libcyaml, but that library does not
appear to be available in many distributions. Thus the new tag
config file parsing code implements a full finite state parser of
the session tags files.

Session tag configuration errors are reported but are not fatal.

Nothing is done with these tags yet, and documentation is added
in a subsequent patch.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/etc/tls-session-tags.man |   36 ++++
 src/tlshd/tags.c                   |  306 ++++++++++++++++++++++++++++++++++++
 2 files changed, 341 insertions(+), 1 deletion(-)

diff --git a/src/tlshd/etc/tls-session-tags.man b/src/tlshd/etc/tls-session-tags.man
index e6603138fe10..af315d074e9c 100644
--- a/src/tlshd/etc/tls-session-tags.man
+++ b/src/tlshd/etc/tls-session-tags.man
@@ -240,6 +240,42 @@ For example:
 This blurb defines a filter named "monsters-university".
 It uses a wildcard match that looks for "O=Monsters Univerity"
 in the "issuer" field of each incoming x.509 certificate.
+.SS Tags
+The definition of each tag is a YAML mapping that specifies
+the unique name of the tag
+and
+a list of filters, as defined in the Filters mapping,
+that all must match for the tag to be assigned to
+a TLS session. For example:
+
+  tags:
+    ...
+    ror-mu-chapter:
+      filter:
+        - "monsters-univerity"
+        - "fraternity-ror"
+    ...
+
+This defines a tag named "ror-mu-chapter".
+Both the "monsters-university" and "fraternity-ror" filters must
+match in order for the
+.B tlshd
+program to assign the
+.I ror-mu-chapter
+tag to an incoming TLS session.
+.SS Handshake completion
+Once a TLS handshake is successful, the
+.B tlshd
+program scans the peer's certificate using the configured filter and
+tag definitions.
+Any tag matches are attached to the new TLS session and are made
+visible to the kernel consumer that is to use that session.
+Note that
+the session's authentication material,
+any filter types,
+and
+filter names
+are not exposed to kernel consumers.
 .SH STANDARDS
 x.509
 .BR
diff --git a/src/tlshd/tags.c b/src/tlshd/tags.c
index 9bbbf8cf1b88..672ae3350e3d 100644
--- a/src/tlshd/tags.c
+++ b/src/tlshd/tags.c
@@ -20,10 +20,23 @@
 
 #include "config.h"
 
+//#include <sys/types.h>
+//#include <sys/socket.h>
+//#include <sys/stat.h>
+//#include <sys/syscall.h>
+
 #include <stdbool.h>
+//#include <unistd.h>
+//#include <stdlib.h>
+//#include <stdio.h>
+//#include <fcntl.h>
+//#include <errno.h>
+//#include <string.h>
+//#include <libgen.h>
 #include <keyutils.h>
 
 #include <gnutls/gnutls.h>
+//#include <gnutls/x509.h>
 #include <gnutls/abstract.h>
 
 #include <glib.h>
@@ -73,6 +86,13 @@ enum tlshd_tags_fsm_state_index {
 	PS_FILTER_PURPOSE_LIST,
 	PS_FILTER_KEY_USAGE,
 
+	PS_TAGS,
+	PS_TAG,
+	PS_TAG_KEYS,
+	PS_TAG_KEY,
+	PS_TAG_VALUE_FILTER,
+	PS_TAG_VALUE_FILTER_LIST,
+
 	PS_UNEXPECTED_INPUT_TOKEN,
 	PS_FAILURE,
 };
@@ -101,12 +121,23 @@ struct tlshd_tags_filter {
 
 static GHashTable *tlshd_tags_filter_hash;
 
+struct tlshd_tags_tag {
+	gchar				*ta_name;
+	GPtrArray			*ta_filter_names;
+	GPtrArray			*ta_filters;
+
+	bool				ta_matched;
+};
+
+static GHashTable *tlshd_tags_tag_hash;
+
 struct tlshd_tags_parser_state {
 	yaml_event_t			ps_yaml_event;
 
 	enum tlshd_tags_fsm_state_index	ps_fsm_state;
 
 	struct tlshd_tags_filter	*ps_current_filter;
+	struct tlshd_tags_tag		*ps_current_tag;
 };
 
 static enum tlshd_tags_fsm_state_index
@@ -117,6 +148,8 @@ tlshd_tags_top_level(struct tlshd_tags_parser_state *current)
 
 	if (strcmp(mapping, "filters") == 0)
 		return PS_FILTERS;
+	else if (strcmp(mapping, "tags") == 0)
+		return PS_TAGS;
 
 	tlshd_log_error("Unexpected mapping name: %s\n", mapping);
 	return PS_UNEXPECTED_INPUT_TOKEN;
@@ -314,6 +347,141 @@ tlshd_tags_filter_finalize(struct tlshd_tags_parser_state *current)
 	return PS_FILTER;
 }
 
+/* --- Tags --- */
+
+static void tlshd_tags_name_free_cb(gpointer data,
+				    __attribute__ ((unused)) gpointer user_data)
+{
+	free(data);
+}
+
+static void tlshd_tags_tag_free(struct tlshd_tags_tag *tag)
+{
+	if (!tag)
+		return;
+
+	if (tlshd_debug > 3)
+		tlshd_log_debug("Removing tag '%s' from the tag hash",
+				tag->ta_name);
+
+	/* filter objects are freed separately */
+	if (tag->ta_filters)
+		g_ptr_array_free(tag->ta_filters, TRUE);
+
+	if (tag->ta_filter_names)
+		g_ptr_array_foreach(tag->ta_filter_names,
+				    tlshd_tags_name_free_cb,
+				    NULL);
+	g_ptr_array_free(tag->ta_filter_names, TRUE);
+
+	g_free(tag->ta_name);
+	g_free(tag);
+}
+
+static void tlshd_tags_tag_hash_destroy(void)
+{
+	GHashTableIter iter;
+	gpointer key, value;
+
+	if (!tlshd_tags_tag_hash)
+		return;
+
+	g_hash_table_iter_init(&iter, tlshd_tags_tag_hash);
+	while (g_hash_table_iter_next(&iter, &key, &value))
+		tlshd_tags_tag_free((struct tlshd_tags_tag *)value);
+
+	g_hash_table_destroy(tlshd_tags_tag_hash);
+	tlshd_tags_tag_hash = NULL;
+}
+
+static bool tlshd_tags_tag_hash_init(void)
+{
+	tlshd_tags_tag_hash = g_hash_table_new(g_str_hash, g_str_equal);
+	return tlshd_tags_tag_hash != NULL;
+}
+
+
+static enum tlshd_tags_fsm_state_index
+tlshd_tags_tag_create(struct tlshd_tags_parser_state *current)
+{
+	const yaml_event_t *event = &current->ps_yaml_event;
+	struct tlshd_tags_tag *tag;
+
+	tag = g_malloc0(sizeof(*tag));
+	if (!tag)
+		goto err0;
+
+	tag->ta_name = g_strdup((const gchar *)event->data.scalar.value);
+	tag->ta_filter_names = g_ptr_array_new();
+	tag->ta_filters = g_ptr_array_new();
+	if (!tag->ta_name || !tag->ta_filter_names || !tag->ta_filters)
+		goto free;
+
+	current->ps_current_tag = tag;
+	return PS_TAG_KEYS;
+
+free:
+	tlshd_tags_tag_free(tag);
+err0:
+	tlshd_log_error("Failed to allocate new tag\n");
+	return PS_FAILURE;
+}
+
+static enum tlshd_tags_fsm_state_index
+tlshd_tags_tag_key_set(struct tlshd_tags_parser_state *current)
+{
+	const yaml_event_t *event = &current->ps_yaml_event;
+	const char *key = (const char *)event->data.scalar.value;
+
+	if (strcmp(key, "filter") == 0)
+		return PS_TAG_VALUE_FILTER;
+
+	tlshd_log_error("Unexpected tag attribute: %s\n", key);
+	return PS_UNEXPECTED_INPUT_TOKEN;
+}
+
+static enum tlshd_tags_fsm_state_index
+tlshd_tags_tag_filter_add(struct tlshd_tags_parser_state *current)
+{
+	const yaml_event_t *event = &current->ps_yaml_event;
+	const char *name;
+
+	if (!current->ps_current_tag) {
+		tlshd_log_error("No current tag\n");
+		return PS_FAILURE;
+	}
+
+	name = strdup((const char *)event->data.scalar.value);
+	if (!name) {
+		tlshd_log_error("Failed to allocate filter name\n");
+		return PS_FAILURE;
+	}
+
+	g_ptr_array_add(current->ps_current_tag->ta_filter_names,
+			(gpointer)name);
+	return PS_TAG_VALUE_FILTER_LIST;
+}
+
+static enum tlshd_tags_fsm_state_index
+tlshd_tags_tag_finalize(struct tlshd_tags_parser_state *current)
+{
+	struct tlshd_tags_tag *tag = current->ps_current_tag;
+
+	if (!tag) {
+		tlshd_log_error("No current tag\n");
+		return PS_FAILURE;
+	}
+
+	if (tlshd_debug > 3)
+		tlshd_log_debug("Adding tag '%s' to the tag hash",
+				tag->ta_name);
+
+	g_hash_table_insert(tlshd_tags_tag_hash, tag->ta_name,
+			    (gpointer)tag);
+	current->ps_current_tag = NULL;
+	return PS_TAG;
+}
+
 /* --- FSM states --- */
 
 typedef enum tlshd_tags_fsm_state_index
@@ -391,6 +559,33 @@ static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_filter_key_
 	NEXT_STATE(YAML_SEQUENCE_END_EVENT, PS_FILTER_KEY),
 };
 
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_tags[] = {
+	NEXT_STATE(YAML_MAPPING_START_EVENT, PS_TAG),
+};
+
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_tag[] = {
+	NEXT_ACTION(YAML_SCALAR_EVENT, tlshd_tags_tag_create),
+	NEXT_STATE(YAML_MAPPING_END_EVENT, PS_TOP_LEVEL),
+};
+
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_tag_keys[] = {
+	NEXT_STATE(YAML_MAPPING_START_EVENT, PS_TAG_KEY),
+};
+
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_tag_key[] = {
+	NEXT_ACTION(YAML_SCALAR_EVENT, tlshd_tags_tag_key_set),
+	NEXT_ACTION(YAML_MAPPING_END_EVENT, tlshd_tags_tag_finalize),
+};
+
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_tag_value_filter[] = {
+	NEXT_STATE(YAML_SEQUENCE_START_EVENT, PS_TAG_VALUE_FILTER_LIST),
+};
+
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_tag_value_filter_list[] = {
+	NEXT_ACTION(YAML_SCALAR_EVENT, tlshd_tags_tag_filter_add),
+	NEXT_STATE(YAML_SEQUENCE_END_EVENT, PS_TAG_KEY),
+};
+
 struct tlshd_tags_fsm_state {
 	const char			*ts_name;
 	const struct tlshd_tags_fsm_transition *ts_transitions;
@@ -424,6 +619,12 @@ static const struct tlshd_tags_fsm_state tlshd_tags_fsm_state_table[] = {
 	FSM_STATE(PS_FILTER_PATTERN_VALUE, tlshd_tags_transitions_filter_pattern_value),
 	FSM_STATE(PS_FILTER_PURPOSE_LIST, tlshd_tags_transitions_filter_purpose_list),
 	FSM_STATE(PS_FILTER_KEY_USAGE, tlshd_tags_transitions_filter_key_usage),
+	FSM_STATE(PS_TAGS, tlshd_tags_transitions_tags),
+	FSM_STATE(PS_TAG, tlshd_tags_transitions_tag),
+	FSM_STATE(PS_TAG_KEYS, tlshd_tags_transitions_tag_keys),
+	FSM_STATE(PS_TAG_KEY, tlshd_tags_transitions_tag_key),
+	FSM_STATE(PS_TAG_VALUE_FILTER, tlshd_tags_transitions_tag_value_filter),
+	FSM_STATE(PS_TAG_VALUE_FILTER_LIST, tlshd_tags_transitions_tag_value_filter_list),
 	TERMINAL_STATE(PS_UNEXPECTED_INPUT_TOKEN),
 	TERMINAL_STATE(PS_FAILURE),
 };
@@ -547,8 +748,98 @@ static bool tlshd_tags_read_directory(const char *tagsdir)
 	return true;
 }
 
+static void tlshd_tags_filter_name_find_cb(gpointer data, gpointer user_data)
+{
+	struct tlshd_tags_tag *tag = (struct tlshd_tags_tag *)user_data;
+	gconstpointer key = (gconstpointer)data;
+	gpointer filter;
+
+	filter = g_hash_table_lookup(tlshd_tags_filter_hash, key);
+	if (!filter) {
+		tlshd_log_debug("Filter '%s' in tag '%s' not found",
+				(const char *)key, tag->ta_name);
+		return;
+	}
+	g_ptr_array_add(tag->ta_filters, filter);
+}
+
+/*
+ * To make the tag YAML documents fully declarative, we have to wait
+ * until the tag_hash and filter_hash hashes have been fully parsed
+ * before matching up the filter names in the tags to struct filters
+ * in the ta_filters arrays.
+ */
+static void tlshd_tags_config_finalize(void)
+{
+	GHashTableIter iter;
+	gpointer key, value;
+
+	g_hash_table_iter_init(&iter, tlshd_tags_tag_hash);
+	while (g_hash_table_iter_next(&iter, &key, &value)) {
+		struct tlshd_tags_tag *tag = (struct tlshd_tags_tag *)value;
+
+		g_ptr_array_foreach(tag->ta_filter_names,
+				    tlshd_tags_filter_name_find_cb, (gpointer)tag);
+	}
+}
+
 /* --- Filter Types --- */
 
+static bool
+tlshd_tags_filter_type_validate_pattern(struct tlshd_tags_filter *filter)
+{
+	if (!filter->fi_pattern) {
+		tlshd_log_error("Filter '%s' is missing a pattern.",
+				filter->fi_name);
+		return false;
+	}
+	filter->fi_pattern_spec = g_pattern_spec_new(filter->fi_pattern);
+	if (!filter->fi_pattern_spec) {
+		tlshd_log_error("Filter '%s' failed to compile.",
+				filter->fi_name);
+		return false;
+	}
+
+	if (filter->fi_purpose_mask != 0)
+		tlshd_log_error("Filter '%s' key usage purpose is extraneous.",
+				filter->fi_name);
+	return true;
+}
+
+static bool
+tlshd_tags_filter_type_validate_purpose(struct tlshd_tags_filter *filter)
+{
+	if (filter->fi_purpose_mask == 0) {
+		tlshd_log_error("Filter '%s' is missing a key usage purpose.",
+				filter->fi_name);
+		return false;
+	}
+	if (filter->fi_pattern)
+		tlshd_log_error("Filter '%s' pattern is extraneous.",
+				filter->fi_name);
+	return true;
+}
+
+static bool
+tlshd_tags_filter_type_validate_time(struct tlshd_tags_filter *filter)
+{
+	struct tm tm;
+	char *ret;
+
+	memset(&tm, 0, sizeof(tm));
+	ret = strptime(filter->fi_pattern, "%Y-%m-%d %H:%M:%S", &tm);
+	if (!ret) {
+		tlshd_log_error("Failed to convert notbefore time.");
+		return false;
+	}
+	filter->fi_time = mktime(&tm);
+
+	if (filter->fi_purpose_mask != 0)
+		tlshd_log_error("Filter '%s' key usage purpose is extraneous.",
+				filter->fi_name);
+	return true;
+}
+
 static const struct tlshd_tags_filter_type tlshd_tags_static_filter_types[] = {
 
 	/* Certificate fields, RFC 5280, Section 4.1.1 */
@@ -567,6 +858,7 @@ static const struct tlshd_tags_filter_type tlshd_tags_static_filter_types[] = {
 	{
 		/* RFC 5280, Section 4.1.2.2 */
 		.ft_name		= "x509.tbs.serialNumber",
+		.ft_validate		= tlshd_tags_filter_type_validate_pattern,
 	},
 	{
 		/* RFC 5280, Section 4.1.2.3 */
@@ -575,18 +867,22 @@ static const struct tlshd_tags_filter_type tlshd_tags_static_filter_types[] = {
 	{
 		/* RFC 5280, Section 4.1.2.4 */
 		.ft_name		= "x509.tbs.issuer",
+		.ft_validate		= tlshd_tags_filter_type_validate_pattern,
 	},
 	{
 		/* RFC 5280, Section 4.1.2.5 */
 		.ft_name		= "x509.tbs.validity.notBefore",
+		.ft_validate		= tlshd_tags_filter_type_validate_time,
 	},
 	{
 		/* RFC 5280, Section 4.1.2.5 */
 		.ft_name		= "x509.tbs.validity.notAfter",
+		.ft_validate		= tlshd_tags_filter_type_validate_time,
 	},
 	{
 		/* RFC 5280, Section 4.1.2.6 */
 		.ft_name		= "x509.tbs.subject",
+		.ft_validate		= tlshd_tags_filter_type_validate_pattern,
 	},
 
 	/* Standard certificate extensions, RFC 5280, Section 4.2.1 */
@@ -594,6 +890,7 @@ static const struct tlshd_tags_filter_type tlshd_tags_static_filter_types[] = {
 	{
 		/* RFC 5280, Section 4.2.1.3 */
 		.ft_name		= "x509.extension.keyUsage",
+		.ft_validate		= tlshd_tags_filter_type_validate_purpose,
 	},
 	{
 		/* RFC 5280, Secttion 4.2.1.12 */
@@ -605,6 +902,7 @@ static const struct tlshd_tags_filter_type tlshd_tags_static_filter_types[] = {
 	{
 		/* Locally implemented */
 		.ft_name		= "x509.derived.fingerprint",
+		.ft_validate		= tlshd_tags_filter_type_validate_pattern,
 	},
 	{
 		/* Locally implemented */
@@ -660,12 +958,17 @@ void tlshd_tags_config_init(const char *tagsdir)
 		return;
 	if (!tlshd_tags_filter_hash_init())
 		goto filter_type_hash;
+	if (!tlshd_tags_tag_hash_init())
+		goto filter_hash;
 
 	if (!tlshd_tags_read_directory(tagsdir))
-		goto filter_hash;
+		goto tag_hash;
 
+	tlshd_tags_config_finalize();
 	return;
 
+tag_hash:
+	tlshd_tags_tag_hash_destroy();
 filter_hash:
 	tlshd_tags_filter_hash_destroy();
 filter_type_hash:
@@ -678,6 +981,7 @@ filter_type_hash:
  */
 void tlshd_tags_config_shutdown(void)
 {
+	tlshd_tags_tag_hash_destroy();
 	tlshd_tags_filter_hash_destroy();
 	tlshd_tags_filter_type_hash_destroy();
 }



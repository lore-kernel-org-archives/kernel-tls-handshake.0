Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4DD1A76B1
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Aug 2025 19:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754507131; cv=none; b=cdeN1iK5MgwTrrn0G0O9OW2fO3wZb72be4waYeSVraVSLRm7pEoCKJBZjHMMPAISVhtPVBakGUDY0rZmgu+hpnt0UNzUFDeUtEr8jUwXVnvus8BNaCihbNBE9WHf5SLAYmlAQ52UB80HkNAVlKI01CofPJClZyRDPepxTap+5b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754507131; c=relaxed/simple;
	bh=CAE1QsO6t2iZv0jmVqJbrgXUWUg4+TnaiZmsHo4o49Q=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BaDfCTpO2hPtFtIEm72qLTfsDFKJ3QYkmdhUKUoWNC7t5a256s4nA4gqdXKb1RM6EdS7RVfhN66123WKhiUzHl37v9fGVOoh+3UX4evcbx9F10UJtMSoHhT98mxNx/ItMxBAHIgX1wqOfph0/XNWglMjyf5hcOSC9Ok1dYZBvhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAs/7ap8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAs/7ap8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4480BC4CEE7
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Aug 2025 19:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754507130;
	bh=CAE1QsO6t2iZv0jmVqJbrgXUWUg4+TnaiZmsHo4o49Q=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=CAs/7ap8p2mjxhrn9avnxZ4MxUVh2fMpyhQXiRR6V7f0lNUxc9Qmt4re7BZBu3Y7Y
	 ZtPLFw6BvXS2sTksUMtEa7uT6I2tR64eAJH0f2xHzr9u5RxsILVTJOKqAUFL5jyRZm
	 ZrATUBGVT1Rny2fuXvyunGcwbb0troexHStUK/tEK0dfMW8UJR6A5yH6616nUpoYVy
	 /EAqPfuVQQzs52WyOruU3cUfoj/rJFbKAhrvwDWhRwBH4NeE0p0cA8dW2bSFkMLMxi
	 6QGV7pF2Z4zWxvlptWgZM0eNk9OxO4hoWi3zdUGY2TMKbQ8XX1d+luGFPPn1uXsaLZ
	 LjJD7RqmI3PhQ==
Subject: [PATCH 4/8] tlshd: Read TLS session tag configuration information
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Wed, 06 Aug 2025 15:05:29 -0400
Message-ID: 
 <175450712934.1882.9202961996822864492.stgit@91.116.238.104.host.secureserver.net>
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
 src/tlshd/Makefile.am |    5 
 src/tlshd/config.c    |    3 
 src/tlshd/tags.c      | 1008 +++++++++++++++++++++++++++++++++++++++++++++++++
 src/tlshd/tlshd.h     |    4 
 4 files changed, 1018 insertions(+), 2 deletions(-)
 create mode 100644 src/tlshd/tags.c

diff --git a/src/tlshd/Makefile.am b/src/tlshd/Makefile.am
index 1150c168e62f..288aec89c59f 100644
--- a/src/tlshd/Makefile.am
+++ b/src/tlshd/Makefile.am
@@ -23,8 +23,9 @@ sbin_PROGRAMS		= tlshd
 tlshd_CFLAGS		= -Werror -Wall -Wextra $(LIBGNUTLS_CFLAGS) \
 			  $(LIBKEYUTILS_CFLAGS) $(GLIB_CFLAGS) $(LIBNL3_CFLAGS) \
 			  $(LIBNL_GENL3_CFLAGS) $(LIBYAML_CFLAGS)
-tlshd_SOURCES		= client.c config.c handshake.c keyring.c ktls.c log.c \
-			  main.c netlink.c netlink.h server.c tlshd.h quic.c
+tlshd_SOURCES		= client.c config.c handshake.c keyring.c ktls.c \
+			  log.c main.c netlink.c netlink.h quic.c server.c \
+			  tags.c tlshd.h
 tlshd_LDADD		= $(LIBGNUTLS_LIBS) $(LIBKEYUTILS_LIBS) $(GLIB_LIBS) \
 			  $(LIBNL3_LIBS) $(LIBNL_GENL3_LIBS) $(LIBYAML_LIBS)
 
diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index 4c54d371ca32..ac91035115bc 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -106,11 +106,14 @@ bool tlshd_config_init(const gchar *pathname)
 	tlshd_keyring_link_session(".nfs");
 	tlshd_keyring_link_session(".nfsd");
 
+	/* Eventually the tags directory might become a tlshd config option */
+	tlshd_tags_read_configuration("/etc/tlshd/tags.d");
 	return true;
 }
 
 void tlshd_config_shutdown(void)
 {
+	tlshd_tags_shutdown();
 	g_key_file_free(tlshd_configuration);
 }
 
diff --git a/src/tlshd/tags.c b/src/tlshd/tags.c
new file mode 100644
index 000000000000..b929beff6f58
--- /dev/null
+++ b/src/tlshd/tags.c
@@ -0,0 +1,1008 @@
+/*
+ * Manage handshake tagging
+ *
+ * Copyright (c) 2025 Oracle and/or its affiliates.
+ *
+ * ktls-utils is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; version 2.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
+ * 02110-1301, USA.
+ */
+
+#include "config.h"
+
+#include <sys/types.h>
+#include <sys/socket.h>
+#include <sys/stat.h>
+#include <sys/syscall.h>
+
+#include <stdbool.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <fcntl.h>
+#include <errno.h>
+#include <string.h>
+#include <libgen.h>
+#include <keyutils.h>
+
+#include <gnutls/gnutls.h>
+#include <gnutls/x509.h>
+#include <gnutls/abstract.h>
+
+#include <glib.h>
+#include <yaml.h>
+
+#include "tlshd.h"
+
+/* --- libyaml helpers --- */
+
+enum yaml_status {
+	YAML_FAILURE = 0,
+	YAML_SUCCESS = 1,
+};
+
+static const char *show_yaml_event_type(const yaml_event_t *event)
+{
+	const char *name;
+
+	switch (event->type) {
+	case YAML_NO_EVENT:
+		name = "YAML_NO_EVENT";				break;
+	case YAML_STREAM_START_EVENT:
+		name = "YAML_STREAM_START_EVENT";		break;
+	case YAML_STREAM_END_EVENT:
+		name = "YAML_STREAM_END_EVENT";			break;
+	case YAML_DOCUMENT_START_EVENT:
+		name = "YAML_DOCUMENT_START_EVENT";		break;
+	case YAML_DOCUMENT_END_EVENT:
+		name = "YAML_DOCUMENT_END_EVENT";		break;
+	case YAML_ALIAS_EVENT:
+		name = "YAML_ALIAS_EVENT";			break;
+	case YAML_SCALAR_EVENT:
+		name = "YAML_SCALAR_EVENT";			break;
+	case YAML_SEQUENCE_START_EVENT:
+		name = "YAML_SEQUENCE_START_EVENT";		break;
+	case YAML_SEQUENCE_END_EVENT:
+		name = "YAML_SEQUENCE_END_EVENT";		break;
+	case YAML_MAPPING_START_EVENT:
+		name = "YAML_MAPPING_START_EVENT";		break;
+	case YAML_MAPPING_END_EVENT:
+		name = "YAML_MAPPING_END_EVENT";		break;
+	default:
+		name = "invalid YAML event";
+	}
+	return name;
+}
+
+/* --- Tag configuration file parsing --- */
+
+enum tlshd_tags_parser_state {
+	PS_STOP,
+	PS_START,
+	PS_STREAM,
+	PS_DOCUMENT,
+	PS_MAPPINGS,
+
+	PS_FILTERS,
+	PS_FILTER,
+	PS_FILTER_KEYS,
+	PS_FILTER_KEY,
+	PS_FILTER_FIELD_VALUE,
+	PS_FILTER_TYPE_VALUE,
+	PS_FILTER_EXPRESSION_VALUE,
+	PS_FILTER_KEY_USAGE,
+
+	PS_TAGS,
+	PS_TAG,
+	PS_TAG_KEYS,
+	PS_TAG_KEY,
+	PS_TAG_VALUE_FILTER,
+	PS_TAG_VALUE_FILTER_LIST,
+
+	PS_UNEXPECTED_INPUT_TOKEN,
+	PS_UNEXPECTED_YAML_EVENT,
+	PS_FAILURE,
+};
+
+static enum tlshd_tags_parser_state ps_state;
+
+static const char *show_parser_state(void)
+{
+	char *name;
+
+	switch (ps_state) {
+	case PS_STOP:
+		name = "PS_STOP";			break;
+	case PS_START:
+		name = "PS_START";			break;
+	case PS_STREAM:
+		name = "PS_STREAM";			break;
+	case PS_DOCUMENT:
+		name = "PS_DOCUMENT";			break;
+	case PS_MAPPINGS:
+		name = "PS_MAPPINGS";			break;
+	case PS_FILTERS:
+		name = "PS_FILTERS";			break;
+	case PS_FILTER:
+		name = "PS_FILTER";			break;
+	case PS_FILTER_KEYS:
+		name = "PS_FILTER_KEYS";		break;
+	case PS_FILTER_KEY:
+		name = "PS_FILTER_KEY";		break;
+	case PS_FILTER_FIELD_VALUE:
+		name = "PS_FILTER_FIELD_VALUE";	break;
+	case PS_FILTER_TYPE_VALUE:
+		name = "PS_FILTER_TYPE_VALUE";		break;
+	case PS_FILTER_EXPRESSION_VALUE:
+		name = "PS_FILTER_EXPRESSION_VALUE";	break;
+	case PS_FILTER_KEY_USAGE:
+		name = "PS_FILTER_KEY_USAGE";		break;
+	case PS_TAGS:
+		name = "PS_TAGS";			break;
+	case PS_TAG:
+		name = "PS_TAG";			break;
+	case PS_TAG_KEYS:
+		name = "PS_TAG_KEYS";			break;
+	case PS_TAG_KEY:
+		name = "PS_TAG_KEY";			break;
+	case PS_TAG_VALUE_FILTER:
+		name = "PS_TAG_VALUE_FILTER";		break;
+	case PS_TAG_VALUE_FILTER_LIST:
+		name = "PS_TAG_VALUE_FILTER_LIST";	break;
+	case PS_UNEXPECTED_INPUT_TOKEN:
+		name = "PS_UNEXPECTED_INPUT_TOKEN";	break;
+	case PS_UNEXPECTED_YAML_EVENT:
+		name = "PS_UNEXPECTED_YAML_EVENT";	break;
+	case PS_FAILURE:
+		name = "PS_FAILURE";			break;
+	default:
+		name = "not valid";
+	}
+	return name;
+}
+
+static void tlshd_tags_parser_advance(enum tlshd_tags_parser_state state)
+{
+	ps_state = state;
+}
+
+enum tlshd_tags_match_type {
+	TAG_MATCH_UNSET,
+	TAG_MATCH_EXACT,
+	TAG_MATCH_WILDCARD,
+	TAG_MATCH_REGEX,
+	TAG_MATCH_KEY_USAGE,
+};
+
+struct tlshd_tags_filter {
+	char				*fi_name;
+	char				*fi_field;
+	enum tlshd_tags_match_type	fi_match_type;
+	union {
+		char				*fi_expression;
+		GPatternSpec			*fi_pattern;
+		unsigned int			fi_key_usage;
+	};
+};
+
+static struct tlshd_tags_filter *tlshd_tags_filter_current;
+static GPtrArray *tlshd_tags_filter_all;
+
+static void tlshd_tags_filter_free(struct tlshd_tags_filter *filter)
+{
+	if (!filter)
+		return;
+
+	switch (filter->fi_match_type) {
+	case TAG_MATCH_EXACT:
+		free(filter->fi_expression);
+		break;
+	case TAG_MATCH_WILDCARD:
+	case TAG_MATCH_REGEX:
+		g_pattern_spec_free(filter->fi_pattern);
+		break;
+	default:
+		break;
+	}
+
+	free(filter->fi_field);
+	free(filter->fi_name);
+	free(filter);
+}
+
+static void tlshd_tags_filter_create(const yaml_event_t *event)
+{
+	struct tlshd_tags_filter *filter;
+
+	filter = calloc(1, sizeof(*filter));
+	if (!filter) {
+		tlshd_log_error("Failed to allocate new filter\n");
+		tlshd_tags_parser_advance(PS_FAILURE);
+		return;
+	}
+
+	filter->fi_name = strdup((const char *)event->data.scalar.value);
+	if (!filter->fi_name) {
+		free(filter);
+		tlshd_log_error("Failed to allocate new filter\n");
+		tlshd_tags_parser_advance(PS_FAILURE);
+		return;
+	}
+
+	tlshd_tags_filter_current = filter;
+	tlshd_tags_filter_current->fi_match_type = TAG_MATCH_UNSET;
+	tlshd_tags_parser_advance(PS_FILTER_KEYS);
+}
+
+static void tlshd_tags_mappings_start(const yaml_event_t *event)
+{
+	const char *mapping = (const char *)event->data.scalar.value;
+
+	if (strcmp(mapping, "filters") == 0)
+		tlshd_tags_parser_advance(PS_FILTERS);
+	else if (strcmp(mapping, "tags") == 0)
+		tlshd_tags_parser_advance(PS_TAGS);
+	else {
+		tlshd_log_error("Unexpected mapping name: %s\n", mapping);
+		tlshd_tags_parser_advance(PS_UNEXPECTED_INPUT_TOKEN);
+	}
+}
+
+static void tlshd_tags_filter_field_add(const yaml_event_t *event)
+{
+	const char *name = (const char *)event->data.scalar.value;
+
+	if (tlshd_tags_filter_current->fi_field) {
+		tlshd_log_error("Filter name already set: %s\n", name);
+		tlshd_tags_parser_advance(PS_FAILURE);
+		return;
+	}
+
+	tlshd_tags_filter_current->fi_field = strdup(name);
+	if (!tlshd_tags_filter_current->fi_field) {
+		tlshd_log_error("Failed to allocate filter name\n");
+		tlshd_tags_parser_advance(PS_FAILURE);
+		return;
+	}
+
+	tlshd_tags_parser_advance(PS_FILTER_KEY);
+}
+
+static void tlshd_tags_filter_key_set(const yaml_event_t *event)
+{
+	const char *key = (const char *)event->data.scalar.value;
+
+	if (strcmp(key, "field") == 0)
+		tlshd_tags_parser_advance(PS_FILTER_FIELD_VALUE);
+	else if (strcmp(key, "type") == 0)
+		tlshd_tags_parser_advance(PS_FILTER_TYPE_VALUE);
+	else if (strcmp(key, "expression") == 0)
+		tlshd_tags_parser_advance(PS_FILTER_EXPRESSION_VALUE);
+	else {
+		tlshd_log_error("Unexpected token: %s\n", key);
+		tlshd_tags_parser_advance(PS_UNEXPECTED_INPUT_TOKEN);
+	}
+}
+
+static void tlshd_tags_filter_type_set(const yaml_event_t *event)
+{
+	const char *type = (const char *)event->data.scalar.value;
+
+	if (tlshd_tags_filter_current->fi_match_type != TAG_MATCH_UNSET) {
+		tlshd_log_error("Filter type already specified\n");
+		tlshd_tags_parser_advance(PS_FAILURE);
+		return;
+	}
+
+	if (strcmp(type, "exact") == 0) {
+		tlshd_tags_filter_current->fi_match_type = TAG_MATCH_EXACT;
+	} else if (strcmp(type, "wildcard") == 0) {
+		tlshd_tags_filter_current->fi_match_type = TAG_MATCH_WILDCARD;
+	} else if (strcmp(type, "regex") == 0) {
+		tlshd_tags_filter_current->fi_match_type = TAG_MATCH_REGEX;
+	} else if (strcmp(type, "list") == 0) {
+		tlshd_tags_filter_current->fi_match_type = TAG_MATCH_KEY_USAGE;
+	} else {
+		tlshd_log_error("Unexpected filter type: %s\n", type);
+		tlshd_tags_parser_advance(PS_UNEXPECTED_INPUT_TOKEN);
+	}
+
+	tlshd_tags_parser_advance(PS_FILTER_KEY);
+}
+
+static void tlshd_tags_filter_expression_set(const yaml_event_t *event)
+{
+	const char *expression = (const char *)event->data.scalar.value;
+
+	switch (tlshd_tags_filter_current->fi_match_type) {
+	case TAG_MATCH_EXACT:
+		tlshd_tags_filter_current->fi_expression = strdup(expression);
+		if (!tlshd_tags_filter_current->fi_expression) {
+			tlshd_log_error("Failed to allocate filter expression\n");
+			tlshd_tags_parser_advance(PS_FAILURE);
+			break;
+		}
+		tlshd_tags_parser_advance(PS_FILTER_KEY);
+		break;
+	case TAG_MATCH_WILDCARD:
+	case TAG_MATCH_REGEX:
+		tlshd_tags_filter_current->fi_pattern = g_pattern_spec_new(expression);
+		if (!tlshd_tags_filter_current->fi_pattern) {
+			tlshd_log_error("Failed to allocate filter pattern\n");
+			tlshd_tags_parser_advance(PS_FAILURE);
+			break;
+		}
+		tlshd_tags_parser_advance(PS_FILTER_KEY);
+		break;
+	default:
+		tlshd_log_error("Incorrect filter type\n");
+		tlshd_tags_parser_advance(PS_FAILURE);
+		break;
+	}
+}
+
+static void tlshd_tags_filter_key_usage_set(const yaml_event_t *event)
+{
+	const char *name = (const char *)event->data.scalar.value;
+	unsigned int key_usage = 0;
+
+	if (strcmp(name, "digitalSignature") == 0)
+		key_usage = GNUTLS_KEY_DIGITAL_SIGNATURE;
+	else if (strcmp(name, "nonRepudiation") == 0)
+		key_usage = GNUTLS_KEY_DIGITAL_SIGNATURE;
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
+		tlshd_tags_parser_advance(PS_UNEXPECTED_INPUT_TOKEN);
+		return;
+	}
+
+	tlshd_tags_filter_current->fi_key_usage |= key_usage;
+	tlshd_tags_parser_advance(PS_FILTER_KEY_USAGE);
+}
+
+static void tlshd_tags_filter_finalize(void)
+{
+	if (tlshd_debug > 3)
+		tlshd_log_debug("Adding filter '%s' to filter list",
+				tlshd_tags_filter_current->fi_name);
+
+	g_ptr_array_add(tlshd_tags_filter_all, (gpointer)tlshd_tags_filter_current);
+	tlshd_tags_filter_current = NULL;
+	tlshd_tags_parser_advance(PS_MAPPINGS);
+}
+
+struct tlshd_tags_tag {
+	char				*ta_name;
+	GPtrArray			*ta_filter_names;
+	GPtrArray			*ta_filters;
+
+	bool				ta_matched;
+};
+
+static struct tlshd_tags_tag *tlshd_tags_tag_current;
+static GPtrArray *tlshd_tags_tag_all;
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
+	free(tag->ta_name);
+	free(tag);
+}
+
+static void tlshd_tags_tag_create(const yaml_event_t *event)
+{
+	struct tlshd_tags_tag *tag;
+
+	tag = calloc(1, sizeof(*tag));
+	if (!tag)
+		goto err0;
+
+	tag->ta_name = strdup((const char *)event->data.scalar.value);
+	tag->ta_filter_names = g_ptr_array_new();
+	tag->ta_filters = g_ptr_array_new();
+	if (!tag->ta_name || !tag->ta_filter_names || !tag->ta_filters)
+		goto free;
+
+	tlshd_tags_tag_current = tag;
+	tlshd_tags_parser_advance(PS_TAG_KEYS);
+	return;
+
+free:
+	tlshd_tags_tag_free(tag);
+err0:
+	tlshd_log_error("Failed to allocate new tag\n");
+	tlshd_tags_parser_advance(PS_FAILURE);
+}
+
+static void tlshd_tags_tag_key_set(const yaml_event_t *event)
+{
+	const char *key = (const char *)event->data.scalar.value;
+
+	if (strcmp(key, "filter") == 0)
+		tlshd_tags_parser_advance(PS_TAG_VALUE_FILTER);
+	else {
+		tlshd_log_error("Unexpected tag attribute: %s\n", key);
+		tlshd_tags_parser_advance(PS_UNEXPECTED_INPUT_TOKEN);
+	}
+}
+
+static void tlshd_tags_tag_filter_add(const yaml_event_t *event)
+{
+	const char *name;
+
+	name = strdup((const char *)event->data.scalar.value);
+	if (!name) {
+		tlshd_log_error("Failed to allocate filter name\n");
+		tlshd_tags_parser_advance(PS_FAILURE);
+		return;
+	}
+
+	g_ptr_array_add(tlshd_tags_tag_current->ta_filters,
+			(gpointer)name);
+	tlshd_tags_parser_advance(PS_TAG_VALUE_FILTER_LIST);
+}
+
+static void tlshd_tags_tag_finalize(void)
+{
+	if (tlshd_debug > 3)
+		tlshd_log_debug("Adding tag '%s' to tag list",
+				tlshd_tags_tag_current->ta_name);
+
+	g_ptr_array_add(tlshd_tags_tag_all, (gpointer)tlshd_tags_tag_current);
+	tlshd_tags_tag_current = NULL;
+	tlshd_tags_parser_advance(PS_MAPPINGS);
+}
+
+/* --- FSM states --- */
+
+static void tlsh_tags_parser_start(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_STREAM_START_EVENT:
+		tlshd_tags_parser_advance(PS_STREAM);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+static void tlsh_tags_parser_stream(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_DOCUMENT_START_EVENT:
+		tlshd_tags_parser_advance(PS_DOCUMENT);
+		break;
+	case YAML_STREAM_END_EVENT:
+		tlshd_tags_parser_advance(PS_STOP);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+static void tlsh_tags_parser_document(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_MAPPING_START_EVENT:
+		tlshd_tags_parser_advance(PS_MAPPINGS);
+		break;
+	case YAML_DOCUMENT_END_EVENT:
+		tlshd_tags_parser_advance(PS_STREAM);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+static void tlsh_tags_parser_mappings(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_SCALAR_EVENT:
+		tlshd_tags_mappings_start(event);
+		break;
+	case YAML_MAPPING_END_EVENT:
+		tlshd_tags_parser_advance(PS_DOCUMENT);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+static void tlsh_tags_parser_filters(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_MAPPING_START_EVENT:
+		tlshd_tags_parser_advance(PS_FILTER);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+static void tlsh_tags_parser_filter(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_SCALAR_EVENT:
+		tlshd_tags_filter_create(event);
+		break;
+	case YAML_MAPPING_END_EVENT:
+		tlshd_tags_parser_advance(PS_MAPPINGS);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+static void tlsh_tags_parser_filter_keys(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_MAPPING_START_EVENT:
+		tlshd_tags_parser_advance(PS_FILTER_KEY);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+static void tlsh_tags_parser_filter_key(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_SCALAR_EVENT:
+		tlshd_tags_filter_key_set(event);
+		break;
+	case YAML_MAPPING_END_EVENT:
+		tlshd_tags_filter_finalize();
+		tlshd_tags_parser_advance(PS_FILTER);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+static void tlsh_tags_parser_filter_field_value(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_SCALAR_EVENT:
+		tlshd_tags_filter_field_add(event);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+static void tlsh_tags_parser_filter_type_value(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_SCALAR_EVENT:
+		tlshd_tags_filter_type_set(event);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+static void tlsh_tags_parser_filter_expression_value(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_SCALAR_EVENT:
+		tlshd_tags_filter_expression_set(event);
+		break;
+	case YAML_SEQUENCE_START_EVENT:
+		tlshd_tags_parser_advance(PS_FILTER_KEY_USAGE);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+static void tlsh_tags_parser_filter_key_usage(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_SCALAR_EVENT:
+		tlshd_tags_filter_key_usage_set(event);
+		break;
+	case YAML_SEQUENCE_END_EVENT:
+		tlshd_tags_parser_advance(PS_FILTER_KEY);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+static void tlsh_tags_parser_tags(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_MAPPING_START_EVENT:
+		tlshd_tags_parser_advance(PS_TAG);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+static void tlsh_tags_parser_tag(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_SCALAR_EVENT:
+		tlshd_tags_tag_create(event);
+		break;
+	case YAML_MAPPING_END_EVENT:
+		tlshd_tags_parser_advance(PS_MAPPINGS);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+static void tlsh_tags_parser_tag_keys(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_MAPPING_START_EVENT:
+		tlshd_tags_parser_advance(PS_TAG_KEY);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+static void tlsh_tags_parser_tag_key(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_SCALAR_EVENT:
+		tlshd_tags_tag_key_set(event);
+		break;
+	case YAML_MAPPING_END_EVENT:
+		tlshd_tags_tag_finalize();
+		tlshd_tags_parser_advance(PS_TAG);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+static void tlsh_tags_parser_tag_value_filter(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_SEQUENCE_START_EVENT:
+		tlshd_tags_parser_advance(PS_TAG_VALUE_FILTER_LIST);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+static void tlsh_tags_parser_tag_value_filter_list(const yaml_event_t *event)
+{
+	switch (event->type) {
+	case YAML_SCALAR_EVENT:
+		tlshd_tags_tag_filter_add(event);
+		break;
+	case YAML_SEQUENCE_END_EVENT:
+		tlshd_tags_parser_advance(PS_TAG_KEY);
+		break;
+	default:
+		tlshd_tags_parser_advance(PS_UNEXPECTED_YAML_EVENT);
+	}
+}
+
+/*
+ * Each libyaml event produces zero or one input tokens.
+ *
+ * tlshd_tags_process_yaml_event() evaluates the event token based on
+ * the current parser state, then advances to the next FSM state.
+ * Parser state is global.
+ */
+static void tlshd_tags_process_yaml_event(yaml_event_t *event)
+{
+	if (tlshd_debug > 3)
+		tlshd_log_debug("ps_state=%s yaml event=%s",
+			show_parser_state(),
+			show_yaml_event_type(event));
+
+	switch (ps_state) {
+	case PS_STOP:
+		break;	/* Successful completion */
+	case PS_START:
+		tlsh_tags_parser_start(event);				break;
+	case PS_STREAM:
+		tlsh_tags_parser_stream(event);				break;
+	case PS_DOCUMENT:
+		tlsh_tags_parser_document(event);			break;
+	case PS_MAPPINGS:
+		tlsh_tags_parser_mappings(event);			break;
+	case PS_FILTERS:
+		tlsh_tags_parser_filters(event);			break;
+	case PS_FILTER:
+		tlsh_tags_parser_filter(event);				break;
+	case PS_FILTER_KEYS:
+		tlsh_tags_parser_filter_keys(event);			break;
+	case PS_FILTER_KEY:
+		tlsh_tags_parser_filter_key(event);			break;
+	case PS_FILTER_FIELD_VALUE:
+		tlsh_tags_parser_filter_field_value(event);		break;
+	case PS_FILTER_TYPE_VALUE:
+		tlsh_tags_parser_filter_type_value(event);		break;
+	case PS_FILTER_EXPRESSION_VALUE:
+		tlsh_tags_parser_filter_expression_value(event);	break;
+	case PS_FILTER_KEY_USAGE:
+		tlsh_tags_parser_filter_key_usage(event);		break;
+	case PS_TAGS:
+		tlsh_tags_parser_tags(event);				break;
+	case PS_TAG:
+		tlsh_tags_parser_tag(event);				break;
+	case PS_TAG_KEYS:
+		tlsh_tags_parser_tag_keys(event);			break;
+	case PS_TAG_KEY:
+		tlsh_tags_parser_tag_key(event);			break;
+	case PS_TAG_VALUE_FILTER:
+		tlsh_tags_parser_tag_value_filter(event);		break;
+	case PS_TAG_VALUE_FILTER_LIST:
+		tlsh_tags_parser_tag_value_filter_list(event);		break;
+
+	case PS_FAILURE:
+		break;
+	case PS_UNEXPECTED_YAML_EVENT:
+		tlshd_log_debug("ps_state=%s, unexpected event: %s\n",
+			show_parser_state(),
+			show_yaml_event_type(event));
+		tlshd_tags_parser_advance(PS_FAILURE);
+		break;
+	case PS_UNEXPECTED_INPUT_TOKEN:
+		tlshd_tags_parser_advance(PS_FAILURE);
+		break;
+	default:
+		tlshd_log_debug("Unknown parser FSM state: %d\n", ps_state);
+		tlshd_tags_parser_advance(PS_FAILURE);
+	}
+}
+
+static void tlshd_tags_parse_one_file(FILE *fh)
+{
+	yaml_parser_t parser;
+
+	if (yaml_parser_initialize(&parser) != YAML_SUCCESS) {
+		tlshd_log_error("Failed to initialize parser!\n");
+		return;
+	}
+	yaml_parser_set_input_file(&parser, fh);
+
+	tlshd_tags_parser_advance(PS_START);
+	while (true) {
+		yaml_event_t event;
+
+		if (yaml_parser_parse(&parser, &event) != YAML_SUCCESS) {
+			tlshd_log_error("Parser error %d\n", parser.error);
+			break;
+		}
+		tlshd_tags_process_yaml_event(&event);
+		yaml_event_delete(&event);
+
+		if (ps_state == PS_STOP)
+			break;
+		if (ps_state == PS_FAILURE) {
+			tlshd_log_error("Failed to parse session tag configuration\n");
+			break;
+		}
+	}
+
+	tlshd_tags_tag_free(tlshd_tags_tag_current);
+	tlshd_tags_filter_free(tlshd_tags_filter_current);
+
+	yaml_parser_delete(&parser);
+}
+
+static bool tlshd_tags_yaml_extension(const char *string)
+{
+	char *dot;
+
+	dot = strrchr(string, '.');
+	if (!dot)
+		return false;
+
+	if (strcmp(dot, ".yml") == 0)
+		return true;
+	if (strcmp(dot, ".yaml") == 0)
+		return true;
+	return false;
+}
+
+struct tlshd_tags_filter_name_match_args {
+	struct tlshd_tags_tag		*nm_tag;
+	const char			*nm_filter_name;
+};
+
+static void tlshd_tags_filter_name_match_cb(gpointer data, gpointer user_data)
+{
+	struct tlshd_tags_filter *filter =
+		(struct tlshd_tags_filter *)data;
+	struct tlshd_tags_filter_name_match_args *args =
+		(struct tlshd_tags_filter_name_match_args *)user_data;
+
+	if (strcmp(filter->fi_name, args->nm_filter_name) == 0)
+		g_ptr_array_add(args->nm_tag->ta_filters, (gpointer)filter);
+}
+
+static void tlshd_tags_filter_name_find_cb(gpointer data, gpointer user_data)
+{
+	struct tlshd_tags_filter_name_match_args args = {
+		.nm_tag			= (struct tlshd_tags_tag *)user_data,
+		.nm_filter_name		= (const char *)data,
+	};
+
+	g_ptr_array_foreach(tlshd_tags_filter_all,
+			    tlshd_tags_filter_name_match_cb,
+			    (gpointer)&args);
+}
+
+static void
+tlshd_tags_filters_find_cb(gpointer data,
+			   __attribute__ ((unused)) gpointer user_data)
+{
+	struct tlshd_tags_tag *tag = (struct tlshd_tags_tag *)data;
+
+	g_ptr_array_foreach(tag->ta_filter_names,
+			    tlshd_tags_filter_name_find_cb, (gpointer)tag);
+}
+
+/**
+ * tlshd_tags_read_configuration - Read the TLS session tags config files
+ * @tagsdir: pathname of directory containing files that define tags
+ *
+ */
+void tlshd_tags_read_configuration(const char *tagsdir)
+{
+	char *pathname;
+	long pathmax;
+	DIR *dir;
+
+	pathmax = pathconf(tagsdir, _PC_PATH_MAX);
+	if (pathmax < 0) {
+		tlshd_log_perror("pathconf");
+		return;
+	}
+	pathname = malloc(pathmax + 1);
+	if (!pathname) {
+		tlshd_log_error("Failed to allocate pathname buffer\n");
+		return;
+	}
+
+	dir = opendir(tagsdir);
+	if (!dir) {
+		tlshd_log_perror("opendir");
+		goto err_free;
+	}
+
+	tlshd_tags_filter_all = g_ptr_array_new();
+	if (!tlshd_tags_filter_all) {
+		tlshd_log_error("Failed to allocate filter PtrArray\n");
+		goto err_close;
+	}
+
+	tlshd_tags_tag_all = g_ptr_array_new();
+	if (!tlshd_tags_tag_all) {
+		tlshd_log_error("Failed to allocate tag PtrArray\n");
+		g_ptr_array_free(tlshd_tags_filter_all, TRUE);
+		goto err_close;
+	}
+
+	while (true) {
+		struct dirent *entry;
+		FILE *fh;
+		long len;
+
+		entry = readdir(dir);
+		if (!entry)
+			break;
+		if (!tlshd_tags_yaml_extension(entry->d_name))
+			continue;
+
+		len = snprintf(pathname, pathmax, "%s/%s", tagsdir, entry->d_name);
+		if (len > pathmax) {
+			tlshd_log_error("Config file pathname is too long\n");
+			continue;
+		}
+
+		fh = fopen(pathname, "r");
+		if (!fh)
+			continue;
+		tlshd_log_debug("Parsing tags config file '%s'", pathname);
+		tlshd_tags_parse_one_file(fh);
+		fclose(fh);
+	}
+
+	/* To make the tag YAML documents fully declarative, we have
+	 * to wait until the tag_all and filter_all list have been
+	 * fully parsed before matching up the filter names in the
+	 * tags to struct filters in the ta_filters arrays. */
+	g_ptr_array_foreach(tlshd_tags_tag_all,
+			    tlshd_tags_filters_find_cb, NULL);
+
+err_close:
+	closedir(dir);
+err_free:
+	free(pathname);
+}
+
+static void
+tlshd_tags_tag_shutdown_cb(gpointer data,
+			   __attribute__ ((unused)) gpointer user_data)
+{
+	struct tlshd_tags_tag *tag = (struct tlshd_tags_tag *)data;
+
+	if (tlshd_debug > 3)
+		tlshd_log_debug("Removing tag '%s' from tag list", tag->ta_name);
+	tlshd_tags_tag_free(tag);
+}
+
+static void
+tlshd_tags_filter_shutdown_cb(gpointer data,
+			      __attribute__ ((unused)) gpointer user_data)
+{
+	struct tlshd_tags_filter *filter = (struct tlshd_tags_filter *)data;
+
+	if (tlshd_debug > 3)
+		tlshd_log_debug("Removing filter '%s' from filter list",
+				filter->fi_name);
+	tlshd_tags_filter_free(filter);
+}
+
+/**
+ * tlshd_tags_shutdown - Release all tag-related resources
+ *
+ */
+void tlshd_tags_shutdown(void)
+{
+	if (tlshd_tags_tag_all)
+		g_ptr_array_foreach(tlshd_tags_tag_all,
+				    tlshd_tags_tag_shutdown_cb,
+				    NULL);
+	g_ptr_array_free(tlshd_tags_tag_all, TRUE);
+
+	if (tlshd_tags_filter_all)
+		g_ptr_array_foreach(tlshd_tags_filter_all,
+				    tlshd_tags_filter_shutdown_cb,
+				    NULL);
+	g_ptr_array_free(tlshd_tags_filter_all, TRUE);
+}
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index a0dd47ecfef4..69f26dd7a00a 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -119,6 +119,10 @@ extern void tlshd_genl_done(struct tlshd_handshake_parms *parms);
 extern void tlshd_tls13_serverhello_handshake(struct tlshd_handshake_parms *parms);
 extern void tlshd_quic_serverhello_handshake(struct tlshd_handshake_parms *parms);
 
+/* tags.c */
+extern void tlshd_tags_read_configuration(const char *tagsdir);
+extern void tlshd_tags_shutdown(void);
+
 #ifdef HAVE_GNUTLS_QUIC
 #include <linux/quic.h>
 



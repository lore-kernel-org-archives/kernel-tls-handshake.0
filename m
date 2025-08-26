Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C817A2727FC
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222708; cv=none; b=lFFw9ZgfRn/IJ9vh8TV4kIdwe9hGQNTv6KHlgIxeayTL+ujZMJgI2UNfQo0m8jHiBN2hfAl5InbO/Zadejh6tuIimul2Wj3DIRcqaa2oCVZhmx5wLHq1/SxyKjWKfdNGfTkTubODWT80Yt/0WsPXUmgzz3CKwOI5UigucAAL/08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222708; c=relaxed/simple;
	bh=B0klFe6Ha4NtqQu0YDicSW/hlnquqrd3sAB65o/BroA=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qPGwixmML1u6MYtvPSP9nfoBLGy9qvm02THTpjkvD2q0eonuAoYXx4vYHBXrmEWjPrq1UQfLRXlRwtZs2jYOr1a7zzZhJ6/3PLFtwu219Kw5k0SgIxQ5nfwl3VMiuF1lgGdvVueF05c6VrtuiU+7FNXxGEABxrnHokCTf5z1TeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ujz8CjTC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ujz8CjTC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B749C4CEF1
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756222708;
	bh=B0klFe6Ha4NtqQu0YDicSW/hlnquqrd3sAB65o/BroA=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=Ujz8CjTCPVjGMejoqT51FjAhrti/Z5MEm7kxVisa9+l5hfxa//lA3ZCJx276hi9Jw
	 9vYoz4jHZOIP1Kr6iOdaHOZ8adIKxOCMyr5nhb3eW+TdkrdX2KSu/cCIZzT0Qu4yvG
	 wCF4PXzJaFnbVwiftgfIAbeyDQsfxQKiL2aNg7LWRGe8C8iZp17AoE9V8/+2cJX69Y
	 h8BSIWjDqikvBhIGKJakvIj71VRk7Qut3AcKTwnTTvTHHnoyrKrhrtdJ4JhDvIW+Ou
	 1I5jJIXVwhHI+MpAtQ+LXV9IL5F5xsrwH4+SZt81CpolrgA/9cUSkHFNEmZ+/AiBLC
	 47ZKt4pXKmvFQ==
Subject: [PATCH v2 06/11] tlshd: Add a YAML parser
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Tue, 26 Aug 2025 11:38:27 -0400
Message-ID: 
 <175622270750.6197.7682761717310146864.stgit@91.116.238.104.host.secureserver.net>
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

The TLS session tag definitions are to be specified using YAML.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/tags.c |  254 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 253 insertions(+), 1 deletion(-)

diff --git a/src/tlshd/tags.c b/src/tlshd/tags.c
index 2d2f72f036f4..12d8f6ca00b1 100644
--- a/src/tlshd/tags.c
+++ b/src/tlshd/tags.c
@@ -27,9 +27,47 @@
 #include <gnutls/abstract.h>
 
 #include <glib.h>
+#include <yaml.h>
 
 #include "tlshd.h"
 
+/* --- libyaml helpers --- */
+
+/* This depends on the yaml_event_type_t enum being densely packed */
+static const char *show_yaml_event_type(const yaml_event_t *event)
+{
+	static const char *labels[] = {
+		[YAML_NO_EVENT]			= "YAML_NO_EVENT",
+		[YAML_STREAM_START_EVENT]	= "YAML_STREAM_START_EVENT",
+		[YAML_STREAM_END_EVENT]		= "YAML_STREAM_END_EVENT",
+		[YAML_DOCUMENT_START_EVENT]	= "YAML_DOCUMENT_START_EVENT",
+		[YAML_DOCUMENT_END_EVENT]	= "YAML_DOCUMENT_END_EVENT",
+		[YAML_ALIAS_EVENT]		= "YAML_ALIAS_EVENT",
+		[YAML_SCALAR_EVENT]		= "YAML_SCALAR_EVENT",
+		[YAML_SEQUENCE_START_EVENT]	= "YAML_SEQUENCE_START_EVENT",
+		[YAML_SEQUENCE_END_EVENT]	= "YAML_SEQUENCE_END_EVENT",
+		[YAML_MAPPING_START_EVENT]	= "YAML_MAPPING_START_EVENT",
+		[YAML_MAPPING_END_EVENT]	= "YAML_MAPPING_END_EVENT",
+	};
+
+	if (event->type > YAML_MAPPING_END_EVENT)
+		return "invalid YAML event";
+	return labels[event->type];
+}
+
+/* --- Tag configuration file parsing --- */
+
+enum tlshd_tags_fsm_state_index {
+	PS_STOP,
+	PS_START,
+	PS_STREAM,
+	PS_DOCUMENT,
+	PS_TOP_LEVEL,
+
+	PS_UNEXPECTED_INPUT_TOKEN,
+	PS_FAILURE,
+};
+
 struct tlshd_tags_filter;
 
 struct tlshd_tags_filter_type {
@@ -41,6 +79,212 @@ struct tlshd_tags_filter_type {
 
 static GHashTable *tlshd_tags_filter_type_hash;
 
+struct tlshd_tags_parser_state {
+	yaml_event_t			ps_yaml_event;
+
+	enum tlshd_tags_fsm_state_index	ps_fsm_state;
+};
+
+static enum tlshd_tags_fsm_state_index
+tlshd_tags_top_level(struct tlshd_tags_parser_state *current)
+{
+	const yaml_event_t *event = &current->ps_yaml_event;
+	const char *mapping = (const char *)event->data.scalar.value;
+
+	tlshd_log_error("Unexpected mapping name: %s\n", mapping);
+	return PS_UNEXPECTED_INPUT_TOKEN;
+}
+
+/* --- FSM states --- */
+
+typedef enum tlshd_tags_fsm_state_index
+	(*tlshd_tags_action_fn)(struct tlshd_tags_parser_state *current);
+
+struct tlshd_tags_fsm_transition {
+	yaml_event_type_t		pt_yaml_event;
+	enum tlshd_tags_fsm_state_index	pt_next_state;
+	tlshd_tags_action_fn		pt_action;
+};
+
+#define NEXT_STATE(event, state) \
+	{ \
+		.pt_yaml_event		= event, \
+		.pt_next_state		= state, \
+	}
+
+#define NEXT_ACTION(event, action) \
+	{ \
+		.pt_yaml_event		= event, \
+		.pt_action		= action, \
+	}
+
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_start[] = {
+	NEXT_STATE(YAML_STREAM_START_EVENT, PS_STREAM),
+};
+
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_stream[] = {
+	NEXT_STATE(YAML_DOCUMENT_START_EVENT, PS_DOCUMENT),
+	NEXT_STATE(YAML_STREAM_END_EVENT, PS_STOP),
+};
+
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_document[] = {
+	NEXT_STATE(YAML_MAPPING_START_EVENT, PS_TOP_LEVEL),
+	NEXT_STATE(YAML_DOCUMENT_END_EVENT, PS_STREAM),
+};
+
+static const struct tlshd_tags_fsm_transition tlshd_tags_transitions_top_level[] = {
+	NEXT_ACTION(YAML_SCALAR_EVENT, tlshd_tags_top_level),
+	NEXT_STATE(YAML_MAPPING_END_EVENT, PS_DOCUMENT),
+};
+
+struct tlshd_tags_fsm_state {
+	const char			*ts_name;
+	const struct tlshd_tags_fsm_transition *ts_transitions;
+	size_t				ts_transition_count;
+};
+
+#define FSM_STATE(name, array) \
+	[name] = { \
+		.ts_name		= #name, \
+		.ts_transitions		= array, \
+		.ts_transition_count	= ARRAY_SIZE(array), \
+	}
+
+#define TERMINAL_STATE(name) \
+	[name] = { \
+		.ts_name		= #name, \
+		.ts_transition_count	= 0, \
+	}
+
+static const struct tlshd_tags_fsm_state tlshd_tags_fsm_state_table[] = {
+	TERMINAL_STATE(PS_STOP),
+	FSM_STATE(PS_START, tlshd_tags_transitions_start),
+	FSM_STATE(PS_STREAM, tlshd_tags_transitions_stream),
+	FSM_STATE(PS_DOCUMENT, tlshd_tags_transitions_document),
+	FSM_STATE(PS_TOP_LEVEL, tlshd_tags_transitions_top_level),
+	TERMINAL_STATE(PS_UNEXPECTED_INPUT_TOKEN),
+	TERMINAL_STATE(PS_FAILURE),
+};
+
+/*
+ * Each libyaml event produces zero or one input tokens.
+ *
+ * tlshd_tags_process_yaml_event() evaluates the event token based on
+ * the current parser state, then advances to the next FSM state.
+ */
+static void
+tlshd_tags_process_yaml_event(struct tlshd_tags_parser_state *current)
+{
+	const struct tlshd_tags_fsm_state *fsm_state =
+		&tlshd_tags_fsm_state_table[current->ps_fsm_state];
+	const yaml_event_t *event = &current->ps_yaml_event;
+	const struct tlshd_tags_fsm_transition *transition;
+	size_t i;
+
+	if (fsm_state->ts_transition_count == 0)
+		return;
+
+	transition = NULL;
+	for (i = 0; i < fsm_state->ts_transition_count; ++i) {
+		if (fsm_state->ts_transitions[i].pt_yaml_event == event->type) {
+			transition = &fsm_state->ts_transitions[i];
+			break;
+		}
+	}
+	if (transition == NULL) {
+		tlshd_log_debug("ps_state=%s, unexpected event: %s\n",
+			fsm_state->ts_name,
+			show_yaml_event_type(event));
+		current->ps_fsm_state = PS_FAILURE;
+		return;
+	}
+
+	if (tlshd_debug > 3)
+		tlshd_log_debug("ps_state=%s yaml event=%s",
+			fsm_state->ts_name,
+			show_yaml_event_type(event));
+
+	if (transition->pt_action)
+		current->ps_fsm_state = transition->pt_action(current);
+	else
+		current->ps_fsm_state = transition->pt_next_state;
+}
+
+static void tlshd_tags_parse_file(const char *filename)
+{
+	struct tlshd_tags_parser_state current;
+	yaml_parser_t parser;
+	FILE *fh;
+
+	if (!yaml_parser_initialize(&parser)) {
+		tlshd_log_error("Failed to initialize parser!\n");
+		return;
+	}
+
+	fh = fopen(filename, "r");
+	if (!fh) {
+		tlshd_log_perror("fopen");
+		yaml_parser_delete(&parser);
+		return;
+	}
+	yaml_parser_set_input_file(&parser, fh);
+
+	tlshd_log_debug("Parsing tags config file '%s'", filename);
+
+	current.ps_fsm_state = PS_START;
+	do {
+		if (!yaml_parser_parse(&parser, &current.ps_yaml_event)) {
+			tlshd_log_error("Parser error %d\n",
+					parser.error);
+			break;
+		}
+		tlshd_tags_process_yaml_event(&current);
+		yaml_event_delete(&current.ps_yaml_event);
+
+		if (current.ps_fsm_state == PS_FAILURE ||
+		    current.ps_fsm_state == PS_UNEXPECTED_INPUT_TOKEN) {
+			tlshd_log_error("Tag parsing failed, line: %zu column: %zu file: %s\n",
+					parser.mark.line + 1,
+					parser.mark.column,
+					filename);
+			break;
+		}
+	} while (current.ps_fsm_state != PS_STOP);
+
+	yaml_parser_delete(&parser);
+	fclose(fh);
+}
+
+static bool tlshd_tags_read_directory(const char *tagsdir)
+{
+	const gchar *filename;
+	GError *error;
+	GDir *dir;
+
+	error = NULL;
+	dir = g_dir_open(tagsdir, 0, &error);
+	if (!dir) {
+		tlshd_log_gerror("Failed to open the tags directory", error);
+		g_error_free(error);
+		return false;
+	}
+
+	while ((filename = g_dir_read_name(dir)) != NULL) {
+		gchar *pathname;
+
+		if (!g_str_has_suffix(filename, ".yml") &&
+		    !g_str_has_suffix(filename, ".yaml"))
+			continue;
+		pathname = g_build_filename(tagsdir, filename, NULL);
+
+		tlshd_tags_parse_file(pathname);
+		g_free(pathname);
+	}
+
+	g_dir_close(dir);
+	return true;
+}
+
 /* --- Filter Types --- */
 
 static const struct tlshd_tags_filter_type tlshd_tags_static_filter_types[] = {
@@ -148,10 +392,18 @@ static bool tlshd_tags_filter_type_hash_init(void)
  * @tagsdir: pathname of directory containing files that define tags
  *
  */
-void tlshd_tags_config_init(__attribute__ ((unused)) const char *tagsdir)
+void tlshd_tags_config_init(const char *tagsdir)
 {
 	if (!tlshd_tags_filter_type_hash_init())
 		return;
+
+	if (!tlshd_tags_read_directory(tagsdir))
+		goto filter_type_hash;
+
+	return;
+
+filter_type_hash:
+	tlshd_tags_filter_type_hash_destroy();
 }
 
 /**



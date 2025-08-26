Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E10252900
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222739; cv=none; b=Ru+QbMjp1GYN4iZvGrJ81V86ieVUyoyXrocJUdsT+ZV7AyUS2gukh2O3Pd+zc2wvV2hQSJGoh/raVIIlPT3j0bTjoLeApVunHYUubw3K/Q2rHtjO1lfi1re9CGcW1dai8BRaz0AAkpIqtXGkQBYVe8ZWSInJ10PnwkG76jVnZh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222739; c=relaxed/simple;
	bh=aDDZAveVXNDfyJEKdtY43iKYJLJKzIPXoqJxIhyhG+s=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jDoUTbCrr7V2WFortneTRn2g/DfQ/+ghvW2JwOLsyoHvfMzdZLgi+5i1qImWbbuqOPjqKGyQOtB2CWWyJ/tPLoxKYy/skO8B+U49396JC7m3lkWTObopzRtnh4e+RlgfILy1+c9t61AZ+9HZl+jByWg91RBkAv5RiRoSAFEySpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YK5CmTR1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YK5CmTR1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6274C4CEF1
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756222739;
	bh=aDDZAveVXNDfyJEKdtY43iKYJLJKzIPXoqJxIhyhG+s=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=YK5CmTR1a6dW98hYJ/hohsb1mH7/8swdexBE3JLsZwHtK+apQo7YXa4kV/2g8PIM4
	 j8K5QABKotpwrGm6pKvO3m3dtD2bTeqx+3yDKcKV0l8O3MQR/7E5nEOC9ngmf+8iD+
	 5B9Rfp7DTPQMuUDHGuZ2A9f6nz5EN3XZPKnmkTBUZox5Cn3/7XMr22ktw0uPb/Y+3b
	 tZkXDXq+OBDiK0kM1ku9DqBPAw0fs4o3tcQyZY0FeQiuMpuXorZpW2VX0ro6KI1nVY
	 2RQ0Z0mRlHje5YC/NE7RDVv2HbaWsgzx5A8cu94X0yhbOGlFMaR0SGPmGtzatqE1RU
	 gFot8u2ewk6hg==
Subject: [PATCH v2 11/11] tlshd: Add handshake tags to the DONE command
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Tue, 26 Aug 2025 11:38:58 -0400
Message-ID: 
 <175622273809.6197.13131686652062424961.stgit@91.116.238.104.host.secureserver.net>
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

The tag list is returned to the kernel as part of a successful
handshake response (the DONE netlink command). The kernel TLS
consumer may use those tags for further authorization checking.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/netlink.c |   25 +++++++++++++++++++++++++
 src/tlshd/tags.c    |   28 ++++++++++++++++++++++++++++
 src/tlshd/tlshd.h   |    2 ++
 3 files changed, 55 insertions(+)

diff --git a/src/tlshd/netlink.c b/src/tlshd/netlink.c
index c08e5e51204a..cc9ac55716d6 100644
--- a/src/tlshd/netlink.c
+++ b/src/tlshd/netlink.c
@@ -493,6 +493,25 @@ static int tlshd_genl_put_remote_peerids(struct nl_msg *msg,
 	return 0;
 }
 
+static int tlshd_genl_put_tag(const char *name,
+			      __attribute__ ((unused)) void *data)
+{
+	struct nl_msg *msg = data;
+	int err;
+
+	err = nla_put_string(msg, HANDSHAKE_A_DONE_TAG, name);
+	if (err < 0) {
+		tlshd_log_nl_error("nla_put tag", err);
+		return -1;
+	}
+	return 0;
+}
+
+static int tlshd_genl_put_tag_list(struct nl_msg *msg)
+{
+	return tlshd_tags_for_each_matched(tlshd_genl_put_tag, (void *)msg);
+}
+
 /**
  * tlshd_genl_done - Indicate handshake has completed successfully
  * @parms: buffer filled in with parameters
@@ -550,6 +569,12 @@ void tlshd_genl_done(struct tlshd_handshake_parms *parms)
 	if (err < 0)
 		goto out_free;
 
+	err = tlshd_genl_put_tag_list(msg);
+	if (err < 0) {
+		tlshd_log_nl_error("nla_put tag list", err);
+		goto out_free;
+	}
+
 sendit:
 	if (tlshd_delay_done) {
 		/* Undocumented tlshd.conf parameter:
diff --git a/src/tlshd/tags.c b/src/tlshd/tags.c
index 07aba2c74220..df3c09f3b32a 100644
--- a/src/tlshd/tags.c
+++ b/src/tlshd/tags.c
@@ -1515,3 +1515,31 @@ void tlshd_tags_config_shutdown(void)
 	tlshd_tags_filter_hash_destroy();
 	tlshd_tags_filter_type_hash_destroy();
 }
+
+/**
+ * tlshd_tags_for_each_matched - Call @cb for each matched tag
+ * @cb: callback function
+ * @data: data to be passed to each callback
+ *
+ * Returns zero if the callback returned only zeroes. Otherwise, the
+ * first non-zero callback return stops the loop and returns that
+ * non-zero value.
+ */
+int tlshd_tags_for_each_matched(int (*cb)(const char *name, void *data),
+			        void *data)
+{
+	GHashTableIter iter;
+	gpointer key, value;
+
+	if (!tlshd_tags_tag_hash)
+		return 0;
+
+	g_hash_table_iter_init(&iter, tlshd_tags_tag_hash);
+	while (g_hash_table_iter_next(&iter, &key, &value)) {
+		struct tlshd_tags_tag *tag = (struct tlshd_tags_tag *)value;
+
+		if (tag->ta_matched)
+			(cb)(tag->ta_name, data);
+	}
+	return 0;
+}
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 38777a7e94a2..7a4b7d59fc47 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -123,6 +123,8 @@ extern void tlshd_quic_serverhello_handshake(struct tlshd_handshake_parms *parms
 extern void tlshd_tags_config_init(const char *tagsdir);
 extern void tlshd_tags_config_shutdown(void);
 extern void tlshd_tags_match_session(gnutls_session_t session);
+extern int tlshd_tags_for_each_matched(int (*cb)(const char *name, void *data),
+				       void *data);
 
 #ifdef HAVE_GNUTLS_QUIC
 #include <linux/quic.h>



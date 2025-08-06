Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CAE1A76B1
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Aug 2025 19:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754507155; cv=none; b=oclNd1kPUQHM/v/4ssw++FRHh7PPRN3nevYYVQuXGHStFHUJHOCreJpoB8vtEwSBevGEDSOdB4cFxKrMqMq0b/X3wTLCFylDKInYiacd8Zdm30PcIFRhK2QQXfJuR+fe9tS4ijs6ITRlKJOebMcTifjly08eo364sc2C1S0TIws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754507155; c=relaxed/simple;
	bh=vOT1My7IpO4FtorJZi8w7hxosqI37mPuunvr5K9vU2c=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JuhAxUARfOlNVqNQ8PDdLAYGS+QoJpDGOxt4gCTuQzRwB+5+ct+8wDUvtk7xZ2G/WMSTgjyl2Y/fSvdmTqMHgSElLRcAQLSqTdHPebbKlUvj3xKmHIllCaYp3l6oSFxC+/Jwy+gaqSqgMPM6SE9yl++mm48ZOUgkzAPoXR/cJX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVRaSYIw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVRaSYIw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BFE3C4CEE7
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Aug 2025 19:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754507155;
	bh=vOT1My7IpO4FtorJZi8w7hxosqI37mPuunvr5K9vU2c=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=jVRaSYIwaqz3EKW5HvKwDdgPwnsplussrMtLE71IWPZZy/wWdvc6ZUQQYfbmiXNJR
	 SJmS64wV5RirgyBf+sX9QbCPQ3zmt5es3TNUgQ0C9+KQXDOI1Pf36OsbRBH3NQG1aL
	 ZMMWaegASzGb7GNFo8de4Y0Js/383sJlcs4lJglDihVJt14c+cfq/cYO7TnMhpVqOM
	 nmC4FoGL0AF7zhRcQCsZJMEjpbSFZK3GnYDkE/SS1SoyZnCoN2g71rOT+bEp6nqPMw
	 vbiXjay17T8BilNBCbuQEhDY42ho6kD60VS5YTFlO9XG5g6R3Qb0FNQh3NXwXr9ade
	 T+VJ9hLsx2WOQ==
Subject: [PATCH 8/8] tlshd: Add handshake tags to the DONE command
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Wed, 06 Aug 2025 15:05:54 -0400
Message-ID: 
 <175450715434.1882.15273168398879894218.stgit@91.116.238.104.host.secureserver.net>
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

The tag list is returned to the kernel as part of a successful
handshake response (the DONE netlink command). The kernel TLS
consumer may use those tags for further authorization checking.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/netlink.c |   25 +++++++++++++++++++++++++
 src/tlshd/tags.c    |   38 ++++++++++++++++++++++++++++++++++++++
 src/tlshd/tlshd.h   |    2 ++
 3 files changed, 65 insertions(+)

diff --git a/src/tlshd/netlink.c b/src/tlshd/netlink.c
index c08e5e51204a..c3d84e1866dc 100644
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
+	return tlshd_for_each_matched_tag(tlshd_genl_put_tag, (void *)msg);
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
index de79ad6a0f3a..390084e49436 100644
--- a/src/tlshd/tags.c
+++ b/src/tlshd/tags.c
@@ -1241,3 +1241,41 @@ void tlsdh_tags_x509_match_session(gnutls_session_t session)
 			    tlshd_tags_x509_match_cb, (gpointer)&peercert);
 	gnutls_x509_crt_deinit(peercert);
 }
+
+struct tlshd_tags_matched_args {
+	int		(*ma_cb)(const char *name, void *data);
+	void		*ma_data;
+};
+
+static void tlshd_tags_matched_cb(gpointer data, gpointer user_data)
+{
+	struct tlshd_tags_tag *tag = (struct tlshd_tags_tag *)data;
+	struct tlshd_tags_matched_args *args =
+		(struct tlshd_tags_matched_args *)user_data;
+
+	if (tag->ta_matched)
+		(args->ma_cb)(tag->ta_name, args->ma_data);
+}
+
+/**
+ * tlshd_for_each_matched_tag - Call @cb for all matched tags
+ * @cb: callback function
+ * @data: data to be passed to each callback
+ *
+ * Returns zero if the callback returned only zeroes. Otherwise, the
+ * first non-zero callback return stops the loop and returns that
+ * non-zero value.
+ */
+int tlshd_for_each_matched_tag(int (*cb)(const char *name, void *data),
+			       void *data)
+{
+	struct tlshd_tags_matched_args args = {
+		.ma_cb		= cb,
+		.ma_data	= data,
+	};
+
+	g_ptr_array_foreach(tlshd_tags_tag_all,
+			    tlshd_tags_matched_cb,
+			    (gpointer)&args);
+	return 0;
+}
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index 173b291d0a5d..a53f70a55781 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -122,6 +122,8 @@ extern void tlshd_quic_serverhello_handshake(struct tlshd_handshake_parms *parms
 /* tags.c */
 extern void tlshd_tags_read_configuration(const char *tagsdir);
 extern void tlsdh_tags_x509_match_session(gnutls_session_t session);
+extern int tlshd_for_each_matched_tag(int (*cb)(const char *name, void *data),
+				      void *data);
 extern void tlshd_tags_shutdown(void);
 
 #ifdef HAVE_GNUTLS_QUIC



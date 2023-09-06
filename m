Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE62D513
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Sep 2023 14:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA332C433C8;
	Wed,  6 Sep 2023 14:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694009191;
	bh=xB/ppuwZNUIbVpOUrsZQqP4MXeeQ003/428Dj38vFjw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=UvU9mSy+ICwiMVtzXSC+ZQx0H3sMHyoXc+41KEKGlpmOehvHB4hTIhUYoITXPNEyZ
	 nnolHpqDsom1EjgIuxmdHpm/qwyzHjZW0SyAp6DhQ+iL0C+aFnD+2SdGPYMk9V6chN
	 rrPmzredzhbFIX0ReQ1PfuUkTQtpzpkBUesPjfW+It2T0jRl+grkiaAeZ8kT+G0293
	 xsKlIENcVH28K6DV6kecmW1TDfrrPFJdMtrQGtNiSgKAUrn5RUis+tn63LaKsJjHBC
	 l15v8LBbM4qcxAV7jWj7tfXFiFal8pRekhI5Mu4AwG7/ArZGNbBft0D3fk5ACAiuFR
	 o20BffVca1AQw==
Subject: [PATCH v1 3/6] tlshd: add 'delay' configuration parameter
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Cc: Hannes Reinecke <hare@suse.de>, Chuck Lever <chuck.lever@oracle.com>
Date: Wed, 06 Sep 2023 10:06:19 -0400
Message-ID: 
 <169400916970.10079.4827579193795287327.stgit@oracle-102.nfsv4bat.org>
In-Reply-To: 
 <169400879020.10079.2238873524435794665.stgit@oracle-102.nfsv4bat.org>
References: 
 <169400879020.10079.2238873524435794665.stgit@oracle-102.nfsv4bat.org>
User-Agent: StGit/1.5
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Hannes Reinecke <hare@suse.de>

Add a 'delay' configuration parameter to delay the 'done' message
for exercising the timeout handling.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/config.c  |    2 ++
 src/tlshd/netlink.c |    9 +++++++++
 src/tlshd/tlshd.h   |    1 +
 3 files changed, 12 insertions(+)

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index 727fa69f65e6..bf6a8d00f8c8 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -81,6 +81,8 @@ bool tlshd_config_init(const gchar *pathname)
 						 "main", "tlsdebug", NULL);
 	nl_debug = g_key_file_get_integer(tlshd_configuration, "main",
 					  "nl_debug", NULL);
+	tlshd_delay_done = g_key_file_get_integer(tlshd_configuration, "main",
+						  "delay_done", NULL);
 
 	keyrings = g_key_file_get_string_list(tlshd_configuration, "main",
 					      "keyrings", &length, NULL);
diff --git a/src/tlshd/netlink.c b/src/tlshd/netlink.c
index 436b523d6993..cb7da213d94e 100644
--- a/src/tlshd/netlink.c
+++ b/src/tlshd/netlink.c
@@ -50,6 +50,8 @@
 #include "tlshd.h"
 #include "netlink.h"
 
+int tlshd_delay_done;
+
 static int tlshd_genl_sock_open(struct nl_sock **sock)
 {
 	struct nl_sock *nls;
@@ -467,6 +469,13 @@ void tlshd_genl_done(struct tlshd_handshake_parms *parms)
 		goto out_free;
 
 sendit:
+	if (tlshd_delay_done) {
+		/* Undocumented tlshd.conf parameter:
+		 * delay DONE downcall by N seconds */
+		tlshd_log_debug("delaying %d second(s)", tlshd_delay_done);
+		sleep(tlshd_delay_done);
+	}
+
 	nl_socket_disable_auto_ack(nls);
 	err = nl_send_auto(nls, msg);
 	if (err < 0) {
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index ae1ea37ccb0f..97bf12b4db8e 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -22,6 +22,7 @@
 
 extern int tlshd_debug;
 extern int tlshd_tls_debug;
+extern int tlshd_delay_done;
 extern int tlshd_stderr;
 
 struct nl_sock;



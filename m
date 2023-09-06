Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2B610796
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Sep 2023 14:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82385C433C7;
	Wed,  6 Sep 2023 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694009236;
	bh=fqp+4cdtm4798TOXxWekb22IxoD4OgQIyhdhV+DTZ1U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=XCj8DnUBUq9Z2960CYo+mcVZ/HbhzdQJMc9NeVcY/EVFLY18kXjMrl4WaE9e0RwW3
	 ki18gXbAaqYH+wOS3D1YzzR9mxV8MnF1ophyDeVm0OnyZl4ZlFJq7UFeeNQD/HZhJl
	 p1e1YzhDhZuuFYZCpvf3gkpio3iGbxMDH9pq7HbwBFJcNv9JxCtgpmkiawNiyfnCPx
	 DRmNeHVldXaGbOPdRTtbYimdgXW53Oxv7rrGVwmxGcKKINQ50UsYOlu1lJUcWtClJ2
	 ooUOxpi5NmCwDBcS6vI2EiX3O7ZubZkcsK/H3VDe4NiJO4cqGTmhdYwlZEI9jjFv7D
	 5du8bVjymVBhg==
Subject: [PATCH v1 5/6] tlshd: Reorganize tlshd.conf
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Cc: Chuck Lever <chuck.lever@oracle.com>
Date: Wed, 06 Sep 2023 10:07:05 -0400
Message-ID: 
 <169400922308.10079.7441421814939080472.stgit@oracle-102.nfsv4bat.org>
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

From: Chuck Lever <chuck.lever@oracle.com>

We've grown quite a few debug settings in tlshd.conf. It makes
better sense to organize these under a debug-specific category.

Also, the "keyrings" option is clearly an authentication-related
setting.

So:
- get rid of [main]
- add [debug] and move the debug-related options there
- move the "keyrings" option to [authenticate]

Certain clarifications to the man page are also made.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/config.c       |   15 ++++++++-------
 src/tlshd/tlshd.conf     |    9 +++++----
 src/tlshd/tlshd.conf.man |   41 +++++++++++++++++++++++++++--------------
 3 files changed, 40 insertions(+), 25 deletions(-)

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index bf6a8d00f8c8..26b9686267c0 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -75,16 +75,17 @@ bool tlshd_config_init(const gchar *pathname)
 	 * These calls return zero if the key isn't present or the
 	 * specified key value is invalid.
 	 */
-	tlshd_debug = g_key_file_get_integer(tlshd_configuration, "main",
-					     "debug", NULL);
+	tlshd_debug = g_key_file_get_integer(tlshd_configuration, "debug",
+					     "loglevel", NULL);
 	tlshd_tls_debug = g_key_file_get_integer(tlshd_configuration,
-						 "main", "tlsdebug", NULL);
-	nl_debug = g_key_file_get_integer(tlshd_configuration, "main",
-					  "nl_debug", NULL);
-	tlshd_delay_done = g_key_file_get_integer(tlshd_configuration, "main",
+						 "debug", "tls", NULL);
+	nl_debug = g_key_file_get_integer(tlshd_configuration, "debug",
+					  "nl", NULL);
+	tlshd_delay_done = g_key_file_get_integer(tlshd_configuration, "debug",
 						  "delay_done", NULL);
 
-	keyrings = g_key_file_get_string_list(tlshd_configuration, "main",
+	keyrings = g_key_file_get_string_list(tlshd_configuration,
+					      "authentication",
 					      "keyrings", &length, NULL);
 	if (keyrings) {
 		for (i = 0; i < length; i++) {
diff --git a/src/tlshd/tlshd.conf b/src/tlshd/tlshd.conf
index 5ad64d238e0f..6ac13c88ae20 100644
--- a/src/tlshd/tlshd.conf
+++ b/src/tlshd/tlshd.conf
@@ -20,11 +20,12 @@
 # See tlshd.conf(5) for details.
 #
 
-[main]
-debug=0
-tlsdebug=0
-nl_debug=0
+[debug]
+loglevel=0
+tls=0
+nl=0
 
+[authenticate]
 #keyrings= <keyring>;<keyring>;<keyring>
 
 [authenticate.client]
diff --git a/src/tlshd/tlshd.conf.man b/src/tlshd/tlshd.conf.man
index 3d29c18fb7f5..6249da1c6535 100644
--- a/src/tlshd/tlshd.conf.man
+++ b/src/tlshd/tlshd.conf.man
@@ -47,41 +47,54 @@ program exits immediately.
 The configuration file is split into sections.
 .P
 The
-.I [main]
-section specifies run-time settings for the
+.I [debug]
+section specifies debugging settings for the
 .B tlshd
 program.
-In this section, there are two available options:
+In this section, there are three available options:
 .TP
-.B debug
+.B loglevel
 This option specifies an integer which indicates the debug message level.
 Zero, the quietest setting, is the default.
 .TP
-.B tlsdebug
+.B tls
 This option specifies an integer which indicates the debug message level
 for TLS library calls.
 Zero, the quietest setting, is the default.
 .TP
-.B nl_debug
+.B nl
 This option specifies an integer which indicates the debug message level
-for netlink operations.
+for netlink library calls.
 Zero, the quietest setting, is the default.
+.P
+The
+.I [authentication]
+section specifies default authentication material when establishing
+TLS sessions.
+In this section, there is one available option:
 .TP
 .B keyrings
 This option specifies a semicolon-separated list of auxiliary keyrings
-that might contain handshake authentication tokens.
+that contain handshake authentication tokens.
 .B tlshd
 links these keyrings into its session keyring.
 The configuration file may specify either a keyring's name or serial number.
 The default is to provide no keyring.
 .P
+And, in this section, there are two subsections:
+.I [client]
+and
+.IR [server] .
 The
-.I [authentication]
-section specifies default authentication material when establishing
-TLS sessions.
-There are two subsections:
-.IR [client] and [server] .
-In each of these subsections, there are three available options:
+.B tlshd
+program consults the settings in the
+.I [client]
+subsection when handling the client end of a handshake,
+and it consults the settings in the
+.I [server]
+subsection when handling the server end of a handshake.
+.P
+In each of these two subsections, there are three available options:
 .TP
 .B x509.truststore
 This option specifies the pathname of a file containing a



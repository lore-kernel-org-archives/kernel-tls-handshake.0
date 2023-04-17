Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA628460
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23278C433EF
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681742099;
	bh=QyIC8Y178UkaG4DXBlhbuGUVL+HQb8veq/MvGROT9VM=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=exY2lys48UTe8ZDEoOrK1skg4SrYXW+1b1K6kz2cDh9oGm/qPS+MHgm0mVMX4Di8v
	 hrqrI+Q+ZpKG87rdb+I3IZNUpkGTZWFWbzsGkYyB+Pj7JTN2ct48oICWqsoJwDUzn6
	 Y1Mjc6n9iaa/sDXnDzzSLdR+2jwUPzb5DcbpSSIOAcpJzSIqvUDjQNeNaqHudmEs8h
	 Hb9ATrKTynZqKLZ85gJRnINibWc3NwYZfqQC+596nfqP/MPrc9rvIAgwgRl/+poIex
	 7rvTsqtNhi30R7zBGSFJbETeafgU1aarLfa2gKamTKXqWc9AxN30XIAdVMJXNUWJVM
	 kMjf4o4zQBaxg==
Subject: [PATCH RFC 1/5] tlshd: Check mode bit settings on certificate
 material
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Mon, 17 Apr 2023 10:34:58 -0400
Message-ID: 
 <168174209812.9615.10225996903152811448.stgit@91.116.238.104.host.secureserver.net>
In-Reply-To: 
 <168174201703.9615.15054227659982658294.stgit@91.116.238.104.host.secureserver.net>
References: 
 <168174201703.9615.15054227659982658294.stgit@91.116.238.104.host.secureserver.net>
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

Log a conventional warning if certificate material is not permitted
defensively.

Suggested-by: John Haxby <john.haxby@oracle.com>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/config.c |   36 +++++++++++++++++++++++++++---------
 src/tlshd/log.c    |   14 ++++++++++++++
 src/tlshd/tlshd.h  |    1 +
 3 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index fa2da64bfbdd..464635ed56e0 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -123,10 +123,18 @@ static int tlshd_file_open(const char *pathname)
 }
 #endif
 
+/*
+ * Expected file attributes
+ */
+#define TLSHD_OWNER		0	/* root */
+#define TLSHD_CERT_MODE		(S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)
+#define TLSHD_PRIVKEY_MODE	(S_IRUSR|S_IWUSR)
+
 /*
  * On success, caller must release buffer returned in @data by calling free(3)
  */
-static bool tlshd_config_read_datum(const char *pathname, gnutls_datum_t *data)
+static bool tlshd_config_read_datum(const char *pathname, gnutls_datum_t *data,
+				    uid_t owner, mode_t mode)
 {
 	struct stat statbuf;
 	void *buf;
@@ -137,21 +145,27 @@ static bool tlshd_config_read_datum(const char *pathname, gnutls_datum_t *data)
 
 	fd = tlshd_file_open(pathname);
 	if (fd == -1) {
-		tlshd_log_perror("Failed to open file");
+		tlshd_log_perror("open");
 		goto out;
 	}
 	if (fstat(fd, &statbuf)) {
-		tlshd_log_perror("Failed to stat file");
+		tlshd_log_perror("stat");
 		goto out_close;
 	}
+	if (statbuf.st_uid != owner)
+		tlshd_log_notice("File %s: expected owner %u",
+				 pathname, owner);
+	if ((statbuf.st_mode & ALLPERMS) != mode)
+		tlshd_log_notice("File %s: expected mode %o",
+				 pathname, mode);
 	buf = malloc(statbuf.st_size);
 	if (!buf) {
 		errno = ENOMEM;
-		tlshd_log_perror("Failed to allocate buffer");
+		tlshd_log_perror("malloc");
 		goto out_close;
 	}
 	if (read(fd, buf, statbuf.st_size) == -1) {
-		tlshd_log_perror("Failed to read file");
+		tlshd_log_perror("read");
 		free(buf);
 		goto out_close;
 	}
@@ -188,7 +202,8 @@ bool tlshd_config_get_client_cert(gnutls_pcert_st *cert)
 		return false;
 	}
 
-	if (!tlshd_config_read_datum(pathname, &data))
+	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
+				     TLSHD_CERT_MODE))
 		return false;
 
 	/* Config file supports only PEM-encoded certificates */
@@ -227,7 +242,8 @@ bool tlshd_config_get_client_privkey(gnutls_privkey_t *privkey)
 		return false;
 	}
 
-	if (!tlshd_config_read_datum(pathname, &data))
+	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
+				     TLSHD_PRIVKEY_MODE))
 		return false;
 
 	ret = gnutls_privkey_init(privkey);
@@ -273,7 +289,8 @@ bool tlshd_config_get_server_cert(gnutls_pcert_st *cert)
 		return false;
 	}
 
-	if (!tlshd_config_read_datum(pathname, &data))
+	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
+				     TLSHD_CERT_MODE))
 		return false;
 
 	/* Config file supports only PEM-encoded certificates */
@@ -312,7 +329,8 @@ bool tlshd_config_get_server_privkey(gnutls_privkey_t *privkey)
 		return false;
 	}
 
-	if (!tlshd_config_read_datum(pathname, &data))
+	if (!tlshd_config_read_datum(pathname, &data, TLSHD_OWNER,
+				     TLSHD_PRIVKEY_MODE))
 		return false;
 
 	ret = gnutls_privkey_init(privkey);
diff --git a/src/tlshd/log.c b/src/tlshd/log.c
index 01e248660607..3594d529ad74 100644
--- a/src/tlshd/log.c
+++ b/src/tlshd/log.c
@@ -112,6 +112,20 @@ void tlshd_log_error(const char *fmt, ...)
 	va_end(args);
 }
 
+/**
+ * tlshd_log_notice - Emit a generic warning
+ * @fmt - printf-style format string
+ *
+ */
+void tlshd_log_notice(const char *fmt, ...)
+{
+	va_list args;
+
+	va_start(args, fmt);
+	vsyslog(LOG_NOTICE, fmt, args);
+	va_end(args);
+}
+
 /**
  * tlshd_log_perror - Emit "system call failed" notification
  * @sap: remote address to log
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index f598beeb65fd..d8cb3c4b4baa 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -87,6 +87,7 @@ extern void tlshd_log_failure(const char *hostname,
 			      const struct sockaddr *sap, socklen_t salen);
 
 extern void tlshd_log_debug(const char *fmt, ...);
+extern void tlshd_log_notice(const char *fmt, ...);
 extern void tlshd_log_error(const char *fmt, ...);
 extern void tlshd_log_perror(const char *prefix);
 extern void tlshd_log_gai_error(int error);



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC9C246BD5
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Jun 2025 13:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561956; cv=none; b=EvRv7ToZTRa+Ur8O/6XroLkhP8ZuAda0fcpcKvoW0O8kjTYq9FPqgawzLoFi6xfKtAiP9OrV4mio/N12b5WjZyXscX689pLtehRJLwEYgGPlEXBWru0QedDLFK4JyWXQHajEeOhju9gSA+Ar5ubuAEnLJz+9fc3vYrJkaVASrvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561956; c=relaxed/simple;
	bh=bR3UhSs2KSgAWEkT71tqYEz/eS3qOWla6Nd1BV54Gdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YPvqXAM4zIUg3Nxh4bbI11g8QQgLRTIh8Dpusa9RcFhc32EQcrZj3YzTV1sz6kxvytaHoaiZBmOqaVP/YUSGSPsFyb+u3nRZfrNZHxbojkHRrUGUegn5xe3NrJSJbwAjBwLLzjOOc6bkdG31QLUDWn7q45LTWnLI2NPQk3Ce9T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVK3S2tM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVK3S2tM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD63EC4CEEF;
	Tue, 10 Jun 2025 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749561956;
	bh=bR3UhSs2KSgAWEkT71tqYEz/eS3qOWla6Nd1BV54Gdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eVK3S2tMqZLV1SZqB7LQTFsDuC2yH5kQxMFdDjzSlPDNgQdzVwKjhDK438sNwS1vu
	 ASbfa5uLdeiMwddF3UzfBVI5lHPzpmSx8ww4+QRdcYSg4kLd0/Lzrh859QrVXwcEX/
	 pUCpaIfPQ33VjMuki7lCGtVS8SkZVVXMm+Hi65G74ELmrTNrmQGzrwpYry8vJNsXKZ
	 9cgPJwXb+b8eVJa+47fJX942Z4v6qAWFQ0ylrwwUFh79cFMlAlkFaE7xTMS0T7NUXS
	 jtsom25+XVDirUe+bcZcVgMQyFLbGjBcYIoiF86PsPzFHmmAA3cS9ejaPnS0yWA2pI
	 WMia/1o5Y7CSQ==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH 5/5] tlshd: Relocate TLSHD_ALLPERMS
Date: Tue, 10 Jun 2025 09:25:50 -0400
Message-ID: <20250610132550.39715-6-cel@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610132550.39715-1-cel@kernel.org>
References: <20250610132550.39715-1-cel@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuck Lever <chuck.lever@oracle.com>

Clean up: Move it next to the other related macro definitions.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/config.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index b41051e40c08..df26663d3a69 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -46,12 +46,6 @@
 
 static GKeyFile *tlshd_configuration;
 
-/**
- * ALLPERMS exists in glibc, but not on musl, so we
- * manually define TLSHD_ACCESSPERMS instead of using ALLPERMS.
- */
-#define TLSHD_ACCESSPERMS	(S_IRWXU|S_IRWXG|S_IRWXO)
-
 /**
  * tlshd_config_init - Read tlshd's config file
  * @pathname: Pathname to config file
@@ -120,6 +114,12 @@ void tlshd_config_shutdown(void)
 	g_key_file_free(tlshd_configuration);
 }
 
+/**
+ * ALLPERMS exists in glibc, but not on musl, so we manually
+ * define TLSHD_ACCESSPERMS instead of using ALLPERMS.
+ */
+#define TLSHD_ACCESSPERMS	(S_IRWXU|S_IRWXG|S_IRWXO)
+
 /*
  * Expected file attributes
  */
-- 
2.49.0


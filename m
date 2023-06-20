Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278EF2AB37
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 Jun 2023 17:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32079C433C0;
	Tue, 20 Jun 2023 17:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687281616;
	bh=zcdBQUkwHl6MZV1u94Ms7nw6pcxtwpxeK4wWhrIG7Bs=;
	h=From:To:Cc:Subject:Date:From;
	b=YBNWrf9V8RZuiIbKapVmhgit9O5sffrXmuQayvGVb4qFJ/hiNl3EuElj9vx0XlBEH
	 01zybbEmiPIzWLOhSKIf8vLNZblpzxVk6+ZXVsZERZAd0CcSfuXKVAkNrF21QLnWKk
	 OhgrmMbqvR5x139gF8SkINaidlIL+CbE71SXJHcj69mvHRK0i5LwuMXU+bA3ZVnDL6
	 PUHVxziyHlmKGQ14hyYvj6oJu7KzcbMVCZwoWs0Ee955AvGzd0EifzoS7A2nG6wgW4
	 PZNkfwfOT0UAkEHNqIjPIIeR+nEOqClUHViTC6f45sjqifj6EHIXbb9VpyKn2YMzjF
	 r9HC5ZSTUlJQw==
From: Jeff Layton <jlayton@kernel.org>
To: chuck.lever@oracle.com
Cc: kernel-tls-handshake@lists.linux.dev,
	Steve Dickson <steved@redhat.com>,
	Petr Pisar <ppisar@redhat.com>
Subject: [PATCH] tlshd: fix max config file size comparison
Date: Tue, 20 Jun 2023 13:20:14 -0400
Message-ID: <20230620172014.1178395-1-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc throws a warning on 32-bit x86 because of signedness mismatch:

config.c:155:52: error: comparison of integer expressions of different signedness: '__off_t' {aka 'long int'} and 'unsigned int' [-Werror=sign-compare]
  155 |         if (statbuf.st_size < 0 || statbuf.st_size > UINT_MAX) {
      |                                                    ^

st_size is a signed value (off_t), but UINT_MAX is unsigned.

Change it to compare against INT_MAX instead. This technically cuts the
max size of the config file in half to only 2GB, but I don't think we'll
miss it.

Cc: Steve Dickson <steved@redhat.com>
Reported-by: Petr Pisar <ppisar@redhat.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 src/tlshd/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index 87cc4018733b..bdab98b9fba4 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -152,7 +152,7 @@ static bool tlshd_config_read_datum(const char *pathname, gnutls_datum_t *data,
 		tlshd_log_perror("stat");
 		goto out_close;
 	}
-	if (statbuf.st_size < 0 || statbuf.st_size > UINT_MAX) {
+	if (statbuf.st_size < 0 || statbuf.st_size > INT_MAX) {
 		tlshd_log_error("Bad config file size: %lld", statbuf.st_size);
 		goto out_close;
 	}
-- 
2.41.0


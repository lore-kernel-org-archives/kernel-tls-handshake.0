Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938CB6FBF
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 24 Sep 2025 00:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758672096; cv=none; b=dyfEvxI/CZe4FYqlenF8TOUoPO1EOnzaTLvPjXhepMfwUhN5aX+qzMI86WuCd1aPUTs+w+FKJt6/+cZwQ5lpziiCssQU6eymFZ43vt/OvAGqGJlk860oZVkXki3XC/R0g4yI1onjD7OyYXuS2PLyvKcscEJ+IrdrVoTpo8vLi6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758672096; c=relaxed/simple;
	bh=K7sK4jcbRsTqVJYY9JhfdHuLpfpXZKgVg3wsgTJAnn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h7sdk91oQTuE6KBdoaxGxCbNEpBmS3flxLrgibIKy5qc6I2x8OgnxkotzEKoTu/utI3kOeOzqfxBmEfUbCJrZITBpMFIE2hCuSMhthZl9hqZRwGjJiTtuk06nVJ5PLnjt2RGprvbWWXufxHDxx6/HUEM+18PryREvHuJuwgqC2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRfvLv4V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRfvLv4V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2032BC4CEF5;
	Wed, 24 Sep 2025 00:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758672096;
	bh=K7sK4jcbRsTqVJYY9JhfdHuLpfpXZKgVg3wsgTJAnn8=;
	h=From:To:Cc:Subject:Date:From;
	b=dRfvLv4VpS8p7ebyjmy5g4FtetW4ZLAkOKl33y+NIvFSrAlmAxqO9LmmaFNVe1zGh
	 DldALxonqsgXF27WafjxDZgJl0VvEezo1AwqsNt9+Sk7v8vIJa7gXwIdtiq6D3z0Zp
	 VBimSeqijx5PA7pKJPDjqDor83c4YDRW0C9oNCsRLF6dnfiLvKzsCCAUJl4sSrtrRk
	 eMK8WXs5Gxpi6X4oXS6DUqkhoJWWGz58RhdKndx+78JTug18WgM6kVqLYKMV7PuMDg
	 3n0tfAqJM74wRhoMVvyTrChzYvHg+YE9CAgF8r02JLpi1vwY8oL+sEnJQDmjREzPiq
	 rjuO31s/HqKFA==
From: Chuck Lever <cel@kernel.org>
To: Ben Coddington <bcodding@redhat.com>,
	Xin Long <lucien.xin@gmail.com>
Cc: <kernel-tls-handshake@lists.linux.dev>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH] tlshd: Clean up logic in tlshd_start_tls_handshake()
Date: Tue, 23 Sep 2025 20:01:34 -0400
Message-ID: <20250924000134.2429264-1-cel@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuck Lever <chuck.lever@oracle.com>

gnutls_handshake() is supposed to return only a GNUTLS_E value, and
the session_status field is supposed to contain only a positive
errno.

GNUTLS_E_PREMATURE_TERMINATION is -110. It turns out that on x86,
-ETIMEDOUT is also -110. Make sure the correct symbolic constants
and auditing functions are utilized.

Fixes: b010190cfed2 ("tlshd: Pass ETIMEDOUT from gnutls to kernel")
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/handshake.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/src/tlshd/handshake.c b/src/tlshd/handshake.c
index 5a2893994d4d..44932b7a5311 100644
--- a/src/tlshd/handshake.c
+++ b/src/tlshd/handshake.c
@@ -90,19 +90,19 @@ void tlshd_start_tls_handshake(gnutls_session_t session,
 	} while (ret < 0 && !gnutls_error_is_fatal(ret));
 	tlshd_set_nagle(session, saved);
 	if (ret < 0) {
-		/* Any errors here should default to blocking access: */
+		/* By default, a handshake error is permanent */
 		parms->session_status = EACCES;
 		switch (ret) {
 		case GNUTLS_E_CERTIFICATE_ERROR:
 		case GNUTLS_E_CERTIFICATE_VERIFICATION_ERROR:
 			tlshd_log_cert_verification_error(session);
 			break;
-		case -ETIMEDOUT:
-			tlshd_log_gnutls_error(ret);
-			parms->session_status = -ret;
+		case GNUTLS_E_PREMATURE_TERMINATION:
+			tlshd_log_error("Handshake timeout, retrying");
+			parms->session_status = ETIMEDOUT;
 			break;
 		default:
-			tlshd_log_notice("tlshd_start_tls_handshake unhandled error %d, returning EACCES\n", ret);
+			tlshd_log_gnutls_error(ret);
 		}
 		return;
 	}
-- 
2.51.0


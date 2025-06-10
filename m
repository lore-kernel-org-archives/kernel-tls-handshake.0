Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF6A246BD5
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Jun 2025 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561955; cv=none; b=ILTW1EQma/fb+lQ3ykY8zUvl1LkyQN8cxQu6RLDE036AivNOM6n69jLcpOZGQsZUwkpPZMdW2II2M8nFspscHEFCpvoL2hDMLmxnjk15NIs0VsYCrmtngknLFB28bzy1BIiWMaB82aSzG8wF2gB8L5CTQWOLKbiaKixv+TF9ve4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561955; c=relaxed/simple;
	bh=h2B2altGjRyq100EmaBIJeRSJKDtExXnWt96w2uzhcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EsozS5rirEyucaCy9uiImWeFfvt9J/W6+T40Fn6UQByIyOyhLg6jjrZgBVxuy1xW45Apxfi2tL5Cq9hDhgsA20B1iTLhQD0Rb3JSlex80ueqb9QqSnkP3SwaQTli5k7Qo4+6jPWbh8mVgBHBw2fGxcyZI38EOEWp7QBnH3cVGNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebg/vNy3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebg/vNy3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44116C4CEED;
	Tue, 10 Jun 2025 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749561955;
	bh=h2B2altGjRyq100EmaBIJeRSJKDtExXnWt96w2uzhcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ebg/vNy3ZeprkICaoCeA80xo8rrnhOGeA1LPYYV177Ds8sWaXeE0gFomqz2eca+1G
	 IVl/vuosz378SmKYU8tZsPC8tLfmcEWlGTygRAkENBgDaVB4uPbVTvZo5jFasDTLFj
	 IDjjrWctafql7sykjOUZhEnMQ+aEK+dpTJ1guHvDq9n/eb9tV+jjP26mn+pub2dNBZ
	 KNz3Ms+Lv07+xtGukJQaN6F3yYOmGEZ1uhTW7ovKEIg2PA5VjzGNYmxNEQEwen9YY+
	 2Sdyqsd0j4XtZ+AJoGgMFMPgO2aTy0ZM4+lGDWRpuliiVdp7jv9DLHTHB/XGVjznsT
	 3ICHs9BRPqjwA==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH 4/5] tlshd: Add default keyrings for NFS
Date: Tue, 10 Jun 2025 09:25:49 -0400
Message-ID: <20250610132550.39715-5-cel@kernel.org>
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

The NFS mount command is to add keys to the .nfs keyring. Also add a
keyring for NFSD configuration.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/config.c       | 11 +++++++----
 src/tlshd/tlshd.conf.man |  8 +++++++-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index e050d3df6050..b41051e40c08 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -99,15 +99,18 @@ bool tlshd_config_init(const gchar *pathname)
 		for (i = 0; i < length; i++) {
 			if (!strcmp(keyrings[i], ".nvme"))
 				continue;
+			if (!strcmp(keyrings[i], ".nfs"))
+				continue;
+			if (!strcmp(keyrings[i], ".nfsd"))
+				continue;
 			tlshd_keyring_link_session(keyrings[i]);
 		}
 		g_strfreev(keyrings);
 	}
-	/*
-	 * Always link the default nvme subsystem keyring into the
-	 * session.
-	 */
+	/* The ".nvme", ".nfs", and ".nfsd" keyrings cannot be disabled. */
 	tlshd_keyring_link_session(".nvme");
+	tlshd_keyring_link_session(".nfs");
+	tlshd_keyring_link_session(".nfsd");
 
 	return true;
 }
diff --git a/src/tlshd/tlshd.conf.man b/src/tlshd/tlshd.conf.man
index 9d6d92f521ca..abb2f9917467 100644
--- a/src/tlshd/tlshd.conf.man
+++ b/src/tlshd/tlshd.conf.man
@@ -79,7 +79,13 @@ that contain handshake authentication tokens.
 .B tlshd
 links these keyrings into its session keyring.
 The configuration file may specify either a keyring's name or serial number.
-The default is to provide no keyring.
+.B tlshd
+always includes the
+.IR .nvme ,
+.IR .nfs ,
+and
+.I .nfsd
+keyrings on its session keyring.
 .P
 And, in this section, there are two subsections:
 .I [client]
-- 
2.49.0


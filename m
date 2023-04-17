Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4178460
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCCFC433EF
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 14:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681742124;
	bh=4umCpOav2fkFqlmmg1jnN9OBYAf7XMgn/DHDbUXMyzo=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=l6cVLQIC+iTzBMm6GHxysMI2+EP6A/1+Kwrs0x8eQ+66wHmB80zeG/+ew0wMqSu9O
	 Ajp3JL1CmvEM3Wvkk+/PapafWaIxdd022wmSpN/2nW7tK1QAjg5tqv9lYs6/zxcBTA
	 71vicGFMkdT167C3dPbqGrUNkRFrF9QZlK/l3sxD0FpxJqjSLzEQDKixpMy8Z7LzAS
	 OOJe4aSImn9v4qndgZgSrdagwhUZrUMQLt62kvu6F2Hwhvd6KHJerHE3kX7SSNpFvZ
	 XhwRBcFW+lE2K6/xPEjTvXljBpptMThicKyTlA0rM5mzxRCL778v1fxMqZSeac5uiE
	 p0KJalG38KS3Q==
Subject: [PATCH RFC 5/5] tlshd: Disable Nagle during handshakes on TCP sockets
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Mon, 17 Apr 2023 10:35:23 -0400
Message-ID: 
 <168174212348.9615.3404215595659748895.stgit@91.116.238.104.host.secureserver.net>
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

Fedora Docs suggest:
> The TLS handshake has very poor performance if the TCP Nagle
> algorithm is active. You should switch on the TCP_NODELAY socket
> option (at least for the duration of the handshake), or use the
> Linux-specific TCP_CORK option.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/handshake.c |   30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/src/tlshd/handshake.c b/src/tlshd/handshake.c
index 5bc96cb5d5aa..25940d099274 100644
--- a/src/tlshd/handshake.c
+++ b/src/tlshd/handshake.c
@@ -43,6 +43,34 @@
 #include "tlshd.h"
 #include "netlink.h"
 
+static void tlshd_set_nagle(gnutls_session_t session, int val)
+{
+	int ret;
+
+	ret = setsockopt(gnutls_transport_get_int(session),
+			 IPPROTO_TCP, TCP_NODELAY, &val, sizeof(val));
+	if (ret < 0)
+		tlshd_log_perror("setsockopt (NODELAY)");
+}
+
+static void tlshd_save_nagle(gnutls_session_t session, int *saved)
+{
+	socklen_t len;
+	int ret;
+
+
+	len = sizeof(saved);
+	ret = getsockopt(gnutls_transport_get_int(session),
+			 IPPROTO_TCP, TCP_NODELAY, saved, &len);
+	if (ret < 0) {
+		tlshd_log_perror("getsockopt (NODELAY)");
+		saved = 0;
+		return;
+	}
+
+	tlshd_set_nagle(session, 1);
+}
+
 /**
  * tlshd_start_tls_handshake - Drive the handshake interaction
  * @session: TLS session to initialize
@@ -77,9 +105,11 @@ void tlshd_start_tls_handshake(gnutls_session_t session,
 	}
 
 	gnutls_handshake_set_timeout(session, parms->timeout_ms);
+	tlshd_save_nagle(session, &saved);
 	do {
 		ret = gnutls_handshake(session);
 	} while (ret < 0 && !gnutls_error_is_fatal(ret));
+	tlshd_set_nagle(session, saved);
 	if (ret < 0) {
 		switch (ret) {
 		case GNUTLS_E_CERTIFICATE_VERIFICATION_ERROR:



Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533735696
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 17 Feb 2023 11:31:48 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 5661F338F0;
	Fri, 17 Feb 2023 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676633506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ych79jSK/SAV4mMh1LoaO2dU2DaSwLcT8rcf8PczBU=;
	b=leqf6LZMm5VJMl+EzgUdecDC5mRlPRiJ4AKyX2AvaijuhCRWs17Cs9IbwpLqycu5JHVK4D
	V9Np7iKcqJVoldy1CIJEF/dfy2rpOHMbzw6qvW3eTsxmURLWyrznVpVzMA4dype5cf3mx8
	Ei3AfldbEfY/zApns+/dED60lpqhRn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676633506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ych79jSK/SAV4mMh1LoaO2dU2DaSwLcT8rcf8PczBU=;
	b=7NPGd3jxvNNipE8RghJXEyKZDqQtvijoWpseHxeTFgvyc8DZSDzWPbGplXCinDTSSun+GT
	P3lI460BMMRV+tBw==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id 461732C143;
	Fri, 17 Feb 2023 11:31:46 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 3BDD851BD98B; Fri, 17 Feb 2023 12:31:46 +0100 (CET)
From: Hannes Reinecke <hare@suse.de>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 2/4] tls-handshake: add 'keyring' netlink attribute
Date: Fri, 17 Feb 2023 12:31:43 +0100
Message-Id: <20230217113145.18916-3-hare@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217113145.18916-1-hare@suse.de>
References: <20230217113145.18916-1-hare@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a 'keyring' netlink attribute to the 'request' netlink
message to allow the kernel to communicate the keyring to use
to userspace.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 include/net/tls.h              | 1 +
 include/uapi/linux/handshake.h | 1 +
 net/tls/tls_handshake.c        | 8 ++++++++
 3 files changed, 10 insertions(+)

diff --git a/include/net/tls.h b/include/net/tls.h
index 51bf5a083cce..f4baf3b4b179 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -524,6 +524,7 @@ enum {
 	TLS_NO_CERT = 0,
 	TLS_NO_PRIVKEY = 0,
 	TLS_NO_TIMEOUT = 0,
+	TLS_NO_KEYRING = 0,
 };
 
 typedef void	(*tls_done_func_t)(void *data, int status,
diff --git a/include/uapi/linux/handshake.h b/include/uapi/linux/handshake.h
index b007e346cfc8..83705b1d1e9a 100644
--- a/include/uapi/linux/handshake.h
+++ b/include/uapi/linux/handshake.h
@@ -65,6 +65,7 @@ enum handshake_tls_accept_attrs {
 	HANDSHAKE_GENL_ATTR_TLS_X509_PRIVKEY,
 	HANDSHAKE_GENL_ATTR_TLS_PSK,
 	HANDSHAKE_GENL_ATTR_TLS_TIMEOUT,
+	HANDSHAKE_GENL_ATTR_TLS_KEYRING,
 
 	__HANDSHAKE_GENL_ATTR_TLS_ACCEPT_MAX
 };
diff --git a/net/tls/tls_handshake.c b/net/tls/tls_handshake.c
index 66adac8d660a..8171b3c8f3a5 100644
--- a/net/tls/tls_handshake.c
+++ b/net/tls/tls_handshake.c
@@ -43,6 +43,7 @@ struct tls_handshake_req {
 	int			th_type;
 	int			th_auth_type;
 	unsigned int		th_timeout;
+	key_serial_t		th_keyring;
 	key_serial_t		th_peerid;
 	key_serial_t		th_certificate;
 	key_serial_t		th_privkey;
@@ -74,6 +75,7 @@ tls_handshake_req_init(struct handshake_req *req, tls_done_func_t done,
 	treq->th_certificate = TLS_NO_CERT;
 	treq->th_privkey = TLS_NO_PRIVKEY;
 	treq->th_timeout = TLS_NO_TIMEOUT;
+	treq->th_keyring = TLS_NO_KEYRING;
 	return treq;
 }
 
@@ -170,6 +172,12 @@ static int tls_handshake_put_accept_resp(struct sk_buff *msg,
 		if (ret < 0)
 			goto out;
 	}
+	if (treq->th_keyring != TLS_NO_KEYRING) {
+		ret = nla_put_u32(msg, HANDSHAKE_GENL_ATTR_TLS_KEYRING,
+				  treq->th_keyring);
+		if (ret < 0)
+			goto out;
+	}
 
 	ret = nla_put_string(msg, HANDSHAKE_GENL_ATTR_TLS_PRIORITIES,
 			     treq->th_priorities);
-- 
2.35.3


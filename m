Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB801E5B6D
	for <kernel-tls-handshake@lists.linux.dev>; Tue,  1 Jul 2025 06:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351610; cv=none; b=U6bXzQhWm7HgeZnzXFMa726Tva5vgo3PqTw+kF/S4BNF1ZlSxu0W0AkQX0oeDyEhk5kS7FjWPfCIOZF6soFkUPXxUBQgIgZw2iV+NQkEbbMCzI8QAZIf3ngeslm1rrVJ6TsOyZ/Gxc5KuqxHd677gZE5L7GT89uJt/mjQsmXKNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351610; c=relaxed/simple;
	bh=nRftS0ENDEH/pDYWOnOsThgf8D/qGdIep323gWRp0iw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D8IUlwOvS8iSrA7KA3zhjIp0xIV8sgoDrEeS5FPYAg+IAsP47wVWSmEfjYaHYwu1UeUBdNYhWN7Um8ani7uNEvs8xgZkE8zIZ6YSP4Vwm8103erllN18GaZk4BzJuBF2TcO6mQwjQGpf1JUSB/FyO2tsn+/V8yDrhqPxl2ViGk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/Ox+lpd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/Ox+lpd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3939EC4CEEE;
	Tue,  1 Jul 2025 06:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751351610;
	bh=nRftS0ENDEH/pDYWOnOsThgf8D/qGdIep323gWRp0iw=;
	h=From:To:Cc:Subject:Date:From;
	b=J/Ox+lpdVL9WzxQguIcefxModIdyalQP9eNRHz5kMtdWPRnMPpu0N/TnaKJc05M8l
	 UufMLBLTCHMz7uHoDHCgLoW8NC7GpApMElo0csXgEELVPKOL/QyG25Hxk5BrqOjQBs
	 3vB399KmkYQJ8SCsIKAA7Cw+fM+0FPQecHnVmiq8fRepXTp3EI6g8e08JmobOSbj0m
	 fRtanH1qZ+zbtvqJgDt5YEvG5S87PCTsQVZQW45Ir0C6jkimmt1HV71hBMs9y8BOSh
	 U1qdWIVlrtheRNRzTrg8eCDXBEbgZZWpr3IOu+Jnq90pg2D3OqCUEyYc1s9HMbbH6K
	 m/kOVE+GLe/oQ==
From: Hannes Reinecke <hare@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>,
	Hannes Reinecke <hare@kernel.org>
Subject: [PATCH] net/handshake: Add new parameter 'HANDSHAKE_A_ACCEPT_KEYRING'
Date: Tue,  1 Jul 2025 08:33:20 +0200
Message-ID: <20250701063320.67849-1-hare@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hannes Reinecke <hare@suse.de>

Add a new netlink parameter 'HANDSHAKE_A_ACCEPT_KEYRING' to provide
the serial number of the keyring to use.

Signed-off-by: Hannes Reinecke <hare@kernel.org>
---
 include/uapi/linux/handshake.h | 1 +
 net/handshake/tlshd.c          | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/uapi/linux/handshake.h b/include/uapi/linux/handshake.h
index 3d7ea58778c9..662e7de46c54 100644
--- a/include/uapi/linux/handshake.h
+++ b/include/uapi/linux/handshake.h
@@ -45,6 +45,7 @@ enum {
 	HANDSHAKE_A_ACCEPT_PEER_IDENTITY,
 	HANDSHAKE_A_ACCEPT_CERTIFICATE,
 	HANDSHAKE_A_ACCEPT_PEERNAME,
+	HANDSHAKE_A_ACCEPT_KEYRING,
 
 	__HANDSHAKE_A_ACCEPT_MAX,
 	HANDSHAKE_A_ACCEPT_MAX = (__HANDSHAKE_A_ACCEPT_MAX - 1)
diff --git a/net/handshake/tlshd.c b/net/handshake/tlshd.c
index d6f52839827e..081093dfd553 100644
--- a/net/handshake/tlshd.c
+++ b/net/handshake/tlshd.c
@@ -230,6 +230,12 @@ static int tls_handshake_accept(struct handshake_req *req,
 		if (ret < 0)
 			goto out_cancel;
 	}
+	if (treq->th_keyring) {
+		ret = nla_put_u32(msg, HANDSHAKE_A_ACCEPT_KEYRING,
+				  treq->th_keyring);
+		if (ret < 0)
+			goto out_cancel;
+	}
 
 	ret = nla_put_u32(msg, HANDSHAKE_A_ACCEPT_AUTH_MODE,
 			  treq->th_auth_mode);
-- 
2.43.0


Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4C0B677
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 26 Aug 2024 18:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724696817; cv=none; b=jOkQaagUhsqYcKdcDgT3B8SDVS5ZWn1DpbYbYnsQSF3tHEc7srKUh7sDtkkDvLHtXcwMdVKtOpajRZJ0OL0iPYMP7ort/phbcrhh0Oz2kcSk75WLDu5I6/69MrsHQ3RsO9CHRlzB5mtHnjUmtvqsaOJnTbEQVBQqxoVUdG86+ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724696817; c=relaxed/simple;
	bh=vf6hjI1ICx8m4r7yxx7EU9Z1Etq83mh+tT3xC191mFA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P6I9zVyFbaQC0R0p8i2bwjfT+HxmB8m0UQOOIWsTh75rHvyAXYQMu8GMYEs2eNKDO4DkABtPVGmYcNE25vTpRDMuXQVWbdwhGFB68CZyidYLaXJudi5aPiSLEKlV+ZnZzHo/B4WIwoQ1IiIOET/1kr1DX3hP75O98VYnfZ0rjFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=PPI+sVBd; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="PPI+sVBd"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7a66907fa39so285969485a.3
        for <kernel-tls-handshake@lists.linux.dev>; Mon, 26 Aug 2024 11:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724696814; x=1725301614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HMZCb7iB66Y1W1Ryns5DKj2T2TKMVtliIt3MIZTvWbI=;
        b=PPI+sVBdBfftm2RoBL9V0lJEqJyS18hYNDppyTl6PnPnpqhfwyjx8OnMzbTIwrOXb8
         7vyr/8rdjvpDGvbEFUoPg2f+gZeQYr1VxeQIk1iTYUvOVEPv0JoQxhZV8bVODsgyoqF2
         GhBBHj8zg+9nWxJqZj1xjFmXTlygL8Fzj7BQjRJqPKlGY4ypwwpbta6JOEsWYt832HMa
         qj5Rsq9pPrQdF67W0r4buijW1Mp3AUpEV7SEm6UW2uA9amxDIIqVqmfWZengjBrXK3+z
         B9tfzgxJyHhOynhBoCRT6xipxQKWB0a9tF/fbO2VxltLGS225ZJiwq8XcTlz0Vnop1p+
         V1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724696814; x=1725301614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMZCb7iB66Y1W1Ryns5DKj2T2TKMVtliIt3MIZTvWbI=;
        b=UguSS6cRb8MHz3yePAme/sQejQ+HwRQnjrp7OSM84cTYF3B4anZWs1tAHcLtzzQ+1C
         m/sowwzKXMdmSphqdxDOGtOw5X3XhepZkOlODyCgOFL+G/DxNKCj5bp8bwbOxDmJDX+P
         pFLUfyRqfX+4ZafZnjBBex0RVt/PSgKGV7m3jL8QDWfxIEXvWRDikafLk6eIV2Pgnnxa
         u7hMdI8b8MuYp9Ty9GmJpbTlEnVIiePcEzrQsQ2YzhFaEJMSWY+EFM8aSwcPruXn2+Wn
         xu3zlNmFwRzW4F4g12trs2KO89mR+GmG/IXu6HxXdN2EFpDsPoWj+LGOQ2bVtgg0epWL
         C+mA==
X-Gm-Message-State: AOJu0YwvyfDUNeylU3tZzMHLeaveMT3/frImELLLsiCX/8RDG/XpMpZv
	CFhQMlimKudQKb40u5j6UZHPD0xA7dYU2fAq8p/hDmBz4xbp2TrMMKLrTcGlI4c=
X-Google-Smtp-Source: AGHT+IGMbwrMjTB6suqc2Zw4TDMy5Z2Pr87vUDeGD69GcUGpb6D/dsdkRq53eYkvtU6pia34scjiQg==
X-Received: by 2002:a05:620a:170b:b0:79e:ffc6:c435 with SMTP id af79cd13be357-7a6897c4103mr1085304085a.63.1724696813847;
        Mon, 26 Aug 2024 11:26:53 -0700 (PDT)
Received: from localhost ([130.44.215.91])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a67f3622fasm478294685a.70.2024.08.26.11.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 11:26:53 -0700 (PDT)
From: A K M Fazla Mehrab <a.mehrab@bytedance.com>
To: netdev@vger.kernel.org
Cc: kernel-tls-handshake@lists.linux.dev,
	chuck.lever@oracle.com,
	A K M Fazla Mehrab <a.mehrab@bytedance.com>
Subject: [Patch net-next] net/handshake: use sockfd_put() helper
Date: Mon, 26 Aug 2024 18:26:52 +0000
Message-Id: <20240826182652.2449359-1-a.mehrab@bytedance.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace fput() with sockfd_put() in handshake_nl_done_doit().

Signed-off-by: A K M Fazla Mehrab <a.mehrab@bytedance.com>
---
 net/handshake/netlink.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/handshake/netlink.c b/net/handshake/netlink.c
index 89637e732866..7e46d130dce2 100644
--- a/net/handshake/netlink.c
+++ b/net/handshake/netlink.c
@@ -153,7 +153,7 @@ int handshake_nl_done_doit(struct sk_buff *skb, struct genl_info *info)
 	if (!req) {
 		err = -EBUSY;
 		trace_handshake_cmd_done_err(net, req, sock->sk, err);
-		fput(sock->file);
+		sockfd_put(sock);
 		return err;
 	}
 
@@ -164,7 +164,7 @@ int handshake_nl_done_doit(struct sk_buff *skb, struct genl_info *info)
 		status = nla_get_u32(info->attrs[HANDSHAKE_A_DONE_STATUS]);
 
 	handshake_complete(req, status, info);
-	fput(sock->file);
+	sockfd_put(sock);
 	return 0;
 }
 
-- 
2.20.1


Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67539459
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 21 Mar 2023 12:44:10 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 176D220007;
	Tue, 21 Mar 2023 12:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1679402638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pCtaP9beJ7whuRGtckdI0e9bOwhehZSrmwfkRW3uOc0=;
	b=iPiI+EXeYQRt5KZmmYU0z/Az1rMQCIn7Olk/t5R7SGL8PeK77iBDOoEPDktLNBRDsTOUwG
	dyhnadkA9p8Io7VONkuq28BgiViFc6+zsnPucK8aSc4o/B7ndt95pEOR6Zi7EkksSlButa
	2XoeHSnzXGTPFh7Jo7DDux03THVqK5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679402638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pCtaP9beJ7whuRGtckdI0e9bOwhehZSrmwfkRW3uOc0=;
	b=Gekg9JWlOqihBC4wNyj8tj5HOzcwTowiJuO3KkDCoSN6G5sZEEyEtPulOhEFFHfNDqWrYS
	/NmK9kJc5f3wYDCQ==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id 07BEB2C15F;
	Tue, 21 Mar 2023 12:43:58 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 0419D51BEEB0; Tue, 21 Mar 2023 13:43:58 +0100 (CET)
From: Hannes Reinecke <hare@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <cel@kernel.org>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 14/18] security/keys: export key_lookup()
Date: Tue, 21 Mar 2023 13:43:21 +0100
Message-Id: <20230321124325.77385-15-hare@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230321124325.77385-1-hare@suse.de>
References: <20230321124325.77385-1-hare@suse.de>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For in-kernel consumers one cannot readily assign a user (eg when
running from a workqueue), so the normal key search permissions
cannot be applied.
This patch exports the 'key_lookup()' function for a simple lookup
of keys without checking for permissions.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 security/keys/key.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/security/keys/key.c b/security/keys/key.c
index 5c0c7df833f8..bd1b7d45df90 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -693,6 +693,7 @@ struct key *key_lookup(key_serial_t id)
 	spin_unlock(&key_serial_lock);
 	return key;
 }
+EXPORT_SYMBOL_GPL(key_lookup);
 
 /*
  * Find and lock the specified key type against removal.
-- 
2.35.3


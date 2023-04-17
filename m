Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4EC846B
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 17 Apr 2023 13:03:11 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 5F27E21A75;
	Mon, 17 Apr 2023 13:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681736584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgcbHjUM943PrxMYrNm3+n6vXvKWv1aWg1e0dDLWooY=;
	b=1Kl5vKDy7zqKF1Ek08djyI8/btH8Y0nU2dzwBVZwOSEl4BubkVBbvAMCU4ys/SfdXtaUDY
	utGl8Bnl8MoZj3RPQn7/mh2JY2J04+0/aAdlFT2zmwIvOMvKPNsILnya238+8HQGpCGJBZ
	OH5eXG+ydhfDXxmlUEo9S5NWALZZeAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681736584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgcbHjUM943PrxMYrNm3+n6vXvKWv1aWg1e0dDLWooY=;
	b=rfs/hGg0NoujtP4hFfH9tBfc5Z03rbF3PgHoqFg5l2ncf8OXAKVoyI0gmZ1nff0m3Q7tP7
	to7Qy7Iw1GjPpyAg==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
	by relay2.suse.de (Postfix) with ESMTP id 2DC442C153;
	Mon, 17 Apr 2023 13:03:04 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
	id 29AD151C25AC; Mon, 17 Apr 2023 15:03:04 +0200 (CEST)
From: Hannes Reinecke <hare@suse.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	Chuck Lever <chuck.lever@oracle.com>,
	kernel-tls-handshake@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>,
	David Howells <dhowells@redhat.com>
Subject: [PATCH 09/18] security/keys: export key_lookup()
Date: Mon, 17 Apr 2023 15:02:53 +0200
Message-Id: <20230417130302.86274-10-hare@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230417130302.86274-1-hare@suse.de>
References: <20230417130302.86274-1-hare@suse.de>
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

Cc: David Howells <dhowells@redhat.com>
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


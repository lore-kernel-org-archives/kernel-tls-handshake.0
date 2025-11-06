Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888B5345730
	for <kernel-tls-handshake@lists.linux.dev>; Thu,  6 Nov 2025 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762440331; cv=none; b=OYVrLwflqlPXafQjJY42s9/w1NPHFt1tqRXO2RE6sOmF7fzJ7+wfs9Ws9kI/ccnf50ucJS/X4PLSyQA+cZNvTWdhfECvkZasvaljAFONVJ5ryzBDTDCH97P/Ijguk+ohcUNqMHT2syRC5+eSu0e6K/nklg+8Clf4n5e3l7fe3Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762440331; c=relaxed/simple;
	bh=SLO8XAogt0p729SfzU22YkQQYIdKzpqYUaujwFZtnVM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S4t9iJxuDicMvwWkoN0oGhjy/glWim4gWw9Y1LvxMD3HT1jXSxOe2VXSIppj7SYewXlJiVmQuqb0wZgpqaok5n2bJMZyQPtrG+N6uE76LRtfKvZy/rsYOZt0w9DuhqwbXbMG9v9jLitWwAmsLm6mvYhXk00CHTIyfpnF90vZqQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=DlZ9/6P3; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="DlZ9/6P3"
Received: from LAPTOP-N070L597.localdomain (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 28a8ce3b9;
	Thu, 6 Nov 2025 22:45:19 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: chuck.lever@oracle.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] net/handshake: Fix memory leak in tls_handshake_accept()
Date: Thu,  6 Nov 2025 14:45:11 +0000
Message-Id: <20251106144511.3859535-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a59a10f4403a1kunmd877133e7b53ae
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTEkaVhkdQ0tNTBlOS04dQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlLVUtVS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=DlZ9/6P39YXgRBCKj/eN1c64gHzSaYNZ98eMYYeRuIN2U04fHOJfsinKq/JtEGEqfWQYzooLP875v2rzex5eeTYjtlg2mnkGqPqHkdIXsr6+FXB63rmTgnqUlfsj+18b4U5UOEM894SuN5P08CGroqXt1iHFwipnwyclqRa955Y=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=h0YUkunlqJUAnhC/gNJ/0mAwbV93Almf7qIwemX0/vQ=;
	h=date:mime-version:subject:message-id:from;

In tls_handshake_accept(), a netlink message is allocated using
genlmsg_new(). In the error handling path, genlmsg_cancel() is called
to cancel the message construction, but the message itself is not freed.
This leads to a memory leak.

Fix this by calling nlmsg_free() in the error path after genlmsg_cancel()
to release the allocated memory.

Fixes: 2fd5532044a89 ("net/handshake: Add a kernel API for requesting a TLSv1.3 handshake")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 net/handshake/tlshd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/handshake/tlshd.c b/net/handshake/tlshd.c
index 081093dfd553..8f9532a15f43 100644
--- a/net/handshake/tlshd.c
+++ b/net/handshake/tlshd.c
@@ -259,6 +259,7 @@ static int tls_handshake_accept(struct handshake_req *req,
 
 out_cancel:
 	genlmsg_cancel(msg, hdr);
+	nlmsg_free(msg);
 out:
 	return ret;
 }
-- 
2.34.1


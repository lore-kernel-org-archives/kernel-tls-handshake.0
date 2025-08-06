Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC8726E146
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Aug 2025 19:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754507149; cv=none; b=fyJULWTAxy2vgBJJ4GVZpeud+wamVfR9vC5IldVKOSutN/gujLN16Q9KDP25L3LGhR1nTj+hy2g0MUnD57sMLqi4Aq14CfE8vTbIIrEepldL0lpWrr3GHnLYsicXo8GssrAuDMiGtdI32AClcDx+/Lwusg/Nv35KwaxrWOjzhnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754507149; c=relaxed/simple;
	bh=5OcusZLYSMLBttsEgZEYLFnxubBmuslZrNM5s4Zitk4=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=emGV0si8zZnGxN51uwtGWXn6KLlZG83gTXIlNoKWSGlY4+5pPJhA9K0sjcqLcR1BI2MXi+mkZgITRtYMnMMX9ursGWPVu936SBV2cZN26J4ofLJW2UBCfcQBahqQeFfX0HMVNC8A2TpNqlut4n4s93R1qnfnXjjlzO7atqseUFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUPBnXMY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUPBnXMY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04EDEC4CEE7
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Aug 2025 19:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754507149;
	bh=5OcusZLYSMLBttsEgZEYLFnxubBmuslZrNM5s4Zitk4=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=XUPBnXMYtYjFo5Z3/qwYcovWpZwWpYzxvroqKHnYMxoLy0uCVUdFaDOgE6H/M2vIz
	 vkV7aP4ERspMuH4UeOf7Btp8yCzrWlbk6dEPgydDD+Qq4D2sESmawMTZx8mzCrj8gL
	 rWkINdV2fMF1lUARDSkI5UqiNSwsknaG8imqpjQbo1mTCHI7ZFu+qUDRdrqQykOQ51
	 +ftck+kNEU/+2Qa6FnrKyy5B1FeTahvN8SnHAPTrfLfLg17AofzZHg+MAIg517WD84
	 ku468IsAsIYAI8IsuECIcqsPwEzNqXJ1svO/7OCRdpTTFpDYtRwV9TJLvOBie0z/iO
	 fZvdCaE5DjVTg==
Subject: [PATCH 7/8] tlshd: Update netlink.h
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Wed, 06 Aug 2025 15:05:48 -0400
Message-ID: 
 <175450714811.1882.1846990403466097127.stgit@91.116.238.104.host.secureserver.net>
In-Reply-To: 
 <175450711047.1882.7241796438866009852.stgit@91.116.238.104.host.secureserver.net>
References: 
 <175450711047.1882.7241796438866009852.stgit@91.116.238.104.host.secureserver.net>
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

Add the definition for the new "tag" attribute. Copied from the
Linux kernel's include/uapi/linux/handshake.h .

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/netlink.h |    1 +
 1 file changed, 1 insertion(+)

diff --git a/src/tlshd/netlink.h b/src/tlshd/netlink.h
index 662e7de46c54..06e4e91c17f2 100644
--- a/src/tlshd/netlink.h
+++ b/src/tlshd/netlink.h
@@ -55,6 +55,7 @@ enum {
 	HANDSHAKE_A_DONE_STATUS = 1,
 	HANDSHAKE_A_DONE_SOCKFD,
 	HANDSHAKE_A_DONE_REMOTE_AUTH,
+	HANDSHAKE_A_DONE_TAG,
 
 	__HANDSHAKE_A_DONE_MAX,
 	HANDSHAKE_A_DONE_MAX = (__HANDSHAKE_A_DONE_MAX - 1)



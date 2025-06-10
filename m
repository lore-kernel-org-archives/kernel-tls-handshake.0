Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F62246BD4
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 10 Jun 2025 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561955; cv=none; b=LHqelPcc/kZEziasHW6paEmE8kE4li2UfV+ZfonU36bv0cxByoYu3XP/sPiPJkdH3zmhM8E2/zzug5tZX6IoDJ1Zbgt5fZLiI+Zvp1QtQXBMpuNHaPI3PUiglpglTTPaNlFLmM1VU98qs9jhr6Sn7SkTYYxBv6xwSPaHPZ4IBxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561955; c=relaxed/simple;
	bh=0Y5C6uiVyJqZdSpo3XTPIk+3xIKeJKtqos2keRx/uSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z4oKCc/pr4B3s0KyHci6qdmtvfrlWuxWYAnEmtNGZ38Xs+2x2YcHtBI9mG0UWIZesjDgfx/a/lulDAgnCT8k67nSvIjLnnNV4AJccuyZvgRsz/ya1bku6v3OM6vQgn+e+ZXzrcrdEU2C7LBSuPt1jNqqL0mYXlxumtfm7Sl6Rbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vF8A1znx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vF8A1znx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77D0C4CEF1;
	Tue, 10 Jun 2025 13:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749561955;
	bh=0Y5C6uiVyJqZdSpo3XTPIk+3xIKeJKtqos2keRx/uSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vF8A1znxD0Twektmu6qjs4bZW4bnR1Hh9k5X0egCmAW6RwM4DLdiIwtI349rPq9Ze
	 uC93Ti6d31A1qSWWZD02Vb7OBR2ealFOV6Z5y6bdoimvMs3PFglWRoJxNM+bYPjxDy
	 v3rBuxsovqSU2a/7Lqt9sgXy3xhyhWIs79WWImuvmaOudfBZfmFNv+JBFXbFW6AVtP
	 7zC1cE4u4tpEe/yK7pL1tzqV4VTdk6jeeu/F5ZWsLzwjALg95VHczlDdekjO1WofB8
	 px99X8qN+9eN3yK4hAAFY0bNGP+O8EIT2k7xI5fxdj9rkgXc629wAzdJC8zpgDbq/a
	 tZ+HsoFnEW/Nw==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH 3/5] workflows: Limit permission of the makefile.yml action
Date: Tue, 10 Jun 2025 09:25:48 -0400
Message-ID: <20250610132550.39715-4-cel@kernel.org>
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

Suggested by CodeQL.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 .github/workflows/makefile.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.github/workflows/makefile.yml b/.github/workflows/makefile.yml
index 5d16bd9193c9..3a0ee4faeba0 100644
--- a/.github/workflows/makefile.yml
+++ b/.github/workflows/makefile.yml
@@ -6,6 +6,7 @@ jobs:
   build:
 
     runs-on: ubuntu-latest
+    permissions: read-all
     strategy:
       fail-fast: false
       matrix:
-- 
2.49.0


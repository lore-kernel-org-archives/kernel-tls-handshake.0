Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA002356D9
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  4 May 2026 07:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777878409; cv=none; b=l7ZUhkHmMAfs31VWanW20xrM3hrJInneaZpK1YKGFH3SMsqIRKMwMzguLBZRFFOqJogLpNrIw+L+67HtF8yrOJtdCnOLl/X+13kI8xiuhaGkfyYFwQMF6Q/R+i/Kuh7GEvCN3o5FLErGTMr3lyAFj+lzONEdJ/PM/Gx3gsdbBn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777878409; c=relaxed/simple;
	bh=LKta1l+KiPtbdG4Ri7FXyQtyS1HVa5eRkunXOz07ZWU=;
	h=MIME-Version:Date:From:To:Message-Id:Subject:Content-Type; b=mB2Pgppo++kMx8GGSy6Hic2hiiRynUHe6wpeAT0MYfciI9VOzEkZeT80MByBX1z46fBQoubtYupG1I26m1NbwgUad/hr93qKA3EwwL9Z/y3+UCa9/BYSaLel33SpDnHDqKBjqISgz/ZuKnlIxf6EAu1Ggd5qaudlzfIoDJljRjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnDnoP6S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnDnoP6S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D697AC2BCB8
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  4 May 2026 07:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777878409;
	bh=LKta1l+KiPtbdG4Ri7FXyQtyS1HVa5eRkunXOz07ZWU=;
	h=Date:From:To:Subject:From;
	b=JnDnoP6SOz1ztyxDm8wNFbuLfDNO/+6Qx/s2PfgvovH2JmRWuP23kG3d2MwclXWVJ
	 hrCQjwkNsm9jf/nONN6+ph78Z8HsCIrF+V2WmrQpoPdWVbBuzMa7oipDsYsS/WNejw
	 TO5EorEbG9En+OEmeSANqcTdlfcyE7E/5fNFBx/813nxEE9u8x7aAWmu2QAslvMCI4
	 s2bvU7fk2NMevRCopNNkgdOG1p5U/dpg74jXnYVjS7Q4jZJMa4wOGyxSjQqv412syg
	 NirPmc0G9LtwJ7zrnJkBAuQhx9l8a/0u+vEuT7/XJuNMUFTCYS9BiULMXSG2K+gTIr
	 K6gkUufDBQghw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id C9439F40070
	for <kernel-tls-handshake@lists.linux.dev>; Mon,  4 May 2026 03:06:47 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 04 May 2026 03:06:47 -0400
X-ME-Sender: <xms:h0X4aYa2agSAVHU4FfRVxpH3Rs4R5Zul4M1SmkoR5GJWAa-NUBKqWw>
    <xme:h0X4aePughSVL_z4LnyrPa42Yx6qW-kXQ3_72rd2E0GdwwS72nC2cld-bO7h5CVUm
    RtfDoxUXizplYexGWHQClV2Z5KPt5jg2-g6ljpa3JLZfMUPrR1VQZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepofggfffhvffkufgtgfesthejredtredttd
    enucfhrhhomhepfdevhhhutghkucfnvghvvghrfdcuoegtvghlsehkvghrnhgvlhdrohhr
    gheqnecuggftrfgrthhtvghrnhepvdeltdfgueeffeefueffjeekueekfeehtefgkefgie
    effffgveeuvdeihfelvdeunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegthhhutghklhgvvh
    gvrhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeifeegleelleehledq
    fedvleekgeegvdefqdgtvghlpeepkhgvrhhnvghlrdhorhhgsehfrghsthhmrghilhdrtg
    homhdpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    khgvrhhnvghlqdhtlhhsqdhhrghnughshhgrkhgvsehlihhsthhsrdhlihhnuhigrdguvg
    hv
X-ME-Proxy: <xmx:h0X4aYoivuCTzq8fX6AmXSmPAUm_iiWU6K8ec42M7ZwdH6YgNF1zCw>
    <xmx:h0X4aekxqm__WP9AGWtqtuMljnKp9EYKb3qDuY_PKoBf99jhHyplRQ>
    <xmx:h0X4aaGLPyZ8niK8Z2kXJZ8Pkne6Z6DCu8gT4__tORQkNdwiDdxtsA>
    <xmx:h0X4aXoGmHgoJLkXYlKhpw038bAUtc2N-_EwpJGVV4_yGi3c0Xyp6A>
    <xmx:h0X4aW5nA8JG8G5sYGwJkGFdE_wak3YupKgsE80AH09PrhznlrV8tLbV>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AA62A780070; Mon,  4 May 2026 03:06:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
x-forwarded-message-id: <oracle/ktls-utils/pull/147@github.com>
Date: Mon, 04 May 2026 09:06:27 +0200
From: "Chuck Lever" <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Message-Id: <232eab54-6aad-4b95-b1b5-97874644619e@app.fastmail.com>
Subject: Fwd: [oracle/ktls-utils] Enable and prioritize post quantum EC groups (PR
 #147)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This proposal needs some review / comment from people who are closer to
distributions than I am.

----- Original message -----
From: Leo <notifications@github.com>
To: oracle/ktls-utils <ktls-utils@noreply.github.com>
Cc: Subscribed <subscribed@noreply.github.com>
Subject: [oracle/ktls-utils] Enable and prioritize post quantum EC groups (PR #147)
Date: Monday, May 04, 2026 7:20 AM

this patch enables and prioritizes post-quantum elliptic curve groups. (i.e. those which suffixed with `-MLKEM768` or `-MLKEM1024`)

&quot;store-now-decrypt-later&quot; attack conducted by adversaries who have access to quantum computers could be mitigated by enable quantum-safe key exchange algorithms, which strengthened security for RPC-TLS.
You can view, comment on, or merge this pull request online at:

  https://github.com/oracle/ktls-utils/pull/147

-- Commit Summary --

  * feat: prioritize post quantum EC groups

-- File Changes --

    M src/tlshd/ktls.c (9)

-- Patch Links --

https://github.com/oracle/ktls-utils/pull/147.patchhttps://github.com/oracle/ktls-utils/pull/147.diff
-- 
Reply to this email directly or view it on GitHub:
https://github.com/oracle/ktls-utils/pull/147
You are receiving this because you are subscribed to this thread.

Message ID: &lt;oracle/ktls-utils/pull/147@github.com&gt;


-- 
Chuck Lever

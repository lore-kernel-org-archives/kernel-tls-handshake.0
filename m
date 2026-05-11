Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729ED33C1B4
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 11 May 2026 11:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778498244; cv=none; b=PTcpFTRKnjzK9RsDiASQ2hPUziVgj4MveP6xG82VW8uzRNVYBIeUTIBXeCFZE5zNWdtzQqswAxJK0ZeuJKEiaI+QEeARf0DNhxDqzfZdxF2/QskKtb0/zPiPtXfAC8tm/wJ2BFUqqkJAc5rXHenj7O7MvfGiVY6RMhPN78GDnFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778498244; c=relaxed/simple;
	bh=BPCIfyGDBrvhww1Zn24qGBdXJNKABf3TZizhsURoWzE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=P8KJP4jHV8KG3MkT6ncAAVRfiswY7Eqo/p4dAUPH+9zgexMrcX26yEO44Oxtl2TEwqVHWEmMNfEfESoS0Byw2jduMXMZVIhdY61orPQmiPqRtrpiLWJj8l/6uIIawHGYanzZupHHFYdOxi7fkZ38oZX+1wW88D9Ze7ZdSgZQ+Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=De7kLTxs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="De7kLTxs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E18C2BCB0
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 11 May 2026 11:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778498244;
	bh=BPCIfyGDBrvhww1Zn24qGBdXJNKABf3TZizhsURoWzE=;
	h=Date:From:To:Cc:Subject:From;
	b=De7kLTxsyZI8V0k+sHU0kO1nyRt7BHNYrKXBAe6Wx6ib2/G/xt/V6CSEj0NqOeCPX
	 2L5XQ/zJ5DAe37QPs1WnXSHs1T8l2eBj15J1IV6uarN0D2rweYCWOAO5hbdXfIsymL
	 csXmxUuiFKexeIdYoL1IKygAW9hy8D0d2hMIae7Y7utLO+RkFFH2QpilAFPIZ247hM
	 AVR1CobKr+ABwGrfHPZ+ln3GlCR/RtBYUq/srwyURZcwsIbp7zvi5gdEb7Hc7M0083
	 zbGVhG2KB2ag3qTGvIqi3HSPjQxftf4Vu8ZvMw6+L9Nju5gYBteqUHYjwKPD6YsJ2V
	 vfrCXFArS6EFA==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2888CF40074;
	Mon, 11 May 2026 07:17:23 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 11 May 2026 07:17:23 -0400
X-ME-Sender: <xms:w7oBakJodDslVJH46EjOQI65hOdiqura8AWDZCDvZ_j5N2RAnS7nCA>
    <xme:w7oBau-Dohp8tUNJudImGzcXXaXe7brcymJJMDA9B2AogFaDhJax6V6pBxX8X0DyH
    4r89JzCcHviXxYgfxsqSiLe4T46q3XAKoevMmrrDlAlvODD-HYa3c4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudekkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkffutgfgsehtjeertdertddtnecuhfhrohhmpedfvehhuhgtkhcu
    nfgvvhgvrhdfuceotggvlheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ehieevleeviefflefflefgteegffelueffheevffeiieejgeehueehfeeihfffudenucff
    ohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheptghhuhgtkhhlvghvvghrodhmvghsmhhtphgruhhthhhp
    vghrshhonhgrlhhithihqdduieefgeelleelheelqdefvdelkeeggedvfedqtggvlheppe
    hkvghrnhgvlhdrohhrghesfhgrshhtmhgrihhlrdgtohhmpdhnsggprhgtphhtthhopedv
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkvghrnhgvlhdqthhlshdqhhgrnh
    gushhhrghkvgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehhrghrvges
    shhushgvrdguvg
X-ME-Proxy: <xmx:w7oBau1jkfr1yx3eiIglg5Ko6Z11ekhTcnAnqM1fChnZxv0-39z-pw>
    <xmx:w7oBavDCBBynplGGl7UBXskb8-s8Evi7pdRAGH8ndXs3hmQuZzmF4Q>
    <xmx:w7oBaucdMfRTc4LcODDJPdT-LB7Uu1wsod2N_TfCHceGWKARpmixcw>
    <xmx:w7oBasgwU5q2vgTW3YutD89bH4IU_ebp9rNY5XQ-aVZz87JUb4ymUA>
    <xmx:w7oBauonNLfRfwiNm9TDvCfXFr8qXwCD4oB1OGXPfYqpoP54U2AkzBWs>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 08FDA780070; Mon, 11 May 2026 07:17:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
x-forwarded-message-id: <oracle/ktls-utils/pull/149@github.com>
Date: Mon, 11 May 2026 07:17:01 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Hannes Reinecke" <hare@suse.de>
Cc: kernel-tls-handshake@lists.linux.dev
Message-Id: <4d79b6e9-703e-4fbd-85d0-ec3cb88faa7b@app.fastmail.com>
Subject: Fwd: [oracle/ktls-utils] tlshd/handshake: handle the UNKNOWN_PSK_IDENTITY
 alert (PR #149)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Another pull request that needs some review. Hannes, can you have a look?

----- Original message -----
From: Wilfred Mallawa <notifications@github.com>
To: oracle/ktls-utils <ktls-utils@noreply.github.com>
Cc: Subscribed <subscribed@noreply.github.com>
Subject: [oracle/ktls-utils] tlshd/handshake: handle the UNKNOWN_PSK_IDENTITY alert (PR #149)
Date: Sunday, May 10, 2026 9:11 PM

During TLS handshake, an endpoint may issue an UNKNOWN_PSK_IDENTITY alert if it does not recognize the PSK identifier. For example, when using NVMe TCP in-band authentication with secure concatenation, if the target resets; the host kernel attempts to reconnect using a stale PSK, which the re-initialized target no longer recognizes.

Map this specific TLS alert to EKEYREJECTED. This allows the kernel to identify that the failure is due to stale credentials, trigger key revocation, and proceed with fresh in-band authentication on the next reconnection attempt.
You can view, comment on, or merge this pull request online at:

  https://github.com/oracle/ktls-utils/pull/149

-- Commit Summary --

  * tlshd/handshake: handle the UNKNOWN_PSK_IDENTITY alert

-- File Changes --

    M src/tlshd/handshake.c (4)

-- Patch Links --

https://github.com/oracle/ktls-utils/pull/149.patchhttps://github.com/oracle/ktls-utils/pull/149.diff
-- 
Reply to this email directly or view it on GitHub:
https://github.com/oracle/ktls-utils/pull/149
You are receiving this because you are subscribed to this thread.

Message ID: &lt;oracle/ktls-utils/pull/149@github.com&gt;


-- 
Chuck Lever

Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2324D17741
	for <kernel-tls-handshake@lists.linux.dev>; Wed, 21 May 2025 01:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747789238; cv=none; b=gXo9XbrlVlS1jxJRGFTg5Az/LBIKu5Hl21nCxKTzfUs8CSQ1syRfnyehQL+d1LnMjhgrQ0QHEwj9dcx4KrlHPdIo1l6QnWwbMPWBBmyydkNXEmTcE25AN44CyPL8fy72hqD3GYFdMfTtZkeCiCzbNCQGmHerddZCP8aJzBJ7I/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747789238; c=relaxed/simple;
	bh=RdVnlsDhQOjWUSXO5SBd5GuN6FGwxiHVCPIQkhcjbM0=;
	h=MIME-Version:Date:From:To:Message-Id:Subject:Content-Type; b=KiAE8fhn7p3RGD7MBEiBDesJOMqojzaSTQFZlCedUatW+HEd/S4hQQCUdaqh1Ip4a+fGzUISpTSc3WQePgtujR6zq4nZKGzSime+ujgYTr5WYXP0/vKnDIOeayWnQKX5/+KGXKRZbzwA6VpuDXIIapN69ky1V/jhvAc+/eDm2LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alistair23.me; spf=pass smtp.mailfrom=alistair23.me; dkim=pass (2048-bit key) header.d=alistair23.me header.i=@alistair23.me header.b=nf6OnlA/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E6ssQ6QL; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alistair23.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alistair23.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alistair23.me header.i=@alistair23.me header.b="nf6OnlA/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E6ssQ6QL"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 0CBDE1380466
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 20 May 2025 21:00:34 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-04.internal (MEProxy); Tue, 20 May 2025 21:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1747789234; x=1747875634; bh=Rd
	VnlsDhQOjWUSXO5SBd5GuN6FGwxiHVCPIQkhcjbM0=; b=nf6OnlA/CNUAT9o3Qm
	4qlnzUAu4YT9qCiVzzt7MRHfKXyTyeV8v3JcAJP60cKHl6DFG2Fh5MOC3FKED2fI
	iATjWUU4KmhIJpr6BjWU/+jIC8v0D1htTUTSJswhT4x9zIfbm3YWKMlI4MVnJAd+
	YdFapKDtqCqNJyocwy+a3TWDo1fBM6zviBSw+3yuqvYKyToCSADuy/hyv9soxHzQ
	rA84LjW4hAzNBpppjJucD6/20bQZ0MMKzXBLWt1tJUXOgWDA3i3Q7iUA6ORCdTsg
	s7aS7NjM0dclINQ6xEKn6oVJHLvWe22Tx0b59/zBW9Ld67m9+LhJBZGtoSEarIJu
	VlEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747789234; x=1747875634; bh=RdVnlsDhQOjWUSXO5SBd5GuN6FGwxiHVCPI
	QkhcjbM0=; b=E6ssQ6QLH1uqSH9rLq6h/WCTLy1qyzh/r4VhjyNAQbyn0nEED36
	wObuq7k10DLtAlfy+7gW0K4nAaIYi83saWyhL50+td/kmjlNCsOhP4UGJ9H45HOi
	vNN8V/yrNRpBB9dYnbBhas+62wx2k7cI7QqiIqtNNFC+AYZN5JZEXCpT6oyoTs4m
	gWB3Zo5am2n7BDjE+5NK91U67xSzyMMVOVIyDU/Ly39B1qLNW9wLhNeZHm0aDsXR
	xILT51ejDyfMvQzSAtsfpP3Jid9sc4bvr019H8UR/T83yjqmjdBa2IN+UWt+ydWo
	HaHedYq9o0Ig9DN0CUllAL3zqAF+pCPfmAw==
X-ME-Sender: <xms:sSUtaJdzsOkNswJMstcLFAsA2w2ugojkWe6Lp77gLAWWH363XfAAqA>
    <xme:sSUtaHP9JNHImhZ1fOGiUOcdplY7GZ_zSk4E7sBrkzX6BJs5UugZtTw7EV8m5NUb_
    DroU2wwY5mBS40jEKk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujedvucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucenucfjughrpefoggffhffvkffutgfgsehtjeertdertddtnecuhfhrohhmpeetlhhi
    shhtrghirhcuoegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrf
    grthhtvghrnhepuedvtdekjeehleelffetteejgfetkeehkeeiiedvueejveetgfetvdel
    ffetleetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgr
    ihhrvdefrdhmvgdpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepkhgvrhhnvghlqdhtlhhsqdhhrghnughshhgrkhgvsehlihhsthhsrdhlihhn
    uhigrdguvghv
X-ME-Proxy: <xmx:sSUtaCiU2Z8q9XndkTS4nV-oE76d2LTUTeD3CLZPLWE4me2ESH2w5g>
    <xmx:sSUtaC9xgxRLF0S8s8Kei-d358UHHe67ZnnY8qxzHm1kBBQ58edxog>
    <xmx:sSUtaFsvPymqRfBlbZB6Bg9FQpseY3UfNJrpw1ak0CVX5CtQHIBVqg>
    <xmx:sSUtaBGIPWdkM8YT-Qet9tnOEtpockICMpq6Xsr_3YqSfPSU3SFQbA>
    <xmx:siUtaLDWNaM5fEqYh-hkrM_vhEl96hPOHiLGZJEdY0Ud7Fxx69s_Du40>
Feedback-ID: ifd214418:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 78F4F18C0061; Tue, 20 May 2025 21:00:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 21 May 2025 11:00:12 +1000
From: Alistair <alistair@alistair23.me>
To: kernel-tls-handshake@lists.linux.dev
Message-Id: <ba83aadd-8a2e-4080-a6b5-bef272fea606@app.fastmail.com>
Subject: KeyUpdate Support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Currently tlshd uses `fork()` to fork the entire process after the kernel
sends a netlink message. tlshd then calls the `tlshd_service_socket()`
function from the child process and exits.

This provides a high barrier between different handshake requests and
ensures everything is freed when a handshake is complete.

The problem with the current setup is that it makes it very difficult to
share information between `tlshd_service_socket()` and the parent process.
For security and system resources that's great, but it has the large down
side of not supporting the TLS KeyUpdate.

In the future we would like to support the TLS KeyUpdate mechanism, which
means we need to maintain the `gnutls_session_t session` information for a
connection to allow us to issue a KeyUpdate later on.

AFAIK there is no way to re-create the `gnutls_session_t session` so we need
to store it somewhere. We could pass it to the kernel and have the kernel
pass it back. But `gnutls_session_t session` is gnutls internal state, so
it's not fixed size making that tricky to do. Plus it will break if gnutls
updates between a handshake and KeyUpdate.

The other option is to pass the session data from the child process back
to the tlshd parent process. The parent can then store the session data
(maybe in a database?) and use it as required.

I submitted the first step towards supporting that as a PR [1]. The PR
changes the current `fork()` multi-process mechanism to a `g_thread_new()`
threading mechanism.

In the future this will allow us to maintain the gnutls_session_t session
in the parent process, allowing KeyUpdate support. This could also be
supported with `fork()` and IPC as well, but that is clunky-ier.

My approach [1] hasn't been accepted, so now I'm trying to see what
ideas other people have for supporting KeyUpdate?

1: https://github.com/oracle/ktls-utils/pull/95

Alistair

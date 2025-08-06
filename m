Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847E81A76B1
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Aug 2025 19:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754507124; cv=none; b=UTd4Wi6pxmTo4OXwWwkSFYYm+n8KPEDtyI3OotE63nX+5iLBUmELIJK6ziIkZ9kO2CZbnenxT1alb+VIF4kgKKr9NX8j24zu5X4k+T7G4TUmDXYwGpnBNJXwwxgHBQF08N87HHbDo4PjjDqwUkGT1CvYJoKel54dbCWATonPZ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754507124; c=relaxed/simple;
	bh=kgBcuiKjlBK0FZn6bWcLIltcFZzcf6aqpMKBm/qh5kY=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lLl1lqIMAvA3EliTiJo18DKIf4UKAUjVmQCTTbNEUtxxll9VONlsP4j8ZF0mzbtTGftuzaXUtnAvTv1HoGsi1KK+gDvBq3AZ/HxB/eqeeKZBSTDRX8eR86nwW6GmN2dK/JTztFm6h5ZRsPBIuYszxM9fulpOdvPw4RojSdHVZwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ct4QmHIm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ct4QmHIm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BECC4CEE7
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Aug 2025 19:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754507124;
	bh=kgBcuiKjlBK0FZn6bWcLIltcFZzcf6aqpMKBm/qh5kY=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=ct4QmHImbX2i4p3FlWvU+7CFX9CXJBf8xUPZigXm4Nx+2jfbzrbOYL6p9uIy5+VQU
	 Gg3icS7fKBRbaFRn5SfbfV2sRalRs7HqcTdzVV87heVoe0pTl9bNEuw44nJeCj+wHJ
	 v6T+so4zEbsIkuVdjabmC6NckiSeCdSpZHweyQYF9Hk+MzjLe2zXORJHIb6XnFycQK
	 TvQCq62kKuFF5kscmo3eQMjrxW8oRSuDY2iuZ1te035k6TRQa/Xq6NfTraOmSAqbfI
	 sLTCL1sOGJh6fr4FkN0tZjUwCC7H7xVN7OOVLbsWf+IHqilkKo4XVmBcjsalWqDw61
	 64pmgy1+l/ZxQ==
Subject: [PATCH 3/8] configure.ac: Add libyaml dependency
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Wed, 06 Aug 2025 15:05:23 -0400
Message-ID: 
 <175450712311.1882.18091898648930403577.stgit@91.116.238.104.host.secureserver.net>
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

I'm about to introduce a feature that is configured via YAML
documents. Add a configure.ac dependency for the library to be used
for handling those configuration documents.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 .github/workflows/makefile.yml |    2 +-
 configure.ac                   |    3 +++
 src/tlshd/Makefile.am          |    4 ++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/.github/workflows/makefile.yml b/.github/workflows/makefile.yml
index 3a0ee4faeba0..4bec55638946 100644
--- a/.github/workflows/makefile.yml
+++ b/.github/workflows/makefile.yml
@@ -22,7 +22,7 @@ jobs:
     - name: Install dependencies
       run: |
         sudo apt-get update
-        sudo apt-get -y install gnutls-dev libkeyutils-dev libnl-3-dev libnl-genl-3-dev libglib2.0-dev
+        sudo apt-get -y install gnutls-dev libkeyutils-dev libnl-3-dev libnl-genl-3-dev libglib2.0-dev libyaml-dev
 
     - name: Configure
       run: |
diff --git a/configure.ac b/configure.ac
index 1a9c7947171e..4db7c677eb91 100644
--- a/configure.ac
+++ b/configure.ac
@@ -62,6 +62,9 @@ AC_SUBST([LIBNL3_LIBS])
 PKG_CHECK_MODULES([LIBNL_GENL3], libnl-genl-3.0 >= 3.1)
 AC_SUBST([LIBNL_GENL3_CFLAGS])
 AC_SUBST([LIBNL_GENL3_LIBS])
+PKG_CHECK_MODULES(LIBYAML, [yaml-0.1])
+AC_SUBST([LIBYAML_CFLAGS])
+AC_SUBST([LIBYAML_LIBS])
 
 AC_CHECK_HEADER([linux/quic.h],
               [AC_CHECK_LIB([gnutls], [gnutls_handshake_set_secret_function],
diff --git a/src/tlshd/Makefile.am b/src/tlshd/Makefile.am
index 2bde5d147e19..1150c168e62f 100644
--- a/src/tlshd/Makefile.am
+++ b/src/tlshd/Makefile.am
@@ -22,11 +22,11 @@ EXTRA_DIST		= $(man8_MANS)
 sbin_PROGRAMS		= tlshd
 tlshd_CFLAGS		= -Werror -Wall -Wextra $(LIBGNUTLS_CFLAGS) \
 			  $(LIBKEYUTILS_CFLAGS) $(GLIB_CFLAGS) $(LIBNL3_CFLAGS) \
-			  $(LIBNL_GENL3_CFLAGS)
+			  $(LIBNL_GENL3_CFLAGS) $(LIBYAML_CFLAGS)
 tlshd_SOURCES		= client.c config.c handshake.c keyring.c ktls.c log.c \
 			  main.c netlink.c netlink.h server.c tlshd.h quic.c
 tlshd_LDADD		= $(LIBGNUTLS_LIBS) $(LIBKEYUTILS_LIBS) $(GLIB_LIBS) \
-			  $(LIBNL3_LIBS) $(LIBNL_GENL3_LIBS)
+			  $(LIBNL3_LIBS) $(LIBNL_GENL3_LIBS) $(LIBYAML_LIBS)
 
 SUBDIRS			= etc
 MAINTAINERCLEANFILES	= Makefile.in cscope.out



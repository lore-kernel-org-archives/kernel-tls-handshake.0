Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE822C15AA
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222684; cv=none; b=MCzU7cWnjvH7r2EnZhfLNvrtlOGaHYQ5XCG80D2fpLps1CL7FZ0y10K8TUAEhY8IPFHOublfOGVaS5JwYKhjdtowArwg5ObdsEzRX1m1ft6VOGsY5A5txFir/t/vXl9OwmOWCTbycXmvTVnOpp1jMRqHaAqFEwawSJHobJf5aNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222684; c=relaxed/simple;
	bh=iZhdxnlY5fC2CNwOE1xiJE6+QrAryq7wdQPy/UfV7NI=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NxjIs/B3NgdUlVb0UYjQ0uiBWqFAfhpHMK46iH0GGb6K950UR6dg65jybghe9LN4i+JD58tdJt56wADSuyr6aNkmqU98HK9PunGmqP3PYcoloj2AzE+cXeku9rnvfRkbJ30R7755n+5llRpisbzUxUnuib/7j/b2JAm606UXfUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+D9UghU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+D9UghU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3185C4CEF1
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756222684;
	bh=iZhdxnlY5fC2CNwOE1xiJE6+QrAryq7wdQPy/UfV7NI=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=e+D9UghUEfxePQgNHamLRrftJwPwqrzYZ/NciFNdcS+gWRj7Ibm1SxVEPkVquv3kG
	 xfhB98D/XHayZxk3feA+PkRmP7GCARRHp4cGGbzJsNPvjQHh2uCfI1MsEJsnlvRUOd
	 CUb8faBVIiW2G4VIGoDebmhlsXj5FfGmnRmr4M3GlyUilZctTM0fMn8SJfK+Xo2YMN
	 HN2H9WL7y55/lnQ2cvSq+gdnGNPwG9xd9YsLWcDSt8H3V8TJ6XgyMYgBMFS2J2GdMf
	 QUkUILHTJ2q1O35zL2PWElIkrpxLeElPJuYud8N03Kd03vtmPsVAzQBo9tecBp2OkW
	 dFcfOaXlo0qug==
Subject: [PATCH v2 02/11] configure.ac: Add libyaml dependency
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Tue, 26 Aug 2025 11:38:03 -0400
Message-ID: 
 <175622268308.6197.9279409526683907219.stgit@91.116.238.104.host.secureserver.net>
In-Reply-To: 
 <175622197574.6197.17170424685161235821.stgit@91.116.238.104.host.secureserver.net>
References: 
 <175622197574.6197.17170424685161235821.stgit@91.116.238.104.host.secureserver.net>
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
 .github/workflows/makefile.yml |    3 ++-
 README                         |    1 +
 README.md                      |    1 +
 configure.ac                   |    3 +++
 src/tlshd/Makefile.am          |    4 ++--
 5 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/.github/workflows/makefile.yml b/.github/workflows/makefile.yml
index d665d7905295..997e8ea1c3ac 100644
--- a/.github/workflows/makefile.yml
+++ b/.github/workflows/makefile.yml
@@ -26,7 +26,8 @@ jobs:
             libkeyutils-dev \
             libnl-3-dev \
             libnl-genl-3-dev \
-            libglib2.0-dev
+            libglib2.0-dev \
+            libyaml-dev
 
       - name: Configure
         run: |
diff --git a/README b/README
index dc28279b08d1..276f9ff110ff 100644
--- a/README
+++ b/README
@@ -33,6 +33,7 @@ following libraries to be installed:
 * keyutils
 * GLib-2.0
 * libnl3
+* libyaml
 
 ## Installation
 
diff --git a/README.md b/README.md
index dc28279b08d1..276f9ff110ff 100644
--- a/README.md
+++ b/README.md
@@ -33,6 +33,7 @@ following libraries to be installed:
 * keyutils
 * GLib-2.0
 * libnl3
+* libyaml
 
 ## Installation
 
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



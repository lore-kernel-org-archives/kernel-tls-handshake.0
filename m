Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F1E1C1F22
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Aug 2025 19:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754507118; cv=none; b=IETLC3I7XVpTkVqHrKjakl9ytBOyZpjFLjUzgtduZx1dfteflC6/uM8QQL80DQfM5Op03Y5ELmibQ/yjH0uDT6XDQvzSaszgc/z4AOiEQoF56wYMX42J0Y1u8v5og7tnWkXIpXigg+IS8ifFAo/2i7MN3S3MO34G1eWK37PEToA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754507118; c=relaxed/simple;
	bh=F/yi0Z0LjgC9rhTpN/JBaiCFBNCnInpcznwc/fBUXyU=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XTBWMCaPZC/tNyJRjKgfVZuJeJ7CVYJZz61SHXFX/8GPpAvWaJ2o0lbu4qYUFIzZTC77Ckcs3Bxm4aON4LA1z+PSvioAjNEVgQN/QLRYAV+dTnbTCuXOKsF3XyeEZeG7+JSec9aEN9nItUxjAg5u6WYHAXgtbkmk4Jmg+HPs/54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqbUc4EF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqbUc4EF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C47B5C4CEE7
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Aug 2025 19:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754507117;
	bh=F/yi0Z0LjgC9rhTpN/JBaiCFBNCnInpcznwc/fBUXyU=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=EqbUc4EFPbthOJmxlHzfTj7lzWJOS9rpzmcP+nir9BO8+f/8blWrm5FzFFiRLWvhb
	 gqmCXSu/+uzvqQJEOEdQQ7zi+g1gzvhWQ/W1GYqVwf5l6UNP3yNZBhTXDX8LJAfzys
	 iJIRNsgudGfqkkfjzaFLbO33yOzsi8u1f/YXMxeBXJybxdMcqXJeFTQLdL+bUCTxFA
	 nK0FgdqYy2owOtsBZqTKpVpKT1o9bAoFHUOX2lM3sQcnOX0thVqtLAjQmlw4rU73xd
	 MYEatZI4OmT6jwfqXfwuFEIqvymdFlMltffH+9zhPEuCMRBjBkytpPOd1qFMtpH23z
	 pLGRmcpDYASGA==
Subject: [PATCH 2/8] tlshd: Set up new /etc/tlshd/tags.d directory
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Wed, 06 Aug 2025 15:05:16 -0400
Message-ID: 
 <175450711689.1882.2671783786748410665.stgit@91.116.238.104.host.secureserver.net>
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

For "make install", create the directory that contains the files
where TLS session tags definitions reside. Introduce a YAML file
containing example TLS session tag definitions to help document this
new feature.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/etc/Makefile.am  |    3 +++
 src/tlshd/etc/tags.example |   51 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 src/tlshd/etc/tags.example

diff --git a/src/tlshd/etc/Makefile.am b/src/tlshd/etc/Makefile.am
index d067c9e3e776..7b91092da0b1 100644
--- a/src/tlshd/etc/Makefile.am
+++ b/src/tlshd/etc/Makefile.am
@@ -17,8 +17,10 @@
 #
 
 tlshdconfigdir		= $(sysconfdir)/tlshd
+tlshdtagsdir		= $(tlshdconfigdir)/tags.d
 
 dist_tlshdconfig_DATA	= config
+dist_tlshdtags_DATA	= tags.example
 
 man5_MANS		= tlshd.conf.man
 EXTRA_DIST		= $(man5_MANS)
@@ -27,3 +29,4 @@ MAINTAINERCLEANFILES	= Makefile.in
 
 install-exec-hook:
 	mkdir -p $(DESTDIR)$(tlshdconfigdir)
+	mkdir -p $(DESTDIR)$(tlshdtagsdir)
diff --git a/src/tlshd/etc/tags.example b/src/tlshd/etc/tags.example
new file mode 100644
index 000000000000..84469dfe545e
--- /dev/null
+++ b/src/tlshd/etc/tags.example
@@ -0,0 +1,51 @@
+---
+filters:
+  monsters-university:
+    field: "issuer"
+    type: "wildcard"
+    expression: "*,O=Monsters University,*"
+  fear-tech:
+    field: "issuer"
+    type: "wildcard"
+    expression: "*,O=Fear Technology Institute,*"
+  school-scaring:
+    field: "subject"
+    type: "wildcard"
+    expression: "*,OU=School of Scaring,*"
+  school-can-design:
+    field: "subject"
+    type: "wildcard"
+    expression: "*,OU=School of Scream Can Design,*"
+  sorority-hss:
+    field: "subject"
+    type: "wildcard"
+    expression: "*,OU=Eta Hiss Hiss,*"
+  fraternity-ror:
+    field: "subject"
+    type: "wildcard"
+    expression: "*,OU=Roar Omega Roar,*"
+  fraternity-ok:
+    field: "subject"
+    type: "wildcard"
+    expression: "*,OU=Oozma Kappa,*"
+  valid-keyusage:
+    field: "keyUsage"
+    type: "list"
+    expression:
+      - "digitalSignature"
+      - "nonRepudiation"
+
+tags:
+  ror-mu-chapter:
+    filter:
+      - "monsters-univerity"
+      - "fraternity-ror"
+      - "valid-keyusage"
+  ror-ft-chapter:
+    filter:
+      - "fear-tech"
+      - "fraternity-ror"
+      - "valid-keyusage"
+  can-design-student-materials:
+    filter:
+      - "school-can-design"



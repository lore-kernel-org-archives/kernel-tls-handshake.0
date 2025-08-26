Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A518A242D9A
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222696; cv=none; b=RZy+jc9l4CfDDevQQeYC3HWvp00cC191mZs/QewM4YG7M3rGslzT6Od+AAvlBZu3l27/6E1ivMuwZ39N6x5qdvH0szdQuOkbk40QPfpN6M5hqS6WYnf69awkJDMatyojC0eJmVJIdj5n83zuxcZKMRowrJZZ7ZZvDwsz2aBvpCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222696; c=relaxed/simple;
	bh=8sFW7kTHTy66Wm1J4Di7qo/mOPu90If9OyZpTVXwpxg=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bL5IYcqeU7aYj1MCpNaYZqH72IX10Jl2Ny0H76BGd7UcVGlkm0XXHmQFahIgSEriMBkvryqbU65FKnIlhDrKmcnP6I4y1LUz8JCZiJKqis7YE/Xb5ml4XUgisU2DZLLnAep/gTwz30sewextMmYsGttcJnkoC95nP/rWOzjt7ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t1572PxA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t1572PxA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8A7C4CEF1
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756222696;
	bh=8sFW7kTHTy66Wm1J4Di7qo/mOPu90If9OyZpTVXwpxg=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=t1572PxADAFu7yyuKT7hZl41Bo3enp7OyDF9PgHM0Y9PpdddLUm+sFzlxSQ1+oACI
	 NQCr3R1s3fp/K0kKtvS7lz7E7XfWqqlKoxU63IaU3+aqnJwpRlZfuepbvsyCifPHJC
	 VQ6lzcKRUVHRNy1pQzBWanIBdnyuMOYgDG6jdWT9E16MR8nxwBUhM7ZXwGpk9MKD+U
	 yeC7AQH2f37YUbKI6FPBCEOwINPlCP7CzI9awSZgt0chEZ9Qmo4kS3SvjhW+l0dQIE
	 AXUzEZsN9siBj2SYtBzGSUQViyyl2kc5P8WzGhqoA1g4j3fvqMIkcY9f4KnKZB12nh
	 Wr5UhRca4d/wQ==
Subject: [PATCH v2 04/11] tlshd: man update for TLS session tags
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Tue, 26 Aug 2025 11:38:15 -0400
Message-ID: 
 <175622269528.6197.11279886690680930671.stgit@91.116.238.104.host.secureserver.net>
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

Set up a man page that describes how to configure the session
tagging mechanism.

For now, the man page contains just an overview of the facility. The
man page will be populated with details in subsequent patches.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/etc/Makefile.am          |    3 +
 src/tlshd/etc/tls-session-tags.man |  112 ++++++++++++++++++++++++++++++++++++
 src/tlshd/etc/tlshd.conf.man       |    3 +
 3 files changed, 116 insertions(+), 2 deletions(-)
 create mode 100644 src/tlshd/etc/tls-session-tags.man

diff --git a/src/tlshd/etc/Makefile.am b/src/tlshd/etc/Makefile.am
index d067c9e3e776..9a1f4249eb76 100644
--- a/src/tlshd/etc/Makefile.am
+++ b/src/tlshd/etc/Makefile.am
@@ -21,7 +21,8 @@ tlshdconfigdir		= $(sysconfdir)/tlshd
 dist_tlshdconfig_DATA	= config
 
 man5_MANS		= tlshd.conf.man
-EXTRA_DIST		= $(man5_MANS)
+man7_MANS		= tls-session-tags.man
+EXTRA_DIST		= $(man5_MANS) $(man7_MANS)
 
 MAINTAINERCLEANFILES	= Makefile.in
 
diff --git a/src/tlshd/etc/tls-session-tags.man b/src/tlshd/etc/tls-session-tags.man
new file mode 100644
index 000000000000..5ee58f6d2289
--- /dev/null
+++ b/src/tlshd/etc/tls-session-tags.man
@@ -0,0 +1,112 @@
+.\"
+.\" Copyright (c) 2025 Oracle and/or its affiliates.
+.\"
+.\" ktls-utils is free software; you can redistribute it and/or
+.\" modify it under the terms of the GNU General Public License as
+.\" published by the Free Software Foundation; version 2.
+.\"
+.\" This program is distributed in the hope that it will be useful,
+.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
+.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+.\" General Public License for more details.
+.\"
+.\" You should have received a copy of the GNU General Public License
+.\" along with this program; if not, write to the Free Software
+.\" Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
+.\" 02110-1301, USA.
+.\"
+.\" tls-session-tags(7)
+.\"
+.TH tls-session-tags 7 "25 Aug 2025"
+.SH NAME
+tls-session-tags \- TLS session tags
+.SH SYNOPSIS
+.B /etc/tlsd/tags.d/
+.SH DESCRIPTION
+The
+.B tlshd
+program implements a user agent that services TLS handshake requests
+on behalf of kernel TLS consumers.
+Its configuration files, found under the
+.I /etc/tlshd
+directory, contain information that the
+.B tlshd
+program reads when it starts up.
+The configuration files direct the
+.B tlshd
+program to information about which trust store and signing
+and encryption algorithms are to be used.
+The configuration files are considered a trusted source of information.
+.P
+When a remote presents an x.509 certificate during a TLS handshake, the
+.B tlshd
+program is responsible for verifying that the certificate was
+issued by a certificate authority that the receiver recognizes and
+trusts.
+Once that verification is successful, the receiver can trust
+the content of that certificate, including information about
+the peer identity presented in that certificate (eg. a DNS hostname
+or IP address, and so on).
+.P
+Once a peer's certificate is trusted,
+the
+.B tlshd
+program can be configured to scan the fields in the peer's certificate.
+Based on the scan,
+the
+.B tlshd
+program can assign tags to the new TLS session that
+indicate that the server recognizes the peer's identity.
+For example,
+the
+.B tlshd
+program can be configured to look for a specific string in
+.I subject
+fields, and assign tags to TLS sessions where the peer presented
+a certificate with matching content in that field.
+Kernel consumers can use those tags to authorize or deny access
+to resources based on the identity presented in peer certificates.
+.P
+The following sections describe how to configure this facility.
+.SH FORMAT
+TLS session tag definitions are YAML documents stored in files in the
+.I /etc/tlshd/tags.d
+directory.
+When it launches, the
+.B tlshd
+program reads all files in that directory with either the
+.I .yml
+or
+.I .yaml
+extension.
+Modifications to the content of these files take effect only when the
+.B tlshd
+program is restarted.
+.P
+The
+.B tlshd
+program
+populates two dictionaries from the contents of these files:
+.TP
+.B filters
+Each filter defined in this dictionary specifies the name of a
+field in an x.509 certificate, and the conditions under which the
+contents of that field are to be considered a match.
+.TP
+.B tags
+Each tag is a list of one or more filters (defined in the
+.B filters
+dictionary)
+that all must be matched in order for the tag to be assigned to a
+new TLS session.
+.SH STANDARDS
+x.509
+.BR
+RFC 5280
+.BR
+RFC 6125
+.SH SEE ALSO
+.BR tlshd (8),
+.BR tlshd.conf (5)
+.SH AUTHOR
+Chuck Lever
diff --git a/src/tlshd/etc/tlshd.conf.man b/src/tlshd/etc/tlshd.conf.man
index 80bb1ba6b341..f1151e2e94bc 100644
--- a/src/tlshd/etc/tlshd.conf.man
+++ b/src/tlshd/etc/tlshd.conf.man
@@ -126,6 +126,7 @@ a handshake request when no other certificate is available.
 This option specifies the pathname of a file containing
 a PEM-encoded private key associated with the above certificate.
 .SH SEE ALSO
-.BR tlshd (8)
+.BR tlshd (8),
+.BR tls-session-tags (7)
 .SH AUTHOR
 Chuck Lever



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474DA1A76B1
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Aug 2025 19:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754507139; cv=none; b=kp/DnW17tF+s3M6yuDOumfyAgjOZ4Ho25s1ouiq4ZKgti2Ia5/82Py+Zb/D8HP2oOdeTjN9OwsQHO4uM2nCCYe4Xap8bdL/HRpVUuk+7Ml/wZwSzgZzVsrI0nOUVwoaqZLW0DLW1QO/b32THK1yQalbvjNDZ6c3IvLAW/6quMvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754507139; c=relaxed/simple;
	bh=m5GPvKRkIKbFY1YSmqAk+tfgmhH49EpZDuwOOjoou1A=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nmg52nLIp3T6PxJ7rWn+5VLU+P/zAK5K1++HHNprhiiAuYikUbT80MvybtRQ/oouyv0sIrCngZQ1pRHGYJZykZPu2Tat9oZCpLAsyRyAt4FzXb15Ly5BiY/fuRdu1C+O9k7KPWlRpn+PpEq/YKifzwbLMwIqXQgs/7Lym1s4FlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l77TO9XY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l77TO9XY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BAAC4CEE7
	for <kernel-tls-handshake@lists.linux.dev>; Wed,  6 Aug 2025 19:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754507136;
	bh=m5GPvKRkIKbFY1YSmqAk+tfgmhH49EpZDuwOOjoou1A=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=l77TO9XY+QICwXf/SJ3lrvuzWHp7p9iGtU5TWzeKteyc9BVTU9dWW1tSRA6EcJMIE
	 kmlGMV7GJ4ut3EKA1lSIJrd/MrCnlullOu4ev0S/WQtzxR9Uck472em8oCJ1JdKHts
	 BzC6YtbLb8IZd0n0Ze04iPsEp1+HGzjKnhvYf+exo1pXvsciXSZTW56ZIHZSh3ohF+
	 s2XLe/vaouXw0LDtTKgkEcqamE9QEQMHlmdb6xm0PXZmx8baekzfhuryeUBfoI77CL
	 D+Nxgq46I0n3bVMKBw+RAFylstCqxzGNYK98YNozgqsyr5Q6qgpmJGIZH2f8Eah1e0
	 RtyqEcm9Anucg==
Subject: [PATCH 5/8] tlshd: man update for TLS session tags
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Wed, 06 Aug 2025 15:05:35 -0400
Message-ID: 
 <175450713567.1882.7525944304665017532.stgit@91.116.238.104.host.secureserver.net>
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

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 src/tlshd/etc/Makefile.am          |    3 -
 src/tlshd/etc/tls-session-tags.man |  168 ++++++++++++++++++++++++++++++++++++
 src/tlshd/etc/tlshd.conf.man       |    3 -
 3 files changed, 172 insertions(+), 2 deletions(-)
 create mode 100644 src/tlshd/etc/tls-session-tags.man

diff --git a/src/tlshd/etc/Makefile.am b/src/tlshd/etc/Makefile.am
index 7b91092da0b1..f4cfccfabf00 100644
--- a/src/tlshd/etc/Makefile.am
+++ b/src/tlshd/etc/Makefile.am
@@ -23,7 +23,8 @@ dist_tlshdconfig_DATA	= config
 dist_tlshdtags_DATA	= tags.example
 
 man5_MANS		= tlshd.conf.man
-EXTRA_DIST		= $(man5_MANS)
+man7_MANS		= tls-session-tags.man
+EXTRA_DIST		= $(man5_MANS) $(man7_MANS)
 
 MAINTAINERCLEANFILES	= Makefile.in
 
diff --git a/src/tlshd/etc/tls-session-tags.man b/src/tlshd/etc/tls-session-tags.man
new file mode 100644
index 000000000000..e22c8af089bb
--- /dev/null
+++ b/src/tlshd/etc/tls-session-tags.man
@@ -0,0 +1,168 @@
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
+.TH tls-session-tags 7 "5 Aug 2025"
+.SH NAME
+tls-session-tags \- TLS session tags
+.SH SYNOPSIS
+.B /etc/tlsd/tags.d
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
+TLS session tag definitions are YAML documents stored in files under the
+.I /etc/tlshd/tags.d
+directory.
+When it launches, the
+.B tlshd
+program reads all files in that directory with either the
+.I .yml
+or
+.I .yaml
+extension.
+Thus changes made in these files take effect only when the
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
+contents of that field are a "match".
+.TP
+.B tags
+Each tag is a list of filters (defined in the
+.B filters
+dictionary)
+that all must be matched in order for the tag to be assigned to a new
+TLS session.
+.SS Filters
+The definition of a filter is small YAML dictionary (or mapping) that
+specifies the name of the filter, the certificate field it scans, and
+the condition that defines a "match". For example:
+
+  monsters-university:
+    field: "issuer"
+    type: "wildcard"
+    expression: "*,O=Monsters University,*"
+
+This defines a filter named "monsters-university".
+It uses a wildcard match to look for "O=Monsters Univerity" in
+each certificate's "issuer" field.
+The string value of the
+.I field
+key can be the name of any x.509 certificate field (though not
+all fields are supported yet).
+The string value of the
+.I type
+key is one of "exact", "wildcard", "regex", or "list".
+
+When the value of
+.I type
+is "exact", "wildcard", or "regex",
+the
+.I expression
+value is a string that is to be matched against.
+When the value of
+.I type
+is "list", the
+.I expression
+value is a list of x.509 keyUsage bit names.
+.SS Tags
+The definition of a tag is a small YAML dictionary that specifies
+the name of the tag and a list of filters (as defined in the Filters
+mapping, above) that all must match for the tag to be assigned to
+a TLS session. For example:
+
+  ror-mu-chapter:
+    filter:
+      - "monsters-univerity"
+      - "fraternity-ror"
+
+This defines a tag named "ror-mu-chapter".
+Both the "monsters-university" and "fraternity-ror" filters must
+match in order for the
+.B tlshd
+program to assign this tag to an incoming TLS session.
+.SS Handshake completion
+Once a handshake is successful, the
+.B tlshd
+program scans the peer's certificate using the configured filter and
+tag definitions.
+Any tag matches are attached to the new TLS session and are made
+visible to the kernel consumer that is to use the session.
+Note that filter names are not exposed to kernel consumers.
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



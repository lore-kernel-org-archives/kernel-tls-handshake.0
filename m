Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEB4238C0B
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222678; cv=none; b=cX9Hb4EJj/URdZmHRMVe0pnjMOHjuCHBQZfzn/cDaQzyA0TbhMk/T4/QlUWvODWVIR93fSK/7f0Zv7spuXlOfYAY2VDET8qTASYiLILSQDT93dFXCvXazRmy0UnKb8VCuJJub4DcGggaJ4srpmoWX8+Yxbr89gYvDeI/5GYol+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222678; c=relaxed/simple;
	bh=s4UML6bBdmcuEQHL/CGYI7mgscsZuyWwIf3RV+lyLGo=;
	h=Subject:From:To:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OLwdEEHj2jM3AfyxCe6qmoHdrhT8/5D+avVs5g9LJXTNMqH0G5ItlRoMg6BSGHrUQkVFo56FBfRbhluZZCDeRuGi0V0fHwg+wayRr1yaWU7cljjIG4IrI7BowvYVy4/oLhTXIfmNdY2CP7O27SLpI1AUvN2IP2L/lyPlq4KkqU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/+kC4Xo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/+kC4Xo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45C2C4CEF1
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756222677;
	bh=s4UML6bBdmcuEQHL/CGYI7mgscsZuyWwIf3RV+lyLGo=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=E/+kC4Xo7EKUAMsWl3YTmdCYiaXXmGnwkERfAYwYwek8BtFtaXCjb9CTg9gjNP6CS
	 PWowEmxNCJ74t6iW11td3Dv37U+DmCTSYzxW2bcoXYwXVINf++IiKg6BAU8ew+e0S4
	 MKvCaTT09uvIC2JUUsfw8iWxnvrTkksU1wj19g9BNKS5an4WGEUDVqxJxg14DL+vs9
	 xbcecL1AyO/L5se16dvuu9MC9wZFi3wNmjHaTDnKxBGwO5/KowUo9U0Opm/7C9PYdy
	 NwYS+s8Kum0h8LSiAVQ3XMCVHMtAD6/6+XF8mVms7liXH7Na+fD9vrItr0NXuqfWOn
	 nxBzhqz6P2h0A==
Subject: [PATCH v2 01/11] tlshd: Relocate /etc/tlshd.conf
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Tue, 26 Aug 2025 11:37:56 -0400
Message-ID: 
 <175622267684.6197.2432035975634416794.stgit@91.116.238.104.host.secureserver.net>
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

To support TLS session tags, additional configuration files,
outside of /etc/tlshd.conf, will be needed. So create a tlshd
configuration directory:

   /etc/tlshd/

And move /etc/tlshd.conf into that directory as:

   /etc/tlshd/config

For now, tlshd will look for /etc/tlshd.conf first, and warn
that the new file name should be used instead.

XXX: I'm not sure what to rename tlshd.conf.man to.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 configure.ac                 |    2 -
 src/tlshd/Makefile.am        |    6 +-
 src/tlshd/config.c           |    6 +-
 src/tlshd/etc/Makefile.am    |   29 +++++++++
 src/tlshd/etc/config         |   41 +++++++++++++
 src/tlshd/etc/tlshd.conf.man |  131 ++++++++++++++++++++++++++++++++++++++++++
 src/tlshd/main.c             |   21 +++++--
 src/tlshd/tlshd.conf         |   41 -------------
 src/tlshd/tlshd.conf.man     |  131 ------------------------------------------
 src/tlshd/tlshd.h            |    2 -
 10 files changed, 225 insertions(+), 185 deletions(-)
 create mode 100644 src/tlshd/etc/Makefile.am
 create mode 100644 src/tlshd/etc/config
 create mode 100644 src/tlshd/etc/tlshd.conf.man
 delete mode 100644 src/tlshd/tlshd.conf
 delete mode 100644 src/tlshd/tlshd.conf.man

diff --git a/configure.ac b/configure.ac
index a6d9d092da54..1a9c7947171e 100644
--- a/configure.ac
+++ b/configure.ac
@@ -81,5 +81,5 @@ AC_CHECK_LIB([gnutls], [gnutls_psk_allocate_client_credentials2],
                         [Define to 1 if you have the gnutls_psk_allocate_client_credentials2 function.])])
 AC_SUBST([AM_CPPFLAGS])
 
-AC_CONFIG_FILES([Makefile src/Makefile src/tlshd/Makefile systemd/Makefile])
+AC_CONFIG_FILES([Makefile src/Makefile src/tlshd/Makefile src/tlshd/etc/Makefile systemd/Makefile])
 AC_OUTPUT
diff --git a/src/tlshd/Makefile.am b/src/tlshd/Makefile.am
index d1a13ef91fdb..2bde5d147e19 100644
--- a/src/tlshd/Makefile.am
+++ b/src/tlshd/Makefile.am
@@ -16,11 +16,8 @@
 # 02110-1301, USA.
 #
 
-dist_sysconf_DATA	= tlshd.conf
-
-man5_MANS		= tlshd.conf.man
 man8_MANS		= tlshd.man
-EXTRA_DIST		= $(man5_MANS) $(man8_MANS)
+EXTRA_DIST		= $(man8_MANS)
 
 sbin_PROGRAMS		= tlshd
 tlshd_CFLAGS		= -Werror -Wall -Wextra $(LIBGNUTLS_CFLAGS) \
@@ -31,4 +28,5 @@ tlshd_SOURCES		= client.c config.c handshake.c keyring.c ktls.c log.c \
 tlshd_LDADD		= $(LIBGNUTLS_LIBS) $(LIBKEYUTILS_LIBS) $(GLIB_LIBS) \
 			  $(LIBNL3_LIBS) $(LIBNL_GENL3_LIBS)
 
+SUBDIRS			= etc
 MAINTAINERCLEANFILES	= Makefile.in cscope.out
diff --git a/src/tlshd/config.c b/src/tlshd/config.c
index 4c54d371ca32..19b37035b1a4 100644
--- a/src/tlshd/config.c
+++ b/src/tlshd/config.c
@@ -49,12 +49,13 @@ static GKeyFile *tlshd_configuration;
 /**
  * tlshd_config_init - Read tlshd's config file
  * @pathname: Pathname to config file
+ * @legacy: Don't generate an error if the config file doesn't exist
  *
  * Return values:
  *   %true: Config file read successfully
  *   %false: Unable to read config file
  */
-bool tlshd_config_init(const gchar *pathname)
+bool tlshd_config_init(const gchar *pathname, bool legacy)
 {
 	gchar **keyrings;
 	gsize i, length;
@@ -67,7 +68,8 @@ bool tlshd_config_init(const gchar *pathname)
 	if (!g_key_file_load_from_file(tlshd_configuration, pathname,
 				       G_KEY_FILE_KEEP_COMMENTS,
 				       &error)) {
-		tlshd_log_gerror("Failed to load config file", error);
+		if (!legacy)
+			tlshd_log_gerror("Failed to load config file", error);
 		g_error_free(error);
 		return false;
 	}
diff --git a/src/tlshd/etc/Makefile.am b/src/tlshd/etc/Makefile.am
new file mode 100644
index 000000000000..d067c9e3e776
--- /dev/null
+++ b/src/tlshd/etc/Makefile.am
@@ -0,0 +1,29 @@
+#
+# Copyright (c) 2025 Oracle and/or its affiliates.
+#
+# ktls-utils is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public License as
+# published by the Free Software Foundation; version 2.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
+# 02110-1301, USA.
+#
+
+tlshdconfigdir		= $(sysconfdir)/tlshd
+
+dist_tlshdconfig_DATA	= config
+
+man5_MANS		= tlshd.conf.man
+EXTRA_DIST		= $(man5_MANS)
+
+MAINTAINERCLEANFILES	= Makefile.in
+
+install-exec-hook:
+	mkdir -p $(DESTDIR)$(tlshdconfigdir)
diff --git a/src/tlshd/etc/config b/src/tlshd/etc/config
new file mode 100644
index 000000000000..620bd17ce3df
--- /dev/null
+++ b/src/tlshd/etc/config
@@ -0,0 +1,41 @@
+#
+# Copyright (c) 2022 Oracle and/or its affiliates.
+#
+# This file is part of ktls-utils.
+#
+# ktls-utils is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public License as
+# published by the Free Software Foundation; version 2.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
+# 02110-1301, USA.
+#
+# See tlshd.conf(5) for details.
+#
+
+[debug]
+loglevel=0
+tls=0
+nl=0
+
+[authenticate]
+#keyrings= <keyring>;<keyring>;<keyring>
+
+[authenticate.client]
+#x509.truststore= <pathname>
+#x509.crl= <pathname>
+#x509.certificate= <pathname>
+#x509.private_key= <pathname>
+
+[authenticate.server]
+#x509.truststore= <pathname>
+#x509.crl= <pathname>
+#x509.certificate= <pathname>
+#x509.private_key= <pathname>
diff --git a/src/tlshd/etc/tlshd.conf.man b/src/tlshd/etc/tlshd.conf.man
new file mode 100644
index 000000000000..80bb1ba6b341
--- /dev/null
+++ b/src/tlshd/etc/tlshd.conf.man
@@ -0,0 +1,131 @@
+.\"
+.\" Copyright (c) 2022 Oracle and/or its affiliates.
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
+.\" tlshd.conf(5)
+.\"
+.\" Copyright (c) 2022 Oracle and/or its affiliates.
+.TH tlshd.conf 5 "20 Oct 2022"
+.SH NAME
+tlshd.conf \- tlshd configuration file
+.SH SYNOPSIS
+.B /etc/tlshd/config
+.SH DESCRIPTION
+The
+.B tlshd
+program implements a user agent that services TLS handshake requests
+on behalf of kernel TLS consumers.
+Its configuration file contains information that the program reads
+when it starts up.
+The file is designed to be human readable and contains a list of keywords
+with values that provide various types of information.
+The configuration file is considered a trusted source of information.
+.P
+The
+.B tlshd
+program reads this file once when it is launched.
+Thus changes made in this file take effect only when the
+.B tlshd
+program is restarted.
+If this file does not exist, the
+.B tlshd
+program exits immediately.
+.SH OPTIONS
+The configuration file is split into sections.
+.P
+The
+.I [debug]
+section specifies debugging settings for the
+.B tlshd
+program.
+In this section, there are three available options:
+.TP
+.B loglevel
+This option specifies an integer which indicates the debug message level.
+Zero, the quietest setting, is the default.
+.TP
+.B tls
+This option specifies an integer which indicates the debug message level
+for TLS library calls.
+Zero, the quietest setting, is the default.
+.TP
+.B nl
+This option specifies an integer which indicates the debug message level
+for netlink library calls.
+Zero, the quietest setting, is the default.
+.P
+The
+.I [authenticate]
+section specifies default authentication material when establishing
+TLS sessions.
+In this section, there is one available option:
+.TP
+.B keyrings
+This option specifies a semicolon-separated list of auxiliary keyrings
+that contain handshake authentication tokens.
+.B tlshd
+links these keyrings into its session keyring.
+The configuration file may specify either a keyring's name or serial number.
+.B tlshd
+always includes the
+.IR .nvme ,
+.IR .nfs ,
+and
+.I .nfsd
+keyrings on its session keyring.
+.P
+And, in this section, there are two subsections:
+.I [client]
+and
+.IR [server] .
+The
+.B tlshd
+program consults the settings in the
+.I [client]
+subsection when handling the client end of a handshake,
+and it consults the settings in the
+.I [server]
+subsection when handling the server end of a handshake.
+.P
+In each of these two subsections, there are four available options:
+.TP
+.B x509.truststore
+This option specifies the pathname of a file containing a
+PEM-encoded trust store that is to be used to verify a
+certificate during a handshake.
+If this option is not specified,
+.B tlshd
+uses the system's trust store.
+.TP
+.B x509.crl
+This option specifies the pathname of a file containing
+PEM-encoded certificate revocation lists (CRL) that are to be
+used to verify the revocation status of certificates during
+each handshake.
+If this option is not specified, CRL checking is skipped.
+.TP
+.B x509.certificate
+This option specifies the pathname of a file containing
+a PEM-encoded x.509 certificate that is to be presented during
+a handshake request when no other certificate is available.
+.TP
+.B x509.private_key
+This option specifies the pathname of a file containing
+a PEM-encoded private key associated with the above certificate.
+.SH SEE ALSO
+.BR tlshd (8)
+.SH AUTHOR
+Chuck Lever
diff --git a/src/tlshd/main.c b/src/tlshd/main.c
index 649fe3f0004f..ffedcee7f305 100644
--- a/src/tlshd/main.c
+++ b/src/tlshd/main.c
@@ -63,13 +63,14 @@ static void usage(char *progname)
 
 int main(int argc, char **argv)
 {
-	static gchar config_file[PATH_MAX + 1] = "/etc/tlshd.conf";
+	static gchar config_file[PATH_MAX + 1];
 	char *progname;
 	int c;
 	size_t len;
 
 	tlshd_tls_debug = 0;
 	progname = basename(argv[0]);
+	config_file[0] = '\0';
 	while ((c = getopt_long(argc, argv, optstring, longopts, NULL)) != -1) {
 		switch (c) {
 		case 'c':
@@ -100,10 +101,20 @@ int main(int argc, char **argv)
 
 	tlshd_log_init(progname);
 
-	if (!tlshd_config_init(config_file)) {
-		tlshd_log_shutdown();
-		tlshd_log_close();
-		return EXIT_FAILURE;
+	if (config_file[0] != '\0') {
+		if (!tlshd_config_init(config_file, false)) {
+			tlshd_log_shutdown();
+			tlshd_log_close();
+			return EXIT_FAILURE;
+		}
+	} else {
+		if (tlshd_config_init("/etc/tlshd.conf", true)) {
+			tlshd_log_notice("Please relocate /etc/tlshd.conf to /etc/tlshd/config");
+		} else if (!tlshd_config_init("/etc/tlshd/config", false)) {
+			tlshd_log_shutdown();
+			tlshd_log_close();
+			return EXIT_FAILURE;
+		}
 	}
 
 	if (tlshd_gnutls_priority_init()) {
diff --git a/src/tlshd/tlshd.conf b/src/tlshd/tlshd.conf
deleted file mode 100644
index 620bd17ce3df..000000000000
--- a/src/tlshd/tlshd.conf
+++ /dev/null
@@ -1,41 +0,0 @@
-#
-# Copyright (c) 2022 Oracle and/or its affiliates.
-#
-# This file is part of ktls-utils.
-#
-# ktls-utils is free software; you can redistribute it and/or
-# modify it under the terms of the GNU General Public License as
-# published by the Free Software Foundation; version 2.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-# 02110-1301, USA.
-#
-# See tlshd.conf(5) for details.
-#
-
-[debug]
-loglevel=0
-tls=0
-nl=0
-
-[authenticate]
-#keyrings= <keyring>;<keyring>;<keyring>
-
-[authenticate.client]
-#x509.truststore= <pathname>
-#x509.crl= <pathname>
-#x509.certificate= <pathname>
-#x509.private_key= <pathname>
-
-[authenticate.server]
-#x509.truststore= <pathname>
-#x509.crl= <pathname>
-#x509.certificate= <pathname>
-#x509.private_key= <pathname>
diff --git a/src/tlshd/tlshd.conf.man b/src/tlshd/tlshd.conf.man
deleted file mode 100644
index 914261eb6e5f..000000000000
--- a/src/tlshd/tlshd.conf.man
+++ /dev/null
@@ -1,131 +0,0 @@
-.\"
-.\" Copyright (c) 2022 Oracle and/or its affiliates.
-.\"
-.\" ktls-utils is free software; you can redistribute it and/or
-.\" modify it under the terms of the GNU General Public License as
-.\" published by the Free Software Foundation; version 2.
-.\"
-.\" This program is distributed in the hope that it will be useful,
-.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
-.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-.\" General Public License for more details.
-.\"
-.\" You should have received a copy of the GNU General Public License
-.\" along with this program; if not, write to the Free Software
-.\" Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-.\" 02110-1301, USA.
-.\"
-.\" tlshd.conf(5)
-.\"
-.\" Copyright (c) 2022 Oracle and/or its affiliates.
-.TH tlshd.conf 5 "20 Oct 2022"
-.SH NAME
-tlshd.conf \- tlshd configuration file
-.SH SYNOPSIS
-.B /etc/tlshd.conf
-.SH DESCRIPTION
-The
-.B tlshd
-program implements a user agent that services TLS handshake requests
-on behalf of kernel TLS consumers.
-Its configuration file contains information that the program reads
-when it starts up.
-The file is designed to be human readable and contains a list of keywords
-with values that provide various types of information.
-The configuration file is considered a trusted source of information.
-.P
-The
-.B tlshd
-program reads this file once when it is launched.
-Thus changes made in this file take effect only when the
-.B tlshd
-program is restarted.
-If this file does not exist, the
-.B tlshd
-program exits immediately.
-.SH OPTIONS
-The configuration file is split into sections.
-.P
-The
-.I [debug]
-section specifies debugging settings for the
-.B tlshd
-program.
-In this section, there are three available options:
-.TP
-.B loglevel
-This option specifies an integer which indicates the debug message level.
-Zero, the quietest setting, is the default.
-.TP
-.B tls
-This option specifies an integer which indicates the debug message level
-for TLS library calls.
-Zero, the quietest setting, is the default.
-.TP
-.B nl
-This option specifies an integer which indicates the debug message level
-for netlink library calls.
-Zero, the quietest setting, is the default.
-.P
-The
-.I [authenticate]
-section specifies default authentication material when establishing
-TLS sessions.
-In this section, there is one available option:
-.TP
-.B keyrings
-This option specifies a semicolon-separated list of auxiliary keyrings
-that contain handshake authentication tokens.
-.B tlshd
-links these keyrings into its session keyring.
-The configuration file may specify either a keyring's name or serial number.
-.B tlshd
-always includes the
-.IR .nvme ,
-.IR .nfs ,
-and
-.I .nfsd
-keyrings on its session keyring.
-.P
-And, in this section, there are two subsections:
-.I [client]
-and
-.IR [server] .
-The
-.B tlshd
-program consults the settings in the
-.I [client]
-subsection when handling the client end of a handshake,
-and it consults the settings in the
-.I [server]
-subsection when handling the server end of a handshake.
-.P
-In each of these two subsections, there are four available options:
-.TP
-.B x509.truststore
-This option specifies the pathname of a file containing a
-PEM-encoded trust store that is to be used to verify a
-certificate during a handshake.
-If this option is not specified,
-.B tlshd
-uses the system's trust store.
-.TP
-.B x509.crl
-This option specifies the pathname of a file containing
-PEM-encoded certificate revocation lists (CRL) that are to be
-used to verify the revocation status of certificates during
-each handshake.
-If this option is not specified, CRL checking is skipped.
-.TP
-.B x509.certificate
-This option specifies the pathname of a file containing
-a PEM-encoded x.509 certificate that is to be presented during
-a handshake request when no other certificate is available.
-.TP
-.B x509.private_key
-This option specifies the pathname of a file containing
-a PEM-encoded private key associated with the above certificate.
-.SH SEE ALSO
-.BR tlshd (8)
-.SH AUTHOR
-Chuck Lever
diff --git a/src/tlshd/tlshd.h b/src/tlshd/tlshd.h
index a0dd47ecfef4..b98f77d7328a 100644
--- a/src/tlshd/tlshd.h
+++ b/src/tlshd/tlshd.h
@@ -50,7 +50,7 @@ extern void tlshd_tls13_clienthello_handshake(struct tlshd_handshake_parms *parm
 extern void tlshd_quic_clienthello_handshake(struct tlshd_handshake_parms *parms);
 
 /* config.c */
-bool tlshd_config_init(const gchar *pathname);
+bool tlshd_config_init(const gchar *pathname, bool legacy);
 void tlshd_config_shutdown(void);
 bool tlshd_config_get_client_truststore(char **bundle);
 bool tlshd_config_get_client_crl(char **result);



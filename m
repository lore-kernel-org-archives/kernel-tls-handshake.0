Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380A32D0616
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222672; cv=none; b=JHWquzLhF+uGkynr2KeTlW3pEHmygQ6XtALajBVB6TUWfucr7HhApHaEahN3qoZu/7lw+qfWVImmRIspoxU2HnULqmZ98RN7TscrJU/sdIhbmljpADFI+bsW8dNUmFSrSzF1m/jsYFale6yU/VXNSI2Ilna0AGkYEz128185ac8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222672; c=relaxed/simple;
	bh=PwsKk8WB97q18OvZjtZLJWJtoVpNdbVNbFZS5BOT9v0=;
	h=Subject:From:To:Date:Message-ID:MIME-Version:Content-Type; b=HdEWBzvejG07/2VJNLry1dG5gZDm4EOF2EDccoSJyxWlSOWvlpfGqd+Vfx9xHVM+glREpjkNgHxpgn3be3wesI4vAo2L2IBQIJamtO3PrxP1awVannK0LYOzV94uWWEYc6NrrLi+Qs+/IxSCuAJ3rIB5kIVKKyHeorRXGYS9yfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOSnbc1n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOSnbc1n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A8DC4CEF1
	for <kernel-tls-handshake@lists.linux.dev>; Tue, 26 Aug 2025 15:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756222671;
	bh=PwsKk8WB97q18OvZjtZLJWJtoVpNdbVNbFZS5BOT9v0=;
	h=Subject:From:To:Date:From;
	b=AOSnbc1nYLIW3yBIu20qZsnC+r+PhZT77bQa/7mZ80/s7bKogXWi5ltUGrDPOdLq2
	 orQj9JlxJ1IjhH00UpzbtCHdXNP4sjFrdiWDCNvvY1irrvL+k4zeEklvyjeHHnCiVC
	 zaQ4Xm+sNhA8dqB9BRlzSBwrGjcEQ5oPdSDhVD6sLeHzf8rojF8E58RS++wJ5H3GuG
	 mTt/bnZiomDoNiw2N0KkvvynCuwRBLm2dlqRarMNcOpnvA3wAMdVzFX+1tj0rAAuio
	 X2a2DN25XtT85LscRBK9Lsgapp7YwGXkMjRs9CXv60H1EdON1LysqLTdzda0lCvmvU
	 Ev/xD9wuuzUKg==
Subject: [PATCH v2 00/11] TLS session tags for tlshd
From: Chuck Lever <cel@kernel.org>
To: kernel-tls-handshake@lists.linux.dev
Date: Tue, 26 Aug 2025 11:37:50 -0400
Message-ID: 
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

I pushed my WIP branch that implements TLS session tags to this
public branch:

  https://github.com/oracle/ktls-utils/tree/tls-session-tags

A man page that explains things, tls-session-tags(7), is developed
over the course of the series.

The code builds and does some basic tagging. Some filter types are
not implemented yet.

Kernel and nfs-utils patches are needed to make tagging actually work.
For the time being I would like to focus on the usability and coding
issues that have come up while developing the tlshd part of this
facility.

I'm planning to present this work and hold an AMA at the Fall
Bake-a-thon in October.

---

Changes since v1:
- Split the patches up to better demonstrate how to extend the feature
- Converted most internal data structures to use GHashTables
- Implemented "filter types"

Chuck Lever (11):
      tlshd: Relocate /etc/tlshd.conf
      configure.ac: Add libyaml dependency
      tlshd: Add init/shutdown hooks for the session tagging subsystem
      tlshd: man update for TLS session tags
      tlshd: Add tag filter types
      tlshd: Add a YAML parser
      tlshd: Parse filter definitions
      tlshd: Add parsing for tag definitions
      tlshd: Match ingress certificates with defined TLS session tags
      tlshd: Update netlink.h
      tlshd: Add handshake tags to the DONE command


 .github/workflows/makefile.yml     |    3 +-
 README                             |    1 +
 README.md                          |    1 +
 configure.ac                       |    9 +-
 src/tlshd/Makefile.am              |   15 +-
 src/tlshd/config.c                 |    9 +-
 src/tlshd/etc/Makefile.am          |   30 +
 src/tlshd/etc/config               |   41 +
 src/tlshd/etc/tls-session-tags.man |  289 ++++++
 src/tlshd/etc/tlshd.conf.man       |  132 +++
 src/tlshd/main.c                   |   21 +-
 src/tlshd/netlink.c                |   25 +
 src/tlshd/netlink.h                |    1 +
 src/tlshd/server.c                 |    2 +
 src/tlshd/tags.c                   | 1545 ++++++++++++++++++++++++++++
 src/tlshd/tlshd.conf               |   41 -
 src/tlshd/tlshd.conf.man           |  131 ---
 src/tlshd/tlshd.h                  |    9 +-
 18 files changed, 2115 insertions(+), 190 deletions(-)
 create mode 100644 src/tlshd/etc/Makefile.am
 create mode 100644 src/tlshd/etc/config
 create mode 100644 src/tlshd/etc/tls-session-tags.man
 create mode 100644 src/tlshd/etc/tlshd.conf.man
 create mode 100644 src/tlshd/tags.c
 delete mode 100644 src/tlshd/tlshd.conf
 delete mode 100644 src/tlshd/tlshd.conf.man

--
Chuck Lever


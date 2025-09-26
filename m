Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAE66ADD
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 26 Sep 2025 01:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849730; cv=none; b=C7Ax3GdPlfg8iVrYXcurE+9PBclV7EFG2AD6Spz6naGBE2fpqsVIhBqYvwkxezcQP94vxsT6l0dw5UTvdELzh/CAASWU5j7fbtmHaipz29Q8u5dBv4jd+5jF9bDKnVDKggbxp3D9LzqRlK7rUWsbHtiC/OiXJAqwVthQSGXvvls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849730; c=relaxed/simple;
	bh=QLFP6giybKU47FvoobzZYUYeoUtuYPVEe2849BwWA+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GF3YYyisSj+uH+9rvRF41uexSmQxze0//pBSE/QXA9wNaUkWhL8onghHdJbtk2c5NOS6CUiTgvJlY5ut+PtQsvDD3EZzNFznipEbJKkrK8T9RCwp6K16RjvEkH6536V3zA88ojuL0uSsqbedY+3SXvUBH7cq5M8jrGkf7og3m50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVB6LsmY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVB6LsmY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCF64C4CEF0;
	Fri, 26 Sep 2025 01:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758849730;
	bh=QLFP6giybKU47FvoobzZYUYeoUtuYPVEe2849BwWA+I=;
	h=From:To:Cc:Subject:Date:From;
	b=cVB6LsmYQ+eqqxC3+pfE5z4Ix9ZyuGuH2uavzKm3iEVPqaR783bq8LDR2bGmMxqs0
	 sNbfNteDQLZbLtUlTMsmxbbwwKEH24aOm6aK+pMdSCIAXeWg/8uklW6XD1qy7rI1q3
	 a8EcScdFUksfHthnXrtsYYKl+KhKzkDVrogcdZSbWaSjxiNXEg+cyR9KRbyLhS1/12
	 7sEGivYynjaqyR06nsFTfqgkN5oTerFkzlHiqIGhCRoiPwjcAk0rqdR0M+bGBgsegL
	 2igM9kyv2UEkuzjTrrmBhzUc41CIVDcFhcVBjCMpPJmC6Zm/gSnKIHtpwufGiY2OwB
	 +oxhOUuSWrWcw==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Xin Long <lucien.xin@gmail.com>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH v1 00/16] Create gh-pages for ktls-utils
Date: Thu, 25 Sep 2025 21:21:49 -0400
Message-ID: <20250926012207.3642990-1-cel@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuck Lever <chuck.lever@oracle.com>

Sorry for the size of this series.

The Doxygen comment style we started with was the kdoc style, which
isn't suitable for user space projects. So the first step is to
convert the comments to bog standard user-space Doxygen.

Patch 13/14 then adds the "create the Doxygen tree" build logic.

Patch 14/14 adds a GitHub action that can generate and deploy a
set of gh-pages for ktls-utils. It includes the man pages, an
example configuration file, and the generated Doxygen tree.

This isn't perfect, but it's something that can be built on over
time.

Chuck Lever (14):
  tlshd: Add kernel's quic.h
  tlshd: Translate kernel-style Doxygen comments in src/tlshd/client.c
  tlshd: Translate kernel-style Doxygen comments in src/tlshd/config.c
  tlshd: Translate kernel-style Doxygen comments in
    src/tlshd/handshake.c
  tlshd: Translate kernel-style Doxygen comments in src/tlshd/keyring.c
  tlshd: Translate kernel-style Doxygen comments in src/tlshd/ktls.c
  tlshd: Translate kernel-style Doxygen comments in src/tlshd/log.c
  tlshd: Translate kernel-style Doxygen comments in src/tlshd/main.c
  tlshd: Translate kernel-style Doxygen comments in src/tlshd/netlink.c
  tlshd: Translate kernel-style Doxygen comments in src/tlshd/quic.c
  tlshd: Translate kernel-style Doxygen comments in src/tlshd/server.c
  tlshd: Translate kernel-style Doxygen comments in src/tlshd/tlshd.h
  Build Doxygen web site
  workflows: Generate gh-pages automatically

Xin Long (2):
  tlshd: leave session_status as EIO on GnuTLS failure in QUIC session
    setup
  tlshd: set conn errcode to EACCES on GnuTLS failure in QUIC handshake

 .github/workflows/documentation.yml |  154 ++
 .gitignore                          |    1 +
 Makefile.am                         |    3 +-
 configure.ac                        |   13 +-
 docs/Doxyfile.in                    | 2836 +++++++++++++++++++++++++++
 {src => docs}/Makefile.am           |   13 +-
 src/Makefile.am                     |    2 +
 src/mainpage.c                      |   20 +
 src/tlshd/Makefile.am               |    3 +-
 src/tlshd/client.c                  |  200 +-
 src/tlshd/config.c                  |  164 +-
 src/tlshd/handshake.c               |   32 +-
 src/tlshd/keyring.c                 |   79 +-
 src/tlshd/ktls.c                    |  118 +-
 src/tlshd/log.c                     |  102 +-
 src/tlshd/main.c                    |   42 +-
 src/tlshd/netlink.c                 |  110 +-
 src/tlshd/quic.c                    |  246 ++-
 src/tlshd/quic.h                    |  236 +++
 src/tlshd/server.c                  |  232 ++-
 src/tlshd/tlshd.h                   |   87 +-
 21 files changed, 4343 insertions(+), 350 deletions(-)
 create mode 100644 .github/workflows/documentation.yml
 create mode 100644 docs/Doxyfile.in
 copy {src => docs}/Makefile.am (78%)
 create mode 100644 src/mainpage.c
 create mode 100644 src/tlshd/quic.h

-- 
2.51.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA05570860
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 19 Oct 2026 14:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419978; cv=none; b=cNHxhbvQ7+xw6EFmGKYUvtkXkJ/+BSrcB4S3K1U5d08RU571stLC08Zukh0d84gK4I466iWjOGG+6/4QWuV6POqHZ8ucyetocoK27bdaIDvVoo2BcHnRIkPWY4LmFN6UNIXyXLr2/enoUfJ7TC4L5bBd4t/i/DX1jqtViCz2tds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419978; c=relaxed/simple;
	bh=1d5cR6AaPbMNv+fKx08wOKZF/9KdChXE4hCEHhoBoz4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Lu4OIT6Q5HQQhSpm0DRIbs97ZoXTD/wZWB0kgHBeGlZBntuliw5dvcgpS+SW1vVDHqMx/H9FuhZ/m0keEX98JDOqTQXyhnls2hAWoxPUahg1qPbYOenF4C9lgI7kp6qEGnYPYs1JnB7xtzaRd4bfkUyjbUub5tTC4qE9S/kPjlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpZlFEo/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpZlFEo/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46C61F000C7
	for <kernel-tls-handshake@lists.linux.dev>; Mon, 19 Oct 2026 14:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792419976;
	bh=c/zTcKCkD8niOn119Pg+rzeh0Qz6ll/vtCh5tlehkUc=;
	h=From:To:Subject:Date;
	b=fpZlFEo/PQjr/Zc6b72ZolmWRTvzl27Exogqs+WwT+WJKo2H8uizDOOQ48ZTCv4m/
	 76vIDZLQWGw86fmTtDAf0qpCv6JejMfjTqTwDPQ0D7vShElTe0bX2GozJmvjA6ctIr
	 LqiVSsqc5GE+GbiCPjfe1Brr+ipUODjpYQ0HE1OZ8tjbyFwePP5E07S5z4DI5sZacr
	 8tv1Pe0/V+YjZi5iCMPbagC+Tg+ZoLdXHNWenfqh9XG4RgfKzBkJFtpdaDOBOa/hW0
	 mBk7pua9erCIGEGgIWpZ6frgp2zpkSDzPsILweC3UtIV7QZG/3v4dIcxKPeltHBaCm
	 Jz2kTFAjvytAA==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Subject: [PATCH] CONTRIBUTING: Stop accepting GitHub pull requests
Date: Mon, 19 Oct 2026 10:26:15 -0400
Message-ID: <20261019142615.15796-1-cel@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several key contributors do not have GitHub accounts, so a change
posted as a pull request is reviewed without them. Route every
contribution through the kernel-tls-handshake@lists.linux.dev
mailing list instead, where the whole community can take part in
review.

Remove the pull request instructions from CONTRIBUTING.md, and
drop the remaining references to pull requests from that file and
from both READMEs.

Signed-off-by: Chuck Lever <cel@kernel.org>
---
 CONTRIBUTING.md | 26 ++++----------------------
 README          |  2 +-
 README.md       |  2 +-
 3 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 442fa0a1ae36..b0ac5bb9366d 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -5,8 +5,8 @@ Whether it's a bug report, new feature, correction, or additional
 documentation, we greatly value feedback and contributions from
 the open source community.
 
-Please read through this document before submitting an issue or pull
-request to ensure we have all the necessary information to
+Please read through this document before submitting an issue or
+patch to ensure we have all the necessary information to
 effectively respond to your bug report or contribution.
 
 A ktls-utils developer mailing list is available. See
@@ -44,7 +44,7 @@ including the following text with your commit message.
 Signed-off-by: Your Name <you@example.org>
 ```
 
-This can be automatically added to pull requests by committing with `--sign-off`
+git adds this trailer for you when you commit with `--sign-off`
 or `-s`, e.g.
 
 ```text
@@ -53,31 +53,13 @@ git commit --signoff
 
 Review the [Developer Certificate of Origin][DCO].
 
-## Pull request process
+## Submitting patches
 
 To contribute code, please post patches (not attachments) to
 [lists.linux.dev](https://subspace.kernel.org/lists.linux.dev.html).
 Sending email enables the community, which includes some who do not
 have GitHub accounts, to participate in review.
 
-GitHub pull requests also work. To send us a pull request:
-
-1. Fork the [linux-nfs/ktls-utils](https://github.com/linux-nfs/ktls-utils)
-   repository.
-2. Modify the source. Focus on the specific change you are
-   contributing. If you also reformat all the code, it will
-   be hard for us to review on your change.
-3. Ensure local tests pass.
-4. Commit to your fork using concise commit messages.
-5. Send us a pull request, answering any default questions in the pull
-   request interface.
-6. Pay attention to any automated CI failures reported in the pull
-   request and stay involved in the conversation.
-
-GitHub provides additional document on
-[forking a repository](https://help.github.com/articles/fork-a-repo/) and
-[creating a pull request](https://help.github.com/articles/creating-a-pull-request/).
-
 ## Licensing
 
 See the [COPYING](COPYING) file for our project's licensing. We will
diff --git a/README b/README
index afd0506bdbb8..f4dae3d460cc 100644
--- a/README
+++ b/README
@@ -47,7 +47,7 @@ and see [INSTALL](INSTALL) for build instructions.
 ## Contributing
 
 This project welcomes contributions from the community.
-Before submitting a pull request,
+Before submitting a patch,
 please [review our contribution guide](./CONTRIBUTING.md).
 
 See the GitHub Issue Tracker at
diff --git a/README.md b/README.md
index 4e486a5daa47..ab3a8d31770f 100644
--- a/README.md
+++ b/README.md
@@ -54,7 +54,7 @@ and see [INSTALL](INSTALL) for build instructions.
 ## Contributing
 
 This project welcomes contributions from the community.
-Before submitting a pull request,
+Before submitting a patch,
 please [review our contribution guide](./CONTRIBUTING.md).
 
 See the [GitHub Issue Tracker](https://github.com/linux-nfs/ktls-utils/issues)
-- 
2.55.0


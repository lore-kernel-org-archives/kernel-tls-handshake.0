Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69648199FAB
	for <kernel-tls-handshake@lists.linux.dev>; Fri, 26 Sep 2025 01:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849738; cv=none; b=pgv2hP7eZvwd/KFvyUmtdgqUYTk8zO60npLrf5g6/NA2FeOG+ZBMyTnJOWomXbm75mInVjG9Fu7fA2/0MQXn4H7j1o+GwCo62t1UxTW88XX1xvVZOk+gJrnXOHVoxmjDmsFL5wkJ6tGzxndip0fWkHZg3XnsW+ZXwbwdXmXVAiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849738; c=relaxed/simple;
	bh=fQU3I8/606iEVhOLvth42n5KGxwCweNRKeQsjPp35sA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sM74nkvLZYh7O/KSP/MYEhvFhBVd30j1zuYpEqdpFvz+AKdLOVra5r8KeI4PsyLncRiZcD7SixxN/w36TNKSwBHvX3y2zerBAspc7J3+xqbBZMBwl7EpAenqYVngWP2e79oeeIxqHBqkUX9YRwzQ2yDibtT71D1NLZmMl9AG1W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlPOA61/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlPOA61/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2CFC113CF;
	Fri, 26 Sep 2025 01:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758849738;
	bh=fQU3I8/606iEVhOLvth42n5KGxwCweNRKeQsjPp35sA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dlPOA61/Hgcuxr1oONvyTIe0g7wI4QaOMW6+WW93QjBMQRFQGwK0bSnZhq3dhdidR
	 xXCERHWaextwRK7N8SgkwEnlOZ2BtkQcmnWCbW3lWHQHZHUYNiMJ/JzxFeD6ZzuXbY
	 xSP5/6bLe3ZjON6iFUp3IXMh9xY6aGSdrTz7RtUXyx+4WbvbX0E3ckWKUXz3Hs+X17
	 etpLOhPeYejDIYl1EvSX6+sNpeZv1Y25RrbJp/HZBnjXM5IROLfLBJOZ7jax4xoPT/
	 j4yDzvQgtsz69+cZDyaNcgYvv8WJolA+EbAqAwWlzro6noHZmOesaRjE2WmS3STdnv
	 1ObrBEnTEvB3w==
From: Chuck Lever <cel@kernel.org>
To: <kernel-tls-handshake@lists.linux.dev>
Cc: Xin Long <lucien.xin@gmail.com>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [PATCH v1 16/16] workflows: Generate gh-pages automatically
Date: Thu, 25 Sep 2025 21:22:05 -0400
Message-ID: <20250926012207.3642990-17-cel@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926012207.3642990-1-cel@kernel.org>
References: <20250926012207.3642990-1-cel@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-tls-handshake@lists.linux.dev
List-Id: <kernel-tls-handshake.lists.linux.dev>
List-Subscribe: <mailto:kernel-tls-handshake+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernel-tls-handshake+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chuck Lever <chuck.lever@oracle.com>

Add a GitHub Action that compiles the Doxygen comments and the man
pages in the tlshd source code and builds a .io web site. This is a
small step towards improving the published upstream documentation
for ktls-utils.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 .github/workflows/documentation.yml | 154 ++++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 .github/workflows/documentation.yml

diff --git a/.github/workflows/documentation.yml b/.github/workflows/documentation.yml
new file mode 100644
index 000000000000..cf3425530261
--- /dev/null
+++ b/.github/workflows/documentation.yml
@@ -0,0 +1,154 @@
+---
+name: Generate public documentation
+
+on:
+  release:
+    types: [published]
+  workflow_dispatch:
+
+jobs:
+  generate-docs:
+    runs-on: ubuntu-latest
+    permissions:
+      contents: read
+      pages: write
+      id-token: write
+    environment:
+      name: github-pages
+      url: ${{ steps.deployment.outputs.page_url }}
+
+    steps:
+      - uses: actions/checkout@v4
+
+      - name: Cache dependencies
+        uses: actions/cache@v4
+        with:
+          path: |
+            /var/cache/apt
+            ~/.cache
+          key: ${{ runner.os }}-docs-${{ hashFiles('.github/workflows/documentation.yml') }}
+          restore-keys: |
+            ${{ runner.os }}-docs-
+
+      - name: Install build dependencies
+        run: |
+          sudo apt-get update
+          sudo apt-get -y install \
+            build-essential \
+            autoconf \
+            automake \
+            gnutls-dev \
+            libkeyutils-dev \
+            libnl-3-dev \
+            libnl-genl-3-dev \
+            libglib2.0-dev
+
+      - name: Install documentation tools
+        run: |
+          sudo apt-get update
+          sudo apt-get install -y \
+            doxygen \
+            graphviz \
+            man2html
+
+      - name: Configure
+        run: |
+          ./autogen.sh
+          ./configure --with-systemd
+
+      - name: Generate HTML man pages
+        run: |
+          mkdir -p docs/man/html
+          if ! ls man/man* >/dev/null 2>&1; then
+            echo "No man page directories found, skipping HTML generation"
+            exit 0
+          fi
+          for section_dir in man/man*
+          do
+            if [ ! -d "$section_dir" ]; then
+              continue
+            fi
+            section_num=$(basename "$section_dir" | sed 's/man//')
+            echo "Processing section $section_num pages..."
+            find "$section_dir" -name "*.$section_num" -print0 | while IFS= read -r -d '' manpage; do
+              basename_file=$(basename "$manpage")
+              section=${basename_file##*.}
+              name=${basename_file%.*}
+              if ! man2html "$manpage" > "docs/man/html/${name}.${section}.html"; then
+                echo "Failed to convert $manpage"
+                exit 1
+              fi
+            done
+          done
+          ls -lR docs/man
+
+      - name: Generate Doxygen documentation
+        run: |
+          (cd docs && doxygen Doxyfile)
+
+      - name: Assemble final site
+        run: |
+          echo "::group::Assembling Documentation Site"
+
+          # Copy Doxygen HTML output
+          if [ -d docs/doxygen/html ]; then
+            cp -r docs/doxygen/html _site/
+            echo "✓ Doxygen HTML documentation copied"
+          else
+            echo "✗ No Doxygen HTML documentation found"
+            exit 1
+          fi
+
+          # Copy man page HTML and index
+          if [ -d docs/man/html ]; then
+            cp -r docs/man/html _site/
+            echo "✓ Manual page documentation copied"
+          else
+            echo "ℹ️  No manual pages to copy"
+            # Create empty man directory with placeholder
+            mkdir -p _site/man
+            cat > _site/man/index.html <<EOF
+          <!DOCTYPE html>
+          <html><head><title>Manual Pages</title></head>
+          <body>
+          <h1>Manual Pages</h1>
+          <p><a href="../index.html">← Back to Documentation Home</a></p>
+          <p><em>No manual pages available yet.</em></p>
+          </body></html>
+          EOF
+          fi
+
+          # Copy configuration examples
+          if [ -d docs/examples ]; then
+            cp -r docs/examples _site/
+            echo "✓ Configuration examples copied"
+          else
+            echo "ℹ️  No configuration examples to copy"
+          fi
+
+          # Add .nojekyll to disable Jekyll processing
+          touch _site/.nojekyll
+
+          # Create sitemap
+          find _site -name "*.html" | sed 's|_site/||' | while read file; do
+            echo "https://${{ github.repository_owner }}.github.io/${{ github.event.repository.name }}/$file"
+          done > _site/sitemap.txt
+
+          echo "Documentation site assembled successfully"
+          echo "Total files: $(find _site -type f | wc -l)"
+          echo "Site size: $(du -sh _site | cut -f1)"
+
+          echo "::endgroup::"
+
+      - name: Setup Pages
+        uses: actions/configure-pages@v4
+
+      - name: Upload Pages artifact
+        uses: actions/upload-pages-artifact@v3
+        with:
+          path: _site
+
+      - name: Deploy to GitHub Pages
+        if: github.ref == 'refs/heads/main'
+        id: deployment
+        uses: actions/deploy-pages@v4
-- 
2.51.0

